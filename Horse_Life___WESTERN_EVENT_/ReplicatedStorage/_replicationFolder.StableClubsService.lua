-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextService = game:GetService("TextService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("StableClubsManager", {
	Deferred = true,
	Context = "Server"
})
local v2 = Sonar("StorageUtils")
local v3 = Sonar("Table")
local v4 = Sonar("InstanceUtils")
local v5 = Sonar("Club")
local v6 = Sonar("MissionsService")
local IsClient = Sonar("Constants").IsClient
local v7 = Sonar(v2.Get("StableClubs"))
local v8 = Sonar(v2.Get("MiscProducts"))
local ProductId = v8.ClubSpots1.ProductId
local ProductId_2 = v8.ClubSpots2.ProductId
local ProductId_3 = v8.ClubSpots3.ProductId
local t2 = {
	Name = {
		MinLength = 3,
		MaxLength = 20
	},
	About = {
		MaxLength = 300
	}
}
local t3 = {
	Breed = 300,
	Foal = 300,
	Tame = 150,
	Elder = 1000,
	Harvest = 150,
	BondRequest = 150
}
local t4 = {
	{
		Position = 10,
		Rewards = {
			{
				Name = "ClubChestTier3",
				Amount = 1
			}
		}
	},
	{
		Position = 20,
		Rewards = {
			{
				Name = "ClubChestTier2",
				Amount = 1
			}
		}
	},
	{
		Position = 30,
		Rewards = {
			{
				Name = "ClubChestTier1",
				Amount = 1
			}
		}
	}
}
local v9 = v4.Create("Folder", {
	Name = "StableClubs",
	Parent = ReplicatedStorage
}, true)
local function isFiltered(p1, p2) --[[ isFiltered | Line: 81 | Upvalues: IsClient (copy), TextService (copy) ]]
	if IsClient then
		return false
	end
	return TextService:FilterStringAsync(p2, p1.UserId):GetNonChatStringForBroadcastAsync() ~= p2
end
local function isValidUtf8(p1) --[[ isValidUtf8 | Line: 93 ]]
	if type(p1) ~= "string" then
		return false
	end
	local v1 = pcall(function() --[[ Line: 98 | Upvalues: p1 (copy) ]]
		return utf8.len(p1) ~= nil
	end)
	return if v1 then utf8.len(p1) ~= nil else v1
end
local function getHighestRole() --[[ getHighestRole | Line: 106 | Upvalues: t (copy) ]]
	local v1 = nil
	for v2, v3 in t.GetAllRoles() do
		if not v1 or v3.RoleId > v1.RoleId then
			v1 = v3
		end
	end
	return v1
end
local function getLowestRole() --[[ getLowestRole | Line: 120 | Upvalues: t (copy) ]]
	local v1 = nil
	for v2, v3 in t.GetAllRoles() do
		if not v1 or v3.RoleId < v1.RoleId then
			v1 = v3
		end
	end
	return v1
end
function t.GetAll() --[[ GetAll | Line: 134 | Upvalues: v7 (copy) ]]
	return v7
end
function t.GetAllBanners() --[[ GetAllBanners | Line: 139 | Upvalues: v7 (copy) ]]
	return v7.Banners
end
function t.GetAllIcons() --[[ GetAllIcons | Line: 144 | Upvalues: v7 (copy) ]]
	return v7.Icons
end
function t.GetAllStatuses() --[[ GetAllStatuses | Line: 149 | Upvalues: v7 (copy) ]]
	return v7.Statuses
end
function t.GetAllRoles() --[[ GetAllRoles | Line: 154 | Upvalues: v7 (copy) ]]
	return v7.Roles
end
function t.GetAllPrivacySettings() --[[ GetAllPrivacySettings | Line: 159 | Upvalues: v7 (copy) ]]
	return v7.PrivacySettings
end
function t.GetAllRewards() --[[ GetAllRewards | Line: 164 | Upvalues: v7 (copy) ]]
	return v7.Rewards
end
function t.GetAllRestrictedTerms() --[[ GetAllRestrictedTerms | Line: 169 | Upvalues: v7 (copy) ]]
	return v7.RestrictedTerms
end
function t.GetClubData(p1) --[[ GetClubData | Line: 174 | Upvalues: v9 (copy) ]]
	return v9:FindFirstChild(p1)
end
function t.GetAllClubData() --[[ GetAllClubData | Line: 179 | Upvalues: v9 (copy) ]]
	return v9:GetChildren()
end
function t.GetPlayersClub(p1) --[[ GetPlayersClub | Line: 184 ]]
	return p1.PlayerData.StableClubs.ClubId
end
function t.HasClub(p1) --[[ HasClub | Line: 189 | Upvalues: t (copy) ]]
	return #t.GetPlayersClub(p1).Value > 0
end
function t.ConvertRole(p1, p2) --[[ ConvertRole | Line: 195 | Upvalues: t (copy) ]]
	local v1 = t.GetAllRoles()
	local v2 = v1[p1]
	if not v2 then
		return nil
	end
	local v3 = v2.RoleId + p2
	for v4, v5 in v1 do
		if v5.RoleId == v3 then
			return v5
		end
	end
	return nil
end
function t.RoleHasPermission(p1, p2) --[[ RoleHasPermission | Line: 213 | Upvalues: t (copy) ]]
	return t.GetAllRoles()[p1][p2]
end
function t.CanCreateClub(p1, p2) --[[ CanCreateClub | Line: 219 | Upvalues: t (copy) ]]
	if p2 then
		local v1 = t.ValidateClubData(p1, p2)
		if v1 ~= true then
			return v1
		end
	end
	if t.HasClub(p1) then
		return "AlreadyHasClub"
	end
	local v2
	if p2 and not p2.WithRobux then
		local v3 = p1:CanAfford(60000, "Coins")
		if not v3 then
			return "NotEnoughCoins", 60000
		end
		v2 = v3
	else
		v2 = nil
	end
	return true, v2
end
function t.CanAwardClubPoints(p1, p2) --[[ CanAwardClubPoints | Line: 243 | Upvalues: t (copy), v5 (copy), t3 (copy) ]]
	if not t.HasClub(p1) then
		return false
	end
	local v2 = v5.GetById(t.GetPlayersClub(p1).Value)
	if not v2 then
		return false
	end
	local v3 = v2:GetMemberData(p1.Player.UserId)
	if not (v3 and v3.JoinedAt) then
		return false
	end
	local v4 = p1.PlayerData.StableClubs.Cooldowns:FindFirstChild(p2)
	if v4 and v4.Value > workspace:GetServerTimeNow() then
		return false
	end
	local v52 = p1.PlayerData.StableClubs.DailyPoints:FindFirstChild(p2)
	if v52 and v52.Value >= (t3[p2] or 1) then
		return false
	end
	local v6 = workspace:GetServerTimeNow()
	local v7 = if v6 - v3.JoinedAt >= 86400 then true else false
	local v8 = v2:GetProperty("CreatedAt")
	return v7 or (if v8 then v6 - v8 < 259200 else v8)
end
function t.ValidateClubData(p1, p2, p3) --[[ ValidateClubData | Line: 279 | Upvalues: v1 (copy), IsClient (copy), TextService (copy), t2 (copy), v7 (copy) ]]
	if p2.Name then
		p2.Name = v1.TrimName(p2.Name)
	end
	if p2.About then
		p2.About = v1.TrimName(p2.About)
	end
	if p2.Name then
		local v12 = p2.Name
		local v2
		if type(v12) == "string" then
			local v3 = pcall(function() --[[ Line: 98 | Upvalues: v12 (copy) ]]
				return utf8.len(v12) ~= nil
			end)
			v2 = if v3 then utf8.len(v12) ~= nil else v3
		else
			v2 = false
		end
		if not v2 then
			return "InvalidCharacters"
		end
	end
	if p2.About then
		local About = p2.About
		local v4
		if type(About) == "string" then
			local v5 = pcall(function() --[[ Line: 98 | Upvalues: About (copy) ]]
				return utf8.len(About) ~= nil
			end)
			v4 = if v5 then utf8.len(About) ~= nil else v5
		else
			v4 = false
		end
		if not v4 then
			return "InvalidCharacters"
		end
	end
	if p2.Name and v1.ContainsRestrictedTerm(p2.Name) then
		return "NameContainsRestrictedTerm"
	end
	local v6 = p2.Name
	if if IsClient then false elseif TextService:FilterStringAsync(v6, p1.Player.UserId):GetNonChatStringForBroadcastAsync() == v6 then false else true then
		return "NameIsFiltered"
	end
	local About = p2.About
	if if IsClient then false elseif TextService:FilterStringAsync(About, p1.Player.UserId):GetNonChatStringForBroadcastAsync() == About then false else true then
		return "AboutIsFiltered"
	end
	for v9, v10 in p2 do
		local v11 = t2[v9]
		if v11 then
			if v11.MinLength and #v10 < v11.MinLength then
				return string.format("%sIsTooShort", v9)
			end
			if v11.MaxLength and #v10 > v11.MaxLength then
				return string.format("%sIsTooLong", v9)
			end
		end
	end
	if p2.CurrentIcon == nil then
		return "InvalidIcon"
	end
	if not v7.Icons[p2.CurrentIcon] then
		return "InvalidIcon"
	end
	if p2.CurrentBanner == nil then
		return "InvalidBanner"
	end
	if not v7.Banners[p2.CurrentBanner] then
		return "InvalidBanner"
	end
	if p2.Status == nil then
		return "InvalidStatus"
	end
	if not table.find(v7.Statuses, p2.Status) then
		return "InvalidStatus"
	end
	if p2.Privacy == nil then
		return "InvalidPrivacy"
	end
	if not table.find(v7.PrivacySettings, p2.Privacy) then
		return "InvalidPrivacy"
	end
	if p3 and p2.Name == p3.Name then
		return true
	end
	if v1.IsNameUnique(p2.Name) then
		return true
	else
		return "NameIsNotUnique"
	end
end
function t.GetCapacityTier(p1) --[[ GetCapacityTier | Line: 370 ]]
	return math.ceil((p1 or 4) / 4)
end
function t.GetTierMultiplier(p1) --[[ GetTierMultiplier | Line: 378 | Upvalues: t (copy) ]]
	return t.GetCapacityTier(p1)
end
function t.ScaleRewardAmount(p1, p2) --[[ ScaleRewardAmount | Line: 384 | Upvalues: t (copy) ]]
	return p1 * t.GetTierMultiplier(p2)
end
function t.ScaleGoalAmount(p1, p2) --[[ ScaleGoalAmount | Line: 391 | Upvalues: t (copy) ]]
	return p1 * t.GetTierMultiplier(p2)
end
function t.GetTierInfo(p1, p2) --[[ GetTierInfo | Line: 397 | Upvalues: t (copy) ]]
	local v1 = t.GetAllRewards()
	local v2 = t.GetTierMultiplier(p2)
	local v3 = #v1
	local v5 = 0
	for i = 1, v3 do
		if not (v1[i].Goal * v2 <= p1) then
			break
		end
		v5 = i
	end
	local v6 = v5 < v3 and v5 + 1 or v3
	local v7 = v5 < v3 and v1[v6].Goal * v2 or math.max(p1, v1[v3].Goal * v2)
	local v8 = v5 > 0 and v1[v5].Goal * v2 or 0
	local v9 = v7 - v8
	local v10 = v9 > 0 and math.clamp((p1 - v8) / v9, 0, 1) or 1
	return v5, v6, v7, if v3 <= v5 then 1 else math.clamp(v5 / v3 + v10 * (1 / v3), 0, 1), v10
end
function t.GetStableRewardSeed(p1) --[[ GetStableRewardSeed | Line: 435 ]]
	return p1.PlayerData.StableClubs.Rewards.CurrentSeed
end
function t.GetStableRewardTier(p1, p2) --[[ GetStableRewardTier | Line: 440 ]]
	return p1.PlayerData.StableClubs.Rewards:FindFirstChild(p2)
end
function t.CanClaimTierReward(p1, p2) --[[ CanClaimTierReward | Line: 445 | Upvalues: t (copy), v5 (copy), v6 (copy) ]]
	local v1 = t.GetAllRewards()[p2]
	if not v1 then
		return "AnErrorOccurred", 0
	end
	local Goal = v1.Goal
	local v2 = t.GetPlayersClub(p1)
	if not t.HasClub(p1) then
		return "NotInClub", Goal
	end
	local v3 = v5.GetById(v2.Value)
	if not v3 then
		return "AnErrorOccurred", Goal
	end
	if v3:GetCurrentTier() < p2 then
		return "ClubTierNotUnlocked", v3:ScaleGoalForCapacity(Goal)
	end
	local v4 = v3:GetMemberData(p1.Player.UserId)
	if not v4 then
		return "AnErrorOccurred", v3:ScaleGoalForCapacity(Goal)
	end
	local Contribution = v4.Contribution
	if not Contribution or (Contribution.Seed ~= v6.StableClubMissionTimer.CurrentSeed or Contribution.Points <= 0) then
		return "NotEligible", v3:ScaleGoalForCapacity(Goal)
	end
	local v52 = t.GetStableRewardTier(p1, p2)
	if v52.Value then
		return "AlreadyClaimed", "Claimed"
	else
		return true, v52
	end
end
function t.GetLeaderboardRewards() --[[ GetLeaderboardRewards | Line: 500 | Upvalues: t4 (copy) ]]
	return t4
end
function t.GetDailyPointCaps() --[[ GetDailyPointCaps | Line: 504 | Upvalues: t3 (copy) ]]
	return t3
end
function t.GetMaxLeaderboardRewardPosition() --[[ GetMaxLeaderboardRewardPosition | Line: 510 | Upvalues: t4 (copy) ]]
	local v1 = 0
	for v2, v3 in t4 do
		if v1 < v3.Position then
			v1 = v3.Position
		end
	end
	return v1
end
function t.GetRewardsForPosition(p1) --[[ GetRewardsForPosition | Line: 523 | Upvalues: t4 (copy) ]]
	if not p1 or p1 < 1 then
		return nil
	end
	local t = {}
	local t2 = {}
	for v1, v2 in t4 do
		table.insert(t, v2)
	end
	table.sort(t, function(p1, p2) --[[ Line: 535 ]]
		return p1.Position < p2.Position
	end)
	for v3, v4 in t do
		if p1 <= v4.Position then
			for v5, v6 in v4.Rewards do
				table.insert(t2, v6)
			end
		end
	end
	return if #t2 > 0 then t2 else nil
end
function t.GetSeedStartTime(p1) --[[ GetSeedStartTime | Line: 553 | Upvalues: v6 (copy) ]]
	local StableClubMissionTimer = v6.StableClubMissionTimer
	return StableClubMissionTimer.StartTime + StableClubMissionTimer.Duration * (p1 - 1)
end
function t.GetUpgradePriceForCapacity(p1) --[[ GetUpgradePriceForCapacity | Line: 559 | Upvalues: ProductId (copy), ProductId_2 (copy), ProductId_3 (copy) ]]
	if p1 == 4 or p1 == 8 then
		return 20000, ProductId
	end
	if p1 == 12 then
		return 35000, ProductId_2
	else
		return 45000, ProductId_3
	end
end
function t.GetLastLeaderboardRewardClaimed(p1) --[[ GetLastLeaderboardRewardClaimed | Line: 571 ]]
	return p1.PlayerData.StableClubs.LastLeaderboardRewardClaimed
end
t.CREATE_CLUB_PRICE = 60000
t.REPLICATION_FOLDER = v9
t.DEFAULT_CAPACITY = 4
t.MAX_CAPACITY = 20
t.CAPACITY_PER_TIER = 4
local v10 = nil
for v11, v12 in t.GetAllRoles() do
	if not v10 or v12.RoleId > v10.RoleId then
		v10 = v12
	end
end
t.HIGHEST_ROLE = v10
local v13 = nil
for v14, v15 in t.GetAllRoles() do
	if not v13 or v15.RoleId < v13.RoleId then
		v13 = v15
	end
end
t.LOWEST_ROLE = v13
t.DEFAULT_ROLE = v3.Find(v7.Roles, function(p1, p2) --[[ Line: 582 ]]
	return p2.Default
end)
return t