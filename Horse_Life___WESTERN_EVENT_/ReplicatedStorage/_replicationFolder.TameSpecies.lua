-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("MobAnimator")
local v3 = Sonar("ContextualUtils")
local v4 = Sonar("Lasso")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v5 = Sonar("PlayerWrapper").GetClient()
local Highlight = ReplicatedStorage.Storage.Assets.Tutorial.Highlight
function t.new(p1) --[[ new | Line: 23 | Upvalues: t (copy), v1 (copy), Highlight (copy), LocalPlayer (copy), RunService (copy), v3 (copy), v4 (copy) ]]
	warn("TameSpecies.new", p1)
	local v2 = setmetatable(p1, t)
	v2.Maid = v1.new()
	if v2.Species == nil then
		v2.Species = "Horse"
	end
	v2.Highlight = Highlight:Clone()
	v2.Highlight.Parent = LocalPlayer.PlayerGui.WorkspaceGui
	v2.Maid:GiveTask(v2.Highlight)
	v2.Maid:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 37 | Upvalues: v2 (copy), v3 (ref), LocalPlayer (ref) ]]
		v2.Closest = v2:GetClosest()
		if not v2.Closest then
			v2:SetTarget()
			return
		end
		v2.Beam = v2.Beam or v3.FromPlayer(LocalPlayer, workspace.Terrain, {
			CenterOfPart = true
		})
		v3.UpdatePosition(v2.Beam, workspace.Terrain, {
			CenterOfPart = true,
			WorldPosition = v2.Closest.PrimaryPart.Position
		})
		v2:SetTarget(v2.Closest)
	end))
	v2.Maid:GiveTask(v3.SetWorldspaceClickPointTo({
		ShowPrompt = true,
		Adornee = function() --[[ Adornee | Line: 55 | Upvalues: v2 (copy) ]]
			return v2.Closest and v2.Closest.CosmeticModel
		end,
		CheckVisibility = function() --[[ CheckVisibility | Line: 58 | Upvalues: v4 (ref), v2 (copy) ]]
			if v4.GetTarget() then
				return
			end
			return v2.Closest and v2:IsInLassoRange(v2.Closest)
		end
	}))
	v2.Maid:GiveTask(v3.ClearBeams)
	return v2
end
function t.SetTarget(p1, p2) --[[ SetTarget | Line: 71 ]]
	if p2 then
		p1.Highlight.Adornee = p1.Closest.CosmeticModel
	else
		p1.Highlight.Adornee = nil
	end
	if not p1.Beam then
		return
	end
	p1.Beam.Beam1.Enabled = p2 and true
end
function t.IsInLassoRange(p1, p2) --[[ IsInLassoRange | Line: 82 | Upvalues: v5 (copy) ]]
	if not v5.EquippedTool then
		return
	end
	if not p2.CosmeticModel then
		return
	end
	if not p2.CosmeticModel.PrimaryPart then
		return
	end
	return (v5.PrimaryPart.Position - p2.CosmeticModel.PrimaryPart.Position).Magnitude <= v5.EquippedTool.ToolClass.LassoHitRange
end
function t.GetClosest(p1) --[[ GetClosest | Line: 89 | Upvalues: v4 (copy), v2 (copy), v5 (copy) ]]
	local v1 = v4.GetTarget()
	if v1 then
		return v1
	end
	local v22 = 9000000000
	local v3 = nil
	for k, v in pairs(v2.GetAll()) do
		if v.Destroy and (not v.GivenRewards and (not v.Model:GetAttribute("TamingId") and (not v.IsBoss and (not p1.Species or v.MobType == p1.Species)))) then
			local Magnitude = (v5.PrimaryPart.Position - v.CosmeticModel.PrimaryPart.Position).Magnitude
			if Magnitude < v22 then
				v22 = Magnitude
				v3 = v
			end
		end
	end
	return v3
end
function t.Destroy(p1) --[[ Destroy | Line: 117 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
return t