-- https://lua.expert/
local t = {}
local AdService = game:GetService("AdService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("TaskScheduler")
local v3 = Sonar("Signal")
local v4 = Sonar("StorageUtils")
local v5 = game:GetService("RunService"):IsServer()
local v6 = v4.GetConfig("Marketplace")()
local t2 = {
	Enum.AdAvailabilityResult.PlayerIneligible,
	Enum.AdAvailabilityResult.DeviceIneligible,
	Enum.AdAvailabilityResult.PublisherIneligible,
	Enum.AdAvailabilityResult.ExperienceIneligible
}
local t3 = {}
local CheckAvailableAdsRefreshRate = v6.CheckAvailableAdsRefreshRate
local v7 = v1.GetRemoteFunction("ShowRewardedVideoAdRemote")
local v8 = false
local v9 = v3.new()
local t4 = {}
local function isIneligible(p1) --[[ isIneligible | Line: 89 | Upvalues: t2 (copy) ]]
	for i, v in ipairs(t2) do
		if p1 == v then
			return true
		end
	end
	return false
end
function t.RefreshAvailableAds() --[[ RefreshAvailableAds | Line: 99 | Upvalues: AdService (copy), t2 (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 100 | Upvalues: AdService (ref) ]]
		return AdService:GetAdAvailabilityNowAsync(Enum.AdFormat.RewardedVideo)
	end)
	if not v1 then
		warn("\226\154\160\239\184\143 AdService, Error checking for available ads:", v2)
		return false
	end
	local AdAvailabilityResult = v2.AdAvailabilityResult
	local v3 = false
	for i, v in ipairs(t2) do
		if AdAvailabilityResult == v then
			v3 = true
			break
		end
	end
	if v3 then
		return false
	else
		return v2.AdAvailabilityResult == Enum.AdAvailabilityResult.IsAvailable
	end
end
function t.UpdateAvailableAds() --[[ UpdateAvailableAds | Line: 117 | Upvalues: t (copy), v8 (ref), v9 (copy) ]]
	local v1 = t.RefreshAvailableAds()
	if v8 == v1 then
		print("\240\159\148\132 AdService, Available ads status:", v8)
		return
	end
	v8 = v1
	v9:Fire(v1)
	print("\240\159\148\132 AdService, Available ads status:", v1)
end
function t.GetAvailableAdsChangedSignal() --[[ GetAvailableAdsChangedSignal | Line: 127 | Upvalues: v9 (copy) ]]
	return v9
end
function t.HasAvailableAds() --[[ HasAvailableAds | Line: 131 | Upvalues: v8 (ref) ]]
	return v8
end
function t.GetAdvertFromId(p1) --[[ GetAdvertFromId | Line: 135 | Upvalues: t3 (copy) ]]
	return t3[p1]
end
function t.CreateRewardFromProductId(p1) --[[ CreateRewardFromProductId | Line: 139 | Upvalues: t4 (copy), AdService (copy) ]]
	local v1 = t4[p1]
	if not v1 then
		local v2 = AdService:CreateAdRewardFromDevProductId(p1)
		t4[p1] = v2
		v1 = v2
	end
	return v1
end
function t.ShowRewardedVideoAd(p1, p2) --[[ ShowRewardedVideoAd | Line: 148 | Upvalues: t (copy), v5 (copy), AdService (copy), v7 (copy) ]]
	local v1 = t.GetAdvertFromId(p2)
	if not v1 then
		warn("\226\154\160\239\184\143 AdService, Advert not found:", p2)
		return false
	end
	if v5 then
		local ProductId = v1.ProductId
		local v2, v3 = pcall(function() --[[ Line: 159 | Upvalues: t (ref), ProductId (copy), AdService (ref), p1 (copy) ]]
			return AdService:ShowRewardedVideoAdAsync(p1, (t.CreateRewardFromProductId(ProductId)))
		end)
		if v2 then
			return v2 and v3
		else
			warn("\226\154\160\239\184\143 AdService, Error watching ad:", v3)
		end
	else
		local v4, v52 = pcall(function() --[[ Line: 170 | Upvalues: v7 (ref), p2 (copy) ]]
			return v7:InvokeServer(p2)
		end)
		if not v4 then
			warn("\226\154\160\239\184\143 AdService, Error watching ad:", v52)
			return
		end
		if v52 == Enum.ShowAdResult.ShowCompleted then
			return true, v52
		else
			return false, v52
		end
	end
end
function t.Init(p1) --[[ Init | Line: 188 | Upvalues: v5 (copy), v7 (copy), t (copy), v2 (copy), CheckAvailableAdsRefreshRate (copy) ]]
	if v5 then
		function v7.OnServerInvoke(p1, p2) --[[ Line: 190 | Upvalues: t (ref) ]]
			return t.ShowRewardedVideoAd(p1, p2)
		end
	else
		v2.Interval(CheckAvailableAdsRefreshRate, t.UpdateAvailableAds, nil, true)
		t.UpdateAvailableAds()
	end
end
t:Init()
return t