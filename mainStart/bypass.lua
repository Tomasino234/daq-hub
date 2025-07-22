local self = {}

function self.init()
    task.spawn(function()
	task.wait(5) -- wait for Adonis to load

	local suspiciousStrings = {
		"Detected",
	}

	local function stringInConstants(func, targets)
		local constants = debug.getconstants(func)
		for _, const in ipairs(constants) do
			if typeof(const) == "string" then
				for _, target in ipairs(targets) do
					if const:lower():find(target:lower()) then
						return true, const
					end
				end
			end
		end
		return false
	end

	local count = 0
	for _, f in ipairs(getgc(true)) do
		if typeof(f) == "function" and islclosure(f) then
			local matched, foundConst = stringInConstants(f, suspiciousStrings)
			if matched then
				count += 1
				warn(string.format("[Bypass Scanner] Suspicious function #%d matched: \"%s\"", count, foundConst or "?"))

                if foundConst == "Detected" then
                    print("hooking onto detected")

                    detectedFunc = f -- assign the current function to detectedFunc
                    print("Found potential Detected function:", tostring(f), debug.getinfo(f).short_src, debug.getinfo(f).linedefined)

                	hookfunction(detectedFunc, function(action, info, nocrash)
                   		warn(('detected func ran with the arguments | action : %s | info : %s | nocrash : %s '):format(action, info, tostring(nocrash)))

						return true
               		end)
                end
			end
		end
	end
end)
end

return self