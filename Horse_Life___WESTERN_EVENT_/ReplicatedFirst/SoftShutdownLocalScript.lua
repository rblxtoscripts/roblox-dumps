-- https://lua.expert/
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
TeleportService.LocalPlayerArrivedFromTeleport:Connect(function(p1, p2) --[[ Line: 9 | Upvalues: Players (copy), StarterGui (copy), TeleportService (copy) ]]
	if p2 and p2.IsTemporaryServer then
		p1.Parent = Players.LocalPlayer:WaitForChild("PlayerGui", 1e99)
		repeat

		until pcall(function() --[[ Line: 15 | Upvalues: StarterGui (ref) ]]
			StarterGui:SetCoreGuiEnabled("All", false)
		end)
		wait(5)
		TeleportService:Teleport(p2.PlaceId, Players.LocalPlayer, nil, p1)
	else
		if not p1 or p1.Name ~= "SoftShutdownGui" then
			return
		end
		p1:Destroy()
	end
end)
local RenderStepped = RunService.RenderStepped
local StartShutdown = game.ReplicatedStorage:WaitForChild("StartShutdown")
local TeleportScreenCreator = require(script:WaitForChild("TeleportScreenCreator"))
StartShutdown.OnClientEvent:Connect(function() --[[ Line: 35 | Upvalues: TeleportScreenCreator (copy), RenderStepped (copy) ]]
	local v1, v2 = TeleportScreenCreator()
	v2.BackgroundTransparency = 0.5
	v1.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	wait(1)
	local v3 = tick()
	while tick() - v3 < 0.5 do
		v2.BackgroundTransparency = 0.5 * (1 - (tick() - v3) / 0.5)
		RenderStepped:Wait()
	end
	v2.BackgroundTransparency = 0
end)