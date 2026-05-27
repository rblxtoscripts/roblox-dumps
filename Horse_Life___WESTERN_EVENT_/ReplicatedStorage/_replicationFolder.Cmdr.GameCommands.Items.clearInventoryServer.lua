-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("PlayerWrapper")
local t = {
	"Buildings",
	"Capsules",
	"Chests",
	"Children",
	"Equipment",
	"EquipmentPalettes",
	"Food",
	"ItemCapsules",
	"Miscellaneous",
	"Potions",
	"Resources",
	"Seeds",
	"StackableChests",
	"Tools"
}
return function(p1, p2) --[[ Line: 26 | Upvalues: v1 (copy), t (copy) ]]
	local v12 = v1.getWrapperFromPlayer(p2)
	if not (v12 and v12.PlayerData) then
		return false, "Player data not loaded"
	end
	local PlayerData = v12.PlayerData
	local sum = 0
	for i, v in ipairs(t) do
		local v2 = PlayerData:FindFirstChild(v)
		if v2 then
			if v == "Resources" then
				for v3, v4 in v2:GetChildren() do
					if v4:IsA("IntValue") then
						v4.Value = 0
						sum = sum + 1
					end
				end
				continue
			end
			local v5 = #v2:GetChildren()
			v2:ClearAllChildren()
			sum = sum + v5
		end
	end
	return true, ("Cleared inventory for %s (%d items)"):format(p2.Name, sum)
end