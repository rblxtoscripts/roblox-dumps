-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("PlayerWrapper")
local t2 = {
	Characters = {
		GetTargets = function(p1, p2, p3) --[[ GetTargets | Line: 17 | Upvalues: v2 (copy), Players (copy) ]]
			local t = {}
			for v1, v22 in v2.GetPlayers() do
				if v22.Player ~= Players.LocalPlayer then
					local v3 = v22:GetCurrentCharacter()
					if v3 then
						table.insert(t, v3)
					end
				end
			end
			return t
		end,
		ResolveTarget = function(p1, p2) --[[ ResolveTarget | Line: 29 ]]
			return p2.Model
		end
	}
}
local t3 = {}
local v3 = nil
function t.RegisterTargetSource(p1, p2) --[[ RegisterTargetSource | Line: 41 | Upvalues: t2 (copy) ]]
	t2[p1] = p2
end
function t.RegisterTargetSelector(p1, p2) --[[ RegisterTargetSelector | Line: 45 | Upvalues: t3 (copy) ]]
	t3[p1] = p2
end
function t.GetActive() --[[ GetActive | Line: 49 | Upvalues: v3 (ref) ]]
	return v3
end
function t.IsActive() --[[ IsActive | Line: 53 | Upvalues: v3 (ref) ]]
	return v3 ~= nil
end
function t.new(p1) --[[ new | Line: 57 | Upvalues: t (copy), t3 (copy), v1 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Ability = p1
	v2.Targets = {}
	v2.ActiveTargets = {}
	v2.TargetSelectorName = p1.AbilityTypeData.TargetSelector
	v2.TargetSelectorHandler = v2.TargetSelectorName and t3[v2.TargetSelectorName]
	v2.Maid = v1.new()
	return v2
end
function t.GetTargets(p1) --[[ GetTargets | Line: 68 ]]
	return p1.Targets
end
function t._getTargetSource(p1) --[[ _getTargetSource | Line: 72 | Upvalues: t2 (copy) ]]
	local GetTargets = p1.Ability.AbilityTypeData.GetTargets
	if type(GetTargets) == "string" then
		return t2[GetTargets]
	else
		return nil
	end
end
function t._fetchTargets(p1) --[[ _fetchTargets | Line: 80 | Upvalues: t2 (copy) ]]
	local GetTargets = p1.Ability.AbilityTypeData.GetTargets
	local v1 = p1.Ability:_safeGetCurrentCharacter()
	if type(GetTargets) == "function" then
		return GetTargets(p1, v1, p1.Ability) or {}
	else
		if type(GetTargets) ~= "string" then
			return {}
		end
		local v3 = t2[GetTargets]
		if not v3 then
			return {}
		end
		if type(v3) == "function" then
			return v3(p1, v1, p1.Ability) or {}
		else
			if type(v3) ~= "table" or not v3.GetTargets then
				return {}
			end
			return v3.GetTargets(p1, v1, p1.Ability) or {}
		end
	end
end
function t._onTargetAdded(p1, p2) --[[ _onTargetAdded | Line: 98 | Upvalues: v1 (copy) ]]
	local v12 = v1.new()
	p1.ActiveTargets[p2] = v12
	if p1.TargetSelectorHandler and p1.TargetSelectorHandler.OnTargetAdded then
		p1.TargetSelectorHandler.OnTargetAdded(p1, p2, v12)
	end
	if not p1.Ability.AbilityTypeData.OnTargetAdded then
		return
	end
	p1.Ability.AbilityTypeData.OnTargetAdded(p1, p2, v12)
end
function t._onTargetRemoved(p1, p2) --[[ _onTargetRemoved | Line: 110 ]]
	local v1 = p1.ActiveTargets[p2]
	if v1 then
		v1:DoCleaning()
	end
	if p1.TargetSelectorHandler and p1.TargetSelectorHandler.OnTargetRemoved then
		p1.TargetSelectorHandler.OnTargetRemoved(p1, p2)
	end
	if not p1.Ability.AbilityTypeData.OnTargetRemoved then
		return
	end
	p1.Ability.AbilityTypeData.OnTargetRemoved(p1, p2)
end
function t._diffTargets(p1) --[[ _diffTargets | Line: 124 ]]
	local v1 = p1:_fetchTargets()
	local t = {}
	for v2, v3 in v1 do
		t[v3] = true
	end
	for v4 in p1.ActiveTargets do
		if not t[v4] then
			p1:_onTargetRemoved(v4)
			p1.ActiveTargets[v4] = nil
		end
	end
	for v5, v6 in v1 do
		if not p1.ActiveTargets[v6] then
			p1:_onTargetAdded(v6)
		end
	end
	p1.Targets = v1
end
function t._removeAllTargets(p1) --[[ _removeAllTargets | Line: 147 ]]
	for v1 in p1.ActiveTargets do
		p1:_onTargetRemoved(v1)
	end
	p1.ActiveTargets = {}
end
function t.Enter(p1) --[[ Enter | Line: 154 | Upvalues: v3 (ref), RunService (copy) ]]
	if v3 then
		v3:Exit()
	end
	v3 = p1
	p1.Ability.TargetModeChanged:Fire(true)
	if p1.TargetSelectorHandler and p1.TargetSelectorHandler.OnEnterTargetMode then
		p1.TargetSelectorHandler.OnEnterTargetMode(p1, p1.Ability:_safeGetCurrentCharacter(), p1.Ability, p1.Ability.AbilityTypeData, p1.Ability.AbilityItemData)
	end
	if p1.Ability.AbilityTypeData.OnEnterTargetMode then
		p1.Ability.AbilityTypeData.OnEnterTargetMode(p1, p1.Ability:_safeGetCurrentCharacter(), p1.Ability, p1.Ability.AbilityTypeData, p1.Ability.AbilityItemData)
	end
	p1:_diffTargets()
	p1.Maid.Heartbeat = RunService.Heartbeat:Connect(function() --[[ Line: 178 | Upvalues: p1 (copy) ]]
		if p1.Ability:CanActivate() == true then
			p1:_diffTargets()
		else
			p1:Exit()
		end
	end)
end
function t.Exit(p1) --[[ Exit | Line: 189 | Upvalues: v3 (ref) ]]
	if v3 ~= p1 then
		return
	end
	v3 = nil
	p1.Maid:DoCleaning()
	p1:_removeAllTargets()
	p1.Ability.TargetModeChanged:Fire(false)
	if p1.TargetSelectorHandler and p1.TargetSelectorHandler.OnExitTargetMode then
		p1.TargetSelectorHandler.OnExitTargetMode(p1, p1.Ability:_safeGetCurrentCharacter(), p1.Ability, p1.Ability.AbilityTypeData, p1.Ability.AbilityItemData)
	end
	if not p1.Ability.AbilityTypeData.OnExitTargetMode then
		return
	end
	p1.Ability.AbilityTypeData.OnExitTargetMode(p1, p1.Ability:_safeGetCurrentCharacter(), p1.Ability, p1.Ability.AbilityTypeData, p1.Ability.AbilityItemData)
end
function t._resolveTarget(p1, p2) --[[ _resolveTarget | Line: 215 ]]
	local ResolveTarget = p1.Ability.AbilityTypeData.ResolveTarget
	if ResolveTarget then
		return ResolveTarget(p2)
	end
	local v1 = p1:_getTargetSource()
	if type(v1) == "table" and v1.ResolveTarget then
		return v1.ResolveTarget(p1, p2)
	else
		return p2
	end
end
function t.Select(p1, p2) --[[ Select | Line: 229 ]]
	local v1 = p1:_resolveTarget(p2)
	local CharacterData = p1.Ability.CharacterData
	if not CharacterData then
		return
	end
	if CharacterData:ActivateAbility(p1.Ability.Name, v1) == true then
		p1:Exit()
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 241 | Upvalues: v3 (ref) ]]
	if v3 == p1 then
		p1:Exit()
	end
	p1.Maid:DoCleaning()
end
return t