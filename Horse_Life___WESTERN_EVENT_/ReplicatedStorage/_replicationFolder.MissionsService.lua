-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local v1 = RunService:IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("AnimalDataService")
local v3 = Sonar("RemoteUtils")
local v4 = Sonar("PlayerWrapper")
local v5 = Sonar("ItemDataService")
local v6 = Sonar("TimeSeedClass")
local v7 = v1 and Sonar("ChatService")
local v8 = if v1 then Sonar("DatastoreClass") else v1
local v9 = Sonar("EventUtils")
local v10 = Sonar("TimeUtils")
local v11 = Sonar("BadgeService")
local v12 = Sonar("TitlesService")
local v13 = Sonar("MarketplaceUtils")
local v14 = Sonar("WeightedProbability")
local v15 = v1 and Sonar("AnalyticsService")
local v16 = Sonar("StableClubsManager", {
	Deferred = true,
	Context = "Server"
})
local v17 = Sonar("StorageUtils")
local v18 = Sonar("Table")
local v19 = Sonar("DynamicNPCService")
local v20 = Sonar("PlaceTypeService")
local v21 = Sonar("Constants")
local v22 = Sonar(v17.Get("SpeciesUnlocks"))
local v23 = Sonar(v17.Get("SpeciesMissions"))
local v24 = Sonar(v17.Get("StoryMissions"))
local v25 = Sonar(v17.Get("StreakMissions"))
local v26 = Sonar(v17.Get("StreakTiers"))
local v27 = Sonar(v17.Get("OneTimeMissions"))
local v28 = Sonar(v17.Get("Achivements"))
local v29 = Sonar(v17.Get("NpcMissions"))
local v30 = Sonar(v17.Get("StableClubMissions"))
local v31 = Sonar(v17.Get("TutorialMissions"))
local v32 = Sonar(v17.Get("WorldMissions"))
local v33 = Sonar("LimitedStockUnlocks")
local v34 = if v21.EventName then Sonar(ReplicatedStorage.Storage.Events[v21.EventName].MiniQuests) else {}
local t2 = {}
local v35 = v21.EventName and ReplicatedStorage.Storage.Events[v21.EventName]:FindFirstChild("EventMissions") and Sonar(ReplicatedStorage.Storage.Events[v21.EventName].EventMissions)
local v36 = v21.EventName and Sonar(ReplicatedStorage.Storage.Events[v21.EventName].StreakMissions.StreakMissions)
local v37 = v21.EventName and Sonar(ReplicatedStorage.Storage.Events[v21.EventName].StreakMissions.StreakTiers)
local v38 = v21.EventName and Sonar(ReplicatedStorage.Storage.Events[v21.EventName].PassMissions)
local v39 = v21.EventName and Sonar(ReplicatedStorage.Storage.Events[v21.EventName].PassMissions)
local v40 = v21.EventName and (ReplicatedStorage.Storage.Events[v21.EventName]:FindFirstChild("HourlyMissions") and Sonar(ReplicatedStorage.Storage.Events[v21.EventName].HourlyMissions))
local v41 = v21.EventName and v21.CurrentEvent
local t3 = {
	Daily = 72000,
	Weekly = 604800,
	Monthly = 2419200
}
local v42 = v20.IsTestGame()
t.Descriptions = {
	Tame = "Tame %s horses",
	HarvestNode = "Harvest %s forageables",
	JumpObstacle = "Jump over %s obstacles",
	Foal = "Foal a horse %s times",
	Breed = "Breed a horse %s times",
	RideWithHorse = "Ride a horse for %s minutes",
	StatLevelUp = "Level up any horses skills %s times",
	Sell = "Sell a horse %s times",
	GrowMax = "Grow a horse to age 100 %s times",
	TameWings = "Tame a winged horse %s times",
	BuyStable = "Buy a horse from the stables %s times",
	GetHorseFromStable = "Get a horse from the stable %s times",
	BuyAccessory = "Buy an accessory from the shop %s times",
	CompleteRace = "Complete a race %s times",
	CompleteMinigame = "Complete any minigame %s times",
	CompleteEventMinigame = "Complete any event minigame %s times",
	SpeciesReplay = "Replay %s Species Quests",
	DefeatBoss = "Defeat %s Bosses",
	HarvestPlant = "Harvest %s planted crops",
	FindClues = "Retrace steps and find %s clues",
	FindStatue = "Find %s structure clues",
	InspectFoal = "Find the foal, and inspect it",
	TalkToHorse = "Talk to the foal",
	FeedFoal = "Feed a foal %s times",
	LocateAetheris = "Locate the spiritual power",
	BuyItem = "Buy %s %s",
	HelpMenu = "Read the help sign in Town",
	DiscoverBiome = "Discover a new biome!",
	BondWithHorse = "Bond with a horse using a bonding tool %s times",
	CleanHorseToy = "Use the Broom on a horse not on bond cooldown %s times",
	BondLevelUp = "Level up any horse\'s bond skill %s times",
	CompleteEventMission = "Complete any %s event missions"
}
local t4 = {}
local MissionRewardStock = ReplicatedStorage.Storage.Events.MissionRewardStock
local v43 = v1
if v43 then
	v43 = v8.new(if v42 then "MissionRewardStockTest" else "MissionRewardStock", {
		_update = function(p1, p2) --[[ _update | Line: 135 | Upvalues: t4 (copy) ]]
			local v2 = if p1 then p1 else {}
			for k, v in pairs({ p2, t4 }) do
				for k2, v3 in pairs(v) do
					local v32 = t4[k2]
					if v32 and not v2[k2] then
						v2[k2] = v32.MaxStock
					end
				end
			end
			for k, v in pairs(p2) do
				if v2[k] then
					v2[k] = math.max(0, v2[k] - v)
				end
			end
			return v2
		end
	})
end
function t.AutopinDailyMissions(p1) --[[ AutopinDailyMissions | Line: 162 | Upvalues: t (copy) ]]
	local Missions = p1.PlayerData.Missions.StreakMissions.Missions
	local v1 = 0
	for v2, v3 in Missions:GetChildren() do
		for v4, v5 in v3.Missions:GetChildren() do
			v5.Pinned.Value = false
		end
	end
	for v6, v7 in Missions:GetChildren() do
		local Completed = v7.Completed.Value
		local v9 = tonumber(v7.Name)
		for v10, v11 in v7.Missions:GetChildren() do
			local v12 = if Completed then v11.Claimed.Value else Completed
			Completed = v12
			if not v12 then
				break
			end
		end
		if Completed then
			v1 = math.max(v1, v9)
		end
	end
	local v14 = Missions:FindFirstChild(v1 + 1)
	if not v14 then
		return
	end
	for v15, v16 in v14.Missions:GetChildren() do
		if not v16.Claimed.Value then
			t.PinMission(p1, v16)
		end
	end
end
function t.GetCompletedDailyMissionCount(p1) --[[ GetCompletedDailyMissionCount | Line: 207 | Upvalues: t (copy) ]]
	local CurrentSeed = t.DailyStreakMissionTimer.CurrentSeed
	local count = 0
	for v1, v2 in p1.PlayerData.Missions.StreakMissions.Missions:GetChildren() do
		if v2.Value == CurrentSeed then
			local Missions_2 = v2:FindFirstChild("Missions")
			if Missions_2 then
				for v3, v4 in Missions_2:GetChildren() do
					if v4.Value then
						count = count + 1
					end
				end
			end
		end
	end
	return count
end
function t.AutopinHourlyMissions(p1) --[[ AutopinHourlyMissions | Line: 228 | Upvalues: t (copy) ]]
	local v1 = p1.EventData and p1.EventData:FindFirstChild("HourlyMissions")
	if not v1 then
		return
	end
	for v2, v3 in v1.Missions:GetChildren() do
		if not v3.Claimed.Value then
			t.PinMission(p1, v3)
		end
	end
end
function t.CanClaimHourlyMission(p1, p2) --[[ CanClaimHourlyMission | Line: 242 ]]
	local v1 = p1.EventData and p1.EventData:FindFirstChild("HourlyMissions")
	if not v1 then
		return
	end
	local v2 = v1.Missions[p2]
	if not v2 then
		return
	end
	if v2.Claimed.Value then
		return "AlreadyClaimed"
	end
	if not v2.Value then
		return "NotCompleted"
	end
	local t = {}
	for v3, v4 in v2.Rewards:GetChildren() do
		table.insert(t, {
			Name = v4.Name,
			Amount = v4.Value
		})
	end
	return true, v2, t
end
function t.ClaimHourlyMission(...) --[[ ClaimHourlyMission | Line: 271 | Upvalues: v3 (copy) ]]
	return v3.GetRemoteFunction("ClaimHourlyMissionRemote"):InvokeServer(...)
end
function t.GenerateHourlyMissions(p1) --[[ GenerateHourlyMissions | Line: 275 | Upvalues: v40 (copy) ]]
	if not v40 then
		return {}
	end
	local v1 = Random.new(p1)
	local v2 = table.clone(v40)
	local t = {}
	for i = 1, math.min(3, #v2) do
		local v3 = v1:NextInteger(1, #v2)
		local v4 = v2[v3]
		table.insert(t, {
			Type = v4.Type,
			Amount = v1:NextInteger(v4.Amount.Min, v4.Amount.Max),
			Reward = v4.Reward
		})
		table.remove(v2, v3)
	end
	return t
end
function t.GetTimedMissionDuration(p1) --[[ GetTimedMissionDuration | Line: 301 | Upvalues: t3 (copy) ]]
	return t3[p1]
end
function t.GetMissionPreset(p1, p2, p3) --[[ GetMissionPreset | Line: 305 | Upvalues: t (copy) ]]
	local v1 = t.GetType(p1)
	local v2 = v1.Missions or v1.Chapters and v1.Chapters[1] or v1
	local v3, v4
	if v2.Missions then
		v3 = v2.Missions[p2]
		if not v3 then
			v4 = v2
			v3 = v2.Stories and v2.Stories[tonumber(p2)] or v2[p2]
		end
	else
		v4 = v2
		v3 = v2.Stories and v2.Stories[tonumber(p2)] or v2[p2]
	end
	local v6 = v3.Missions[tonumber(p3.Name)]
	if not v6 then
		return
	end
	if v6.MissionsByType then
		return v6.MissionsByType[p3.Type.Value]
	else
		return v6
	end
end
function t.GetType(p1) --[[ GetType | Line: 325 | Upvalues: v22 (copy), v27 (copy), v35 (copy), v36 (copy), v23 (copy), v24 (copy), v28 (copy), v29 (copy), v25 (copy), v31 (copy), v32 (copy), v38 (copy), v34 (ref), v30 (copy), v40 (copy), v33 (copy), t2 (copy) ]]
	if p1 == "SpeciesUnlocks" then
		return v22
	end
	if p1 == "OneTimeMissions" then
		return v27
	end
	if p1 == "EventMissions" then
		return v35
	end
	if p1 == "EventStreakMissions" then
		return v36
	end
	if p1 == "SpeciesMissions" then
		return v23
	end
	if p1 == "StoryMissions" then
		return v24
	end
	if p1 == "Achivements" then
		return v28.Achievements
	end
	if p1 == "Milestones" then
		return v28.Milestones
	end
	if p1 == "NpcMissions" then
		return v29
	end
	if p1 == "StreakMissions" then
		return v25
	end
	if p1 == "Tutorial" then
		return v31
	end
	if p1 == "WorldMissions" then
		return v32
	end
	if p1 == "PassMissions" then
		return v38
	end
	if p1 == "MiniMissions" then
		return v34
	end
	if p1 == "StableClubMissions" then
		return v30
	end
	if p1 == "HourlyMissions" then
		return v40
	end
	if p1 == "LimitedStockUnlocks" then
		return v33
	else
		return t2[p1]
	end
end
function t.GetSlotInfoForMission(p1, p2, p3, p4) --[[ GetSlotInfoForMission | Line: 367 | Upvalues: v22 (copy), v2 (copy) ]]
	local v23 = p2.SlotInfo or v22.Missions[p2.Species]
	local v3 = p3 or 0
	local v4 = nil
	local v5
	if p4 then
		v5 = if v23 then v23.Preset and v23.Preset[math.random(1, #v23.Preset)] else v23
	else
		local v10 = if v23 then v23.Preset and v23.Preset[Random.new(p1.Player.UserId + (v23 and v23.Index or 0) * 1000 + (p2.SeedOffset or 0) + v3):NextInteger(1, #v23.Preset)] else v23
		local v11
		if v23 then
			v11 = v23.Index
			if v11 then
				v5 = v10
			else
				v11 = 0
				v5 = v10
			end
		else
			v11 = 0
			v5 = v10
		end
		v4 = p1.Player.UserId + v11 + v3
	end
	local t = {
		Origin = "Bought",
		DoNotParent = true,
		Age = 100,
		Gender = "Female",
		Species = p2.Species,
		Preset = v5 or nil,
		Seed = v4,
		DoNotIncrementCount = not p2.GiveToPlayer
	}
	t.MaxCosmetics = if v23 then v23.MaxCosmetics else v23
	local v13, v14
	if v23 and v23.NoMutations ~= nil then
		v13 = v23.NoMutations
		v14 = p1
	else
		v14 = p1
		v13 = if p2.Species == "Peryton" then false else true
	end
	t.NoMutations = v13
	t.Infertile = if v23 then v23.Infertile else v23
	t.MutationSlotChances = p2.Species == "Peryton" and {
		{
			Amount = 0,
			P = 0
		}
	} or nil
	t.AlwaysHasWings = if p2.Species == "Peryton" then true else false
	return v2.CreateSlot(v14, t)
end
function t.CanStartSpeciesUnlock(p1, p2) --[[ CanStartSpeciesUnlock | Line: 403 ]]
	local v1 = p1.PlayerData.Missions.SpeciesUnlocks[p2]
	if v1.Started.Value then
		warn("Already Started")
		return
	end
	local count = 0
	for v2, v3 in p1.PlayerData.Missions.SpeciesUnlocks:GetChildren() do
		if v3.Started.Value and not v3.Completed.Value then
			count = count + 1
		end
	end
	if count >= 2 then
		warn("Cannot start more than 2 species at once!")
		return false, "Cannot start more than 2 species at once!"
	else
		return true, v1
	end
end
local function limitedStockIdExistsInConstants(p1) --[[ limitedStockIdExistsInConstants | Line: 426 | Upvalues: Sonar (copy), ReplicatedStorage (copy), v21 (copy) ]]
	for v1, v2 in Sonar(ReplicatedStorage.Storage.Constants.LimitedStockHorses) do
		if v2.StockId == p1 then
			return true
		end
	end
	for v3, v4 in v21.LimitedStockAccessories do
		if v4.StockId == p1 then
			return true
		end
	end
	return false
end
function t.RemoveStaleLimitedStockUnlockMissions(p1, p2) --[[ RemoveStaleLimitedStockUnlockMissions | Line: 443 | Upvalues: v1 (copy), limitedStockIdExistsInConstants (copy) ]]
	if not v1 then
		return
	end
	local v12 = if p2 then function(p1) --[[ Line: 449 | Upvalues: p2 (copy) ]]
	p2:RemoveLimitedStockUnlockMission(p1)
end else function(p12) --[[ Line: 452 | Upvalues: p1 (copy) ]]
	p1:RemoveLimitedStockUnlockMission(p12)
end
	local LimitedStockUnlocks = p1.PlayerData.Missions:FindFirstChild("LimitedStockUnlocks")
	if not LimitedStockUnlocks then
		return
	end
	local t = {}
	for v2, v3 in LimitedStockUnlocks:GetChildren() do
		if v3:IsA("Folder") then
			local Started = v3:FindFirstChild("Started")
			if Started and (Started:IsA("BoolValue") and Started.Value) then
				local Completed = v3:FindFirstChild("Completed")
				if not (Completed and (Completed:IsA("BoolValue") and Completed.Value)) then
					local Claimed = v3:FindFirstChild("Claimed")
					if not (Claimed and (Claimed:IsA("BoolValue") and Claimed.Value)) then
						local StockId = v3:FindFirstChild("StockId")
						if StockId and (StockId:IsA("StringValue") and (StockId.Value ~= "" and not limitedStockIdExistsInConstants(StockId.Value))) then
							table.insert(t, v3)
						end
					end
				end
			end
		end
	end
	if #t == 0 then
		return
	end
	for v4, v5 in t do
		if v5.Parent then
			v12(v5)
		end
	end
	if not p1.MissionsChangedSignal then
		return
	end
	p1.MissionsChangedSignal:Fire()
end
function t.CanStartLimitedStockUnlock(p1, p2, p3) --[[ CanStartLimitedStockUnlock | Line: 509 | Upvalues: t (copy), Sonar (copy), ReplicatedStorage (copy), v21 (copy), v33 (copy) ]]
	t.RemoveStaleLimitedStockUnlockMissions(p1)
	local LimitedStockUnlocks = p1.PlayerData.Missions:FindFirstChild("LimitedStockUnlocks")
	if not LimitedStockUnlocks then
		return false, "NoDataFolder"
	end
	local v1 = nil
	for v2, v3 in Sonar(ReplicatedStorage.Storage.Constants.LimitedStockHorses) do
		if v3.StockId == p2 then
			v1 = v3
			break
		end
	end
	local v4 = nil
	for v5, v6 in v21.LimitedStockAccessories do
		if v6.StockId == p2 then
			v4 = v6
			break
		end
	end
	if not (v1 or v4) then
		return false, "InvalidStockId"
	end
	local v7, v8
	if v1 then
		if not v33.MissionUnlockRequired(v1) then
			return false, "MissionNotApplicable"
		end
		local v9 = v33.GetVariantKey(v1, p3)
		v7, v8 = v33.GetFolderName(p2, v9), v9
	else
		if not v33.MissionUnlockRequired(v4) then
			return false, "MissionNotApplicable"
		end
		v8 = "Default"
		v7 = v33.GetFolderName(p2, v8)
	end
	local v12 = LimitedStockUnlocks:FindFirstChild(v7)
	if v12 and v12.Started.Value then
		return false, "AlreadyStarted"
	end
	local count = 0
	for v13, v14 in LimitedStockUnlocks:GetChildren() do
		if v14:FindFirstChild("Started") and (v14.Started.Value and not v14.Completed.Value) then
			count = count + 1
		end
	end
	if count >= 1 then
		return false, "TooManyActive"
	else
		return true, v1 or v4, v8, v7
	end
end
function t.StartLimitedStockUnlock(p1, p2, p3) --[[ StartLimitedStockUnlock | Line: 575 | Upvalues: t (copy), v33 (copy), Sonar (copy) ]]
	local v1, v2, v3, v4 = t.CanStartLimitedStockUnlock(p1, p2, p3)
	if not v1 then
		return false, v2
	end
	if not v33.GetMissions(v3) then
		return false, "InvalidVariant"
	end
	local v5 = Sonar("DataUtils")
	local v6 = v5.CreateDataValueFromType("SpeciesUnlockMission")
	if not v6 then
		local v7 = Instance.new("Folder")
		local Started = Instance.new("BoolValue")
		Started.Name = "Started"
		Started.Parent = v7
		local Completed = Instance.new("BoolValue")
		Completed.Name = "Completed"
		Completed.Parent = v7
		local Claimed = Instance.new("BoolValue")
		Claimed.Name = "Claimed"
		Claimed.Parent = v7
		local Missions = Instance.new("Folder")
		Missions.Name = "Missions"
		Missions.Parent = v7
		v6 = v7
	end
	v6.Name = v4
	local Variant = Instance.new("StringValue")
	Variant.Name = "Variant"
	Variant.Value = v3
	Variant.Parent = v6
	local StockId = Instance.new("StringValue")
	StockId.Name = "StockId"
	StockId.Value = p2
	StockId.Parent = v6
	local Pinned = v6:FindFirstChild("Pinned")
	if Pinned and Pinned:IsA("BoolValue") then
		Pinned.Value = false
	end
	for v8, v9 in v6.Missions:GetChildren() do
		v9:Destroy()
	end
	for v10, v11 in v33.GetMissionIndices(v3) do
		local v12 = v5.CreateDataValueFromType("Mission")
		if not v12 then
			local v13 = Instance.new("BoolValue")
			local Amount = Instance.new("IntValue")
			Amount.Name = "Amount"
			Amount.Parent = v13
			local Claimed = Instance.new("BoolValue")
			Claimed.Name = "Claimed"
			Claimed.Parent = v13
			v12 = v13
		end
		v12.Name = tostring(v11)
		if v12:FindFirstChild("TargetAmount") then
			v12.TargetAmount:Destroy()
		end
		local Pinned_2 = v12:FindFirstChild("Pinned")
		if not Pinned_2 then
			local Pinned_3 = Instance.new("BoolValue")
			Pinned_3.Name = "Pinned"
			Pinned_3.Parent = v12
			Pinned_2 = Pinned_3
		end
		Pinned_2.Value = true
		v12.Parent = v6.Missions
	end
	v6.Started.Value = true
	v6.Parent = p1.PlayerData.Missions.LimitedStockUnlocks
	p1:AddLimitedStockUnlockMission(v6)
	return true, v6
end
function t.CompleteLimitedStockUnlock(p1, p2) --[[ CompleteLimitedStockUnlock | Line: 660 | Upvalues: Sonar (copy), ReplicatedStorage (copy), v21 (copy), v33 (copy), v14 (copy), v1 (copy) ]]
	if not p2.Completed.Value then
		return false, "NotCompleted"
	end
	if p2:FindFirstChild("Claimed") and p2.Claimed.Value then
		return false, "AlreadyClaimed"
	end
	local v12 = p2:FindFirstChild("StockId") and p2.StockId.Value
	if not v12 then
		return false, "NoStockId"
	end
	local v2 = p2:FindFirstChild("Variant") and p2.Variant.Value or "Default"
	local v3 = nil
	for v4, v5 in Sonar(ReplicatedStorage.Storage.Constants.LimitedStockHorses) do
		if v5.StockId == v12 then
			v3 = v5
			break
		end
	end
	local v6 = nil
	if not v3 then
		for v7, v8 in v21.LimitedStockAccessories do
			if v8.StockId == v12 then
				v6 = v8
				break
			end
		end
	end
	if not (v3 or v6) then
		return false, "InvalidStockId"
	end
	if v3 then
		if not v33.MissionUnlockRequired(v3) then
			return false, "MissionNotApplicable"
		end
	elseif not v33.MissionUnlockRequired(v6) then
		return false, "MissionNotApplicable"
	end
	local v9, v10 = Sonar("Limited"):MintSerialNumber(p1.Player, v12)
	if not (v9 and v10) then
		warn("Failed to mint serial number for limited stock unlock:", v12)
		return false, "SerialMintFailed"
	end
	local v11
	if v3 then
		local t = {}
		for v122, v13 in v3 do
			t[v122] = v13
		end
		if v3.FertileChoice then
			t.Infertile = v2 == "Infertile"
			if v2 == "Fertile" and v3.Origin == "Developer" then
				t.Origin = "Bought"
			end
		end
		local v15 = Sonar("ItemSetService"):_giveHorse(p1, t)
		if not v15 then
			warn("Failed to give horse for limited stock unlock:", v12)
			return false, "GiveHorseFailed"
		end
		v15.LimitedSerial.Value = v10
		v11 = v15.Name
	else
		if v6.MaxStock and v6.MaxStock < v10 then
			warn("Stock exceeded MaxStock after minting limited stock unlock:", v12)
			return false, "OutOfStock"
		end
		local Theme = v6.Theme
		if Theme == "Random" then
			Theme = if (v6.ThemeChance or 100) >= math.random(1, 100) then v14.getRandomWeightedItem(v21.RandomEquipmentDropThemes) else nil
		end
		local v17 = p1:GiveItem({
			ItemType = "Equipment",
			Amount = 1,
			Source = "LimitedStockAccessory",
			IgnoreLimit = true,
			Name = v6.Name,
			Theme = Theme
		})
		if not v17 then
			warn("Failed to give accessory for limited stock unlock:", v12)
			return false, "GiveItemFailed"
		end
		local LimitedSerial = Instance.new("IntValue")
		LimitedSerial.Name = "LimitedSerial"
		LimitedSerial.Value = v10
		LimitedSerial.Parent = v17
		v11 = v17.Name
	end
	if p2:FindFirstChild("Claimed") then
		p2.Claimed.Value = true
	end
	if p2:FindFirstChild("Pinned") then
		p2.Pinned.Value = false
	end
	local Missions = p2:FindFirstChild("Missions")
	if Missions then
		for v18, v19 in Missions:GetChildren() do
			local Pinned = v19:FindFirstChild("Pinned")
			if Pinned and Pinned:IsA("BoolValue") then
				Pinned.Value = false
			end
		end
	end
	if v1 then
		Sonar("AnalyticsService").ReportDesignEvent(p1.Player, "LimitedStockUnlockCompleted", {
			{
				Key = "StockId",
				Value = v12
			},
			{
				Key = "Variant",
				Value = v2
			},
			{
				Key = "Serial",
				Value = v10
			}
		}, 1)
	end
	return true, v10, v11
end
function t.FinalizeLimitedStockUnlockSkip(p1, p2, p3) --[[ FinalizeLimitedStockUnlockSkip | Line: 806 ]]
	local LimitedStockUnlocks = p1.PlayerData.Missions:FindFirstChild("LimitedStockUnlocks")
	if not LimitedStockUnlocks then
		return false, "NoDataFolder"
	end
	local v1 = LimitedStockUnlocks:FindFirstChild(p2)
	if not v1 then
		return false, "MissionNotFound"
	end
	if p3 and (v1:FindFirstChild("StockId") and v1.StockId.Value) ~= p3 then
		return false, "StockMismatch"
	end
	if v1:FindFirstChild("Claimed") and v1.Claimed.Value then
		return true
	end
	local Missions = v1:FindFirstChild("Missions")
	if Missions then
		for v3, v4 in Missions:GetChildren() do
			if v4:IsA("BoolValue") then
				local Amount = v4:FindFirstChild("Amount")
				local TargetAmount = v4:FindFirstChild("TargetAmount")
				if Amount and Amount:IsA("IntValue") then
					if TargetAmount and TargetAmount:IsA("IntValue") then
						Amount.Value = math.max(0, TargetAmount.Value)
					else
						Amount.Value = math.max(1, Amount.Value)
					end
				end
				if v4:FindFirstChild("Claimed") then
					v4.Claimed.Value = true
				end
				v4.Value = true
			end
		end
	end
	if v1:FindFirstChild("Started") then
		v1.Started.Value = false
	end
	if v1:FindFirstChild("Completed") then
		v1.Completed.Value = true
	end
	if v1:FindFirstChild("Claimed") then
		v1.Claimed.Value = true
	end
	if v1:FindFirstChild("Pinned") then
		v1.Pinned.Value = false
	end
	if not Missions then
		return true
	end
	for v7, v8 in Missions:GetChildren() do
		local Pinned = v8:FindFirstChild("Pinned")
		if Pinned and Pinned:IsA("BoolValue") then
			Pinned.Value = false
		end
	end
	return true
end
function t.CancelLimitedStockUnlock(p1, p2) --[[ CancelLimitedStockUnlock | Line: 872 ]]
	local LimitedStockUnlocks = p1.PlayerData.Missions:FindFirstChild("LimitedStockUnlocks")
	if not LimitedStockUnlocks then
		return false, "NoDataFolder"
	end
	local v1 = LimitedStockUnlocks:FindFirstChild(p2)
	if not v1 then
		return false, "NotFound"
	end
	if not v1.Started.Value then
		return false, "NotStarted"
	end
	if v1.Completed.Value then
		return false, "AlreadyCompleted"
	end
	if v1:FindFirstChild("Claimed") and v1.Claimed.Value then
		return false, "AlreadyClaimed"
	end
	p1:RemoveLimitedStockUnlockMission(v1)
	return true
end
local function limitedStockEffectiveMaxHorse(p1) --[[ limitedStockEffectiveMaxHorse | Line: 900 | Upvalues: Sonar (copy) ]]
	local sum = p1.MaxStock or 0
	if p1.StockRefreshTime and (p1.StockRefreshAmount and os.time() >= p1.StockRefreshTime) then
		sum = sum + p1.StockRefreshAmount
	end
	local v1 = Sonar("Limited"):GetStockAdjustmentValue(p1.StockId)
	if v1 then
		sum = sum + v1.Value
	end
	return sum
end
function t.UnpinLimitedStockUnlocksIfOutOfStock(p1) --[[ UnpinLimitedStockUnlocksIfOutOfStock | Line: 913 | Upvalues: v1 (copy), Sonar (copy), ReplicatedStorage (copy), v21 (copy), limitedStockEffectiveMaxHorse (copy) ]]
	if not v1 then
		return
	end
	local LimitedStockUnlocks = p1.PlayerData.Missions:FindFirstChild("LimitedStockUnlocks")
	if not LimitedStockUnlocks then
		return
	end
	local v12 = Sonar("Limited")
	local v2 = Sonar(ReplicatedStorage.Storage.Constants.LimitedStockHorses)
	local v3 = false
	for v4, v5 in LimitedStockUnlocks:GetChildren() do
		if v5:IsA("Folder") then
			local Started = v5:FindFirstChild("Started")
			if Started and (Started:IsA("BoolValue") and Started.Value) then
				local Claimed = v5:FindFirstChild("Claimed")
				if not (Claimed and (Claimed:IsA("BoolValue") and Claimed.Value)) then
					local StockId = v5:FindFirstChild("StockId")
					if StockId and (StockId:IsA("StringValue") and StockId.Value ~= "") then
						local v6 = StockId.Value
						local v7 = nil
						for v8, v9 in v2 do
							if v9.StockId == v6 then
								v7 = v9
								break
							end
						end
						local v10 = nil
						if not v7 then
							for v11, v122 in v21.LimitedStockAccessories do
								if v122.StockId == v6 then
									v10 = v122
									break
								end
							end
						end
						if v7 or v10 then
							local v13 = false
							if v7 and v7.MaxStock then
								v13 = if v12:GetCachedSoldCount(v6) >= limitedStockEffectiveMaxHorse(v7) then true else false
							elseif v10 and v10.MaxStock then
								v13 = if v12:GetCachedSoldCount(v6) >= v10.MaxStock then true else false
							end
							if v13 then
								local Pinned = v5:FindFirstChild("Pinned")
								if Pinned and (Pinned:IsA("BoolValue") and Pinned.Value) then
									Pinned.Value = false
									v3 = true
								end
								local Missions = v5:FindFirstChild("Missions")
								if Missions then
									for v14, v15 in Missions:GetChildren() do
										local Pinned_2 = v15:FindFirstChild("Pinned")
										if Pinned_2 and (Pinned_2:IsA("BoolValue") and Pinned_2.Value) then
											Pinned_2.Value = false
											v3 = true
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
	if not (v3 and p1.MissionsChangedSignal) then
		return
	end
	p1.MissionsChangedSignal:Fire()
end
function t.CanClaimSpeciesUnlockMission(p1, p2, p3) --[[ CanClaimSpeciesUnlockMission | Line: 1008 | Upvalues: v22 (copy), v5 (copy) ]]
	local v1 = p1.PlayerData.Missions.SpeciesUnlocks[p2]
	if p3 then
		local v2 = v1.Missions[p3]
		if v2.Claimed.Value then
			return "AlreadyClaimed"
		end
		if not v2.Value then
			return
		end
		local v3 = v22.Missions[p2].Missions[tonumber(p3)]
		if not v3 then
			return
		end
		local v4, v52 = p1:CanGiveItem(v5.GetByName(v3.Reward.Name).ItemType)
		if v4 then
			return true, v2, v3.Reward, v1
		else
			return "Max" .. v52
		end
	else
		if v1.Claimed.Value then
			return "AlreadyClaimed"
		end
		if not v1.Completed.Value then
			return
		end
		if p2 == "Horse" or p1:CanGiveItem("Animals") then
			return true, v1, nil, v1
		else
			return "AtAnimalLimit"
		end
	end
end
function t.CanClaimStoryMission(p1, p2, p3) --[[ CanClaimStoryMission | Line: 1052 | Upvalues: v24 (copy), v5 (copy) ]]
	local v1 = p1.PlayerData.Missions.StoryMissions[p2].Stories[tonumber(p3)]
	if v1.Claimed.Value then
		return "AlreadyClaimed"
	end
	if not v1.Completed.Value then
		return
	end
	local Rewards = v24.Chapters[tonumber(p2)].Stories[tonumber(p3)].Rewards
	if not game:GetService("RunService"):IsStudio() then
		local v2 = true
		for v3, v4 in Rewards do
			if not p1:CanGiveItem(v5.GetByName(v4.Name).ItemType) then
				v2 = false
			end
		end
		if not v2 then
			return "MaxInventory"
		end
	end
	return true, v1, Rewards
end
function t.CanClaimAchievement(p1, p2) --[[ CanClaimAchievement | Line: 1082 | Upvalues: v28 (copy), v5 (copy) ]]
	local v1 = p1.PlayerData.Missions.Achivements[tonumber(p2)]
	if v1.Claimed.Value then
		return "AlreadyClaimed"
	end
	if not v1.Value then
		return
	end
	local Rewards = v28.Achievements[tonumber(p2)].Rewards
	if not game:GetService("RunService"):IsStudio() then
		local v2 = true
		for v3, v4 in Rewards do
			if not p1:CanGiveItem(v5.GetByName(v4.Name).ItemType) then
				v2 = false
			end
		end
		if not v2 then
			return "MaxInventory"
		end
	end
	return true, v1, Rewards
end
function t.CanClaimTutorialMission(p1, p2, p3) --[[ CanClaimTutorialMission | Line: 1112 | Upvalues: v31 (copy), v5 (copy) ]]
	local v1 = p1.PlayerData.Tutorial.Missions[p2]
	if p3 then
		local v2 = v1.Missions[p3]
		if v2.Claimed.Value then
			return "AlreadyClaimed"
		end
		if not v2.Value then
			return
		end
		local v3 = v31[p2].Missions[tonumber(p3)]
		if not v3 then
			return
		end
		local v4, v52 = p1:CanGiveItem(v5.GetByName(v3.Reward.Name).ItemType)
		if v4 then
			return true, v2, v3.Reward, v1
		else
			return "Max" .. v52
		end
	else
		if v1.Claimed.Value then
			return "AlreadyClaimed"
		end
		if not v1.Completed.Value then
			return
		end
		if p1:CanGiveItem("Animals") then
			return true, v1, nil, v1
		else
			return "AtAnimalLimit"
		end
	end
end
function t.CanClaimWorldMission(p1, p2, p3) --[[ CanClaimWorldMission | Line: 1154 | Upvalues: v32 (copy), v5 (copy) ]]
	local v1 = p1.PlayerData.Missions.WorldMissions[p2]
	if p3 then
		local v2 = v1.Missions[p3]
		if v2.Claimed.Value then
			return "AlreadyClaimed"
		end
		if not v2.Value then
			return
		end
		local v3 = v32[p2][p2].Missions[tonumber(p3)]
		if not v3 then
			return
		end
		local v4, v52 = p1:CanGiveItem(v5.GetByName(v3.Reward.Name).ItemType)
		if v4 then
			return true, v2, v3.Reward, v1
		else
			return "Max" .. v52
		end
	else
		if v1.Claimed.Value then
			return "AlreadyClaimed"
		end
		if not v1.Completed.Value then
			return
		end
		if p1:CanGiveItem("Animals") then
			return true, v1, nil, v1
		else
			return "AtAnimalLimit"
		end
	end
end
function t.CanClaimMilestone(p1, p2, p3) --[[ CanClaimMilestone | Line: 1194 | Upvalues: v28 (copy), v5 (copy) ]]
	local v1 = nil
	for v2, v3 in p1.PlayerData.Missions.Milestones:GetChildren() do
		for v4, v52 in v3:GetChildren() do
			if v52.Type.Value == p2 and v52.Name == p3 then
				v1 = v52
				break
			end
		end
	end
	if not v1 then
		return
	end
	if v1.Claimed.Value then
		return "AlreadyClaimed"
	end
	if not v1.Value then
		return
	end
	local Rewards = v28.Milestones[v1.Type.Value][tonumber(p3)].Rewards
	if not game:GetService("RunService"):IsStudio() then
		local v6 = true
		for v7, v8 in Rewards do
			if not p1:CanGiveItem(v5.GetByName(v8.Name).ItemType) then
				v6 = false
			end
		end
		if not v6 then
			return "MaxInventory"
		end
	end
	return true, v1, Rewards, v28.Milestones[v1.Type.Value][tonumber(p3)]
end
function t.CanStartStoryMission(p1, p2, p3) --[[ CanStartStoryMission | Line: 1237 | Upvalues: v24 (copy), v10 (copy) ]]
	local v1 = p1.PlayerData.Missions.StoryMissions[p2].Stories[tonumber(p3)]
	local v2 = v24.Chapters[tonumber(p2)].Stories[tonumber(p3)]
	if not v1.Unlocked.Value then
		return
	end
	if v1.Started.Value then
		return
	end
	if v2.Locked then
		return
	end
	if v1.Completed.Value and not v1.Claimed.Value then
		return
	end
	if v1.Completed.Value and v1.Value > v10.Get() then
		return "OnResetCooldown"
	end
	return true, v1, v2
end
function t.GetStartedStoryMissions(p1) --[[ GetStartedStoryMissions | Line: 1296 | Upvalues: v24 (copy) ]]
	local t = {}
	for k, v in pairs(p1.PlayerData.Missions.StoryMissions:GetChildren()) do
		for k2, v2 in pairs(v.Stories:GetChildren()) do
			if v2.Started.Value then
				local t2 = {}
				local Stories = v24.Chapters[tonumber(v.Name)].Stories
				t2.Data = Stories[tonumber(v2.Name)]
				t2.DataFolder = v2
				table.insert(t, t2)
			end
		end
	end
	return t
end
function t.StartStoryMission(...) --[[ StartStoryMission | Line: 1311 | Upvalues: v3 (copy) ]]
	return v3.GetRemoteFunction("StartStoryMissionRemote"):InvokeServer(...)
end
function t.ClaimStoryMission(...) --[[ ClaimStoryMission | Line: 1315 | Upvalues: v3 (copy) ]]
	return v3.GetRemoteFunction("ClaimStoryMissionRemote"):InvokeServer(...)
end
function t.HasUnlockedSpeciesMissions(p1, p2) --[[ HasUnlockedSpeciesMissions | Line: 1319 ]]
	return p1:HasUnlockedSpecies(p2)
end
function t.GetTimedSpeciesMission(p1, p2) --[[ GetTimedSpeciesMission | Line: 1323 | Upvalues: v23 (copy) ]]
	return v23.Missions[p2]
end
function t.GetSpeciesUnlockMission(p1, p2) --[[ GetSpeciesUnlockMission | Line: 1327 | Upvalues: v22 (copy) ]]
	return v22.Missions[p2]
end
function t.ClaimSpeciesUnlockMission(...) --[[ ClaimSpeciesUnlockMission | Line: 1331 | Upvalues: v3 (copy) ]]
	return v3.GetRemoteFunction("ClaimSpeciesUnlockMissionRemote"):InvokeServer(...)
end
function t.ClaimTutorialMission(...) --[[ ClaimTutorialMission | Line: 1335 | Upvalues: v3 (copy) ]]
	return v3.GetRemoteFunction("ClaimTutorialMissionRemote"):InvokeServer(...)
end
function t.ClaimWorldMissionReward(...) --[[ ClaimWorldMissionReward | Line: 1339 | Upvalues: v3 (copy) ]]
	return v3.GetRemoteFunction("ClaimWorldMissionRemote"):InvokeServer(...)
end
function t.CanClaimSpeciesMission(p1, p2, p3) --[[ CanClaimSpeciesMission | Line: 1349 | Upvalues: v23 (copy), v5 (copy) ]]
	local v1 = p1.PlayerData.Missions.SpeciesMissions[p2]
	if p3 then
		local v2 = v1.Missions[p3]
		if v2.Claimed.Value then
			return "AlreadyClaimed"
		end
		if not v2.Value then
			return
		end
		local v3 = v23.Missions[p2].Missions[p3]
		if not v3 then
			return
		end
		local v4, v52 = p1:CanGiveItem(v5.GetByName(v3.Reward.Name).ItemType)
		if v4 then
			return true, v2, { v3.Reward }, v1, v23.Missions[p2]
		else
			return "Max" .. v52
		end
	else
		if v1.Claimed.Value then
			return "AlreadyClaimed"
		end
		if not v1.Completed.Value then
			return
		end
		local v6 = v23.Missions[p2]
		if not v6 then
			return
		end
		local t = {}
		for k, v in pairs(game:GetService("HttpService"):JSONDecode(v1.Reward.Value)) do
			local v7
			v7 = if type(v) == "table" and v then v else v6.Rewards[v]
			local v9, v10 = p1:CanGiveItem(v5.GetByName(v7.Species or v7.Name).ItemType)
			if not v9 then
				return "Max" .. v10
			end
			table.insert(t, v7)
		end
		return true, v1, t, v1, v6
	end
end
function t.CanStartSpeciesMission(p1, p2) --[[ CanStartSpeciesMission | Line: 1403 ]]
	local v1 = p1.PlayerData.Missions.SpeciesMissions[p2]
	if v1.Started.Value then
		return
	end
	if p1:HasUnlockedSpecies(p2) then
		return true, v1
	else
		return "NotUnlockedSpecies"
	end
end
function t.StartSpeciesMission(...) --[[ StartSpeciesMission | Line: 1416 | Upvalues: v3 (copy) ]]
	return v3.GetRemoteFunction("StartSpeciesMissionRemote"):InvokeServer(...)
end
function t.ClaimSpeciesMission(...) --[[ ClaimSpeciesMission | Line: 1420 | Upvalues: v3 (copy) ]]
	return v3.GetRemoteFunction("ClaimSpeciesMissionRemote"):InvokeServer(...)
end
function t.CanClaimTimedMission(p1, p2, p3) --[[ CanClaimTimedMission | Line: 1424 | Upvalues: t2 (copy), v5 (copy) ]]
	local v1 = p1.PlayerData.Missions[p2 .. "Missions"][p3]
	if v1.Claimed.Value then
		return "AlreadyClaimed"
	end
	if not v1.Completed.Value then
		return
	end
	local t = {}
	for k, v in pairs(game:GetService("HttpService"):JSONDecode(v1.Reward.Value)) do
		local v2 = t2[p2][tonumber(p3)].Rewards[v]
		if v2 then
			local v3, v4 = p1:CanGiveItem(v5.GetByName(v2.Name).ItemType)
			if not v3 then
				return "Max" .. v4
			end
			table.insert(t, v2)
		end
	end
	return true, v1, t
end
function t.ClaimTimedMission(...) --[[ ClaimTimedMission | Line: 1453 | Upvalues: v3 (copy) ]]
	return v3.GetRemoteFunction("ClaimTimedMissionRemote"):InvokeServer(...)
end
function t.ClaimOneTimeMission(...) --[[ ClaimOneTimeMission | Line: 1457 | Upvalues: v3 (copy) ]]
	return v3.GetRemoteFunction("ClaimOneTimeMissionRemote"):InvokeServer(...)
end
function t.CanClaimOneTimeMission(p1, p2, p3) --[[ CanClaimOneTimeMission | Line: 1461 | Upvalues: v27 (copy), v5 (copy) ]]
	local v1 = p1.PlayerData.Missions.OneTimeMissions[p2]
	if p3 then
		local v2 = v1.Missions[p3]
		if v2.Claimed.Value then
			return "AlreadyClaimed"
		end
		if not v2.Value then
			return
		end
		local v3 = v27.Missions[p2].Missions[p3]
		if not v3 then
			return
		end
		local v4, v52 = p1:CanGiveItem(v5.GetByName(v3.Reward.Name).ItemType)
		if v4 then
			return true, v2, { v3.Reward }, v1, v3
		else
			return "Max" .. v52
		end
	else
		if v1.Claimed.Value then
			return "AlreadyClaimed"
		end
		if not v1.Completed.Value then
			return
		end
		local v6 = v27.Missions[p2]
		if not v6 then
			return
		end
		local t = {}
		for k, v in pairs(v6.Rewards) do
			local v7, v8 = p1:CanGiveItem(v5.GetByName(v.Name).ItemType)
			if not v7 then
				return "Max" .. v8
			end
			table.insert(t, v)
		end
		return true, v1, t, v1, v6
	end
end
function t.GetPinnedMissions(p1) --[[ GetPinnedMissions | Line: 1513 ]]
	local t = {
		StreakMissions = nil
	}
	local t2 = {}
	for v1, v2 in p1.PlayerData.Missions:GetDescendants() do
		if v2:IsA("BoolValue") and (v2.Name == "Pinned" and v2.Value) then
			if v2:IsDescendantOf(p1.PlayerData.Missions.StreakMissions) then
				if not t.StreakMissions then
					t.StreakMissions = {}
				end
				table.insert(t.StreakMissions, v2)
				continue
			end
			table.insert(t2, v2)
		end
	end
	if p1.EventData and p1.EventData:FindFirstChild("Missions") then
		local t3 = {}
		for v3, v4 in p1.EventData.Missions:GetDescendants() do
			if v4:IsA("BoolValue") and (v4.Name == "Pinned" and v4.Value) then
				local v5 = v4.Parent.Parent.Parent
				if v5 and v5.Parent == p1.EventData.Missions then
					if not t3[v5.Name] then
						t3[v5.Name] = {}
					end
					table.insert(t3[v5.Name], v4)
					continue
				end
				table.insert(t2, v4)
			end
		end
		for v7, v8 in t3 do
			table.insert(t2, v8)
		end
	end
	if p1.EventData and p1.EventData:FindFirstChild("MiniQuests") then
		local t3 = {}
		for v9, v10 in p1.EventData.MiniQuests:GetDescendants() do
			if v10:IsA("BoolValue") and (v10.Name == "Pinned" and v10.Value) then
				local v11 = v10.Parent.Parent.Parent
				if v11 and v11.Parent == p1.EventData.MiniQuests then
					if not t3[v11.Name] then
						t3[v11.Name] = {}
					end
					table.insert(t3[v11.Name], v10)
					continue
				end
				table.insert(t2, v10)
			end
		end
		for v13, v14 in t3 do
			table.insert(t2, v14)
		end
	end
	for v15, v16 in t do
		table.insert(t2, v16)
	end
	return t2
end
function t.PinMission(p1, p2, p3) --[[ PinMission | Line: 1598 | Upvalues: t (copy) ]]
	local v1 = t.GetPinnedMissions(p1)
	if #v1 >= 3 and type(v1[1]) == "table" then
		for k, v in pairs(v1[1]) do
			v.Value = false
		end
	elseif #v1 >= 3 then
		v1[1].Value = false
	end
	for k, v in pairs(v1) do
		if type(v) == "table" then
			for k2, v2 in pairs(v) do
				if v2.Parent:FindFirstChild("Claimed") and v2.Parent.Claimed.Value then
					v2.Value = false
				end
			end
			continue
		end
		if v.Parent:FindFirstChild("Claimed") and v.Parent.Claimed.Value then
			v.Value = false
		end
	end
	if p3 and p2:FindFirstChild("Started") then
		p2.Started.Value = true
	end
	if p2:FindFirstChild("Started") and not p2.Started.Value then
		return
	end
	p2.Pinned.Value = true
end
function t.HasUnclaimedMissions(p1) --[[ HasUnclaimedMissions | Line: 1640 ]]
	if p1:FindFirstChild("Claimed") and (p1.Completed.Value and not p1.Claimed.Value) then
		return true
	end
	for k, v in pairs(p1.Missions:GetChildren()) do
		if v:FindFirstChild("Claimed") then
			if v.Value and not v.Claimed.Value then
				return true
			end
			if not v.Value then
				return true
			end
		end
	end
end
function t.GetStreakPoints(p1, p2) --[[ GetStreakPoints | Line: 1657 ]]
	if p2 then
		return p1.EventData.StreakMissions.StreakPoints.Value
	else
		return p1.PlayerData.Missions.StreakMissions.StreakPoints.Value
	end
end
function t.GetCurrentStreakTier(p1, p2) --[[ GetCurrentStreakTier | Line: 1664 | Upvalues: t (copy), v37 (copy), v26 (copy) ]]
	local v1 = t.GetStreakPoints(p1, p2)
	local v2 = p2 and p1.EventData.StreakMissions.ClaimedTiers or p1.PlayerData.Missions.StreakMissions.ClaimedTiers
	local v3 = p2 and v37 or v26
	for k, v in pairs(v3) do
		if v1 < v.Points or not v2[k].Value then
			return v
		end
	end
	return v3[#v3]
end
function t.CanClaimStreakMission(p1, p2, p3, p4) --[[ CanClaimStreakMission | Line: 1678 | Upvalues: v36 (copy), v25 (copy), v5 (copy) ]]
	local v2 = (p4 and p1.EventData.StreakMissions.Missions[p2] or p1.PlayerData.Missions.StreakMissions.Missions[p2]).Missions[p3]
	if v2.Claimed.Value then
		return "AlreadyClaimed"
	end
	if not v2.Value then
		return "NotCompleted"
	end
	local v4 = (p4 and v36 or v25).Missions[p2]
	if not v4 then
		return
	end
	local v52 = v4.Missions[p3]
	if not v52 then
		return
	end
	local t = {}
	for k, v in pairs(game:GetService("HttpService"):JSONDecode(v2.Reward.Value)) do
		local v6
		v6 = if type(v) == "table" and v then v else v52.Rewards[v]
		local v8, v9 = p1:CanGiveItem(v5.GetByName(v6.Species or v6.Name).ItemType)
		if not v8 then
			return "Max" .. v9
		end
		table.insert(t, v6)
	end
	return true, v2, t
end
function t.ClaimStreakMission(...) --[[ ClaimStreakMission | Line: 1717 | Upvalues: v3 (copy) ]]
	return v3.GetRemoteFunction("ClaimStreakMissionRemote"):InvokeServer(...)
end
function t.CanClaimStreakReward(p1, p2) --[[ CanClaimStreakReward | Line: 1721 | Upvalues: t (copy) ]]
	local v1 = t.GetCurrentStreakTier(p1, p2)
	local v2 = p2 and p1.EventData.StreakMissions.ClaimedTiers[v1.Index] or p1.PlayerData.Missions.StreakMissions.ClaimedTiers[v1.Index]
	if v2.Value then
		return "AlreadyClaimed"
	end
	warn("Getting streak points", t.GetStreakPoints(p1, p2), v1.Points)
	if t.GetStreakPoints(p1, p2) < v1.Points then
		return "NotEnoughPoints"
	else
		return true, v2, v1
	end
end
function t.CanClaimEventPassMission(p1, p2, p3) --[[ CanClaimEventPassMission | Line: 1738 | Upvalues: v39 (copy) ]]
	local v1 = p1.EventData.PassMissions[p2].Missions[p3]
	if not v1 then
		return
	end
	if v1.Claimed.Value then
		return "AlreadyClaimed"
	end
	if v1.Value then
		return true, v39[p2], v1
	else
		return "NotCompleted"
	end
end
function t.ClaimEventPassMission(p1, p2, p3) --[[ ClaimEventPassMission | Line: 1756 ]]
	return true
end
function t.StartSpeciesUnlock(p1, p2, p3, p4) --[[ StartSpeciesUnlock | Line: 1786 | Upvalues: v4 (copy), t (copy), v22 (copy), v15 (copy) ]]
	local v1 = v4.getWrapperFromPlayer(p1)
	if not v1 then
		return false
	end
	local v2, v3 = t.CanStartSpeciesUnlock(v1, p2)
	if v2 ~= true then
		return false, v3
	end
	local v42 = v22.Missions[p2]
	if not (v1:CanAfford(v42.Cost, "Coins") or p3) then
		return false, "You cannot afford to start this species quest!"
	end
	if not p3 then
		local v5 = v1:GetCurrencyValue("Coins")
		v5.Value = v5.Value - v42.Cost
		v15.ReportResourceEvent(p1, "Sink", "Currency", "Coins", "SpeciesStart", v42.Cost)
		v15.ReportDesignEvent(p1, "StartSpeciesMission", {
			{
				Key = "Species",
				Value = p2
			}
		}, 1)
	end
	v3.Started.Value = true
	v15.GamebeastPlayerMarker(p1, "EventMission", {
		{
			Key = "Status",
			Value = "Started"
		},
		{
			Key = "Species",
			Value = p2
		}
	}, 1)
	if p4 then
		return true
	end
	t.PinMission(v1, v3)
	return true
end
function t.ClaimStreakReward(...) --[[ ClaimStreakReward | Line: 1824 | Upvalues: v3 (copy) ]]
	return v3.GetRemoteFunction("ClaimStreakRewardRemote"):InvokeServer(...)
end
if v21.EventName then
	function t.GetSlotInfoForEventMission(p1, p2, p3, p4, p5, p6) --[[ GetSlotInfoForEventMission | Line: 1829 | Upvalues: v35 (copy), v2 (copy) ]]
		local v1 = nil
		local v22
		if p6 then
			v22 = p4.Preset and p4.Preset[math.random(1, #p4.Preset)]
		else
			local v4 = if p3 then v35[p2].Missions[p3].Index else v35[p2].Index or 0
			local v6 = p4.Preset and p4.Preset[Random.new(p1.Player.UserId + v4):NextInteger(1, #p4.Preset)]
			v1 = p1.Player.UserId + v4
			v22 = v6
		end
		local t = {
			Origin = "Wild",
			DoNotParent = true,
			Age = 66,
			Gender = "Female",
			Species = p4.Species,
			Preset = v22 or nil,
			Seed = v1,
			DoNotIncrementCount = not p5,
			Infertile = p4.Infertile,
			MutationsToGuarantee = p4.MutationsToGuarantee
		}
		t.NoMutations = p4.NoMutations or not p4.MutationsToGuarantee
		t.MutationChances = p4.MutationChances
		t.MutationSlotChances = p4.MutationSlotChances or {
			{
				Amount = 0,
				P = 0
			}
		}
		t.MaxCosmetics = p4.MaxCosmetics
		t.ExclusiveStockTag = p4.ExclusiveStockTag
		return v2.CreateSlot(p1, t)
	end
	function t.CanClaimEventMission(p1, p2, p3, p4) --[[ CanClaimEventMission | Line: 1873 | Upvalues: v21 (copy), v35 (copy), v5 (copy), t (copy) ]]
		if not v21.EventName then
			return "NoActiveEvent"
		end
		local v1 = v35[p2]
		if not v1 then
			return
		end
		if p3 then
			local v2 = v1.Missions[p3]
			if not v2 then
				return
			end
			local v3 = p1.EventData.Missions[p2].Missions[p3]
			if p4 then
				local v4 = v3.Missions[p4]
				if v4.Claimed.Value then
					return "AlreadyClaimed"
				end
				if not v4.Value then
					return
				end
				local v52 = v2.Missions[p4]
				if not v52 then
					return
				end
				local v6, v7 = p1:CanGiveItem(v5.GetByName(v52.Reward.Name).ItemType)
				if v6 then
					return true, v4, v52, v52.Reward, v3
				else
					return "Max" .. v7
				end
			else
				if v3.Claimed.Value then
					return "AlreadyClaimed"
				end
				if not v3.Completed.Value then
					return
				end
				local v8 = t.GetRewardForMission(v2)
				if v8.Species then
					if not p1:CanGiveItem("Animals") then
						return "AtAnimalLimit"
					end
				else
					local v9, v10 = p1:CanGiveItem(v5.GetByName(v8.Name).ItemType)
					if not v9 then
						return "Max" .. v10
					end
				end
				return true, v3, v2, v8, v3
			end
		else
			local v11 = p1.EventData.Missions[p2]
			if not v11 then
				return
			end
			if v11.Claimed.Value then
				return "AlreadyClaimed"
			end
			if not v11.Completed.Value then
				return
			end
			local v12 = v1.Rewards[1]
			if v12.Name and (string.find(v12.Name, "BreedingLicense") and v1.Rewards[2]) then
				local v13 = p1:GetItemValue(v12.Name)
				if v13 and v13.Value > 0 then
					v12 = v1.Rewards[2]
				end
			end
			if v12.Species then
				if not p1:CanGiveItem("Animals") then
					return "AtAnimalLimit"
				end
			else
				local v14, v15 = p1:CanGiveItem(v5.GetByName(v12.Name).ItemType)
				if not v14 then
					return "Max" .. v15
				end
			end
			return true, v11, v1, v12, v11
		end
	end
	function t.CanClaimMiniQuestMission(p1, p2) --[[ CanClaimMiniQuestMission | Line: 1975 | Upvalues: v34 (ref), v21 (copy) ]]
		local v1 = v34[tonumber(p2)]
		if not v1 then
			return
		end
		local v2 = p1.PlayerData.Events[v21.EventName].MiniQuests[p2]
		if not v2 then
			return
		end
		if v2.Claimed.Value then
			return "AlreadyClaimed"
		end
		if v2.Completed.Value then
			return true, v2, v1, v2
		end
	end
	function t.ClaimEventMission(...) --[[ ClaimEventMission | Line: 1997 | Upvalues: v3 (copy) ]]
		return v3.GetRemoteFunction("ClaimEventMissionRemote"):InvokeServer(...)
	end
end
function t.GetRewardForMission(p1) --[[ GetRewardForMission | Line: 2002 | Upvalues: t (copy) ]]
	if not p1.StockId then
		return p1.Reward
	end
	if t.HasRewardStockLeft(p1.StockId) then
		return p1.Reward
	else
		return p1.OutOfStockReward
	end
end
function t.GetRewardStockValues(p1) --[[ GetRewardStockValues | Line: 2014 | Upvalues: MissionRewardStock (copy) ]]
	return MissionRewardStock:FindFirstChild(p1)
end
function t.GetRewardStockRemaining(p1) --[[ GetRewardStockRemaining | Line: 2018 | Upvalues: t (copy) ]]
	local v1 = t.GetRewardStockValues(p1)
	if v1 then
		return v1.StockRemaining.Value - v1.Queued.Value
	end
end
function t.PinEventPassMission(p1) --[[ PinEventPassMission | Line: 2027 | Upvalues: v3 (copy) ]]
	v3.GetRemoteFunction("PinEventPassMissionRemote"):InvokeServer(p1)
end
function t.HasRewardStockLeft(p1) --[[ HasRewardStockLeft | Line: 2031 | Upvalues: t (copy) ]]
	return t.GetRewardStockRemaining(p1) > 0
end
function t.RefreshRewardStock() --[[ RefreshRewardStock | Line: 2035 | Upvalues: t4 (copy), v43 (copy), t (copy) ]]
	local t2 = {}
	for k, v in pairs(t4) do
		if v.StockValues.Queued.Value ~= 0 then
			t2[k] = v.StockValues.Queued.Value
		end
	end
	if next(t2) then
		local v1, v2 = v43:Update("ActiveStock", t2)
		if not v2 then
			warn("Reward Stock - UpdateAsync failed", v1)
			return
		end
		local v3 = if v1 then v1 else {}
		for k, v in pairs(v3) do
			local v4 = t.GetRewardStockValues(k)
			if v4 then
				v4.StockRemaining.Value = v
				local v5 = t2[k]
				if v5 then
					v4.Queued.Value = math.max(0, v4.Queued.Value - v5)
				end
				continue
			end
			warn("No stock values can be found for", k)
		end
		print("Reward Stock - Updated data", v3)
	else
		local v7, v8 = v43:Get("ActiveStock")
		if not v8 then
			warn("Reward Stock - GetAsync failed", v7)
			return
		end
		local v10 = if v7 then v7 else {}
		for k, v in pairs(t4) do
			local v11 = t.GetRewardStockValues(k)
			if v11 then
				if v10[k] then
					v11.StockRemaining.Value = v10[k]
					continue
				end
				v11.StockRemaining.Value = v.MaxStock
				continue
			end
			warn("No stock values can be found for", k)
		end
	end
end
local t5 = {}
local t6 = {}
local t7 = {}
local t8 = {}
function t.SkipMission(p1, p2) --[[ SkipMission | Line: 2095 | Upvalues: v4 (copy), t8 (copy) ]]
	local v1 = v4.getWrapperFromPlayer(p1).PlayerData.Missions.SpeciesMissions[p2]
	if v1 and not v1.Completed.Value then
		t8[p1] = p2
		return true
	else
		return false
	end
end
function t.SkipWorldMission(p1, p2, p3) --[[ SkipWorldMission | Line: 2108 | Upvalues: v4 (copy), t5 (copy) ]]
	local v1 = v4.getWrapperFromPlayer(p1)
	local v2 = v1.PlayerData.Missions.WorldMissions[p2]
	if not v2 or v2.Completed.Value then
		return false
	end
	if p3 ~= "Coins" then
		t5[p1] = p2
		return true
	end
	local v3 = v1:CanAfford(3000, p3)
	if v3 then
		v3.Value = v3.Value - 3000
		v2.Completed.Value = true
		v2.Pinned.Value = false
		return true
	else
		return false
	end
end
function t.GetStableClubMissionData(p1, p2, p3) --[[ GetStableClubMissionData | Line: 2134 | Upvalues: v18 (copy) ]]
	local v1 = Random.new(p1)
	local v2 = v18.Copy(p2)
	local t = {}
	for i = 1, 4 do
		if #v2 == 0 then
			break
		end
		local v3 = v1:NextInteger(1, #v2)
		table.insert(t, v2[v3])
		table.remove(v2, v3)
	end
	return t[p3]
end
function t.ResetStableClubMissions(p1) --[[ ResetStableClubMissions | Line: 2155 ]]
	local PlayerData = p1.PlayerData
	if not PlayerData then
		return
	end
	local StableClubs = PlayerData.Missions:FindFirstChild("StableClubs")
	if not StableClubs then
		return
	end
	local LastMissions = StableClubs:FindFirstChild("LastMissions")
	if LastMissions then
		LastMissions.Value = 0
	end
end
function t.Init(p1) --[[ Init | Line: 2176 | Upvalues: t (copy), v6 (copy), RunService (copy), v26 (copy), v37 (copy), v1 (copy), v7 (copy), v23 (copy), Sonar (copy), v28 (copy), v25 (copy), v36 (copy), v21 (copy), MissionRewardStock (copy), t4 (copy), v35 (copy), v9 (copy), v3 (copy), v13 (copy), t5 (copy), t8 (copy), v4 (copy), v15 (copy), v11 (copy), v41 (copy), v2 (copy), t7 (copy), v14 (copy), v5 (copy), v12 (copy), ReplicatedStorage (copy), t6 (copy), v16 (copy), v10 (copy), v19 (copy) ]]
	t.DailyStreakMissionTimer = v6.new({
		Duration = 86400,
		Start = 1714762800
	})
	t.StreakMissionTimer = v6.new({
		Duration = 604800,
		Start = 1714762800
	})
	t.EventDailyStreakMissionTimer = v6.new({
		Duration = 86400,
		Start = 1733521980
	})
	t.EventStreakMissionTimer = v6.new({
		Duration = 604800,
		Start = 1733521980
	})
	t.StableClubMissionTimer = v6.new({
		Duration = 604800,
		Start = 1769806800
	})
	t.StableClubPointCapTimer = v6.new({
		Duration = 86400,
		Start = 1769806800
	})
	local v17 = t
	local t2 = {
		Start = 1714762800
	}
	t2.Duration = if RunService:IsStudio() then 120 else 3600
	v17.HourlyMissionTimer = v6.new(t2)
	for k, v in pairs(v26) do
		v.Index = k
	end
	if v37 then
		for k, v in pairs(v37) do
			v.Index = k
		end
	end
	if v1 then
		t.StreakMissionTimer.SeedChanged:Connect(function() --[[ Line: 2220 | Upvalues: v7 (ref) ]]
			v7:BroadcastMessage({
				Type = "ResetMissions",
				Message = "Streak Mission Rewards have refreshed and have been added to your journal!"
			})
		end)
		t.DailyStreakMissionTimer.SeedChanged:Connect(function() --[[ Line: 2227 | Upvalues: v7 (ref) ]]
			v7:BroadcastMessage({
				Type = "ResetMissions",
				Message = "New Daily missions have been added to your journal!"
			})
		end)
	end
	if not v1 then
		return
	end
	for k, v in pairs(v23.Missions) do
		for k2, v8 in pairs(v.Missions) do
			if v8.MissionsByType then
				v8.MissionsByIndex = Sonar("Table").ToListByIndex(v8.MissionsByType)
			end
		end
	end
	for k, v in pairs(v28.Achievements) do
		if v.MissionsByType then
			v.MissionsByIndex = Sonar("Table").ToListByIndex(v.MissionsByType)
		end
	end
	for k, v in pairs(v28.Milestones) do
		if v.MissionsByType then
			v.MissionsByIndex = Sonar("Table").ToListByIndex(v.MissionsByType)
		end
	end
	for k, v in pairs(v25.Missions) do
		for k2, v8 in pairs(v.Missions) do
			if v8.MissionsByType then
				v8.MissionsByIndex = Sonar("Table").ToListByIndex(v8.MissionsByType)
			end
		end
	end
	if v36 then
		for k, v in pairs(v36.Missions) do
			for k2, v8 in pairs(v.Missions) do
				if v8.MissionsByType then
					v8.MissionsByIndex = Sonar("Table").ToListByIndex(v8.MissionsByType)
				end
			end
		end
	end
	local LimitedStockHorses = v21.LimitedStockHorses
	if LimitedStockHorses then
		for k, v in pairs(LimitedStockHorses) do
			if v.StockId and v.MaxStock then
				local v42 = MissionRewardStock.Default:Clone()
				v42.Name = v.StockId
				v42.StockRemaining.Value = -1
				v42.Parent = MissionRewardStock
				t4[v.StockId] = {
					StockValues = v42,
					MaxStock = v.MaxStock
				}
			end
		end
		if not v35 then
			v9.spawnLoop(t.RefreshRewardStock, 60, true)
		end
	end
	v3.GetRemoteFunction("SkipMission").OnServerInvoke = t.SkipMission
	v3.GetRemoteFunction("SkipWorldMission").OnServerInvoke = t.SkipWorldMission
	v13.AddProductHandler("SkipWorldMission", function(p1, p2) --[[ Line: 2309 | Upvalues: t5 (ref) ]]
		local v1 = p1.PlayerData.Missions.WorldMissions[t5[p1.Player]]
		if v1 then
			v1.Completed.Value = true
			v1.Pinned.Value = false
			return {
				ItemType = p2.Currency,
				ItemId = p2.Amount
			}
		end
	end)
	v13.AddProductHandler("SkipMission", function(p1, p2) --[[ Line: 2321 | Upvalues: t8 (ref) ]]
		local v1 = p1.PlayerData.Missions.SpeciesUnlocks[t8[p1.Player]]
		if not v1 then
			return
		end
		v1.Completed.Value = true
		for v2, v3 in v1.Missions:GetChildren() do
			v3.Value = true
			v3.Amount.Value = 20
		end
		return {
			ItemType = p2.Currency,
			ItemId = p2.Amount
		}
	end)
	v13.AddProductHandler("PremiumTrack", function(p1, p2) --[[ Line: 2338 ]]
		p1.PlayerData.Events.Carnival2025.PremiumTrack.Value = true
		return {
			ItemType = p2.Currency,
			ItemId = p2.Amount
		}
	end)
	v3.GetRemoteFunction("StartLimitedStockUnlockRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 2344 | Upvalues: v4 (ref), t (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if v1 then
			local v2, v3 = t.StartLimitedStockUnlock(v1, p2, p3)
			return v2, v3
		else
			return false, "NoPlayerWrapper"
		end
	end
	v3.GetRemoteFunction("CompleteLimitedStockUnlockRemote").OnServerInvoke = function(p1, p2) --[[ Line: 2354 | Upvalues: v4 (ref), t (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return false, "NoPlayerWrapper"
		end
		local LimitedStockUnlocks = v1.PlayerData.Missions:FindFirstChild("LimitedStockUnlocks")
		if not LimitedStockUnlocks then
			return false, "NoDataFolder"
		end
		local v2 = LimitedStockUnlocks:FindFirstChild(p2)
		if v2 then
			return t.CompleteLimitedStockUnlock(v1, v2)
		else
			return false, "MissionNotFound"
		end
	end
	v3.GetRemoteFunction("CancelLimitedStockUnlockRemote").OnServerInvoke = function(p1, p2) --[[ Line: 2373 | Upvalues: v4 (ref), t (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if v1 then
			return t.CancelLimitedStockUnlock(v1, p2)
		else
			return false, "NoPlayerWrapper"
		end
	end
	v3.GetRemoteEvent("StartWorldMission").OnServerEvent:Connect(function(p1, p2) --[[ Line: 2382 | Upvalues: v4 (ref), t (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2 = v1.PlayerData.Missions.WorldMissions:FindFirstChild(p2)
		if v2 then
			v2.Started.Value = true
			t.PinMission(v1, v2)
		end
	end)
	if v21.EventName then
		v3.GetRemoteFunction("ClaimMiniQuestMissionRemote").OnServerInvoke = function(p1, p2) --[[ Line: 2398 | Upvalues: v4 (ref), t (ref), v15 (ref), v21 (ref), v11 (ref), v41 (ref), v2 (ref) ]]
			local v1 = v4.getWrapperFromPlayer(p1)
			local v22, v3, v42 = t.CanClaimMiniQuestMission(v1, p2)
			if v22 ~= true then
				return
			end
			v3.Claimed.Value = true
			local CompletedCount = v3.CompletedCount
			CompletedCount.Value = CompletedCount.Value + 1
			v3.CompletedAt.Value = workspace:GetServerTimeNow()
			local t2 = {}
			local t3 = {
				Key = "MissionId",
				Value = tostring(p2)
			}
			local t4 = {
				Key = "CompletedCount"
			}
			t4.Value = tostring(v3.CompletedCount.Value)
			t2[1] = {
				Key = "Status",
				Value = "Finished"
			}
			t2[2] = t3
			t2[3] = t4
			v15.GamebeastPlayerMarker(p1, "MiniQuest", t2, 1)
			local v5 = v1.PlayerData.Events[v21.EventName]
			local CompletedMissions = v5.CompletedMissions
			CompletedMissions.Value = CompletedMissions.Value + 1
			if v5.CompletedMissions.Value >= 5 then
				v11.GiveBadgeToPlayer(p1, 3580597861531886)
			end
			local v6 = if v3.CompletedCount.Value == 1 then v42.Rewards[1] else v42.Rewards[2] or v42.Rewards[1]
			if v6.Name == v41.BreedingLicense and (v1:GetItemValue(v41.BreedingLicense) and (if v1:GetItemValue(v41.BreedingLicense).Value > 0 then true else false)) then
				local v9 = v42.Rewards[2]
				v1:GiveItem({
					Source = "MiniQuestMission",
					ItemStream = true,
					IgnoreLimit = true,
					Name = v9.Name,
					Amount = v9.Amount,
					Theme = v9.Theme
				})
				return true
			end
			if v6.Name == v41.BreedingLicense then
				v1.PlayerData.ExtraSpeciesUnlocks[v41.BreedingLicenseSpecies].Value = true
				v11.GiveBadgeToPlayer(p1, 3576455819248190)
			end
			if not v6.Species then
				v1:GiveItem({
					Source = "MiniQuestMission",
					ItemStream = true,
					IgnoreLimit = true,
					Name = v6.Name,
					Amount = v6.Amount,
					Theme = v6.Theme
				})
				return true
			end
			local v112 = v6.Preset and v6.Preset[Random.new(v1.Player.UserId + tonumber(p2) + v3.CompletedCount.Value):NextInteger(1, #v6.Preset)]
			local t5 = {
				Origin = "Wild",
				DoNotParent = true,
				Age = 66,
				Gender = "Female",
				Species = v6.Species,
				Preset = v112 or nil,
				Seed = v1.Player.UserId + tonumber(p2) + v3.CompletedCount.Value,
				Infertile = v6.Infertile,
				MutationsToGuarantee = v6.MutationsToGuarantee
			}
			t5.NoMutations = v6.NoMutations or not v6.MutationsToGuarantee
			t5.MutationChances = v6.MutationChances
			t5.MutationSlotChances = v6.MutationSlotChances or {
				{
					Amount = 0,
					P = 0
				}
			}
			t5.MaxCosmetics = v6.MaxCosmetics
			local v14 = v2.CreateSlot(v1, t5)
			v14.Parent = v1:GetItemFolder("Animals")
			v15.ReportResourceEvent(v1.Player, "Source", "HorseSlot", v6.Species, "MiniQuestMission", 1, {})
			return v14.Name
		end
		v3.GetRemoteFunction("SkipMiniQuestMission").OnServerInvoke = function(p1, p2) --[[ Line: 2492 | Upvalues: t7 (ref) ]]
			t7[p1] = p2
		end
		v13.AddProductHandler("SkipMiniQuestMission", function(p1, p2) --[[ Line: 2498 | Upvalues: v4 (ref), v21 (ref), t7 (ref) ]]
			local v1 = v4.getWrapperFromPlayer(p1.Player)
			if not v1 then
				return false
			end
			local v2 = v1.PlayerData.Events[v21.EventName].MiniQuests[t7[p1.Player]]
			if not v2 then
				return false
			end
			v2.Completed.Value = true
			for v3, v42 in v2.Missions:GetChildren() do
				v42.Value = true
				v42.Amount.Value = 100
			end
			return {
				ItemType = p2.Currency,
				ItemId = p2.Amount
			}
		end)
		v13.AddProductHandler("ResetMiniQuestMission", function(p1, p2) --[[ Line: 2520 | Upvalues: v4 (ref), v21 (ref), t7 (ref) ]]
			local v1 = v4.getWrapperFromPlayer(p1.Player)
			if not v1 then
				return false
			end
			local v2 = v1.PlayerData.Events[v21.EventName].MiniQuests[t7[p1.Player]]
			if not v2 then
				return false
			end
			if not v2.Claimed.Value then
				return false
			end
			v2.Completed.Value = false
			v2.Claimed.Value = false
			v2.CompletedAt.Value = 0
			local CompletedCount = v2:FindFirstChild("CompletedCount")
			if CompletedCount and CompletedCount.Value == 0 then
				CompletedCount.Value = 1
			end
			for v3, v42 in v2.Missions:GetChildren() do
				v42.Value = false
				v42.Amount.Value = 0
			end
			return {
				ItemType = p2.Currency,
				ItemId = p2.Amount
			}
		end)
		v13.AddProductHandler("ResetEventTiers", function(p1, p2) --[[ Line: 2553 | Upvalues: t (ref) ]]
			if not (p1.EventData and p1.EventData:FindFirstChild("StreakMissions")) then
				return false
			end
			local StreakMissions = p1.EventData.StreakMissions
			StreakMissions.LastMissions.Value = t.EventStreakMissionTimer.CurrentSeed
			StreakMissions.StreakPoints.Value = 0
			for v1, v2 in StreakMissions.ClaimedTiers:GetChildren() do
				v2.Value = false
			end
			for i = 1, #StreakMissions.Missions:GetChildren() do
				local v3 = StreakMissions.Missions:FindFirstChild((tostring(i)))
				v3.Value = t.EventDailyStreakMissionTimer.CurrentSeed - 1
				v3.Completed.Value = false
				for v4, v5 in v3.Missions:GetChildren() do
					v5.Claimed.Value = false
					v5.Value = false
					v5.Amount.Value = 0
				end
			end
			p1.EventData.StreakMissions.ClaimedTiers[1].Value = false
			return {
				ItemType = "ResetEventTiers",
				ItemId = 1
			}
		end)
		v13.AddProductHandler("SkipMissionTiers", function(p1, p2) --[[ Line: 2584 ]]
			if not (p1.EventData and p1.EventData:FindFirstChild("StreakMissions")) then
				return false
			end
			local StreakMissions = p1.EventData.StreakMissions
			local count = 0
			for i = 1, #StreakMissions.Missions:GetChildren() do
				for v1, v2 in StreakMissions.Missions:FindFirstChild((tostring(i))).Missions:GetChildren() do
					v2.Value = true
					v2.Amount.Value = 100
					count = count + 1
				end
			end
			local StreakPoints = StreakMissions.StreakPoints
			StreakPoints.Value = StreakPoints.Value + count
			return {
				ItemType = "SkipMissionTiers",
				ItemId = count
			}
		end)
		v3.GetRemoteFunction("ClaimEventMissionRemote").OnServerInvoke = function(p1, p2, p3, p4) --[[ Line: 2608 | Upvalues: v4 (ref), t (ref), v15 (ref), v21 (ref), v11 (ref), v41 (ref), v35 (ref), v14 (ref) ]]
			local v1 = v4.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			local v2, v3, v42, v5, v6 = t.CanClaimEventMission(v1, p2, p3, p4)
			if v2 ~= true then
				return
			end
			if v3.Claimed.Value then
				return
			end
			v3.Claimed.Value = true
			local CompletedCount = v3:FindFirstChild("CompletedCount")
			if CompletedCount then
				CompletedCount.Value = CompletedCount.Value + 1
			end
			v15.GamebeastPlayerMarker(p1, "EventMission", {
				{
					Key = "Status",
					Value = "Finished"
				},
				{
					Key = "TrackName",
					Value = tostring(p2)
				},
				{
					Key = "MissionId",
					Value = tostring(p3 or "Track")
				}
			}, 1)
			local CompletedMissions = v1.PlayerData.Events[v21.EventName].CompletedMissions
			CompletedMissions.Value = CompletedMissions.Value + 1
			v1:IncrementMission({
				Type = "CompleteEventMission",
				Amount = 1
			})
			if v1.PlayerData.Events[v21.EventName].CompletedMissions.Value >= 5 then
				v11.GiveBadgeToPlayer(p1, 3580597861531886)
			end
			if not p3 and v3:FindFirstChild("CompletedAt") then
				v3.CompletedAt.Value = math.floor((workspace:GetServerTimeNow()))
			end
			if p3 and (v42.StockId and v5 ~= v42.OutOfStockReward) then
				local Queued = t.GetRewardStockValues(v42.StockId).Queued
				Queued.Value = Queued.Value + 1
			end
			if p3 and not t.HasUnclaimedMissions(v6) then
				v6.Pinned.Value = false
			end
			if v5.Species then
				local v8 = t.GetSlotInfoForEventMission(v1, p2, p3, v5, true, true)
				v8.Parent = v1:GetItemFolder("Animals")
				local v9 = v1:GetItemFolder("Animals")
				local Species = v8.Species.Value
				local count = 0
				for v10, v112 in v9:GetChildren() do
					if v112.Species.Value == Species then
						count = count + 1
					end
				end
				v15.ReportResourceEvent(v1.Player, "Source", "HorseSlot", Species, "EventMission", 1, {
					{
						Key = "Total",
						Value = count
					}
				})
				return v8.Name
			else
				if v41 and v5.Name == v41.BreedingLicense then
					if v1:GetItemValue(v41.BreedingLicense) and (if v1:GetItemValue(v41.BreedingLicense).Value > 0 then true else false) then
						local v13 = v35[p2]
						if not (v13 and v13.Rewards[2]) then
							return true
						end
						v5 = v13.Rewards[2]
					else
						v1.PlayerData.ExtraSpeciesUnlocks[v41.BreedingLicenseSpecies].Value = true
						v11.GiveBadgeToPlayer(p1, 3576455819248190)
					end
				end
				if v5.Name == "RandomEquipment" and (v21.RandomDrops and v21.RandomDrops.RandomEquipment) then
					local v142 = v14.getRandomWeightedItem(v21.RandomDrops.RandomEquipment, Random.new():NextInteger(1, 2147483647))
					if v142 then
						v5 = {
							Name = v142,
							Amount = v5.Amount,
							Theme = v5.Theme,
							ThemeChance = v5.ThemeChance
						}
					end
				end
				local Theme = v5.Theme
				if type(v5.Theme) == "table" then
					if v5.ThemeChance and not (Random.new():NextNumber() <= v5.ThemeChance) then
						Theme = nil
					else
						Theme = v5.Theme[Random.new():NextInteger(1, #v5.Theme)]
						if type(Theme) ~= "string" then
							Theme = nil
						end
					end
				end
				local t2 = {
					Source = "SpeciesMission",
					Name = v5.Name,
					Amount = v5.Amount
				}
				t2.ItemStream = if v5.Name == "Coins" then true else false
				t2.Theme = Theme
				v1:GiveItem(t2)
				return true
			end
		end
	end
	v3.GetRemoteFunction("PinEventPassMissionRemote").OnServerInvoke = function(p1, p2) --[[ Line: 2745 | Upvalues: v4 (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return false
		end
		local v2 = v1.PlayerData.Events.Carnival2025.PassMissions[p2]
		if not v2 then
			return false
		end
		if v2.Completed.Value then
			return false
		end
		local count = 0
		for v3, v42 in v1.PlayerData.Events.Carnival2025.PassMissions:GetChildren() do
			if v42.Pinned.Value then
				count = count + 1
			end
		end
		if count >= 2 and not v2.Pinned.Value then
			return false
		end
		v2.Pinned.Value = not v2.Pinned.Value
		return true
	end
	v3.GetRemoteFunction("ClaimTutorialMissionRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 2777 | Upvalues: v4 (ref), t (ref), v14 (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, v3, v42, v5 = t.CanClaimTutorialMission(v1, p2, p3)
		if v2 ~= true then
			return
		end
		v3.Claimed.Value = true
		if not t.HasUnclaimedMissions(v5) then
			v5.Pinned.Value = false
		end
		local v6 = v42.Name
		if v42.PullTable then
			v6 = v14.getRandomFromTable(v42.PullTable)
		end
		t.AutopinDailyMissions(v1)
		local t2 = {
			Source = "TutorialMission",
			Name = v6,
			Amount = v42.Amount
		}
		t2.ItemStream = v6 == "Coins"
		t2.Theme = v42.Theme
		v1:GiveItem(t2)
		return true
	end
	v3.GetRemoteFunction("ClaimWorldMissionRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 2810 | Upvalues: v4 (ref), t (ref), v14 (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, v3, v42, v5 = t.CanClaimWorldMission(v1, p2, p3)
		if v2 ~= true then
			return
		end
		v3.Claimed.Value = true
		if not t.HasUnclaimedMissions(v5) then
			v5.Pinned.Value = false
			v5.Completed.Value = true
		end
		local v6 = v42.Name
		if v42.PullTable then
			v6 = v14.getRandomFromTable(v42.PullTable)
		end
		local t2 = {
			Source = "WorldMissions",
			Name = v6,
			Amount = v42.Amount
		}
		t2.ItemStream = if v6 == "Coins" then true else false
		t2.Theme = v42.Theme
		v1:GiveItem(t2)
		return true
	end
	v3.GetRemoteFunction("ClaimSpeciesUnlockMissionRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 2843 | Upvalues: v4 (ref), t (ref), v14 (ref), Sonar (ref), v5 (ref), v15 (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, v3, v42, v52 = t.CanClaimSpeciesUnlockMission(v1, p2, p3)
		if v2 ~= true then
			return
		end
		v3.Claimed.Value = true
		if not t.HasUnclaimedMissions(v52) then
			v52.Pinned.Value = false
			if v52:FindFirstChild("Started") then
				v52.Started.Value = false
			end
		end
		if p3 then
			local v6 = v42.Name
			if v42.PullTable then
				v6 = v14.getRandomFromTable(v42.PullTable)
			end
			local t2 = {
				Source = "SpeciesMission",
				Name = v6,
				Amount = v42.Amount
			}
			t2.ItemStream = if v6 == "Coins" then true else false
			t2.Theme = v42.Theme
			v1:GiveItem(t2)
			if v6 ~= "WovenLasso" or p2 ~= "Pony" then
				return true
			end
			Sonar("ShopService"):EquipToolAfterPurchase(v1, v5.GetByName(v6))
			return true
		else
			local v9 = t.GetSlotInfoForMission(v1, {
				GiveToPlayer = true,
				Species = p2
			})
			v1:IncrementMission({
				Type = "SpeciesUnlock",
				Amount = 1
			})
			v9.Parent = v1:GetItemFolder("Animals")
			local v10 = v1:GetItemFolder("Animals")
			local Species = v9.Species.Value
			local count = 0
			for v11, v12 in v10:GetChildren() do
				if v12.Species.Value == Species then
					count = count + 1
				end
			end
			v15.ReportResourceEvent(v1.Player, "Source", "HorseSlot", Species, "SpeciesUnlockMission", 1, {
				{
					Key = "Total",
					Value = count
				}
			})
			return v9.Name
		end
	end
	v3.GetRemoteFunction("ClaimAchievement").OnServerInvoke = function(p1, p2) --[[ Line: 2922 | Upvalues: v4 (ref), t (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, v3, v42 = t.CanClaimAchievement(v1, p2)
		if v2 ~= true then
			return v2
		end
		v3.Claimed.Value = true
		for k, v in pairs(v42) do
			local t2 = {
				Source = "TimedSpeciesMission",
				IgnoreLimit = true,
				Name = v.Name,
				Amount = v.Amount,
				Theme = v.Theme
			}
			t2.ItemStream = if v.Name == "Coins" then true else false
			v1:GiveItem(t2)
		end
		return true
	end
	v3.GetRemoteFunction("ClaimMilestone").OnServerInvoke = function(p1, p2, p3) --[[ Line: 2951 | Upvalues: v4 (ref), t (ref), v12 (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, v3, v42, v5 = t.CanClaimMilestone(v1, p2, p3)
		if v2 ~= true then
			return v2
		end
		v3.Claimed.Value = true
		for k, v in pairs(v42) do
			local t2 = {
				Source = "TimedSpeciesMission",
				IgnoreLimit = true,
				Name = v.Name,
				Amount = v.Amount,
				Theme = v.Theme
			}
			t2.ItemStream = if v.Name == "Coins" then true else false
			v1:GiveItem(t2)
		end
		if not v5.GiveTitle then
			return true
		end
		v12.GiveTitleToPlayer(p1, v5.GiveTitle)
		return true
	end
	v3.GetRemoteFunction("ClaimEventPassMissionRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 2986 | Upvalues: v4 (ref), t (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return false
		end
		local v2, _, v3 = t.CanClaimEventPassMission(v1, p2, p3)
		local Rewards = t.GetType("PassMissions")[p2].Missions[p3].Rewards
		for k, v in pairs(Rewards) do
			v1:GiveItem({
				Source = "PassReward",
				IgnoreLimit = true,
				Name = v.Name,
				Amount = v.Amount,
				Theme = v.Theme
			})
		end
		if v2 == true then
			v3.Claimed.Value = true
			return true
		else
			return false, v2
		end
	end
	v3.GetRemoteFunction("StartSpeciesUnlockRemote").OnServerInvoke = function(p1, p2) --[[ Line: 3018 | Upvalues: t (ref) ]]
		return t.StartSpeciesUnlock(p1, p2)
	end
	v3.GetRemoteFunction("CancelSpeciesUnlockRemote").OnServerInvoke = function(p1, p2) --[[ Line: 3022 | Upvalues: v4 (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		if p2 == "Horse" or p2 == "Pony" then
			return
		end
		local v2 = v1.PlayerData.Missions.SpeciesUnlocks[p2]
		if v2.Started.Value then
			v2.Started.Value = false
			v2.Pinned.Value = false
			return true
		else
			return false
		end
	end
	v3.GetRemoteFunction("StartSpeciesMissionRemote").OnServerInvoke = function(p1, p2) --[[ Line: 3044 | Upvalues: v4 (ref), t (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, v3 = t.CanStartSpeciesMission(v1, p2)
		if v2 == true then
			t.PinMission(v1, v3)
			v3.Started.Value = true
			return true
		end
	end
	v3.GetRemoteFunction("PassRewardsAction").OnServerInvoke = function(p1, p2) --[[ Line: 3060 | Upvalues: v4 (ref), Sonar (ref), ReplicatedStorage (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return false, "NoPlayer"
		end
		if p2.Type == "ClaimFree" then
			local v2 = v1.PlayerData.Events.Carnival2025.PassRewards[p2.Index]
			if v2.FreeReward.Value then
				return false, "AlreadyClaimed"
			end
			local v3 = Sonar(ReplicatedStorage.Storage.Events.Carnival2025.PassRewards)
			local sum = 0
			local t = {}
			for v42, v5 in v3 do
				sum = sum + v5.PointsNeeded
				t[v42] = sum
			end
			local count = 0
			for v6, v7 in v1.PlayerData.Events.Carnival2025.PassMissions:GetChildren() do
				if v7.Completed.Value then
					count = count + 1
				end
			end
			if count < t[p2.Index] then
				return false, "NotEnoughPoints"
			end
			v2.FreeReward.Value = true
			if v3[p2.Index].FreeReward.Species then
				Sonar("ItemSetService"):_giveHorse(v1, v3[p2.Index].FreeReward)
				return true
			end
			if type(v3[p2.Index].FreeReward) == "table" then
				local v8 = v3[p2.Index].FreeReward[math.random(1, #v3[p2.Index].FreeReward)]
				local t2 = {
					Source = "PassReward",
					IgnoreLimit = true,
					Name = v8,
					Amount = v3[p2.Index].FreeRewardAmount or 1,
					Theme = v8.FreeRewardTheme
				}
				t2.ItemStream = v8.FreeReward == "Tickets"
				v1:GiveItem(t2)
				return true
			else
				local v9 = v3[p2.Index]
				local t2 = {
					Source = "PassReward",
					IgnoreLimit = true,
					Name = v9.FreeReward,
					Amount = v9.FreeRewardAmount or 1,
					Theme = v9.FreeRewardTheme
				}
				t2.ItemStream = v9.FreeReward == "Tickets"
				v1:GiveItem(t2)
				if not v3[p2.Index].RunOnComplete then
					return true, "RewardClaimed"
				end
				v3[p2.Index].RunOnComplete(v1)
				return true, "RewardClaimed"
			end
		else
			if p2.Type ~= "ClaimPaid" then
				return false, "InvalidType"
			end
			local v10 = v1.PlayerData.Events.Carnival2025.PassRewards[p2.Index]
			if not v1.PlayerData.Events.Carnival2025.PremiumTrack.Value then
				return false, "NoPremiumTrack"
			end
			if v10.PaidReward.Value then
				return false, "AlreadyClaimed"
			end
			local v11 = Sonar(ReplicatedStorage.Storage.Events.Carnival2025.PassRewards)
			local sum = 0
			local t = {}
			for v12, v13 in v11 do
				sum = sum + v13.PointsNeeded
				t[v12] = sum
			end
			local count = 0
			for v14, v15 in v1.PlayerData.Events.Carnival2025.PassMissions:GetChildren() do
				if v15.Completed.Value then
					count = count + 1
				end
			end
			if count < t[p2.Index] then
				return false, "NotEnoughPoints"
			end
			v10.PaidReward.Value = true
			if v11[p2.Index].PaidReward.Species then
				Sonar("ItemSetService"):_giveHorse(v1, v11[p2.Index].PaidReward)
				return true
			end
			if type(v11[p2.Index].PaidReward) == "table" then
				local v16 = v11[p2.Index].PaidReward[math.random(1, #v11[p2.Index].PaidReward)]
				local t2 = {
					Source = "PassReward",
					IgnoreLimit = true,
					Name = v16,
					Amount = v11[p2.Index].PaidRewardAmount or 1,
					Theme = v16.PaidRewardTheme
				}
				t2.ItemStream = v16.PaidReward == "Tickets"
				v1:GiveItem(t2)
				return true
			else
				local v17 = v11[p2.Index]
				local t2 = {
					Source = "PassReward",
					IgnoreLimit = true,
					Name = v17.PaidReward,
					Amount = v17.PaidRewardAmount or 1,
					Theme = v17.PaidRewardTheme
				}
				t2.ItemStream = v17.PaidReward == "Tickets"
				v1:GiveItem(t2)
				return true, "RewardClaimed"
			end
		end
	end
	v4.bindToPlayers(function(p1) --[[ Line: 3215 | Upvalues: v4 (ref), t (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if t.IsInTutorial(v1) then
			return
		end
		if v1.PlayerData.Tutorial.Missions.WelcomeToHorseLife.Completed.Value then
			t.AutopinDailyMissions(v1)
		end
	end, function(p1) --[[ Line: 3227 | Upvalues: t8 (ref), t7 (ref), t6 (ref), t5 (ref) ]]
		t8[p1] = nil
		t7[p1] = nil
		t6[p1] = nil
		t5[p1] = nil
	end)
	v3.GetRemoteFunction("ClaimSpeciesMissionRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 3234 | Upvalues: v4 (ref), t (ref), v15 (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, v3, v42, v5, v6 = t.CanClaimSpeciesMission(v1, p2, p3)
		if v2 ~= true then
			return
		end
		v3.Claimed.Value = true
		if not t.HasUnclaimedMissions(v5) then
			v5.Pinned.Value = false
		end
		local t2 = {}
		for k, v in pairs(v42) do
			if v.Species then
				local t3 = {
					GiveToPlayer = true,
					Species = p2,
					SlotInfo = v
				}
				t3.SeedOffset = math.max(1, v3.Value) + v6.Index * 1000
				local v8 = t.GetSlotInfoForMission(v1, t3, nil, true)
				v8.Parent = v1:GetItemFolder("Animals")
				t2[#t2 + 1] = v8.Name
				local v9 = v1:GetItemFolder("Animals")
				local Species = v8.Species.Value
				local count = 0
				for v10, v11 in v9:GetChildren() do
					if v11.Species.Value == Species then
						count = count + 1
					end
				end
				v15.ReportResourceEvent(v1.Player, "Source", "HorseSlot", Species, "SpeciesMission", 1, {
					{
						Key = "Total",
						Value = count
					}
				})
				continue
			end
			local t3 = {
				Source = "TimedSpeciesMission",
				IgnoreLimit = true,
				Name = v.Name,
				Amount = v.Amount,
				Theme = v.Theme
			}
			t3.ItemStream = v.Name == "Coins"
			v1:GiveItem(t3)
		end
		if not p3 and v1.PlayerData.SpeciesUpgrades:FindFirstChild(p2) then
			for v12, v13 in { "MapIcon", "SpawnChance", "TraitSpawn", "MutationLuck" } do
				if v1:IncrementSpeciesUpgrade(p2, v13) then
					break
				end
			end
		end
		return if next(t2) and t2 then t2 else true
	end
	v3.GetRemoteFunction("ClaimStreakMissionRemote").OnServerInvoke = function(p1, p2, p3, p4) --[[ Line: 3310 | Upvalues: v4 (ref), t (ref), v16 (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, v3, v42 = t.CanClaimStreakMission(v1, p2, p3, p4)
		if v2 ~= true then
			return
		end
		v3.Claimed.Value = true
		t.AutopinDailyMissions(v1)
		if v3:FindFirstChild("Pinned") then
			v3.Pinned.Value = false
		end
		for k, v in pairs(v42) do
			local t2 = {
				Source = "StreakMission",
				IgnoreLimit = true,
				ApplyModifiers = true,
				Name = v.Name,
				Amount = v.Amount,
				Theme = v.Theme
			}
			t2.ItemStream = if v.Name == "Coins" then true else false
			v1:GiveItem(t2)
		end
		if p4 then
			return true
		end
		v16.AddClubPoints(v1, 150, "DailyMission")
		return true
	end
	function t.ProcessHourlyMissionClaim(p1, p2) --[[ ProcessHourlyMissionClaim | Line: 3355 | Upvalues: t (ref) ]]
		local v1, v2, v3 = t.CanClaimHourlyMission(p1, p2)
		if v1 ~= true then
			return
		end
		v2.Claimed.Value = true
		if v2:FindFirstChild("Pinned") then
			v2.Pinned.Value = false
		end
		for v4, v5 in v3 do
			local t2 = {
				Source = "HourlyMission",
				IgnoreLimit = true,
				ApplyModifiers = true,
				Name = v5.Name,
				Amount = v5.Amount
			}
			t2.ItemStream = if v5.Name == "Coins" then true else false
			p1:GiveItem(t2)
		end
	end
	v3.GetRemoteFunction("ClaimHourlyMissionRemote").OnServerInvoke = function(p1, p2) --[[ Line: 3380 | Upvalues: v4 (ref), t (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if v1 then
			t.ProcessHourlyMissionClaim(v1, p2)
			return true
		end
	end
	v3.GetRemoteFunction("ClaimStreakRewardRemote").OnServerInvoke = function(p1, p2) --[[ Line: 3390 | Upvalues: v4 (ref), t (ref), v14 (ref), Sonar (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, v3, v42 = t.CanClaimStreakReward(v1, p2)
		if v2 ~= true then
			return
		end
		v3.Value = true
		local t2 = {}
		for i = 1, v42.RewardAmount do
			local v5 = v42.Rewards[v14.getRandomWeightedItem(v42.Rewards)]
			if v5.Species then
				t2[#t2 + 1] = Sonar("ItemSetService"):_giveHorse(v1, v5).Name
				continue
			end
			local t3 = {
				Source = "MissionStreakReward",
				IgnoreLimit = true,
				Name = v5.Name,
				Amount = v5.Amount,
				Theme = v5.Theme
			}
			t3.ItemStream = v5.Name == "Coins"
			v1:GiveItem(t3)
		end
		return if next(t2) and t2 then t2 else true
	end
	v3.GetRemoteFunction("ClaimOneTimeMissionRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 3424 | Upvalues: v4 (ref), t (ref), v11 (ref), v15 (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, v3, v42, v5, v6 = t.CanClaimOneTimeMission(v1, p2, p3)
		if v2 ~= true then
			return
		end
		v3.Claimed.Value = true
		if not t.HasUnclaimedMissions(v5) then
			v5.Pinned.Value = false
		end
		if v5 == v3 and v6.Badge then
			v11.GiveBadgeToPlayer(p1, v6.Badge)
		end
		local t2 = {}
		for k, v in pairs(v42) do
			if v.Species then
				local t3 = {
					GiveToPlayer = true,
					Species = v.Species,
					SlotInfo = v
				}
				t3.SeedOffset = math.max(1, v3.Value)
				local v8 = t.GetSlotInfoForMission(v1, t3)
				v8.Parent = v1:GetItemFolder("Animals")
				t2[#t2 + 1] = v8.Name
				local v9 = v1:GetItemFolder("Animals")
				local Species = v8.Species.Value
				local count = 0
				for v10, v112 in v9:GetChildren() do
					if v112.Species.Value == Species then
						count = count + 1
					end
				end
				v15.ReportResourceEvent(v1.Player, "Source", "HorseSlot", Species, "OneTimeMission", 1, {
					{
						Key = "Total",
						Value = count
					}
				})
				continue
			end
			local t3 = {
				Source = "OneTimeMission",
				IgnoreLimit = true,
				Name = v.Name,
				Amount = v.Amount,
				Theme = v.Theme
			}
			t3.ItemStream = v.Name == "Coins"
			v1:GiveItem(t3)
		end
		return if next(t2) and t2 then t2 else true
	end
	v3.GetRemoteFunction("ClaimTimedMissionRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 3492 | Upvalues: v4 (ref), t (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, v3, v42 = t.CanClaimTimedMission(v1, p2, p3)
		if v2 ~= true then
			return
		end
		v3.Claimed.Value = true
		for k, v in pairs(v42) do
			local t2 = {
				IgnoreLimit = true,
				Name = v.Name,
				Amount = v.Amount,
				Theme = v.Theme,
				Source = p2 .. "Mission"
			}
			t2.ItemStream = if v.Name == "Coins" then true else false
			v1:GiveItem(t2)
		end
		return true
	end
	v3.GetRemoteFunction("StartStoryMissionRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 3519 | Upvalues: v4 (ref), t (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, v3, v42 = t.CanStartStoryMission(v1, p2, p3)
		if v2 ~= true then
			return
		end
		for k, v in pairs(t.GetStartedStoryMissions(v1)) do
			v1:ResetMissions(v.DataFolder, v.Data)
		end
		v1:ResetMissions(v3, v42)
		v3.Started.Value = true
		t.PinMission(v1, v3)
		return true
	end
	v3.GetRemoteFunction("ClaimStoryMissionRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 3542 | Upvalues: v4 (ref), t (ref), v10 (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, v3, v42 = t.CanClaimStoryMission(v1, p2, p3)
		if v2 ~= true then
			return
		end
		if v3:FindFirstChild("Pinned") then
			v3.Pinned.Value = false
		end
		v3.Claimed.Value = true
		v3.Started.Value = false
		v3.Value = v10.Get() + 86400
		for v5, v6 in v42 do
			local t2 = {
				Source = "StoryMission",
				IgnoreLimit = true,
				Name = v6.Name,
				Amount = v6.Amount,
				Theme = v6.Theme
			}
			t2.ItemStream = if v6.Name == "Coins" then true else false
			v1:GiveItem(t2)
		end
		return true
	end
	v3.GetRemoteFunction("PinMissionRemote").OnServerInvoke = function(p1, p2, p3, p4) --[[ Line: 3574 | Upvalues: v4 (ref), t (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2 = if p2 == "EventMissions" then v1.EventData.Missions elseif p2 == "MiniMissions" then v1.EventData.MiniQuests else v1.PlayerData.Missions:FindFirstChild(p2)
		if not v2 then
			return
		end
		local v42 = (v2:FindFirstChild("Missions") or v2):FindFirstChild(p3)
		if v42 and v42:FindFirstChild("Stories") then
			v42 = v42.Stories:FindFirstChild(p4)
		elseif v42 and (v42:FindFirstChild("Missions") and p4) then
			v42 = v42.Missions:FindFirstChild(p4)
		elseif v42 and p4 then
			v42 = v42:FindFirstChild(p4)
		end
		if not v42 then
			return
		end
		if p2 == "EventMissions" then
			local v8 = v42.Parent and v42.Parent.Parent
			if v8 and (v8:FindFirstChild("Claimed") and v8.Claimed.Value) then
				return
			end
		elseif p2 == "MiniMissions" then
			local v9 = v42.Parent
			if v9 and (v9:FindFirstChild("Claimed") and v9.Claimed.Value) then
				return
			end
		end
		if p2 == "LimitedStockUnlocks" and p4 then
			local Pinned = v42:FindFirstChild("Pinned")
			if not Pinned then
				local Pinned_2 = Instance.new("BoolValue")
				Pinned_2.Name = "Pinned"
				Pinned_2.Parent = v42
				Pinned = Pinned_2
			end
			Pinned.Value = not Pinned.Value
		else
			if not v42:FindFirstChild("Pinned") then
				local Pinned = Instance.new("BoolValue")
				Pinned.Name = "Pinned"
				Pinned.Parent = v42
			end
			if v42.Pinned.Value then
				v42.Pinned.Value = false
			else
				t.PinMission(v1, v42)
			end
		end
		return true
	end
	v3.GetRemoteFunction("UnpinMissionCategoryRemote").OnServerInvoke = function(p1, p2) --[[ Line: 3649 | Upvalues: v4 (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2 = v1.PlayerData.Missions:FindFirstChild(p2)
		if not v2 then
			return
		end
		for k, v in pairs(v2.Missions:GetChildren()) do
			for k2, v3 in pairs(v.Missions:GetChildren()) do
				v3.Pinned.Value = false
			end
		end
		return true
	end
	v3.GetRemoteFunction("StartNpcMissionRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 3705 | Upvalues: v4 (ref), v19 (ref), v15 (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2 = v1.PlayerData.Missions.NPCMissions:FindFirstChild(p2)
		if not v2 then
			return
		end
		local v3 = v2:FindFirstChild((tostring(p3)))
		if not v3 then
			return
		end
		if v3.Started.Value then
			return
		end
		v3.Started.Value = true
		v3.Pinned.Value = true
		local v42 = v1.PlayerData.DynamicNPCs:FindFirstChild(p2)
		if v42 then
			v19.SetNextBondReset(v42)
		end
		if p2 and p3 then
			v15.ReportDesignEvent(p1, "NpcMissionStarted", {
				{
					Key = "NPCName",
					Value = p2
				},
				{
					Key = "MissionSet",
					Value = p3
				}
			}, 1)
		else
			warn("Failed to report npcName and/or missionSetIndex", p2, p3)
		end
		return true
	end
	v3.GetRemoteFunction("ClaimNpcMissionRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 3745 | Upvalues: v4 (ref), t (ref), v15 (ref) ]]
		local v1 = v4.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2, v3, v42, v5 = t.CanClaimNpcMission(v1, p2, p3)
		if v2 ~= true then
			return
		end
		if v3.Claimed.Value then
			return
		end
		v3.Claimed.Value = true
		v15.ReportDesignEvent(p1, "NpcMissionClaimed", {
			{
				Key = "NPCName",
				Value = p2
			},
			{
				Key = "MissionSet",
				Value = p3
			}
		}, 1)
		local v6 = true
		local v7 = true
		for v8, v9 in v5.Missions:GetChildren() do
			if v9.Value then
				if not v9.Claimed.Value then
					v7 = false
				end
			else
				v6 = false
				v7 = false
				break
			end
		end
		if v6 then
			v5.Completed.Value = true
		end
		if v7 and not t.HasUnclaimedMissions(v5) then
			v5.Pinned.Value = false
		end
		v5.Pinned.Value = false
		local CompletedCount = v5:FindFirstChild("CompletedCount")
		if not CompletedCount then
			local CompletedCount_2 = Instance.new("NumberValue")
			CompletedCount_2.Name = "CompletedCount"
			CompletedCount_2.Value = 0
			CompletedCount_2.Parent = v5
			CompletedCount = CompletedCount_2
		end
		local v10 = CompletedCount.Value
		local t2 = {}
		for v11, v12 in v42 do
			if v12.Species then
				local v13 = t.GetSlotInfoForMission(v1, {
					GiveToPlayer = true,
					Species = v12.Species,
					SlotInfo = v12
				}, v10)
				v13.Parent = v1:GetItemFolder("Animals")
				t2[#t2 + 1] = v13.Name
				local v14 = v1:GetItemFolder("Animals")
				local Species = v13.Species.Value
				local count = 0
				for v152, v16 in v14:GetChildren() do
					if v16.Species.Value == Species then
						count = count + 1
					end
				end
				v15.ReportResourceEvent(v1.Player, "Source", "HorseSlot", Species, "NpcMission", 1, {
					{
						Key = "Total",
						Value = count
					}
				})
				continue
			end
			local v18 = type(v12.Name) == "table" and v12.Name[math.random(1, #v12.Name)] or v12.Name
			local t3 = {
				Source = "NpcMission",
				IgnoreLimit = true,
				Name = v18,
				Amount = v12.Amount,
				Theme = type(v12.Theme) == "table" and v12.Theme[math.random(1, #v12.Theme)] or v12.Theme
			}
			t3.ItemStream = if v18 == "Coins" then true else false
			v1:GiveItem(t3)
		end
		CompletedCount.Value = CompletedCount.Value + 1
		return if next(t2) and t2 then t2 else true
	end
end
t:Init()
function StartQuest(p1, p2) --[[ Line: 3849 | Upvalues: v3 (copy) ]]
	local v1 = p1.PlayerData.Missions.NPCMissions:FindFirstChild(p2.Name)
	if not v1 then
		return
	end
	local _SelectedNpcMission = p1._SelectedNpcMission
	if not _SelectedNpcMission then
		local v2 = v1:GetChildren()
		_SelectedNpcMission = v2[math.random(1, #v2)]
	end
	if _SelectedNpcMission then
		_SelectedNpcMission.Started.Value = true
		v3.GetRemoteFunction("PinMissionRemote"):InvokeServer("NpcMissions", p2.Name, _SelectedNpcMission.Name)
		return true
	else
		warn("No mission selected")
		return false
	end
end
function t.CanClaimNpcMission(p1, p2, p3) --[[ CanClaimNpcMission | Line: 3876 | Upvalues: v29 (copy), v5 (copy) ]]
	local v1 = p1.PlayerData.Missions.NPCMissions[p2]
	if not v1 then
		return
	end
	local v2 = v1[p3]
	if not v2 then
		return
	end
	if v2.Claimed.Value then
		return "AlreadyClaimed"
	end
	if not v2.Completed.Value then
		return
	end
	local v3 = v29[p2][tonumber(p3)]
	if not v3 then
		return
	end
	local t = {}
	for v4, v52 in v3.Rewards do
		if v52.Species then
			local v6, v7 = p1:CanGiveItem("Animals")
			if not v6 then
				return "Max" .. v7
			end
		else
			local v10 = v5.GetByName(type(v52.Name) == "table" and v52.Name[math.random(1, #v52.Name)] or v52.Name)
			if v10 then
				local v11, v12 = p1:CanGiveItem(v10.ItemType)
				if not v11 then
					return "Max" .. v12
				end
				if not (v52.P and v52.P < math.random(1, 100)) then
					table.insert(t, v52)
				end
			end
			continue
		end
		table.insert(t, v52)
	end
	return true, v2, t, v2, v3
end
return t