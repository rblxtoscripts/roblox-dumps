-- https://lua.expert/
local t = {}
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = RunService:IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("ChatService", "Server")
local v3 = Sonar("NotificationsService")
local v4 = Sonar("PlayerWrapper")
local v5 = Sonar("PlayerUtils")
local v6 = Sonar("StorageUtils")
local v7 = Sonar("WeightedProbability")
local v8 = Sonar("DayCycleService")
local v9 = Sonar("TimeSeedClass")
local v10 = Sonar("MutationUtils")
local v11 = Sonar("GuiUtils", "Client")
local v12 = Sonar("RareMutationBoard", "Server")
local v13 = Sonar("PlaceTypeService")
local v14 = Sonar("TutorialService", "Client")
local v15 = Sonar("GuiManager", {
	Context = "Client"
})
local v16 = v1 and Sonar("MobSpawner")
local v17 = Sonar(v6.Get("MutationSpawning"))
local v18 = v13.IsTestGame()
local v19 = RunService:IsStudio() and false
local v20 = v9.new({
	Duration = v17.TimeToSpawn
})
local t2 = {}
local v21 = v4.GetClient()
local function areRequirementsReached(p1) --[[ areRequirementsReached | Line: 44 | Upvalues: v8 (copy), t2 (copy) ]]
	local Requirements = p1.Requirements
	if not Requirements then
		return true
	end
	if Requirements.Time and Requirements.Time ~= v8:GetTimeState() then
		return
	end
	if Requirements.MaxToSpawn and (t2[p1.Name] and t2[p1.Name] >= Requirements.MaxToSpawn) then
	else
		return true
	end
end
local function getMutationToSpawn() --[[ getMutationToSpawn | Line: 67 | Upvalues: v17 (copy), v8 (copy), t2 (copy), v7 (copy) ]]
	local t = {}
	for k, v in pairs(v17.Mutations) do
		local v1
		local Requirements = v.Requirements
		v1 = if Requirements then if Requirements.Time and Requirements.Time ~= v8:GetTimeState() or Requirements.MaxToSpawn and (t2[v.Name] and t2[v.Name] >= Requirements.MaxToSpawn) then nil else true else true
		if v1 then
			t[k] = v.P
		end
	end
	if not next(t) then
		t[1] = 1
	end
	return v17.Mutations[v7.getRandomWeightedItem(t)]
end
local function getSpeciesToSpawn() --[[ getSpeciesToSpawn | Line: 81 | Upvalues: v7 (copy), v17 (copy) ]]
	return v7.getRandomWeightedItem(v17.SpeciesToSpawn)
end
function t.SpawnMutation(p1) --[[ SpawnMutation | Line: 85 | Upvalues: getMutationToSpawn (copy), v16 (copy), v19 (copy), v7 (copy), v17 (copy), t2 (copy), v12 (copy), v2 (copy), v5 (copy), v4 (copy), v3 (copy), v10 (copy), v18 (copy) ]]
	local v1 = getMutationToSpawn()
	if not v1 then
		return
	end
	local v22 = v16.GetRandomSpawner()
	if v19 then
		warn(v22)
	end
	local v32 = v7.getRandomWeightedItem(v17.SpeciesToSpawn)
	if not t2[v1.Name] then
		t2[v1.Name] = 0
	end
	local v42 = t2
	local v52 = v1.Name
	v42[v52] = v42[v52] + 1
	local v6 = nil
	v6 = v22:SpawnMob({
		DoNotRespawn = true,
		OriginBuff = "Mutated",
		TotalMutationSlots = 2,
		MaxCosmetics = {
			MaxPatternsPerSlot = 4,
			MaxPaintsPerSlot = 2,
			MaxCosmeticsPerSlot = 4,
			AlwaysMax = true
		},
		MutationsToGuarantee = {
			[v1.Name] = true
		},
		Species = v32,
		SpawnPreset = v1.SpawnPreset,
		OnTameCompleted = function(p1) --[[ OnTameCompleted | Line: 117 | Upvalues: t2 (ref), v1 (copy), v12 (ref), v6 (ref), v2 (ref), v5 (ref), v4 (ref), v3 (ref) ]]
			local v22 = v1.Name
			local v32 = t2[v1.Name] - 1
			t2[v22] = math.max(v32, 0)
			v12.RemoveSpawnedHorse(v6)
			if p1 then
				v2:BroadcastMessage({
					Type = "MutationHorse",
					Message = string.format(v1.ChatMessages.Found[math.random(1, #v1.ChatMessages.Found)], v5.GetPlayerName(p1))
				})
			end
			for v42, v52 in v4.GetPlayers() do
				local v62, v7 = pcall(function() --[[ Line: 130 | Upvalues: v3 (ref), v42 (copy), v1 (ref) ]]
					v3.NotifyPlayer(v42, "MutationHorseFound", v1.Index)
				end)
				if not v62 then
					warn(v7)
				end
			end
			v4.getWrapperFromPlayer(p1):IncrementMission({
				Type = "TameUniqueSpecies",
				Amount = 1
			})
		end
	})
	v12.AddSpawnedHorse(v6, "Mutation", (v10.GetMutation(v1.Name)))
	if v18 and v19 then
		warn(v1, v32, v6.adornee)
	end
	v2:BroadcastMessage({
		Type = "MutationHorse",
		Message = v1.ChatMessages.Spawned[math.random(1, #v1.ChatMessages.Spawned)]
	})
	for v8, v9 in v4.GetPlayers() do
		local v102, v11 = pcall(function() --[[ Line: 156 | Upvalues: v3 (ref), v8 (copy), v1 (copy) ]]
			v3.NotifyPlayer(v8, "MutationHorseSpawned", v1.Index)
		end)
		if not v102 then
			warn(v11)
		end
	end
end
function t.CanSpawnMutation(p1) --[[ CanSpawnMutation | Line: 165 | Upvalues: v17 (copy), t2 (copy) ]]
	if v17.ChanceToSpawn < Random.new():NextNumber(0, 100) then
		return
	end
	local sum = 0
	for v1, v2 in t2 do
		sum = sum + v2
	end
	if v17.MaxMutationsSpawned <= sum then
	else
		return true
	end
end
function t.Init(p1) --[[ Init | Line: 179 | Upvalues: v1 (copy), v20 (copy), t (copy), Sonar (copy), v11 (copy), v15 (copy), v17 (copy), v10 (copy), v14 (copy), v21 (copy) ]]
	if v1 then
		v20.SeedChanged:Connect(function() --[[ Line: 181 | Upvalues: t (ref) ]]
			if t:CanSpawnMutation() then
				t:SpawnMutation()
			end
		end)
	else
		Sonar("NotificationsClient").AddNotificationCallback("MutationHorseSpawned", function(p1) --[[ Line: 186 | Upvalues: v11 (ref), v15 (ref), v17 (ref), v10 (ref), Sonar (ref) ]]
			if not v11.GetGameState("MutationNotifications") then
				return
			end
			if v15.IsHUDOpen() then
				local v1 = v17.Mutations[p1]
				local v2 = v10.GetMutation(v1.Name)
				Sonar("MessagesClient"):AddNotification({
					Type = "MutationHorseSpawned",
					DoNotSkip = true,
					Duration = 7,
					RunBefore = function(p1) --[[ RunBefore | Line: 195 | Upvalues: v2 (copy) ]]
						p1.IconLabel.Image = v2.Image
					end,
					Message = v1.GuiMessages.Spawned[math.random(1, #v1.GuiMessages.Spawned)]
				})
			end
		end)
		Sonar("NotificationsClient").AddNotificationCallback("MutationHorseFound", function(p1) --[[ Line: 203 | Upvalues: v11 (ref), v14 (ref), v21 (ref), v17 (ref), v10 (ref), Sonar (ref) ]]
			if not v11.GetGameState("MutationNotifications") then
				return
			end
			if v14.HasCompletedPrimaryTutorial(v21) then
				local v1 = v17.Mutations[p1]
				local v2 = v10.GetMutation(v1.Name)
				Sonar("MessagesClient"):AddNotification({
					Type = "MutationHorseFound",
					DoNotSkip = true,
					Duration = 7,
					RunBefore = function(p1) --[[ RunBefore | Line: 215 | Upvalues: v2 (copy) ]]
						p1.IconLabel.Image = v2.Image
					end,
					Message = v1.GuiMessages.Found[math.random(1, #v1.GuiMessages.Found)]
				})
			end
		end)
	end
end
t:Init()
return t