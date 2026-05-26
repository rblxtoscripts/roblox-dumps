-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("StorageUtils")
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("RemoteUtils")
local v4 = Sonar("FormatTime")
local v5 = Sonar("InstanceUtils")
local v6 = Sonar("TableUtils")
local v7 = Sonar("Signal")
local v8 = Sonar("AnalyticsService")
local v9 = game:GetService("RunService"):IsServer()
local v10 = v1.GetConfig("GameUpdate")()
local v11 = v1.Get("UpdateLogs")()
local v12 = nil
local v13 = nil
local Gamebeast = v8:GetService("Gamebeast")
local v14 = v1.GetAssetFolder("GameUpdates")
local v15 = v5.Create("Configuration", {
	Name = "GameUpdatesReplication",
	Parent = ReplicatedStorage
}, true)
local v16 = v7.new()
function t._getLatestUpdate(p1) --[[ _getLatestUpdate | Line: 177 | Upvalues: v11 (copy), v4 (copy) ]]
	local v1 = nil
	local v2 = nil
	for k, v in pairs(v11) do
		if not (v.ReleaseTime > v4.GetTime()) and (not v1 or v1 < v.Index) then
			v1 = v.Index
			v2 = v
		end
	end
	return v2
end
function t.GetUpdateFromIndex(p1) --[[ GetUpdateFromIndex | Line: 198 | Upvalues: v11 (copy) ]]
	return v11[tonumber(p1)]
end
function t.GetUpdateLogs() --[[ GetUpdateLogs | Line: 205 | Upvalues: v11 (copy), v10 (copy) ]]
	local t = {}
	for k, v in pairs(v11) do
		table.insert(t, v)
	end
	table.sort(t, function(p1, p2) --[[ Line: 211 ]]
		return p1.Index > p2.Index
	end)
	local t2 = {}
	for i = 1, math.min(v10.MaxUpdatesToShow, #t) do
		table.insert(t2, t[i])
	end
	return t2
end
function t.GetLatestUpdate() --[[ GetLatestUpdate | Line: 226 | Upvalues: v12 (ref) ]]
	return v12
end
function t.GetLatestUpdateTime() --[[ GetLatestUpdateTime | Line: 232 | Upvalues: v12 (ref) ]]
	return v12.ReleaseTime
end
function t.GetNextUpdate() --[[ GetNextUpdate | Line: 238 | Upvalues: v13 (ref) ]]
	return v13
end
function t.GetNextUpdateTime() --[[ GetNextUpdateTime | Line: 244 | Upvalues: v13 (ref) ]]
	if v13 then
		return v13.ReleaseTime
	else
		return nil
	end
end
function t.GetTimeTillNextUpdate() --[[ GetTimeTillNextUpdate | Line: 254 | Upvalues: v13 (ref), v4 (copy) ]]
	if v13 then
		return v13.ReleaseTime - v4.GetTime()
	else
		return nil
	end
end
function t.CanShowNextUpdateCountdown() --[[ CanShowNextUpdateCountdown | Line: 264 | Upvalues: v13 (ref), v4 (copy), v10 (copy) ]]
	return v13 and v13.ReleaseTime - v4.GetTime() <= v10.TimeToShowNextUpdateCountdown
end
function t.GetLatestPlayedUpdate(p1) --[[ GetLatestPlayedUpdate | Line: 271 | Upvalues: v2 (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	if v1 then
		return v1:GetLatestPlayedUpdate()
	else
		return nil
	end
end
function t.HasPlayedUpdate(p1, p2) --[[ HasPlayedUpdate | Line: 284 | Upvalues: v2 (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	if v1 then
		return v1:HasPlayedUpdate(p2)
	else
		return false
	end
end
function t.HasPlayedLatestUpdate(p1) --[[ HasPlayedLatestUpdate | Line: 296 | Upvalues: v2 (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	if v1 then
		return v1:HasPlayedLatestUpdate()
	else
		return false
	end
end
function t.HasClaimedUpdate(p1, p2) --[[ HasClaimedUpdate | Line: 309 | Upvalues: v2 (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	if v1 then
		return v1.PlayerData.Updates.Claimed:FindFirstChild((tostring(p2)))
	else
		return false
	end
end
function t.IsUpdateClaimable(p1, p2) --[[ IsUpdateClaimable | Line: 322 | Upvalues: v2 (copy), t (copy), v4 (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	if not v1 then
		return false
	end
	local v22 = t.GetUpdateFromIndex(p2)
	if not v22 then
		return false
	end
	if not (v22.Items and next(v22.Items)) then
		return false
	end
	if v22.ClaimExpireTime <= v4.GetTime() then
		return false
	end
	if v4.GetTime() < v22.ReleaseTime then
		return false
	else
		return not t.HasClaimedUpdate(v1, v22.Index)
	end
end
function t.GetClaimableUpdates(p1) --[[ GetClaimableUpdates | Line: 355 | Upvalues: v2 (copy), v11 (copy), t (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	if not v1 then
		return {}
	end
	local t2 = {}
	for k, v in pairs(v11) do
		if t.IsUpdateClaimable(v1, v.Index) then
			table.insert(t2, v)
		end
	end
	return t2
end
function t.GetTotalClaimableUpdates(p1) --[[ GetTotalClaimableUpdates | Line: 374 | Upvalues: v2 (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	if v1 then
		return v1:GetTotalClaimableUpdates()
	else
		return 0
	end
end
function t.GetClaimableUpdatesChangedSignal(p1) --[[ GetClaimableUpdatesChangedSignal | Line: 386 | Upvalues: v2 (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	if v1 then
		return v1:GetClaimableUpdatesChangedSignal()
	else
		return nil
	end
end
function t.GetClaimableUpdateChangedSignal(p1, p2) --[[ GetClaimableUpdateChangedSignal | Line: 399 | Upvalues: v2 (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	if v1 then
		return v1:GetClaimableUpdateChangedSignal(p2)
	else
		return nil
	end
end
function t.CanClaimUpdate(p1, p2) --[[ CanClaimUpdate | Line: 412 | Upvalues: v2 (copy), t (copy), v4 (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	if not v1 then
		return "PlayerNotFound"
	end
	local v22 = t.GetUpdateFromIndex(p2)
	if not v22 then
		return "UpdateNotFound"
	end
	if not v22.Items then
		return "NoItemsToClaim"
	end
	if t.HasClaimedUpdate(v1, p2) then
		return "UpdateAlreadyClaimed"
	end
	if v4.GetTime() < v22.ReleaseTime then
		return "UpdateNotReleasedYet"
	end
	if v22.ClaimExpireTime <= v4.GetTime() then
		return "MessageClaimExpired"
	end
	local v3, v42 = v1:CanGiveItems(v22.Items)
	if v3 then
		return true, v22
	else
		return "CapacityReached" .. v42.Type
	end
end
function t.ClaimUpdate(p1, p2) --[[ ClaimUpdate | Line: 451 | Upvalues: v2 (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	if not v1 then
		return false
	end
	local v22 = Instance.new("BoolValue")
	v22.Name = tostring(p2.Index)
	v22.Value = true
	v22.Parent = v1.PlayerData.Updates.Claimed
	v1:GiveItems({
		ItemStream = true,
		IgnoreLimit = true,
		AnalyticsSource = "GameUpdate",
		Items = p2.Items,
		Actions = {
			Preset = "NewItem"
		}
	})
	if not (v1:GetLatestPlayedUpdate() < p2.Index) then
		return true
	end
	v1:SetLatestPlayedUpdate(p2.Index)
	return true
end
function t.RequestToClaimUpdate(p1) --[[ RequestToClaimUpdate | Line: 482 | Upvalues: v3 (copy) ]]
	return v3.GetRemoteFunction("ClaimUpdateRewardRemote"):InvokeServer(p1)
end
function t.RequestPlayedUpdate(p1) --[[ RequestPlayedUpdate | Line: 488 | Upvalues: v3 (copy) ]]
	return v3.GetRemoteEvent("PlayedUpdateRemote"):FireServer(p1)
end
function t.Init(p1) --[[ Init | Line: 492 | Upvalues: v2 (copy), v12 (ref), v11 (copy), v10 (copy), v15 (copy), v13 (ref), HttpService (copy), v16 (copy), v9 (copy), v14 (copy), Sonar (copy), v8 (copy), Gamebeast (copy), v6 (copy), v3 (copy), t (copy) ]]
	if not v2.IsWrapperInitialising("GameUpdateWrapper") then
		warn("\226\154\160\239\184\143 GameUpdateService, GameUpdateWrapper not found in PlayerWrapperConfig, try adding it to the PlayerWrapperConfig/Shared")
	end
	v12 = p1:_getLatestUpdate()
	for k, v in pairs(v11) do
		v.ClaimExpireTime = v.ReleaseTime + v10.TimeAfterUpdateToClaimReward
	end
	v15:GetAttributeChangedSignal("NextUpdate"):Connect(function() --[[ Line: 503 | Upvalues: v13 (ref), HttpService (ref), v15 (ref), v16 (ref) ]]
		v13 = HttpService:JSONDecode(v15:GetAttribute("NextUpdate"))
		v16:Fire(v13)
	end)
	if not v9 then
		return
	end
	if v14:FindFirstChild("NextUpdate") then
		v13 = Sonar(v14:FindFirstChild("NextUpdate"))
	end
	if v8.IsServiceEnabled("Gamebeast") then
		Gamebeast:GetService("Configs"):Observe("NextUpdate", function(p1) --[[ Line: 516 | Upvalues: v6 (ref), v13 (ref), v15 (ref), HttpService (ref) ]]
			if p1 and not v6.DeepEqual(v13, p1) then
				return
			end
			v15:SetAttribute("NextUpdate", if p1 then HttpService:JSONEncode(p1) or nil else nil)
		end)
	end
	v3.GetRemoteEvent("PlayedUpdateRemote").OnServerEvent:Connect(function(p1) --[[ Line: 527 | Upvalues: v2 (ref), v12 (ref) ]]
		local v1 = v2.getWrapperFromPlayer(p1)
		if v1 then
			v1:SetLatestPlayedUpdate(v12.Index)
		end
	end)
	v3.GetRemoteFunction("ClaimUpdateRewardRemote").OnServerInvoke = function(p1, p2) --[[ Line: 536 | Upvalues: v2 (ref), t (ref) ]]
		local v1 = v2.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v22, v3 = t.CanClaimUpdate(v1, p2)
		if v22 ~= true then
			return v22
		end
		local v4 = t.ClaimUpdate(v1, v3)
		if v4 then
			return v4
		end
	end
end
t:Init()
return t