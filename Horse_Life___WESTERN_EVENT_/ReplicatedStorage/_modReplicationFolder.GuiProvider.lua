-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local CollectionService = game:GetService("CollectionService")
local ModDashboardLoader = require(ReplicatedStorage.ModDashboardLoader)
local v1 = ModDashboardLoader("Config")
local v2 = ModDashboardLoader("InstanceUtils")
local v3 = ModDashboardLoader("MainGui", "Client")
local v4 = RunService:IsServer()
local v5 = RunService:IsClient()
local v6 = v5 and Players.LocalPlayer:WaitForChild("PlayerGui")
function t.CreateTab() --[[ CreateTab | Line: 24 | Upvalues: v2 (copy), v6 (copy) ]]
	local v1 = v2.GetTagged(v6, "MainModerationGui")
	if v1 then
		local v22 = v2.GetTagged(v1, "Default"):Clone()
		v22:AddTag("ModDashboardGui")
		v22.Visible = true
		v22.Parent = v1
	end
end
function t.InitServer(p1) --[[ InitServer | Line: 39 | Upvalues: CollectionService (copy), v2 (copy), v1 (copy), Players (copy) ]]
	local v12 = CollectionService:GetTagged("MainModerationGui")[1]
	v2.GetTagged(v12, "Default").Visible = false
	local function playerAdded(p1) --[[ playerAdded | Line: 44 | Upvalues: v1 (ref), v12 (copy) ]]
		if v1.CanUse(p1) then
			v12:Clone().Parent = p1:WaitForChild("PlayerGui")
		end
	end
	Players.PlayerAdded:Connect(playerAdded)
	for v22, v3 in Players:GetPlayers() do
		task.spawn(playerAdded, v3)
	end
end
function t.InitClient(p1) --[[ InitClient | Line: 61 | Upvalues: UserInputService (copy), v1 (copy), v3 (copy), t (copy) ]]
	UserInputService.InputBegan:Connect(function(p1, p2) --[[ Line: 62 | Upvalues: v1 (ref), v3 (ref), t (ref) ]]
		if p2 then
			return
		end
		if p1.KeyCode ~= v1.KeyCode then
			return
		end
		local v12 = v3.ActiveFrames()
		if v3.ActiveFrameCount() <= 0 then
			t.CreateTab()
			return
		end
		for v2 in v12 do
			v2.Visible = not v2.Visible
		end
	end)
end
function t.Init(p1) --[[ Init | Line: 83 | Upvalues: v4 (copy) ]]
	if v4 then
		p1:InitServer()
	else
		p1:InitClient()
	end
end
t:Init()
return t