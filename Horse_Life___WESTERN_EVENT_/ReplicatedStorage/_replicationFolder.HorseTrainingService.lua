-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("Constants")
local v4 = Sonar("TimeSeedClass")
local v5 = Sonar("RemoteUtils")
local v6 = Sonar("LevelUtils")
local v7 = v4.new({
	Duration = 600
})
local TrainingTracks = ReplicatedStorage.Storage.Assets.TrainingTracks
t.TrainingTimer = v7
local t2 = {}
local t3 = {}
function t.GetCurrentTrainingType() --[[ GetCurrentTrainingType | Line: 28 | Upvalues: t2 (copy), v7 (copy) ]]
	return t2[Random.new(v7.CurrentSeed):NextInteger(1, #t2)]
end
function t.GetTrainingSeed() --[[ GetTrainingSeed | Line: 36 | Upvalues: v7 (copy) ]]
	return v7.CurrentSeed
end
function t.GetCurrentHorse(p1) --[[ GetCurrentHorse | Line: 40 | Upvalues: v2 (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	if v1 then
		return v1:GetCurrentAnimal()
	end
	local Character = p1.Character
	if not Character then
		return nil
	end
	local Humanoid = Character:FindFirstChild("Humanoid")
	if not Humanoid then
		return nil
	end
	local SeatPart = Humanoid.SeatPart
	if not SeatPart then
		return nil
	end
	if SeatPart:IsDescendantOf(Character.Animals) then
		return SeatPart.Parent
	else
		return nil
	end
end
function t.GetExperienceFromTraining(p1, p2) --[[ GetExperienceFromTraining | Line: 64 | Upvalues: v3 (copy), v6 (copy) ]]
	if not (p1 and p2) then
		return 0
	end
	local v1 = p1.Name
	local v2 = p2.Upgrades[v1].Value
	local v32 = if v2 >= 0 and v2 <= 4 then v3.HorseTrainingExperiencePercentage.OneToFour elseif v2 >= 5 and v2 <= 7 then v3.HorseTrainingExperiencePercentage.FourToSeven elseif v2 >= 8 and v2 <= 10 then v3.HorseTrainingExperiencePercentage.SevenToTen else v3.HorseTrainingExperiencePercentage.OverTen
	return math.floor(v6.GetNextLevelExperience(v2, "Stats") * (v32 / 100)), v1
end
function t.Init() --[[ Init | Line: 88 | Upvalues: TrainingTracks (copy), t2 (copy), v1 (copy), t (copy), t3 (copy), v5 (copy), v2 (copy), v6 (copy) ]]
	for v12, v22 in TrainingTracks:GetChildren() do
		table.insert(t2, v22)
	end
	table.sort(t2, function(p1, p2) --[[ Line: 94 ]]
		return p1.Name < p2.Name
	end)
	if not v1 then
		return
	end
	t.TrainingTimer.SeedChanged:Connect(function(p1) --[[ Line: 100 | Upvalues: t3 (ref) ]]
		for v1, v2 in t3 do
			t3[v1] = nil
		end
	end)
	game:GetService("Players").PlayerRemoving:Connect(function(p1) --[[ Line: 106 | Upvalues: t3 (ref) ]]
		t3[p1] = nil
	end)
	v5.GetRemoteFunction("StartTraining").OnServerInvoke = function(p1) --[[ Line: 110 | Upvalues: t3 (ref), t (ref) ]]
		if t3[p1] then
			return false, "You have already started training!"
		end
		if t.GetCurrentHorse(p1) then
			t3[p1] = {
				HasStarted = true,
				StartTime = os.time(),
				CurrentHorse = t.GetCurrentHorse(p1)
			}
			return true
		else
			return false, "You must be mounted to start training!"
		end
	end
	v5.GetRemoteFunction("EndTraining").OnServerInvoke = function(p1) --[[ Line: 126 | Upvalues: t3 (ref) ]]
		t3[p1] = nil
		return true, "Training ended early!"
	end
	v5.GetRemoteFunction("FinishTraining").OnServerInvoke = function(p1) --[[ Line: 132 | Upvalues: t3 (ref), v2 (ref), t (ref), v6 (ref) ]]
		if not t3[p1] then
			return false, "You have not started training!"
		end
		local CurrentHorse = t3[p1].CurrentHorse
		local v1 = v2.getWrapperFromPlayer(p1)
		if not (CurrentHorse and v1) then
			return false, "Unable to finish training!"
		end
		local v3, v4 = t.GetExperienceFromTraining(t.GetCurrentTrainingType(), CurrentHorse.SlotValue)
		if v3 > 0 then
			v6.GiveExperience(v1, {
				Stat = v4,
				Amount = v3,
				Slot = CurrentHorse.SlotValue
			})
		end
		v1:IncrementMission({
			Type = "HorseTraining",
			Amount = 1
		})
		t3[p1] = nil
		return true, "Training finished! You\'ve earned " .. v3 .. " experience for " .. v4 .. "!"
	end
end
t.Init()
return t