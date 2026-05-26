-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("StipendService")
local v2 = Sonar("GamePermissionsService")
local v3 = Sonar("BadgeService")
local v4 = Sonar("Signal")
local v5 = Sonar("FormatTime")
function t.new(p1) --[[ new | Line: 15 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = p1.Maid
	v2.Player = p1.Player
	v2.PlayerWrapper = p1
	return v2
end
function t.HasAnyStipendPermission(p1) --[[ HasAnyStipendPermission | Line: 25 | Upvalues: v1 (copy) ]]
	for v12, v2 in v1.GetAllStipends() do
		if v1.HasStipendPermission(p1.PlayerWrapper, v12) then
			return true
		end
	end
	return false
end
function t.GetTotalClaimableStipends(p1) --[[ GetTotalClaimableStipends | Line: 35 | Upvalues: v1 (copy) ]]
	local count = 0
	for v12, v2 in v1.GetAllStipends() do
		if v1.IsStipendClaimable(p1.PlayerWrapper, v12) then
			count = count + 1
		end
	end
	return count
end
function t.GetClaimableStipendsChangedSignal(p1) --[[ GetClaimableStipendsChangedSignal | Line: 46 | Upvalues: v4 (copy), v1 (copy) ]]
	if not p1.ClaimableStipendsChangedSignal then
		local v12 = v4.new()
		local function getTotalToClaim() --[[ getTotalToClaim | Line: 50 | Upvalues: p1 (copy) ]]
			return p1:GetTotalClaimableStipends()
		end
		local v2 = p1:GetTotalClaimableStipends()
		local function totalToClaimChanged() --[[ totalToClaimChanged | Line: 55 | Upvalues: p1 (copy), v2 (ref), v12 (copy) ]]
			local v1 = p1:GetTotalClaimableStipends()
			if v1 == v2 then
				return
			end
			v2 = v1
			v12:Fire()
		end
		for v3, v42 in v1.GetAllStipends() do
			v12.Maid:GiveTask(p1:GetClaimableStipendChangedSignal(v3):Connect(totalToClaimChanged))
		end
		p1.ClaimableStipendsChangedSignal = v12
	end
	return p1.ClaimableStipendsChangedSignal
end
function t.GetClaimableStipendChangedSignal(p1, p2) --[[ GetClaimableStipendChangedSignal | Line: 73 | Upvalues: v1 (copy), v4 (copy), v2 (copy), v3 (copy), v5 (copy) ]]
	local v12 = v1.GetStipendFromName(p2)
	local v22 = v4.new()
	local function getClaimableState() --[[ getClaimableState | Line: 77 | Upvalues: v1 (ref), p1 (copy), p2 (copy) ]]
		return v1.IsStipendClaimable(p1.PlayerWrapper, p2)
	end
	local v32 = v1.IsStipendClaimable(p1.PlayerWrapper, p2)
	local function claimableStipendChanged() --[[ claimableStipendChanged | Line: 82 | Upvalues: v1 (ref), p1 (copy), p2 (copy), v32 (ref), v22 (copy) ]]
		local v12 = v1.IsStipendClaimable(p1.PlayerWrapper, p2)
		if v12 == v32 then
			return
		end
		v32 = v12
		v22:Fire()
	end
	local v42 = v1.GetStipendValue(p1.PlayerWrapper, p2)
	for v6, v7 in type(v12.Permission) == "table" and v12.Permissions or { v12.Permissions } do
		v22.Maid:GiveTask(v2.GetPermissionChangedSignal(p1.PlayerWrapper.Player, v7):Connect(claimableStipendChanged))
	end
	for v9, v10 in type(v12.Badge) == "table" and v12.Badge or { v12.Badge } do
		v22.Maid:GiveTask(v3.GetBadgeChangedSignal(p1.Player, v10):Connect(claimableStipendChanged))
	end
	v22.Maid:GiveTask(v42:GetPropertyChangedSignal("Value"):Connect(claimableStipendChanged))
	v22.Maid:GiveTask(v5.OnTimeChanged(function() --[[ Line: 97 | Upvalues: v1 (ref), p1 (copy), p2 (copy), v5 (ref), v32 (ref), v22 (copy) ]]
		if not (v1.GetStipendClaimTime(p1.PlayerWrapper, p2) <= v5.GetTime()) then
			return
		end
		local v12 = v1.IsStipendClaimable(p1.PlayerWrapper, p2)
		if v12 == v32 then
			return
		end
		v32 = v12
		v22:Fire()
	end))
	return v22
end
return t