-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("Signal")
local v3 = Sonar("safeDestroy")
local v4 = Sonar("MarketplaceService")
local v5 = Sonar("ItemDataService")
local v6 = Sonar("TimeSeed")
local v7 = Sonar("PlayerWrapper")
local v8 = Sonar("FormatTime")
local v9 = Sonar("EventUtils")
local v10 = Sonar("LootboxService")
local v11 = Sonar("TableUtils")
local v12 = game:GetService("RunService"):IsServer()
local v13 = game:GetService("RunService"):IsStudio()
local t2 = {
	RequiredPoints = function(p1, p2, p3) --[[ RequiredPoints | Line: 355 ]]
		local v1 = p1:GetRequiredPointsValue(p2, p3.Track)
		if v1 and (v1.Value and v1.Value < p1:GetRequiredPoints(p2, p3)) then
			return "NotRequiredPoints"
		else
			return true
		end
	end,
	RequiredStats = function(p1, p2, p3) --[[ RequiredStats | Line: 365 ]]
		return true
	end,
	UnlockMission = function(p1, p2, p3) --[[ UnlockMission | Line: 373 ]]
		if p2:IsMissionClaimed(type(p3.UnlockMission) == "table" and p3.UnlockMission.Name or p3.UnlockMission) then
			return true
		else
			return "MissionNotComplete"
		end
	end
}
function t.new(p1, p2) --[[ new | Line: 389 | Upvalues: t (copy), v1 (copy), v11 (copy), v5 (copy), v4 (copy), v6 (copy), v12 (copy), v7 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Name = p1
	v2.Config = p2
	v2.ClaimInOrder = v2.Config.ClaimInOrder
	v2.AutoClaim = v2.Config.AutoClaim
	v2.AnyTierAutoClaim = false
	v2.Repeatable = v2.Config.Repeatable or false
	v2.RepetitionInProgress = {}
	if not (v2.Config.Tiers or v2.Config.Tracks) then
		warn("\226\154\160\239\184\143 UnlockSequence, Tiers or Tracks is required", v2.Name)
		return v2
	end
	v2.Tracks = v2.Config.Tracks or {}
	v2.Requirements = v2.Config.Requirements or {}
	if v2.Config.Tiers and not next(v2.Tracks) then
		v2.Tracks.Default = {
			UnlockedByDefault = true,
			Tiers = v2.Config.Tiers,
			StartTime = v2.Config.StartTime
		}
	end
	local t2 = {}
	for v52, v62 in v2.Tracks do
		if not v62.Tiers then
			local v72 = if type(v62) == "table" then v62[1] and v62 else false
			if not v72 then
				v72 = {}
				for v8, v9 in v2.Config.Tiers do
					v72[v8] = table.clone(v9)
				end
			end
			v2.Tracks[v52] = {
				Tiers = v72
			}
			v62 = v2.Tracks[v52]
		end
		if not v11.IsArray(v62.Tiers) then
			warn("\226\154\160\239\184\143 UnlockSequence, Track tiers is not an array or contains gaps:", v2.Name, v52)
		end
		v62.Track = v52
		v62.Name = v52
		v62.Sequence = v2.Name
		if v62.ProductId then
			v62.ProductType = "DeveloperProduct"
			v62.ProductCategory = "UnlockSequenceTrack"
			local v10 = t2[v62.ProductId]
			if v10 then
				if v10.ProductCategory ~= "UnlockSequenceTrack" then
					warn((("Invalid ProductId \'%*\' for track %*/%*: Registered under different product category \'%*\'"):format(v62.ProductId, v2.Name, v52, v10.ProductCategory)))
				end
			else
				t2[v62.ProductId] = {
					ProductType = "DeveloperProduct",
					ProductCategory = "UnlockSequenceTrack",
					Name = ("%*_%*"):format(v2.Name, v52),
					ProductId = v62.ProductId
				}
			end
		end
		if v62.StartTime and not v2.Config.StartTime then
			v2.Config.StartTime = v62.StartTime
		end
		for v112, v122 in v62.Tiers do
			v122.Track = v52
			v122.Index = v112
			v122.Sequence = v2.Name
			v122.MaxCompletions = v122.MaxCompletions or 1
			if v122.AutoClaim then
				v2.AnyTierAutoClaim = true
			end
			if v122.ProductId then
				v122.ProductType = "DeveloperProduct"
				v122.ProductCategory = "UnlockSequenceTier"
				v122.Name = ("%*_%*_%*"):format(v2.Name, v52, v112)
				local v132 = t2[v122.ProductId]
				if v132 then
					if v132.ProductCategory ~= "UnlockSequenceTier" then
						warn((("Invalid ProductId \'%*\' for tier %*/%*/%*: Registered under different product category \'%*\'"):format(v122.ProductId, v2.Name, v52, v112, v132.ProductCategory)))
					end
				else
					t2[v122.ProductId] = {
						ProductType = "DeveloperProduct",
						ProductCategory = "UnlockSequenceTier",
						Name = v122.Name,
						ProductId = v122.ProductId
					}
				end
			end
			if v122.Price then
				for v14, v15 in v122.Price do
					if not v5.GetByName(v14) then
						warn("\226\154\160\239\184\143 UnlockSequence, Currency not found", v14, v2.Name)
					end
				end
			end
		end
		for v16, v17 in v2.Tracks do
			if v17.UseDefaultTrackRequirements then
				for v18, v19 in v17.Tiers do
					local v20 = v2.Tracks.Default.Tiers[v19.Index]
					if v20 then
						v19.RequiredPoints = v20.RequiredPoints
					end
				end
			end
		end
	end
	v4.AddPurchasesFromModule(t2)
	for v21, v22 in v2.Tracks do
		if v22.StartDuration then
			local v23 = v22.StartTime or v2.Config.StartTime
			if v23 then
				v22.StartTime = v23 + v22.StartDuration
			else
				warn("\226\154\160\239\184\143 UnlockSequence, StartTime not found in track, but StartDuration is defined in track", v21, v2.Name)
			end
		end
		if v22.StartTime then
			local StartTime = v22.StartTime
			for v24, v25 in v22.Tiers do
				if StartTime or v25.StartDuration then
					v25.StartTime = StartTime + (v25.StartDuration or 0)
					if v25.StartTime < StartTime then
						warn("\226\154\160\239\184\143 UnlockSequence, StartTime is less than the highest start time found", v21, v25.Index, v2.Name)
					end
					StartTime = v25.StartTime
				end
			end
		end
	end
	if v2.Config.Refresh then
		v2.RefreshTimer = v2.Config.Refresh.TimeSeed or v6.new({
			DoNotDeferSeedInit = true,
			Duration = v2.Config.Refresh.Duration,
			Start = v2.Config.Refresh.StartTime
		})
		v2.Maid:GiveTask(v2.RefreshTimer)
		if v12 then
			v2.OnRefreshed = type(v2.Config.Refresh.OnRefreshed) == "function" and { v2.Config.Refresh.OnRefreshed } or v2.Config.Refresh.OnRefreshed
			if not v2.OnRefreshed then
				v2.OnRefreshed = {}
			end
		end
	end
	if v12 and (v2.RefreshTimer or (v2.AutoClaim or v2.AnyTierAutoClaim)) then
		local function resetPlayerData(p1, p2) --[[ resetPlayerData | Line: 581 | Upvalues: v2 (copy) ]]
			local LastRefresh = p2:FindFirstChild("LastRefresh")
			if not LastRefresh then
				warn("\226\154\160\239\184\143 UnlockSequence, No LastRefresh data value found in", p2, v2.Name)
				return
			end
			if LastRefresh.Value ~= v2.RefreshTimer.CurrentSeed then
				LastRefresh.Value = v2.RefreshTimer.CurrentSeed
				v2:ResetPlayerData(p1)
			end
		end
		v7.bindToPlayers({
			OnAdded = function(p1, p2) --[[ OnAdded | Line: 602 | Upvalues: v2 (copy) ]]
				local v1 = v2:_getDataFolder(p2)
				if not v1 then
					warn("\226\154\160\239\184\143 UnlockSequence, No sequence data folder found in", p2.Player, v2.Name)
					return
				end
				if v2.AutoClaim or v2.AnyTierAutoClaim then
					p2.Maid:GiveTask(v2:GetCurrentTierChangedSignal(p2):Connect(function() --[[ Line: 612 | Upvalues: p2 (copy), v2 (ref) ]]
						if p2.Player and v2.RepetitionInProgress[p2.Player.UserId] then
							return
						end
						for v1, v22 in v2.Tracks do
							for v3, v4 in v22.Tiers do
								if v2.AutoClaim or v4.AutoClaim then
									local v5, v6 = v2:CanClaim(p2, v4)
									if v5 == true then
										v2:Claim(p2, v6)
										continue
									end
									if v2.ClaimInOrder then
										break
									end
								end
							end
						end
					end))
				end
				if not v2.RefreshTimer then
					return
				end
				p2.Maid:GiveTask(v2.RefreshTimer.SeedChanged:Connect(function() --[[ Line: 641 | Upvalues: p2 (copy), v1 (copy), v2 (ref) ]]
					local v12 = p2
					local v22 = v1
					local LastRefresh = v22:FindFirstChild("LastRefresh")
					if not LastRefresh then
						warn("\226\154\160\239\184\143 UnlockSequence, No LastRefresh data value found in", v22, v2.Name)
						return
					end
					if LastRefresh.Value ~= v2.RefreshTimer.CurrentSeed then
						LastRefresh.Value = v2.RefreshTimer.CurrentSeed
						v2:ResetPlayerData(v12)
					end
				end))
				local LastRefresh = v1:FindFirstChild("LastRefresh")
				if not LastRefresh then
					warn("\226\154\160\239\184\143 UnlockSequence, No LastRefresh data value found in", v1, v2.Name)
					return
				end
				if LastRefresh.Value == v2.RefreshTimer.CurrentSeed then
					return
				end
				LastRefresh.Value = v2.RefreshTimer.CurrentSeed
				v2:ResetPlayerData(p2)
			end
		})
	end
	if v12 then
		v2.OnClaimed = type(v2.Config.OnClaimed) == "function" and { v2.Config.OnClaimed } or v2.Config.OnClaimed
		if not v2.OnClaimed then
			v2.OnClaimed = {}
		end
		v2.OnRepetitionCompleted = type(v2.Config.OnRepetitionCompleted) == "function" and { v2.Config.OnRepetitionCompleted } or v2.Config.OnRepetitionCompleted
		if not v2.OnRepetitionCompleted then
			v2.OnRepetitionCompleted = {}
		end
	end
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 667 | Upvalues: v3 (copy) ]]
	v3(p1)
end
function t._runCallbacks(p1, p2, ...) --[[ _runCallbacks | Line: 675 ]]
	for v1, v2 in p1[p2] do
		v2(p1, ...)
	end
end
function t._getValueOrFunction(p1, p2, p3, ...) --[[ _getValueOrFunction | Line: 687 ]]
	if not p2 then
		return
	end
	if type(p2[p3]) == "function" then
		return p2[p3](p1, ...)
	else
		return p2[p3]
	end
end
function t.GetTrack(p1, p2) --[[ GetTrack | Line: 702 ]]
	if type(p2) == "table" then
		for v1, v2 in p1.Tracks do
			if v2 == p2 then
				return v2
			end
		end
	end
	return p1.Tracks[p2] or (p1.Tracks.Default or p1.Tracks[1])
end
function t.GetTracks(p1) --[[ GetTracks | Line: 717 ]]
	return p1.Tracks
end
function t.GetTiers(p1, p2) --[[ GetTiers | Line: 721 ]]
	return p1:GetTrack(p2).Tiers
end
function t.GetTierWhere(p1, p2, p3, p4) --[[ GetTierWhere | Line: 731 ]]
	if p2 then
		for v1, v2 in p1:GetTrack(p2).Tiers do
			if v2[p3] == p4 then
				return v2
			end
		end
	else
		for v3, v4 in p1.Tracks do
			for v5, v6 in v4.Tiers do
				if v6[p3] == p4 then
					return v6
				end
			end
		end
	end
	return nil
end
function t.GetTierFromReward(p1, p2) --[[ GetTierFromReward | Line: 755 ]]
	local function rewardsContain(p1) --[[ rewardsContain | Line: 756 | Upvalues: p2 (copy) ]]
		if not p1 then
			return false
		end
		for v1, v2 in p1 do
			if type(v2) == "table" and (v2.Name and v2.Name == p2) then
				return true
			end
		end
		return false
	end
	for v1, v2 in p1.Tracks do
		for v3, v4 in v2.Tiers do
			if v4.RewardsPerRepetition then
				for v5, v6 in v4.RewardsPerRepetition do
					if rewardsContain(v6) then
						return v4
					end
				end
				continue
			end
			if rewardsContain(p1:GetTierRewards(v4)) then
				return v4
			end
		end
	end
	return nil
end
function t._getTiersNeededToClaim(p1, p2, p3) --[[ _getTiersNeededToClaim | Line: 793 ]]
	local v1 = p1:GetUnlockTier(p3)
	local v2 = p1:GetTrack(v1.Track)
	local sum, v3 = 0, v1
	for i = 1, v1.Index - 1 do
		local v4 = v2.Tiers[i]
		if v4 and not v4.ClaimedByDefault then
			sum = sum + (v4.MaxCompletions or 1)
		end
	end
	if not v3.ClaimedByDefault then
		sum = sum + 1
	end
	return sum
end
function t._getDataFolder(p1, p2) --[[ _getDataFolder | Line: 816 ]]
	local v1 = p1:_getValueOrFunction(p1.Config, "Data", p2)
	if type(v1) == "string" then
		local v2 = p2.PlayerData:FindFirstChild(v1)
		local v3, v4
		if typeof(v2) == "Instance" then
			v3 = v2:FindFirstChild(p1.Name)
			if not v3 then
				v4 = v2
				v3 = v2
			end
		else
			v4 = v2
			v3 = v2
		end
		v1 = v3
	end
	if not v1 then
		v1 = p2.PlayerData:FindFirstChild(p1.Name)
	end
	return v1
end
function t._getClaimedDataFolder(p1, p2, p3) --[[ _getClaimedDataFolder | Line: 831 ]]
	local v1 = p1:GetTrackValue(p2, p3)
	if not v1 then
		return nil
	end
	local Claimed = v1:FindFirstChild("Claimed")
	if Claimed then
		return Claimed
	else
		return v1
	end
end
function t._checkRequirements(p1, p2, p3) --[[ _checkRequirements | Line: 845 | Upvalues: t2 (copy) ]]
	local v2 = p1:GetUnlockTier(p3)
	for v3, v4 in t2 do
		if v2[v3] then
			local v5 = v4(p1, p2, v2)
			if v5 ~= true then
				return v5
			end
		end
	end
	for v6, v7 in p1.Requirements do
		local v9 = v7.Check and v7.Check(p1, p2, v2, v7.Get and v7.Get(p1, p2, v2))
		if v9 ~= true then
			return v9
		end
	end
	return true
end
function t._getSeed(p1) --[[ _getSeed | Line: 872 ]]
	if p1.RefreshTimer then
		return p1.RefreshTimer:GetSeed() + (p1.Config.Refresh.Seed or 0)
	end
	return p1.Config.Seed or os.time()
end
function t.IsRobuxTier(p1, p2) --[[ IsRobuxTier | Line: 883 ]]
	local isNotProductId = p1:GetUnlockTier(p2).ProductId ~= nil
	return isNotProductId
end
function t.GetUnlockTier(p1, p2) --[[ GetUnlockTier | Line: 895 ]]
	if type(p2) == "number" then
		return p1:GetTrack("Default").Tiers[p2]
	end
	if type(p2) == "table" then
		if type(p2.Tier) == "table" then
			return p2.Tier
		end
		local v1 = p1:GetTrack(p2.Track)
		if type(p2.Tier) == "number" then
			return v1.Tiers[p2.Tier]
		end
		if type(p2.Index) == "number" then
			return v1.Tiers[p2.Index]
		end
	end
	return p2
end
function t.GetTrackValue(p1, p2, p3) --[[ GetTrackValue | Line: 924 ]]
	local v1 = p1:GetTrack(p3).Track or "Default"
	local v2 = nil
	local v3 = p1:_getDataFolder(p2)
	if not v3 then
		return nil
	end
	local v4 = (v3:FindFirstChild("Tracks") or v3):FindFirstChild(v1)
	if v4 then
		return v4
	end
	if v1 == "Default" then
		v2 = v3
	end
	return v2
end
function t.GetClaimedTierValue(p1, p2, p3) --[[ GetClaimedTierValue | Line: 951 ]]
	local v1 = p1:_getClaimedDataFolder(p2, p3.Track)
	if v1 then
		return v1:FindFirstChild(p3.Index)
	else
		return nil
	end
end
function t.GetRequiredPointsValue(p1, p2, p3) --[[ GetRequiredPointsValue | Line: 959 ]]
	local v1 = p1:_getDataFolder(p2)
	local v2 = p1:_getValueOrFunction(p1.Config, "RequiredPointsDataValue", p2, v1)
	local v3
	if type(v2) == "string" then
		v3 = if v1 then v1:FindFirstChild(v2) else v2
		if not v3 then
			v3 = p2:GetItemValue(v3)
		end
	else
		v3 = if v2 == true then v1 else v2
	end
	if not v3 then
		local v6 = p1:GetTrackValue(p2, p3)
		if v6 then
			v3 = v6:FindFirstChild("Points")
		end
	end
	if not v3 and v1 then
		v3 = v1:FindFirstChild("Points")
	end
	return if typeof(v3) == "Instance" then v3 else false
end
function t.GetProgressChangedSignal(p1, p2, p3) --[[ GetProgressChangedSignal | Line: 992 | Upvalues: v2 (copy), v9 (copy) ]]
	local v1 = v2.new()
	local v22 = p1:GetRequiredPointsValue(p2, p3)
	if v22 then
		v1:GiveTask(v22:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 997 | Upvalues: v1 (copy) ]]
			v1:Fire()
		end))
	end
	if p1.Requirements then
		for v3, v4 in p1.Requirements do
			if v4.Changed then
				local v5 = v9.getConnectionEvents(v4.Changed, p1, p2)
				if v5 then
					for v6, v7 in v5 do
						v1:GiveTask(v7:Connect(function() --[[ Line: 1011 | Upvalues: v1 (copy) ]]
							v1:Fire()
						end))
					end
				end
			end
		end
	end
	return v1
end
function t.GetTotalRequiredPoints(p1, p2, p3) --[[ GetTotalRequiredPoints | Line: 1023 ]]
	local v1 = 0
	for v2, v3 in p1:GetTrack(p3).Tiers do
		if v3.RequiredPoints then
			local v4 = v3.MaxCompletions or 1
			v1 = if v4 == (1 / 0) then v1 + v3.RequiredPoints else v1 + v4 * v3.RequiredPoints
		end
	end
	return v1
end
function t.GetMaxAchievableRequiredPoints(p1, p2, p3) --[[ GetMaxAchievableRequiredPoints | Line: 1043 ]]
	local v1 = 0
	for v2, v3 in p1.Tracks do
		if not p3 or v2 == p3 then
			for v4, v5 in v3.Tiers do
				if v5.RequiredPoints then
					if not p1:IsTierUnlocked(p2, v5) then
						break
					end
					local v6 = v5.MaxCompletions or 1
					v1 = if v6 == (1 / 0) then v1 + v5.RequiredPoints else v1 + v6 * v5.RequiredPoints
				end
			end
		end
	end
	return v1
end
function t.GetRequiredPoints(p1, p2, p3, p4) --[[ GetRequiredPoints | Line: 1079 ]]
	local v1 = p1:GetUnlockTier(p3)
	local v2 = p1:GetTrack(v1.Track)
	if p1.Config.NonCumulativeRequiredPoints then
		return v1.RequiredPoints or 0
	end
	if not p4 then
		p4 = p1:GetTierCompletionCount(p2, v1) + 1
	end
	local v3 = v1
	local sum, v6 = 0, math.min(p4, v3.MaxCompletions or 1)
	for i = 1, v3.Index - 1 do
		local v7 = v2.Tiers[i]
		if v7 and v7.RequiredPoints then
			for j = 1, v7.MaxCompletions or 1 do
				sum = sum + v7.RequiredPoints
			end
		end
	end
	if v3.RequiredPoints then
		for k = 1, v6 do
			sum = sum + v3.RequiredPoints
		end
	end
	return sum
end
function t.GetTierCompletionCount(p1, p2, p3) --[[ GetTierCompletionCount | Line: 1126 ]]
	local v1 = p1:GetUnlockTier(p3)
	if p1.Config.ClaimInOrder then
		local v2 = p1:GetTrackValue(p2, v1.Track)
		if v2 then
			return v2.Value
		else
			return 0
		end
	else
		local v3 = p1:GetClaimedTierValue(p2, v1)
		if not v3 then
			return 0
		end
		if v3:IsA("IntValue") then
			return v3.Value
		else
			return 1
		end
	end
end
function t.GetRepetitionsValue(p1, p2) --[[ GetRepetitionsValue | Line: 1150 ]]
	local v1 = p1:_getDataFolder(p2)
	if not v1 then
		return nil
	end
	local v2 = p1:_getValueOrFunction(p1.Config, "RepetitionsDataValue", p2, v1)
	if type(v2) == "string" then
		local v3 = v1:FindFirstChild(v2)
		v2 = v3 or p2:GetItemValue(v2)
	elseif v2 == true then
		v2 = v1
	end
	if not v2 then
		v2 = v1:FindFirstChild("Repetitions")
	end
	return if typeof(v2) == "Instance" and v2 then v2 else nil
end
function t.GetRepetitions(p1, p2) --[[ GetRepetitions | Line: 1174 ]]
	if not p1.Repeatable then
		return 0
	end
	local v1 = p1:GetRepetitionsValue(p2)
	if v1 then
		return v1.Value
	else
		return 0
	end
end
function t.GetRepetitionsChangedSignal(p1, p2) --[[ GetRepetitionsChangedSignal | Line: 1187 | Upvalues: v2 (copy) ]]
	local v1 = v2.new()
	local v22 = p1:GetRepetitionsValue(p2)
	if v22 then
		v1:GiveTask(v22:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 1192 | Upvalues: v1 (copy), v22 (copy) ]]
			v1:Fire(v22.Value)
		end))
	end
	return v1
end
function t.GetCurrentTierChangedSignal(p1, p2, p3) --[[ GetCurrentTierChangedSignal | Line: 1200 | Upvalues: v2 (copy) ]]
	local v1 = v2.new()
	local v22 = nil
	local function onTiersChanged() --[[ onTiersChanged | Line: 1204 | Upvalues: p1 (copy), p2 (copy), p3 (copy), v22 (ref), v1 (copy) ]]
		local v12 = p1:GetCurrentTier(p2, p3)
		if v12 == v22 then
			return
		end
		v22 = v12
		v1:Fire(v12)
	end
	v1:GiveTask(p1:GetTiersChangedSignal(p2, p3):Connect(onTiersChanged))
	local v3 = p1:GetCurrentTier(p2, p3)
	if v3 ~= v22 then
		v22 = v3
		v1:Fire(v3)
	end
	return v1
end
function t.GetClaimableTierChangedSignal(p1, p2, p3) --[[ GetClaimableTierChangedSignal | Line: 1217 | Upvalues: v2 (copy) ]]
	local v1 = v2.new()
	local v22 = nil
	local function onTiersChanged() --[[ onTiersChanged | Line: 1221 | Upvalues: p1 (copy), p2 (copy), p3 (copy), v22 (ref), v1 (copy) ]]
		local v12 = p1:GetNextClaimableTier(p2, p3)
		if v12 == v22 then
			return
		end
		v22 = v12
		v1:Fire(v12)
	end
	v1:GiveTask(p1:GetTiersChangedSignal(p2, p3):Connect(onTiersChanged))
	local v3 = p1:GetNextClaimableTier(p2, p3)
	if v3 ~= v22 then
		v22 = v3
		v1:Fire(v3)
	end
	return v1
end
function t.GetTierState(p1, p2, p3) --[[ GetTierState | Line: 1234 ]]
	if p1:IsTierClaimed(p2, p3) then
		return "Claimed"
	end
	if p1:IsTierCompleted(p2, p3) then
		return "Completed"
	end
	if p1:IsTierUnlocked(p2, p3) then
		return "Unlocked"
	else
		return "Locked"
	end
end
function t.GetCurrentTier(p1, p2, p3) --[[ GetCurrentTier | Line: 1255 ]]
	local v2 = nil
	for v3, v4 in p1:GetTrack(type(p3) == "table" and p3.Track or p3).Tiers do
		if p1.ClaimInOrder then
			if not p1:IsTierClaimed(p2, v4) then
				break
			end
		elseif not p1:IsTierCompleted(p2, v4) then
			break
		end
		v2 = v4
	end
	return v2
end
function t.GetNextClaimableTier(p1, p2, p3) --[[ GetNextClaimableTier | Line: 1280 ]]
	for v2, v3 in p1:GetTrack(type(p3) == "table" and p3.Track or p3).Tiers do
		if not p1:IsTierClaimed(p2, v3) then
			if p1:CanClaim(p2, v3) == true then
				return v3
			end
			if p1.ClaimInOrder then
				break
			end
		end
	end
	return nil
end
function t.GetNextTierToUnlock(p1, p2, p3) --[[ GetNextTierToUnlock | Line: 1300 ]]
	for i, v in ipairs(p1:GetTrack(type(p3) == "table" and p3.Track or p3).Tiers) do
		if p1.ClaimInOrder then
			if not p1:IsTierClaimed(p2, v) then
				return v
			end
			continue
		end
		if not p1:IsTierCompleted(p2, v) then
			return v
		end
	end
	return nil
end
function t.IsTierClaimed(p1, p2, p3) --[[ IsTierClaimed | Line: 1322 ]]
	local v1 = p1:GetUnlockTier(p3)
	if v1.ClaimedByDefault then
		return true
	end
	local v2 = p1:GetTrackValue(p2, v1.Track)
	if not v2 then
		return p1:IsTierCompleted(p2, v1)
	end
	if p1.ClaimInOrder then
		return v2.Value >= p1:_getTiersNeededToClaim(p2, v1)
	else
		return p1:GetTierCompletionCount(p2, v1) >= v1.MaxCompletions
	end
end
function t.IsTierCompleted(p1, p2, p3) --[[ IsTierCompleted | Line: 1348 ]]
	if typeof(p3) ~= "table" then
		p3 = p1:GetUnlockTier(p3)
	end
	if p3.ClaimedByDefault then
		return true
	end
	if p1:GetTrackValue(p2, p3.Track) and p1:IsTierClaimed(p2, p3) then
		return true
	end
	local v2, v3 = p1:IsTierUnlocked(p2, p3)
	if not v2 then
		return false, v3 or "TierNotUnlocked"
	end
	local v4 = p1:_checkRequirements(p2, p3)
	if v4 == true then
		return true, nil
	else
		return false, v4
	end
end
function t.IsTierUnlocked(p1, p2, p3) --[[ IsTierUnlocked | Line: 1381 ]]
	local v1 = p1:GetUnlockTier(p3)
	if not p1:IsTrackUnlocked(p2, v1.Track) then
		return false, "TrackLocked"
	end
	if p1:HasTierStarted(p2, v1) then
		local v2 = p1:GetTrackValue(p2, v1.Track)
		return (not v2 or (not p1.ClaimInOrder or p1:_getTiersNeededToClaim(p2, v1) == v2.Value + 1)) and true or false
	else
		return false
	end
end
function t.IsTierClaimable(p1, p2, p3) --[[ IsTierClaimable | Line: 1415 ]]
	local v1 = p1:GetUnlockTier(p3)
	if not p1:GetTrackValue(p2, v1.Track) then
		return false, "TrackValueNotFound"
	end
	if p1:IsTierClaimed(p2, v1) then
		return false, "AlreadyClaimed"
	end
	local v2, v3 = p1:IsTierCompleted(p2, v1)
	if v2 then
		return true
	else
		return false, v3 or "TierNotCompleted"
	end
end
function t.HasTierStarted(p1, p2, p3) --[[ HasTierStarted | Line: 1438 | Upvalues: v8 (copy) ]]
	local v1 = p1:GetUnlockTier(p3)
	if not p1:HasTrackStarted(p2, v1.Track) then
		return false
	end
	if not v1.StartTime then
		return true
	end
	return v1.StartTime <= v8.GetTime()
end
function t.GetTimeRemainingTillStart(p1, p2, p3) --[[ GetTimeRemainingTillStart | Line: 1455 | Upvalues: v8 (copy) ]]
	local v1 = if type(p3) == "string" then p1:GetTrack(p3) else p1:GetUnlockTier(p3)
	if v1.StartTime then
		return v1.StartTime - v8.GetTime()
	else
		return 0
	end
end
function t.HasTrackStarted(p1, p2, p3) --[[ HasTrackStarted | Line: 1469 | Upvalues: v8 (copy) ]]
	local v1 = p1:GetTrack(p3)
	if not v1.StartTime then
		return true
	end
	return v1.StartTime <= v8.GetTime()
end
function t.HasUnlockedAllTiers(p1, p2, p3) --[[ HasUnlockedAllTiers | Line: 1484 ]]
	return p1:GetNextTierToUnlock(p2, p3) == nil
end
function t.GetTotalValueFromCompletedTiers(p1, p2, p3) --[[ GetTotalValueFromCompletedTiers | Line: 1493 ]]
	local sum = 0
	if type(p3) == "string" then
		p3 = {
			Value = p3
		}
	end
	for v1, v2 in p1.Tracks do
		if not p3.Track or v1 == p3.Track then
			for v3, v4 in v2.Tiers do
				if v4[p3.Value] then
					if p1:IsTierClaimed(p2, v4) then
						sum = sum + v4[p3.Value]
						continue
					end
					if p1.ClaimInOrder then
						break
					end
				end
			end
		end
	end
	return sum
end
function t.GetTotalValueChangedSignal(p1, p2, p3) --[[ GetTotalValueChangedSignal | Line: 1525 | Upvalues: v2 (copy) ]]
	local v1 = v2.new()
	for v22, v3 in p1.Tracks do
		if not p3 or v22 == p3 then
			local v4 = p1:GetCurrentTierChangedSignal(p2, v22)
			v1:GiveTask(v4)
			v1:GiveTask(v4:Connect(function() --[[ Line: 1536 | Upvalues: v1 (copy) ]]
				v1:Fire()
			end))
		end
	end
	return v1
end
function t.GetTiersChangedSignal(p1, p2, p3) --[[ GetTiersChangedSignal | Line: 1549 | Upvalues: v2 (copy) ]]
	local v1 = v2.new()
	if p1.Repeatable then
		v1:GiveTask(p1:GetRepetitionsChangedSignal(p2):Connect(function() --[[ Line: 1553 | Upvalues: v1 (copy) ]]
			v1:Fire()
		end))
	end
	for v22, v3 in p1.Tracks do
		if not p3 or v22 == p3 then
			v1:GiveTask(p1:GetTrackChangedSignal(p2, p3):Connect(function() --[[ Line: 1564 | Upvalues: v1 (copy) ]]
				v1:Fire()
			end))
			v1:GiveTask(p1:GetProgressChangedSignal(p2, p3):Connect(function() --[[ Line: 1569 | Upvalues: v1 (copy) ]]
				v1:Fire()
			end))
			for v4, v5 in v3.Tiers do
				v1:GiveTask(p1:GetTierChangedSignal(p2, v5, true):Connect(function() --[[ Line: 1577 | Upvalues: v1 (copy) ]]
					v1:Fire()
				end))
			end
		end
	end
	return v1
end
function t.GetTotalClaimableTiers(p1, p2) --[[ GetTotalClaimableTiers | Line: 1586 ]]
	local sum = 0
	for v1, v2 in p1.Tracks do
		local v3 = p1:GetTrackValue(p2, v1)
		if v3 then
			local v4 = p1:GetRequiredPointsValue(p2, v1)
			local v5 = p1:GetRequiredPointsValue(p2, v1) and v4.Value or 0
			local sum_2 = 0
			for v6, v7 in v2.Tiers do
				if p1:IsTierClaimable(p2, v7) then
					local v8 = v7.MaxCompletions or 1
					local v9 = 0
					if p1.ClaimInOrder then
						local v10 = v3 and v3.Value or 0
						if sum_2 < v10 then
							v9 = math.min(v8, v10 - sum_2)
						end
					else
						v9 = p1:GetTierCompletionCount(p2, v7)
					end
					if v7.RequiredPoints then
						for i = v9 + 1, v8 do
							if p1:GetRequiredPoints(p2, v7, i) <= v5 then
								sum = sum + 1
							else
								if p1.ClaimInOrder then
									return sum
								end
								break
							end
						end
					else
						sum = sum + (v8 - v9)
						if v9 <= 0 and p1.ClaimInOrder then
							break
						end
					end
					sum_2 = sum_2 + v8
					continue
				end
				if p1.ClaimInOrder then
					break
				end
			end
		end
	end
	return sum
end
function t.GetTierChangedSignal(p1, p2, p3, p4) --[[ GetTierChangedSignal | Line: 1655 | Upvalues: v2 (copy), v13 (copy), v1 (copy) ]]
	local v12 = p1:GetUnlockTier(p3)
	local v22 = v2.new()
	local v3 = p1:_getClaimedDataFolder(p2, v12.Track)
	local v4 = nil
	local function setTierState(p12) --[[ setTierState | Line: 1663 | Upvalues: p1 (copy), p2 (copy), v12 (ref), v4 (ref), v22 (copy) ]]
		local v1 = p1:GetTierState(p2, v12)
		if v1 == v4 and not p12 then
			return
		end
		v4 = v1
		v22:Fire(v1)
	end
	if not p4 and v3 then
		v22:GiveTask(p1:GetTrackChangedSignal(p2, v12.Track):Connect(setTierState))
	end
	v22:GiveTask(p1:GetTierStartedSignal(v12):Connect(setTierState))
	if p1.Repeatable and not p4 then
		v22:GiveTask(p1:GetRepetitionsChangedSignal(p2):Connect(function() --[[ Line: 1679 | Upvalues: p1 (copy), p2 (copy), v12 (ref), v4 (ref), v22 (copy) ]]
			local v1 = p1:GetTierState(p2, v12)
			v4 = v1
			v22:Fire(v1)
		end))
	end
	if v3 and p1.ClaimInOrder then
		local v5 = p1:GetTierState(p2, v12)
		if v5 ~= v4 then
			v4 = v5
			v22:Fire(v5)
		end
	elseif v3 then
		local function getOrRemoveTierValue(p12, p22) --[[ getOrRemoveTierValue | Line: 1691 | Upvalues: v12 (ref), v13 (ref), p2 (copy), v22 (copy), v1 (ref), p1 (copy), v4 (ref) ]]
			if tonumber(p12.Name) ~= v12.Index then
				return
			end
			if v13 and not p22 then
				task.wait()
			end
			if not p2._inGame or p2._removingFromGame then
				return
			end
			v22.Maid.TierChangedMaid = nil
			if p12.Parent then
				v22.Maid.TierChangedMaid = v1.new()
				v22.Maid.TierChangedMaid:GiveTask(p12:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 1707 | Upvalues: p1 (ref), p2 (ref), v12 (ref), v4 (ref), v22 (ref) ]]
					local v1 = p1:GetTierState(p2, v12)
					v4 = v1
					v22:Fire(v1)
				end))
			end
			local v2 = p1:GetTierState(p2, v12)
			if v2 == v4 then
				return
			end
			v4 = v2
			v22:Fire(v2)
		end
		v22:GiveTask(v3.ChildAdded:Connect(getOrRemoveTierValue))
		v22:GiveTask(v3.ChildRemoved:Connect(getOrRemoveTierValue))
		for v6, v7 in v3:GetChildren() do
			getOrRemoveTierValue(v7, true)
		end
	end
	if not p4 then
		v22:GiveTask(p1:GetProgressChangedSignal(p2, v12.Track):Connect(setTierState))
	end
	return v22
end
function t.GetTierStartedSignal(p1, p2) --[[ GetTierStartedSignal | Line: 1733 | Upvalues: v2 (copy), v8 (copy) ]]
	local v1 = p1:GetUnlockTier(p2)
	local v22 = v2.new()
	if v1.StartTime then
		v22:GiveTask(v8.GetTimeReachedSignal(v1.StartTime):Connect(function() --[[ Line: 1738 | Upvalues: v22 (copy) ]]
			v22:Fire()
		end))
	end
	return v22
end
function t.GetTierRewards(p1, p2, p3) --[[ GetTierRewards | Line: 1746 | Upvalues: v10 (copy) ]]
	local v1 = nil
	if p2.RewardsPerRepetition then
		local v3 = (p3 and p1:GetRepetitions(p3) or 0) + 1
		local v4 = #p2.RewardsPerRepetition
		if v4 > 0 then
			v1 = p2.RewardsPerRepetition[math.min(v3, v4)]
		end
	else
		local v6 = p1:_getValueOrFunction(p1.Config, "Rewards", p2)
		v1 = if v6 then v6 else p2.Rewards
	end
	local v8 = v10.GetLootboxFromTable(v1, (("%*_%*_%*"):format(p2.Sequence, p2.Track, p2.Index)))
	if v8 then
		local t = {}
		t.Seed = if p1.Config.SeededRewards then p1:_getSeed() or nil else nil
		v1 = v8:Roll(t)
	end
	return v1
end
function t.CanClaim(p1, p2, p3) --[[ CanClaim | Line: 1781 ]]
	local v1 = if p3 then p3 else p1:GetNextTierToUnlock(p2)
	if not v1 then
		return "NoTierToClaim"
	end
	local v2 = p1:GetUnlockTier(v1)
	if not v2 then
		return "TierNotFound"
	end
	local t = {
		Tier = v2,
		Track = v2.Track,
		Sequence = p1
	}
	if p1.ClaimInOrder then
		local v3 = p1:GetNextTierToUnlock(p2, v2.Track)
		if not v3 then
			return "NotNextTier"
		end
		if v3.Index ~= v2.Index then
			return "NotNextTier"
		end
	end
	local v4, v5 = p1:IsTierClaimable(p2, v2)
	if v4 ~= true then
		return v5 or "NotClaimable"
	end
	local v6
	if v2.Price then
		v6 = t
		for v7, v8 in v2.Price do
			if not p2:HasRequiredItemAmount(v7, v8) then
				return "CannotAfford"
			end
		end
	else
		v6 = t
	end
	if p1.Config.CanClaim then
		local v9 = p1:_getValueOrFunction(p1.Config, "CanClaim", p2, v6)
		if v9 ~= true then
			return v9
		end
	end
	return true, v6
end
function t.Claim(p1, p2, p3) --[[ Claim | Line: 1845 ]]
	if not p3.Tier then
		warn("\226\154\160\239\184\143 UnlockSequence, No tier found", p3)
		return false
	end
	if p3.Tier.Price then
		for v1, v2 in p3.Tier.Price do
			local v3 = p2:GetItemValue(v1)
			if v3 then
				v3.Value = v3.Value - v2
				continue
			end
			warn("\226\154\160\239\184\143 Shop, Currency not found", v1, p1.Name)
		end
	end
	if p1.ClaimInOrder then
		local v4 = p1:GetTrackValue(p2, p3.Tier.Track)
		if v4 then
			v4.Value = v4.Value + 1
		end
	else
		local v5 = p1:GetClaimedTierValue(p2, p3.Tier)
		if not v5 then
			local v6 = Instance.new("IntValue")
			v6.Name = p3.Tier.Index
			v6.Parent = p1:_getClaimedDataFolder(p2, p3.Tier.Track)
			v5 = v6
		end
		if v5:IsA("IntValue") then
			v5.Value = math.min(v5.Value + 1, p3.Tier.MaxCompletions)
		else
			v5.Value = true
		end
	end
	local v8 = p1:GetTierRewards(p3.Tier, p2)
	if v8 then
		p2:GiveItems({
			IfOverLimit = "SendToInbox",
			Items = v8,
			Actions = {
				Preset = "NewItem"
			},
			AnalyticsSource = p1.Name
		})
	end
	p1:_runCallbacks("OnClaimed", p2, p3)
	if not p1.Repeatable or (p1.Config.AutoIncrementRepetitions == false or not p1:IsSequenceClaimed(p2)) then
		return true
	end
	p1:CompleteRepetition(p2)
	return true
end
function t.ClaimAvailableTiers(p1, p2, p3) --[[ ClaimAvailableTiers | Line: 1914 ]]
	for v1, v2 in p1:GetTrack(p3).Tiers do
		local v3, v4 = p1:CanClaim(p2, v2)
		if v3 == true then
			p1:Claim(p2, v4)
		end
	end
end
function t.GetClaimableTiers(p1, p2, p3) --[[ GetClaimableTiers | Line: 1925 ]]
	local t = {}
	for v1, v2 in p1:GetTrack(p3).Tiers do
		if p1:IsTierClaimable(p2, v2) then
			table.insert(t, v2)
		end
	end
	return t
end
function t.ClaimOrPromptPurchase(p1, p2, p3) --[[ ClaimOrPromptPurchase | Line: 1943 | Upvalues: v4 (copy) ]]
	if p1:IsRobuxTier(p3.Tier) then
		v4.PromptPurchase(p2.Player, p3.Tier.ProductId, p3.Tier.ProductType, {
			Sequence = p1.Name,
			Track = p3.Tier.Track,
			Tier = p3.Tier.Index
		})
		return true
	else
		return p1:Claim(p2, p3)
	end
end
function t.UnlockTrack(p1, p2, p3) --[[ UnlockTrack | Line: 1956 ]]
	local v1 = p1:GetTrack(p3.Track)
	if not v1 then
		return
	end
	local v2 = p1:GetTrackValue(p2, v1.Track)
	if not v2 then
		warn("\226\154\160\239\184\143 UnlockSequence, No track value found", v1.Track)
		return
	end
	if v2:IsA("BoolValue") then
		v2.Value = true
		return
	end
	if not v2:FindFirstChild("Unlocked") then
		return
	end
	v2.Unlocked.Value = true
end
function t.IsTrackUnlocked(p1, p2, p3) --[[ IsTrackUnlocked | Line: 1975 ]]
	local v1 = p1:GetTrack(p3)
	if not p1:HasTrackStarted(p2, v1) then
		return false
	end
	if v1.UnlockedByDefault then
		return true
	end
	local v2 = p1:GetTrackValue(p2, v1)
	if not v2 then
		return true
	end
	if v2:IsA("BoolValue") then
		return v2.Value
	end
	if v2:FindFirstChild("Unlocked") then
		return v2.Unlocked.Value
	else
		return true
	end
end
function t.IsTrackCompleted(p1, p2, p3) --[[ IsTrackCompleted | Line: 2003 ]]
	for v1, v2 in p1:GetTrack(p3).Tiers do
		if not p1:IsTierCompleted(p2, v2) then
			return false
		end
	end
	return true
end
function t.IsSequenceCompleted(p1, p2) --[[ IsSequenceCompleted | Line: 2016 ]]
	for v1, v2 in p1.Tracks do
		if not p1:IsTrackCompleted(p2, v2) then
			return false
		end
	end
	return true
end
function t.IsTrackClaimed(p1, p2, p3) --[[ IsTrackClaimed | Line: 2027 ]]
	for v1, v2 in p1:GetTrack(p3).Tiers do
		if not p1:IsTierClaimed(p2, v2) then
			return false
		end
	end
	return true
end
function t.IsSequenceClaimed(p1, p2) --[[ IsSequenceClaimed | Line: 2040 ]]
	for v1, v2 in p1.Tracks do
		if not p1:IsTrackClaimed(p2, v2) then
			return false
		end
	end
	return true
end
function t.GetTrackChangedSignal(p1, p2, p3) --[[ GetTrackChangedSignal | Line: 2050 | Upvalues: v2 (copy) ]]
	local v1 = v2.new()
	local v22 = p1:GetTrack(p3)
	local v3 = p1:GetTrackValue(p2, v22.Track)
	if v3 then
		if v3:IsA("ValueBase") then
			v1:GiveTask(v3:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 2058 | Upvalues: v1 (copy) ]]
				v1:Fire()
			end))
		end
		if v3:FindFirstChild("Unlocked") then
			v1:GiveTask(v3.Unlocked:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 2064 | Upvalues: v1 (copy) ]]
				v1:Fire()
			end))
		end
	end
	local v4 = v22
	if v4.StartTime then
		local v5 = p1:GetTrackStartedSignal(p2, v4)
		v1:GiveTask(v5)
		v1:GiveTask(v5:Connect(function() --[[ Line: 2075 | Upvalues: v1 (copy) ]]
			v1:Fire()
		end))
	end
	return v1
end
function t.GetTrackStartedSignal(p1, p2, p3) --[[ GetTrackStartedSignal | Line: 2083 | Upvalues: v2 (copy), v8 (copy) ]]
	local v1 = p1:GetTrack(p3)
	local v22 = v2.new()
	if v1.StartTime then
		v22:GiveTask(v8.GetTimeReachedSignal(v1.StartTime):Connect(function() --[[ Line: 2088 | Upvalues: v22 (copy) ]]
			v22:Fire()
		end))
	end
	return v22
end
function t.GetRefreshTimeChangedSignal(p1) --[[ GetRefreshTimeChangedSignal | Line: 2096 ]]
	if p1.RefreshTimer then
		return p1.RefreshTimer.SeedChanged
	else
		return nil
	end
end
function t.GetRefreshTime(p1) --[[ GetRefreshTime | Line: 2103 ]]
	if p1.RefreshTimer then
		return p1.RefreshTimer:GetEndTime()
	else
		return nil
	end
end
function t.ResetPlayerData(p1, p2) --[[ ResetPlayerData | Line: 2110 | Upvalues: v7 (copy) ]]
	local v1 = v7.getWrapperFromPlayer(p2)
	if not v1 then
		return
	end
	for v2, v3 in p1.Tracks do
		local v4 = p1:GetTrackValue(v1, v2)
		if v4 then
			local v5 = p1:GetRequiredPointsValue(v1, v2)
			if v5 then
				v5.Value = 0
			end
			if v4:IsA("BoolValue") then
				v4.Value = false
			elseif p1.ClaimInOrder then
				v4.Value = 0
			end
			local v6 = p1:_getClaimedDataFolder(v1, v2)
			if v6 then
				v6:ClearAllChildren()
			end
		end
	end
end
function t._resetForRepetition(p1, p2) --[[ _resetForRepetition | Line: 2145 ]]
	for v1, v2 in p1.Tracks do
		local v3 = p1:GetTrackValue(p2, v1)
		if v3 then
			if not p1.Config.DoNotResetRequiredPointsOnRepetition then
				local v4 = p1:GetRequiredPointsValue(p2, v1)
				if v4 then
					v4.Value = 0
				end
			end
			if not v3:IsA("BoolValue") and (p1.ClaimInOrder and v3:IsA("ValueBase")) then
				v3.Value = 0
			end
			local v5 = p1:_getClaimedDataFolder(p2, v1)
			if v5 then
				if v5 == v3 then
					for v6, v7 in v5:GetChildren() do
						if tonumber(v7.Name) then
							v7:Destroy()
						end
					end
					continue
				end
				v5:ClearAllChildren()
			end
		end
	end
end
function t.CompleteRepetition(p1, p2) --[[ CompleteRepetition | Line: 2178 ]]
	if not p1.Repeatable then
		return false
	end
	local v1 = p1:GetRepetitionsValue(p2)
	if not v1 then
		warn("\226\154\160\239\184\143 UnlockSequence, No Repetitions value found", p1.Name)
		return false
	end
	local v2 = p2.Player and p2.Player.UserId
	if v2 then
		p1.RepetitionInProgress[v2] = true
	end
	v1.Value = v1.Value + 1
	p1:_resetForRepetition(p2)
	if v2 then
		task.defer(function() --[[ Line: 2198 | Upvalues: p1 (copy), v2 (copy) ]]
			if not p1.RepetitionInProgress then
				return
			end
			p1.RepetitionInProgress[v2] = nil
		end)
	end
	if not p1.OnRepetitionCompleted then
		return true
	end
	p1:_runCallbacks("OnRepetitionCompleted", p2)
	return true
end
function t.ResetClaimedTiersData(p1, p2) --[[ ResetClaimedTiersData | Line: 2212 ]]
	for v1, v2 in p1.Tracks do
		local v3 = p1:_getClaimedDataFolder(p2, v2.Track)
		if v3 then
			v3:ClearAllChildren()
		end
	end
end
return t