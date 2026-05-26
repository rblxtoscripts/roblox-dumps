-- https://lua.expert/
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
Sonar("RemoteUtils")
local v1 = Sonar("StorageUtils")
local v2 = Sonar("MarketplaceUtils")
local v3 = Sonar("TimeSeedClass")
local v4 = Sonar("ItemDataService")
local v5 = Sonar("WeightedProbability")
local v6 = Sonar("SortedRandom")
local v7 = Sonar("Constants")
local v8 = Sonar("Table")
local v9 = v1.Get("CapsuleProducts")
v1.Get("Capsules")
local v10 = Sonar(v1.Get("Lootbox"))
local TackPacks = v7.TackPacks
local t = {}
game:GetService("Players")
local t2 = {}
t2.Duration = if RunService:IsStudio() then 45 else v7.BundleResetTime
local v13 = v3.new(t2)
local function determineTheme(p1, p2, p3) --[[ determineTheme | Line: 31 | Upvalues: v5 (copy) ]]
	if not (p1 and (p1.Theme and (p2 and p3))) then
		return nil
	end
	local v1 = Random.new(p3 + (p1.SeedOffset or 0))
	if not (if p1.AlwaysTheme then true elseif typeof(p1.ThemeChance) == "number" then v1:NextNumber() <= p1.ThemeChance elseif v1:NextInteger(1, 2) == 1 then true else false) then
		return nil
	end
	local Theme = p1.Theme
	if typeof(Theme) == "table" then
		Theme = Theme[v1:NextInteger(1, #Theme)]
	elseif Theme == "Random" then
		Theme = p2[v5.getRandomWeightedItem(p2, p3 + (p1.SeedOffset or 0))].Name
	end
	if Theme == "Random" then
		Theme = p2[v5.getRandomWeightedItem(p2, p3)].Name
	end
	return Theme
end
t.DetermineTheme = determineTheme
function t.FindCapsule(p1) --[[ FindCapsule | Line: 69 | Upvalues: v9 (copy) ]]
	for v1, v2 in v9 do
		if v2.ProductId == p1 then
			return v2
		end
	end
	return nil
end
function t.GetTackItems(p1, p2, p3) --[[ GetTackItems | Line: 78 | Upvalues: v13 (copy), v7 (copy), v5 (copy), v6 (copy), v4 (copy), determineTheme (copy) ]]
	local t = {}
	local v1 = p3 or v13.CurrentSeed
	local t2 = {}
	for v2, v3 in v7.RandomEquipmentDropThemes do
		v3.Name = v2
		table.insert(t2, v3)
	end
	table.sort(t2, function(p1, p2) --[[ Line: 89 ]]
		return p1.Name < p2.Name
	end)
	local function storeRandomTackItem(p1, p2, p3) --[[ storeRandomTackItem | Line: 93 | Upvalues: v5 (ref), v6 (ref), v1 (copy), t (copy), v4 (ref), determineTheme (ref), t2 (copy) ]]
		local v12 = if typeof(p2) == "table" then p2 else {
	Amount = p2
}
		local v2
		if p1 == "RandomEquipment" then
			v2 = v6[v5.getRandomWeightedItem(v6, v1 + (if typeof(v12) == "table" then v12.SeedOffset or 0 else 0))].Name
		else
			if p1 == "RandomFlair" then
				table.insert(t, {
					IgnoreLimit = true,
					Name = p1,
					Amount = v12.Amount
				})
				return
			end
			v2 = p1
		end
		local v52 = v4.GetByName(v2)
		if not v52 then
			warn("No item data found for", v2)
			return
		end
		table.insert(t, {
			IgnoreLimit = true,
			Name = v52.Name,
			Theme = if v52.ItemType == "Equipment" and v12.Theme ~= nil then determineTheme(v12, t2, v1) else nil,
			Amount = v12.Amount or 1,
			ItemType = v52.Type
		})
	end
	for v42, v52 in p2 do
		if v52.PullTable then
			if v52.PullAmount then
				local t3 = {}
				for i = 1, v52.PullAmount do
					local v62, v72
					if v52.NoRepeatItems then
						repeat
							v62 = v5.getRandomWeightedItem(v52.PullTable, v1 + v52.SeedOffset)
						until t3[v62] == nil
						t3[v62] = true
						v72 = v62
					else
						v72 = v5.getRandomWeightedItem(v52.PullTable, v1 + v52.SeedOffset)
					end
					storeRandomTackItem(v72, v52, v52.SeedOffset)
				end
				continue
			end
			for v9, v10 in v52.PullTable do
				storeRandomTackItem(v10, v52, v52.SeedOffset)
			end
			continue
		end
		if v52.ChoosePullTable then
			local t3 = {}
			local v11 = Random.new(v1 + v52.SeedOffset)
			local v12 = v52.ChoosePullTable[v11:NextInteger(1, #v52.ChoosePullTable)]
			if v52.PullAmount then
				for j = 1, v52.PullAmount do
					local v132 = nil
					if v52.NoRepeatItems then
						if #v12 < v52.PullAmount then
							warn((("PullAmount (%*) on NoRepeatItems for %* is greater than what\'s possible to uniquely return"):format(v52.PullAmount, v42)))
							for v14, v15 in v12 do
								t3[v15] = true
							end
						else
							repeat
								v132 = v12[v11:NextInteger(1, #v12)]
							until t3[v132] == nil
							t3[v132] = true
						end
					else
						v132 = v12[v11:NextInteger(1, #v12)]
					end
					storeRandomTackItem(v132, v52)
				end
				continue
			end
			for v16, v17 in v12 do
				storeRandomTackItem(v17, v52)
			end
			continue
		end
		storeRandomTackItem(v42, v52, v52.SeedOffset)
	end
	return t
end
function t.GetItemCapsuleItems(p1, p2, p3, p4, p5) --[[ GetItemCapsuleItems | Line: 208 | Upvalues: v7 (copy), v5 (copy), v4 (copy), determineTheme (copy) ]]
	local t = {}
	local t2 = {}
	local t3 = {}
	for v1, v2 in v7.RandomEquipmentDropThemes do
		v2.Name = v1
		table.insert(t, v2)
	end
	table.sort(t, function(p1, p2) --[[ Line: 219 ]]
		return p1.Name < p2.Name
	end)
	local t4 = {}
	if p4 then
		for v3, v42 in p1 do
			table.insert(t4, v42)
		end
	end
	for i = 1, p2 do
		local v52, v6
		if p4 then
			if #t4 == 0 then
				warn((("No more unique items available for %*"):format(p5 or "item capsule")))
				return t3
			end
			local v72 = v5.getRandomWeightedItem(t4, p3 + i)
			v52 = v72
			if v72 then
				t2[v72.Name] = true
				for v8, v9 in t4 do
					if v9.Name == v72.Name then
						table.remove(t4, v8)
						break
					end
				end
			end
		else
			v52 = v5.getRandomWeightedItem(p1, p3 + i)
		end
		if v52 then
			local v11 = v4.GetByName(v52.Name)
			v6 = if v11 and (v11.ItemType == "Equipment" and v52.Theme ~= nil) then determineTheme(v52, t, p3 + i * 98127) else nil
			table.insert(t3, {
				Item = v52,
				Theme = v6
			})
		end
	end
	return t3
end
function t.Init() --[[ Init | Line: 274 | Upvalues: RunService (copy), v10 (copy), v8 (copy), v2 (copy), v5 (copy), v13 (copy), TackPacks (copy), v7 (copy), v6 (copy), v4 (copy), determineTheme (copy), t (copy) ]]
	if not RunService:IsServer() then
		return
	end
	if v10 then
		for v1, v22 in v10 do
			if v22.OtherIds then
				for v3, v42 in v22.OtherIds do
					local v52 = v8.Copy(v22)
					v52.ProductId = v42.Id
					v2.AddDeveloperProduct(v42.Id, v52, "Lootbox")
				end
				continue
			end
			if v22.ProductId then
				v2.AddDeveloperProduct(v22.ProductId, v22, "Lootbox")
			end
		end
	end
	v2.AddProductHandler("CapsuleProducts", function(p1, p2) --[[ Line: 291 | Upvalues: v5 (ref), v13 (ref) ]]
		local Drops = p2.Drops
		local v1 = Drops[v5.getRandomWeightedItem(Drops, v13.CurrentSeed * 1500)]
		p1:GiveItem({
			ItemType = "Capsules",
			Amount = 1,
			Source = "RobuxPurchase",
			IgnoreLimit = true,
			Name = v1.Name
		})
		return {
			ItemType = "Capsules",
			ItemId = v1.Name
		}
	end)
	v2.AddProductHandler("EventCapsule", function(p1, p2) --[[ Line: 308 ]]
		for v1, v2 in p2.Rewards do
			p1:GiveItem({
				ItemType = "Capsules",
				Source = "RobuxPurchase",
				IgnoreLimit = true,
				Name = v2.Name,
				Amount = v2.Amount
			})
		end
		return {
			ItemType = "Capsules",
			ItemId = p2.Name
		}
	end)
	v2.AddProductHandler("TackProducts", function(p1, p2) --[[ Line: 322 | Upvalues: v13 (ref), v5 (ref), TackPacks (ref), v7 (ref), v6 (ref), v4 (ref), determineTheme (ref) ]]
		local CurrentSeed = v13.CurrentSeed
		local v1 = v5.getRandomWeightedItem(p2.Species, CurrentSeed)
		local t = {}
		for v3, v42 in v7.RandomEquipmentDropThemes do
			v42.Name = v3
			table.insert(t, v42)
		end
		table.sort(t, function(p1, p2) --[[ Line: 337 ]]
			return p1.Name < p2.Name
		end)
		local function GiveTackItem(p12, p22, p3) --[[ GiveTackItem | Line: 341 | Upvalues: v5 (ref), v6 (ref), v13 (ref), p2 (copy), p1 (copy), v4 (ref), determineTheme (ref), t (copy) ]]
			local v1 = if typeof(p22) == "table" then p22 else {
	Amount = p22
}
			local v2
			if p12 == "RandomEquipment" then
				v2 = v6[v5.getRandomWeightedItem(v6, v13.CurrentSeed + (if typeof(v1) == "table" then v1.SeedOffset or 0 else 0) + p2.ProductId)].Name
			else
				if p12 == "RandomFlair" then
					p1:GiveItem({
						Source = "RobuxPurchase",
						IgnoreLimit = true,
						Name = p12,
						Amount = v1.Amount
					})
					return
				end
				v2 = p12
			end
			local v42 = v4.GetByName(v2)
			if not v42 then
				warn("No item data found for", v2)
				return
			end
			p1:GiveItem({
				Source = "RobuxPurchase",
				IgnoreLimit = true,
				ItemType = v42.ItemType,
				Name = v42.Name,
				Amount = v1.Amount or 1,
				Theme = if v42.ItemType == "Equipment" and v1.Theme ~= nil then determineTheme(v1, t, v13.CurrentSeed) else nil
			})
		end
		for v52, v62 in TackPacks[v1] do
			if v62.PullTable then
				if v62.PullAmount then
					for i = 1, v62.PullAmount do
						GiveTackItem(v5.getRandomWeightedItem(v62.PullTable, CurrentSeed + v62.SeedOffset), v62, v62.SeedOffset)
					end
					break
				else
					for v72, v8 in v62.PullTable do
						GiveTackItem(v8, v62, v62.SeedOffset)
					end
					continue
				end
			end
			GiveTackItem(v52, v62, v62.SeedOffset)
		end
		return {
			ItemType = "Tack",
			ItemId = v1
		}
	end)
	v2.AddProductHandler("EventTack", function(p1, p2) --[[ Line: 411 | Upvalues: t (ref), v13 (ref) ]]
		local v2 = t.GetTackItems(p1, if p2 then p2.LootTable or p2 else p2, v13.CurrentSeed)
		if not v2 then
			return {
				ItemType = "Tack",
				ItemId = "EventTack"
			}
		end
		for v3, v4 in v2 do
			v4.Source = "RobuxPurchase"
			p1:GiveItem(v4)
		end
		return {
			ItemType = "Tack",
			ItemId = "EventTack"
		}
	end)
	v2.AddProductHandler("Lootbox", function(p1, p2, p3) --[[ Line: 428 | Upvalues: v4 (ref) ]]
		local v1 = 1
		if p2.OtherIds then
			for v2, v3 in p2.OtherIds do
				if v3.Id == p3 then
					v1 = v3.Amount or 1
					break
				end
			end
		end
		if p2.Items then
			for v42, v5 in p2.Items do
				local v6 = v5 * v1
				local v7 = v4.GetByName(v42)
				if v7 then
					p1:GiveItem({
						Source = "RobuxPurchase",
						IgnoreLimit = true,
						ItemType = v7.ItemType or "Capsules",
						Name = v42,
						Amount = v6
					})
				end
			end
		end
		return {
			ItemType = "Lootbox",
			ItemId = p2.Name
		}
	end)
end
t.Init()
return t