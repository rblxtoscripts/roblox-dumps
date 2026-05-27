-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("TimeUtils")
local v5 = Sonar("ItemDataService")
local v6 = Sonar("WeightedProbability")
local v7 = Sonar("TimeSeedClass")
local v8 = Sonar("AnimalDataService")
local v9 = Sonar("BreedUtils")
local v10 = Sonar("Table")
local v11 = Sonar("DataUtils")
local v12 = v1 and Sonar("AnalyticsService")
local v13 = Sonar("StorageUtils")
local v14 = Sonar("PlaceTypeService")
local v15 = Sonar(v13.Get("DynamicNPCs"))
local v16 = Sonar(v13.Get("NpcMissions"))
local v17 = Sonar("Constants")
local v18 = Sonar(ReplicatedStorage.Storage.Events.ToyEvent.AutumnEvent)
local v19 = if v14.IsTestGame() then 1800 else 72000
local v20 = if v14.IsTestGame() then 150 else 10800
local v21 = v7.new({
	Duration = 21600
})
function t.GetAll() --[[ GetAll | Line: 40 | Upvalues: v15 (copy) ]]
	return v15.NPCs
end
function t.GetByName(p1) --[[ GetByName | Line: 44 | Upvalues: v15 (copy) ]]
	return v15.NPCs[p1]
end
function t.HasUnlockedNPCs(p1) --[[ HasUnlockedNPCs | Line: 48 ]]
	return p1:GetStatValue("Tames").Value < 1
end
function t.GetAmountForInteraction(p1, p2) --[[ GetAmountForInteraction | Line: 52 | Upvalues: v15 (copy) ]]
	local v1 = v15.Interactions[p1]
	if type(v1) == "table" then
		return v1[p2]
	else
		return v1
	end
end
function t.HasCompletedInteraction(p1, p2, p3) --[[ HasCompletedInteraction | Line: 61 | Upvalues: t (copy) ]]
	return t.GetInteractionValue(p1, p2, p3).Value
end
function t.GetInteractionValue(p1, p2, p3) --[[ GetInteractionValue | Line: 65 ]]
	return p1.PlayerData.DynamicNPCs[p2].Interactions[p3]
end
function t.SetNextBondReset(p1) --[[ SetNextBondReset | Line: 69 | Upvalues: v4 (copy), v19 (copy) ]]
	if p1.NextBond.Value == 0 then
		p1.NextBond.Value = v4.Get() + v19
	end
end
function t.GetBondPercentage(p1, p2) --[[ GetBondPercentage | Line: 74 | Upvalues: t (copy) ]]
	return p1.PlayerData.DynamicNPCs[p2].Bond.Value / t.GetByName(p2).BondPointsForFull * 100
end
function t.IsShopUnlocked(p1, p2) --[[ IsShopUnlocked | Line: 79 | Upvalues: t (copy) ]]
	local v1 = t.GetByName(p2)
	return t.GetBondPercentage(p1, p2) >= v1.BondUnlocks.Shop
end
function t.GetPurchasedHorseSlotValue(p1, p2, p3) --[[ GetPurchasedHorseSlotValue | Line: 84 ]]
	return p1.PlayerData.DynamicNPCs[p2].HorseSlots[tostring(p3)]
end
function t.GetHorseSlotSeed(p1, p2, p3) --[[ GetHorseSlotSeed | Line: 88 | Upvalues: t (copy) ]]
	return t.GetPurchasedHorseSlotValue(p1, p2, p3).Value + p1.Player.UserId + p1.PlayerData.DynamicNPCs[p2].LastShopSeed.Value + tonumber(p3)
end
function t.CreateOrGetHorseSlotInfo(p1, p2, p3, p4) --[[ CreateOrGetHorseSlotInfo | Line: 93 | Upvalues: t (copy), v6 (copy), v9 (copy), v17 (copy), v8 (copy) ]]
	local v1 = tonumber(p3)
	if p4 then
		t.ClearHorseSlotCache(p1, p2, v1)
	end
	local v2 = v1
	if p1.CachedNPCHorseShopSlots[p2][v2] then
		return p1.CachedNPCHorseShopSlots[p2][v2]
	end
	local t2 = {}
	local v3 = t.GetHorseSlotFromIndex(p2, v2)
	local v4 = t.GetHorseSlotSeed(p1, p2, v2)
	local v62 = v3.Choices[v6.getRandomWeightedItem(v3.Choices, v4)]
	local v7 = Random.new(v4)
	local v82 = v3.BreedingPair and (if v7:NextNumber(0, 1) <= v3.BreedingPair.Chance then true else false)
	local v92 = if v82 then v62.BreedingPresetPairs and v62.BreedingPresetPairs[v7:NextInteger(1, #v62.BreedingPresetPairs)] else v82
	for i = 1, if v82 then 2 else 1 do
		local v12, v13
		local v14 = Random.new(v4)
		local v15 = if v92 then v92[i][v14:NextInteger(1, #v92[i])] else v62.Preset[v14:NextInteger(1, #v62.Preset)]
		local v16 = v62.MaxEyeRarity or 100
		local Eye = v17.WildSpawnPresets.Presets[v15].Eye
		local t3 = {}
		for v172, v18 in v9.EyesByIndex do
			if (not Eye or table.find(Eye, v18.Name)) and not (v16 < v18.P) then
				table.insert(t3, v18)
			end
		end
		local v19 = nil
		if next(t3) then
			v19 = t3[v6.getRandomWeightedItem(t3, v14)].Name
		else
			warn("There was no eye with a low enough rarity for a horse shop slot. Make sure the MaxEyeRarity is obtainable. Falling back to a normal eye!")
		end
		local t4 = {
			Origin = "Bought",
			DoNotParent = true,
			DoNotIncrementCount = true,
			Age = 100,
			Species = v62.Species or "Horse",
			Preset = v15 or nil,
			Seed = v4,
			MaxCosmetics = v62.MaxCosmetics
		}
		if v82 and i == 1 then
			v12 = "Male"
			v13 = p1
		elseif v82 and i == 2 then
			v12 = "Female"
			v13 = p1
		elseif v14:NextNumber(0, 1) <= 0.6 then
			v12 = "Male"
			v13 = p1
		else
			v12 = "Female"
			v13 = p1
		end
		t4.Gender = v12
		t4.Eye = v19
		t4.SkillLevels = v62.SkillLevels
		t4.MutationSlotChances = v62.MutationSlotChances
		t4.MutationChances = v62.MutationChances
		t2[i] = v8.CreateSlot(v13, t4)
	end
	p1.CachedNPCHorseShopSlots[p2][v2] = t2
	return t2
end
function t.ClearHorseSlotCache(p1, p2, p3) --[[ ClearHorseSlotCache | Line: 173 ]]
	local v1 = tonumber(p3)
	if not p1.CachedNPCHorseShopSlots[p2][v1] then
		return
	end
	for k, v in pairs(p1.CachedNPCHorseShopSlots[p2][v1]) do
		v:Destroy()
	end
	p1.CachedNPCHorseShopSlots[p2][v1] = nil
end
function t.GetHorseSlotFromIndex(p1, p2) --[[ GetHorseSlotFromIndex | Line: 183 | Upvalues: v15 (copy) ]]
	return v15.NPCs[p1].HorseSlots[tonumber(p2)]
end
function t.CreateAndGivePurchasedHorseSlot(p1, p2, p3) --[[ CreateAndGivePurchasedHorseSlot | Line: 187 | Upvalues: t (copy), v8 (copy), v12 (copy) ]]
	local v1 = tonumber(p3)
	local t2, v3, v4 = {}, {}, v1
	for k, v in pairs((t.CreateOrGetHorseSlotInfo(p1, p2, v1))) do
		local v5 = v8.CreateSlot(p1, {
			DoNotParent = true
		}, v)
		v5.Parent = p1:GetItemFolder("Animals")
		local v6 = p1:GetItemFolder("Animals")
		local Species = v5.Species.Value
		local count = 0
		for v7, v82 in v6:GetChildren() do
			if v82.Species.Value == Species then
				count = count + 1
			end
		end
		v12.ReportResourceEvent(p1.Player, "Source", "HorseSlot", Species, "NPCShop", 1, {
			{
				Key = "Total",
				Value = count
			}
		})
		t2[k] = v5
		v3[k] = v5.Name
	end
	t.ClearHorseSlotCache(p1, p2, v4)
	return v3, t2
end
function t.CanPurchaseHorseSlot(p1, p2, p3) --[[ CanPurchaseHorseSlot | Line: 224 | Upvalues: t (copy) ]]
	local v1 = tonumber(p3)
	if not (game:GetService("RunService"):IsStudio() or p1:CanGiveItem("Animals")) then
		return "AtAnimalLimit"
	end
	local v2 = t.GetHorseSlotFromIndex(p2, v1)
	if not v2 then
		return
	end
	if not p1:HasUnlockedSpecies(t.CreateOrGetHorseSlotInfo(p1, p2, v1)[1].Species.Value) then
		return "LockedSpecies"
	end
	local Price = v2.Price
	if v2.Item then
		local v3 = p1:GetItemValue(v2.Item)
		if v3.Value < Price then
			return "CannotAfford"
		else
			return true, Price, v3
		end
	else
		local v4 = p1:CanAfford(Price, "Coins")
		if v4 then
			return true, Price, v4
		else
			return "CannotAfford"
		end
	end
end
function t.PurchaseHorseSlot(p1, ...) --[[ PurchaseHorseSlot | Line: 261 | Upvalues: v2 (copy) ]]
	return v2.GetRemoteFunction("PurchaseNPCHorseSlotRemote"):InvokeServer(...)
end
function t.CanBondWithNPC(p1) --[[ CanBondWithNPC | Line: 265 | Upvalues: t (copy) ]]
	return t.GetByName(p1).BondPointsForFull
end
function t.GetStreak(p1, p2) --[[ GetStreak | Line: 270 | Upvalues: v4 (copy), t (copy), v6 (copy) ]]
	local Gift = p2.Interactions.Gift.Value
	local Chat = p2.Interactions.Chat.Value
	local v1 = if Gift then if Chat then p2.Interactions.Quest.Value else Chat else Gift
	local v2 = v4.Get() - p2.LastInteraction.Value
	if v2 >= 97200 and p2.LastInteraction.Value ~= 0 then
		p2.Streak.Value = 0
		p2.LastInteraction.Value = 0
		return false
	end
	if v1 and (if p2.LastInteraction.Value == 0 then true else v2 >= 72000) then
		local Streak = p2.Streak
		Streak.Value = Streak.Value + 1
		p2.LastInteraction.Value = v4.Get()
		task.spawn(function() --[[ Line: 299 | Upvalues: t (ref), p2 (copy), v6 (ref), p1 (copy) ]]
			local Gifts = t.GetByName(p2.Name).Gifts
			local v1 = Gifts[v6.getRandomWeightedItem(Gifts)]
			local Theme = v1.Theme
			local v2 = v1.Name
			if type(v1.Theme) == "table" then
				Theme = v1.Theme[math.random(1, #v1.Theme)]
			end
			if type(v1.Name) == "table" then
				v2 = v1.Name[math.random(1, #v1.Name)]
			end
			p1:GiveItem({
				IgnoreLimit = true,
				Name = v2,
				Amount = v1.Amount,
				Theme = Theme,
				Source = p2.Name .. "Quest"
			})
		end)
		return true
	else
		return false
	end
end
function t.Init(p1) --[[ Init | Line: 330 | Upvalues: t (copy), v21 (copy), v12 (copy), v5 (copy), v6 (copy), v16 (copy), v10 (copy), v18 (copy), Sonar (copy), v17 (copy), v1 (copy), v2 (copy), v3 (copy), v15 (copy), v4 (copy), v20 (copy), v11 (copy) ]]
	t.RefreshTimer = v21
	local t2 = {
		Chat = function(p1, p2, p3) --[[ Chat | Line: 334 | Upvalues: t (ref), v12 (ref) ]]
			if not t.CanBondWithNPC(p2.Name) then
				return
			end
			local Chat = p2.Interactions.Chat
			if Chat.Value then
			else
				Chat.Value = true
				local v1 = t.GetAmountForInteraction("Chat")
				local v2 = math.min(p2.Streak.Value, 4) * 0.15 + 1
				local Bond = p2.Bond
				Bond.Value = Bond.Value + v1 * v2
				v12.ReportDesignEvent(p1.Player, "NPCBond", {
					{
						Key = "NPCName",
						Value = p2.Name
					},
					{
						Key = "Amount",
						Value = v1 * v2
					},
					{
						Key = "BondLevel",
						Value = p2.Bond.Value
					}
				})
				p1:IncrementMission({
					Type = p2.Name .. "Bond",
					Amount = v1
				})
				t.SetNextBondReset(p2)
				t.GetStreak(p1, p2)
				return v1
			end
		end,
		Gift = function(p1, p2, p3) --[[ Gift | Line: 363 | Upvalues: t (ref), v5 (ref), v12 (ref) ]]
			if not t.CanBondWithNPC(p2.Name) then
				return
			end
			local Gift = p2.Interactions.Gift
			if Gift.Value then
				return
			end
			local v1 = t.GetByName(p2.Name)
			local v2 = v5.GetByName(p3)
			if not v2 then
				return
			end
			local sum = t.GetAmountForInteraction("Gift", v2.Rarity.Name)
			if not sum then
				return
			end
			if table.find(v1.FavoriteGifts, p3) then
				sum = sum + 3
			end
			local v3 = p1:GetItemValue(p3)
			v3.Value = v3.Value - 1
			Gift.Value = true
			local v4 = math.min(p2.Streak.Value, 4) * 0.15 + 1
			local Bond = p2.Bond
			Bond.Value = Bond.Value + sum * v4
			v12.ReportDesignEvent(p1.Player, "NPCBond", {
				{
					Key = "NPCName",
					Value = p2.Name
				},
				{
					Key = "Amount",
					Value = sum * v4
				},
				{
					Key = "BondLevel",
					Value = p2.Bond.Value
				}
			})
			v12.ReportDesignEvent(p1.Player, "NPCGifted", {
				{
					Key = "NPCName",
					Value = p2.Name
				},
				{
					Key = "Item",
					Value = p3
				}
			}, 1)
			p1:IncrementMission({
				Type = p2.Name .. "Bond",
				Amount = sum
			})
			t.SetNextBondReset(p2)
			t.GetStreak(p1, p2)
			return sum
		end,
		GetGift = function(p1, p2) --[[ GetGift | Line: 410 | Upvalues: t (ref), v6 (ref) ]]
			if p1.NPCGifts[p2.Name] then
				return p1.NPCGifts[p2.Name]
			end
			local ClaimGift = p2.Interactions.ClaimGift
			if ClaimGift.Value then
				return
			end
			ClaimGift.Value = true
			if not (math.random(1, 100) <= t.GetBondPercentage(p1, p2.Name)) then
				return
			end
			local t2 = {}
			for k, v in pairs(t.GetByName(p2.Name).Gifts) do
				if not (v.Bond and t.GetBondPercentage(p1, p2.Name) < v.Bond) then
					t2[#t2 + 1] = v
				end
			end
			local v2 = t2[v6.getRandomWeightedItem(t2)]
			local t3 = {}
			t3.Name = type(v2.Name) == "table" and v2.Name[math.random(1, #v2.Name)] or v2.Name
			t3.Amount = v2.Amount
			p1.NPCGifts[p2.Name] = t3
			return p1.NPCGifts[p2.Name]
		end,
		ClaimGift = function(p1, p2) --[[ ClaimGift | Line: 437 ]]
			local v1 = p1.NPCGifts[p2.Name]
			if v1 then
				p1.NPCGifts[p2.Name] = nil
				p1:GiveItem({
					ItemStream = false,
					IgnoreLimit = true,
					Name = v1.Name,
					Amount = v1.Amount,
					Source = "NPCGift" .. p2.Name
				})
				return true
			end
		end,
		GetStreak = function(p1, p2) --[[ GetStreak | Line: 453 | Upvalues: t (ref) ]]
			t.GetStreak(p1, p2)
		end,
		GetQuest = function(p1, p2) --[[ GetQuest | Line: 456 | Upvalues: v16 (ref), v10 (ref) ]]
			local v1 = p1.PlayerData.Missions.NPCMissions:FindFirstChild(p2.Name)
			if not v1 then
				return
			end
			local function isMissionSetComplete(p1) --[[ isMissionSetComplete | Line: 460 ]]
				return p1.Value or p1:FindFirstChild("Completed") and p1.Completed.Value
			end
			local v2 = true
			for v3, v4 in p1.PlayerData.Missions.NPCMissions:GetChildren() do
				for v5, v6 in v4:GetChildren() do
					if v6.Started.Value and not (v6.Value or v6:FindFirstChild("Completed") and v6.Completed.Value) then
						v2 = "QuestAlreadyActive"
					end
				end
			end
			if not v2 then
				return v2
			end
			for v8, v9 in v1:GetChildren() do
				local v102 = v9.Value or v9:FindFirstChild("Completed") and v9.Completed.Value
				if v102 and v9.Claimed.Value then
					v2 = "AlreadyCompleted"
					break
				elseif v102 and not v9.Claimed.Value then
					v2 = "ReadyToClaim"
					break
				elseif v9.Started.Value then
					v2 = "AlreadyStarted"
					break
				end
			end
			if not v2 then
				return v2
			end
			local v11 = v1:GetChildren()
			local v12 = math.random(1, #v11)
			local v13 = v11[v12]
			p1._SelectedNpcMission = v13
			local v162 = v16[p2.Name][tonumber(v13.Name)]
			if v162.Choices then
				local v17 = v10.DeepCopy(v162)
				v17.ChosenMission = v17.Choices[math.random(1, #v17.Choices)]
				p1._SelectedNpcItem = v17.Choices[math.random(1, #v17.Choices)]
				v162 = v17
			end
			v162.MissionIndex = v12
			return v2, v162
		end,
		StartQuest = function(p1, p2) --[[ StartQuest | Line: 518 | Upvalues: t (ref), v12 (ref) ]]
			local v1 = p1.PlayerData.Missions.NPCMissions:FindFirstChild(p2.Name)
			if not v1 then
				return
			end
			local _SelectedNpcMission = p1._SelectedNpcMission
			if not _SelectedNpcMission then
				local v2 = v1:GetChildren()
				_SelectedNpcMission = v2[math.random(1, #v2)]
			end
			if not _SelectedNpcMission then
				warn("No mission selected")
				return false
			end
			if p1._SelectedNpcItem then
				_SelectedNpcMission.SelectedItem.Value = p1._SelectedNpcItem
			end
			_SelectedNpcMission.Started.Value = true
			_SelectedNpcMission.Pinned.Value = true
			t.SetNextBondReset(p2)
			v12.ReportDesignEvent(p1.Player, "NpcMissionStarted", {
				{
					Key = "NPCName",
					Value = p2.Name
				},
				{
					Key = "MissionSet",
					Value = _SelectedNpcMission.Name
				}
			}, 1)
			return true
		end,
		FinishQuest = function(p1, p2) --[[ FinishQuest | Line: 548 | Upvalues: v12 (ref), v16 (ref), t (ref), v6 (ref) ]]
			local v1 = p1.PlayerData.Missions.NPCMissions:FindFirstChild(p2.Name)
			if not v1 then
				return
			end
			local function isMissionSetComplete(p1) --[[ isMissionSetComplete | Line: 552 ]]
				return p1.Value or p1:FindFirstChild("Completed") and p1.Completed.Value
			end
			local v2 = nil
			for v3, v4 in v1:GetChildren() do
				if (v4.Value or v4:FindFirstChild("Completed") and v4.Completed.Value) and not v4.Claimed.Value then
					v2 = v4
				end
			end
			if v2 == nil then
				return false
			end
			if v2.Claimed.Value then
				return
			end
			v2.Claimed.Value = true
			v2.Pinned.Value = false
			v12.ReportDesignEvent(p1.Player, "NpcMissionClaimed", {
				{
					Key = "NPCName",
					Value = p2.Name
				},
				{
					Key = "MissionSet",
					Value = v2.Name
				}
			}, 1)
			local v7 = v2.Name
			local v8 = v16[p2.Name][tonumber(v7)]
			if v8.OnComplete then
				task.spawn(function() --[[ Line: 578 | Upvalues: v8 (copy), p1 (copy), v2 (ref) ]]
					v8.OnComplete(p1, v2)
				end)
			end
			p1:IncrementMission({
				Type = "CompleteNPCMission",
				Amount = 1
			})
			local v9 = p1.DynamicNPCData:FindFirstChild(p2.Name)
			local v10 = math.min(p2.Streak.Value, 4) * 0.15 + 1
			local Bond = p2.Bond
			Bond.Value = Bond.Value + v10 * 1
			v9.Interactions.Quest.Value = true
			v12.ReportDesignEvent(p1.Player, "NPCBond", {
				{
					Key = "NPCName",
					Value = p2.Name
				},
				{
					Key = "Amount",
					Value = v10 * 1
				},
				{
					Key = "BondLevel",
					Value = p2.Bond.Value
				}
			})
			t.GetStreak(p1, p2)
			local Gifts = t.GetByName(p2.Name).Gifts
			local v11 = Gifts[v6.getRandomWeightedItem(Gifts)]
			local Theme = v11.Theme
			local v122 = v11.Name
			if type(v11.Theme) == "table" then
				Theme = v11.Theme[math.random(1, #v11.Theme)]
			end
			if type(v11.Name) == "table" then
				v122 = v11.Name[math.random(1, #v11.Name)]
			end
			p1:GiveItem({
				IgnoreLimit = true,
				Name = v122,
				Amount = v11.Amount,
				Theme = Theme,
				Source = p2.Name .. "Quest"
			})
			if not (v8.RunOnComplete and (p1 and p1.Player)) then
				return true
			end
			v8.RunOnComplete(p1)
			return true
		end,
		GetAutumnEventQuest = function(p1, p2) --[[ GetAutumnEventQuest | Line: 632 | Upvalues: v18 (ref) ]]
			local v1 = p1.EventData and p1.EventData:FindFirstChild("AutumnEvent")
			if v1 and v1.Started.Value then
				if v1.Value and v1.Claimed.Value then
					return "AlreadyCompleted"
				end
				if v1.Value and not v1.Claimed.Value then
					return "ReadyToClaim"
				else
					return "AlreadyStarted"
				end
			else
				return true, v18 and v18[1]
			end
		end,
		StartAutumnEventQuest = function(p1, p2) --[[ StartAutumnEventQuest | Line: 651 | Upvalues: v18 (ref), Sonar (ref), v12 (ref) ]]
			warn("[AutumnEvent] StartAutumnEventQuest called")
			warn("[AutumnEvent] pWrapper.EventData:", p1.EventData)
			warn("[AutumnEvent] AUTUMN_EVENT_DATA:", v18)
			local v1 = p1.EventData and p1.EventData:FindFirstChild("AutumnEvent")
			warn("[AutumnEvent] Existing folder:", v1)
			if not v1 then
				warn("[AutumnEvent] Creating new folder...")
				if not (v18 and p1.EventData) then
					warn("[AutumnEvent] FAILED - No AUTUMN_EVENT_DATA or EventData")
					return
				end
				local v2 = Sonar("DataUtils")
				local AutumnEvent = v2.CreateDataValueFromType("NpcMission")
				AutumnEvent.Name = "AutumnEvent"
				local CompletedCount = Instance.new("NumberValue")
				CompletedCount.Name = "CompletedCount"
				CompletedCount.Value = 0
				CompletedCount.Parent = AutumnEvent
				v1 = AutumnEvent
				for v3, v4 in v18[1].Missions do
					local v5 = v2.CreateDataValueFromType("Mission")
					v5.Name = tostring(v3)
					v5.Type.Value = v4.Type
					v5.TargetAmount.Value = v4.Amount
					v5.Parent = AutumnEvent.Missions
				end
				AutumnEvent.Parent = p1.EventData
				warn("[AutumnEvent] Folder created and parented")
				p1.MissionsHandler:AddAutumnEventMission(AutumnEvent)
				warn("[AutumnEvent] Mission handler added")
			end
			v1.Started.Value = true
			v1.Pinned.Value = true
			warn("[AutumnEvent] Started:", v1.Started.Value, "Pinned:", v1.Pinned.Value)
			v12.ReportDesignEvent(p1.Player, "NpcMissionStarted", {
				{
					Key = "NPCName",
					Value = p2.Name
				},
				{
					Key = "MissionSet",
					Value = "AutumnEvent"
				}
			}, 1)
			return true
		end,
		ClaimAutumnEventQuest = function(p1, p2) --[[ ClaimAutumnEventQuest | Line: 700 | Upvalues: v18 (ref), Sonar (ref), v12 (ref) ]]
			local v1 = p1.EventData and p1.EventData:FindFirstChild("AutumnEvent")
			if not v1 then
				return
			end
			if not v1.Value then
				return
			end
			if v1.Claimed.Value then
				return
			end
			local CompletedCount = v1:FindFirstChild("CompletedCount")
			if not CompletedCount then
				local CompletedCount_2 = Instance.new("NumberValue")
				CompletedCount_2.Name = "CompletedCount"
				CompletedCount_2.Value = 0
				CompletedCount_2.Parent = v1
				CompletedCount = CompletedCount_2
			end
			local v2 = CompletedCount.Value
			local t = {}
			if v18 and v18[1].Rewards then
				for v3, v4 in v18[1].Rewards do
					if v4.Species then
						local v5 = Sonar("MissionsService").GetSlotInfoForMission(p1, {
							GiveToPlayer = true,
							Species = v4.Species,
							SlotInfo = v4
						}, v2)
						v5.Parent = p1:GetItemFolder("Animals")
						t[#t + 1] = v5.Name
						continue
					end
					p1:GiveItem({
						Source = "AutumnEvent",
						IgnoreLimit = true,
						Name = v4.Name,
						Amount = v4.Amount
					})
				end
			end
			v1.Claimed.Value = true
			v1.Pinned.Value = false
			CompletedCount.Value = CompletedCount.Value + 1
			v12.ReportDesignEvent(p1.Player, "NpcMissionClaimed", {
				{
					Key = "NPCName",
					Value = p2.Name
				},
				{
					Key = "MissionSet",
					Value = "AutumnEvent"
				}
			}, 1)
			return t
		end
	}
	for k, v in pairs(t.GetAll()) do
		v.HorseSlots = v17[k .. "Horses"]
		if game:GetService("RunService"):IsStudio() then
			v.HorseSlots = v.HorseSlots or v17.LyricHorses
		end
	end
	if v1 then
		for k, v in pairs(t.GetAll()) do
			if v.FavoriteGifts then
				for k2, v7 in pairs(v.FavoriteGifts) do
					if not v5.GetByName(v7) then
						warn("No item data can be found for npc favorite gifts", v7, k)
					end
				end
			end
		end
		v2.GetRemoteFunction("InteractNPCRemote").OnServerInvoke = function(p1, p2, p3, ...) --[[ Line: 768 | Upvalues: v3 (ref), t2 (copy) ]]
			local v1 = v3.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			local v2 = v1.DynamicNPCData:FindFirstChild(p2)
			if v2 then
				return t2[p3](v1, v2, ...)
			end
		end
		local t3 = {}
		game:GetService("Players").PlayerRemoving:Connect(function(p1) --[[ Line: 781 | Upvalues: t3 (copy) ]]
			t3[p1] = nil
		end)
		v2.GetRemoteEvent("NPCInteracted").OnServerEvent:Connect(function(p1, p2) --[[ Line: 785 | Upvalues: v15 (ref), t3 (copy), v12 (ref) ]]
			if not v15.NPCs[p2] then
				return
			end
			local v1 = os.clock()
			local v2 = t3[p1]
			if v2 and v1 - v2 < 1 then
				return
			end
			t3[p1] = v1
			v12.ReportDesignEvent(p1, "NPCInteracted", {
				{
					Key = "NPCName",
					Value = p2
				}
			}, 1)
		end)
		v2.GetRemoteFunction("ResetLastNPCBondRemote").OnServerInvoke = function(p1, p2) --[[ Line: 802 | Upvalues: v3 (ref), t (ref), v4 (ref), v16 (ref), v20 (ref), v11 (ref) ]]
			local v1 = v3.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			local v2 = v1.DynamicNPCData:FindFirstChild(p2)
			if not v2 then
				return
			end
			if not t.CanBondWithNPC(p2) then
				return
			end
			if v2.NextBond.Value - v4.Get() > 0 then
				return
			end
			for k, v in pairs(v2.Interactions:GetChildren()) do
				if v:IsA("BoolValue") then
					v.Value = false
				end
			end
			v2.LastInteraction.Value = 0
			for v32, v42 in v1.PlayerData.Missions.NPCMissions:GetChildren() do
				local v5 = v16[v42.Name]
				for v6, v7 in v42:GetChildren() do
					local v9 = tonumber(v7.Name)
					local v10 = if v5 then v5[v9] else v5
					local v12, v13, v14, v15, v162, v17, v18, v19, v202, v21, v22, v23
					if if v10 then v10.IsToyEvent else v10 then
						local v24 = v7.StartTime and v7.StartTime.Value or 0
						if not (v24 <= 0 or v4.Get() < v24 + v20) then
							v7.Value = false
							v7.Claimed.Value = false
							v7.Pinned.Value = false
							v7.SelectedItem.Value = ""
							v7.Finished.Value = false
							v7.Completed.Value = false
							v7.Started.Value = false
							if v7:FindFirstChild("StartTime") then
								v7.StartTime.Value = 0
							end
							for v25, v26 in v7.Missions:GetChildren() do
								v26:Destroy()
							end
							v12 = nil
							if v10 and v10.MaxMissions then
								v13 = {}
								for v27 in v10.Missions do
									v14 = tonumber(v27)
									table.insert(v13, v14)
								end
								if v10.MaxMissions < #v13 then
									v15 = t.RefreshTimer.CurrentSeed
									v162 = Random.new
									v17 = v42.Name
									v18 = v162(v15 + string.len(v17) + v9)
									v19 = table.clone(v13)
									v12 = {}
									for i = 1, v10.MaxMissions do
										v202 = v18:NextInteger(1, #v19)
										v21 = v19[v202]
										table.insert(v12, v21)
										table.remove(v19, v202)
									end
								end
							end
							if v10 then
								for v28, v29 in v10.Missions do
									v22 = tonumber(v28)
									if not v12 or table.find(v12, v22) then
										v23 = v11.CreateDataValueFromType("Mission")
										v23.Name = tostring(v28)
										v23.Type.Value = v29.Type
										v23.Amount.Value = 0
										v23.TargetAmount.Value = v29.Amount
										v23.Parent = v7.Missions
									end
								end
							end
						end
					else
						v7.Value = false
						v7.Claimed.Value = false
						v7.Pinned.Value = false
						v7.SelectedItem.Value = ""
						v7.Finished.Value = false
						v7.Completed.Value = false
						v7.Started.Value = false
						if v7:FindFirstChild("StartTime") then
							v7.StartTime.Value = 0
						end
						for v25, v26 in v7.Missions:GetChildren() do
							v26:Destroy()
						end
						v12 = nil
						if v10 and v10.MaxMissions then
							v13 = {}
							for v27 in v10.Missions do
								v14 = tonumber(v27)
								table.insert(v13, v14)
							end
							if v10.MaxMissions < #v13 then
								v15 = t.RefreshTimer.CurrentSeed
								v162 = Random.new
								v17 = v42.Name
								v18 = v162(v15 + string.len(v17) + v9)
								v19 = table.clone(v13)
								v12 = {}
								for i = 1, v10.MaxMissions do
									v202 = v18:NextInteger(1, #v19)
									v21 = v19[v202]
									table.insert(v12, v21)
									table.remove(v19, v202)
								end
							end
						end
						if v10 then
							for v28, v29 in v10.Missions do
								v22 = tonumber(v28)
								if not v12 or table.find(v12, v22) then
									v23 = v11.CreateDataValueFromType("Mission")
									v23.Name = tostring(v28)
									v23.Type.Value = v29.Type
									v23.Amount.Value = 0
									v23.TargetAmount.Value = v29.Amount
									v23.Parent = v7.Missions
								end
							end
						end
					end
				end
			end
			v2.NextBond.Value = 0
		end
		v2.GetRemoteFunction("PurchaseNPCHorseSlotRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 897 | Upvalues: v3 (ref), t (ref), v12 (ref) ]]
			local v1 = v3.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			local v2, v32, v4 = t.CanPurchaseHorseSlot(v1, p2, p3)
			if v2 == true and v32 then
				local v5, v6 = t.CreateAndGivePurchasedHorseSlot(v1, p2, p3)
				v4.Value = v4.Value - v32
				v12.ReportResourceEvent(p1, "Sink", "Currency", "Coins", "NPCHorseSlot", v32)
				v1:IncrementMission({
					Type = "BuyItem",
					Amount = 1,
					Data = { "NPCShop", v6[1].Species.Value, p2 }
				})
				local v7 = t.GetPurchasedHorseSlotValue(v1, p2, p3)
				v7.Value = v7.Value + 1
				return v5[1]
			end
		end
		v2.GetRemoteFunction("FindNpcItem").OnServerInvoke = function(p1) --[[ Line: 920 | Upvalues: v3 (ref) ]]
			local v1 = v3.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			if v1._LastNpcLostItem and tick() - v1._LastNpcLostItem < 2 then
				return
			end
			v1._LastNpcLostItem = tick()
			v1:IncrementMission({
				Type = "NpcLostItem",
				Amount = 1
			})
		end
	end
	v3.bindToPlayers(function(p1) --[[ Line: 937 | Upvalues: v3 (ref), v1 (ref), t (ref), v16 (ref), v21 (ref), v4 (ref), v2 (ref), t2 (copy) ]]
		local v12 = v3.getWrapperFromPlayer(p1)
		if not v12 then
			return
		end
		v12.NPCGifts = {}
		v12.CachedNPCHorseShopSlots = {}
		if v1 or p1 == game.Players.LocalPlayer then
			v12.DynamicNPCData = v12.PlayerData.DynamicNPCs
			if not v1 and p1 == game.Players.LocalPlayer then
				for k, v in pairs(t.GetAll()) do
					local v22 = v12.PlayerData.Missions.NPCMissions:FindFirstChild(k)
					if v22 then
						for k2, v5 in pairs(v22:GetChildren()) do
							if v5.Started.Value and not v5.Claimed.Value then
								local v52 = v16[k][tonumber(v5.Name)]
								if v52.Choices then
									local v6 = v5.Missions:FindFirstChild("1")
									v52.RunFunction(k, v5.SelectedItem.Value, v6.TargetAmount.Value - v6.Amount.Value)
								end
							end
						end
					end
				end
			end
		end
		for k, v in pairs(t.GetAll()) do
			v12.CachedNPCHorseShopSlots[k] = {}
			if v1 then
				local v7 = v12.DynamicNPCData:WaitForChild(k)
				local function resetPurchased() --[[ resetPurchased | Line: 971 | Upvalues: v7 (copy), v21 (ref), v12 (copy), k (copy), t (ref) ]]
					if v7.LastShopSeed.Value == v21.CurrentSeed then
						return
					end
					v7.LastShopSeed.Value = v21.CurrentSeed
					for k2, v in pairs(v7.HorseSlots:GetChildren()) do
						v.Value = 0
					end
					for k2, v in pairs(v12.CachedNPCHorseShopSlots[k]) do
						t.ClearHorseSlotCache(v12, k, k2)
					end
				end
				v12.Maid:GiveTask(v21.SeedChanged:Connect(resetPurchased))
				resetPurchased()
			end
		end
		if p1 == game.Players.LocalPlayer then
			for k, v in pairs(t.GetAll()) do
				if t.CanBondWithNPC(k) then
					local v8 = v12.DynamicNPCData:WaitForChild(k)
					v12.Maid:GiveTask(v4.OnTimeChanged:Connect(function() --[[ Line: 991 | Upvalues: v8 (copy), v4 (ref), v2 (ref), k (copy) ]]
						local v1 = if v8.NextBond.Value == 0 then false else v8.NextBond.Value - v4.Get()
						if not (v1 and v1 <= 0) then
							return
						end
						v2.GetRemoteFunction("ResetLastNPCBondRemote"):InvokeServer(k)
					end))
				end
			end
		end
		if not v1 then
			return
		end
		local function f9() --[[ Line: 1010 | Upvalues: v12 (copy), t2 (ref) ]]
			for k, v in pairs(v12.NPCGifts) do
				t2.ClaimGift(v12, v12.DynamicNPCData:WaitForChild(k))
			end
		end
		table.insert(v12.OnRemoved, f9)
	end)
end
t:Init()
return t