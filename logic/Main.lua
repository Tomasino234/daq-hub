local main = {}
local settings = {
    InfiniteStamina = false;
}

function main.init(window, tableTabs)
    task.spawn(function()
        local tab = window:AddTab("Main")
        tableTabs.Main = tab
        
        --==[ MAIN MOVEMENT BOX ]==--
        local LeftBox = tab:AddLeftGroupbox("MainMovement")
        LeftBox:AddToggle('Main_InfiniteStamina', {
            Text = "Infinite Stamina",
            Default = false,
            Tooltip = "Sets if you have infinite stamina or not.",

            Callback = function(value)
                settings.InfiniteStamina = value
            end
        })

        --=========================--
        --==[ EXPLOIT FUNCTIONS ]==--

        local function InfiniteStamina()
            local oldStamina
            oldStamina = hookfunction(getupvalue(getrenv()._G.S_Take, 2), function(v1, ...)
                if settings.InfiniteStamina then
                    v1 = 0
                end
                return oldStamina(v1, ...)
            end)
        end
        
        InfiniteStamina()

        --=========================--
    end)
end

return main