-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("StorageUtils")
local v2 = Sonar("EventUtils")
local v3 = Sonar("InGameTeleportService")
local v4 = Sonar("ResetCallbackService")
local v5 = v1.GetConfig("GameBoundary")()
local FallenPartsDestroyHeight = workspace.FallenPartsDestroyHeight
local v6 = FallenPartsDestroyHeight + math.abs(workspace.FallenPartsDestroyHeight) * 0.5
local v7 = Sonar("PlayerWrapper").GetClient()
local function isBelowYAxis(p1, p2) --[[ isBelowYAxis | Line: 52 | Upvalues: v6 (copy) ]]
	return p1.Y < v6
end
local function isOutOfBounds() --[[ isOutOfBounds | Line: 59 | Upvalues: CollectionService (copy), v5 (copy), v7 (copy) ]]
	local v1 = CollectionService:GetTagged(v5.BoundaryTag)
	if #v1 == 0 then
		return false
	end
	local v2 = false
	for v3, v4 in v1 do
		local v52 = if v4:IsA("SphereHandleAdornment") then v4.Radius else v4:GetAttribute("Radius")
		if v52 then
			local v6 = if v4:IsA("SphereHandleAdornment") then v4.Adornee.Position else v4.Position
			if v6 and v7:IsWithinRangeOfPosition(v4.Position, v52) then
				v2 = true
				break
			end
		end
	end
	return not v2
end
local function outOfBounds() --[[ outOfBounds | Line: 85 | Upvalues: v5 (copy), v3 (copy), v4 (copy) ]]
	if v5.TeleportWhenOutOfBounds then
		return v3:Teleport(v5.TeleportWhenOutOfBounds)
	else
		return v4:Reset()
	end
end
function t.Init(p1) --[[ Init | Line: 93 | Upvalues: v2 (copy), v7 (copy), isOutOfBounds (copy), outOfBounds (copy), v5 (copy), v6 (copy) ]]
	v2.spawnLoop(function() --[[ Line: 94 | Upvalues: v7 (ref), isOutOfBounds (ref), outOfBounds (ref), v5 (ref), v6 (ref) ]]
		local PrimaryPart = v7.PrimaryPart
		if not PrimaryPart then
			return
		end
		if isOutOfBounds() then
			return outOfBounds()
		end
		if v5.MinYAxisHeight and PrimaryPart.Position.Y < v5.MinYAxisHeight then
			return outOfBounds()
		end
		if PrimaryPart.Position.Y < v6 then
			return outOfBounds()
		else
			return true
		end
	end, 0.5)
end
t:Init()
return t