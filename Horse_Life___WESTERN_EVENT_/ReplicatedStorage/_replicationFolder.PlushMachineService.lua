-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("TimeSeedClass")
local v5 = Sonar("Table")
local v6 = Sonar("ItemDataService")
local v7 = Sonar("AnimalDataService")
local v8 = v1 and Sonar("AnalyticsService")
local v9 = Sonar(Sonar("StorageUtils").Get("PlushMaterialShop"))
local PlushMachinePreset = Sonar("Constants").PlushMachinePreset
local t2 = {
	Cosmetic = "MaxCosmetics",
	Size = "Sizes",
	EyeColor = "EyeColor",
	Dye = "Preset",
	Gender = "Gender"
}
local t3 = { "Cosmetic", "Size", "EyeColor", "Gender", "Dye", "Horn", "Mutation", "WingMutation" }
local v10 = v4.new({
	Duration = 3600
})
local t4 = {}
local v11 = nil
local t5 = {}
function t.PurchaseMaterialShop(p1, ...) --[[ PurchaseMaterialShop | Line: 59 | Upvalues: v2 (copy) ]]
	return v2.GetRemoteFunction("PurchasePlushMaterialRemote"):InvokeServer(...)
end
function t.CanPurchaseMaterial(p1, p2) --[[ CanPurchaseMaterial | Line: 63 | Upvalues: t (copy), v6 (copy) ]]
	if not next(t.GetMaterialShopItems()) then
		return
	end
	if t.HasReachedPurchaseLimit(p1) then
		return "MaxMaterialsPurchased"
	end
	local v1 = t.GetMaterialShopItems()[p2]
	if not v1 then
		return
	end
	local v2, v3 = p1:CanGiveItem(v6.GetByName(p2).ItemType)
	if not v2 then
		return "Max" .. v3
	end
	local v4 = p1:CanAfford(v1, "Coins")
	if v4 then
		return true, v4, v1
	else
		return "CannotAfford"
	end
end
function t.HasReachedPurchaseLimit(p1) --[[ HasReachedPurchaseLimit | Line: 87 ]]
	return p1.PlayerData.PlushMachine.MaterialPurchases.Value >= 10
end
function t.GetMaterialShopItems() --[[ GetMaterialShopItems | Line: 91 | Upvalues: v11 (ref), v10 (copy), t5 (ref), v5 (copy), t4 (copy), v9 (copy) ]]
	if v11 == v10.CurrentSeed then
		return t5
	end
	local v1 = v5.Copy(t4)
	local t = {}
	for i = 1, 9 do
		local v2 = Random.new(v10.CurrentSeed):NextInteger(1, #v1)
		local v3 = v1[v2]
		table.remove(v1, v2)
		t[v3] = v9[v3]
	end
	v11 = v10.CurrentSeed
	t5 = t
	return t
end
function t.GetMaterialType(p1) --[[ GetMaterialType | Line: 111 | Upvalues: v6 (copy) ]]
	local v1 = v6.GetByName(p1)
	if v1 then
		return v1.MaterialType
	end
end
function t.CanAddMaterial(p1, p2, p3) --[[ CanAddMaterial | Line: 117 | Upvalues: t (copy) ]]
	local v1 = t.GetMaterialType(p3)
	if not v1 then
		return "NotMaterial"
	end
	if p2[v1] then
		return "AlreadyAddedOfType"
	else
		return true
	end
end
function t.GetSlotSeed(p1, p2) --[[ GetSlotSeed | Line: 130 | Upvalues: t (copy) ]]
	if not p2 then
		p2 = math.random(1, 10)
	end
	if t.HasSubmittedMaterialsForSeed(p1) then
		return math.clamp(p2, 0, 10) * 1000
	else
		return Random.new(p2):NextInteger(1, 1000)
	end
end
function t.HasSubmittedMaterialsForSeed(p1) --[[ HasSubmittedMaterialsForSeed | Line: 142 | Upvalues: t (copy), v6 (copy), t2 (copy) ]]
	for k, v in pairs(p1) do
		local v1 = t.GetMaterialType(v)
		if v1 then
			local v2 = v6.GetByName(v)
			if v2 then
				local v3 = v2[t2[v1]]
				if v3 and type(v3) == "table" then
					return true
				end
			end
		end
	end
end
function t.GetSlotInfo(p1, p2) --[[ GetSlotInfo | Line: 159 | Upvalues: t (copy), PlushMachinePreset (copy), v6 (copy), t2 (copy), v7 (copy) ]]
	p2.Seed = t.GetSlotSeed(p2.Materials, p2.Seed)
	local v1 = p2.Seed + p2.SeedOffset * 10000
	local t3 = {
		Origin = "Wild",
		DoNotParent = true,
		TotalMutationSlots = 0,
		Species = PlushMachinePreset.Species,
		Preset = PlushMachinePreset.Preset,
		MaxCosmetics = PlushMachinePreset.MaxCosmetics,
		DoNotIncrementCount = not p2.GiveToPlayer,
		Seed = v1,
		Age = p2.Age or 1
	}
	t3.Gender = if Random.new(v1):NextInteger(1, 2) == 1 then "Male" else "Female"
	for k, v in pairs(p2.Materials) do
		local v3 = t.GetMaterialType(v)
		if v3 then
			local v4 = v6.GetByName(v)[t2[v3]]
			if v4 then
				t3[t2[v3]] = v4
				continue
			end
			if v3 == "Mutation" then
				t3.TotalMutationSlots = t3.TotalMutationSlots + 1
				if not t3.MutationChances then
					t3.MutationChances = {}
				end
				t3.MutationChances.Nothing = 0
				t3.MutationChances.Wings = 0
				continue
			end
			if v3 == "WingMutation" then
				t3.AlwaysHasWings = true
				t3.TotalMutationSlots = t3.TotalMutationSlots + 1
				continue
			end
			if v3 == "Horn" then
				t3.AlwaysGiveHorn = true
			end
		end
	end
	t3.Preset = t3.Preset[Random.new(v1):NextInteger(1, #t3.Preset)]
	t3.TotalMutationSlots = t3.TotalMutationSlots > 0 and t3.TotalMutationSlots or nil
	return v7.CreateSlot(p1, t3)
end
function t.CanPurchaseSlot(p1, p2) --[[ CanPurchaseSlot | Line: 210 | Upvalues: t (copy) ]]
	if not game:GetService("RunService"):IsStudio() then
		if not p1:CanGiveItem("Animals") then
			return "AtAnimalLimit"
		end
		if not p1:HasUnlockedSpecies("Plush") then
			return "LockedSpecies"
		end
	end
	local t2 = {}
	for k, v in pairs(p2) do
		local v1 = t.GetMaterialType(v)
		if v1 then
			if t2[v1] then
				return "AlreadyAddedOfType"
			end
			if p1:GetItemValue(v).Value <= 0 then
				return "NotEnoughMaterials"
			end
			t2[v1] = v
		end
	end
	local v2 = p1:CanAfford(500, "Coins")
	if v2 then
		return true, v2, t2
	else
		return "CannotAfford"
	end
end
function t.PurchasePlushMachine(...) --[[ PurchasePlushMachine | Line: 244 | Upvalues: v2 (copy) ]]
	return v2.GetRemoteFunction("PurchasePlushMachineRemote"):InvokeServer(...)
end
function t.Init(p1) --[[ Init | Line: 248 | Upvalues: t (copy), v10 (copy), t3 (copy), v9 (copy), v6 (copy), t4 (copy), v1 (copy), v3 (copy), v2 (copy), v8 (copy) ]]
	t.ShopRefreshTimer = v10
	t.MaxMaterialPurchases = 10
	t.MaxDisplaySeed = 10
	t.PurchasePrice = 500
	t.AllSlots = t3
	for k, v in pairs(v9) do
		if v6.GetByName(k) then
			table.insert(t4, k)
			continue
		end
		warn("No item data can be found for", k)
	end
	table.sort(t4, function(p1, p2) --[[ Line: 264 ]]
		return p1 < p2
	end)
	if not v1 then
		return
	end
	v3.bindToPlayers(function(p1) --[[ Line: 269 | Upvalues: v3 (ref), v10 (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local function setShopSeed() --[[ setShopSeed | Line: 273 | Upvalues: v1 (copy), v10 (ref) ]]
			if v1.PlayerData.PlushMachine.LastMaterialSeed.Value ~= v10.CurrentSeed then
				v1.PlayerData.PlushMachine.LastMaterialSeed.Value = v10.CurrentSeed
				v1.PlayerData.PlushMachine.MaterialPurchases.Value = 0
			end
		end
		v1.Maid:GiveTask(v10.SeedChanged:Connect(setShopSeed))
		if v1.PlayerData.PlushMachine.LastMaterialSeed.Value ~= v10.CurrentSeed then
			v1.PlayerData.PlushMachine.LastMaterialSeed.Value = v10.CurrentSeed
			v1.PlayerData.PlushMachine.MaterialPurchases.Value = 0
		end
	end)
	v2.GetRemoteFunction("PurchasePlushMachineRemote").OnServerInvoke = function(p1, p2) --[[ Line: 281 | Upvalues: v3 (ref), t (ref), v8 (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, v32, v4 = t.CanPurchaseSlot(v1, p2)
		if v2 ~= true then
			return
		end
		v32.Value = v32.Value - 500
		v8.ReportResourceEvent(v1.Player, "Sink", "Currency", "Coins", "PlushMachine", 500)
		for k, v in pairs(v4) do
			local v5 = v1:GetItemValue(v)
			v5.Value = v5.Value - 1
		end
		local v6 = t.GetSlotInfo(v1, {
			GiveToPlayer = true,
			Materials = v4,
			SeedOffset = v1.PlayerData.PlushMachine.MachinePurchases.Value
		})
		v6.Parent = v1:GetItemFolder("Animals")
		local v7 = v1:GetItemFolder("Animals")
		local Species = v6.Species.Value
		local count = 0
		for v82, v9 in v7:GetChildren() do
			if v9.Species.Value == Species then
				count = count + 1
			end
		end
		v8.ReportResourceEvent(v1.Player, "Source", "HorseSlot", Species, "PlushMachine", 1, {
			{
				Key = "Total",
				Value = count
			}
		})
		local MachinePurchases = v1.PlayerData.PlushMachine.MachinePurchases
		MachinePurchases.Value = MachinePurchases.Value + 1
		v1:IncrementMission({
			Type = "BuyItem",
			Amount = 1,
			Data = { "PlushMachine" }
		})
		return v6.Name
	end
	v2.GetRemoteFunction("PurchasePlushMaterialRemote").OnServerInvoke = function(p1, p2) --[[ Line: 330 | Upvalues: v3 (ref), t (ref), v8 (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, v32, v4 = t.CanPurchaseMaterial(v1, p2)
		if v2 ~= true then
			return
		end
		if not v1:GiveItem({
			Amount = 1,
			Source = "PlushMaterialShop",
			Name = p2
		}) then
			return
		end
		local MaterialPurchases = v1.PlayerData.PlushMachine.MaterialPurchases
		MaterialPurchases.Value = MaterialPurchases.Value + 1
		v32.Value = v32.Value - v4
		v8.ReportResourceEvent(v1.Player, "Sink", "Currency", "Coins", "PlushMaterialShop", v4)
	end
end
t:Init()
return t