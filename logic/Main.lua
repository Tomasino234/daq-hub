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
    end)
end

return main