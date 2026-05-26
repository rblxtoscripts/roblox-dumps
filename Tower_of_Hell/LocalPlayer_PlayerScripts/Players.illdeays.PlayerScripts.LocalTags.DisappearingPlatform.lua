-- https://lua.expert/
local t = {}
local RunService = game:GetService("RunService")
local timefreeze = game.Players.LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("timefreeze")
local t2 = {}
local DistributedGameTime = workspace.DistributedGameTime
local v1 = 0
RunService.RenderStepped:Connect(function() --[[ Line: 27 | Upvalues: t2 (copy), v1 (ref), timefreeze (copy), DistributedGameTime (ref) ]]
	for k, v in pairs(t2) do
		pcall(function() --[[ Line: 29 | Upvalues: v (copy), v1 (ref) ]]
			local v12 = v:GetAttribute("Offset")
			local v2 = v:GetAttribute("OnTime")
			local v3 = v:GetAttribute("OnHold")
			local v4 = v:GetAttribute("OffTime")
			local v5 = (v1 + v12) % (v2 + v3 + v4 + v:GetAttribute("OffHold"))
			if v5 < v2 then
				v.CanCollide = true
				v.Transparency = 1 - (v5 / v2) ^ 2
				return
			end
			local v6 = v5 - v2
			if v6 < v3 then
				v.CanCollide = true
				v.Transparency = 0
				return
			end
			local v7 = v6 - v3
			if v7 < v4 then
				v.CanCollide = true
				v.Transparency = (v7 / v4) ^ 2
			else
				v.CanCollide = false
				v.Transparency = 1
			end
		end)
	end
	if timefreeze.Value then
		DistributedGameTime = workspace.DistributedGameTime
		return
	end
	v1 = v1 + (workspace.DistributedGameTime - DistributedGameTime)
	DistributedGameTime = workspace.DistributedGameTime
end)
function t.AddTagged(p1, p2) --[[ AddTagged | Line: 70 | Upvalues: t2 (copy) ]]
	if p2:IsA("BasePart") then
		table.insert(t2, p2)
	end
end
function t.RemoveTagged(p1, p2) --[[ RemoveTagged | Line: 75 | Upvalues: t2 (copy) ]]
	local v1 = table.find(t2, p2)
	if v1 then
		table.remove(t2, v1)
	end
end
return t