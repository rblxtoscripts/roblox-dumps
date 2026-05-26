-- https://lua.expert/
local t = {}
require(game.ReplicatedStorage:WaitForChild("Enums"))
function t.GetBoxesInTruck(p1, p2) --[[ GetBoxesInTruck | Line: 7 ]]
	local t = {}
	local Bottom = p2:FindFirstChild("Bottom")
	if not Bottom then
		return
	end
	for i, v in ipairs(workspace.AllSupplyBoxes:GetChildren()) do
		local v1 = Bottom.CFrame:pointToObjectSpace(v.Position)
		if v and (v.Parent and not v.Anchored) and (math.abs(v1.X) <= Bottom.Size.X / 2 + 4 and math.abs(v1.Z) <= Bottom.Size.Z / 2 + 4) then
			table.insert(t, v)
		end
	end
	return t
end
return t