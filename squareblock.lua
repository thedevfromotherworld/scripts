local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ChatService = game:GetService("Chat")
local partSpawned = false

local function spawnPart()
    if partSpawned then return end
    partSpawned = true
    
    local spawnLocation = game.Workspace:FindFirstChild("SpawnLocation")
    if spawnLocation then
        local part = Instance.new("Part")
        part.Size = Vector3.new(5, 5, 5)
        part.Position = spawnLocation.Position + Vector3.new(0, 3, 0)
        part.Anchored = true
        part.Parent = game.Workspace
    end
end

Players.PlayerAdded:Connect(function(player)
    task.delay(130, spawnPart)
    
    player.Chatted:Connect(function(message)
        if message:lower() == ".load" then
            spawnPart()
        end
    end)
end)
