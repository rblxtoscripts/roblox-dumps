-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AnalyticsService = game:GetService("AnalyticsService")
local RunService = game:GetService("RunService")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("RemoteUtils")
local v4 = Sonar("DataUtils")
local v5 = Sonar("MarketplaceUtils")
local v6 = Sonar("MutationUtils")
local v7 = Sonar("StorageUtils")
local v8 = Sonar("AnimalDataService")
local v9 = v1 and Sonar("AnimalManager")
local v10 = Sonar("AnimalRiggerService")
local v11 = not v1 and Sonar("GuiUtils")
local v12 = Sonar("HotbarService")
local v13 = Sonar("WeightedProbability")
local v14 = Sonar("MissionsService")
local v15 = Sonar("UpdateLogService")
local v16 = Sonar("SettingsService")
local v17 = Sonar("AnalyticsService", "Server")
local v18 = Sonar("PlaceTypeService")
local v19 = Sonar("Constants")
local TutorialId = v19.TutorialId
local v20 = RunService:IsStudio() and true
local v21 = Sonar(v7.Get("FunnelAnalytics"))
Sonar(v7.Get("LoadingAnalytics"))
local v22 = Sonar(v7.Get("TutorialHorsePresets"))
local v23 = Sonar(v7.Get("TutorialRewardPresets"))
local t2 = { "Taming", "Breeding", "Journal", "HorseSkills" }
local v24 = not v1 and v2.GetClient()
local v25 = v3.GetRemoteEvent("NewTutorialRemote")
local v26 = v3.GetRemoteEvent("StarterHorseRemote")
local v27 = v3.GetRemoteEvent("VisitTheHelpBoardRemote")
local v28 = v3.GetRemoteEvent("OpenedHelpGuiSectionsRemote")
local function postTutorialAnalytics(p1, p2, ...) --[[ postTutorialAnalytics | Line: 60 | Upvalues: v21 (copy), v17 (copy), AnalyticsService (copy) ]]
	p1["Posted" .. p2] = true
	local _timeSinceLastTutorialEvent = p1._timeSinceLastTutorialEvent
	if not _timeSinceLastTutorialEvent then
		_timeSinceLastTutorialEvent = math.floor((tick()))
	end
	local v3 = math.floor(tick() - _timeSinceLastTutorialEvent)
	local v4 = v21[p2]
	if not v4 then
		warn("Tutorial - No step can be found for", p2)
		return
	end
	local v5, v6 = v4(v3, ...)
	v17.ReportDesignEvent(p1.Player, "OldTutorialStep", {
		{
			Key = "Step",
			Value = p2
		}
	}, 1)
	p1._timeSinceLastTutorialEvent = math.floor((tick()))
	if v6 then
		AnalyticsService:LogOnboardingFunnelStepEvent(p1.Player, v6, p2, {
			[Enum.AnalyticsCustomFieldKeys.CustomField01.Name] = v5.progression02
		})
	end
end
local function postContextualTutorialAnalytics(p1, p2) --[[ postContextualTutorialAnalytics | Line: 95 ]]
	p1["Posted" .. p2] = true
end
local function postLoadingAnalytics(p1, p2) --[[ postLoadingAnalytics | Line: 101 | Upvalues: AnalyticsService (copy) ]]
	local _timeSinceLastLoadingEvent = p1._timeSinceLastLoadingEvent
	if not _timeSinceLastLoadingEvent then
		_timeSinceLastLoadingEvent = math.floor((tick()))
	end
	math.floor(tick() - _timeSinceLastLoadingEvent)
	AnalyticsService:LogFunnelStepEvent(p1.Player, "LoadingFunnel", game.JobId, p2, "Loading" .. p2)
	p1._timeSinceLastLoadingEvent = math.floor((tick()))
end
local v29 = nil
v29 = {
	HorseSelection = {
		Init = function(p1) --[[ Init | Line: 120 | Upvalues: t (copy), v16 (copy) ]]
			t.SetPrimaryStage(p1, "HorseSelection")
			t.PostTutorialStage(p1, "StartedSelection")
			local function setSetting() --[[ setSetting | Line: 124 | Upvalues: v16 (ref), p1 (copy) ]]
				v16.SetSettingValue(p1, "CameraSmoothing", true)
			end
			p1.Maid:GiveTask(p1:GetABTestStateChangedSignal("CameraShake"):Connect(setSetting))
			v16.SetSettingValue(p1, "CameraSmoothing", true)
		end
	},
	TameHorse = {
		Init = function(p1) --[[ Init | Line: 133 | Upvalues: t (copy) ]]
			if #p1.PlayerData.Animals:GetChildren() <= 0 then
				t.SetPrimaryStage(p1, "HorseSelection")
				p1.PlayerData.Missions.SpeciesUnlocks.Horse.Started.Value = true
			else
				p1.TutorialTameHorse = true
			end
		end,
		Run = function(p1, p2) --[[ Run | Line: 145 | Upvalues: t (copy), v22 (copy), v18 (copy), v9 (copy), v12 (copy), v29 (ref) ]]
			if not t.IsAtPrimaryStage(p1, "HorseSelection") then
				return
			end
			t.PostTutorialStage(p1, "HorseSelected", p2)
			local v2 = math.clamp(p2, 1, #v22)
			local PurchasedStartHorse = p1.PlayerData.Tutorial.PurchasedStartHorse.Value
			local v3 = if v22[v2].ProductId and not (PurchasedStartHorse or v18.IsTestGame()) then 1 else v2
			local v4 = t.GetHorseSlotInfoForSelection(p1, v3, {
				Equipped = true
			})
			v4.Parent = p1:GetItemFolder("Animals")
			v9.SpawnAnimal(p1.Player, v4)
			local v5 = p1:GetItemValue("WovenLasso")
			v5.Value = v5.Value + 10
			p1.HotbarData["1"].Value = "WovenLasso"
			if p1.Hotbar then
				v12:UpdateBackpack(p1)
			end
			if v4.Species.Value == "Horse" then
				if PurchasedStartHorse then
					t.GetHorseSlotInfoForSelection(p1, 3).Parent = p1:GetItemFolder("Animals")
				end
			else
				t.GetHorseSlotInfoForSelection(p1, 1).Parent = p1:GetItemFolder("Animals")
			end
			t.SetPrimaryStage(p1, "TameHorse")
			t.PostTutorialStage(p1, "TameHorse", v3)
			if p1.Player:GetAttribute("TutorialEnabled") then
				return true
			end
			v29.BreedingHorse.Run(p1, v3)
			p1.TutorialSkipBreedWait = false
			p1.TutorialIgnoreBreedMission = false
			v29.TutorialMissions.Run(p1, true)
			p1.TutorialTameHorse = false
			p1.TutorialHarvestedNode = false
			v29.ForageFeeding.Run(p1)
			p1.TutorialSameGenderTotal = false
			p1.TutorialBreedWait = false
			p1.TutorialForceAdultAge = false
			return true
		end
	},
	BreedingHorse = {
		Init = function(p1) --[[ Init | Line: 209 | Upvalues: t (copy), v8 (copy) ]]
			if not t.GetHorseOfAge(p1, "Baby") then
				p1.TutorialSkipBreedWait = true
				p1.TutorialIgnoreBreedMission = true
			end
			for v1, v2 in p1.PlayerData.Animals:GetChildren() do
				if v8.GetAge(v2) ~= "Baby" then
					v2.Equipped.Value = v1 == 1
				end
			end
		end,
		Run = function(p1, p2) --[[ Run | Line: 223 | Upvalues: t (copy) ]]
			if t.IsAtPrimaryStage(p1, "TameHorse") then
				local v1 = t.GetHorseSlotInfoForTame(p1, p2, true)
				v1.Parent = p1:GetItemFolder("Animals")
				p1.TutorialSkipBreedWait = true
				p1.TutorialIgnoreBreedMission = true
				t.SetPrimaryStage(p1, "BreedingHorse")
				t.PostTutorialStage(p1, "BreedingHorse")
				return v1.Name
			end
		end
	},
	TutorialMissions = {
		Init = function(p1) --[[ Init | Line: 241 ]]
			if not p1.TutorialData.Missions.WelcomeToHorseLife.Missions["1"].Value then
				p1.TutorialTameHorse = true
			end
			p1.TutorialSameGenderTotal = true
			p1.TutorialBreedWait = 420
		end,
		Run = function(p1, p2) --[[ Run | Line: 251 | Upvalues: t (copy), v14 (copy) ]]
			if not t.IsAtPrimaryStage(p1, "BreedingHorse") then
				return
			end
			p1.TutorialTameHorse = true
			p1.TutorialIgnoreBreedMission = false
			p1.TutorialSameGenderTotal = true
			p1.TutorialBreedWait = 420
			p1.TutorialForceAdultAge = true
			if not p2 then
				v14.PinMission(p1, p1.TutorialData.Missions.WelcomeToHorseLife, "StartMission")
			end
			t.SetPrimaryStage(p1, "TutorialMissions")
			t.PostTutorialStage(p1, "TutorialMissions")
			return true
		end
	},
	ForageFeeding = {
		Init = function(p1) --[[ Init | Line: 274 | Upvalues: v14 (copy) ]]
			v14.PinMission(p1, p1.PlayerData.Missions.SpeciesUnlocks.Horse, "StartMission")
			if p1.PlayerData.Missions.SpeciesUnlocks.Horse.Missions["1"].Value then
				local v1 = p1:GetItemValue("Apple")
				v1.Value = v1.Value + math.clamp(5 - v1.Value, 0, 5)
			else
				p1.TutorialHarvestedNode = true
			end
			p1.TutorialSameGenderTotal = true
			p1.TutorialBreedWait = 420
			if not (p1:GetStatValue("HorsesFed").Value <= 0) then
				return
			end
			for v4, v5 in p1.PlayerData.Animals:GetChildren() do
				if v5.TemporaryBreedCooldown.Value > 0 then
					v5.TemporaryBreedCooldown.Value = p1.TutorialBreedWait
					v5.LastBreed.Value = workspace:GetServerTimeNow()
				end
			end
		end,
		Run = function(p1, p2) --[[ Run | Line: 302 | Upvalues: t (copy), v14 (copy) ]]
			if not t.IsAtPrimaryStage(p1, "TutorialMissions") then
				return
			end
			p1.TutorialHarvestedNode = true
			p1.TutorialSameGenderTotal = true
			p1.TutorialBreedWait = 420
			p1.TutorialForceAdultAge = true
			local v2 = p1:GetItemValue("Apple")
			v2.Value = v2.Value + math.clamp(5 - v2.Value, 0, 5)
			if not p2 then
				v14.PinMission(p1, p1.PlayerData.Missions.SpeciesUnlocks.Horse, "StartMission")
			end
			t.SetPrimaryStage(p1, "ForageFeeding")
			t.PostTutorialStage(p1, "ForageFeeding")
			return true
		end
	},
	Complete = {
		Init = function(p1) --[[ Init | Line: 329 | Upvalues: t (copy) ]]
			t.SetPrimaryStage(p1, "Complete")
			p1.PlayerData.Missions.SpeciesUnlocks.Horse.Started.Value = true
		end,
		Run = function(p1) --[[ Run | Line: 334 | Upvalues: t (copy), v14 (copy), v15 (copy) ]]
			if not t.IsAtPrimaryStage(p1, "ForageFeeding") then
				return
			end
			p1.PlayerData.Tutorial.TutorialCompletedAt.Value = workspace:GetServerTimeNow()
			p1.TutorialSameGenderTotal = false
			p1.TutorialBreedWait = false
			p1.TutorialForceAdultAge = false
			if p1.Player:GetAttribute("TutorialEnabled") then
				v14.StartSpeciesUnlock(p1.Player, "Pony", true, true)
			end
			t.SetPrimaryStage(p1, "Complete")
			t.PostTutorialStage(p1, "CompletedTutorial")
			v15.SetLastPlayedUpdate(p1)
			return true
		end
	}
}
local t3 = {}
function t.PostTutorialStage(p1, ...) --[[ PostTutorialStage | Line: 365 | Upvalues: v1 (copy), postTutorialAnalytics (copy), v3 (copy) ]]
	if v1 then
		if p1.Player:GetAttribute("TutorialEnabled") ~= "False" then
			task.spawn(postTutorialAnalytics, p1, ...)
		end
	else
		v3.GetRemoteEvent("PostTutorialStageRemote"):FireServer(p1, ...)
	end
end
function t.IsInTutorial(p1) --[[ IsInTutorial | Line: 378 | Upvalues: t (copy) ]]
	return not t.HasCompletedPrimaryTutorial(p1)
end
v14.IsInTutorial = t.IsInTutorial
function t.HasCompletedPrimaryTutorial(p1) --[[ HasCompletedPrimaryTutorial | Line: 384 ]]
	if #p1.PrimaryTutorialStageValue.Value <= 0 and (#p1.PlayerData.Animals:GetChildren() > 0 or (p1:GetStatValue("Tames").Value > 0 or p1:GetStatValue("FoalsBorn").Value > 0)) then
		return "Complete"
	end
	if p1.PrimaryTutorialStageValue.Value == "Complete" then
		return true
	end
	if p1.PlayerData.NewTutorialComplete.Value then
		return true
	end
end
v10.HasCompletedPrimaryTutorial = t.HasCompletedPrimaryTutorial
function t.GetPrimaryStage(p1) --[[ GetPrimaryStage | Line: 403 | Upvalues: t (copy) ]]
	if t.HasCompletedPrimaryTutorial(p1) then
		return "Complete"
	end
	if #p1.PrimaryTutorialStageValue.Value <= 0 then
		return "HorseSelection"
	else
		return p1.PrimaryTutorialStageValue.Value
	end
end
function t.HasCompletedContextualTutorial(p1, p2) --[[ HasCompletedContextualTutorial | Line: 414 ]]
	local v1 = p1.ContextualTutorialData:FindFirstChild(p2)
	if v1 then
		return v1.Value
	end
end
function t.SetContextualStage(p1, p2, p3) --[[ SetContextualStage | Line: 421 ]]
	local v1 = p1.ContextualTutorialData:FindFirstChild(p2)
	if not v1 then
		return
	end
	v1.Value = not p3
end
function t.IsTutorialWorld() --[[ IsTutorialWorld | Line: 428 | Upvalues: v18 (copy) ]]
	return v18.IsMainWorld()
end
function t.IsAtPrimaryStage(p1, p2) --[[ IsAtPrimaryStage | Line: 432 | Upvalues: t (copy) ]]
	return t.GetPrimaryStage(p1) == p2
end
function t.SetPrimaryStage(p1, p2) --[[ SetPrimaryStage | Line: 436 ]]
	p1.PrimaryTutorialStageValue.Value = p2
end
function t.GetHorseWithChild(p1) --[[ GetHorseWithChild | Line: 440 ]]
	for v1, v2 in p1.PlayerData.Animals:GetChildren() do
		if #v2.Child.Value > 0 then
			return v2
		end
	end
end
function t.GetHorseOfAge(p1, p2) --[[ GetHorseOfAge | Line: 448 | Upvalues: v8 (copy) ]]
	for v1, v2 in p1.PlayerData.Animals:GetChildren() do
		if v8.GetAge(v2) == p2 then
			return v2
		end
	end
end
function t.CanClaimTutorialReward(p1) --[[ CanClaimTutorialReward | Line: 456 ]]
	return not p1.PlayerData.Tutorial.ClaimedReward.Value
end
function t.GetTutorialReward(p1) --[[ GetTutorialReward | Line: 460 | Upvalues: v23 (copy) ]]
	return v23[2]
end
function t.GetRandomPreset(p1, p2, p3) --[[ GetRandomPreset | Line: 474 ]]
	return p2[Random.new(p1.Player.UserId * p3):NextInteger(1, #p2)]
end
function t.GetHorseSlotInfoForSelection(p1, p2, p3) --[[ GetHorseSlotInfoForSelection | Line: 478 | Upvalues: v22 (copy), v8 (copy) ]]
	local v1 = if p3 then p3 else {}
	local v2 = v22[p2]
	local t = {
		Gender = "Male",
		Origin = "Wild",
		Age = 66,
		DoNotParent = true,
		Starter = true,
		NoMutations = true,
		Species = v2.Species or "Horse"
	}
	local v3, v4, v5
	if v2.Presets then
		v3 = v2.Presets[Random.new(p1.Player.UserId * p2):NextInteger(1, #v2.Presets)]
		if v3 then
			v4 = v1
			v5 = p1
		else
			v3 = nil
			v4 = v1
			v5 = p1
		end
	else
		v3 = nil
		v4 = v1
		v5 = p1
	end
	t.Preset = v3
	t.MaxCosmetics = v2.MaxCosmetics or {
		MaxPatternsPerSlot = 3,
		MaxPaintsPerSlot = 2,
		MaxCosmeticsPerSlot = 2
	}
	t.Seed = p1.Player.UserId * p2
	t.Equipped = v4.Equipped
	t.DoNotIncrementCount = v4.DoNotIncrementCount
	return v8.CreateSlot(v5, t)
end
function t.GetGenderFromTotalBreedable(p1) --[[ GetGenderFromTotalBreedable | Line: 504 | Upvalues: v8 (copy) ]]
	local t = {
		Male = 0,
		Female = 0
	}
	for v1, v2 in p1.PlayerData.Animals:GetChildren() do
		if v8.CanBreedSlot(p1, v2, nil, true) == true and t[v8.GetGender(v2)] then
			local v3 = v8.GetGender(v2)
			t[v3] = t[v3] + 1
		end
	end
	if t.Male > t.Female then
		return "Female"
	else
		return "Male"
	end
end
function t.GetHorseSlotInfoForTame(p1, p2, p3) --[[ GetHorseSlotInfoForTame | Line: 522 | Upvalues: v13 (copy), v19 (copy), v8 (copy) ]]
	local v1 = (p2 + p1.Player.UserId) * 1000
	return v8.CreateSlot(p1, {
		Species = "Horse",
		Gender = "Female",
		Origin = "Wild",
		Age = 100,
		DoNotParent = true,
		NoMutations = true,
		Preset = v13.getRandomWeightedItem(v19.MobSpawnData.Pony, v1) or nil,
		Seed = v1,
		DoNotIncrementCount = not p3
	})
end
function t.GetHorseSlotInfoForReward(p1, p2, p3) --[[ GetHorseSlotInfoForReward | Line: 542 | Upvalues: t (copy), v13 (copy), v8 (copy) ]]
	local v1 = if p2 then p2 else t.GetTutorialReward(p1)
	local v2 = p1.Player.UserId * 1000
	return v8.CreateSlot(p1, {
		Gender = "Male",
		Origin = "Wild",
		Age = 100,
		DoNotParent = true,
		Species = v1.Species,
		Preset = v13.getRandomFromTable(v1.Presets, v2),
		Seed = v2,
		DoNotIncrementCount = not p3,
		MaxCosmetics = v1.MaxCosmetics,
		MutationChances = v1.MutationChances
	})
end
function t.CanDoActionInTutorial(p1) --[[ CanDoActionInTutorial | Line: 568 | Upvalues: t (copy) ]]
	if t.GetGameState(p1) then
		return true
	else
		t.NotifyCannotDoAction(p1)
	end
end
function t.NotifyCannotDoAction(p1) --[[ NotifyCannotDoAction | Line: 577 | Upvalues: Sonar (copy) ]]
	Sonar("NotificationsClient").Notify({
		Message = "You cannot do this right now, follow the tutorial!",
		Preset = "Red",
		Type = "TutorialPrompt" .. p1
	})
end
function t.PromptPopupInfo(p1) --[[ PromptPopupInfo | Line: 585 | Upvalues: Sonar (copy), v24 (copy), v3 (copy) ]]
	Sonar("PromptClient").Prompt({
		Type = "Tutorial",
		OverwritePrompt = true,
		KeepVisible = true,
		Setup = function(p12) --[[ Setup | Line: 590 | Upvalues: p1 (copy) ]]
			for k, v in pairs(p12.Content.Prompts:GetChildren()) do
				v.Visible = v.Name == p1
			end
		end,
		Run = function() --[[ Run | Line: 595 | Upvalues: v24 (ref), p1 (copy), v3 (ref) ]]
			if not v24.PlayerData.Tutorial.Prompts:FindFirstChild(p1) then
				return true
			end
			v3.GetRemoteEvent("SetTutorialPopUpPromptRemote"):FireServer(p1)
			return true
		end,
		Cancel = function() --[[ Cancel | Line: 601 ]]
			return true
		end
	})
end
function t.TryPromptInfo(p1) --[[ TryPromptInfo | Line: 607 | Upvalues: v24 (copy), t (copy) ]]
	if not v24.PlayerData.Tutorial.Prompts[p1].Value then
		t.PromptPopupInfo(p1)
	end
end
function t.GetGameState(p1) --[[ GetGameState | Line: 612 | Upvalues: v19 (copy) ]]
	if v19.GameStates[p1] == nil then
		return true
	else
		return v19.GameStates[p1]
	end
end
function t.SetGameElements(...) --[[ SetGameElements | Line: 620 | Upvalues: v11 (copy) ]]
	return v11.SetGameElements(...)
end
function t._setupNewTutorial(p1) --[[ _setupNewTutorial | Line: 624 | Upvalues: t (copy), v9 (copy), v12 (copy), v14 (copy), v15 (copy), v6 (copy), v1 (copy), v5 (copy), v17 (copy), v26 (copy), v2 (copy), v25 (copy), v20 (copy), v28 (copy), t2 (copy), v27 (copy) ]]
	local t3 = {
		PreTutorialOption = function(p1) --[[ PreTutorialOption | Line: 627 ]]
			p1:GetItemFolder("Animals"):ClearAllChildren()
			p1:GetCurrencyValue("Coins").Value = 0
			p1:GetItemValue("Apple").Value = 0
			p1:GetItemValue("WovenLasso").Value = 0
			p1:GetItemValue("StringLasso").Value = 0
		end,
		PreTutorialCinematic = function(p1) --[[ PreTutorialCinematic | Line: 645 | Upvalues: t (ref), v9 (ref) ]]
			local v1 = t.GetHorseSlotInfoForSelection(p1, p1.PlayerData.StarterHorseSelected.Value, {
				Equipped = true
			})
			v1.Parent = p1:GetItemFolder("Animals")
			v9.SpawnAnimal(p1.Player, v1):SetAttribute("StarterHorse", true)
		end,
		LearnToFeedYourHorse = function(p1) --[[ LearnToFeedYourHorse | Line: 659 ]]
			local v1 = p1:GetItemValue("Apple")
			v1.Value = v1.Value + math.clamp(5 - v1.Value, 0, 5)
		end,
		LearnToTameAHorse = function(p1) --[[ LearnToTameAHorse | Line: 666 | Upvalues: v12 (ref) ]]
			local v1 = p1:GetItemValue("WovenLasso")
			v1.Value = v1.Value + math.clamp(10 - v1.Value, 0, 10)
			p1.HotbarData["1"].Value = "WovenLasso"
			if p1.Hotbar then
				v12:UpdateBackpack(p1)
			end
			p1.TutorialTameHorse = true
		end,
		FinishTutorial = function(p1) --[[ FinishTutorial | Line: 683 | Upvalues: t (ref), v14 (ref), v15 (ref), v6 (ref) ]]
			if t.HasCompletedPrimaryTutorial(p1) then
				return
			end
			p1.PlayerData.NewTutorialComplete.Value = true
			t.SetPrimaryStage(p1, "Complete")
			p1.PlayerData.Tutorial.TutorialCompletedAt.Value = workspace:GetServerTimeNow()
			p1.TutorialSameGenderTotal = false
			p1.TutorialBreedWait = false
			p1.TutorialForceAdultAge = false
			if p1.Player:GetAttribute("TutorialEnabled") then
				v14.StartSpeciesUnlock(p1.Player, "Pony", true, true)
			end
			p1.PlayerData.Missions.SpeciesUnlocks.Horse.Started.Value = true
			t.PostTutorialStage(p1, "CompletedTutorial")
			p1.PlayerData.Tutorial.Missions.WelcomeToHorseLife.Started.Value = true
			v14.PinMission(p1, p1.PlayerData.Tutorial.Missions.WelcomeToHorseLife)
			v15.SetLastPlayedUpdate(p1)
			local v1 = p1:GetItemValue("Apple")
			v1.Value = v1.Value + math.clamp(5 - v1.Value, 0, 5)
			local v4 = p1:GetItemValue("WovenLasso")
			v4.Value = v4.Value + math.clamp(10 - v4.Value, 0, 10)
			local v7 = p1:GetItemValue("StringLasso")
			v7.Value = v7.Value + math.clamp(5 - v7.Value, 0, 5)
			local v10 = t.GetTutorialReward(p1)
			if not v10 then
				return
			end
			local v11 = t.GetHorseSlotInfoForReward(p1, v10, true)
			for v12, v13 in v11.Mutations:GetChildren() do
				local v142 = v6.GetMutation(v13.Value)
				if v142 and v142.Type == "Wings" then
					v13.Level.Value = 2
					break
				end
			end
			v11.Age.Value = 100
			v11.Serial.Value = v11.Serial.Value .. ":TutorialCompletion"
			v11.Parent = p1:GetItemFolder("Animals")
		end
	}
	if v1 then
		v5.AddProductHandler("TutorialHorse", function(p1, p2) --[[ Line: 761 | Upvalues: v17 (ref) ]]
			p1.TutorialData.PurchasedStartHorse.Value = true
			p1.PlayerData.StarterHorseSelected.Value = 3
			v17.ReportDesignEvent(p1.Player, "StarterHorse", {
				{
					Key = "HorseChosen",
					Value = "Black Unicorn"
				}
			}, 1)
			return {
				ItemType = "TutorialHorse",
				ItemId = 1
			}
		end)
		v26.OnServerEvent:Connect(function(p1, p2) --[[ Line: 772 | Upvalues: v2 (ref), v17 (ref) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			local v22 = v2.getWrapperFromPlayer(p1) and v1.PlayerData.StarterHorseSelected or nil
			if not v22 or v22.Value ~= 0 then
				return
			end
			local v3 = nil
			if p2 == 1 then
				v3 = "Brown Horse"
			elseif p2 == 2 then
				v3 = "Black And White Horse"
			end
			v17.ReportDesignEvent(p1, "StarterHorse", {
				{
					Key = "HorseChosen",
					Value = v3 or p2
				}
			}, 1)
			v22.Value = p2
		end)
		local t4 = {
			"PreTutorialOption",
			"PreTutorialCinematic",
			"LearnBasicControls",
			"PreJumpCinematic",
			"JumpTwice",
			"PreTameCinematic",
			"LearnToTameAHorse",
			"LearnToFeedYourHorse",
			"PreHelpBoardOption",
			"VisitTheHelpBoard",
			"FinishTutorial"
		}
		v25.OnServerEvent:Connect(function(p1, p2) --[[ Line: 807 | Upvalues: v2 (ref), t3 (copy), v20 (ref), t4 (copy), v17 (ref) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			local v22 = t3[p2]
			if table.find(t4, p2) then
				if p2 == "PreTutorialOption" then
					v17.ReportDesignEvent(p1, "TutorialStep", {
						{
							Key = "Step",
							Value = "StartTutorial"
						}
					}, 1)
				end
				v17.ReportDesignEvent(p1, "TutorialStep", {
					{
						Key = "Step",
						Value = p2
					}
				}, 1)
			end
			if not v22 then
				return
			end
			v22(v1)
		end)
		v28.OnServerEvent:Connect(function(p1, p2) --[[ Line: 834 | Upvalues: t2 (ref), v2 (ref) ]]
			if not table.find(t2, p2) then
				return
			end
			local v1 = v2.getWrapperFromPlayer(p1)
			local v22 = (if v1 then v1.PlayerData.OpenedHelpGuiSections else v1) and v22:FindFirstChild(p2)
			if v22 and not v22.Value then
				v22.Value = true
				v1:GiveItem({
					Amount = 50,
					Name = "Coins",
					Source = "OpenedHelpBoardSection"
				})
			end
		end)
		v27.OnServerEvent:Connect(function(p1) --[[ Line: 853 | Upvalues: v2 (ref) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			local v22 = if v1 then v1.PlayerData.VisitedTheHelpBoard else v1
			if v22 and not v22.Value then
				v22.Value = true
				v1:GiveItem({
					Amount = 50,
					Name = "Coins",
					Source = "VisitedTheHelpBoard"
				})
			end
		end)
	end
end
function t.Init(p1) --[[ Init | Line: 868 | Upvalues: v5 (copy), v22 (copy), v1 (copy), t3 (copy), v4 (copy), v3 (copy), v2 (copy), v29 (ref), t (copy), v21 (copy), postLoadingAnalytics (copy), v6 (copy), v17 (copy), TutorialId (copy) ]]
	p1:_setupNewTutorial()
	v5.AddDeveloperProducts(v22)
	if v1 then
		for v12 in t3 do
			local v23 = Instance.new("BoolValue")
			v23.Name = v12
			v23.Parent = v4.DataTemplate.Tutorial.Contextual
			v23.Value = false
		end
		v3.GetRemoteFunction("SetTutorialStageRemote").OnServerInvoke = function(p1, p2, ...) --[[ Line: 881 | Upvalues: v2 (ref), v29 (ref) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			local v22 = v29[p2]
			if not v22 then
				return
			end
			local v3 = v22.Run(v1, ...)
			if p2 == "TameHorse" and not p1:GetAttribute("TutorialEnabled") then
				return "__SKIP__"
			else
				return v3
			end
		end
		v3.GetRemoteEvent("PostTutorialStageRemote").OnServerEvent:Connect(function(p1, p2) --[[ Line: 897 | Upvalues: v2 (ref), t (ref), v21 (ref) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			repeat
				task.wait()
			until v1.PrimaryTutorialStageValue ~= nil
			if t.HasCompletedPrimaryTutorial(v1) then
				return
			end
			if not v21[p2] then
				return
			end
			if v1["Posted" .. p2] then
			else
				t.PostTutorialStage(v1, p2)
				return true
			end
		end)
		v3.GetRemoteEvent("PostLoadingStageRemote").OnServerEvent:Connect(function(p1, p2) --[[ Line: 913 | Upvalues: v2 (ref), postLoadingAnalytics (ref) ]]
			repeat
				task.wait(0.1)
			until p1:GetAttribute("ServerLoadedInit") or not p1.Parent
			local v1 = v2.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			if not tonumber(p2) then
				return
			end
			local v22 = math.clamp(p2, 1, 5)
			if v22 ~= 1 then
				postLoadingAnalytics(v1, v22)
			end
		end)
		v3.GetRemoteEvent("SetContextualTutorialRemote").OnServerEvent:Connect(function(p1, p2, ...) --[[ Line: 930 | Upvalues: v2 (ref), t (ref), t3 (ref) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			if t.HasCompletedContextualTutorial(v1, p2) then
				return
			end
			t.SetContextualStage(v1, p2)
			local v22 = t3[p2]
			if v22 then
				v22(v1)
			end
			v1["Posted" .. p2] = true
		end)
		v3.GetRemoteEvent("SetTutorialPopUpPromptRemote").OnServerEvent:Connect(function(p1, p2) --[[ Line: 945 | Upvalues: v2 (ref) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			if not v1.PlayerData.Tutorial.Prompts:FindFirstChild(p2) then
				return
			end
			v1.PlayerData.Tutorial.Prompts[p2].Value = true
		end)
		v3.GetRemoteFunction("TameTutorialHorseRemote").OnServerInvoke = function(p1, p2) --[[ Line: 954 | Upvalues: v2 (ref), t (ref) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			if not v1.TutorialTameHorse then
				return
			end
			v1.TutorialTameHorse = false
			local Character = p1.Character
			if Character then
				local WovenLasso = Character:FindFirstChild("WovenLasso")
				if WovenLasso then
					WovenLasso.Parent = p1.Backpack
				end
			end
			local v22 = t.GetHorseSlotInfoForTame(v1, p2, true)
			v22.Parent = v1:GetItemFolder("Animals")
			v1:IncrementStat({
				Type = "Tames",
				Amount = 1
			})
			v1:IncrementMission({
				Type = "Tame",
				Amount = 1,
				Data = { v22.Species.Value, v22, v1 }
			})
			local NewMissionsWrapper = v1.NewMissionsWrapper
			if NewMissionsWrapper then
				NewMissionsWrapper:IncrementMission("TameAnySpecies", {
					Data = {}
				})
				NewMissionsWrapper:IncrementMission("TameSpecificSpecies", {
					Data = { v22.Species.Value }
				})
			end
			return v22.Name
		end
		v3.GetRemoteFunction("HarvestTutorialNodeRemote").OnServerInvoke = function(p1, p2) --[[ Line: 995 | Upvalues: v2 (ref) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			if not v1.TutorialHarvestedNode then
				return
			end
			v1.TutorialHarvestedNode = false
			v1:IncrementMission({
				Type = "HarvestNode",
				Amount = 1,
				Data = {}
			})
			local NewMissionsWrapper = v1.NewMissionsWrapper
			if not NewMissionsWrapper then
				v1:IncrementStat({
					Type = "NodesHarvested",
					Amount = 1
				})
				v1:GiveOrDropItem({
					TotalDrops = 4,
					Name = "Apple",
					Amount = 5,
					Source = "TutorialResource",
					Position = p2
				})
				return true
			end
			NewMissionsWrapper:IncrementMission("HarvestAnyForageable", {
				Data = {}
			})
			v1:IncrementStat({
				Type = "NodesHarvested",
				Amount = 1
			})
			v1:GiveOrDropItem({
				TotalDrops = 4,
				Name = "Apple",
				Amount = 5,
				Source = "TutorialResource",
				Position = p2
			})
			return true
		end
		v3.GetRemoteFunction("ClaimTutorialRewardRemote").OnServerInvoke = function(p1) --[[ Line: 1029 | Upvalues: v2 (ref), t (ref), v6 (ref) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			if not t.HasCompletedPrimaryTutorial(v1) then
				return
			end
			local v22 = t.GetTutorialReward(v1)
			if not v22 then
				return
			end
			if not t.CanClaimTutorialReward(v1) then
				return
			end
			v1.TutorialData.ClaimedReward.Value = true
			local v3 = t.GetHorseSlotInfoForReward(v1, v22, true)
			for v4, v5 in v3.Mutations:GetChildren() do
				local v62 = v6.GetMutation(v5.Value)
				if v62 and v62.Type == "Wings" then
					v5.Level.Value = 2
					break
				end
			end
			v3.Parent = v1:GetItemFolder("Animals")
			return v3.Name
		end
	end
	v2.bindToPlayers(function(p1) --[[ Line: 1059 | Upvalues: v2 (ref), t (ref), v1 (ref), postLoadingAnalytics (ref), v29 (ref), v17 (ref), TutorialId (ref) ]]
		local v12 = v2.getWrapperFromPlayer(p1)
		v12.HasCompletedPrimaryTutorial = t.HasCompletedPrimaryTutorial
		if v12 then
			local function setInTutorial() --[[ setInTutorial | Line: 1069 | Upvalues: v1 (ref), v12 (ref), t (ref) ]]
				if v1 then
					v12.TutorialValue.Value = not t.HasCompletedPrimaryTutorial(v12)
				end
				v12.InTutorial = v12.TutorialValue.Value
			end
			v12.TutorialValue = v12.SettingsFolder:WaitForChild("Tutorial")
			if v1 or v12.IsLocalPlayer then
				v12.TutorialData = v12.PlayerData:WaitForChild("Tutorial")
				v12.ContextualTutorialData = v12.TutorialData:WaitForChild("Contextual")
				v12.PrimaryTutorialStageValue = v12.TutorialData:WaitForChild("PrimaryStage")
				if v1 then
					for v22, v3 in { v12.PrimaryTutorialStageValue } do
						v12.Maid:GiveTask(v3:GetPropertyChangedSignal("Value"):Connect(setInTutorial))
					end
					if v1 then
						v12.TutorialValue.Value = not t.HasCompletedPrimaryTutorial(v12)
					end
					v12.InTutorial = v12.TutorialValue.Value
				end
			end
			if not v1 and v12.IsLocalPlayer then
				v12.Maid:GiveTask(v12.TutorialValue:GetPropertyChangedSignal("Value"):Connect(setInTutorial))
				if v1 then
					v12.TutorialValue.Value = not t.HasCompletedPrimaryTutorial(v12)
				end
				v12.InTutorial = v12.TutorialValue.Value
			end
			if v1 then
				postLoadingAnalytics(v12, 1)
				local v4 = v29[t.GetPrimaryStage(v12)]
				if not t.HasCompletedPrimaryTutorial(v12) then
					v17.ReportDesignEvent(v12.Player, "TutorialAttempt", {
						{
							Key = "TutorialId",
							Value = TutorialId
						}
					}, 1)
				end
				if v4 and v4.Init then
					v4.Init(v12)
				end
				p1:SetAttribute("ServerLoadedInit", true)
			end
		end
	end)
end
t:Init()
return t