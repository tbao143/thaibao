getgenv().ESPEnabled = false -- Toggle ESP On/Off
getgenv().ShowBox = false -- Show bounding boxes
getgenv().ShowHealth = false -- Show health
getgenv().ShowName = false -- Show player names
getgenv().ShowDistance = false -- Show distance to players
getgenv().ShowTracer = false -- Show tracers
getgenv().TeamCheck = false -- Exclude teammates
getgenv().TracerStart = "Bottom" -- "Bottom" or "Middle" for tracers

-- Roblox Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- Helper function to create ESP components
local function createESP(player)
    local box = Drawing.new("Square")
    box.Visible = false
    box.Color = Color3.new(1, 1, 1)
    box.Thickness = 1
    box.Filled = false

    local healthText = Drawing.new("Text")
    healthText.Visible = false
    healthText.Color = Color3.new(0, 1, 0)
    healthText.Size = 16

    local nameText = Drawing.new("Text")
    nameText.Visible = false
    nameText.Color = Color3.new(1, 1, 1)
    nameText.Size = 16

    local distanceText = Drawing.new("Text")
    distanceText.Visible = false
    distanceText.Color = Color3.new(1, 1, 0)
    distanceText.Size = 16

    local tracer = Drawing.new("Line")
    tracer.Visible = false
    tracer.Color = Color3.new(1, 0, 0)
    tracer.Thickness = 1

    -- Update ESP dynamically
    RunService.RenderStepped:Connect(function()
        if not getgenv().ESPEnabled or not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") or not player.Character:FindFirstChild("Humanoid") or player == LocalPlayer then
            box.Visible = false
            healthText.Visible = false
            nameText.Visible = false
            distanceText.Visible = false
            tracer.Visible = false
            return
        end

        if getgenv().TeamCheck and player.Team == LocalPlayer.Team then
            box.Visible = false
            healthText.Visible = false
            nameText.Visible = false
            distanceText.Visible = false
            tracer.Visible = false
            return
        end

        local character = player.Character
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        local humanoid = character:FindFirstChild("Humanoid")

        if rootPart and humanoid and humanoid.Health > 0 then
            local rootPos, onScreen = Camera:WorldToViewportPoint(rootPart.Position)
            local headPos, _ = Camera:WorldToViewportPoint(rootPart.Position + Vector3.new(0, 3, 0))
            local legPos, _ = Camera:WorldToViewportPoint(rootPart.Position - Vector3.new(0, 3, 0))

            -- Box
            if getgenv().ShowBox and onScreen then
                box.Size = Vector2.new(1000 / rootPos.Z, headPos.Y - legPos.Y)
                box.Position = Vector2.new(rootPos.X - box.Size.X / 2, rootPos.Y - box.Size.Y / 2)
                box.Visible = true
            else
                box.Visible = false
            end

            -- Health
            if getgenv().ShowHealth and onScreen then
                healthText.Position = Vector2.new(rootPos.X, rootPos.Y - box.Size.Y / 2 - 20)
                healthText.Text = "Health: " .. math.floor(humanoid.Health)
                healthText.Visible = true
            else
                healthText.Visible = false
            end

            -- Name
            if getgenv().ShowName and onScreen then
                nameText.Position = Vector2.new(rootPos.X, rootPos.Y - box.Size.Y / 2 - 40)
                nameText.Text = "Name: " .. player.Name
                nameText.Visible = true
            else
                nameText.Visible = false
            end

            -- Distance
            if getgenv().ShowDistance and onScreen then
                local distance = (LocalPlayer.Character.HumanoidRootPart.Position - rootPart.Position).Magnitude
                distanceText.Position = Vector2.new(rootPos.X, rootPos.Y + box.Size.Y / 2 + 20)
                distanceText.Text = "Distance: " .. math.floor(distance) .. " studs"
                distanceText.Visible = true
            else
                distanceText.Visible = false
            end

            -- Tracer
            if getgenv().ShowTracer then
                tracer.From = getgenv().TracerStart == "Bottom" and Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y) or Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                tracer.To = Vector2.new(rootPos.X, rootPos.Y)
                tracer.Visible = onScreen
            else
                tracer.Visible = false
            end
        else
            box.Visible = false
            healthText.Visible = false
            nameText.Visible = false
            distanceText.Visible = false
            tracer.Visible = false
        end
    end)
end

-- Apply ESP to all players
for _, player in pairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        createESP(player)
    end
end

Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        createESP(player)
    end
end)


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/Librarykavoui"))()



local Window = Library.CreateLib("Tbao Hub", "BloodTheme")

local Tab = Window:NewTab("Info")

local Section = Tab:NewSection("Esp")

Section:NewToggle("Enabled", "", function(Value)
    getgenv().ESPEnabled = Value 
end)



Section:NewToggle("Box", "", function(Value)
    getgenv().ShowBox = Value 
end)




Section:NewToggle("Health", "", function(Value)
    getgenv().ShowHealth = Value 
end)




Section:NewToggle("Name", "", function(Value)
    getgenv().ShowName = Value
end)





Section:NewToggle("Distance", "", function(Value)
    getgenv().ShowDistance = Value 
end)




Section:NewToggle("Tracer", "", function(Value)
  getgenv().ShowTracer = Value 
end)




Section:NewToggle("Team check", "", function(Value)
    getgenv().TeamCheck = Value 
end)


Section:NewDropdown("Tracer", "", {"Middle", "Bottom"}, function(Value)
getgenv().TracerStart = Value 
end)
