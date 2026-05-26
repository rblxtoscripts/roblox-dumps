-- https://lua.expert/
debug.setmemorycategory("MOB_SPAWNER")
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(ReplicatedStorage.Sonar)
local v2 = Sonar("Maid")
local v3 = Sonar("Mob")
local v4 = Sonar("Table")
local v5 = Sonar("PlayerWrapper")
local v6 = Sonar("AnimalDataService")
local v7 = Sonar("WeightedProbability")
local v8 = Sonar("ItemReplicationService")
local v9 = Sonar("Constants")
local v10 = Sonar("PositionUtils")
local MobSpawnData = v9.MobSpawnData
local t = {}
t.__index = t
local t2 = {}
local t3 = {}
local t4 = {}
local t5 = {}
local t6 = {}
local MobSpawns = workspace:FindFirstChild("MobSpawns")
local t7 = {}
local Storage = ReplicatedStorage.Storage
local Animals = Storage.DataTemplates.Animals
local t8 = {}
local t9 = {}
function t.new(p1, p2) --[[ new | Line: 41 | Upvalues: t (copy), v2 (copy), t8 (copy), t9 (copy), v5 (copy), t5 (copy), t3 (copy), t4 (copy), t6 (copy) ]]
	local v1 = if p2 then p2 else {}
	local v3 = setmetatable(v1, t)
	v3.Maid = v2.new()
	local v4 = p1:GetAttribute("SpawnsBoss")
	v3.IsBoss = v4
	v3.Object = p1
	if v4 then
		if v4 then
			v3.MobType = p1:GetAttribute("MobType")
			v3.SpawnCount = 1
			v3.WanderDistance = p1.Size.Magnitude / 2
			v3.ReturnToSpawnDistance = v3.WanderDistance * 2
			v3.MinLevel = 1
			v3.MaxLevel = 1
		end
	else
		v3.SpawnCount = v1.SpawnCount or (p1:GetAttribute("SpawnCount") or 1)
		v3.MobType = v1.MobType or p1:GetAttribute("MobType") or "Default"
		v3.WanderDistance = v1.WanderDistance or p1:GetAttribute("WanderDistance") or 15
		v3.ReturnToSpawnDistance = p1:GetAttribute("ReturnToSpawnDistance") or p1.Size.Magnitude * 5
		v3.ForceAdult = v1.ForceAdult or p1:GetAttribute("ForceAdult")
	end
	if not t8[v3.MobType] then
		t8[v3.MobType] = {}
	end
	table.insert(t8[v3.MobType], v3)
	t9[v3] = 0
	v3.SpawnWait = v1.SpawnWait or p1:GetAttribute("SpawnWait") or 1
	v3.TargetOctree = v5.PlayerOctree
	v3.Mobs = {}
	v3.TotalMobs = 0
	v3.Active = true
	if p1:GetAttribute("SpawnsFairys") then
		t5[p1] = v3
	end
	if v3.IsBoss then
		t4[p1] = v3
	else
		t3[p1] = v3
	end
	if not p1:GetAttribute("SpawnsFairys") then
		t6[p1] = v3
	end
	return v3
end
function t._getRandomPosition(p1) --[[ _getRandomPosition | Line: 108 | Upvalues: v10 (copy) ]]
	return v10.getRandomXAndZPosition(p1.Object.CFrame, p1.Object.Size)
end
function t._pickSpawn(p1, p2) --[[ _pickSpawn | Line: 115 ]]
	p2.Position = p1:_getRandomPosition() + p2.Size * Vector3.new(0, 0.5, 0)
end
local function pickRandomSpawner(p1, p2) --[[ pickRandomSpawner | Line: 119 | Upvalues: t8 (copy) ]]
	local t = {}
	for v1, v2 in t8[p1] do
		if not v2.Object:GetAttribute("DoNotSpawnMobs") and (v2 ~= p2 or math.random() < 0.2) then
			table.insert(t, v2)
		end
	end
	table.sort(t, function(p1, p2) --[[ Line: 135 ]]
		return p1.TotalMobs < p2.TotalMobs
	end)
	for i = 6, #t do
		t[i] = nil
	end
	if #t == 0 then
		return p2
	else
		return t[math.random(#t)]
	end
end
function t.GetRiggedModels() --[[ GetRiggedModels | Line: 149 | Upvalues: t2 (copy) ]]
	return t2
end
function t._getAge(p1, p2) --[[ _getAge | Line: 153 ]]
	local v1 = p2.SlotInfo and p2.SlotInfo.Age.Value or p1.ForceAdult and 100
	if v1 then
		return v1
	end
	if math.random(1, 10) <= 2 then
		return math.random(0, 43)
	else
		return math.random(44, 100)
	end
end
function t.SpawnMob(p1, p2) --[[ SpawnMob | Line: 166 | Upvalues: v9 (copy), v6 (copy), t2 (copy), v8 (copy), v3 (copy), v5 (copy), Animals (copy), MobSpawnData (copy), v7 (copy), t9 (copy), pickRandomSpawner (copy) ]]
	local v1 = if p2 then p2 else {}
	if p1.Object:GetAttribute("DoNotSpawnMobs") and not (v1.Species or p1.MobType):lower():find("boss") then
		return nil
	end
	local v32 = v1
	local v4 = p1:_getAge(v32)
	local v52 = v32.Species or p1.MobType
	if v52 == "Unicorn" and math.random() < v9.AnticornSpawnChance / 100 then
		v52 = "Anticorn"
	end
	local v62 = if v6.IsFoal(v4) then "Foal" else v52
	local v72 = t2[v62]
	local v82 = v8.Get(v62)
	local v92 = v72 or v82
	if not v92 then
		error("There was no mob model found for " .. v52 .. " for spawner " .. p1.Object.Name)
	end
	if not v72 then
		local v10 = v82:WaitForChild("Hitbox"):Clone()
		t2[v62] = v10
		v92 = v10
	end
	local v11 = v92:Clone()
	v11.Name = v52
	v11.Anchored = true
	p1:_pickSpawn(v11)
	local v12 = v3.new(v11, v52, v32)
	v12.UserWhitelist = v32.Player and {
		[v32.Player] = v5.getWrapperFromPlayer(v32.Player)
	} or nil
	local SlotInfo = (v32.SlotInfo or Animals):Clone()
	SlotInfo.Name = "SlotInfo"
	local v15
	if v32.SpawnPreset then
		v15 = v32.SpawnPreset
	else
		local v16 = v32.SpawnPreset or p1.Object:GetAttribute("MobSpawnData")
		assert(v16, "MobSpawner missing MobSpawnData Attribute", p1.Object:GetFullName())
		local v17 = MobSpawnData[v16]
		assert(v17, "No spawndata for id:" .. v16)
		v15 = v7.getRandomWeightedItem(v17)
	end
	if not v32.SlotInfo then
		local t = {
			Origin = v32.Origin or "Wild",
			Species = v52,
			Age = v4,
			Infertile = v32.Infertile,
			MaxCosmetics = v32.MaxCosmetics,
			MutationsToGuarantee = v32.MutationsToGuarantee,
			TotalMutationSlots = v32.TotalMutationSlots,
			OriginBuff = v32.OriginBuff
		}
		t.MutationSlotChances = if v52 == "Peryton" then {
	{
		Amount = 0,
		P = 0
	}
} else v32.MutationSlotChances
		local v20, v21
		if v52 == "Peryton" then
			v20 = true
			v21 = SlotInfo
		else
			v20 = false
			v21 = SlotInfo
		end
		t.AlwaysHasWings = v20
		v6.UpdateSlot(v21, t, v15)
	end
	v12.SpawnPreset = v15
	SlotInfo.Parent = v12.Model
	if game:GetService("RunService"):IsStudio() then
		v12.Model:SetAttribute("Preset", v15)
	end
	p1.Mobs[v12] = true
	p1.TotalMobs = p1.TotalMobs + 1
	if not v32.DoNotRespawn then
		v12.Died:Connect(function() --[[ Line: 263 | Upvalues: t9 (ref), p1 (copy), v12 (copy), pickRandomSpawner (ref) ]]
			task.spawn(function() --[[ Line: 264 | Upvalues: t9 (ref), p1 (ref), v12 (ref), pickRandomSpawner (ref) ]]
				t9[p1] = if t9[p1] then t9[p1] + 1 or 1 else 1
				v12.nearby = nil
				p1.Mobs[v12] = nil
				local v4 = p1
				v4.TotalMobs = v4.TotalMobs - 1
				local IsBoss = p1.IsBoss
				task.wait(p1.SpawnWait)
				pickRandomSpawner(p1.MobType, p1):SpawnMob()
			end)
			v12:Destroy()
		end)
	end
	v11:AddTag("Mob")
	return v12
end
function t.GetSlotInfoForSpawner(p1, p2) --[[ GetSlotInfoForSpawner | Line: 293 | Upvalues: Animals (copy), v7 (copy), MobSpawnData (copy), v6 (copy) ]]
	local SlotInfo = Animals:Clone()
	SlotInfo.Name = "SlotInfo"
	v6.UpdateSlot(SlotInfo, {
		Origin = "Wild",
		Age = 100,
		Species = p2.Species
	}, (v7.getRandomWeightedItem(MobSpawnData[p2.SpawnData], p2.Seed)))
	return SlotInfo
end
function t.SpawnFairy(p1) --[[ SpawnFairy | Line: 311 | Upvalues: t2 (copy), v8 (copy), v3 (copy), Animals (copy), t (copy) ]]
	local Fairy = t2.Fairy
	local v1 = v8.Get("Fairy")
	local v2
	if Fairy then
		v2 = Fairy or v1
	else
		local v32 = v1:WaitForChild("Hitbox"):Clone()
		t2.Fairy = v32
		v2 = v32
	end
	local Fairy_2 = v2:Clone()
	Fairy_2.Name = "Fairy"
	Fairy_2:AddTag("Fairy")
	p1:_pickSpawn(Fairy_2)
	local v4 = v3.new(Fairy_2, "Fairy")
	local SlotInfo = Animals:Clone()
	SlotInfo.Name = "SlotInfo"
	SlotInfo.Species.Value = "Fairy"
	SlotInfo.Age.Value = 100
	v4.SpawnPreset = nil
	SlotInfo.Parent = v4.Model
	if game:GetService("RunService"):IsStudio() then
		v4.Model:SetAttribute("Preset", nil)
	end
	v4.Died:Connect(function() --[[ Line: 346 | Upvalues: v4 (copy), p1 (copy), t (ref) ]]
		task.spawn(function() --[[ Line: 347 | Upvalues: v4 (ref), p1 (ref), t (ref) ]]
			v4.nearby = nil
			task.wait(p1.SpawnWait)
			t.GetRandomFairySpawner():SpawnFairy()
		end)
		v4:Destroy()
	end)
	Fairy_2:AddTag("Mob")
end
function t.SpawnBoss(p1, p2, p3, p4, p5) --[[ SpawnBoss | Line: 361 | Upvalues: Storage (copy), Sonar (copy), v9 (copy), v7 (copy), t2 (copy), v8 (copy), v3 (copy), Animals (copy), MobSpawnData (copy), v6 (copy) ]]
	local v1 = nil
	if p4 then
		local v2 = Storage.BossPresets:FindFirstChild(p4)
		if v2 then
			v1 = Sonar(v2)
		else
			warn("CustomPresetName \'" .. p4 .. "\' not found in BossPresets, using default tier preset")
		end
	end
	if not v1 then
		local v4 = Storage.BossPresets:FindFirstChild((p5 or "") .. "Tier" .. p2)
		if not v4 then
			v4 = Storage.BossPresets:FindFirstChild("Tier" .. p2)
		end
		v1 = Sonar(v4)
	end
	local SpawnSpecies = v1.SpawnSpecies
	if not SpawnSpecies then
		local v72 = v9["BossTier" .. p2] or v9.BossTier1
		SpawnSpecies = if v72 and v72.Species then v72.Species else {
	{
		Species = "Horse",
		P = 1
	}
}
	end
	local Species = SpawnSpecies[v7.getRandomWeightedItem(SpawnSpecies)].Species
	local v82 = t2[Species]
	local v92 = v8.Get(Species)
	local v10 = v82 or v92
	if not v10 then
		error("There was no BOSS mob model found for " .. Species .. " for spawner " .. p1.Object.Name)
	end
	if not v82 then
		local v11 = v92:WaitForChild("Hitbox"):Clone()
		t2[Species] = v11
		v10 = v11
	end
	local v12 = v10:Clone()
	v12.Name = Species
	v12:AddTag("Boss")
	v12:SetAttribute("Tier", p2)
	if p4 then
		v12:SetAttribute("CustomPresetName", p4)
	end
	if p5 and p5 ~= "" then
		v12:SetAttribute("BossType", p5)
	end
	local count = 0
	if p3 then
		for v13 in p3 do
			count = count + 1
		end
	end
	v12:SetAttribute("InitialPlayerCount", count)
	v12.Size = v12.Size * v1.Scale
	v12.Anchored = true
	p1:_pickSpawn(v12)
	local v14 = v3.new(v12, Species)
	v14.UserWhitelist = p3
	local SlotInfo = Animals:Clone()
	SlotInfo.Name = "SlotInfo"
	local v15 = p1.Object:GetAttribute("MobSpawnData")
	assert(v15, "MobSpawner missing MobSpawnData Attribute", p1.Object:GetFullName())
	assert(MobSpawnData[v15], "No spawndata for id:" .. v15)
	local v17 = v7.getRandomWeightedItem(MobSpawnData[p1.Object:GetAttribute("MobSpawnData")])
	v6.UpdateSlot(SlotInfo, {
		Origin = "Wild",
		Age = 100,
		Species = Species
	}, v17)
	local function overwriteVisuals(p1, p2, p3) --[[ overwriteVisuals | Line: 448 | Upvalues: SlotInfo (copy) ]]
		local v1 = SlotInfo:FindFirstChild(p1)
		local v2 = if v1 then v1:FindFirstChild(p2) else v1
		if not v2 then
			return
		end
		if typeof(p3) == "EnumItem" then
			p3 = p3.Name
		end
		v2.Value = p3
	end
	for v18, v19 in v1.Cosmetics do
		for v20, v21 in v19 do
			local v22 = SlotInfo:FindFirstChild(v20)
			local v23 = if v22 then v22:FindFirstChild(v18) else v22
			if v23 then
				v23.Value = if typeof(v21) == "EnumItem" then v21.Name else v21
			end
		end
	end
	v14.SpawnPreset = v17
	SlotInfo.Parent = v14.Model
	if game:GetService("RunService"):IsStudio() then
		v14.Model:SetAttribute("Preset", v17)
	end
	v12:AddTag("Mob")
	return v14
end
function t.DestroyMobs(p1) --[[ DestroyMobs | Line: 478 ]]
	for v1, v2 in p1.Mobs do
		v1:Destroy()
	end
	p1.Mobs = {}
end
function t.Destroy(p1) --[[ Destroy | Line: 485 | Upvalues: t6 (copy), t3 (copy), t4 (copy) ]]
	p1.Maid:Destroy()
	p1:DestroyMobs()
	t6[p1.Object] = nil
	t3[p1.Object] = nil
	t4[p1.Object] = nil
	setmetatable(p1, nil)
end
function t.GetSpawner(p1) --[[ GetSpawner | Line: 495 | Upvalues: t3 (copy), t4 (copy) ]]
	return t3[p1] or t4[p1]
end
function t.GetRandomSpawner() --[[ GetRandomSpawner | Line: 499 | Upvalues: t6 (copy) ]]
	for v1, v2 in t6 do
		if v2.MobType ~= "Peryton" and math.random() < 0.3 then
			return v2
		end
	end
	local _, v3 = next(t6)
	return v3
end
function t.GetRandomBossSpawner() --[[ GetRandomBossSpawner | Line: 514 | Upvalues: t4 (copy) ]]
	for v1, v2 in t4 do
		if math.random() < 0.3 then
			return v2
		end
	end
	local _, v3 = next(t4)
	return v3
end
function t.GetRandomFairySpawner() --[[ GetRandomFairySpawner | Line: 525 | Upvalues: t5 (copy) ]]
	local t = {}
	for k in pairs(t5) do
		table.insert(t, k)
	end
	if #t > 0 then
		return t5[t[math.random(1, #t)]]
	else
		return false
	end
end
function t.Create(p1, p2) --[[ Create | Line: 541 | Upvalues: t (copy), v4 (copy) ]]
	local v2, v3 = if p2 then p2 else {}, {}
	for v42, v5 in p1 do
		v3[v5] = t.new(v5, v4.Copy(v2))
	end
	return v3
end
function t.Init() --[[ Init | Line: 551 | Upvalues: v1 (copy), MobSpawns (copy), CollectionService (copy), t7 (copy), t (copy), t8 (copy), v9 (copy), pickRandomSpawner (copy) ]]
	if not v1 then
		return
	end
	if MobSpawns then
		for v12, v2 in { "MobSpawner" } do
			for v3, v4 in CollectionService:GetTagged(v2) do
				v4.CanTouch = false
				v4.CanCollide = false
				v4.CanQuery = false
				v4.Anchored = true
				v4.Transparency = 1
				if v4.Parent == MobSpawns and v4.Name ~= "Tutorial" then
					t7[v2] = t7[v2] or {}
					table.insert(t7[v2], v4)
				end
			end
		end
	end
	for v8, v92 in t7 do
		t.Create(v92)
	end
	for v10, v11 in t8 do
		for i = 1, v9.TotalSpeciesMobs[v10] or 1 do
			pickRandomSpawner(v10):SpawnMob()
		end
	end
	for j = 1, v9.FairiesInWorld do
		local v12 = t.GetRandomFairySpawner()
		if not v12 then
			break
		end
		v12:SpawnFairy()
	end
end
t.Init()
return t