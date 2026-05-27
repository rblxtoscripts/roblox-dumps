-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("Resource")
local v3 = Sonar("ContextualUtils")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v4 = Sonar("PlayerWrapper").GetClient()
local Highlight = ReplicatedStorage.Storage.Assets.Tutorial.Highlight
function t.new(p1) --[[ new | Line: 21 | Upvalues: t (copy), v1 (copy), Highlight (copy), LocalPlayer (copy), v3 (copy), RunService (copy) ]]
	local v2 = setmetatable(p1, t)
	v2.Maid = v1.new()
	v2.Highlight = Highlight:Clone()
	v2.Highlight.Parent = LocalPlayer.PlayerGui.WorkspaceGui
	v2.Maid:GiveTask(v2.Highlight)
	v2.Maid:GiveTask(v3.ClearBeams)
	v2.Maid:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 30 | Upvalues: v2 (copy), v3 (ref), LocalPlayer (ref) ]]
		v2.Closest = v2:GetClosest()
		if not (v2.Closest and v2.Closest.PrimaryPart.Parent) then
			v2:SetTarget()
			return
		end
		v2.Beam = v2.Beam or v3.FromPlayer(LocalPlayer, v2.Closest.PrimaryPart, {
			CenterOfPart = true
		})
		v3.UpdatePosition(v2.Beam, v2.Closest.PrimaryPart, {
			CenterOfPart = true
		})
		v2:SetTarget(v2.Closest)
	end))
	return v2
end
function t.SetTarget(p1, p2) --[[ SetTarget | Line: 49 ]]
	if p2 then
		p1.Highlight.Adornee = p2.Root
	else
		p1.Highlight.Adornee = nil
	end
	if not p1.Beam then
		return
	end
	p1.Beam.Beam1.Enabled = p2 and true
end
function t.GetClosest(p1) --[[ GetClosest | Line: 60 | Upvalues: v2 (copy), v4 (copy) ]]
	local v1 = 9000000000
	local v22 = nil
	for k, v in pairs(v2.GetAll()) do
		if k.Destroy and (not p1.Target or k.Type == p1.Target) then
			local Magnitude = (v4.PrimaryPart.Position - k.Root:GetPivot().Position).Magnitude
			if Magnitude < v1 then
				v1 = Magnitude
				v22 = k
			end
		end
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 80 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
return t