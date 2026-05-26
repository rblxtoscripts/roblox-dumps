-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("GameUpdateService")
local v2 = Sonar("Signal")
local v3 = Sonar("FormatTime")
local v4 = Sonar("TableUtils")
local v5 = game:GetService("RunService"):IsServer()
function t.new(p1) --[[ new | Line: 73 | Upvalues: t (copy), v5 (copy), v1 (copy), v4 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.PlayerWrapper = p1
	v2.Player = v2.PlayerWrapper.Player
	v2.Maid = p1.Maid
	if v2.PlayerWrapper:IsLocalOrServer() then
		v2.UpdatesData = v2.PlayerWrapper.PlayerData.Updates
		if v5 then
			local v3 = v1.GetUpdateLogs()
			for v42, v52 in v2.UpdatesData.Claimed:GetChildren() do
				if not v4.Find(v3, function(p1, p2) --[[ Line: 88 | Upvalues: v52 (copy) ]]
					return p2.Index == tonumber(v52.Name)
				end) then
					v52:Destroy()
				end
			end
		end
	end
	return v2
end
function t.GetLatestPlayedUpdate(p1) --[[ GetLatestPlayedUpdate | Line: 102 ]]
	return p1.UpdatesData.LastPlayedUpdate.Value
end
function t.HasPlayedUpdate(p1, p2) --[[ HasPlayedUpdate | Line: 109 ]]
	return p2 <= p1.UpdatesData.LastPlayedUpdate.Value
end
function t.HasPlayedLatestUpdate(p1) --[[ HasPlayedLatestUpdate | Line: 115 | Upvalues: v1 (copy) ]]
	return p1.UpdatesData.LastPlayedUpdate.Value >= v1.GetLatestUpdate().Index
end
function t.SetLatestPlayedUpdate(p1, p2) --[[ SetLatestPlayedUpdate | Line: 121 ]]
	p1.UpdatesData.LastPlayedUpdate.Value = p2
end
function t.GetTotalClaimableUpdates(p1) --[[ GetTotalClaimableUpdates | Line: 127 | Upvalues: v1 (copy) ]]
	return #v1.GetClaimableUpdates(p1.Player)
end
function t.GetClaimableUpdatesChangedSignal(p1) --[[ GetClaimableUpdatesChangedSignal | Line: 133 | Upvalues: v2 (copy), v1 (copy) ]]
	if not p1.ClaimableUpdatesChangedSignal then
		local v12 = v2.new()
		local function getTotalToClaim() --[[ getTotalToClaim | Line: 137 | Upvalues: p1 (copy) ]]
			return p1:GetTotalClaimableUpdates()
		end
		local v22 = p1:GetTotalClaimableUpdates()
		local function totalToClaimChanged() --[[ totalToClaimChanged | Line: 142 | Upvalues: p1 (copy), v22 (ref), v12 (copy) ]]
			local v1 = p1:GetTotalClaimableUpdates()
			if v1 == v22 then
				return
			end
			v22 = v1
			v12:Fire()
		end
		for v3, v4 in v1.GetUpdateLogs() do
			v12.Maid:GiveTask(p1:GetClaimableUpdateChangedSignal(v4):Connect(totalToClaimChanged))
		end
		p1.ClaimableUpdatesChangedSignal = v12
	end
	return p1.ClaimableUpdatesChangedSignal
end
function t.GetClaimableUpdateChangedSignal(p1, p2) --[[ GetClaimableUpdateChangedSignal | Line: 160 | Upvalues: v2 (copy), v1 (copy), v3 (copy) ]]
	local v12 = v2.new()
	local v32 = type(p2) == "table" and p2 or v1.GetUpdateFromIndex(p2)
	local function getClaimableState() --[[ getClaimableState | Line: 164 | Upvalues: v1 (ref), p1 (copy), v32 (ref) ]]
		return v1.IsUpdateClaimable(p1.PlayerWrapper, v32.Index)
	end
	local v4 = v1.IsUpdateClaimable(p1.PlayerWrapper, v32.Index)
	local function claimableUpdateChanged() --[[ claimableUpdateChanged | Line: 169 | Upvalues: v1 (ref), p1 (copy), v32 (ref), v4 (ref), v12 (copy) ]]
		local v13 = v1.IsUpdateClaimable(p1.PlayerWrapper, v32.Index)
		if v13 == v4 then
			return
		end
		v4 = v13
		v12:Fire()
	end
	v12.Maid:GiveTask(p1.UpdatesData.Claimed.ChildAdded:Connect(function(p12) --[[ Line: 176 | Upvalues: v32 (ref), v1 (ref), p1 (copy), v4 (ref), v12 (copy) ]]
		if p12.Name ~= tostring(v32.Index) then
			return
		end
		local v2 = v1.IsUpdateClaimable(p1.PlayerWrapper, v32.Index)
		if v2 == v4 then
			return
		end
		v4 = v2
		v12:Fire()
	end))
	v12.Maid:GiveTask(p1.UpdatesData.Claimed.ChildRemoved:Connect(function(p12) --[[ Line: 181 | Upvalues: p1 (copy), v32 (ref), v1 (ref), v4 (ref), v12 (copy) ]]
		if not p1.Player.Parent then
			return
		end
		if p12.Name ~= tostring(v32.Index) then
			return
		end
		local v2 = v1.IsUpdateClaimable(p1.PlayerWrapper, v32.Index)
		if v2 == v4 then
			return
		end
		v4 = v2
		v12:Fire()
	end))
	v12.Maid._timeExpired = v3.OnTimeChanged(function() --[[ Line: 190 | Upvalues: v32 (ref), v3 (ref), v1 (ref), p1 (copy), v4 (ref), v12 (copy) ]]
		if not (v32.ClaimExpireTime <= v3.GetTime()) then
			return
		end
		local v13 = v1.IsUpdateClaimable(p1.PlayerWrapper, v32.Index)
		if v13 ~= v4 then
			v4 = v13
			v12:Fire()
		end
		v12.Maid._timeExpired = nil
	end)
	return v12
end
return t