-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("ItemDataService")
local v5 = Sonar("AnimalDataService")
local v6 = Sonar("WeightedProbability")
local v7 = Sonar("BreedUtils")
local v8 = Sonar("FormatNumber")
local v9 = Sonar("NotificationsService")
local v10 = v1 and Sonar("AnalyticsService")
local v11 = Sonar("CapsuleService")
local v12 = Sonar("Constants")
local function getCapsuleHorseInfo(p1) --[[ getCapsuleHorseInfo | Line: 25 ]]
	if not p1.SpeciesDropTable then
		return p1
	end
	local v1 = table.clone(p1.SpeciesDropTable)
	if v1.MaxCosmetics == nil then
		v1.MaxCosmetics = p1.MaxCosmetics
	end
	return v1
end
function t.CanClaimSet(p1, p2) --[[ CanClaimSet | Line: 38 | Upvalues: v4 (copy) ]]
	local v1 = v4.GetByType(p2, "ItemSets")
	if not v1 then
		return
	end
	local v2 = p1.PlayerData.ItemSets:FindFirstChild(p2)
	if not v2 then
		return
	end
	if v1.Testing then
		return true, v1, v2
	end
	if v2.Value > 0 then
		return "AlreadyClaimed"
	end
	if not v1.Claimable then
		return "NotClaimable"
	end
	if v1.Claimable.Badges then
		local v3 = false
		for k, v in pairs(v1.Claimable.Badges) do
			if p1.BadgesFolder[v].Value then
				v3 = true
			end
		end
		if not v3 then
			return "NoOwnBadge"
		end
	end
	if v1.Claimable.LastUpdate and (p1.PlayerData.LastPlayedUpdate.Value > v1.Claimable.LastUpdate or p1.PlayerData.LastPlayedUpdate.Value <= 0) then
		return "NotPlayedBeforeUpdate"
	end
	if v1.Claimable.ClaimBeforeTimestamp and workspace:GetServerTimeNow() >= v1.Claimable.ClaimBeforeTimestamp then
		return "ItemSetExpired"
	end
	return true, v1, v2
end
function t.GetClaimableSetsFromJoin(p1) --[[ GetClaimableSetsFromJoin | Line: 85 | Upvalues: v4 (copy), t (copy) ]]
	local t2 = {}
	if p1.Player:GetAttribute("DEBUG_DATA") then
		return t2
	end
	for k, v in pairs(v4.GetType("ItemSets")) do
		if t.CanClaimSet(p1, k) == true then
			t2[k] = v
		end
	end
	return t2
end
function t._giveHorse(p1, p2, p3, p4) --[[ _giveHorse | Line: 98 | Upvalues: v7 (copy), v12 (copy), v6 (copy), v5 (copy), v1 (copy) ]]
	if p3.SpeciesDropTable then
		local v13 = table.clone(p3.SpeciesDropTable)
		if v13.MaxCosmetics == nil then
			v13.MaxCosmetics = p3.MaxCosmetics
		end
		p3 = v13
	end
	local v2 = p4 and Random.new(p4) or Random.new()
	local Preset = p3.Preset
	local v3 = if typeof(Preset) == "function" then Preset() else Preset[v2:NextInteger(1, #Preset)]
	local v52 = p3.MaxEyeRarity or 100
	local Eye = v12.WildSpawnPresets.Presets[v3].Eye
	local t = {}
	for v62, v72 in v7.EyesByIndex do
		if (not Eye or table.find(Eye, v72.Name)) and not (v52 < v72.P) then
			table.insert(t, v72)
		end
	end
	local v8 = nil
	if next(t) then
		v8 = t[v6.getRandomWeightedItem(t, v2)].Name
	else
		warn("There was no eye with a low enough rarity for a horse like reward slot. Make sure the MaxEyeRarity is obtainable. Falling back to a normal eye!")
	end
	local Species = p3.Species
	if type(Species) == "table" then
		Species = p3.Species[v2:NextInteger(1, #p3.Species)]
	elseif Species == "Random" then
		Species = v12.AnySpeciesTable[v2:NextInteger(1, #v12.AnySpeciesTable)]
	end
	return v5.CreateSlot(p2, {
		Age = 66,
		Species = Species or "Horse",
		Preset = v3 or nil,
		MaxCosmetics = p3.MaxCosmetics,
		Gender = p3.Gender,
		Eye = v8,
		Infertile = p3.Infertile,
		SkillLevels = p3.SkillLevels,
		MutationSlotChances = p3.MutationSlotChances,
		MutationsToGuarantee = p3.MutationsToGuarantee,
		MutationGroupsToGuarantee = p3.MutationGroupsToGuarantee,
		MutationChances = p3.MutationChances,
		Origin = p3.Origin,
		Tradelocked = p3.Tradelocked,
		DoNotParent = not v1,
		DoNotIncrementCount = not v1,
		Seed = v2
	})
end
function t.CanClaimStackableChest(p1, p2, p3) --[[ CanClaimStackableChest | Line: 164 | Upvalues: v4 (copy), v8 (copy) ]]
	local v1 = v4.GetByName(p2)
	if not v1 then
		return
	end
	if not v1.DropTable then
		return
	end
	local v2 = v8.SanitiseInput(p3)
	local v3 = p1:HasEnoughOfItem(v2, p2)
	if not v3 then
		return "NotEnoughChestItem"
	end
	if not game:GetService("RunService"):IsStudio() then
		local v42, v5 = p1:CanGiveItem(v1.ItemType)
		if not v42 then
			return "Max" .. v5
		end
	end
	return true, v3, v2, v1
end
function t.CanClaimChest(p1, p2) --[[ CanClaimChest | Line: 186 | Upvalues: v4 (copy) ]]
	local v1 = p1:GetItemValue(p2, "Chests")
	if not v1 then
		return "DoesNotExist"
	end
	local v2 = v4.GetByName(v1.Value)
	if not v2 then
		return
	end
	if not v2.DropTable then
		return
	end
	local v3, v42 = p1:CanGiveItem(v2.ItemType)
	if v3 then
		return true, v1, v2
	else
		return "Max" .. v42
	end
end
function t.CanClaimCapsule(p1, p2) --[[ CanClaimCapsule | Line: 205 | Upvalues: v4 (copy) ]]
	local v1 = v4.GetByName(p2)
	if not v1 then
		return
	end
	if v1.ItemType ~= "Capsules" then
		return
	end
	if v1.SpeciesDropTable then
		return true
	end
end
function t.CanClaimItemCapsule(p1, p2) --[[ CanClaimItemCapsule | Line: 216 | Upvalues: v4 (copy) ]]
	local v1 = v4.GetByName(p2)
	if not v1 then
		return
	end
	if v1.ItemType ~= "ItemCapsules" then
		return
	end
	if not v1.ItemDropTable then
		return
	end
	if p1:GetCurrencyValue("Coins") and p1:GetCurrencyValue("Coins").Value < v1.Price then
		return "CannotAfford"
	else
		return true
	end
end
function t.ClaimCapsule(p1, p2, p3) --[[ ClaimCapsule | Line: 233 | Upvalues: v2 (copy) ]]
	return v2.GetRemoteFunction("ClaimCapsuleRemote"):InvokeServer(p3)
end
function t.ClaimChest(p1, p2, p3, ...) --[[ ClaimChest | Line: 237 | Upvalues: v2 (copy) ]]
	if p2:GetItemValue(p3, "Chests") then
		return v2.GetRemoteFunction("ClaimChestRemote"):InvokeServer(p3, ...)
	else
		return v2.GetRemoteFunction("ClaimStackableChestRemote"):InvokeServer(p3, ...)
	end
end
function t.Init(p1) --[[ Init | Line: 245 | Upvalues: v1 (copy), v2 (copy), v3 (copy), t (copy), v10 (copy), v6 (copy), v12 (copy), v9 (copy), v5 (copy), v4 (copy), v11 (copy) ]]
	if not v1 then
		return
	end
	v2.GetRemoteFunction("DismissItemSetRemote").OnServerInvoke = function(p1, p2) --[[ Line: 247 | Upvalues: v3 (ref), t (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, _, v32 = t.CanClaimSet(v1, p2)
		if v2 == true then
			v32.Value = v32.Value + 1
		end
	end
	v2.GetRemoteFunction("ClaimItemSetRemote").OnServerInvoke = function(p1, p2) --[[ Line: 257 | Upvalues: v3 (ref), t (ref), v10 (ref), v6 (ref), v12 (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, v32, v4 = t.CanClaimSet(v1, p2)
		if v2 ~= true then
			return
		end
		v4.Value = v4.Value + 1
		for k, v in pairs(v4:GetChildren()) do
			v.Value = v.Value + 1
		end
		for k, v in pairs({ v32.Items, v32.ExtraItems, v32.Horses }) do
			for k2, v7 in pairs(v) do
				local v5
				if type(v7) == "table" and v7.Species then
					v5 = if k2 == "LEGOHorse" then Random.new(p1.UserId):NextInteger(9000000, 9000000000000) else nil
					t:_giveHorse(v1, v7, v5)
					v10.ReportResourceEvent(p1, "Source", "HorseSlot", v7.Species or "", "ItemSet", 1)
					continue
				end
				local v8 = if typeof(v7) == "table" then true else false
				local v9 = if v8 then v7.Amount or 1 elseif v7 then v7 else 1
				local v102 = if v8 then v7.Theme else v8
				local v11 = if v8 then v7.ThemeChance else v8
				if v102 == "Random" then
					v102 = v6.getRandomWeightedItem(v12.RandomEquipmentDropThemes)
				end
				local t2 = {
					IgnoreLimit = true,
					Name = k2,
					Amount = v9,
					Theme = v102,
					ThemeChance = v11,
					Source = p2
				}
				t2.ItemStream = if k2 == "Coins" then true else false
				v1:GiveItem(t2)
			end
		end
	end
	local function giveChestRewards(p1, p2, p3, p4) --[[ giveChestRewards | Line: 309 | Upvalues: v6 (ref), t (ref), v10 (ref), v9 (ref), v12 (ref), v5 (ref) ]]
		if p2.DropTable.OnlyDropSpecies then
			local v2 = t:_giveHorse(p1, p2.DropTable.Species[v6.getRandomWeightedItem(p2.DropTable.Species)])
			v2.Parent = p1:GetItemFolder("Animals")
			local v3 = p1:GetItemFolder("Animals")
			local Species = v2.Species.Value
			local count = 0
			for v4, v52 in v3:GetChildren() do
				if v52.Species.Value == Species then
					count = count + 1
				end
			end
			v10.ReportResourceEvent(p1.Player, "Source", "HorseSlot", Species, "Chest", 1, {
				{
					Key = "Total",
					Value = count
				}
			})
			v9.NotifyPlayer(p1.Player, "ClaimedChest", v2.Name)
		elseif p4 then
			local t2 = {}
			for v62, v7 in p2.DropTable.Drops do
				if v7.P <= p4 or v7.DoNotRemove then
					t2[v62] = v7
				end
			end
			for i = 1, (p2.RewardAmount or 1) * p3 do
				local v8 = t2[v6.getRandomWeightedItem(t2)]
				if v8.Name == "RandomFoal" then
					if p1:CanGiveItem("Animals") then
						local t3 = {}
						for v92, v102 in p2.DropTable.Species do
							t3[v92] = {
								P = v102.P
							}
						end
						local v11 = p2.DropTable.Species[v6.getRandomWeightedItem(t3)]
						v11.Origin = "Spirit"
						local v122 = t:_giveHorse(p1, v11)
						v122.Parent = p1:GetItemFolder("Animals")
						v9.NotifyPlayer(p1.Player, "ClaimedChest", v122.Name)
						local v13 = p1:GetItemFolder("Animals")
						local Species = v122.Species.Value
						local count = 0
						for v14, v15 in v13:GetChildren() do
							if v15.Species.Value == Species then
								count = count + 1
							end
						end
						v10.ReportResourceEvent(p1.Player, "Source", "HorseSlot", Species, "Chest", 1, {
							{
								Key = "Total",
								Value = count
							}
						})
						continue
					end
					local Theme = v8.Theme
					if Theme == "Random" then
						Theme = v6.getRandomWeightedItem(v12.RandomEquipmentDropThemes)
					end
					p1:GiveItem({
						Name = "Coins",
						Amount = 250,
						ApplyModifiers = true,
						ItemStream = true,
						TotalDrops = Random.new():NextInteger(5, 10),
						Theme = Theme,
						Source = p2.Name
					})
					continue
				end
				local v17 = if typeof(v8) == "table" then true else false
				local v18 = if v17 then v8.Amount or 1 elseif v8 then v8 else 1
				local v19 = if v17 then v8.Theme else v17
				local v20 = if v17 then v8.ThemeChance else v17
				if v19 == "Random" then
					v19 = v6.getRandomWeightedItem(v12.RandomEquipmentDropThemes)
				end
				local t3 = {
					IgnoreLimit = true,
					Name = v8.Name,
					Amount = v18,
					Theme = v19,
					ThemeChance = v20,
					Source = p2.Name
				}
				t3.ItemStream = if v8.Name == "Coins" then true else false
				p1:GiveItem(t3)
			end
		else
			for j = 1, (p2.RewardAmount or 1) * p3 do
				local v23 = p2.DropTable.Drops[v6.getRandomWeightedItem(p2.DropTable.Drops)]
				if v23.Name == "RandomFoal" then
					if p1:CanGiveItem("Animals") then
						local t2 = {}
						for v24, v25 in p2.DropTable.Species do
							t2[v24] = {
								P = v25.P
							}
						end
						local v26 = p2.DropTable.Species[v6.getRandomWeightedItem(t2)]
						local v27 = v5.CreateSlot(p1, {
							DoNotParent = true,
							Age = 1,
							Origin = "Spirit",
							Species = v26.Species,
							Theme = v23.Theme,
							MutationChances = p2.DropTable.MutationChances,
							Preset = v26.Preset[math.random(1, #v26.Preset)]
						})
						v27.Parent = p1:GetItemFolder("Animals")
						v9.NotifyPlayer(p1.Player, "ClaimedChest", v27.Name)
						local v28 = p1:GetItemFolder("Animals")
						local Species = v27.Species.Value
						local count = 0
						for v29, v30 in v28:GetChildren() do
							if v30.Species.Value == Species then
								count = count + 1
							end
						end
						v10.ReportResourceEvent(p1.Player, "Source", "HorseSlot", Species, "Chest", 1, {
							{
								Key = "Total",
								Value = count
							}
						})
						continue
					end
					local Theme = v23.Theme
					if Theme == "Random" then
						Theme = v6.getRandomWeightedItem(v12.RandomEquipmentDropThemes)
					end
					p1:GiveItem({
						Name = "Coins",
						Amount = 250,
						ItemStream = true,
						ApplyModifiers = true,
						TotalDrops = Random.new():NextInteger(5, 10),
						Theme = Theme,
						Source = p2.Name
					})
					continue
				end
				local v32 = if typeof(v23) == "table" then true else false
				local v33 = if v32 then v23.Amount or 1 elseif v23 then v23 else 1
				local v34 = if v32 then v23.Theme else v32
				local v35 = if v32 then v23.ThemeChance else v32
				if v34 == "Random" then
					v34 = v6.getRandomWeightedItem(v12.RandomEquipmentDropThemes)
				end
				local t2 = {
					IgnoreLimit = true,
					Name = v23.Name,
					Amount = v33,
					Theme = v34,
					ThemeChance = v35,
					Source = p2.Name
				}
				t2.ItemStream = if v23.Name == "Coins" then true else false
				p1:GiveItem(t2)
			end
		end
		return true
	end
	v2.GetRemoteFunction("ClaimStackableChestRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 499 | Upvalues: v3 (ref), t (ref), v10 (ref), giveChestRewards (copy) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, v32, v4, v5 = t.CanClaimStackableChest(v1, p2, p3)
		if v2 == true then
			v32.Value = v32.Value - v4
			v10.ReportResourceEvent(p1, "Sink", "Chests", p2, "OpenChest", v4)
			return giveChestRewards(v1, v5, v4)
		end
	end
	v2.GetRemoteFunction("ClaimChestRemote").OnServerInvoke = function(p1, p2) --[[ Line: 511 | Upvalues: v3 (ref), t (ref), giveChestRewards (copy) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, v32, v4 = t.CanClaimChest(v1, p2)
		if v2 == true then
			v32:Destroy()
			return giveChestRewards(v1, v4, 1, v32.LuckPower.Value)
		end
	end
	local v13 = Random.new()
	v2.GetRemoteFunction("PredictCapsuleRemote").OnServerInvoke = function(p1, p2) --[[ Line: 524 | Upvalues: v3 (ref), v4 (ref), v10 (ref), v13 (copy) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		v1._lastCapsulePredictionSeedData = nil
		local v2 = v4.GetByName(p2)
		if not v2 then
			warn("No item data found for", p2)
			return
		end
		if v2.ItemType ~= "Capsules" then
			warn("Item is not a capsule", p2)
			return
		end
		local v32 = v1:GetItemValue(p2, "Capsules")
		if not v32 then
			return
		end
		if v32.Value <= 0 then
			return
		end
		local v42 = v1:GetCurrencyValue("Coins")
		if not v42 then
			return
		end
		if v42.Value < v2.Price then
			return false, "CannotAfford"
		else
			local Price = v2.Price
			v42.Value = v42.Value - Price
			v10.ReportResourceEvent(p1, "Sink", "Currency", "Coins", "CapsulePrediction", Price)
			local v5 = v13:NextNumber(-10000000, 10000000) + os.clock()
			v1._lastCapsulePredictionSeedData = {
				ItemName = p2,
				Seed = v5
			}
			return v5
		end
	end
	v2.GetRemoteFunction("ClaimCapsuleRemote").OnServerInvoke = function(p1, p2) --[[ Line: 558 | Upvalues: v3 (ref), v4 (ref), v10 (ref), t (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if not v1._lastCapsulePredictionSeedData then
			return
		end
		local Seed = v1._lastCapsulePredictionSeedData.Seed
		v1._lastCapsulePredictionSeedData = nil
		local v2 = v4.GetByName(p2)
		if not v2 then
			warn("No item data found for", p2)
			return
		end
		if v2.ItemType ~= "Capsules" then
			warn("Item is not a capsule", p2)
			return
		end
		local v32 = v1:GetItemValue(p2, "Capsules")
		if not v32 then
			return
		end
		if v32.Value <= 0 then
			return
		end
		v32.Value = v32.Value - 1
		v10.ReportResourceEvent(p1, "Sink", "Capsules", p2, "OpenCapsule", 1)
		local v42 = t:_giveHorse(v1, v2, Seed)
		v42.Parent = v1:GetItemFolder("Animals")
		local v5 = v1:GetItemFolder("Animals")
		local Species = v42.Species.Value
		local count = 0
		for v6, v7 in v5:GetChildren() do
			if v7.Species.Value == Species then
				count = count + 1
			end
		end
		v10.ReportResourceEvent(v1.Player, "Source", "HorseSlot", Species, "Capsule", 1, {
			{
				Key = "Total",
				Value = count
			}
		})
		return true, v42.Name
	end
	v2.GetRemoteFunction("PredictItemCapsuleRemote").OnServerInvoke = function(p1, p2) --[[ Line: 600 | Upvalues: v3 (ref), v4 (ref), v10 (ref), v13 (copy) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		v1._lastItemCapsulePredictionSeedData = nil
		local v2 = v4.GetByName(p2)
		if not v2 then
			warn("No item data found for", p2)
			return
		end
		if v2.ItemType ~= "ItemCapsules" then
			warn("Item is not a item capsule", p2)
			return
		end
		local v32 = v1:GetCurrencyValue("Coins")
		if not v32 then
			return
		end
		if v32.Value < v2.Price then
			return false, "CannotAfford"
		else
			local Price = v2.Price
			v32.Value = v32.Value - Price
			v10.ReportResourceEvent(p1, "Sink", "Currency", "Coins", "CapsulePrediction", Price)
			local v42 = v13:NextNumber(-10000000, 10000000) + os.clock()
			v1._lastItemCapsulePredictionSeedData = {
				ItemName = p2,
				Seed = v42
			}
			return v42
		end
	end
	v2.GetRemoteFunction("ClaimItemCapsuleRemote").OnServerInvoke = function(p1, p2) --[[ Line: 630 | Upvalues: v3 (ref), v4 (ref), v10 (ref), v11 (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2 = v4.GetByName(p2)
		if not v2 then
			warn("No item data found for", p2)
			return
		end
		if v2.ItemType ~= "ItemCapsules" then
			warn("Item is not a item capsule", p2)
			return
		end
		local Seed = v1._lastItemCapsulePredictionSeedData.Seed
		v1._lastItemCapsulePredictionSeedData = nil
		local v32 = v1:GetItemValue(p2, "ItemCapsules")
		if not v32 then
			return
		end
		if v32.Value <= 0 then
			return
		end
		v32.Value = v32.Value - 1
		v10.ReportResourceEvent(p1, "Sink", "Capsules", p2, "OpenItemCapsule", 1)
		for v42, v5 in v11.GetItemCapsuleItems(v2.ItemDropTable, v2.ItemPullAmount, Seed, v2.NoRepeatItems, p2) do
			v1:GiveItem({
				Amount = 1,
				IgnoreLimit = true,
				Name = v5.Item.Name,
				Theme = v5.Theme,
				Source = p2
			})
		end
		return true
	end
end
t:Init()
return t