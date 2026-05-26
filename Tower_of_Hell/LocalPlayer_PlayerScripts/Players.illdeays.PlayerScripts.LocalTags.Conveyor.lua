-- https://lua.expert/
local t = {}
local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")
local timefreeze = game.Players.LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("timefreeze")
local t2 = {}
local DistributedGameTime = workspace.DistributedGameTime
local v1 = 0
RunService.RenderStepped:Connect(function() --[[ Line: 29 | Upvalues: t2 (copy), v1 (ref), timefreeze (copy), DistributedGameTime (ref) ]]
	for k, v in pairs(t2) do
		pcall(function() --[[ Line: 31 | Upvalues: v (copy), v1 (ref) ]]
			local ConveyorTexture = v:FindFirstChild("ConveyorTexture")
			if ConveyorTexture then
				ConveyorTexture.OffsetStudsV = -(v1 * v:GetAttribute("ConveyorSpeed")) % ConveyorTexture.StudsPerTileV
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
timefreeze:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 49 | Upvalues: CollectionService (copy), timefreeze (copy) ]]
	for v1, v2 in CollectionService:GetTagged(script.Name) do
		if timefreeze.Value then
			v2.Velocity = Vector3.new(0, 0, 0)
			continue
		end
		v2.Velocity = v2:GetAttribute("ConveyorSpeed") * v2.CFrame.LookVector
	end
end)
function t.AddTagged(p1, p2) --[[ AddTagged | Line: 61 | Upvalues: t2 (copy) ]]
	if not p2:IsA("BasePart") then
		return
	end
	if p2:WaitForChild("ConveyorTexture", 1) then
		table.insert(t2, p2)
	end
end
function t.RemoveTagged(p1, p2) --[[ RemoveTagged | Line: 72 | Upvalues: t2 (copy) ]]
	local v1 = table.find(t2, p2)
	if v1 then
		table.remove(t2, v1)
	end
end
return t