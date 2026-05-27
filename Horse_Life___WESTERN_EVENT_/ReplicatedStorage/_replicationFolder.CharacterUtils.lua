-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PlayerWrapper")
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("Constants")
local v4 = RunService:IsServer()
local v5 = v2.GetRemoteEvent("TeleportRemote")
function t.getPlayerHumanoid(p1) --[[ getPlayerHumanoid | Line: 25 ]]
	local Character = p1.Character
	if Character then
		return Character:FindFirstChildOfClass("Humanoid")
	else
		return nil
	end
end
function t.getAlivePlayerHumanoid(p1) --[[ getAlivePlayerHumanoid | Line: 34 | Upvalues: t (copy) ]]
	local v1 = t.getPlayerHumanoid(p1)
	if v1 and not (v1.Health <= 0) then
		return v1
	else
		return nil
	end
end
local function teleportCharacter(p1, p2) --[[ teleportCharacter | Line: 43 ]]
	p1:PivotTo(p2)
end
local function teleportClient(p1, p2) --[[ teleportClient | Line: 47 | Upvalues: v1 (copy), v3 (copy) ]]
	if v1.GetClient() then
		p1:RequestStreamAroundAsync(p2.p, 1)
		v3.Teleporting = true
		p1.Character:PivotTo(p2)
		task.delay(1, function() --[[ Line: 59 | Upvalues: v3 (ref) ]]
			v3.Teleporting = false
		end)
	end
end
function t.TeleportCharacter(p1, p2) --[[ TeleportCharacter | Line: 64 | Upvalues: v4 (copy), v5 (copy), teleportClient (copy) ]]
	local v1
	if typeof(p2) == "Vector3" then
		v1 = CFrame.new(p2)
	elseif typeof(p2) == "CFrame" then
		v1 = p2
	else
		local v42 = p2.Position + Vector3.new(0, p1.Character.PrimaryPart.Size.Y / 2 + p2.Size.Y / 2, 0)
		v1 = CFrame.new(v42) * CFrame.Angles(p2.CFrame:ToEulerAnglesXYZ())
	end
	if v4 then
		v5:FireClient(p1, v1)
		if p1.Character.PrimaryPart.Anchored then
			p1.Character:PivotTo(v1)
		end
	else
		teleportClient(p1, v1)
	end
end
function t.getAlivePlayerRootPart(p1) --[[ getAlivePlayerRootPart | Line: 87 | Upvalues: t (copy) ]]
	local v1 = t.getPlayerHumanoid(p1)
	if v1 and not (v1.Health <= 0) then
		return v1.RootPart
	else
		return nil
	end
end
function t.getPlayerRootPart(p1) --[[ getPlayerRootPart | Line: 96 | Upvalues: t (copy) ]]
	local v1 = t.getPlayerHumanoid(p1)
	if v1 then
		return v1.RootPart
	else
		return nil
	end
end
function t.unequipTools(p1) --[[ unequipTools | Line: 105 | Upvalues: t (copy) ]]
	local v1 = t.getPlayerHumanoid(p1)
	if not v1 then
		return
	end
	v1:UnequipTools()
end
function t.getPlayerFromCharacter(p1) --[[ getPlayerFromCharacter | Line: 116 | Upvalues: Players (copy) ]]
	local v1 = Players:GetPlayerFromCharacter(p1)
	local v2 = p1
	while not v1 do
		if not v2.Parent then
			return nil
		end
		v2 = v2.Parent
		v1 = Players:GetPlayerFromCharacter(v2)
	end
	return v1
end
return t