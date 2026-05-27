-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("DataUpdateService", {
	Context = "Server"
})
local v2 = Sonar("StorageUtils")
local v3 = Sonar("InstanceUtils")
local v4 = Sonar("RemoteUtils")
local v5 = Sonar("PlayerWrapper")
local v6 = Sonar("NotificationsService")
local v7 = Sonar("FormatTime")
local v8 = Sonar("GamePermissionsService")
local v9 = Sonar("BadgeService")
local v10 = Sonar("LootboxService")
local v11 = v2.GetConfig("Stipend")()
local v12 = v2.Get("Stipends")()
local v13 = game:GetService("RunService"):IsServer()
local t2 = {
	StipendNotFound = "This stipend is not found!",
	StipendNotAvailable = "This stipend is not available yet!",
	StipendPermissionDenied = "You do not have permission to claim this stipend!"
}
function t.GetAllStipends() --[[ GetAllStipends | Line: 30 | Upvalues: v12 (copy) ]]
	return v12
end
function t.GetStipendFromName(p1) --[[ GetStipendFromName | Line: 34 | Upvalues: v12 (copy) ]]
	return v12[p1]
end
function t.GetStipendValue(p1, p2) --[[ GetStipendValue | Line: 38 | Upvalues: v5 (copy) ]]
	local v1 = v5.getWrapperFromPlayer(p1)
	if v1 then
		return v1.PlayerData.Stipends:FindFirstChild(p2)
	else
		return nil
	end
end
function t.GetStipendItems(p1) --[[ GetStipendItems | Line: 47 | Upvalues: t (copy) ]]
	local v1 = t.GetStipendFromName(p1)
	if v1 then
		return v1.Lootbox:Roll()
	else
		return nil
	end
end
function t.GetStipendClaimTime(p1, p2) --[[ GetStipendClaimTime | Line: 56 | Upvalues: v5 (copy), t (copy) ]]
	local v1 = v5.getWrapperFromPlayer(p1)
	if not v1 then
		return nil
	end
	local v2 = t.GetStipendFromName(p2)
	if not v2 then
		return nil
	end
	local v3 = t.GetStipendValue(v1, p2)
	if v3 then
		return v3.Value + v2.Duration
	else
		return nil
	end
end
function t.IsStipendClaimable(p1, p2) --[[ IsStipendClaimable | Line: 75 | Upvalues: v5 (copy), t (copy), v7 (copy) ]]
	local v1 = v5.getWrapperFromPlayer(p1)
	if not v1 then
		return false
	end
	local v2 = t.GetStipendClaimTime(v1, p2)
	if not v2 then
		return false
	end
	if not t.HasStipendPermission(v1, p2) then
		return false
	end
	return v2 <= v7.GetTime()
end
function t.HasStipendPermission(p1, p2) --[[ HasStipendPermission | Line: 93 | Upvalues: v5 (copy), t (copy), v8 (copy), v9 (copy) ]]
	local v1 = v5.getWrapperFromPlayer(p1)
	if not v1 then
		return false
	end
	local v2 = t.GetStipendFromName(p2)
	if not v2 then
		return false
	end
	for v4, v52 in type(v2.Permission) == "table" and v2.Permission or { v2.Permission } do
		if v8.HasPermission(v1.Player, v52) then
			return true
		end
	end
	for v7, v82 in type(v2.Badge) == "table" and v2.Badge or { v2.Badge } do
		if v9.DoesPlayerOwnBadge(v1.Player, v82) then
			return true
		end
	end
	return false
end
function t.HasAnyStipendPermission(p1) --[[ HasAnyStipendPermission | Line: 121 | Upvalues: v5 (copy) ]]
	local v1 = v5.getWrapperFromPlayer(p1)
	if v1 then
		return v1:HasAnyStipendPermission()
	else
		return false
	end
end
function t.CanClaimStipend(p1, p2) --[[ CanClaimStipend | Line: 130 | Upvalues: v5 (copy), t (copy), v7 (copy) ]]
	local v1 = v5.getWrapperFromPlayer(p1)
	if not v1 then
		return "PlayerNotFound"
	end
	local v2 = t.GetStipendFromName(p2)
	if not v2 then
		return "StipendNotFound"
	end
	if not t.GetStipendValue(v1, p2) then
		return "StipendNotFound"
	end
	if not t.HasStipendPermission(v1, p2) then
		return "StipendPermissionDenied"
	end
	if v7.GetTime() < t.GetStipendClaimTime(v1, p2) then
		return "StipendNotAvailable"
	end
	local v3 = t.GetStipendItems(p2)
	local v4, v52 = v1:CanGiveItems(v3)
	if v4 then
		return true, v2, v3
	else
		return "CapacityReached" .. v52.Type
	end
end
function t.ClaimStipend(p1, p2, p3) --[[ ClaimStipend | Line: 164 | Upvalues: v5 (copy), t (copy), v7 (copy) ]]
	local v1 = v5.getWrapperFromPlayer(p1)
	if v1 then
		t.GetStipendValue(v1, p2.Name).Value = v7.GetTime()
		v1:GiveItems({
			ItemStream = true,
			IgnoreLimit = true,
			Items = p3,
			Actions = {
				Preset = "NewItem"
			},
			AnalyticsSource = "Stipend-" .. p2.Name
		})
		return true
	else
		return false
	end
end
function t.RequestToClaimStipend(p1) --[[ RequestToClaimStipend | Line: 186 | Upvalues: v4 (copy) ]]
	return v4.GetRemoteFunction("ClaimStipendRemote"):InvokeServer(p1)
end
function t.GetTotalClaimableStipends(p1) --[[ GetTotalClaimableStipends | Line: 190 | Upvalues: v5 (copy) ]]
	local v1 = v5.getWrapperFromPlayer(p1)
	if v1 then
		return v1:GetTotalClaimableStipends()
	else
		return 0
	end
end
function t.GetClaimableStipendsChangedSignal(p1) --[[ GetClaimableStipendsChangedSignal | Line: 199 | Upvalues: v5 (copy) ]]
	local v1 = v5.getWrapperFromPlayer(p1)
	if v1 then
		return v1:GetClaimableStipendsChangedSignal()
	else
		return nil
	end
end
function t.GetClaimableStipendChangedSignal(p1, p2) --[[ GetClaimableStipendChangedSignal | Line: 208 | Upvalues: v5 (copy) ]]
	local v1 = v5.getWrapperFromPlayer(p1)
	if v1 then
		return v1:GetClaimableStipendChangedSignal(p2)
	else
		return nil
	end
end
function t.Init(p1) --[[ Init | Line: 217 | Upvalues: v5 (copy), v6 (copy), t2 (copy), v12 (copy), v11 (copy), v10 (copy), v13 (copy), v4 (copy), t (copy), v1 (copy), v3 (copy) ]]
	if not v5.IsWrapperInitialising("StipendWrapper") then
		warn("\226\154\160\239\184\143 StipendService, StipendWrapper not found in PlayerWrapperConfig, try adding it to the PlayerWrapperConfig/Shared")
	end
	v6.AddResponses(t2)
	for v14, v2 in v12 do
		v2.Duration = v2.Duration or v11.ClaimDurationTime
		v2.Lootbox = v10.Create(v2)
	end
	if not v13 then
		return
	end
	v4.GetRemoteFunction("ClaimStipendRemote").OnServerInvoke = function(p1, p2) --[[ Line: 230 | Upvalues: v5 (ref), t (ref) ]]
		local v1 = v5.getWrapperFromPlayer(p1)
		if not v1 then
			return nil
		end
		local v2, v3, v4 = t.CanClaimStipend(v1, p2)
		if v2 == true then
			return t.ClaimStipend(v1, v3, v4)
		else
			return v2
		end
	end
	v1.AddRigDataCallback(function(p1) --[[ Line: 244 | Upvalues: v3 (ref), v12 (ref) ]]
		local Stipends = p1:FindFirstChild("Stipends")
		if not Stipends then
			Stipends = v3.Create("Folder", {
				Name = "Stipends",
				Parent = p1
			})
		end
		for v2, v32 in v12 do
			v3.Create("IntValue", {
				Name = v2,
				Parent = Stipends
			})
		end
	end)
end
t:Init()
return t