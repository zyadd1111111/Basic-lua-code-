print("Made by Subsonyt")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

local function getNearestHead()
    local nearestHead = nil
    local nearestDistance = math.huge
    local hrpPos = hrp.Position

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local head = player.Character.Head
            local dist = (head.Position - hrpPos).Magnitude
            if dist < nearestDistance then
                nearestDistance = dist
                nearestHead = head
            end
        end
    end

    return nearestHead
end

RunService.RenderStepped:Connect(function()
    local nearestHead = getNearestHead()
    if nearestHead and hrp then
        hrp.CFrame = CFrame.new(hrp.Position, Vector3.new(nearestHead.Position.X, hrp.Position.Y, nearestHead.Position.Z))
    end
end)
