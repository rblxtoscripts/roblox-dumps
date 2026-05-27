-- https://lua.expert/
local t = {}
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = RunService:IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = v1 and Sonar("ChatService")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("StorageUtils")
local v5 = Sonar("WeightedProbability")
local v6 = Sonar("TimeSeedClass")
local v7 = Sonar("RareMutationBoard", "Server")
local v8 = Sonar("PlaceTypeService")
local v9 = v1 and Sonar("MobSpawner")
local v10 = Sonar(v4.Get("SpeciesSpawning"))
local v11 = v8.IsTestGame()
local v12 = RunService:IsStudio() and false
local v13 = v6.new({
	Duration = v10.TimeToSpawn
})
local t2 = {}
local function getSpeciesToSpawn() --[[ getSpeciesToSpawn | Line: 36 | Upvalues: v10 (copy), v5 (copy) ]]
	if next(v10.SpeciesToSpawn) then
		return v5.getRandomWeightedItem(v10.SpeciesToSpawn)
	end
end
local function getRandomPreset(p1) --[[ getRandomPreset | Line: 44 | Upvalues: v10 (copy), v5 (copy) ]]
	if v10.Presets[p1] then
		return v5.getRandomWeightedItem(v10.Presets[p1])
	else
		warn("NO PRESETS FOUND FOR " .. p1)
		return "White"
	end
end
function t.SpawnMutation(p1) --[[ SpawnMutation | Line: 49 | Upvalues: v9 (copy), v10 (copy), v5 (copy), t2 (copy), v7 (copy), v2 (copy), v3 (copy), v11 (copy), v12 (copy) ]]
	local v1 = v9.GetRandomSpawner()
	local v22 = if next(v10.SpeciesToSpawn) then v5.getRandomWeightedItem(v10.SpeciesToSpawn) else nil
	if not v22 then
		return
	end
	local v32
	if v10.Presets[v22] then
		v32 = v5.getRandomWeightedItem(v10.Presets[v22])
	else
		warn("NO PRESETS FOUND FOR " .. v22)
		v32 = "White"
	end
	if not t2[v22] then
		t2[v22] = 0
	end
	local v4 = t2
	v4[v22] = v4[v22] + 1
	local v52 = nil
	v52 = v1:SpawnMob({
		DoNotRespawn = true,
		Species = v22,
		SpawnPreset = v32,
		MaxCosmetics = v10.MaxCosmetics[v22],
		OnTameCompleted = function(p1) --[[ OnTameCompleted | Line: 70 | Upvalues: t2 (ref), v22 (copy), v7 (ref), v52 (ref), v2 (ref), v3 (ref) ]]
			t2[v22] = math.max(t2[v22] - 1, 0)
			v7.RemoveSpawnedHorse(v52)
			v2:BroadcastMessage({
				Type = "SpeciesHorse",
				Message = "A Unique Species was Tamed!"
			})
			v3.getWrapperFromPlayer(p1):IncrementMission({
				Type = "TameUniqueSpecies",
				Amount = 1
			})
		end
	})
	if v11 and v12 then
		warn(v32, v22, v52.adornee)
	end
	v7.AddSpawnedHorse(v52, "Species")
	v2:BroadcastMessage({
		Type = "SpeciesHorse",
		Message = "A " .. v22 .. " has spawned!"
	})
end
function t.CanSpawnSpecies(p1) --[[ CanSpawnSpecies | Line: 99 | Upvalues: v10 (copy), t2 (copy), v12 (copy) ]]
	if v10.ChanceToSpawn < Random.new():NextNumber(0, 100) then
		return
	end
	local sum = 0
	for v1, v2 in t2 do
		sum = sum + v2
	end
	if not (v10.MaxSpeciesSpawned <= sum) then
		return true
	end
	if not v12 then
		return
	end
	warn("over max")
end
function t.Init(p1) --[[ Init | Line: 120 | Upvalues: v1 (copy), v13 (copy), t (copy) ]]
	if not v1 then
		return
	end
	v13.SeedChanged:Connect(function() --[[ Line: 122 | Upvalues: t (ref) ]]
		if t:CanSpawnSpecies() then
			t:SpawnMutation()
		end
	end)
end
t:Init()
return t