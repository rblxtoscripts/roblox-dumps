-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("PlayerWrapper")
local t = {
	equip = "EquipTiersPurchased",
	inventory = "InventoryTiersPurchased",
	horse = "StorageTiersPurchased"
}
return function(p1, p2, p3, p4) --[[ Line: 12 | Upvalues: t (copy), v1 (copy) ]]
	local v12 = string.lower(p3)
	local v2 = t[v12]
	if v2 then
		v1.getWrapperFromPlayer(p2).PlayerData[v2].Value = p4
		return ("Set %* tiers to %* for %*"):format(v12, p4, p2.Name)
	else
		return ("Invalid slot type \"%*\". Use: equip, inventory, or horse"):format(v12)
	end
end