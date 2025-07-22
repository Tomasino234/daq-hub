local loading_mod = loadstring(game:HttpGet("https://raw.githubusercontent.com/Tomasino234/daq-hub/refs/heads/main/main/loading.lua?token=GHSAT0AAAAAADHTSVTTDYCOF2D7L4GTFQRG2D735CQ"))()
local bypass_mod = loadstring(game:HttpGet("https://raw.githubusercontent.com/Tomasino234/daq-hub/refs/heads/main/main/bypass.lua?token=GHSAT0AAAAAADHTSVTSZGCQT42HUGIBF6QK2D734IA"))()

task.spawn(function()
    loading_mod.init()
end)
bypass_mod.init()