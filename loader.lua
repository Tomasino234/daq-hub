local loading_starter = loadstring(game:HttpGet("https://raw.githubusercontent.com/Tomasino234/daq-hub/refs/heads/main/mainStart/loading.lua"))()
local bypass_starter = loadstring(game:HttpGet("https://raw.githubusercontent.com/Tomasino234/daq-hub/refs/heads/main/mainStart/bypass.lua"))()
loading_starter.init()
bypass_starter.init()

task.wait(5)

--- LOGIC MODS ---

local logic_movement = loadstring(game:HttpGet("https://raw.githubusercontent.com/Tomasino234/daq-hub/refs/heads/main/logic/bypass.lua"))()

------------------

local repo = 'https://raw.githubusercontent.com/Tomasino234/daq-hub/refs/heads/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
    -- Set Center to true if you want the menu to appear in the center
    -- Set AutoShow to true if you want the menu to appear when it is created
    -- Position and Size are also valid options here
    -- but you do not need to define them unless you are changing them :)

    Title = 'Daq Hub',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local tabs = {
    ["UI Settings "] = Window:AddTab("UI Settings")
}