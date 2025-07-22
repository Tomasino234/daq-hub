local self = {}
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

function self.init()
    task.spawn(function()
    local Camera = workspace.CurrentCamera
    local screenpart = Instance.new("Part", Camera)
    screenpart.CFrame = Camera.CFrame * CFrame.new(0,0,-1.2) * CFrame.Angles(0,math.rad(180),0)
    screenpart.Size = Vector3.new(2,1,1)
    screenpart.Transparency = 1
    screenpart.Anchored = true
    screenpart.CanCollide = false

    local surfaceGui = Instance.new("SurfaceGui", screenpart)
    surfaceGui.LightInfluence = 0
    surfaceGui.Brightness = 1000
    surfaceGui.SizingMode = Enum.SurfaceGuiSizingMode.FixedSize
    surfaceGui.CanvasSize = Vector2.new(1920, 1080)

    local logo = Instance.new("ImageLabel", surfaceGui)
    logo.BackgroundTransparency = 1
    logo.AnchorPoint = Vector2.new(0.5,0.5)
    logo.Position = UDim2.fromScale(0.5,0.5)
    logo.Size = UDim2.fromOffset(250,250)
    logo.Image = "rbxassetid://134409651143898"

    local glow = Instance.new("ImageLabel", surfaceGui)
    glow.BackgroundTransparency = 1
    glow.AnchorPoint = Vector2.new(0.5,0.5)
    glow.Position = UDim2.fromScale(0.5,0.6)
    glow.Size = UDim2.fromOffset(800,600)
    glow.Image = "rbxassetid://6673021984"
    glow.ZIndex = 0
    glow.ImageColor3 = Color3.fromRGB(255, 0, 242)
    glow.ImageTransparency = 0.77

    local text = Instance.new("TextLabel", surfaceGui)
    text.AnchorPoint = Vector2.new(0.5,0.5)
    text.Position = UDim2.fromScale(0.5,0.6)
    text.TextSize = 18
    text.Text = "LOADING BYPASS"
    text.TextScaled = true
    text.Size = UDim2.fromOffset(200,50)
    text.BackgroundTransparency = 1
    text.TextColor3 = Color3.new(1,1,1)
    text.FontFace = Font.fromName("SourceSansPro")

    local lastchange = 0
    local i = 1
    local con = RunService.RenderStepped:Connect(function()
        screenpart.CFrame = Camera.CFrame * CFrame.new(0,0,-1.2) * CFrame.Angles(0,math.rad(180),0)

        if tick() - lastchange > 0.8 then
            if i == 1 then
                i = 2

                text.Text = "LOADING BYPASS."
            elseif i == 2 then
                i = 3

                text.Text = "LOADING BYPASS.."
            elseif i == 3 then
                i = 4
                
                text.Text = "LOADING BYPASS..."
            elseif i == 4 then
                i = 1

                text.Text = "LOADING BYPASS"
            end

            lastchange = tick()
        end
    end)

    task.wait(5)

    i = 0
    text.Text = "LOADED"

    task.wait(1)

    for _, v : Frame in surfaceGui:GetChildren() do
        if v:IsA("TextLabel") then
            TweenService:Create(v, TweenInfo.new(1), {TextTransparency = 1}):Play()
        else
            TweenService:Create(v, TweenInfo.new(1), {ImageTransparency = 1}):Play()
        end
    end

    task.wait(1)

    con:Disconnect()
    screenpart:Destroy()
 end)
end

return self