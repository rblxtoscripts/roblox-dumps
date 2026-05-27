-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TextService = game:GetService("TextService")
local v1 = RunService:IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("FormatNumber")
local v4 = Sonar("ItemDataService")
local v5 = Sonar("DataUtils")
local v6 = Sonar("MathUtils")
local v7 = Sonar("AnimalData")
local v8 = Sonar("RemoteUtils")
local v9 = Sonar("DisplayUtils")
local v10 = Sonar("LevelUtils")
local v11 = Sonar("MarketplaceUtils")
local v12 = Sonar("FormatString")
local v13 = Sonar("OriginBuffUtils")
local v14 = Sonar("Table")
local v15 = Sonar("AnalyticsService", "Server")
local v16 = Sonar("StorageUtils")
local v17 = Sonar("PlaceTypeService")
local v18 = Sonar("StableClubsManager", {
	Deferred = true
})
local v19 = Sonar("WeightedProbability")
local v20 = Sonar("NameUtils", {
	Deferred = true
})
local v21 = Sonar("PatternUtils", {
	Deferred = true
})
local v22 = Sonar("PaintUtils", {
	Deferred = true
})
local v23 = Sonar("CosmeticUtils", {
	Deferred = true
})
local v24 = Sonar("TailUtils", {
	Deferred = true
})
local v25 = Sonar("ManeUtils", {
	Deferred = true
})
local v26 = Sonar("ColorUtils", {
	Deferred = true
})
local v27 = Sonar("BreedUtils", {
	Deferred = true
})
local v28 = Sonar("SizeUtils", {
	Deferred = true
})
local v29 = Sonar("HornUtils", {
	Deferred = true
})
local v30 = Sonar("MutationUtils", {
	Deferred = true
})
local v31 = Sonar("TransparencyUtils", {
	Deferred = true
})
local v32 = Sonar("ReflectanceUtils", {
	Deferred = true
})
local v33 = Sonar("EarUtils", {
	Deferred = true
})
local v34 = Sonar("WhiskerUtils", {
	Deferred = true
})
local v35 = Sonar("StickerUtils", {
	Deferred = true
})
local v36 = Sonar("TimeFormat")
local v37 = Sonar("Constants")
local t2 = {
	January = 1,
	February = 2,
	March = 3,
	April = 4,
	May = 5,
	June = 6,
	July = 7,
	August = 8,
	September = 9,
	October = 10,
	November = 11,
	December = 12,
	Febuary = 2,
	Janurary = 1
}
local WildSpawnPresets = v37.WildSpawnPresets
local ResetDataValues = v37.ResetDataValues
local t3 = {}
local v38 = Sonar(v16.Get("UpgradeStats"))
local v39 = Sonar(v16.Get("ModifierData"))
local t4 = {
	Patterns = 0.15,
	Paints = 0.15,
	Cosmetics = 0.15,
	Age = function(p1, p2, p3) --[[ Age | Line: 70 ]]
		return 1
	end,
	Species = function(p1) --[[ Species | Line: 76 | Upvalues: t (copy) ]]
		local v1 = t.GetByName(p1.Species.Value)
		if v1 then
			return v1.PriceMultiplier or 1
		end
		warn("NO SPECIES DATA FOUND FOR " .. p1.Species.Value)
		return v1.PriceMultiplier or 1
	end,
	Skills = function(p1, p2) --[[ Skills | Line: 84 | Upvalues: v38 (copy) ]]
		return 1 / v38[p2].MaxLevel * p1.Upgrades[p2].Value
	end,
	Mutations = function(p1, p2) --[[ Mutations | Line: 87 | Upvalues: v30 (copy), v37 (copy) ]]
		local v1 = p1.Mutations[p2]
		local v2 = v30.GetMutation(v1.Value)
		if not v2 or v2.Name == "Nothing" then
			return 0
		end
		if v2.MaxLevel then
			return v37.MutationBasePriceMultipliers.Wings + 1 / v2.MaxLevel * v1.Level.Value
		else
			return v37.MutationBasePriceMultipliers.Default
		end
	end,
	EventSpecies = function(p1) --[[ EventSpecies | Line: 101 | Upvalues: v37 (copy) ]]
		if v37.CurrentEvent and table.find(v37.CurrentEvent.SellSpecies, p1.Species.Value) then
			return v37.CurrentEvent.SellAmountReduction
		else
			return 0
		end
	end
}
local t5 = { "Patterns", "Paints", "Cosmetics" }
local v40 = Sonar(v16.Get("StorageSlots"))
local v41 = Sonar(v16.Get("EquipSlots"))
local v42 = Sonar(v16.Get("Pedigree"))
local ScaleMultiplier = v4.GetByName("MiniPotion").ScaleMultiplier
local Animals = ReplicatedStorage.Storage.Animals
local ReplicatedObjectModels = ReplicatedStorage.Storage.Assets.ReplicatedObjectModels
local v43 = nil
local function filterText(p1, p2, p3) --[[ filterText | Line: 129 | Upvalues: v12 (copy), TextService (copy) ]]
	return TextService:FilterStringAsync(v12.trimString(v12.trimString(p2, p3), p3), p1.UserId, Enum.TextFilterContext.PublicChat):GetNonChatStringForUserAsync(p1.UserId)
end
function t.GetByName(p1) --[[ GetByName | Line: 137 | Upvalues: t3 (copy) ]]
	return t3[p1]
end
function t.GetAll() --[[ GetAll | Line: 141 | Upvalues: t3 (copy) ]]
	return t3
end
function t.GetAllArray() --[[ GetAllArray | Line: 145 ]]
	return ANIMALS_ARRAY
end
function t.GetAllByRarity(p1) --[[ GetAllByRarity | Line: 149 ]]
	return ANIMALS_BY_RARITY[p1]
end
function t.GetCustomName(p1) --[[ GetCustomName | Line: 153 ]]
	return if #p1.CustomName.Value > 0 then p1.CustomName.Value or "Horse" else "Horse"
end
function t.GetGender(p1) --[[ GetGender | Line: 158 ]]
	local Gender = p1.Gender.Value
	return if Gender == "Male" or (Gender == "Female" or Gender == "Both") then if Gender then Gender else "Male" else "Male"
end
function t.GetOrigin(p1) --[[ GetOrigin | Line: 163 ]]
	return p1.Origin.Value
end
function t.GetAge(p1) --[[ GetAge | Line: 167 ]]
	local Age = p1.Age.Value
	if Age < 33 then
		return "Baby"
	end
	if Age >= 33 and Age < 66 then
		return "Teen"
	end
	if Age >= 66 then
		return "Adult"
	end
end
function t.IsFoal(p1) --[[ IsFoal | Line: 178 ]]
	return (if type(p1) == "number" and p1 then p1 elseif p1:WaitForChild("Age", 2) then p1:WaitForChild("Age", 2).Value or 1 else 1) <= 44
end
function t.IsToyHorse(p1) --[[ IsToyHorse | Line: 188 | Upvalues: t (copy) ]]
	local v1 = t.GetByName(p1.Species.Value)
	return if v1 then v1.ToyHorse == true else v1
end
function t.PlayerHasLegoHorseEquipped(p1) --[[ PlayerHasLegoHorseEquipped | Line: 193 | Upvalues: v2 (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	local v22
	if v1 then
		local v3 = false
		for v4, v5 in v1:GetItemFolder("Animals"):GetChildren() do
			if v5.Equipped.Value then
				v3 = v5.Species.Value == "Horlse"
				if v3 then
					break
				end
			end
		end
		v22 = v3
	else
		v22 = false
	end
	return v22
end
function t.GetSerialNumber(p1) --[[ GetSerialNumber | Line: 219 ]]
	local t = {}
	for v1 in p1.Serial.Value:gmatch("[^:]+") do
		table.insert(t, v1)
	end
	return tonumber(t[3])
end
function t.GetPedigree(p1) --[[ GetPedigree | Line: 227 | Upvalues: t (copy), v42 (copy) ]]
	local v1 = t.GetSerialNumber(p1)
	local v2 = v42.Pedigrees.Special[v1]
	if not v2 then
		for k, v in pairs(v42.TiersInOrder) do
			if type(v.Amount) == "number" then
				if v.Amount == v1 then
					v2 = v
				end
				continue
			end
			if tonumber(v.Amount.Min) <= v1 and v1 <= tonumber(v.Amount.Max) then
				v2 = v
			end
		end
	end
	return v1, v2
end
function t.GetMaxMutationSlots(p1) --[[ GetMaxMutationSlots | Line: 247 | Upvalues: t (copy), v37 (copy) ]]
	if t.IsToyHorse(p1) then
		return 1
	end
	return v37.MaxMutationSlots + (if p1.Eldering.Completed.Value then 1 else 0)
end
function t.GetSize(p1) --[[ GetSize | Line: 254 | Upvalues: v28 (copy) ]]
	return v28.GetSize(p1.SizeType.Value)
end
function t.GetTraits() --[[ GetTraits | Line: 258 ]]
	local t = {}
	for i = 1, math.random(0, 5) do
		table.insert(t, true)
	end
	return t
end
function t.GetTraitFromSpecies(p1, p2) --[[ GetTraitFromSpecies | Line: 266 ]]
	for k, v in pairs(p1.Traits) do
		if v[p2] then
			return v[p2]
		end
	end
end
function t.GetTrait(p1, p2) --[[ GetTrait | Line: 274 | Upvalues: v43 (ref) ]]
	if p2 then
		if v43[p2] then
			return v43[p2](p1)
		end
	else
		for k, v in pairs(v43) do
			local v1 = v(p1)
			if v1 then
				return v1
			end
		end
	end
end
function t.GetPriceChangeValues(p1, p2) --[[ GetPriceChangeValues | Line: 288 | Upvalues: t5 (copy), v14 (copy) ]]
	local t = {}
	for k, v in pairs({ "Species", "Age" }) do
		if p2 then
			t[v] = p1[v]
			continue
		end
		table.insert(t, p1[v])
	end
	for k, v in pairs(p1:WaitForChild("Upgrades"):GetChildren()) do
		if p2 then
			if not t.Skills then
				t.Skills = {}
			end
			table.insert(t.Skills, v)
			continue
		end
		table.insert(t, v)
	end
	for k, v in pairs(p1:WaitForChild("Mutations"):GetChildren()) do
		if p2 then
			if not t.Mutations then
				t.Mutations = {}
			end
			table.insert(t.Mutations, v)
			continue
		end
		table.insert(t, v)
		table.insert(t, v:WaitForChild("Level"))
	end
	for k, v in pairs(t5) do
		if p2 then
			t[v] = p1[v]:GetChildren()
			continue
		end
		v14.MergeOriginalLists(t, p1[v]:GetChildren())
	end
	return t
end
function t.FormatPriceAttribute(p1, p2, p3) --[[ FormatPriceAttribute | Line: 332 | Upvalues: v30 (copy), t (copy), v9 (copy), v12 (copy), v38 (copy) ]]
	local v1 = if p3 then v30.GetMutation(p3.Value) else p3
	local v2 = t.GetTrait(p1, p2) or v1
	local v3, v4, v5
	if v2 then
		v3 = v9.GetDisplayName(v2.Name, v2)
		if not v3 and p2 == "EventSpecies" then
			v3 = "Event Special"
		elseif not v3 then
			v4 = v12.separateWordsInString
			v5 = if type(p1) == "number" then if p2 then p2 else p1 else p1
			v3 = v4(v5)
		end
	elseif p2 == "EventSpecies" then
		v3 = "Event Special"
	else
		v4 = v12.separateWordsInString
		v5 = if type(p1) == "number" then if p2 then p2 else p1 else p1
		v3 = v4(v5)
	end
	if v1 and v1.MaxLevel then
		return v3 .. " (Level " .. p3.Level.Value .. ")"
	end
	if v38[p1] then
		return v3 .. " (Level " .. p3.Value .. ")"
	else
		return v3
	end
end
function t.FormatAttributeName(p1, p2) --[[ FormatAttributeName | Line: 349 | Upvalues: t (copy), v9 (copy), v12 (copy) ]]
	local v1 = t.GetTrait(p1, p2)
	local v2, v3, v4
	if v1 then
		v2 = v9.GetDisplayName(v1.Name, v1)
		if not v2 then
			v3 = v12.separateWordsInString
			v4 = if type(p1) == "number" then if p2 then p2 else p1 else p1
			v2 = v3(v4)
		end
	else
		v3 = v12.separateWordsInString
		v4 = if type(p1) == "number" then if p2 then p2 else p1 else p1
		v2 = v3(v4)
	end
	return v2
end
function t.GetPriceForAttribute(p1, p2, p3, p4) --[[ GetPriceForAttribute | Line: 355 | Upvalues: t4 (copy), t5 (copy), v37 (copy) ]]
	local v1 = if p4 then p4 else {}
	local v2 = t4[p1]
	if not v2 then
		return 0
	end
	if table.find(t5, p1) and (p3 and (not p2[p1][p3].Value or v1[p3])) then
		return 0
	end
	return math.ceil(v37.BASE_HORSE_PRICE * (type(v2) == "function" and v2(p2, p3, v1[p1]) or v2))
end
function t.GetPriceForSlot(p1, p2) --[[ GetPriceForSlot | Line: 370 | Upvalues: t (copy), t5 (copy) ]]
	local v2 = p2 or {}
	local t2 = {}
	local sum = 0
	local function addAttribute(p12, p2) --[[ addAttribute | Line: 376 | Upvalues: t (ref), p1 (copy), v2 (ref), sum (ref), t2 (copy) ]]
		if p2 == "Nothing" then
			return
		end
		local v1 = t.GetPriceForAttribute(p12, p1, p2, v2)
		if v1 == 0 then
			return
		end
		sum = sum + v1
		if not p2 then
			t2[p12] = v1
			return
		end
		if not t2[p12] then
			t2[p12] = {}
		end
		t2[p12][p2] = v1
	end
	local v3 = t.GetPriceForAttribute("Species", p1, nil, v2)
	if v3 ~= 0 then
		sum = sum + v3
		t2.Species = v3
	end
	local v4 = t.GetPriceForAttribute("Age", p1, nil, v2)
	if v4 ~= 0 then
		sum = sum + v4
		t2.Age = v4
	end
	local v5 = t.GetPriceForAttribute("EventSpecies", p1, nil, v2)
	if v5 ~= 0 then
		sum = sum + v5
		t2.EventSpecies = v5
	end
	for k, v in pairs(p1.Upgrades:GetChildren()) do
		addAttribute("Skills", v.Name)
	end
	for k, v in pairs(p1.Mutations:GetChildren()) do
		addAttribute("Mutations", v.Name)
	end
	for k, v in pairs(t5) do
		for k2, v6 in pairs(p1[v]:GetChildren()) do
			addAttribute(v, v6.Name)
		end
	end
	return math.round(sum), t2
end
function t.GetTotalTraits(p1) --[[ GetTotalTraits | Line: 413 | Upvalues: t (copy), t5 (copy) ]]
	local count = 0
	local t2 = {}
	local function addAttribute(p12, p2) --[[ addAttribute | Line: 416 | Upvalues: t (ref), p1 (copy), count (ref), t2 (copy) ]]
		if p2 == "Nothing" then
			return
		end
		if t.GetPriceForAttribute(p12, p1, p2) <= 0 then
			return
		end
		count = count + 1
		if not t2[p12] then
			t2[p12] = 0
		end
		t2[p12] = t2[p12] + 1
	end
	for k, v in pairs(t5) do
		for k2, v2 in pairs(p1[v]:GetChildren()) do
			local v1 = v2.Name
			if v1 ~= "Nothing" and not (t.GetPriceForAttribute(v, p1, v1) <= 0) then
				count = count + 1
				if not t2[v] then
					t2[v] = 0
				end
				t2[v] = t2[v] + 1
			end
		end
	end
	for k, v in pairs(p1.MiscCosmetics:GetChildren()) do
		if v.Value ~= "Nothing" and not (#v.Value <= 0) then
			count = count + 1
			if not t2.MiscCosmetics then
				t2.MiscCosmetics = 0
			end
			t2.MiscCosmetics = t2.MiscCosmetics + 1
		end
	end
	count = count + 1
	return count, t2
end
function t.GetTotalMutations(p1) --[[ GetTotalMutations | Line: 450 ]]
	local count = 0
	for k, v in pairs(p1.Mutations:GetChildren()) do
		if not (#v.Value <= 0) and v.Value ~= "Nothing" then
			count = count + 1
		end
	end
	return count, #p1.Mutations:GetChildren()
end
function t.GetMutationOfType(...) --[[ GetMutationOfType | Line: 460 | Upvalues: v30 (copy) ]]
	return v30.GetMutationOfType(...)
end
local t6 = {
	CoatBottom = true,
	CoatTop = true,
	Hair = true,
	Hoof = true,
	Nose = true,
	Paint = true,
	Pattern = true,
	Sock = true,
	Keratin = true
}
local function v44(p1, p2, p3) --[[ copySlots | Line: 477 | Upvalues: v44 (copy) ]]
	for k, v in pairs(p1:GetChildren()) do
		local v1 = p3[v.Name]
		if v1 == nil then
			v1 = p3[v.Name .. v.Parent.Name]
		end
		if v1 == nil then
			local v2 = p2:FindFirstChild(v.Name)
			if v2 then
				if v:IsA("Folder") and v2:IsA("Folder") then
					v44(v, v2, p3)
					continue
				end
				if v:IsA("ValueBase") and v2:IsA("ValueBase") then
					v2.Value = v.Value
				end
			end
		end
	end
end
function t.RandomizeMaterials(p1, p2, p3) --[[ RandomizeMaterials | Line: 502 | Upvalues: v27 (copy) ]]
	local v1 = v27.GetRandomMaterial("All", p2, p3)
	local v2 = v27.GetRandomMaterial("Hoof", p2, p3)
	local v3 = v27.GetRandomMaterial("Nose", p2, p3)
	local v4 = v27.GetRandomMaterial("Paint", p2, p3)
	local v5 = v27.GetRandomMaterial("Keratin", p2, p3)
	local v6 = v27.GetRandomMaterial("Pattern", p2, p3)
	local v7 = v27.GetRandomMaterial("Hair", p2, p3)
	for v8, v9 in p1 do
		local v10 = if v9.Name == "Hoof" then true else false
		local v11 = if v9.Name == "Nose" then true else false
		local v12 = if v9.Name == "Paint" then true else false
		local v13 = if v9.Name == "Keratin" then true else false
		local v14 = if v9.Name == "Pattern" then true else false
		local v15 = if v9.Name == "Hair" then true else false
		if if v11 then v11 elseif v10 then v10 elseif v12 then v12 elseif v13 then v13 elseif v14 then v14 else v15 then
			if v10 then
				v9.Value = v2
				continue
			end
			if v11 then
				v9.Value = v3
				continue
			end
			if v12 then
				v9.Value = v4
				continue
			end
			if v13 then
				v9.Value = v5
				continue
			end
			if v15 then
				v9.Value = v7
				continue
			end
			if v14 then
				v9.Value = v6
			end
			continue
		end
		v9.Value = v1
	end
end
function t.CreateSlot(p1, p2, p3, p4) --[[ CreateSlot | Line: 541 | Upvalues: v5 (copy), v37 (copy), t (copy) ]]
	local v2 = v5.CreateIndexedDataValue(if p4 then p4 else p1:GetItemFolder("Animals"), nil, not p2.DoNotParent)
	local v3 = if p2 then p2 else {}
	local v4
	if v3.Species == "Random" then
		v3.Species = v37.AnySpeciesTable[Random.new():NextInteger(1, #v37.AnySpeciesTable)]
		v4 = v3
	else
		local Species = v3.Species
		if Species then
			v4 = v3
		elseif p3 then
			Species = p3.Species.Value
			if Species then
				v4 = v3
			else
				v4 = v3
				Species = "Horse"
			end
		else
			v4 = v3
			Species = "Horse"
		end
		v4.Species = Species
	end
	if type(v4.Species) == "table" then
		v4.Species = v4.Species[1]
	end
	local v6 = p1.PlayerData.BreedCounts[v4.Species]
	local Age = v4.Age
	if not Age then
		local v7
		if p3 then
			Age = p3.Age.Value
			if not Age then
				v7 = v4.Age or 1
				Age = math.max(v7, 1)
			end
		else
			v7 = v4.Age or 1
			Age = math.max(v7, 1)
		end
	end
	v4.Age = Age
	local v8 = not v4.IncrementSerial and (if p3 then if #p3.Serial.Value > 0 then p3.Serial.Value else false else p3)
	v4.Serial = if v8 then v8 else p1.Player.UserId .. ":" .. v6.Name .. ":" .. v6.Value + 1 .. ":" .. p1.PlayerData.Stats.TotalHorses.Value
	v4.Preset = v4.Preset or nil
	if type(v4.Preset) == "function" then
		v4.Preset = v4.Preset()
	end
	if type(v4.Preset) == "table" then
		if #v4.Preset > 0 then
			v4.Preset = v4.Preset[(typeof(v4.Seed) == "Random" and v4.Seed or (v4.Seed and Random.new(v4.Seed) or Random.new())):NextInteger(1, #v4.Preset)]
		else
			v4.Preset = nil
		end
	end
	local v11 = v4.Gender and v4.Gender ~= "" and v4.Gender or nil
	local v12 = if p3 then if p3.Gender.Value == "" then false else p3.Gender.Value else p3
	v4.Gender = if v11 then v11 elseif v12 then v12 elseif (if v4.Seed then if typeof(v4.Seed) == "Random" then v4.Seed else Random.new(v4.Seed) else Random.new()):NextNumber(0, 1) <= 0.6 then "Male" else "Female"
	v4.TimeReceived = math.floor((workspace:GetServerTimeNow()))
	if not v4.DoNotIncrementCount or v4.IncrementSerial then
		if not v8 then
			v6.Value = v6.Value + 1
		end
		local TotalHorses = p1.PlayerData.Stats.TotalHorses
		TotalHorses.Value = TotalHorses.Value + 1
	end
	v4.Origin = p3 and p3.Origin.Value or (v4.Origin or "Wild")
	v4.UpdatedMutations = true
	v4.UpliftedWings = if v4.Species == "Peryton" then true else false
	t.UpdateSlot(v2, v4, v4.Preset, p3)
	return v2
end
function t.UpdateSlot(p1, p2, p3, p4) --[[ UpdateSlot | Line: 615 | Upvalues: t (copy), v44 (copy), v20 (copy), v4 (copy), v13 (copy), WildSpawnPresets (copy), v37 (copy), t6 (copy), v26 (copy), v28 (copy), v31 (copy), v32 (copy), v27 (copy), v30 (copy), v19 (copy), v38 (copy), v10 (copy) ]]
	local v1 = p2.Species or "Horse"
	p1.Species.Value = v1
	for k, v in pairs(p1:GetDescendants()) do
		local v2 = p2[v.Name]
		if v2 == nil then
			v2 = p2[v.Name .. v.Parent.Name]
		end
		if v2 == nil then
			t.ResetValue(v)
			continue
		end
		v.Value = v2
	end
	if p4 then
		for v3, v42 in { "Cosmetics", "Patterns", "Paints" } do
			for k, v in pairs(p4[v42]:GetChildren()) do
				if v.Value then
					local v5 = p1[v42]:FindFirstChild(v.Name) or v:Clone()
					v5.Value = true
					v5.Parent = p1[v42]
				end
			end
		end
		for k, v in pairs(p4.Mutations:GetChildren()) do
			if not p1.Mutations:FindFirstChild(v.Name) then
				v:Clone().Parent = p1.Mutations
			end
		end
		v44(p4, p1, p2)
		p1.CustomName.Value = v20.GetRandomName()
		local v6 = v4.GetByName(p1.Species.Value)
		if not (v6 and v6.Infertile) then
			return
		end
	else
		p1.UpliftedWings.Value = if v1 == "Peryton" then true else false
		p1.CustomName.Value = v20.GetRandomName()
		p1.Origin.Value = p2.Origin
		p1.OriginBuff.Value = p2.OriginBuff or v13.GetRandomType(p2.Origin, p2.Seed) or ""
		if p2 and p2.Origin ~= "Bred" then
			local v9 = v4.GetByName(p1.Species.Value)
			local Seed = p2.Seed
			local count = 0
			local function getOffsetSeed(p1) --[[ getOffsetSeed | Line: 668 | Upvalues: Seed (copy), count (ref) ]]
				if not Seed then
					return nil
				end
				count = count + 1
				if typeof(Seed) == "Random" then
					return Seed:NextInteger(1, 1000000) + count + (p1 or 0)
				else
					return Seed + count + (p1 or 0)
				end
			end
			local v102 = type(p3) == "function" and p3() or p3
			local CustomPreset = p2.CustomPreset
			if not CustomPreset then
				local v11, v12
				if v102 then
					CustomPreset = WildSpawnPresets.Presets[v102]
					if not CustomPreset and p2.NoPreset then
						CustomPreset = {}
						if not CustomPreset then
							v11 = WildSpawnPresets.GetRandomPreset
							if Seed then
								count = count + 1
								v12 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + 0 else Seed + count + 0
							else
								v12 = nil
							end
							CustomPreset = v11(v12)
						end
					elseif not CustomPreset then
						v11 = WildSpawnPresets.GetRandomPreset
						if Seed then
							count = count + 1
							v12 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + 0 else Seed + count + 0
						else
							v12 = nil
						end
						CustomPreset = v11(v12)
					end
				elseif p2.NoPreset then
					CustomPreset = {}
					if not CustomPreset then
						v11 = WildSpawnPresets.GetRandomPreset
						if Seed then
							count = count + 1
							v12 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + 0 else Seed + count + 0
						else
							v12 = nil
						end
						CustomPreset = v11(v12)
					end
				else
					v11 = WildSpawnPresets.GetRandomPreset
					if Seed then
						count = count + 1
						v12 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + 0 else Seed + count + 0
					else
						v12 = nil
					end
					CustomPreset = v11(v12)
				end
			end
			local t2 = {}
			local v132 = p2.MaxCosmetics or v37
			if v9 and v9.MaxTraits then
				local Pattern = v9.MaxTraits.Pattern
				local Paint = v9.MaxTraits.Paint
				local Cosmetic = v9.MaxTraits.Cosmetic
				local t3 = {}
				t3.MaxPatternsPerSlot = Pattern and math.min(Pattern, v132.MaxPatternsPerSlot or Pattern) or v132.MaxPatternsPerSlot
				t3.MaxPaintsPerSlot = Paint and math.min(Paint, v132.MaxPaintsPerSlot or Paint) or v132.MaxPaintsPerSlot
				t3.MaxCosmeticsPerSlot = Cosmetic and math.min(Cosmetic, v132.MaxCosmeticsPerSlot or Cosmetic) or v132.MaxCosmeticsPerSlot
				t3.AlwaysMax = v132.AlwaysMax
				t3.Patterns = v132.Patterns
				t3.Paints = v132.Paints
				t3.Cosmetics = v132.Cosmetics
				v132 = t3
			end
			local v202
			if typeof(Seed) == "Random" and Seed then
				v202 = Seed
			elseif Seed then
				local v21 = Random.new
				local v22
				if Seed then
					count = count + 1
					v22 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + 0 else Seed + count + 0
				else
					v22 = nil
				end
				v202 = v21(v22) or Random.new()
			else
				v202 = Random.new()
			end
			for v23, v24 in CustomPreset do
				if typeof(v24) == "table" and (v23 ~= "Eye" and (v23 ~= "Paints" and (v23 ~= "Cosmetics" and (v23 ~= "Patterns" and v23 ~= "MiscCosmetics")))) then
					t2[v23] = v24[v202:NextInteger(1, #v24)]
				end
			end
			for v272, v282 in p1.Colors:GetChildren() do
				local v25, v262
				local v29 = t2[v282.Name]
				if t6[v282.Name] or v29 then
					local v302, v312
					if v29 then
						v25 = v29.Color
						if not v25 then
							v302 = v26.GetRandomColor
							v312 = v272 - 1
							if Seed then
								count = count + 1
								v262 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + (v312 or 0) else Seed + count + (v312 or 0)
							else
								v262 = nil
							end
							v25 = v302(v262).Color
						end
					else
						v302 = v26.GetRandomColor
						v312 = v272 - 1
						if Seed then
							count = count + 1
							v262 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + (v312 or 0) else Seed + count + (v312 or 0)
						else
							v262 = nil
						end
						v25 = v302(v262).Color
					end
					v282.Value = v25
				end
			end
			if v9.ToyHorse then
				p1.SizeType.Value = "Normal"
			else
				local v322, v33, v34
				if p2.Sizes and type(p2.Sizes) == "table" then
					v322 = p2.Sizes[v202:NextInteger(1, #p2.Sizes)]
					if not v322 then
						v33 = v28.GetRandomSize
						if Seed then
							count = count + 1
							v34 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + 0 else Seed + count + 0
						else
							v34 = nil
						end
						v322 = v33(v34)
					end
				else
					v33 = v28.GetRandomSize
					if Seed then
						count = count + 1
						v34 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + 0 else Seed + count + 0
					else
						v34 = nil
					end
					v322 = v33(v34)
				end
				p1.SizeType.Value = v322
			end
			local v35
			if v9.Transparency then
				local v36
				if Seed then
					count = count + 1
					v36 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + 0 else Seed + count + 0
				else
					v36 = nil
				end
				v35 = v31.GetRandomTransparency(v36) or ""
			else
				v35 = ""
			end
			p1.Transparency.Value = v35
			local v372
			if v9.Reflectance then
				local v382
				if Seed then
					count = count + 1
					v382 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + 0 else Seed + count + 0
				else
					v382 = nil
				end
				v372 = v32.GetRandomReflectance(v382) or ""
			else
				v372 = ""
			end
			p1.Reflectance.Value = v372
			if p1.Colors.Eye.Value == "" then
				if p2.EyeColor then
					p1.Colors.Eye.Value = type(p2.EyeColor) == "table" and p2.EyeColor[v202:NextInteger(1, #p2.EyeColor)] or p2.Eye
				elseif CustomPreset and CustomPreset.Eye then
					p1.Colors.Eye.Value = CustomPreset.Eye[v202:NextInteger(1, #CustomPreset.Eye)]
				else
					local v40
					if Seed then
						count = count + 1
						v40 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + 0 else Seed + count + 0
					else
						v40 = nil
					end
					p1.Colors.Eye.Value = v27.GetRandomEye(v40)
				end
			end
			local v41 = p1.Materials:GetChildren()
			local v43
			if Seed then
				count = count + 1
				v43 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + 0 else Seed + count + 0
			else
				v43 = nil
			end
			t.RandomizeMaterials(v41, v1, v43)
			if not p2.NoPatterns then
				for i = 1, v132.MaxPatternsPerSlot do
					local v442, v45, v46, v47, v48
					local function rollPattern(p1, p2) --[[ rollPattern | Line: 757 | Upvalues: i (copy), Seed (copy), count (ref), v27 (ref), v1 (copy) ]]
						local v12 = i - 1 + (p2 or 0)
						local v2
						if Seed then
							count = count + 1
							v2 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + (v12 or 0) else Seed + count + (v12 or 0)
						else
							v2 = nil
						end
						return v27.GetRandomPattern(v1, v2, p1)
					end
					if v132.AlwaysMax then
						local sum = 0
						repeat
							local v49
							sum = sum + 10
							local v51 = i - 1 + (sum or 0)
							if Seed then
								count = count + 1
								v49 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + (v51 or 0) else Seed + count + (v51 or 0)
							else
								v49 = nil
							end
							v442 = v27.GetRandomPattern(v1, v49, CustomPreset.Patterns or v37.Patterns[v1].Patterns)
							v45 = p1.Patterns:FindFirstChild(v442)
						until v442 ~= "Nothing" and not v45
						v46 = v45
						v47 = v442
					else
						local v52 = i - 1 + 0
						if Seed then
							count = count + 1
							v48 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + (v52 or 0) else Seed + count + (v52 or 0)
						else
							v48 = nil
						end
						local v53 = v27.GetRandomPattern(v1, v48, CustomPreset.Patterns)
						v46, v47 = p1.Patterns:FindFirstChild(v53), v53
					end
					if not v46 and v47 ~= "Nothing" then
						local v55 = Instance.new("BoolValue")
						v55.Name = v47
						v55.Value = true
						v55.Parent = p1.Patterns
					end
				end
			end
			if not p2.NoPaints then
				for j = 1, v132.MaxPaintsPerSlot do
					local v56, v57, v58, v59, v60
					local function rollPaints(p1, p2) --[[ rollPaints | Line: 789 | Upvalues: j (copy), Seed (copy), count (ref), v27 (ref), v1 (copy) ]]
						local v12 = j - 1 + (p2 or 0)
						local v2
						if Seed then
							count = count + 1
							v2 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + (v12 or 0) else Seed + count + (v12 or 0)
						else
							v2 = nil
						end
						return v27.GetRandomPaint(v1, v2, p1)
					end
					if v132.AlwaysMax then
						local sum = 0
						repeat
							local v61
							sum = sum + 10
							local v63 = j - 1 + (sum or 0)
							if Seed then
								count = count + 1
								v61 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + (v63 or 0) else Seed + count + (v63 or 0)
							else
								v61 = nil
							end
							v56 = v27.GetRandomPaint(v1, v61, CustomPreset.Paints or v37.Paints[v1].Paints)
							v57 = p1.Paints:FindFirstChild(v56)
						until v56 ~= "Nothing" and not v57
						v58 = v57
						v59 = v56
					else
						local v64 = j - 1 + 0
						if Seed then
							count = count + 1
							v60 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + (v64 or 0) else Seed + count + (v64 or 0)
						else
							v60 = nil
						end
						local v65 = v27.GetRandomPaint(v1, v60, CustomPreset.Paints)
						v58, v59 = p1.Paints:FindFirstChild(v65), v65
					end
					if not v58 and v59 ~= "Nothing" then
						local v67 = Instance.new("BoolValue")
						v67.Name = v59
						v67.Value = true
						v67.Parent = p1.Paints
					end
				end
			end
			if not p2.NoCosmetics then
				for k = 1, v132.MaxCosmeticsPerSlot do
					local v68, v69, v70, v71, v72
					local function rollCosmetic(p1, p2) --[[ rollCosmetic | Line: 822 | Upvalues: k (copy), Seed (copy), count (ref), v27 (ref), v1 (copy) ]]
						local v12 = k - 1 + (p2 or 0)
						local v2
						if Seed then
							count = count + 1
							v2 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + (v12 or 0) else Seed + count + (v12 or 0)
						else
							v2 = nil
						end
						return v27.GetRandomCosmetic(v1, v2, p1)
					end
					if v132.AlwaysMax then
						local sum = 0
						repeat
							local v73
							sum = sum + 10
							local v75 = k - 1 + (sum or 0)
							if Seed then
								count = count + 1
								v73 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + (v75 or 0) else Seed + count + (v75 or 0)
							else
								v73 = nil
							end
							v68 = v27.GetRandomCosmetic(v1, v73, CustomPreset.Cosmetics or v37.Cosmetics[v1].Cosmetics)
							v69 = p1.Cosmetics:FindFirstChild(v68)
						until v68 ~= "Nothing" and not v69
						v70 = v69
						v71 = v68
					else
						local v76 = k - 1 + 0
						if Seed then
							count = count + 1
							v72 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + (v76 or 0) else Seed + count + (v76 or 0)
						else
							v72 = nil
						end
						local v77 = v27.GetRandomCosmetic(v1, v72, CustomPreset.Cosmetics)
						v70, v71 = p1.Cosmetics:FindFirstChild(v77), v77
					end
					if not v70 and v71 ~= "Nothing" then
						local v79 = Instance.new("BoolValue")
						v79.Name = v71
						v79.Value = true
						v79.Parent = p1.Cosmetics
					end
				end
			end
			if not v9.ToyHorse then
				local v80
				if Seed then
					count = count + 1
					v80 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + 0 else Seed + count + 0
				else
					v80 = nil
				end
				local v81 = v30.GetRandomMutationSlots(p1, v80, p2.MutationSlotChances, p2.TotalMutationSlots)
				if not p2.NoMutations then
					if #v81 > 0 then
						if p2.AlwaysHasWings then
							local v83
							if Seed then
								count = count + 1
								v83 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + 0 else Seed + count + 0
							else
								v83 = nil
							end
							v81[1].Value = v30.GetRandomMutation(p1, v83, {
								MutationTypeToRoll = "Wings",
								MutationChances = {
									Nothing = 0
								},
								IgnoreWingWhitelist = p2.IgnoreWingWhitelist
							})
							table.remove(v81, 1)
						end
						if p2.MutationsToGuarantee then
							for v85, v86 in p2.MutationsToGuarantee do
								local v84
								if not (#v81 <= 0) then
									if Seed then
										count = count + 1
										v84 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + 0 else Seed + count + 0
									else
										v84 = nil
									end
									v81[1].Value = v30.GetRandomMutation(p1, v84, {
										MutationNameToRoll = v85,
										MutationChances = {
											Nothing = 0
										},
										IgnoreWingWhitelist = p2.IgnoreWingWhitelist
									})
									table.remove(v81, 1)
								end
							end
						end
						if p2.MutationGroupsToGuarantee then
							for v90, v91 in p2.MutationGroupsToGuarantee do
								local v88, v89
								if not (#v81 <= 0) then
									local t3 = {}
									for v92, v93 in v91 do
										if typeof(v93) == "number" then
											t3[v92] = {
												P = v93
											}
											continue
										end
										t3[v92] = v93
									end
									if Seed then
										count = count + 1
										v88 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + 0 else Seed + count + 0
									else
										v88 = nil
									end
									local v94 = v19.getRandomWeightedItem(t3, v88)
									if v94 then
										if Seed then
											count = count + 1
											v89 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + 0 else Seed + count + 0
										else
											v89 = nil
										end
										v81[1].Value = v30.GetRandomMutation(p1, v89, {
											MutationNameToRoll = v94,
											MutationChances = {
												Nothing = 0
											},
											IgnoreWingWhitelist = p2.IgnoreWingWhitelist
										})
										table.remove(v81, 1)
									end
								end
							end
						end
					end
					for n = 1, #v81 do
						local v96
						if Seed then
							count = count + 1
							v96 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + 0 else Seed + count + 0
						else
							v96 = nil
						end
						v81[n].Value = v30.GetRandomMutation(p1, v96, p2)
					end
				end
			end
			local v98 = p2.MiscCosmeticsToGive or {}
			local GetRandomMiscCosmetics = v27.GetRandomMiscCosmetics
			local v100
			if Seed then
				count = count + 1
				v100 = if typeof(Seed) == "Random" then Seed:NextInteger(1, 1000000) + count + 0 else Seed + count + 0
			else
				v100 = nil
			end
			local v101, v1022, v103, v104, v105, v106 = GetRandomMiscCosmetics(v1, v100, { CustomPreset.Horns, CustomPreset.Tails, CustomPreset.Manes }, {
				Horn = p2.AlwaysGiveHorn
			}, {
				Sticker = p2.AlwaysGiveSticker
			})
			p1.MiscCosmetics.Tail.Value = v98.Tail or v101.Name
			p1.MiscCosmetics.Mane.Value = v98.Mane or v1022.Name
			p1.MiscCosmetics.Horn.Value = v98.Horn or v103.Name
			p1.MiscCosmetics.Ear.Value = v98.Ears or v104.Name
			p1.MiscCosmetics.Whisker.Value = v98.Whiskers or v105.Name
			p1.MiscCosmetics.Sticker.Value = v98.Sticker or v106.Name
			if p2.SkillLevels then
				for k, v in pairs(p1.Upgrades:GetChildren()) do
					local v113 = p2.SkillLevels[v.Name] or p2.SkillLevels.All
					if v113 then
						v.Value = math.floor(v38[v.Name].MaxLevel * v113)
						v.Experience.Value = v10.GetRequiredExperience(v.Value)
					end
				end
			end
			if v9.ToyHorse or v9.Infertile then
				p1.Infertile.Value = true
			end
		end
		local v115 = v4.GetByName(p1.Species.Value)
		if not (v115 and v115.Infertile) then
			return
		end
	end
	p1.Infertile.Value = true
end
function t.GetBirthTimeLeft(p1, p2) --[[ GetBirthTimeLeft | Line: 956 | Upvalues: t (copy) ]]
	local v1 = workspace:GetServerTimeNow()
	return p2.LastBreed.Value + t.GetBreedCooldown(p1, p2) - v1
end
function t.GetBreedCooldown(p1, p2) --[[ GetBreedCooldown | Line: 962 | Upvalues: t (copy), v6 (copy) ]]
	local v2 = p2.TemporaryBreedCooldown.Value > 0 and p2.TemporaryBreedCooldown.Value or t.GetByName(p2.Species.Value).Stats.BreedCooldown
	local v4 = v6.map(t.HasUnlockedFertility(p2) and p2.Upgrades.Fertility.Value or 0, 0, 10, 1, 0.5)
	if not v2 then
		return 0
	end
	if not (p1 and p1.GetWithModifiers) then
		return 0
	end
	local v5 = if t.GetGender(p2) == "Male" then 0.2 else 1
	return v2 * v5 * v4 * p1:GetWithModifiers({
		Name = "GestationTimeMultiplier",
		Default = 1,
		Slot = p2
	})
end
function t.GetBirthWaitTimeLeft(p1, p2) --[[ GetBirthWaitTimeLeft | Line: 981 | Upvalues: t (copy) ]]
	if t.GetBreedWait(p1, p2) and p2:FindFirstChild("LastBreedFixed") then
		local v1 = workspace:GetServerTimeNow()
		return p2.LastBreedFixed.Value + t.GetBreedWait(p1, p2) - v1
	else
		return 0
	end
end
function t.IsSpeciesInSeason(p1) --[[ IsSpeciesInSeason | Line: 990 | Upvalues: t (copy), t2 (copy), v36 (copy) ]]
	local v1 = t.GetByName(p1)
	if not (v1.InSeasonStart and v1.InSeasonEnd) then
		return nil
	end
	local v2 = t2[v1.InSeasonStart]
	local v3 = t2[v1.InSeasonEnd]
	local v4 = v36.GetMonth(workspace:GetServerTimeNow())
	if v2 <= v3 then
		return if v2 <= v4 then v4 <= v3 else false
	else
		return if v2 <= v4 then true else v4 <= v3
	end
end
function t.GetSeasonBreedWait(p1) --[[ GetSeasonBreedWait | Line: 1008 | Upvalues: t (copy), t2 (copy), v36 (copy) ]]
	local v1 = t.GetByName(p1)
	if not v1 then
		return nil
	end
	if v1.InSeasonStart and v1.InSeasonEnd then
		local v2 = t2[v1.InSeasonStart]
		local v3 = t2[v1.InSeasonEnd]
		if v2 and v3 then
			local v4 = v36.GetMonth(workspace:GetServerTimeNow())
			local v6 = v1.Stats.InSeasonBreedWait or 0
			if if v2 <= v3 then if v2 <= v4 then if v4 <= v3 then true else false else false elseif v2 <= v4 then true elseif v4 <= v3 then true else false then
				return v6
			end
			return math.floor(v6 + ((v1.Stats.BreedWait or 86400) - v6) * math.clamp(math.min(if v4 < v2 then v2 - v4 else 12 - v4 + v2, if v3 < v4 then v4 - v3 else v4 + (12 - v3)) / math.ceil((12 - (if v2 <= v3 then v3 - v2 + 1 else 12 - v2 + 1 + v3)) / 2), 0, 1))
		else
			return v1.Stats and v1.Stats.BreedWait
		end
	else
		return v1.Stats and v1.Stats.BreedWait
	end
end
function t.GetBreedWait(p1, p2) --[[ GetBreedWait | Line: 1073 | Upvalues: t (copy) ]]
	local v1 = t.GetByName(p2.Species.Value)
	if v1.InSeasonStart and v1.InSeasonEnd then
		local v2 = t.GetSeasonBreedWait(p2.Species.Value)
		if v2 == 0 then
			return nil
		else
			return v2
		end
	else
		return v1.Stats.BreedWait
	end
end
function t.CanBreedSlot(p1, p2, p3, p4) --[[ CanBreedSlot | Line: 1087 | Upvalues: v4 (copy), t (copy) ]]
	local t2 = {}
	if p3 then
		local v1 = p2.Serial.Value ~= "" and p2.Serial.Value or "none"
		local v2 = p3.Serial.Value ~= "" and p3.Serial.Value or "none"
		if v2 ~= "none" and v1 ~= "none" then
			if if p3.Father.Value == v1 or (p3.Mother.Value == v1 or p2.Father.Value == v2) then true elseif p2.Mother.Value == v2 then true else false then
				table.insert(t2, "Related")
			end
			local v42 = v4.GetByType(p2.Species.Value, "Animals")
			if (v42.OnlyBreedWithSameSpecies or v4.GetByType(p2.Species.Value, "Animals").OnlyBreedWithSameSpecies) and p2.Species.Value ~= p3.Species.Value then
				table.insert(t2, "NotSameSpecies")
			end
		end
	end
	if p4 and not p1:HasUnlockedSpecies(p2.Species.Value, true) then
		table.insert(t2, "NotUnlocked")
	end
	if not p1:CanBreedSpecies(p2.Species.Value) then
		table.insert(t2, "NoBreedPermission")
	end
	if p2.Infertile.Value then
		table.insert(t2, "Infertile")
	end
	if p2.Origin.Value == "Developer" then
		table.insert(t2, "InfertileOrigin")
	end
	if t.IsToyHorse(p2) then
		table.insert(t2, "ToyHorseCannotBreed")
	end
	if t.GetAge(p2) ~= "Adult" then
		table.insert(t2, "TooYoung")
	end
	local v6 = t.GetGender(p2)
	if v6 == "Female" or v6 == "Both" then
		if t.GetBirthTimeLeft(p1, p2) > 0 then
			table.insert(t2, "PregnantTimer")
		end
		if #p2.Child.Value > 0 and p1:GetItemValue(p2.Child.Value, "Children") then
			table.insert(t2, "Pregnant")
		end
	elseif t.GetBirthTimeLeft(p1, p2) > 0 then
		table.insert(t2, "BreedCooldown")
	end
	if t.GetBreedWait(p1, p2) and t.GetBirthWaitTimeLeft(p1, p2) > 0 then
		table.insert(t2, "BreedWait")
	end
	return t2[1] or true, t2
end
function t.CanBreedSlots(p1, p2, p3) --[[ CanBreedSlots | Line: 1170 | Upvalues: t (copy) ]]
	for k, v in pairs({ p2, p3 }) do
		local v1, v2, v3
		if v == p2 and p3 then
			v1 = p1
			v2 = v
			v3 = p3
		else
			v1 = p1
			v2 = v
			v3 = p2
		end
		local v4 = t.CanBreedSlot(v1, v2, v3)
		if v4 ~= true then
			return v4
		end
	end
	local v5 = t.GetGender(p2)
	local v6 = t.GetGender(p3)
	if v5 == v6 and (v5 ~= "Both" and v6 ~= "Both") then
		return "SameGender"
	end
	if not (p1:HasUnlockedSpecies(p2.Species.Value, true) and p1:HasUnlockedSpecies(p3.Species.Value, true)) then
		return "NotUnlocked"
	end
	for k, v in pairs({ p2, p3 }) do
		local v7
		v7 = if k == 1 and p3 then p3 else p2
		if v7 == v then
			return "SameSlot"
		end
	end
	return true
end
function t.BreedSlots(p1, p2, p3, p4) --[[ BreedSlots | Line: 1202 | Upvalues: v30 (copy), t (copy), v6 (copy), v27 (copy), v4 (copy), t6 (copy), v37 (copy), v15 (copy), v10 (copy), v5 (copy) ]]
	local v2 = p4 or {}
	local t2 = {}
	local t3 = {}
	local v3 = 1
	local v42 = false
	if not v2.Prediction then
		local tbl = {
			PerfectTwins = 0,
			Twins = 0
		}
		for k, v in pairs(tbl) do
			for k2, v7 in pairs({ p2, p3 }) do
				local v52 = v30.GetMutationOfName(v7, k)
				if v52 then
					tbl[k] = tbl[k] + v52.TwinChance
				end
			end
		end
		for k, v in pairs({ "PerfectTwins", "Twins" }) do
			if math.random(1, 100) <= tbl[v] then
				v3 = 2
				v42 = v == "PerfectTwins"
				break
			end
		end
		if p2.Eldering.Completed.Value then
			tbl.Twins = tbl.Twins + 25
		end
		if p3.Eldering.Completed.Value then
			tbl.Twins = tbl.Twins + 25
		end
	end
	for i = 1, v3 do
		local v62, v7, v8, v9, v102, v11, v12, v13, v14, v152, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26
		local v272 = (v2.SkipPregnancy or v2.Prediction) and p1:GetItemFolder("Animals") or p1:GetItemFolder("Children")
		local v28 = nil
		for k, v in pairs({ p2, p3 }) do
			if t.GetGender(v) == "Female" then
				v28 = v
				break
			end
		end
		if not v28 then
			for k, v in pairs({ p2, p3 }) do
				if t.GetGender(v) == "Both" then
					v28 = v
					break
				end
			end
		end
		if v42 and i > 1 then
			v62 = t.CreateSlot(p1, {
				Origin = "Bred",
				DoNotParent = true,
				DoNotIncrementCount = v2.Prediction
			}, t2[1], v272)
		else
			local Seed = v2.Seed
			local count = 0
			local function calculateSeed() --[[ calculateSeed | Line: 1276 | Upvalues: Seed (copy), v2 (ref), count (ref) ]]
				if Seed and v2.OffsetSeed then
					count = count + 1
					return Seed + count
				else
					return Seed
				end
			end
			local t4 = {}
			for v302, v31 in p2.Colors:GetChildren() do
				t4[v31.Name] = { v31.Value, p3.Colors[v31.Name].Value }
			end
			local t5 = {}
			for k, v in pairs({ "TraitInheritanceMultiplier" }) do
				t5[v] = {}
				for k2, v29 in pairs({ p2, p3 }) do
					local v32 = p1:GetWithModifiers({
						Name = v,
						Slot = v29
					})
					local v33 = p1:GetWithModifiers({
						Name = "Bond",
						Default = 1,
						Slot = v29
					})
					t5[v][v29] = v32 * (v6.map(v29.Upgrades.Bond.Value, 0, 1, 1, 1.25, true) * v33)
				end
			end
			if Seed and v2.OffsetSeed then
				count = count + 1
				v7 = Seed + count
				v8 = p2
				v9 = p3
			else
				v8 = p2
				v9 = p3
				v7 = Seed
			end
			local v35 = v27.GetSpecies(v8, v9, v7)
			local t7 = {
				Origin = "Bred",
				DoNotParent = true,
				Species = v35
			}
			if Seed and v2.OffsetSeed then
				count = count + 1
				v102 = Seed + count
				v11 = p1
			else
				v102 = Seed
				v11 = p1
			end
			t7.Seed = v102
			t7.DoNotIncrementCount = v2.Prediction
			local v36 = t.CreateSlot(v11, t7, nil, v272)
			local v372 = v4.GetByName(v36.Species.Value)
			v62 = v36
			for v39, v40 in t4 do
				local v38
				if t6[v39] then
					if Seed and v2.OffsetSeed then
						count = count + 1
						v38 = Seed + count
					else
						v38 = Seed
					end
					t4[v39] = v27.GetColor(v40[1], v40[2], nil, v38)
					v36.Colors[v39].Value = t4[v39]
				end
			end
			if Seed and v2.OffsetSeed then
				count = count + 1
				v12 = Seed + count
			else
				v12 = Seed
			end
			v36.Colors.Eye.Value = v27.GetEye(p2.Colors.Eye.Value, p3.Colors.Eye.Value, v12)
			if Seed and v2.OffsetSeed then
				count = count + 1
				v13 = Seed + count
			else
				v13 = Seed
			end
			local v45 = v27.GetSize(p2.SizeType.Value, p3.SizeType.Value, v13)
			if v372.ToyHorse then
				v36.SizeType.Value = "Normal"
			else
				v36.SizeType.Value = v45
			end
			local Transparency = v372.Transparency
			if Transparency then
				if Seed and v2.OffsetSeed then
					count = count + 1
					v14 = Seed + count
				else
					v14 = Seed
				end
				Transparency = v27.GetTransparency(p2.Transparency.Value, p3.Transparency.Value, v14)
			end
			v36.Transparency.Value = Transparency or ""
			local Reflectance = v372.Reflectance
			if Reflectance then
				if Seed and v2.OffsetSeed then
					count = count + 1
					v152 = Seed + count
				else
					v152 = Seed
				end
				Reflectance = v27.GetReflectance(p2.Reflectance.Value, p3.Reflectance.Value, v152)
			end
			v36.Reflectance.Value = Reflectance or ""
			local t8 = {}
			for v48, v49 in p2.Materials:GetChildren() do
				local v46, v47
				local v50 = p3.Materials:FindFirstChild(v49.Name)
				if Seed and v2.OffsetSeed then
					count = count + 1
					v46 = Seed + count
					v47 = v35
				else
					v47 = v35
					v46 = Seed
				end
				local v54 = v27.GetMaterial(v49.Value, v50.Value, v47, v49.Name, v46)
				if v54 then
					v36.Materials[v49.Name].Value = v54
					continue
				end
				table.insert(t8, v36.Materials[v49.Name])
			end
			if next(t8) then
				warn("Some horses were lacking materials, randomizing", t8, v35)
				if Seed and v2.OffsetSeed then
					count = count + 1
					v16 = Seed + count
					v17 = t8
					v18 = v35
				else
					v17 = t8
					v18 = v35
					v16 = Seed
				end
				t.RandomizeMaterials(v17, v18, v16)
			end
			for j = 1, v372 and v372.MaxTraits and v372.MaxTraits.Pattern or v37.MaxBredPatternsPerSlot do
				local v59, v60, v61, v622
				if Seed and v2.OffsetSeed then
					count = count + 1
					v59 = Seed + count
					v60 = p2
					v61 = p3
					v622 = v35
				else
					v60 = p2
					v61 = p3
					v622 = v35
					v59 = Seed
				end
				local v63 = v27.GetPattern(v60, v61, v622, v59, t5.TraitInheritanceMultiplier)
				if v63 ~= "Nothing" then
					local v64 = v36.Patterns:FindFirstChild(v63) or Instance.new("BoolValue")
					v64.Name = v63
					v64.Value = true
					v64.Parent = v36.Patterns
				end
			end
			for k = 1, v372 and v372.MaxTraits and v372.MaxTraits.Paint or v37.MaxBredPaintsPerSlot do
				local v65, v66, v67, v68
				if Seed and v2.OffsetSeed then
					count = count + 1
					v65 = Seed + count
					v66 = p2
					v67 = p3
					v68 = v35
				else
					v66 = p2
					v67 = p3
					v68 = v35
					v65 = Seed
				end
				local v69 = v27.GetPaint(v66, v67, v68, v65, t5.TraitInheritanceMultiplier)
				if v69 ~= "Nothing" then
					local v70 = v36.Paints:FindFirstChild(v69) or Instance.new("BoolValue")
					v70.Name = v69
					v70.Value = true
					v70.Parent = v36.Paints
				end
			end
			for n = 1, v372 and v372.MaxTraits and v372.MaxTraits.Cosmetic or v37.MaxBredCosmeticsPerSlot do
				local v71, v72, v73, v74
				if Seed and v2.OffsetSeed then
					count = count + 1
					v71 = Seed + count
					v72 = p2
					v73 = p3
					v74 = v35
				else
					v72 = p2
					v73 = p3
					v74 = v35
					v71 = Seed
				end
				local v75 = v27.GetCosmetic(v72, v73, v74, v71, t5.TraitInheritanceMultiplier)
				if v75 ~= "Nothing" then
					local v76 = v36.Cosmetics:FindFirstChild(v75) or Instance.new("BoolValue")
					v76.Name = v75
					v76.Value = true
					v76.Parent = v36.Cosmetics
				end
			end
			if Seed and v2.OffsetSeed then
				count = count + 1
				v19 = Seed + count
				v20 = p2
				v21 = p3
				v22 = v36
			else
				v20 = p2
				v21 = p3
				v22 = v36
				v19 = Seed
			end
			v27.GetMutations(v20, v21, v22, v19, p1)
			if Seed and v2.OffsetSeed then
				count = count + 1
				v23 = Seed + count
				v24 = p2
				v25 = p3
				v26 = v35
			else
				v24 = p2
				v25 = p3
				v26 = v35
				v23 = Seed
			end
			local v77, v78, v79, v80, v81, v82 = v27.GetMiscCosmetics(v24, v25, v26, v23, t5.TraitInheritanceMultiplier)
			v36.MiscCosmetics.Tail.Value = v77 or ""
			v36.MiscCosmetics.Mane.Value = v78 or ""
			v36.MiscCosmetics.Horn.Value = v79 or ""
			v36.MiscCosmetics.Ear.Value = v80 or ""
			v36.MiscCosmetics.Whisker.Value = v81 or ""
			v36.MiscCosmetics.Sticker.Value = v82 or ""
			v2.Seed = nil
		end
		local Gender = p2.Gender.Value
		local Gender_2 = p3.Gender.Value
		if Gender == "Both" then
			v62.Father.Value = p2.Serial.Value
		end
		if Gender_2 == "Both" then
			v62.Mother.Value = p3.Serial.Value
		end
		if v62.Father.Value == "" then
			v62.Father.Value = Gender == "Male" and p2.Serial.Value or (if Gender_2 == "Male" then p3.Serial.Value else false)
		end
		if v62.Mother.Value == "" then
			v62.Mother.Value = Gender == "Female" and p2.Serial.Value or (if Gender_2 == "Female" then p3.Serial.Value else false)
		end
		if not v2.Prediction then
			v62.Parent = v272
			if v272 == p1:GetItemFolder("Animals") then
				local v85 = p1:GetItemFolder("Animals")
				local Species = v62.Species.Value
				local count = 0
				for v86, v87 in v85:GetChildren() do
					if v87.Species.Value == Species then
						count = count + 1
					end
				end
				v15.ReportResourceEvent(p1.Player, "Source", "HorseSlot", Species, "BreedSlots", 1, {
					{
						Key = "Total",
						Value = count
					}
				})
			end
			if i == 1 then
				if v2.SkipBreedWait then
					p1.TutorialSkipBreedWait = false
					p2.LastBreed.Value = 1
					p3.LastBreed.Value = p2.LastBreed.Value
					p2.LastBreedFixed.Value = p2.LastBreed.Value
					p3.LastBreedFixed.Value = p2.LastBreed.Value
				else
					for v88, v89 in { p2, p3 } do
						v89.LastBreed.Value = workspace:GetServerTimeNow()
						v89.TemporaryBreedCooldown.Value = v2.BreedWaitTime or 0
					end
					p2.LastBreedFixed.Value = p2.LastBreed.Value
					p3.LastBreedFixed.Value = p3.LastBreed.Value
				end
				v28.Child.Value = v62.Name
				for k, v in pairs({ p2, p3 }) do
					if t.HasUnlockedFertility(v) then
						v10.GiveExperience(p1, {
							Stat = "Fertility",
							Slot = v,
							Amount = v37.FertilityExperiencePerBreed
						})
					end
				end
			else
				local v90 = v5.CreateDataValueFromType("Child")
				v90.Name = v5.getIndexOfValue(v28.Child)
				v90.Value = v62.Name
				v90.Parent = v28.Child
			end
		end
		t2[i] = v62
		t3[i] = v62.Name
	end
	return t3, t2
end
function t.HasUnlockedFertility(p1) --[[ HasUnlockedFertility | Line: 1511 | Upvalues: v10 (copy), v37 (copy) ]]
	return v10.GetTotalSkillLevels(p1) >= v37.RequiredFertilityLevel
end
function t.BirthSlot(p1, p2) --[[ BirthSlot | Line: 1517 | Upvalues: t (copy), v15 (copy) ]]
	local tbl = { p2.Child }
	for k, v in pairs(p2.Child:GetChildren()) do
		table.insert(tbl, v)
	end
	local t2 = {}
	local t3 = {}
	for k, v in pairs(tbl) do
		local v1 = p1:GetItemValue(v.Value, "Children")
		local v2 = t.CreateSlot(p1, {
			DoNotParent = true,
			DoNotIncrementCount = true
		}, v1)
		v1:Destroy()
		if v == p2.Child then
			v.Value = ""
		end
		v2.Parent = p1:GetItemFolder("Animals")
		local v3 = p1:GetItemFolder("Animals")
		local Species = v2.Species.Value
		local count = 0
		for v4, v5 in v3:GetChildren() do
			if v5.Species.Value == Species then
				count = count + 1
			end
		end
		v15.ReportResourceEvent(p1.Player, "Source", "HorseSlot", Species, "BirthSlot", 1, {
			{
				Key = "Total",
				Value = count
			},
			{
				Key = "PlayTime",
				Value = p1:GetStatValue("PlayTime").Value
			}
		})
		t2[k] = v2
		t3[k] = v2.Name
	end
	p2.Child:ClearAllChildren()
	p2.TemporaryBreedCooldown.Value = 0
	p2.LastBreed.Value = 0
	return t3, t2
end
function t.CanBirthSlot(p1, p2, p3) --[[ CanBirthSlot | Line: 1570 | Upvalues: t (copy) ]]
	if not p1:GetItemValue(p2.Child.Value, "Children") then
		return "NoChild"
	end
	if t.GetBirthTimeLeft(p1, p2) > 0 then
		return "PregnantTimer"
	end
	if p3 or p1:CanGiveItem("Animals") then
		return true
	else
		return "AtAnimalLimit"
	end
end
local function roundToNearest(p1) --[[ roundToNearest | Line: 1588 ]]
	return math.floor(p1 / 10) * 10
end
function t.GetScale(p1) --[[ GetScale | Line: 1592 | Upvalues: t (copy), v6 (copy), v28 (copy), v30 (copy), ScaleMultiplier (copy) ]]
	local Species = p1:FindFirstChild("Species")
	if not Species then
		return 1
	end
	local v1 = t.GetByName(Species.Value)
	if v1.ToyHorse then
		return 1
	end
	local v3 = math.floor(p1.Age.Value / 10) * 10
	local sum = v6.map(v3, 0, 100, 0.5, 1) * v28.GetSize(p1.SizeType.Value).SizeMultiplier * (v1.Scale or 1)
	for v4, v5 in p1.Mutations:GetChildren() do
		local v62 = v30.GetMutation(v5.Value)
		if v62 and v62.ScaleMultiplier then
			sum = sum * v62.ScaleMultiplier
		end
	end
	if t.IsFoal(p1) then
		sum = sum + 0.4
	end
	if p1.DownScaled.Value then
		sum = sum * ScaleMultiplier
	end
	return sum
end
function t.ClearSlot(p1) --[[ ClearSlot | Line: 1631 | Upvalues: t (copy) ]]
	p1.Dino.Value = ""
	for k, v in pairs(p1:GetDescendants()) do
		t.ResetValue(v)
	end
end
function t.ResetValue(p1) --[[ ResetValue | Line: 1640 | Upvalues: ResetDataValues (copy) ]]
	local v1 = ResetDataValues[p1.Name]
	if v1 then
		p1.Value = v1
		return
	end
	if p1:IsA("BoolValue") then
		p1.Value = false
		return
	end
	if p1:IsA("IntValue") or p1:IsA("NumberValue") then
		p1.Value = 0
	else
		if not p1:IsA("StringValue") then
			return
		end
		p1.Value = ""
	end
end
function t.CanSellSlot(p1, p2) --[[ CanSellSlot | Line: 1653 | Upvalues: v17 (copy), Sonar (copy) ]]
	if p2.Favorite.Value then
		return "CantSellFavorited"
	end
	if #p1:GetItemFolder("Animals"):GetChildren() <= 1 then
		return "CantSellLastHorse"
	end
	if v17.IsMarketWorld() and Sonar("AuctionService").IsItemInAuction(p2) then
		return "CantSellInAuction"
	else
		return true
	end
end
function t.SellSlots(p1, p2) --[[ SellSlots | Line: 1672 | Upvalues: t (copy), v37 (copy), v15 (copy) ]]
	local sum = 0
	local count = 0
	local sum_2 = 0
	local t2 = {}
	for k, v in pairs(p2) do
		local v1 = p1:GetItemValue(v, "Animals")
		if v1 then
			local v2 = t.CanSellSlot(p1, v1)
			if v2 == true then
				local Species = v1.Species.Value
				local v3 = v37.CurrentEvent and table.find(v37.CurrentEvent.SellSpecies, Species)
				sum = sum + t.GetPriceForSlot(v1)
				p1:IncrementMission({
					Type = "Sell",
					Amount = 1,
					Data = { Species }
				})
				local NewMissionsWrapper = p1.NewMissionsWrapper
				if NewMissionsWrapper then
					NewMissionsWrapper:IncrementMission("SellAnySpecies", {
						Data = { Species }
					})
					NewMissionsWrapper:IncrementMission("SellSpecificSpecies", {
						Data = { Species }
					})
				end
				v1:Destroy()
				local count_2 = 0
				for v4, v5 in p1:GetItemFolder("Animals"):GetChildren() do
					if v5.Species.Value == Species then
						count_2 = count_2 + 1
					end
				end
				v15.ReportResourceEvent(p1.Player, "Sink", "HorseSlot", Species, "SellingHorse", 1, {
					{
						Key = "Total",
						Value = count_2
					}
				})
				count = count + 1
				if v3 then
					sum_2 = sum_2 + v37.CurrentEvent.SellAmount
				end
				continue
			end
			warn("[SellSlots] Cannot sell slot for player", p1.Player.Name, "- Slot:", v, "- Species:", v1.Species.Value, "- Origin:", v1.Origin.Value, "- Favorite:", v1.Favorite.Value, "- Reason:", v2)
			table.insert(t2, v2)
			continue
		end
		warn("[SellSlots] Slot not found for player", p1.Player.Name, "- Slot:", v)
	end
	p1:IncrementStat({
		Type = "HorsesSold",
		Amount = count
	})
	p1:GiveItem({
		Name = "Coins",
		Source = "SellingHorse",
		Amount = sum
	})
	if sum_2 > 0 then
		p1:GiveItem({
			Source = "SellingEventSpecies",
			Name = v37.EventCurrencyName,
			Amount = sum_2
		})
	end
	if count == 0 and #t2 > 0 then
		warn("[SellSlots] No horses sold for player", p1.Player.Name, "- Failed reasons:", table.concat(t2, ", "))
	end
	return sum, t2
end
function t.CanPredictBreed(p1) --[[ CanPredictBreed | Line: 1765 | Upvalues: v37 (copy) ]]
	if p1:CanAfford(v37.PredictBreedingPrice, "Coins") then
		return true
	else
		return "CannotAffordToPredict"
	end
end
function t.CanClaimPredictBreed(p1) --[[ CanClaimPredictBreed | Line: 1772 | Upvalues: v1 (copy) ]]
	local v12 = p1:HasEnoughOfItem(1, "PredictFoalPotion")
	if not v12 then
		return "CannotAffordPredictFoalPotion"
	end
	if not v1 then
		return true
	end
	local _lastPredictionSeedData = p1._lastPredictionSeedData
	if not _lastPredictionSeedData then
		return
	end
	if next(_lastPredictionSeedData) then
		return true, v12, _lastPredictionSeedData
	end
end
function t.GetStorageSlotPurchase(p1, p2) --[[ GetStorageSlotPurchase | Line: 1789 | Upvalues: v40 (copy) ]]
	local v1 = p2 or "Free"
	local StorageTiersPurchased = p1.PlayerData.StorageTiersPurchased
	if v1 == "Robux" then
		StorageTiersPurchased = StorageTiersPurchased.RobuxTiersPurchased
	end
	for k, v in pairs(v40[v1]) do
		if StorageTiersPurchased.Value < k then
			return v
		end
	end
end
function t.GetEquipSlotPurchase(p1, p2) --[[ GetEquipSlotPurchase | Line: 1802 | Upvalues: v41 (copy) ]]
	local v1 = p2 or "Free"
	local EquipTiersPurchased = p1.PlayerData.EquipTiersPurchased
	if v1 == "Robux" then
		EquipTiersPurchased = EquipTiersPurchased.RobuxTiersPurchased
	end
	for k, v in pairs(v41[v1]) do
		if EquipTiersPurchased.Value < k then
			return v
		end
	end
end
function t.CanNameSlot(p1, p2) --[[ CanNameSlot | Line: 1816 ]]
	if not p2.GivenFirstName.Value then
		return true
	end
	local v1 = p1:HasEnoughOfItem(1, "NameTag")
	if v1 then
		return true, v1
	else
		return "NoNameTag"
	end
end
function t.Init(p1) --[[ Init | Line: 1829 | Upvalues: Animals (copy), Sonar (copy), v7 (copy), v1 (copy), ReplicatedObjectModels (copy), v37 (copy), v14 (copy), t3 (copy), v4 (copy), v43 (ref), v23 (copy), v22 (copy), v21 (copy), v24 (copy), v25 (copy), v29 (copy), v33 (copy), v34 (copy), v35 (copy), v13 (copy), v30 (copy), v39 (copy), v8 (copy), v3 (copy), v2 (copy), v15 (copy), t (copy), v18 (copy), RunService (copy), v12 (copy), TextService (copy), v11 (copy), filterText (copy), v27 (copy), v41 (copy), v40 (copy) ]]
	for k, v in pairs(Animals.Species:GetChildren()) do
		local v16 = Sonar(v)
		v16.Name = v.Name
		v7:SetCachedData(v16.Name, "Species", v16.Name)
		v7:SetCachedData(v16.Name, "TraitInheritanceMultiplier", 1)
		v7:SetCachedData(v16.Name, "MutationInheritanceMultiplier", 1)
		v7:SetCachedData(v16.Name, "GestationTimeMultiplier", 1)
		v7:SetCachedData(v16.Name, "UnlimitedStamina", false)
		v7:SetCachedData(v16.Name, "JumpExperience", 1)
		v7:SetCachedData(v16.Name, "BondExperience", 1)
		v7:SetCachedData(v16.Name, "StrengthExperience", 1)
		v7:SetCachedData(v16.Name, "FertilityExperience", 1)
		v7:SetCachedData(v16.Name, "AgilityExperience", 1)
		if not v1 then
			v16.Model = ReplicatedObjectModels.Animals:WaitForChild(v16.Name)
		end
		v16.Traits = {}
		local v26 = Animals.Traits:FindFirstChild(v.Name)
		if v26 then
			for v32, v42 in v26:GetChildren() do
				local v5 = Sonar(v42)
				local v6 = v42.Name
				v16.Traits[v6] = {}
				if not v37[v6] then
					v37[v6] = {
						["All" .. v6] = {}
					}
				end
				if not v37[v6][v.Name] then
					v37[v6][v.Name] = {}
				end
				v37[v6][v.Name] = v5
				for v72, v82 in v5 do
					v37[v6]["All" .. v6][v72] = v14.MergeOriginal(v37[v6]["All" .. v6][v72] or {}, v82)
				end
				for k2, v9 in pairs(v5[v6]) do
					v9.Type = v9.Type or (if string.find(k2, "Fur") then "Fur" else nil)
					v9.TraitType = v6
					v16.Traits[v6][k2] = v9
				end
			end
		else
			warn("No traits folder can be found for", v.Name)
		end
		t3[v16.Name] = v16
	end
	v4.AddItemSet("Animals", t3)
	v43 = {
		Eyes = function(p1) --[[ Eyes | Line: 1899 | Upvalues: v37 (ref) ]]
			return v37.Eyes[p1]
		end,
		Cosmetics = v23.GetCosmetic,
		Paints = v22.GetPaint,
		Patterns = v21.GetPattern,
		Tails = v24.GetTail,
		Manes = v25.GetMane,
		Horns = v29.GetHorn,
		Ears = v33.GetEar,
		Whiskers = v34.GetWhisker,
		Sticker = v35.GetSticker
	}
	for k, v in pairs({ v13.Types, v30.Mutations }) do
		for k2, v5 in pairs(v) do
			v5.ModifierStats = {}
			if v5.Modifier then
				local v122 = v39[v5.Modifier]
				if v5 then
					for k3, v6 in pairs(v122.ModifierTargets) do
						v5.ModifierStats[v6] = v122[v6]
					end
				end
			end
		end
	end
	if v1 then
		v8.GetRemoteEvent("DeleteItem").OnServerEvent:Connect(function(p1, p2, p3) --[[ Line: 1931 | Upvalues: v3 (ref), v4 (ref), v2 (ref), v15 (ref) ]]
			local v1 = v3.SanitiseInput(p3)
			if not tonumber(v1) or v1 < 0 then
				return
			end
			local v22 = v4.GetByName(p2)
			if v22 and v22.Deletelocked then
				return
			end
			local v32 = v2.getWrapperFromPlayer(p1):GetItemValue(p2)
			if not v32 then
				return
			end
			local v5 = math.clamp(v1, 0, v32.Value)
			v32.Value = math.max(v32.Value - v5, 0)
			v15.ReportResourceEvent(p1, "Sink", v22.ItemType, v22.Name, "DeleteInventoryItem", v5)
		end)
		v8.GetRemoteEvent("DeleteChest").OnServerEvent:Connect(function(p1, p2) --[[ Line: 1952 | Upvalues: v2 (ref), v15 (ref) ]]
			local v1 = v2.getWrapperFromPlayer(p1):GetItemValue(p2, "Chests")
			if not v1 then
				return
			end
			v1:Destroy()
			v15.ReportResourceEvent(p1, "Sink", "Chests", p2, "DeleteInventoryItem", 1)
		end)
		v8.GetRemoteEvent("DeleteSeed").OnServerEvent:Connect(function(p1, p2) --[[ Line: 1961 | Upvalues: v2 (ref), v15 (ref) ]]
			local v1 = v2.getWrapperFromPlayer(p1):GetItemValue(p2, "Seeds")
			if not v1 then
				return
			end
			v1:Destroy()
			v15.ReportResourceEvent(p1, "Sink", "Seeds", p2, "DeleteInventoryItem", 1)
		end)
		local function breedSlots(p1, p2, p3, p4) --[[ breedSlots | Line: 1971 | Upvalues: v2 (ref), t (ref), v15 (ref), v18 (ref) ]]
			local v1 = if p4 then p4 else {}
			local v22 = v2.getWrapperFromPlayer(p1)
			local v3 = v22:GetAnimalSlot(p2)
			local v4 = v22:GetAnimalSlot(p3)
			if not (v3 and v4) then
				warn("Missing a slot")
				return
			end
			if t.CanBreedSlots(v22, v3, v4) ~= true then
				return
			end
			v15.ReportDesignEvent(p1, "BreedSlots", {
				{
					Key = "Parent1Species",
					Value = v3.Species.Value
				},
				{
					Key = "Parent2Species",
					Value = v4.Species.Value
				}
			}, 1)
			if not v1.IgnoreBreedMissions then
				v22:IncrementMission({
					Type = "Breed",
					Amount = 1,
					Data = {
						v3.Species.Value,
						v4.Species.Value,
						v3,
						v4
					}
				})
				local NewMissionsWrapper = v22.NewMissionsWrapper
				if NewMissionsWrapper then
					NewMissionsWrapper:IncrementMission("BreedAnySpecies", {
						Data = {}
					})
					NewMissionsWrapper:IncrementMission("BreedSpecificSpecies", {
						Data = { v3.Species.Value }
					})
					NewMissionsWrapper:IncrementMission("BreedSpecificSpecies", {
						Data = { v4.Species.Value }
					})
				end
			end
			local v5, v6 = v3, v4
			if v22.TutorialIgnoreBreedMission then
				v22.TutorialIgnoreBreedMission = false
			end
			v22:IncrementStat({
				Type = "TotalBreeds",
				Amount = 1
			})
			v18.AddClubPoints(v22, 10, "Breed")
			return t.BreedSlots(v22, v5, v6, v1)
		end
		v8.GetRemoteFunction("ClaimSeededPrediction").OnServerInvoke = function(p1) --[[ Line: 2018 | Upvalues: v2 (ref), t (ref), breedSlots (copy) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			local v22, _, v3 = t.CanClaimPredictBreed(v1)
			if v22 ~= true then
				return
			end
			if not breedSlots(p1, v3.Slot1, v3.Slot2, {
				OffsetSeed = true,
				Seed = v3.Seed
			}) then
				return true
			end
			v1._lastPredictionSeedData = nil
			local v4 = v1:GetItemValue("PredictFoalPotion")
			v4.Value = v4.Value - 1
			return true
		end
		v8.GetRemoteFunction("BreedSlotsRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 2032 | Upvalues: v2 (ref), breedSlots (copy) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			local v22 = breedSlots(p1, p2, p3, {
				SkipBreedWait = v1.TutorialSkipBreedWait,
				BreedWaitTime = v1.TutorialBreedWait,
				IgnoreBreedMissions = v1.TutorialIgnoreBreedMission
			})
			return if v22 then next(v22) else v22
		end
		v8.GetRemoteFunction("BirthSlotRemote").OnServerInvoke = function(p1, p2) --[[ Line: 2043 | Upvalues: v2 (ref), t (ref), Sonar (ref), v18 (ref) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			local v22 = v1:GetAnimalSlot(p2)
			if t.CanBirthSlot(v1, v22) ~= true then
				return
			end
			local v3, v4 = t.BirthSlot(v1, v22)
			if v4 and v1.EquippedAnimals[v22.Name] then
				t.SpawnAnimal(p1, v4[1])
			end
			for v5, v6 in v4 do
				v1:IncrementMission({
					Type = "Foal",
					Amount = 1,
					Data = { v6.Species.Value }
				})
				local NewMissionsWrapper = v1.NewMissionsWrapper
				if NewMissionsWrapper then
					NewMissionsWrapper:IncrementMission("FoalAnySpecies", {
						Data = {}
					})
					NewMissionsWrapper:IncrementMission("FoalSpecificSpecies", {
						Data = { v6.Species.Value }
					})
				end
				Sonar("LeaderboardService"):IncrementScore(v1, "Foals", 1)
				v18.AddClubPoints(v1, 10, "Foal")
			end
			v1:IncrementStat({
				Type = "FoalsBorn",
				Amount = #v4
			})
			return v3
		end
		v8.GetRemoteFunction("FavoriteSlotRemote").OnServerInvoke = function(p1, p2) --[[ Line: 2079 | Upvalues: v2 (ref) ]]
			local v1 = v2.getWrapperFromPlayer(p1):GetAnimalSlot(p2)
			if v1 then
				v1.Favorite.Value = not v1.Favorite.Value
				return true
			end
		end
		v8.GetRemoteFunction("StudioGiveDiscoveryHorse").OnServerInvoke = function(p1, p2) --[[ Line: 2087 | Upvalues: RunService (ref), v2 (ref), v4 (ref), t (ref), v37 (ref) ]]
			if not RunService:IsStudio() then
				warn("StudioGiveDiscoveryHorse called outside of Studio!")
				return false
			end
			if not (p2 and p2.Species) then
				return false
			end
			local v1 = v2.getWrapperFromPlayer(p1)
			if not v1 then
				return false
			end
			local v22 = v4.GetByName(p2.Species)
			local v3 = if v22 then v22.ToyHorse else v22
			local v42 = t.CreateSlot(v1, {
				Origin = "Wild",
				Age = 66,
				Gender = "Female",
				NoMutations = true,
				NoPatterns = true,
				Species = p2.Species,
				Preset = p2.Preset,
				NoPaints = v3,
				NoCosmetics = v3
			})
			if not v42 then
				return false
			end
			local t2 = {}
			t2.Patterns = v22 and v22.MaxTraits and v22.MaxTraits.Pattern or v37.MaxPatternsPerSlot
			t2.Paints = v22 and v22.MaxTraits and v22.MaxTraits.Paint or v37.MaxPaintsPerSlot
			t2.Cosmetics = v22 and v22.MaxTraits and v22.MaxTraits.Cosmetic or v37.MaxCosmeticsPerSlot
			for v8, v9 in { "Patterns", "Paints", "Cosmetics" } do
				local v10 = v42:FindFirstChild(v9)
				if v10 and p2[v9] then
					local count = 0
					for v11, v12 in p2[v9] do
						if t2[v9] <= count then
							break
						end
						local v13 = v10:FindFirstChild(v12)
						if v13 then
							v13.Value = true
						else
							local v14 = Instance.new("BoolValue")
							v14.Name = v12
							v14.Value = true
							v14.Parent = v10
						end
						count = count + 1
					end
				end
			end
			local MiscCosmetics = v42:FindFirstChild("MiscCosmetics")
			if MiscCosmetics and p2.MiscCosmetics then
				for v15, v16 in p2.MiscCosmetics do
					local v17 = MiscCosmetics:FindFirstChild(v15)
					if v17 then
						v17.Value = v16
					end
				end
			end
			print("Studio: Gave discovery horse to", p1.Name, "Species:", p2.Species)
			return v42.Name
		end
		local v132 = Random.new()
		v8.GetRemoteFunction("PredictBreedSlotRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 2161 | Upvalues: v2 (ref), t (ref), v37 (ref), v15 (ref), v132 (copy) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			v1._lastPredictionSeedData = nil
			if t.CanPredictBreed(v1) == true then
				local PredictBreedingPrice = v37.PredictBreedingPrice
				local v22 = v1:GetCurrencyValue("Coins")
				v22.Value = v22.Value - PredictBreedingPrice
				v15.ReportResourceEvent(p1, "Sink", "Currency", "Coins", "BreedPrediction", PredictBreedingPrice)
				local v3 = v1:GetWithModifiers({
					Name = "MutationInheritanceMultiplier",
					Default = 1,
					Slot = p2
				})
				local v4 = v1:GetWithModifiers({
					Name = "MutationInheritanceMultiplier",
					Default = 1,
					Slot = p3
				})
				local v5 = v132:NextNumber(-10000000, 10000000) + os.clock()
				v1._lastPredictionSeedData = {
					Seed = v5,
					Slot1 = p2,
					Slot2 = p3
				}
				return v5, v3, v4
			end
		end
		v8.GetRemoteFunction("SellSlotsRemote").OnServerInvoke = function(p1, p2) --[[ Line: 2190 | Upvalues: v2 (ref), t (ref) ]]
			return t.SellSlots(v2.getWrapperFromPlayer(p1), p2)
		end
		v8.GetRemoteFunction("NameSlotRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 2195 | Upvalues: v2 (ref), v37 (ref), v12 (ref), TextService (ref), t (ref), v15 (ref) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			local v22 = v1:GetAnimalSlot(p2)
			if not v22 then
				return
			end
			local MaxAnimalNameLength = v37.MaxAnimalNameLength
			if TextService:FilterStringAsync(v12.trimString(v12.trimString(p3, MaxAnimalNameLength), MaxAnimalNameLength), p1.UserId, Enum.TextFilterContext.PublicChat):GetNonChatStringForUserAsync(p1.UserId) ~= p3 then
				return
			end
			local v4, v5 = t.CanNameSlot(v1, v22)
			if v4 ~= true then
				return
			end
			local v6, v7
			if #p3 > 0 then
				local MaxAnimalNameLength_2 = v37.MaxAnimalNameLength
				v7 = v22
				v6 = TextService:FilterStringAsync(v12.trimString(v12.trimString(p3, MaxAnimalNameLength_2), MaxAnimalNameLength_2), p1.UserId, Enum.TextFilterContext.PublicChat):GetNonChatStringForUserAsync(p1.UserId) or ""
			else
				v6 = ""
				v7 = v22
			end
			v22.CustomName.Value = v6
			if not (#v7.CustomName.Value > 0) or v12.isStringJustOneChar(v7.CustomName.Value, "#") then
				return true
			end
			if v5 then
				local v10, v11 = v1:ConsumeItem("NameTag", 1)
				if v10 and v11 > 0 then
					v15.ReportResourceEvent(p1, "Sink", "Miscellaneous", "NameTag", "RenameHorse", 1)
				else
					v7.GivenFirstName.Value = true
				end
			else
				v7.GivenFirstName.Value = true
			end
			return true
		end
		v8.GetRemoteFunction("PurchaseStorageSlotsRemote").OnServerInvoke = function(p1, p2) --[[ Line: 2226 | Upvalues: v2 (ref), t (ref), v11 (ref), v15 (ref) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			local v22 = t.GetStorageSlotPurchase(v1, p2 or "Free")
			if not v22 then
				return
			end
			if v22.ProductId then
				v11.PromptPurchase(p1, v22.ProductId)
			else
				local v3 = v1:CanAfford(v22.Price, v22.Currency)
				if not v3 then
					return
				end
				v3.Value = v3.Value - v22.Price
				local StorageTiersPurchased = v1.PlayerData.StorageTiersPurchased
				StorageTiersPurchased.Value = StorageTiersPurchased.Value + 1
				v15.ReportResourceEvent(p1, "Sink", "Currency", v3.Name, "UpgradeStorageSlots", v22.Price)
			end
			return true
		end
		v8.GetRemoteFunction("PurchaseInventorySlotsRemote").OnServerInvoke = function(p1, p2) --[[ Line: 2248 | Upvalues: v2 (ref), v4 (ref), v11 (ref), v15 (ref) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			local v22 = v4.GetInventorySlotPurchase(v1, p2 or "Free")
			if not v22 then
				return
			end
			if v22.ProductId then
				v11.PromptPurchase(p1, v22.ProductId)
			else
				local v3 = v1:CanAfford(v22.Price, v22.Currency)
				if not v3 then
					return
				end
				for k, v in pairs(v22.Stats) do
					if v1:GetStatValue(k).Value < v then
						return
					end
				end
				v3.Value = v3.Value - v22.Price
				local InventoryTiersPurchased = v1.PlayerData.InventoryTiersPurchased
				InventoryTiersPurchased.Value = InventoryTiersPurchased.Value + 1
				v15.ReportResourceEvent(p1, "Sink", "Currency", v3.Name, "UpgradeInventorySlots", v22.Price)
			end
			return true
		end
		v8.GetRemoteFunction("PurchaseEquipSlotsRemote").OnServerInvoke = function(p1, p2) --[[ Line: 2277 | Upvalues: v2 (ref), t (ref), v11 (ref), v15 (ref) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			local v22 = t.GetEquipSlotPurchase(v1, p2 or "Free")
			if not v22 then
				return
			end
			if v22.ProductId then
				v11.PromptPurchase(p1, v22.ProductId)
			else
				local v3 = v1:CanAfford(v22.Price, v22.Currency)
				if not v3 then
					return
				end
				for k, v in pairs(v22.Stats) do
					if v1:GetStatValue(k).Value < v then
						return
					end
				end
				v3.Value = v3.Value - v22.Price
				local EquipTiersPurchased = v1.PlayerData.EquipTiersPurchased
				EquipTiersPurchased.Value = EquipTiersPurchased.Value + 1
				v15.ReportResourceEvent(p1, "Sink", "Currency", v3.Name, "UpgradeEquippedHorses", v22.Price)
			end
			return true
		end
		v8.GetRemoteFunction("PreviewSlotNameRemote").OnServerInvoke = function(p1, p2) --[[ Line: 2306 | Upvalues: filterText (ref), v37 (ref) ]]
			return filterText(p1, p2, v37.MaxAnimalNameLength)
		end
		v8.GetRemoteFunction("PredictColors").OnServerInvoke = function(p1, p2, p3) --[[ Line: 2310 | Upvalues: v27 (ref) ]]
			return v27.GetPossibleColors(p2, p3)
		end
		v11.AddProductHandler("StorageSlots", function(p1, p2) --[[ Line: 2314 ]]
			local RobuxTiersPurchased = p1.PlayerData.StorageTiersPurchased.RobuxTiersPurchased
			RobuxTiersPurchased.Value = RobuxTiersPurchased.Value + 1
			local t = {
				ItemType = "StorageSlots"
			}
			t.ItemId = tostring(p2.Index)
			return t
		end)
		v11.AddProductHandler("EquipSlots", function(p1, p2) --[[ Line: 2319 ]]
			local RobuxTiersPurchased = p1.PlayerData.EquipTiersPurchased.RobuxTiersPurchased
			RobuxTiersPurchased.Value = RobuxTiersPurchased.Value + 1
			local t = {
				ItemType = "EquipSlots"
			}
			t.ItemId = tostring(p2.Index)
			return t
		end)
		v11.AddProductHandler("InventorySlots", function(p1, p2) --[[ Line: 2324 ]]
			local RobuxTiersPurchased = p1.PlayerData.InventoryTiersPurchased.RobuxTiersPurchased
			RobuxTiersPurchased.Value = RobuxTiersPurchased.Value + 1
			local t = {
				ItemType = "InventorySlots"
			}
			t.ItemId = tostring(p2.Index)
			return t
		end)
		v11.AddProductHandler("ItemPacks", function(p1, p2) --[[ Line: 2329 | Upvalues: v4 (ref) ]]
			for k, v in pairs(p2.Items) do
				local v1 = v4.GetByName(k)
				print(k, v1)
				local t = {
					Source = "RobuxPurchase",
					IgnoreLimit = true,
					ItemType = v1.ItemType,
					Name = v1.Name,
					Amount = v
				}
				t.ItemStream = if v1.Name == "Coins" then true else false
				p1:GiveItem(t)
			end
			if p2.Name ~= "TutorialStarterPack" then
				return {
					ItemType = p2.Name,
					ItemId = p2.Amount or 1
				}
			end
			p1.PlayerData.TutorialStarterPackTime.Purchased.Value = true
			return {
				ItemType = p2.Name,
				ItemId = p2.Amount or 1
			}
		end)
		v11.AddProductHandler("FoalNow", function(p1, p2) --[[ Line: 2348 | Upvalues: breedSlots (copy), t (ref), v8 (ref) ]]
			local _foalNowMale = p1._foalNowMale
			local _foalNowFemale = p1._foalNowFemale
			if not (_foalNowMale and _foalNowFemale) then
				return {
					ItemType = "FoalNow",
					ItemId = "NoSelection"
				}
			end
			local v1 = p1:GetAnimalSlot(_foalNowMale)
			local v2 = p1:GetAnimalSlot(_foalNowFemale)
			if not (v1 and v2) then
				return {
					ItemType = "FoalNow",
					ItemId = "InvalidSlots"
				}
			end
			p1._foalNowMale = nil
			p1._foalNowFemale = nil
			local v3 = breedSlots(p1.Player, _foalNowMale, _foalNowFemale, {
				SkipBreedWait = false,
				BreedWaitTime = 0,
				IgnoreBreedMissions = false
			})
			if not (v3 and #v3 > 0) then
				return {
					ItemType = "FoalNow",
					ItemId = "BirthFailed"
				}
			end
			local v4 = if t.GetGender(v1) == "Female" then if v1 then v1 else v2 else v2
			if not (v4 and #v4.Child.Value > 0) then
				return {
					ItemType = "FoalNow",
					ItemId = "BirthFailed"
				}
			end
			local _, v5 = t.BirthSlot(p1, v4)
			if v5 and #v5 > 0 then
				local v6 = v5[1]
				v8.GetRemoteEvent("DisplayFoalNowRemote"):FireClient(p1.Player, v6.Name)
				return {
					ItemType = "FoalNow",
					ItemId = v6.Name
				}
			else
				return {
					ItemType = "FoalNow",
					ItemId = "BirthFailed"
				}
			end
		end)
		v11.AddDeveloperProduct(3330225146, {
			Name = "FoalNow",
			ProductType = "FoalNow",
			ProductId = 3330225146
		})
		v8.GetRemoteFunction("StoreFoalNowSelectionRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 2403 | Upvalues: v2 (ref) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			if v1 then
				v1._foalNowMale = p2
				v1._foalNowFemale = p3
				return true
			else
				return false
			end
		end
		v8.GetRemoteEvent("DisplayFoalNowRemote")
	end
	for k, v in pairs({ v41, v40 }) do
		for k2, v5 in pairs(v) do
			v11.AddDeveloperProducts(v5)
		end
	end
end
t:Init()
return t