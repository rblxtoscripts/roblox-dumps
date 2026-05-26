-- https://lua.expert/
local t = {}
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = RunService:IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("EventUtils")
local v3 = Sonar("NotificationsService")
local v4 = Sonar("PlayerWrapper")
local v5 = v1 and Sonar("ChatService")
local v6 = v1 and Sonar("RareMutationBoard")
local v7 = Sonar("StorageUtils")
local v8 = v1 and Sonar("MobSpawner")
local v9 = Sonar("Constants")
local IsTestGame = v9.IsTestGame
local v10 = v7.GetConfig("Events")()
local v12 = v10.EventsData[v10.Event]
local AnySpeciesTable = v9.AnySpeciesTable
local function getRandomSpecies() --[[ getRandomSpecies | Line: 34 | Upvalues: AnySpeciesTable (copy) ]]
	return AnySpeciesTable[math.random(1, #AnySpeciesTable)]
end
function t.SpawnHorse(p1) --[[ SpawnHorse | Line: 38 | Upvalues: v8 (copy), AnySpeciesTable (copy), v4 (copy), v3 (copy), v6 (copy), v5 (copy) ]]
	local v1 = v8.GetRandomSpawner()
	local v2 = AnySpeciesTable[math.random(1, #AnySpeciesTable)]
	local v32 = nil
	v32 = v1:SpawnMob({
		SpawnPreset = "Easter",
		Origin = "Developer",
		Infertile = true,
		DoNotRespawn = true,
		MaxCosmetics = {
			MaxPatternsPerSlot = 4,
			MaxPaintsPerSlot = 2,
			MaxCosmeticsPerSlot = 4,
			AlwaysMax = true
		},
		MutationChances = {
			Wings = 100
		},
		Species = v2,
		OnTameCompleted = function(p1) --[[ OnTameCompleted | Line: 58 | Upvalues: v4 (ref), v3 (ref), v6 (ref), v32 (ref), v5 (ref), v2 (copy) ]]
			for v1, v22 in v4.GetPlayers() do
				local v33, v42 = pcall(function() --[[ Line: 60 | Upvalues: v3 (ref), v1 (copy) ]]
					v3.NotifyPlayer(v1, "EventHorseFound")
				end)
				if not v33 then
					warn(v42)
				end
			end
			v6.RemoveSpawnedHorse(v32)
			v5:BroadcastMessage({
				Type = "EventMutationFound",
				Message = "A rare Easter " .. v2 .. " has been found! \240\159\144\163"
			})
		end
	})
	for v42, v52 in v4.GetPlayers() do
		local v62, v7 = pcall(function() --[[ Line: 78 | Upvalues: v3 (ref), v42 (copy) ]]
			v3.NotifyPlayer(v42, "EventHorseSpawned")
		end)
		if not v62 then
			warn(v7)
		end
	end
	v5:BroadcastMessage({
		Type = "EventMutationHorse",
		Message = "Alert! A rare Easter " .. v2 .. " has spawned! Don\'t let it gallop away! \240\159\144\163"
	})
	task.spawn(function() --[[ Line: 91 | Upvalues: v6 (ref), v32 (ref) ]]
		v6.AddSpawnedHorse(v32, "Mutation", nil, "rbxassetid://119445264499782")
	end)
	v32.adornee.Destroying:Wait()
	return true
end
function t.Init(p1) --[[ Init | Line: 100 | Upvalues: v12 (copy), v1 (copy), v2 (copy), t (copy), IsTestGame (copy), Sonar (copy) ]]
	if not v12 then
		return
	end
	if v1 then
		task.spawn(function() --[[ Line: 106 | Upvalues: v2 (ref), t (ref), IsTestGame (ref) ]]
			local function f1() --[[ Line: 107 | Upvalues: t (ref) ]]
				repeat
					local v1 = pcall(function() --[[ Line: 110 | Upvalues: t (ref) ]]
						return t:SpawnHorse()
					end)
					task.wait(5)
				until v1
			end
			v2.spawnLoop(f1, if IsTestGame then 20 else 600)
		end)
	else
		Sonar("NotificationsClient").AddNotificationCallback("EventHorseSpawned", function(p1) --[[ Line: 118 | Upvalues: Sonar (ref) ]]
			Sonar("MessagesClient"):AddNotification({
				Type = "EventHorseSpawned",
				DoNotSkip = true,
				Duration = 3.5
			})
		end)
		Sonar("NotificationsClient").AddNotificationCallback("EventHorseFound", function(p1) --[[ Line: 126 | Upvalues: Sonar (ref) ]]
			Sonar("MessagesClient"):AddNotification({
				Type = "EventHorseFound",
				DoNotSkip = true,
				Duration = 3.5
			})
		end)
	end
end
t:Init()
return t