-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Color3")
local v2 = Sonar("WeightedProbability")
local v3 = Sonar("Constants")
local v4 = Sonar("SizeUtils")
local v5 = Sonar("MaterialUtils")
local v6 = Sonar("PatternUtils")
local v7 = Sonar("PaintUtils")
local v8 = Sonar("CosmeticUtils")
local v9 = Sonar("TransparencyUtils")
local v10 = Sonar("TailUtils")
local v11 = Sonar("ManeUtils")
local v12 = Sonar("HornUtils")
local v13 = Sonar("EarUtils")
local v14 = Sonar("MutationUtils")
local v15 = Sonar("ItemDataService")
local v16 = Sonar("ReflectanceUtils")
local v17 = Sonar("WhiskerUtils")
local v18 = Sonar("StickerUtils")
local Colors = v3.Colors
local ColorData = Colors.ColorData
local Eyes = v3.Eyes
local t = {}
function createShortlist(p1, p2, p3, p4, p5) --[[ createShortlist | Line: 28 | Upvalues: ColorData (copy), v1 (copy) ]]
	local t = {}
	for v3, v4 in ipairs(if p1 then p1 else ColorData) do
		table.insert(t, {
			color = v4,
			score = v1.calculate_score(v4.Oklab, p2)
		})
	end
	table.sort(t, function(p1, p2) --[[ Line: 39 ]]
		return p1.score < p2.score
	end)
	local t2 = {}
	for i = 1, math.min(p3, #t) do
		table.insert(t2, t[i].color)
	end
	table.insert(t2, p4)
	table.insert(t2, p5)
	return t2
end
local t2 = {
	Tails = v10.GetTail,
	Horns = v12.GetHorn,
	Manes = v11.GetMane,
	Ears = v13.GetEar,
	Whiskers = v17.GetWhisker,
	Stickers = v18.GetSticker
}
local v19 = Random.new()
function getRandomColorFromShortlist(p1, p2) --[[ getRandomColorFromShortlist | Line: 62 | Upvalues: v19 (copy) ]]
	local v2 = p1[(p2 and Random.new(p2) or v19):NextInteger(1, #p1)]
	if typeof(v2) == "table" then
		return v2.Color
	else
		return v2
	end
end
local function lerp(p1, p2, p3) --[[ lerp | Line: 73 ]]
	return (1 - p3) * p1 + p3 * p2
end
function calculateMixedColor(p1, p2) --[[ calculateMixedColor | Line: 77 ]]
	local Oklab = p1.Oklab
	local Oklab_2 = p2.Oklab
	return {
		L = 0.5 * Oklab.L + 0.5 * Oklab_2.L,
		a = 0.5 * Oklab.a + 0.5 * Oklab_2.a,
		b = 0.5 * Oklab.b + 0.5 * Oklab_2.b
	}
end
function t.GetPossibleColors(p1, p2, p3) --[[ GetPossibleColors | Line: 88 ]]
	return createShortlist(nil, calculateMixedColor(p1, p2), p3 or 3, p1, p2)
end
function t.GetColor(p1, p2, p3, p4) --[[ GetColor | Line: 94 | Upvalues: Colors (copy), v1 (copy) ]]
	local v12 = Colors.MappedColors[p1]
	local v2 = Colors.MappedColors[p2]
	local v4 = getRandomColorFromShortlist(createShortlist(p3, calculateMixedColor(v12, v2), 3, v12, v2), p4)
	if v4 then
		return v4
	end
	warn("No color mix for", v1.toHex(v12), v1.toHex(v2))
	return if math.random() < 0.5 then if v12 then v12 else v2 else v2
end
local t3 = {}
for v20, v21 in Eyes do
	v21.Name = v20
	table.insert(t3, v21)
end
t.EyesByIndex = t3
function t.GetEye(p1, p2, p3) --[[ GetEye | Line: 114 | Upvalues: Eyes (copy), v2 (copy) ]]
	local v1 = Eyes[p1] or Eyes.Brown
	local v22 = Eyes[p2] or Eyes.Brown
	local t = {
		Name = v1.Name
	}
	t.P = v1.Strength or v1.P
	local t2 = {
		Name = v22.Name
	}
	t2.P = v22.Strength or v22.P
	local t3 = { t, t2 }
	return t3[v2.getRandomWeightedItem(t3, p3)].Name
end
function t.GetRandomEye(p1) --[[ GetRandomEye | Line: 127 | Upvalues: v2 (copy), Eyes (copy) ]]
	return Eyes[v2.getRandomWeightedItem(Eyes, p1)].Name
end
function t.GetSize(p1, p2, p3) --[[ GetSize | Line: 132 | Upvalues: v4 (copy), v2 (copy) ]]
	local v1, v22 = v4.GetSizeIndex(p1)
	local v3, v42 = v4.GetSizeIndex(p2)
	local t = {}
	for i = math.min(v1, v3) - 1, math.max(v3, v1) + 1 do
		if v4.SizeArray[i] then
			local v5 = table.clone(v4.SizeArray[i])
			if v5.SizeMultiplier == v22.SizeMultiplier or v5.SizeMultiplier == v42.SizeMultiplier then
				v5.P = v5.P * 1.5
			end
			table.insert(t, v5)
		end
	end
	return t[v2.getRandomWeightedItem(t, p3)].Name
end
function t.GetTransparency(p1, p2, p3) --[[ GetTransparency | Line: 157 | Upvalues: v9 (copy), v2 (copy) ]]
	local v1, v22 = v9.GetTransparencyIndex(p1)
	local v3, v4 = v9.GetTransparencyIndex(p2)
	if not (v22 or v4) then
		return
	end
	if v22 and not v4 then
		return v22.Name
	end
	if v4 and not v22 then
		return v4.Name
	end
	if not (v22 and v4) then
		return
	end
	local t = {}
	for i = math.min(v1, v3) - 1, math.max(v3, v1) + 1 do
		if v9.TransparencyArray[i] then
			local v5 = table.clone(v9.TransparencyArray[i])
			if v5.Transparency == v22.Transparency or v5.Transparency == v4.Transparency then
				v5.P = v5.P * 1.5
			end
			table.insert(t, v5)
		end
	end
	return t[v2.getRandomWeightedItem(t, p3)].Name
end
function t.GetReflectance(p1, p2, p3) --[[ GetReflectance | Line: 188 | Upvalues: v16 (copy), v2 (copy) ]]
	local v1, v22 = v16.GetReflectanceIndex(p1)
	local v3, v4 = v16.GetReflectanceIndex(p2)
	if not (v22 or v4) then
		return
	end
	if v22 and not v4 then
		return v22.Name
	end
	if v4 and not v22 then
		return v4.Name
	end
	if not (v22 and v4) then
		return
	end
	local t = {}
	for i = math.min(v1, v3) - 1, math.max(v3, v1) + 1 do
		if v16.ReflectanceArray[i] then
			local v5 = table.clone(v16.ReflectanceArray[i])
			if v5.Reflectance == v22.Reflectance or v5.Reflectance == v4.Reflectance then
				v5.P = v5.P * 1.5
			end
			table.insert(t, v5)
		end
	end
	return t[v2.getRandomWeightedItem(t, p3)].Name
end
function t.GetRandomMaterial(p1, p2, p3) --[[ GetRandomMaterial | Line: 219 | Upvalues: v5 (copy) ]]
	return v5.GetRandomMaterial(p1, p2, p3).Name
end
function t.GetMaterial(p1, p2, p3, p4, p5) --[[ GetMaterial | Line: 223 | Upvalues: v5 (copy), v2 (copy) ]]
	local v1 = v5.GetMaterial(p1, p3)
	local v22 = v5.GetMaterial(p2, p3)
	if v1 and v1.Region and not table.find(typeof(v1.Region) == "table" and v1.Region or { v1.Region }, p4) then
		v1 = nil
	end
	if v22 and v22.Region and not table.find(typeof(v22.Region) == "table" and v22.Region or { v22.Region }, p4) then
		v22 = nil
	end
	if not (v1 or v22) then
		return
	end
	if v1 and not v22 then
		return v1.Name
	end
	if v22 and not v1 then
		return v22.Name
	end
	if not (v1 and v22) then
		return
	end
	local t = {}
	table.insert(t, v1)
	table.insert(t, v22)
	local v52 = v2.getRandomWeightedItem(t, p5)
	return t[v52] and t[v52].Name
end
function t.GetRandomPattern(p1, p2, p3) --[[ GetRandomPattern | Line: 259 | Upvalues: v6 (copy) ]]
	local v1 = v6.GetRandomPattern(p1, p2, p3)
	if v1 then
		return v1.Name
	else
		return v6.GetRandomPattern(p1, p2).Name
	end
end
function t.GetPattern(p1, p2, p3, p4, p5) --[[ GetPattern | Line: 267 | Upvalues: v6 (copy), v3 (copy), v2 (copy) ]]
	local t = {}
	for v1, v22 in { p1.Patterns:GetChildren(), (p2.Patterns:GetChildren()) } do
		for v5, v62 in v22 do
			local v32, v4
			if v62.Value then
				local v7 = v6.GetPattern(v62.Name, p3)
				if v7 then
					if v62.Name == "Nothing" then
						v32 = 1
					else
						v4 = if v1 == 1 and p1 then p1 else p2
						v32 = p5[v4] or 1
					end
					local v8 = v7.Strength * v32
					if not (t[v62.Name] and v8 < t[v62.Name].P) then
						t[v62.Name] = {
							P = v8
						}
					end
				end
			end
		end
	end
	t.Nothing = {
		P = v6.GetPattern("Nothing", p3).Strength
	}
	for v9, v10 in v3.Patterns[p3].Patterns do
		local CrossbreedRequirement = v10.CrossbreedRequirement
		if CrossbreedRequirement and (p1.Species.Value == CrossbreedRequirement or p2.Species.Value == CrossbreedRequirement) then
			local t2 = {}
			t2.P = v10.CrossbreedStrength or v10.P
			t[v10.Name] = t2
		end
	end
	return v2.getRandomWeightedItem(t, p4) or v6.GetRandomPattern(p3, p4)
end
function t.GetRandomPaint(p1, p2, p3) --[[ GetRandomPaint | Line: 299 | Upvalues: v7 (copy) ]]
	local v1 = v7.GetRandomPaint(p1, p2, p3)
	if v1 then
		return v1.Name
	else
		return v7.GetRandomPaint(p1, p2).Name
	end
end
function t.GetPaint(p1, p2, p3, p4, p5) --[[ GetPaint | Line: 307 | Upvalues: v7 (copy), v3 (copy), v2 (copy) ]]
	local t = {}
	for v1, v22 in { p1.Paints:GetChildren(), (p2.Paints:GetChildren()) } do
		for i, v in ipairs(v22) do
			local v32, v4
			if v.Value then
				local v5 = v7.GetPaint(v.Name, p3)
				if v5 then
					if v.Name == "Nothing" then
						v32 = 1
					else
						v4 = if v1 == 1 and p1 then p1 else p2
						v32 = p5[v4] or 1
					end
					local v6 = v5.Strength * v32
					if not (t[v.Name] and v6 < t[v.Name].P) then
						t[v.Name] = {
							P = v6
						}
					end
				end
			end
		end
	end
	t.Nothing = {
		P = v7.GetPaint("Nothing", p3).Strength
	}
	for v72, v8 in v3.Paints[p3].Paints do
		local CrossbreedRequirement = v8.CrossbreedRequirement
		if CrossbreedRequirement and (p1.Species.Value == CrossbreedRequirement or p2.Species.Value == CrossbreedRequirement) then
			local t2 = {}
			t2.P = v8.CrossbreedStrength or v8.P
			t[v8.Name] = t2
		end
	end
	return v2.getRandomWeightedItem(t, p4) or v7.GetRandomPaint(p3, p4)
end
function t.GetRandomCosmetic(p1, p2, p3) --[[ GetRandomCosmetic | Line: 339 | Upvalues: v8 (copy) ]]
	local v1 = v8.GetRandomCosmetic(p1, p2, p3)
	if v1 then
		return v1.Name
	else
		return v8.GetRandomCosmetic(p1, p2).Name
	end
end
function t.GetCosmetic(p1, p2, p3, p4, p5) --[[ GetCosmetic | Line: 347 | Upvalues: v8 (copy), v3 (copy), v2 (copy) ]]
	local t = {}
	for v1, v22 in { p1.Cosmetics:GetChildren(), (p2.Cosmetics:GetChildren()) } do
		for i, v in ipairs(v22) do
			local v32, v4
			if v.Value then
				local v5 = v8.GetCosmetic(v.Name, p3)
				if v5 then
					if v.Name == "Nothing" then
						v32 = 1
					else
						v4 = if v1 == 1 and p1 then p1 else p2
						v32 = p5[v4] or 1
					end
					local v6 = v5.Strength * v32
					if not (t[v.Name] and v6 < t[v.Name].P) then
						t[v.Name] = {
							P = v6
						}
					end
				end
			end
		end
	end
	t.Nothing = {
		P = v8.GetCosmetic("Nothing", p3).Strength
	}
	for v7, v82 in v3.Cosmetics[p3].Cosmetics do
		local CrossbreedRequirement = v82.CrossbreedRequirement
		if CrossbreedRequirement and (p1.Species.Value == CrossbreedRequirement or p2.Species.Value == CrossbreedRequirement) then
			local t2 = {}
			t2.P = v82.CrossbreedStrength or v82.P
			t[v82.Name] = t2
		end
	end
	return v2.getRandomWeightedItem(t, p4) or v8.GetRandomCosmetic(p3, p4)
end
function t.GetRandomMiscCosmetics(p1, p2, p3, p4) --[[ GetRandomMiscCosmetics | Line: 379 | Upvalues: v10 (copy), v11 (copy), v12 (copy), v13 (copy), v17 (copy), v18 (copy) ]]
	local v1 = if p3 then p3 else {}
	local v2 = if p4 then p4 else {}
	return v10.GetRandomTail(p1, p2, v1.Tails), v11.GetRandomMane(p1, p2, v1.Manes), v12.GetRandomHorn(p1, p2, v1.Horns, v2.Horn), v13.GetRandomEar(p1, p2, v1.Ears, v2.Ears), v17.GetRandomWhisker(p1, p2, v1.Whiskers, v2.Whiskers), v18.GetRandomSticker(p1, p2, v1.Sticker, v2.Sticker)
end
function t.GetMiscCosmetics(p1, p2, p3, p4, p5) --[[ GetMiscCosmetics | Line: 390 | Upvalues: t2 (copy), v2 (copy), v10 (copy), v11 (copy), v12 (copy), v13 (copy), v17 (copy), v18 (copy) ]]
	local t = {}
	for k, v in pairs({ "Tail", "Mane", "Horn", "Ear", "Whisker", "Sticker" }) do
		t[v .. "s"] = {}
		for k2, v3 in pairs({ p1, p2 }) do
			local v22 = t2[v .. "s"](v3.MiscCosmetics[v].Value, p3, true) or t2[v .. "s"]("Nothing", p3, true)
			if v22 then
				local t3 = {
					Name = v22.Name
				}
				t3.P = v22.Name ~= "Nothing" and p5[v3] or 1
				table.insert(t[v .. "s"], t3)
			end
		end
	end
	local v5 = v2.getRandomWeightedItem(t.Tails, p4)
	local v7 = v2.getRandomWeightedItem(t.Manes, if p4 then p4 + 1000 else p4)
	local v9 = v2.getRandomWeightedItem(t.Horns, if p4 then p4 + 2000 else p4)
	local v112 = v2.getRandomWeightedItem(t.Ears, if p4 then p4 + 2000 else p4)
	local v132 = v2.getRandomWeightedItem(t.Whiskers, if p4 then p4 + 2000 else p4)
	local v15 = v2.getRandomWeightedItem(t.Stickers, if p4 then p4 + 2000 else p4)
	local v16 = if t.Tails[v5] then t.Tails[v5].Name else v10.GetRandomTail(p3, p4).Name
	local v172 = if t.Manes[v7] then t.Manes[v7].Name else v11.GetRandomMane(p3, if p4 then p4 + 1000 else p4).Name
	local v19
	if t.Horns[v9] then
		v19 = t.Horns[v9].Name
	else
		v19 = v12.GetRandomHorn(p3, if p4 then p4 + 2000 else p4).Name
		warn(" Horn Not found, setting to nothing")
	end
	local v21 = if t.Ears[v112] then t.Ears[v112].Name else v13.GetRandomEar(p3, if p4 then p4 + 2000 else p4).Name
	local v23 = if t.Whiskers[v132] then t.Whiskers[v132].Name else v17.GetRandomWhisker(p3, if p4 then p4 + 2000 else p4).Name
	if t.Stickers[v15] then
		return v16, v172, v19, v21, v23, t.Stickers[v15].Name
	end
	return v16, v172, v19, v21, v23, v18.GetRandomSticker(p3, if p4 then p4 + 2000 else p4).Name
end
function t.GetMutations(p1, p2, p3, p4, p5) --[[ GetMutations | Line: 475 | Upvalues: v14 (copy), v2 (copy) ]]
	local v1 = if p3.Species.Value == "Peryton" then true else false
	local t = {}
	t[1] = not v1 and v14.GetMutation("Nothing") or nil
	local v3 = p5:GetWithModifiers({
		Name = "MutationInheritanceMultiplier",
		Default = 1,
		Slot = p1
	})
	local v4 = p5:GetWithModifiers({
		Name = "MutationInheritanceMultiplier",
		Default = 1,
		Slot = p2
	})
	for v5, v6 in p1.Mutations:GetChildren() do
		local v7 = v14.GetMutation(v6.Value)
		if v7 then
			local v8 = table.clone(v7)
			local v10 = v8
			v10.P = (v8.Strength or v8.P) * v3
			table.insert(t, v10)
		end
	end
	for v11, v12 in p2.Mutations:GetChildren() do
		local v13 = v14.GetMutation(v12.Value)
		if v13 then
			local v142 = table.clone(v13)
			local v16 = v142
			v16.P = (v142.Strength or v142.P) * v4
			table.insert(t, v16)
		end
	end
	local t2 = {}
	for i = #t, 1, -1 do
		if t[i] and t[i].Type == "Wings" then
			local v17 = table.remove(t, i)
			if v17.DoNotPassDown ~= true then
				table.insert(t2, v17)
			end
		end
	end
	if #t2 > 0 then
		local v19 = table.clone(t2[(p4 and Random.new(p4) or Random.new()):NextInteger(1, #t2)])
		if v1 then
			v19.P = 1000
		end
		table.insert(t, v19)
	end
	if v1 and #t2 == 0 then
		local v20 = v14.GetRandomMutation(p3, p4, {
			MutationTypeToRoll = "Wings",
			MutationChances = {
				Nothing = 0
			}
		})
		if v20 and v20 ~= "Nothing" then
			local v21 = v14.GetMutation(v20)
			if v21 and v21.DoNotPassDown ~= true then
				local v222 = table.clone(v21)
				v222.P = 1000
				table.insert(t, v222)
			else
				local t3 = {}
				for v23, v24 in v14.GetAllWings() do
					if v24.DoNotPassDown ~= true then
						table.insert(t3, v24)
					end
				end
				if #t3 > 0 then
					local v27 = table.clone(t3[(p4 and Random.new(p4) or Random.new()):NextInteger(1, #t3)])
					v27.P = 1000
					table.insert(t, v27)
				end
			end
		end
	end
	local v28, v29, v30
	if v1 then
		v28 = {
			{
				Amount = 0,
				P = 0
			}
		}
		v29 = p3
		v30 = p4
	else
		v29 = p3
		v30 = p4
		v28 = nil
	end
	local v31 = v14.GetRandomMutationSlots(v29, v30, v28, nil)
	for v32, v33 in v31 do
		local v34 = v2.getRandomWeightedItem(t, p4)
		local v35 = t[v34]
		if v35 and v35.Name ~= "Nothing" then
			table.remove(t, v34)
		end
		if v35 then
			v33.Value = v35.Name
		end
	end
	return v31
end
function t.GetSpecies(p1, p2, p3) --[[ GetSpecies | Line: 587 | Upvalues: v15 (copy), v2 (copy) ]]
	local v1 = v15.GetByName(p1.Species.Value)
	local t = {
		{
			Name = p1.Species.Value,
			P = v1.Strength
		},
		{
			Name = p2.Species.Value,
			P = v15.GetByName(p2.Species.Value).Strength
		}
	}
	return t[v2.getRandomWeightedItem(t, p3)].Name
end
return t