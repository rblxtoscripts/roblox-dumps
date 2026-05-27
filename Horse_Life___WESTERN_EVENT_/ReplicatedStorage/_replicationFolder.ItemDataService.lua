-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("MarketplaceUtils")
local v2 = Sonar("StorageUtils")
local v3 = RunService:IsStudio() and false
local v4 = Sonar("Constants")
local AssetString = v4.AssetString
local ItemTypeDescriptions = v4.ItemTypeDescriptions
local ItemImages = v4.ItemImages
local MobData = v4.MobData
local ModifierStats = v4.ModifierStats
local v5 = Sonar(v2.Get("InventorySlots"))
local v6 = Sonar(v2.Get("ItemRarity"))
local v7 = Sonar(v2.Get("ModifierData"))
local t2 = {}
local t3 = {}
local t4 = {}
local t5 = {}
v4.ChestRewards = v4.ChestRewards or {}
v4.EquipmentBySpecies = v4.EquipmentBySpecies or {}
v4.RandomDrops = v4.RandomDrops or {}
v4.RandomEquipmentDropThemes = v4.RandomEquipmentDropThemes or {}
local ChestRewards = v4.ChestRewards
local EquipmentBySpecies = v4.EquipmentBySpecies
local RandomDrops = v4.RandomDrops
local RandomEquipmentDropThemes = v4.RandomEquipmentDropThemes
local t6 = { "Chests", "StackableChests" }
local t7 = {
	"Tools",
	"Food",
	"Miscellaneous",
	"Buildings",
	"Resources",
	"Potions",
	"Equipment",
	"Flairs",
	"EquipmentPalettes",
	"Chests",
	"StackableChests",
	"Seeds",
	"Capsules",
	"ItemCapsules"
}
local Items = ReplicatedStorage.Storage.Items
local EquipmentThemes = Items.EquipmentThemes
local ItemSets = Items.ItemSets
local v12 = Sonar(Items.Currency)
local v13 = Sonar(Items.RandomPresets)
local v14 = ServerStorage:FindFirstChild("ObjectModels") or Instance.new("Folder")
local ReplicatedObjectModels = ReplicatedStorage.Storage.Assets.ReplicatedObjectModels
function t._addInventorySlotProducts(p1) --[[ _addInventorySlotProducts | Line: 81 | Upvalues: v5 (copy), v1 (copy) ]]
	for v12, v2 in { v5 } do
		for v3, v4 in v2 do
			v1.AddDeveloperProducts(v4)
		end
	end
end
function t._setupAllItemSets(p1) --[[ _setupAllItemSets | Line: 90 | Upvalues: t (copy), t2 (copy) ]]
	p1:_setupAllThemedItemSets()
	t.AddItemSet("ItemSets", t2)
end
function t._setupAllThemedItemSets(p1) --[[ _setupAllThemedItemSets | Line: 97 | Upvalues: ItemSets (copy), Sonar (copy), t2 (copy), t (copy) ]]
	for v1, v2 in ItemSets:GetChildren() do
		local v3 = Sonar(v2)
		t2[v2.Name] = v3
		for v4 in v3.Items do
			if not t.GetByName(v4) then
				warn("No item data can be found for", v4)
				v3.Items[v4] = nil
			end
		end
	end
end
function t._setupChests(p1) --[[ _setupChests | Line: 119 ]]
	p1:_setupChestRewards()
	p1:_setupChestItemDropTables()
end
function t._setupChestItemDropTables(p1) --[[ _setupChestItemDropTables | Line: 125 | Upvalues: t6 (copy), t (copy), ChestRewards (ref) ]]
	for v1, v2 in t6 do
		for v3, v4 in t.GetType(v2) do
			local v5 = ChestRewards[v4.DropTable]
			if v4.DropTable and type(v5) ~= "string" then
				v4.DropTable = v5
				continue
			end
			warn("No drop table can be found for chest", v3)
		end
	end
end
function t._setupChestRewards(p1) --[[ _setupChestRewards | Line: 145 | Upvalues: ChestRewards (ref), t (copy) ]]
	for v1, v2 in ChestRewards do
		for v3, v4 in v2.Drops do
			if not t.GetByName(v4.Name) then
				warn("No item data can be found for", v4.Name)
				v2.Drops[v3] = nil
			end
		end
	end
end
function t._setupDefaultLassoTargetSpecies(p1) --[[ _setupDefaultLassoTargetSpecies | Line: 164 | Upvalues: t (copy) ]]
	for v1, v2 in t.GetType("Tools") do
		if v2.ToolType == "Lasso" and not v2.TargetSpecies then
			v2.TargetSpecies = "Horse"
		end
	end
end
function t._setupEquipmentBySpecies(p1) --[[ _setupEquipmentBySpecies | Line: 179 | Upvalues: EquipmentBySpecies (ref), t (copy), v3 (copy) ]]
	task.spawn(function() --[[ Line: 180 | Upvalues: EquipmentBySpecies (ref), t (ref), v3 (ref) ]]
		local v2, v32 = nil, os.clock()
		while not next(EquipmentBySpecies) do
			for v4, v5 in t.GetType("Equipment") do
				local Species = v5.Species
				local v6 = true
				if (if v6 then not v5.ExcludeFromDrops else v6) and (if v5.P > 0 then true else false) and (if Species == nil then false else true) then
					EquipmentBySpecies[Species] = EquipmentBySpecies[Species] or {}
					EquipmentBySpecies[Species][v4] = v5
				end
			end
			if next(EquipmentBySpecies) then
				v2 = os.clock()
				break
			end
			task.wait()
		end
		local v12 = (if v2 then v2 else os.clock()) - v32
		if not v3 then
			return
		end
		print("Equipment by species setup took", string.format("%.3f", v12), "seconds")
		print("\t", EquipmentBySpecies)
	end)
end
function t._setupEquipmentThemes(p1) --[[ _setupEquipmentThemes | Line: 224 | Upvalues: EquipmentThemes (copy), Sonar (copy), t (copy) ]]
	local t2 = {}
	for v1, v2 in EquipmentThemes:GetChildren() do
		t2[v2.Name] = Sonar(v2)
	end
	t.AddItemSet("EquipmentThemes", t2)
end
function t._setupItemSets(p1) --[[ _setupItemSets | Line: 237 | Upvalues: t7 (copy), Items (copy), Sonar (copy), t (copy), v13 (copy), v12 (copy) ]]
	for v1, v2 in t7 do
		for v3, v4 in Items[v2]:GetChildren() do
			t.AddItemSet(v2, (Sonar(v4)))
		end
	end
	t.AddItemSet("RandomPresets", v13)
	t.AddItemSet("Currency", v12)
end
function t._setupLassoTargetSpecies(p1) --[[ _setupLassoTargetSpecies | Line: 253 | Upvalues: MobData (copy), t (copy) ]]
	for v1, v2 in MobData do
		if v2.RequiredLasso then
			for v3, v4 in v2.RequiredLasso do
				local v5 = t.GetByName(v4)
				if v5 then
					v5.TargetSpecies = v1
				end
			end
		end
	end
end
function t._setupModifiers(p1) --[[ _setupModifiers | Line: 272 | Upvalues: v7 (copy), t (copy), ModifierStats (copy) ]]
	for v1, v2 in v7 do
		local v3 = t.GetByName(v1)
		if v3 then
			v3.ModifierStats = {}
			for v4, v5 in v2.ModifierTargets do
				v3.ModifierStats[v5] = v2[v5]
			end
		end
	end
	for v6, v72 in ModifierStats do
		v72.Name = v6
	end
end
function t._setupRandomDrops(p1) --[[ _setupRandomDrops | Line: 293 ]]
	p1:_setupRandomEquipmentDropThemes()
	p1:_setupRandomEquipment()
	p1:_setupRandomFlairs()
	p1:_setupRandomPalettes()
end
function t._setupRandomEquipment(p1) --[[ _setupRandomEquipment | Line: 301 | Upvalues: RandomDrops (ref), t (copy) ]]
	local RandomEquipment = RandomDrops.RandomEquipment
	local v2 = if RandomEquipment then RandomEquipment else {}
	for v3, v4 in t.GetType("Equipment") do
		if v4.P and (v4.P ~= 0 and not v4.ExcludeFromDrops) then
			v2[v3] = v4
		end
	end
	RandomDrops.RandomEquipment = v2
end
function t._setupRandomEquipmentDropThemes(p1) --[[ _setupRandomEquipmentDropThemes | Line: 327 | Upvalues: RandomEquipmentDropThemes (ref), t (copy) ]]
	local v1 = RandomEquipmentDropThemes
	local v3 = if v1 then v1 else {}
	for v4, v5 in t.GetType("EquipmentThemes") do
		if v5.P and (v5.P ~= 0 and not v5.ExcludeFromDrops) then
			v3[v4] = v5
		end
	end
	RandomEquipmentDropThemes = v3
end
function t._setupRandomFlairs(p1) --[[ _setupRandomFlairs | Line: 353 | Upvalues: RandomDrops (ref), t (copy) ]]
	local RandomFlair = RandomDrops.RandomFlair
	local v2 = if RandomFlair then RandomFlair else {}
	for v3, v4 in t.GetType("Flairs") do
		if v4.P and (v4.P ~= 0 and not v4.ExcludeFromDrops) then
			v2[v3] = v4
		end
	end
	RandomDrops.RandomFlair = v2
end
function t._setupRandomPalettes(p1) --[[ _setupRandomPalettes | Line: 379 | Upvalues: RandomDrops (ref), t (copy) ]]
	local RandomPalette = RandomDrops.RandomPalette
	local v2 = if RandomPalette then RandomPalette else {}
	for v3, v4 in t.GetType("EquipmentPalettes") do
		if v4.P and (not v4.ExcludeFromDrops and (v4.P ~= 0 and not v4.Default)) then
			v2[v3] = v4
		end
	end
	RandomDrops.RandomPalette = v2
end
function t._setupTools(p1) --[[ _setupTools | Line: 409 ]]
	p1:_setupLassoTargetSpecies()
	p1:_setupDefaultLassoTargetSpecies()
end
function t.AddItemSet(p1, p2) --[[ AddItemSet | Line: 417 | Upvalues: t4 (copy), t5 (copy), v14 (copy), ReplicatedObjectModels (copy), t3 (copy), ItemTypeDescriptions (copy), ItemImages (copy), AssetString (copy), v6 (copy) ]]
	t4[p1] = t4[p1] or {}
	t5[p1] = t5[p1] or {}
	local v5 = nil
	local v7 = (if v5 then v5 else v14:FindFirstChild(p1, true)) or ReplicatedObjectModels:FindFirstChild(p1)
	for v13, v142 in p2 do
		local v8, v9, v10, v11, v12
		if t3[v13] then
			warn("Duplicate item name found for", v13, p1)
			continue
		end
		local DescriptionType = v142.DescriptionType
		local ToolType = v142.ToolType
		local v15 = nil
		local v16 = (if v15 then v15 else v142.Description) or (if DescriptionType then ItemTypeDescriptions[DescriptionType] or nil else nil) or (if ToolType then ItemTypeDescriptions[ToolType] or nil else nil) or ItemTypeDescriptions[p1] or nil
		local v17 = nil
		local v18 = (if v17 then v17 else v142.Image) or ItemImages[p1]
		local v19
		if tonumber(v18) then
			v8 = string.format(AssetString, v18)
			if v8 then
				v9 = v16
			else
				v19 = v18
				v9 = v16
				v8 = v19
			end
		else
			v19 = v18
			v9 = v16
			v8 = v19
		end
		local v20 = nil
		local v21 = if v20 then v20 else v142.Model
		if v21 then
			v10 = v8
		elseif v7 then
			v21 = v7:FindFirstChild(v13, true)
			if v21 then
				v10 = v8
			else
				v21 = nil
				v10 = v8
			end
		else
			v21 = nil
			v10 = v8
		end
		local v22 = nil
		if v22 then
			v11 = v21
			v12 = v22
		elseif v142.Rarity then
			v12 = v6[v142.Rarity]
			if v12 then
				v11 = v21
			else
				v11 = v21
				v12 = nil
			end
		else
			v11 = v21
			v12 = nil
		end
		if not v12 then
			v12 = v6.Common
		end
		local v23 = v12.Name
		v142.Description = v9
		v142.Image = v10
		v142.ItemType = p1
		v142.Model = v11
		v142.Name = v13
		v142.Rarity = v12
		t3[v13] = v142
		t4[p1] = t4[p1] or {}
		t4[p1][v13] = v142
		t5[p1][v23] = t5[p1][v23] or {}
		t5[p1][v23][v13] = v142
	end
	return t4[p1]
end
function t.CheckItemExists(p1) --[[ CheckItemExists | Line: 479 | Upvalues: t (copy), RandomDrops (ref) ]]
	local v1 = nil
	return ((if v1 then v1 else t.GetByName(p1)) or RandomDrops[p1]) and true or false
end
function t.GetAll() --[[ GetAll | Line: 490 | Upvalues: t3 (copy) ]]
	return t3
end
function t.GetAllItemsOfType(p1) --[[ GetAllItemsOfType | Line: 495 | Upvalues: t4 (copy) ]]
	return t4[p1]
end
function t.GetAllThemes() --[[ GetAllThemes | Line: 500 | Upvalues: EquipmentThemes (copy), Sonar (copy) ]]
	local t = {}
	for v1, v2 in EquipmentThemes:GetChildren() do
		t[v2.Name] = Sonar(v2)
	end
	return t
end
function t.GetAllTypes() --[[ GetAllTypes | Line: 514 | Upvalues: t4 (copy) ]]
	return t4
end
function t.GetByName(p1) --[[ GetByName | Line: 519 | Upvalues: t3 (copy) ]]
	return t3[p1]
end
function t.GetByType(p1, p2) --[[ GetByType | Line: 524 | Upvalues: t4 (copy) ]]
	return t4[p2][p1]
end
function t.GetByTypeAndRarity(p1, p2) --[[ GetByTypeAndRarity | Line: 529 | Upvalues: t5 (copy) ]]
	local v1 = t5[p1]
	if not v1 then
		return {}
	end
	if not p2 then
		return v1
	end
	return v1[p2] or {}
end
function t.GetEquipmentBySpecies() --[[ GetEquipmentBySpecies | Line: 543 | Upvalues: EquipmentBySpecies (ref) ]]
	return EquipmentBySpecies
end
function t.GetInventorySlotPurchase(p1, p2) --[[ GetInventorySlotPurchase | Line: 548 | Upvalues: v5 (copy) ]]
	local v1 = p2 or "Free"
	local InventoryTiersPurchased = p1.PlayerData.InventoryTiersPurchased
	if v1 == "Robux" then
		InventoryTiersPurchased = InventoryTiersPurchased.RobuxTiersPurchased
	end
	for v2, v3 in v5[v1] do
		if InventoryTiersPurchased.Value < v2 then
			return v3
		end
	end
end
function t.GetItemType(p1) --[[ GetItemType | Line: 565 | Upvalues: t (copy) ]]
	local v1 = t.GetByName(p1)
	local v2 = nil
	return if v2 then v2 elseif v1 then v1.ItemType or nil else nil
end
function t.GetRarities() --[[ GetRarities | Line: 575 | Upvalues: v6 (copy) ]]
	return v6
end
function t.GetRarity(p1) --[[ GetRarity | Line: 580 | Upvalues: v6 (copy) ]]
	return v6[p1]
end
function t.GetType(p1) --[[ GetType | Line: 585 | Upvalues: t4 (copy) ]]
	return t4[p1]
end
function t.Init(p1) --[[ Init | Line: 590 ]]
	p1:_setupItemSets()
	p1:_setupEquipmentBySpecies()
	p1:_setupEquipmentThemes()
	p1:_setupTools()
	p1:_setupRandomDrops()
	p1:_setupChests()
	p1:_setupModifiers()
	p1:_setupAllItemSets()
	p1:_addInventorySlotProducts()
end
t:Init()
return t