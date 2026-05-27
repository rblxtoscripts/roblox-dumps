-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PlayerWrapper")
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("NotificationsService")
local v4 = Sonar("ItemDataService")
local v5 = Sonar("Ability")
local v6 = Sonar("PassiveAbility")
local v7 = Sonar("AilmentsService")
local v8 = game:GetService("RunService"):IsServer()
local v9 = v4.GetItemsByType("Abilities")
local t2 = {
	Cooldown = "You must wait before using this ability again!"
}
function t.GetAbilityFromName(p1) --[[ GetAbilityFromName | Line: 25 | Upvalues: v9 (copy) ]]
	return v9[p1]
end
function t.CanAddAbility(p1) --[[ CanAddAbility | Line: 29 | Upvalues: v9 (copy), v5 (copy) ]]
	if not p1 then
		warn("\226\154\160\239\184\143 AbilityService, CanAddAbility called with no data")
		return
	end
	if not p1.Target then
		warn("\226\154\160\239\184\143 AbilityService, AddAbility called with no target")
		return
	end
	if not p1.Name then
		warn("\226\154\160\239\184\143 AbilityService, AddAbility called with no name")
		return
	end
	if not v9[p1.Name] then
		local v1 = warn
		v1("\226\154\160\239\184\143 AbilityService, AddAbility called with no ability data for " .. tostring(p1.Name))
		return false
	end
	if v5.GetCharacterDataFromTarget(p1.Target) then
		return true
	else
		local v3 = warn
		v3("\226\154\160\239\184\143 AbilityService, AddAbility called with no character data for " .. tostring(p1.Target.Player.Name))
		return false
	end
end
function t.AddAbility(p1) --[[ AddAbility | Line: 59 | Upvalues: t (copy), v5 (copy) ]]
	if t.CanAddAbility(p1) then
		return v5.Create(p1)
	end
end
function t.RemoveAbility(p1, p2) --[[ RemoveAbility | Line: 67 | Upvalues: v5 (copy) ]]
	local v1 = v5.GetCharacterDataFromTarget(p1)
	if not v1 then
		return
	end
	local v2 = v1:GetAbility(p2)
	if v2 then
		v2:Destroy()
	end
end
function t.CanAddPassiveAbility(p1) --[[ CanAddPassiveAbility | Line: 81 | Upvalues: v7 (copy), v6 (copy) ]]
	if not p1 then
		warn("\226\154\160\239\184\143 AbilityService, AddPassiveAbility called with no data")
		return
	end
	if not p1.Target then
		warn("\226\154\160\239\184\143 AbilityService, AddPassiveAbility called with no target")
		return
	end
	if not p1.Name then
		warn("\226\154\160\239\184\143 AbilityService, AddPassiveAbility called with no name")
		return
	end
	local v2 = type(p1.Name) == "table" and p1.Name.Name or p1.Name
	if not v7.GetAilmentFromName(v2) then
		warn("\226\154\160\239\184\143 AbilityService, AddPassiveAbility called with unknown ailment for " .. tostring(v2))
		return false
	end
	if v6.GetCharacterDataFromTarget(p1.Target) then
		return true
	else
		warn("\226\154\160\239\184\143 AbilityService, AddPassiveAbility called with no character data")
		return false
	end
end
function t.AddPassiveAbility(p1) --[[ AddPassiveAbility | Line: 112 | Upvalues: t (copy), v6 (copy) ]]
	if t.CanAddPassiveAbility(p1) then
		return v6.Create(p1)
	end
end
function t.RemovePassiveAbility(p1, p2) --[[ RemovePassiveAbility | Line: 120 | Upvalues: v6 (copy) ]]
	local v1 = v6.GetCharacterDataFromTarget(p1)
	if not v1 then
		return
	end
	local v2 = v1:GetPassiveAbility(p2)
	if v2 then
		v2:Destroy()
	end
end
function t.GetPassiveAbilitiesForStat(p1, p2) --[[ GetPassiveAbilitiesForStat | Line: 134 | Upvalues: v6 (copy) ]]
	local v1 = v6.GetCharacterDataFromTarget(p1)
	if not v1 then
		return {}
	end
	local t = {}
	for v2, v3 in v1:GetPassiveAbilities() do
		if v3 and (v3.AffectsStat and (v3:AffectsStat(p2) and v3:IsActive())) then
			table.insert(t, v3)
		end
	end
	return t
end
function t.ConsumePassiveFrom(p1, p2) --[[ ConsumePassiveFrom | Line: 149 | Upvalues: v6 (copy), t (copy) ]]
	local v1 = v6.GetCharacterDataFromTarget(p1)
	if not v1 then
		return 0
	end
	local count = 0
	for v2, v3 in t.GetPassiveAbilitiesForStat(v1, p2) do
		if v3:Consume() then
			count = count + 1
		end
	end
	return count
end
function t.RequestToActivateAbility(...) --[[ RequestToActivateAbility | Line: 164 | Upvalues: v2 (copy) ]]
	return v2.GetRemoteFunction("ActivateAbilityRemote"):InvokeServer(...)
end
function t.RequestToDeactivateAbility(...) --[[ RequestToDeactivateAbility | Line: 168 | Upvalues: v2 (copy) ]]
	return v2.GetRemoteFunction("DeactivateAbilityRemote"):InvokeServer(...)
end
function t.Init(p1) --[[ Init | Line: 172 | Upvalues: v3 (copy), t2 (copy), v8 (copy), v2 (copy), v1 (copy) ]]
	v3.AddResponses(t2)
	if not v8 then
		return p1
	end
	v2.GetRemoteFunction("ActivateAbilityRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 176 | Upvalues: v1 (ref) ]]
		local v12 = v1.getWrapperFromPlayer(p1)
		if not v12 then
			return
		end
		local v2 = v12:GetCurrentCharacterData()
		if not v2 then
			return
		end
		local v3 = v2:GetAbility(p2)
		if not v3 then
			return
		end
		local v4 = v3:CanActivate(p3)
		if v4 == true then
			return v3:Activate(p3)
		else
			return v4
		end
	end
	v2.GetRemoteFunction("DeactivateAbilityRemote").OnServerInvoke = function(p1, p2) --[[ Line: 200 | Upvalues: v1 (ref) ]]
		local v12 = v1.getWrapperFromPlayer(p1)
		if not v12 then
			return
		end
		local v2 = v12:GetCurrentCharacterData()
		if not v2 then
			return
		end
		local v3 = v2:GetAbility(p2)
		if v3 then
			return v3:Deactivate()
		end
	end
	return p1
end
t:Init()
return t