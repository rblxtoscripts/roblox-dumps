-- https://lua.expert/
local t = {}
debug.setmemorycategory("BOSS SERVICE")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = RunService:IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("Constants")
local v3 = Sonar("PlaceTypeService")
local v4 = Sonar("EventUtils")
local v5 = Sonar("Maid")
local v6 = v1 and Sonar("ChatService")
local v7 = Sonar("PlayerWrapper")
local v8 = Sonar("RemoteUtils")
local v9 = Sonar("FormatNumber")
local v10 = Sonar("TimeSeedClass")
local v11 = Sonar("NotificationsService")
local v12 = Sonar("MarketplaceUtils")
local v13 = v1 and Sonar("AnimalManager")
local v14 = v1 and Sonar("AnalyticsService")
local v15 = v1 and Sonar("GlobalValue")
local v16 = Sonar("StableClubsManager", {
	Deferred = true
})
local v17 = Sonar("StorageUtils")
local v18 = v1 and Sonar("MobSpawner")
local BossFightWarningDuration = v2.BossFightWarningDuration
local BossFightDuration = v2.BossFightDuration
local v19 = Sonar(v17.Get("GlobalBossData"))
local v20 = v3.IsTestGame() or RunService:IsStudio()
local t2 = { "DoNotLog" }
local v21 = v5.new()
local v22 = v5.new()
local v23 = nil
local v24 = nil
local v25 = nil
local v26 = nil
local v27 = nil
local v28 = nil
local v29 = nil
local v30 = nil
local t3 = {}
local v31 = v10.new({
	Duration = v2.BossFightSpawnTime
})
local v32 = v8.GetRemoteEvent("SetBossRewardsRemote")
local v33 = v8.GetRemoteEvent("PurchasedBossChestRemote")
local function addItemAnalytics(p1, p2, p3, p4, p5, p6) --[[ addItemAnalytics | Line: 69 | Upvalues: t2 (copy), v14 (copy) ]]
	if not table.find(t2, p5) then
		v14.ReportResourceEvent(p1, p2, p3, p4, p5, p6)
	end
end
local function markBossFightCompleted(p1, p2, p3) --[[ markBossFightCompleted | Line: 78 | Upvalues: t3 (ref), v14 (copy) ]]
	local InitialPlayerCount = p3.InitialPlayerCount
	local InitialPlayersInFight = p3.InitialPlayersInFight
	local Tier = p3.Tier
	local function f1() --[[ Line: 90 | Upvalues: t3 (ref), p2 (copy), InitialPlayersInFight (copy), Tier (copy), InitialPlayerCount (copy), v14 (ref) ]]
		local count_2 = 0
		for v1 in t3 do
			count_2 = count_2 + 1
		end
		local v2_2 = if typeof(p2.Model) == "Instance" and p2.Model:IsA("PVInstance") then p2.Model:GetPivot().Position else nil
		v14.GamebeastMarker("BossFightCompleted", {
			{
				Key = "BossTier",
				Value = Tier
			},
			{
				Key = "InitialPlayerCount",
				Value = InitialPlayerCount
			},
			{
				Key = "InitialPlayersInFight",
				Value = InitialPlayersInFight
			},
			{
				Key = "PlayersInFight",
				Value = count_2
			},
			{
				Key = "DropoutRate",
				Value = math.round((InitialPlayersInFight - count_2) / InitialPlayersInFight * 100)
			}
		}, 1, v2_2)
	end
	table.insert(p1._tasks, 1, f1)
end
local function markBossFightStarted(p1, p2, p3) --[[ markBossFightStarted | Line: 127 | Upvalues: v14 (copy) ]]
	local InitialPlayerCount = p3.InitialPlayerCount
	local InitialPlayersInFight = p3.InitialPlayersInFight
	local v1 = if typeof(p2.Model) == "Instance" and p2.Model:IsA("PVInstance") then p2.Model:GetPivot().Position else nil
	v14.GamebeastMarker("BossFightStarted", {
		{
			Key = "BossTier",
			Value = p3.Tier
		},
		{
			Key = "InitialPlayerCount",
			Value = InitialPlayerCount
		},
		{
			Key = "InitialPlayersInFight",
			Value = InitialPlayersInFight
		},
		{
			Key = "SignupRate",
			Value = math.round(InitialPlayersInFight / InitialPlayerCount * 100)
		}
	}, 1, v1)
end
function t.PickSpawner(p1) --[[ PickSpawner | Line: 158 | Upvalues: v21 (copy), v23 (ref), v18 (copy), BossFightWarningDuration (copy), v24 (ref), v6 (copy), Players (copy), v11 (copy), v2 (copy) ]]
	v21:DoCleaning()
	local BossSpawn = workspace.MobSpawns:FindFirstChild("BossSpawn")
	if not BossSpawn then
		return
	end
	v23 = v18.GetSpawner(BossSpawn)
	v23.Object:SetAttribute("BossTimestamp", workspace:GetServerTimeNow() + BossFightWarningDuration)
	local v1 = v23.Object:GetAttribute("BossType") or ""
	local BossSpawnAttachment = Instance.new("Attachment")
	BossSpawnAttachment.Name = "BossSpawnAttachment"
	BossSpawnAttachment:AddTag("BossSpawn")
	BossSpawnAttachment:SetAttribute("BossTimestamp", v23.Object:GetAttribute("BossTimestamp"))
	BossSpawnAttachment:SetAttribute("BossTier", 1)
	BossSpawnAttachment:SetAttribute("BossDonations", 0)
	BossSpawnAttachment:SetAttribute("BossType", v1)
	BossSpawnAttachment.WorldPosition = v23.Object.Position
	BossSpawnAttachment.Parent = workspace.Terrain
	v24 = BossSpawnAttachment
	v6:BroadcastMessage({
		Type = "Boss",
		Message = "The Totem has spawned on the map, find it to join the tame!"
	})
	for v22, v3 in Players:GetPlayers() do
		v11.NotifyPlayer(v3, "BossFight")
	end
	v21:GiveTask(v24:GetAttributeChangedSignal("BossDonations"):Connect(function() --[[ Line: 189 | Upvalues: v2 (ref), v1 (copy), v24 (ref) ]]
		local v12 = 1
		for v3, v4 in v2[v1 .. "BossTierAmounts"] or v2.BossTierAmounts do
			if v4 <= v24:GetAttribute("BossDonations") then
				v12 = v3
			end
		end
		v24:SetAttribute("BossTier", v12)
	end))
	v21:GiveTask(BossSpawnAttachment)
	v21:GiveTask(function() --[[ Line: 201 | Upvalues: v23 (ref), BossSpawnAttachment (copy) ]]
		v23.Object:SetAttribute("BossTimestamp", nil)
		BossSpawnAttachment:Destroy()
	end)
end
function t.SpawnBoss(p1) --[[ SpawnBoss | Line: 207 | Upvalues: v24 (ref), v23 (ref), t3 (ref), v27 (ref), ReplicatedStorage (copy), Sonar (copy), v6 (copy), v11 (copy), v13 (copy), Players (copy), markBossFightStarted (copy), v21 (copy), BossFightDuration (copy), v14 (copy) ]]
	local v1 = v24:GetAttribute("BossTier")
	local v2 = v24:GetAttribute("BossType")
	local v3 = v23:SpawnBoss(v1, t3, nil, v2)
	v27 = v3
	local v4 = ReplicatedStorage.Storage.BossPresets:FindFirstChild((v2 or "") .. "Tier" .. v1)
	if not v4 then
		v4 = ReplicatedStorage.Storage.BossPresets:FindFirstChild("Tier" .. v1)
	end
	local v62 = v4 and Sonar(v4)
	local t = {}
	local function checkHealthMessages(p1) --[[ checkHealthMessages | Line: 222 | Upvalues: v62 (copy), t (copy), t3 (ref), v6 (ref), v11 (ref), v2 (copy), v1 (copy) ]]
		if not (v62 and v62.HealthMessages) then
			return
		end
		for v12, v22 in v62.HealthMessages do
			if not t[v12] and p1 <= v12 then
				t[v12] = true
				for v3, v4 in t3 do
					v6:BroadcastMessageToClient(v3, {
						Type = "Boss",
						Message = v22
					})
					v11.NotifyPlayer(v3, "BossAnger", v22, v2, v1)
				end
			end
		end
	end
	local function selectHorseForBossfight(p1) --[[ selectHorseForBossfight | Line: 240 | Upvalues: v13 (ref) ]]
		local SeatPart = p1.Character.Humanoid.SeatPart
		local v1 = if SeatPart then SeatPart:FindFirstAncestorWhichIsA("Model") else SeatPart
		local v2 = nil
		for v3, v4 in p1.EquippedAnimals do
			if v1 == v4.Model then
				v2 = v4
				continue
			end
			v13:UnequipAnimal(p1.Player, v4.SlotValue.Name)
		end
		return v2
	end
	local v7 = #Players:GetPlayers()
	local count = 0
	for v8 in t3 do
		count = count + 1
	end
	local t2 = {
		InitialPlayerCount = v7,
		InitialPlayersInFight = count,
		Tier = v1
	}
	markBossFightStarted(v21, v3, t2)
	task.spawn(function() --[[ Line: 271 | Upvalues: t3 (ref), selectHorseForBossfight (copy) ]]
		for v1, v2 in t3 do
			selectHorseForBossfight(v2)
		end
	end)
	v21:GiveTask(v3)
	local function updateHealth() --[[ updateHealth | Line: 279 | Upvalues: v3 (copy), v24 (ref), checkHealthMessages (copy) ]]
		local v1 = v3:get("TamingHealth")
		v24:SetAttribute("TamingHealth", v1)
		checkHealthMessages((v1.Y - v1.X) / v1.Y * 100)
	end
	v21:GiveTask(v3.adornee:GetAttributeChangedSignal("TamingHealth"):Connect(updateHealth))
	local v9 = v3:get("TamingHealth")
	v24:SetAttribute("TamingHealth", v9)
	checkHealthMessages((v9.Y - v9.X) / v9.Y * 100)
	v24:SetAttribute("BossEndTimestamp", workspace:GetServerTimeNow() + BossFightDuration)
	v24:SetAttribute("BossSpawned", true)
	v21:GiveTask(task.spawn(function() --[[ Line: 292 | Upvalues: BossFightDuration (ref), v3 (copy), v21 (ref) ]]
		task.wait(BossFightDuration)
		if v3 and not v3._destroyed then
			v21:DoCleaning()
		end
	end))
	local v10 = v21
	local InitialPlayerCount = t2.InitialPlayerCount
	local InitialPlayersInFight = t2.InitialPlayersInFight
	local Tier = t2.Tier
	local function f11() --[[ Line: 90 | Upvalues: t3 (ref), v3 (copy), InitialPlayersInFight (copy), Tier (copy), InitialPlayerCount (copy), v14 (ref) ]]
		local count_2 = 0
		for v1 in t3 do
			count_2 = count_2 + 1
		end
		local v2_2 = if typeof(v3.Model) == "Instance" and v3.Model:IsA("PVInstance") then v3.Model:GetPivot().Position else nil
		v14.GamebeastMarker("BossFightCompleted", {
			{
				Key = "BossTier",
				Value = Tier
			},
			{
				Key = "InitialPlayerCount",
				Value = InitialPlayerCount
			},
			{
				Key = "InitialPlayersInFight",
				Value = InitialPlayersInFight
			},
			{
				Key = "PlayersInFight",
				Value = count_2
			},
			{
				Key = "DropoutRate",
				Value = math.round((InitialPlayersInFight - count_2) / InitialPlayersInFight * 100)
			}
		}, 1, v2_2)
	end
	table.insert(v10._tasks, 1, f11)
	return v3
end
function t.PickGlobalSpawner(p1, p2, p3) --[[ PickGlobalSpawner | Line: 307 | Upvalues: v22 (copy), v28 (ref), v29 (ref), v19 (copy), v30 (ref), v25 (ref), v18 (copy), BossFightWarningDuration (copy), v26 (ref), v6 (copy), Players (copy), v11 (copy), v2 (copy) ]]
	v22:DoCleaning()
	v28 = nil
	if v29 then
		v29:Destroy()
		v29 = nil
	end
	v30 = p3
	v25 = v18.GetSpawner(workspace.MobSpawns.EventBossSpawn)
	v25.Object:SetAttribute("BossTimestamp", workspace:GetServerTimeNow() + BossFightWarningDuration)
	local GlobalBossSpawnAttachment = Instance.new("Attachment")
	GlobalBossSpawnAttachment.Name = "GlobalBossSpawnAttachment"
	GlobalBossSpawnAttachment:AddTag("BossSpawn")
	GlobalBossSpawnAttachment:SetAttribute("BossTimestamp", v25.Object:GetAttribute("BossTimestamp"))
	GlobalBossSpawnAttachment:SetAttribute("BossTier", v19[p2].Tier)
	GlobalBossSpawnAttachment:SetAttribute("BossDonations", 0)
	GlobalBossSpawnAttachment:SetAttribute("IsGlobalBoss", true)
	GlobalBossSpawnAttachment:SetAttribute("BossName", p2 or "GLOBAL BOSS")
	GlobalBossSpawnAttachment.WorldPosition = v25.Object.Position
	GlobalBossSpawnAttachment.Parent = workspace.Terrain
	v26 = GlobalBossSpawnAttachment
	v6:BroadcastMessage({
		Type = "Boss",
		Message = "A GLOBAL BOSS HAS APPEARED! DEFEND IT AND GAIN REWARDS!"
	})
	for v23, v3 in Players:GetPlayers() do
		v11.NotifyPlayer(v3, "BossFight")
	end
	v22:GiveTask(v26:GetAttributeChangedSignal("BossDonations"):Connect(function() --[[ Line: 344 | Upvalues: v2 (ref), v26 (ref) ]]
		local v1 = 1
		for k, v in pairs(v2.BossTierAmounts) do
			if v <= v26:GetAttribute("BossDonations") then
				v1 = k
			end
		end
		v26:SetAttribute("BossTier", v1)
	end))
	v22:GiveTask(GlobalBossSpawnAttachment)
	v22:GiveTask(function() --[[ Line: 355 | Upvalues: v25 (ref), GlobalBossSpawnAttachment (copy) ]]
		v25.Object:SetAttribute("BossTimestamp", nil)
		GlobalBossSpawnAttachment:Destroy()
	end)
end
function t.SpawnGlobalBoss(p1, p2, p3, p4) --[[ SpawnGlobalBoss | Line: 361 | Upvalues: v19 (copy), v25 (ref), t3 (ref), v28 (ref), v20 (copy), v26 (ref), v30 (ref), v29 (ref), v15 (copy), v13 (copy), Players (copy), markBossFightStarted (copy), v22 (copy), v6 (copy), v11 (copy), v7 (copy), t (copy), BossFightDuration (copy), v14 (copy) ]]
	local v1 = v19[p2]
	local Tier = v1.Tier
	local v2 = v25:SpawnBoss(Tier, t3, v1.CustomPresetName)
	v2.Model:SetAttribute("IsGlobalBoss", true)
	if v1.CustomReward then
		v2.CustomReward = v1.CustomReward
	end
	v2.UserWhitelist = {}
	v28 = v2
	local v3 = if v20 then 100 elseif p4 then p4 else v1.StartHealth
	local v4 = if v20 then 100 else p4 or v1.StartHealth
	v2:set("TamingHealth", (Vector3.new(0, v4, 0)))
	v26:SetAttribute("TamingHealth", (Vector3.new(0, v4, 0)))
	v29 = v15.new("GlobalBoss_" .. p2 .. "_" .. (if p3 then p3 else v30), v3)
	local function selectHorseForBossfight(p1) --[[ selectHorseForBossfight | Line: 387 | Upvalues: v13 (ref) ]]
		local SeatPart = p1.Character.Humanoid.SeatPart
		local v1 = if SeatPart then SeatPart:FindFirstAncestorWhichIsA("Model") else SeatPart
		local v2 = nil
		for v3, v4 in p1.EquippedAnimals do
			if v1 == v4.Model then
				v2 = v4
				continue
			end
			v13:UnequipAnimal(p1.Player, v4.SlotValue.Name)
		end
		return v2
	end
	local v8 = #Players:GetPlayers()
	local count = 0
	for v9 in t3 do
		count = count + 1
	end
	local t2 = {
		InitialPlayerCount = v8,
		InitialPlayersInFight = count,
		Tier = Tier
	}
	markBossFightStarted(v22, v2, t2)
	task.spawn(function() --[[ Line: 416 | Upvalues: t3 (ref), selectHorseForBossfight (copy) ]]
		for v1, v2 in t3 do
			selectHorseForBossfight(v2)
		end
	end)
	v22:GiveTask(v2)
	local v10 = v3
	local v112 = false
	local t4 = {}
	local function checkHealthMessages(p1) --[[ checkHealthMessages | Line: 428 | Upvalues: v1 (copy), t4 (copy), t3 (ref), v6 (ref), v11 (ref), v7 (ref) ]]
		if not v1.HealthMessages then
			return
		end
		for v12, v2 in v1.HealthMessages do
			if not t4[v12] and p1 <= v12 then
				t4[v12] = true
				for v3, v4 in t3 do
					v6:BroadcastMessageToClient(v3, {
						Type = "Boss",
						Message = v2
					})
					v11.NotifyPlayer(v3, "BossAnger", v2)
					local v5 = v7.getWrapperFromPlayer(v3)
					if v5 then
						v5:GiveItem({
							Name = "RedVelvetLasso",
							Amount = 1,
							IgnoreLimit = true,
							Source = "GlobalBossAnger"
						})
					end
				end
			end
		end
	end
	local function onLocalHealthChanged() --[[ onLocalHealthChanged | Line: 456 | Upvalues: v112 (ref), v2 (copy), v10 (ref), v29 (ref) ]]
		if v112 then
			return
		end
		local v1 = v2:get("TamingHealth")
		if not v1 then
			return
		end
		local v22 = v1.Y - v1.X
		local v3 = v10 - v22
		if not (v3 > 0) then
			return
		end
		v29:Decrement(v3)
		v10 = v22
	end
	v22:GiveTask(v2.adornee:GetAttributeChangedSignal("TamingHealth"):Connect(onLocalHealthChanged))
	v22:GiveTask(v29:OnChanged(function(p1) --[[ Line: 474 | Upvalues: v112 (ref), v4 (copy), v2 (copy), v10 (ref), v26 (ref), checkHealthMessages (copy), t (ref) ]]
		v112 = true
		local v3 = Vector3.new(v4 - p1, v4, 0)
		v2:set("TamingHealth", v3)
		v10 = p1
		v26:SetAttribute("TamingHealth", v3)
		checkHealthMessages(p1 / v4 * 100)
		task.wait()
		v112 = false
		if not (p1 <= 0) then
			return
		end
		task.spawn(function() --[[ Line: 493 | Upvalues: v2 (ref), t (ref) ]]
			if v2 and (not v2._destroyed and v2._successfulBoss) then
				v2:_successfulBoss()
			end
			task.wait(2)
			t:EndBoss(v2)
		end)
	end))
	v26:SetAttribute("BossEndTimestamp", workspace:GetServerTimeNow() + BossFightDuration)
	v26:SetAttribute("BossSpawned", true)
	v22:GiveTask(task.spawn(function() --[[ Line: 507 | Upvalues: BossFightDuration (ref), v2 (copy), t (ref) ]]
		task.wait(BossFightDuration)
		if v2 and not v2._destroyed then
			t:EndBoss(v2)
		end
	end))
	local InitialPlayerCount = t2.InitialPlayerCount
	local InitialPlayersInFight = t2.InitialPlayersInFight
	local Tier_2 = t2.Tier
	local function f13() --[[ Line: 90 | Upvalues: t3 (ref), v2 (copy), InitialPlayersInFight (copy), Tier_2 (copy), InitialPlayerCount (copy), v14 (ref) ]]
		local count_2 = 0
		for v1 in t3 do
			count_2 = count_2 + 1
		end
		local v2_2 = if typeof(v2.Model) == "Instance" and v2.Model:IsA("PVInstance") then v2.Model:GetPivot().Position else nil
		v14.GamebeastMarker("BossFightCompleted", {
			{
				Key = "BossTier",
				Value = Tier_2
			},
			{
				Key = "InitialPlayerCount",
				Value = InitialPlayerCount
			},
			{
				Key = "InitialPlayersInFight",
				Value = InitialPlayersInFight
			},
			{
				Key = "PlayersInFight",
				Value = count_2
			},
			{
				Key = "DropoutRate",
				Value = math.round((InitialPlayersInFight - count_2) / InitialPlayersInFight * 100)
			}
		}, 1, v2_2)
	end
	table.insert(v22._tasks, 1, f13)
	return v2
end
function t.EndBoss(p1, p2) --[[ EndBoss | Line: 520 | Upvalues: v28 (ref), v22 (copy), v26 (ref), v29 (ref), v1 (copy), Sonar (copy), v21 (copy), v27 (ref), v6 (copy), t3 (ref) ]]
	local v12 = p2 == v28
	if v12 then
		v22:DoCleaning()
		if v26 then
			v26:Destroy()
			v26 = nil
		end
		if v29 then
			v29:Destroy()
			v29 = nil
		end
		v28 = nil
		if v1 then
			Sonar("GlobalBossFightService"):SetFightActive(false)
		end
	else
		v21:DoCleaning()
		v27 = nil
	end
	if v12 then
		v6:BroadcastMessage({
			Type = "Boss",
			Message = "The Global Boss has been defeated!"
		})
	else
		v6:BroadcastMessage({
			Type = "Boss",
			Message = "The Totem has vanished and will spawn again in 60 minutes!"
		})
	end
	for k, v in pairs(t3) do
		task.spawn(function() --[[ Line: 560 | Upvalues: v12 (copy), v (copy) ]]
			if v12 then
				v:SetActionState("GlobalBossFight", false)
			else
				v:SetActionState("BossFight", false)
			end
		end)
	end
	t3 = {}
	if not p2 then
		return
	end
	p2.UserWhitelist = nil
end
function t.GetCoinAmountToDonate(p1, p2, p3) --[[ GetCoinAmountToDonate | Line: 575 | Upvalues: v9 (copy), v2 (copy) ]]
	local v1 = v9.SanitiseInput(p2)
	local v22 = if p3 then v1 else v9.roundToNearestMultiple(v1, v2.BossLuckPower.Coins.Rate)
	return p1:GetAmountToUse(p1:GetCurrencyValue("Coins"), v22)
end
function t.CreateAndSendRewards(p1, p2, p3) --[[ CreateAndSendRewards | Line: 584 | Upvalues: v2 (copy), v32 (copy) ]]
	local t = {}
	for k, v in pairs(v2.BossFightStatConversion) do
		table.insert(t, p2._bossFightStats[v])
	end
	local v22 = p3.CustomReward or "BossChestTier" .. p3.Tier
	local v4 = math.floor(p3.DamagePercentage / v2.BossBonusChestPercentage)
	local t2 = {}
	local t3 = {
		Amount = 1,
		Name = v22
	}
	t3.LuckPower = math.clamp(math.floor(p3.WeightedPercentage), 0, 100)
	t2[1] = t3
	if v4 > 0 then
		table.insert(t2, {
			Name = "BossBonusChest",
			Amount = v4
		})
	end
	local t4 = {
		{
			Amount = 1,
			LuckPower = 100,
			Name = v22
		}
	}
	p2._bossRewardsToClaim = {
		Free = t2,
		Premium = t4
	}
	p2._claimedBossRewards = false
	p2:GiveItem({
		Source = "BossFight",
		ApplyModifiers = true,
		IgnoreLimit = true,
		Name = v2.EventCurrencyName,
		Amount = ({ 100, 200, 300 })[p3.Tier] or 100
	})
	v32:FireClient(p2.Player, {
		Tier = p3.Tier,
		Stats = t,
		Rewards = t2,
		PremiumRewards = t4
	})
end
function t.AddPlayerToGlobalBoss(p1, p2) --[[ AddPlayerToGlobalBoss | Line: 644 | Upvalues: v1 (copy), v7 (copy), v28 (ref), v26 (ref), t3 (ref), v16 (copy), v13 (copy) ]]
	if not v1 then
		return
	end
	local v12 = v7.getWrapperFromPlayer(p2)
	if not v12 then
		return
	end
	if not (v28 and v26) then
		return
	end
	if t3[p2] then
		return
	end
	t3[p2] = v12
	v16.AddClubPoints(v12, 50, "BossParticipation")
	v12:SetActionState("GlobalBossFight", true)
	task.spawn(function() --[[ Line: 659 | Upvalues: v12 (copy), v13 (ref) ]]
		local SeatPart = v12.Character.Humanoid.SeatPart
		local v1 = if SeatPart then SeatPart:FindFirstAncestorWhichIsA("Model") else SeatPart
		for v2, v3 in v12.EquippedAnimals do
			if v1 ~= v3.Model then
				v13:UnequipAnimal(v12.Player, v3.SlotValue.Name)
			end
		end
	end)
	if not v12._bossFightStats then
		v12._bossFightStats = {
			DamageDealt = 0,
			BuckedOff = 0,
			TimeTaken = 0,
			LassosLost = 0
		}
	end
	if not (v28 and v28.UserWhitelist) then
		return
	end
	v28.UserWhitelist[p2] = v12
end
function t.init() --[[ init | Line: 686 | Upvalues: v3 (copy), v1 (copy), v8 (copy), v7 (copy), t3 (ref), v16 (copy), v12 (copy), v33 (copy), t2 (copy), v14 (copy), v2 (copy), v24 (ref), t (copy), v20 (copy), v31 (copy), v23 (ref), BossFightWarningDuration (copy), v4 (copy), RunService (copy) ]]
	if v3.IsMarketWorld() then
		return
	end
	if not v1 then
		return
	end
	v8.GetRemoteEvent("BossJoinRemote").OnServerEvent:Connect(function(p1) --[[ Line: 692 | Upvalues: v7 (ref), t3 (ref), v16 (ref) ]]
		local v1 = v7.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		if v1:IsInAction("GlobalBossFight") then
			return
		end
		if not (v1.PlayerData.BossFight.LuckPower.Value <= 0) then
			t3[p1] = v1
			v16.AddClubPoints(v1, 50, "BossParticipation")
			v1:SetActionState("BossFight", true)
		end
	end)
	local function claimBossRewards(p1) --[[ claimBossRewards | Line: 704 | Upvalues: v16 (ref) ]]
		local _bossRewardsToClaim = p1._bossRewardsToClaim
		if not _bossRewardsToClaim then
			return
		end
		if p1._claimedBossRewards then
			return
		end
		p1._claimedBossRewards = true
		v16.AddClubPoints(p1, 150, "BossClear")
		for k, v in pairs(_bossRewardsToClaim.Free) do
			p1:GiveItem({
				ApplyModifiers = true,
				IgnoreLimit = true,
				Source = "Boss",
				Name = v.Name,
				Amount = v.Amount,
				LuckPower = v.LuckPower
			})
		end
		return true
	end
	v8.GetRemoteFunction("ClaimBossRewardsRemote").OnServerInvoke = function(p1) --[[ Line: 732 | Upvalues: v7 (ref), claimBossRewards (copy) ]]
		local v1 = v7.getWrapperFromPlayer(p1)
		if v1 then
			return claimBossRewards(v1)
		end
	end
	v12.AddProductHandler("ExtraBossChest", function(p1, p2) --[[ Line: 739 | Upvalues: v33 (ref) ]]
		local _bossRewardsToClaim = p1._bossRewardsToClaim
		if not _bossRewardsToClaim then
			return
		end
		for k, v in pairs(_bossRewardsToClaim.Premium) do
			p1:GiveItem({
				ApplyModifiers = true,
				IgnoreLimit = true,
				Source = "BossExtra",
				Name = v.Name,
				Amount = v.Amount,
				LuckPower = v.LuckPower
			})
		end
		v33:FireClient(p1.Player)
		return {
			ItemType = "ExtraBossChest",
			ItemId = 1
		}
	end)
	v8.GetRemoteFunction("BossDonateSlotsRemote").OnServerInvoke = function(p1, p2) --[[ Line: 757 | Upvalues: v7 (ref), t2 (ref), v14 (ref), v2 (ref), t3 (ref), v16 (ref), v24 (ref) ]]
		local v1 = v7.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local count = 0
		for k, v in pairs(p2) do
			local v22 = v1:GetItemValue(v, "Animals")
			if v22 then
				local Species = v22.Species.Value
				if not table.find(t2, "BossDonation") then
					v14.ReportResourceEvent(p1, "Sink", "HorseSlot", Species, "BossDonation", 1)
				end
				v22:Destroy()
				count = count + 1
			end
		end
		local v3 = count * v2.BossLuckPower.Horse
		local LuckPower = v1.PlayerData.BossFight.LuckPower
		LuckPower.Value = LuckPower.Value + v3
		t3[p1] = v1
		v16.AddClubPoints(v1, 50, "BossParticipation")
		v1:SetActionState("BossFight", true)
		v24:SetAttribute("BossDonations", v24:GetAttribute("BossDonations") + v3)
		return true
	end
	v8.GetRemoteFunction("BossDonateCoinsRemote").OnServerInvoke = function(p1, p2) --[[ Line: 781 | Upvalues: v7 (ref), t (ref), v2 (ref), v24 (ref), t2 (ref), v14 (ref), t3 (ref), v16 (ref) ]]
		local v1 = v7.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		if v1:IsInAction("GlobalBossFight") then
			return
		end
		local v22 = t.GetCoinAmountToDonate(v1, p2)
		if v22 <= 0 then
			return
		end
		local v3 = v22 / v2.BossLuckPower.Coins.Rate * v2.BossLuckPower.Coins.Power
		local LuckPower = v1.PlayerData.BossFight.LuckPower
		LuckPower.Value = LuckPower.Value + v3
		local v4 = v1:GetCurrencyValue("Coins")
		v4.Value = v4.Value - v22
		v24:SetAttribute("BossDonations", v24:GetAttribute("BossDonations") + v3)
		if not table.find(t2, "BossDonation") then
			v14.ReportResourceEvent(p1, "Sink", "Currency", "Coins", "BossDonation", v22)
		end
		t3[p1] = v1
		v16.AddClubPoints(v1, 50, "BossParticipation")
		v1:SetActionState("BossFight", true)
		return true
	end
	v12.AddProductHandler("MaxBossLuck", function(p1, p2) --[[ Line: 804 ]]
		if p1 and (p1.PlayerData and p1.PlayerData.BossFight) then
			p1.PlayerData.BossFight.LuckPower.Value = 100
			return {
				ItemType = "MaxBossLuck",
				ItemId = 1
			}
		end
	end)
	v7.bindToPlayers(function(p1) --[[ Line: 814 | Upvalues: v7 (ref) ]]
		local _ = v7.getWrapperFromPlayer(p1)
	end, function(p1) --[[ Line: 840 | Upvalues: v7 (ref), claimBossRewards (copy), t3 (ref) ]]
		local v1 = v7.getWrapperFromPlayer(p1)
		if not v1 then
			t3[p1] = nil
			return
		end
		claimBossRewards(v1)
		t3[p1] = nil
	end)
	if v20 then
		task.spawn(function() --[[ Line: 859 | Upvalues: v4 (ref), t (ref), v23 (ref), BossFightWarningDuration (ref) ]]
			v4.spawnLoop(function() --[[ Line: 860 | Upvalues: t (ref), v23 (ref), BossFightWarningDuration (ref) ]]
				t:PickSpawner()
				if v23 then
					task.wait(BossFightWarningDuration)
					local v1 = t:SpawnBoss()
					v1.adornee.Destroying:Wait()
					t:EndBoss(v1)
				end
			end, 10)
		end)
	else
		v31.SeedChanged:Connect(function() --[[ Line: 850 | Upvalues: t (ref), v23 (ref), BossFightWarningDuration (ref) ]]
			t:PickSpawner()
			if v23 then
				task.wait(BossFightWarningDuration)
				local v1 = t:SpawnBoss()
				v1.adornee.Destroying:Wait()
				t:EndBoss(v1)
			end
		end)
	end
	if not RunService:IsStudio() then
		return
	end
	task.spawn(function() --[[ Line: 872 ]]
		while true do
			task.wait(1)
		end
	end)
end
function t.GetAllPlayersInFight() --[[ GetAllPlayersInFight | Line: 881 | Upvalues: t3 (ref) ]]
	return t3
end
function t.KillBoss(p1) --[[ KillBoss | Line: 885 | Upvalues: v27 (ref) ]]
	if not v27 or v27._destroyed then
		return false
	end
	local v1 = v27:get("TamingHealth")
	if v1 then
		local Y = v1.Y
		v27:set("TamingHealth", (Vector3.new(Y, Y, 0)))
		return true
	else
		return false
	end
end
function t.CancelGlobalBossFight(p1) --[[ CancelGlobalBossFight | Line: 899 | Upvalues: v26 (ref), v28 (ref), v22 (copy), v29 (ref), v1 (copy), Sonar (copy) ]]
	if not (v26 or v28) then
		return false
	end
	if v28 and not v28._destroyed then
		p1:EndBoss(v28)
	else
		v22:DoCleaning()
		if v26 then
			v26:Destroy()
			v26 = nil
		end
		if v29 then
			v29:Destroy()
			v29 = nil
		end
		v28 = nil
		if not v1 then
			return true
		end
		Sonar("GlobalBossFightService"):SetFightActive(false)
	end
	return true
end
t.init()
return t