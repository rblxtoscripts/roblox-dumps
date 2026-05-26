-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("safeDestroy")
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("Maid")
local v4 = Sonar("CharacterData", {
	Deferred = true
})
local v5 = Sonar("ItemDataService")
local v6 = Sonar("StorageUtils")
local v7 = Sonar("ParticleSet")
local v8 = Sonar("TableUtils")
local v9 = Sonar("RemoteUtils")
local v10 = Sonar("Signal")
local v11 = Sonar("AbilityTarget", {
	Context = "Client"
})
local v12 = Sonar("EffectReplicationService")
local v13 = Sonar("Constants")
local IS_CLIENT = v13.IS_CLIENT
local IS_SERVER = v13.IS_SERVER
local v14 = v5.GetItemsByType("Abilities")
local v15 = v6.GetConfig("Ability")()
local v16 = v9.GetRemoteEvent("RenderAbility")
function t.GetCharacterDataFromTarget(p1) --[[ GetCharacterDataFromTarget | Line: 34 | Upvalues: v2 (copy), v4 (copy) ]]
	local v1 = nil
	if typeof(p1) == "Instance" then
		if p1:IsA("Player") then
			local v22 = v2.getWrapperFromPlayer(p1)
			if not v22 then
				warn("\226\154\160\239\184\143 Ability, GetCharacterDataFromTarget called with invalid target: " .. tostring(p1))
				return
			end
			v1 = v22:GetCurrentCharacterData()
		else
			v1 = v4.GetDataFromModel(p1)
		end
	elseif type(p1) == "table" then
		if p1.IsA and p1:IsA("CharacterData") then
			v1 = p1
		elseif p1.CharacterData then
			v1 = p1.CharacterData
		end
	end
	if v1 then
		return v1
	end
	local v5 = warn
	v5("\226\154\160\239\184\143 Ability, GetCharacterDataFromTarget called with no character data for " .. type(p1) == "Instance" and p1.Name or p1)
end
function t.Create(p1) --[[ Create | Line: 64 | Upvalues: t (copy), v14 (copy) ]]
	p1.TargetCharacterData = t.GetCharacterDataFromTarget(p1.Target)
	if not p1.TargetCharacterData then
		local v1 = warn
		v1("\226\154\160\239\184\143 Ability, Failed to get character data from target: " .. tostring(p1.Target))
		return
	end
	p1.AbilityData = v14[p1.Name]
	if not p1.AbilityData then
		local v2 = warn
		v2("\226\157\140 Ability, Missing AbilityData for: " .. tostring(p1.Name))
		return
	end
	if p1.AbilityData.PassiveAbility then
		warn("\226\154\160\239\184\143 Ability, PassiveAbility is not supported by Ability, use PassiveAbility instead")
	else
		return t.new(p1)
	end
end
function t.new(p1) --[[ new | Line: 85 | Upvalues: t (copy), v3 (copy), v10 (copy), IS_SERVER (copy) ]]
	local v2 = setmetatable(p1, t)
	v2.Maid = v3.new()
	v2.CharacterData = p1.TargetCharacterData
	v2.AbilityItemData = p1.AbilityData
	v2.AbilityData = v2.AbilityItemData
	v2.AbilityTypeData = v2.AbilityItemData.AbilityType
	v2.TargetModeChanged = v10.new()
	v2.Maid:GiveTask(v2.TargetModeChanged)
	if IS_SERVER then
		if v2.AbilityTypeData.OnServerInit then
			v2.AbilityTypeData.OnServerInit(v2:_safeGetCurrentCharacter(), v2, v2.AbilityTypeData, v2.AbilityItemData)
		end
		v2:_safeSetAbility(v2)
	elseif v2.AbilityTypeData.OnClientInit then
		v2.AbilityTypeData.OnClientInit(v2:_safeGetCurrentCharacter(), v2, v2.AbilityTypeData, v2.AbilityItemData)
	end
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 115 | Upvalues: IS_SERVER (copy), v1 (copy) ]]
	p1:ExitTargetMode()
	if IS_SERVER then
		p1:_safeSetAbility(nil)
	end
	v1(p1)
end
function t._safeSetAbilityAttribute(p1, p2) --[[ _safeSetAbilityAttribute | Line: 125 | Upvalues: IS_SERVER (copy) ]]
	if not p1.CharacterData.AbilitiesFolder then
		return
	end
	if not IS_SERVER then
		return
	end
	p1.CharacterData.AbilitiesFolder:SetAttribute(p1.AbilityItemData.Name, p2)
end
function t._safeSetAbility(p1, p2) --[[ _safeSetAbility | Line: 135 ]]
	if not p1.CharacterData.SetAbility then
		return
	end
	p1.CharacterData:SetAbility(p1.Name, p2)
	if p2 then
		p1:_safeSetAbilityAttribute(p1.CharacterData:GetEmptyAbilitySlot())
	else
		p1:_safeSetAbilityAttribute(nil)
	end
end
function t._safeGetCurrentCharacter(p1) --[[ _safeGetCurrentCharacter | Line: 149 ]]
	if p1.CharacterData.CurrentCharacter then
		return p1.CharacterData.CurrentCharacter
	end
	if p1.CharacterData.PlayerWrapper then
		return p1.CharacterData.PlayerWrapper:GetCurrentCharacter()
	else
		return nil
	end
end
function t.GetCooldown(p1) --[[ GetCooldown | Line: 159 ]]
	return p1.AbilityItemData.Cooldown or 10
end
function t._getOffsetCooldown(p1) --[[ _getOffsetCooldown | Line: 163 ]]
	local v1 = p1.CharacterData:GetWithModifiers("AbilityCooldown", p1:GetCooldown())
	return p1:GetCooldown() - v1
end
function t._setLastUse(p1, p2) --[[ _setLastUse | Line: 169 ]]
	if p1.CharacterData.PlayerWrapper then
		p1.CharacterData.PlayerWrapper:SetReplicatedData("LastUse_" .. p1.AbilityItemData.Name, p2)
	else
		p1.CharacterData:Set("Last_" .. p1.AbilityItemData.Name, p2)
	end
end
function t.GetLastUse(p1) --[[ GetLastUse | Line: 177 ]]
	if p1.CharacterData.PlayerWrapper then
		return p1.CharacterData.PlayerWrapper:GetReplicatedData("LastUse_" .. p1.AbilityItemData.Name)
	else
		return p1.CharacterData:Get("Last_" .. p1.AbilityItemData.Name)
	end
end
function t.GetLastUseChangedSignal(p1) --[[ GetLastUseChangedSignal | Line: 185 ]]
	if p1.CharacterData.PlayerWrapper then
		return p1.CharacterData.PlayerWrapper:GetReplicatedDataChangedSignal("LastUse_" .. p1.AbilityItemData.Name)
	else
		return p1.CharacterData:GetChangedSignal("Last_" .. p1.AbilityItemData.Name)
	end
end
function t.CanActivate(p1, p2) --[[ CanActivate | Line: 193 | Upvalues: v15 (copy), IS_SERVER (copy) ]]
	local v1 = p1:GetLastUse()
	if v1 and workspace:GetServerTimeNow() - v1 < p1:GetCooldown() then
		return "Cooldown"
	end
	if p1.AbilityTypeData.CanActivate then
		local v2 = p1.AbilityTypeData.CanActivate(p1:_safeGetCurrentCharacter(), p1, p1.AbilityTypeData, p1.AbilityItemData)
		if v2 ~= true then
			return v2
		end
	end
	if v15.CanActivateAbility then
		local v3 = v15.CanActivateAbility(p1:_safeGetCurrentCharacter(), p1, p1.AbilityTypeData, p1.AbilityItemData)
		if v3 ~= true then
			return v3
		end
	end
	if IS_SERVER and (not p2 and p1:RequiresTarget()) then
		return "NoTarget"
	end
	if p2 == nil then
		return true
	end
	local v4 = p1:CanActivateOnTarget(p2)
	if v4 == true then
		return true
	else
		return v4 or "InvalidTarget"
	end
end
function t.CanDeactivate(p1) --[[ CanDeactivate | Line: 234 | Upvalues: v15 (copy) ]]
	if not v15.CanDeactivateAbility then
		return true
	end
	local v1 = v15.CanDeactivateAbility(p1:_safeGetCurrentCharacter(), p1, p1.AbilityTypeData, p1.AbilityItemData)
	if v1 == true then
		return true
	else
		return v1
	end
end
function t.RequiresTarget(p1) --[[ RequiresTarget | Line: 244 ]]
	return p1.AbilityTypeData.RequiresTarget == true
end
function t.IsInTargetMode(p1) --[[ IsInTargetMode | Line: 248 | Upvalues: v11 (copy) ]]
	if not v11 then
		return false
	end
	local v1 = v11.GetActive()
	return if v1 then v1.Ability == p1 else v1
end
function t.GetTargetModeChangedSignal(p1) --[[ GetTargetModeChangedSignal | Line: 254 ]]
	return p1.TargetModeChanged
end
function t.EnterTargetMode(p1) --[[ EnterTargetMode | Line: 258 | Upvalues: v11 (copy) ]]
	if not v11 then
		return
	end
	if not p1:IsInTargetMode() then
		v11.new(p1):Enter()
	end
end
function t.ExitTargetMode(p1) --[[ ExitTargetMode | Line: 265 | Upvalues: v11 (copy) ]]
	if not v11 then
		return
	end
	if p1:IsInTargetMode() then
		v11.GetActive():Exit()
	end
end
function t.CanActivateOnTarget(p1, p2) --[[ CanActivateOnTarget | Line: 271 ]]
	if p1.AbilityTypeData.CanActivateOnTarget then
		return p1.AbilityTypeData.CanActivateOnTarget(p1:_safeGetCurrentCharacter(), p1, p1.AbilityTypeData, p1.AbilityItemData, p2)
	else
		return true
	end
end
function t._playActivationParticle(p1) --[[ _playActivationParticle | Line: 291 | Upvalues: IS_SERVER (copy), v7 (copy) ]]
	if IS_SERVER then
		return
	end
	local Particle = p1.AbilityTypeData.Particle
	if not Particle then
		return
	end
	local v1, v2, v3, v4
	if type(Particle) == "string" then
		v1 = Particle
		v2 = nil
		v3 = nil
		v4 = nil
	else
		if type(Particle) ~= "table" then
			return
		end
		v1 = Particle.Name
		v3 = Particle.Duration
		v2 = Particle.Scale
		v4 = Particle.LockedToPart
	end
	local v5 = p1:_safeGetCurrentCharacter()
	if not v5 then
		return
	end
	local v6 = v5.Root or v5.PrimaryPart
	if not v6 then
		return
	end
	local v72 = v7.new(v1, v6, true, v2, v3, nil, v4)
	if not v72 then
		return
	end
	v72:Emit()
end
function t._fireClientRender(p1, p2, p3) --[[ _fireClientRender | Line: 321 | Upvalues: v8 (copy), v16 (copy) ]]
	if not p2 then
		return
	end
	if not p2.GetNearbyCharacters then
		warn("\226\154\160\239\184\143 Ability, _fireClientRender called with character that has no GetNearbyCharacters method")
		return
	end
	for v3, v4 in v8.MergeLists(v8.Map(p2:GetNearbyCharacters(p1.AbilityTypeData.RenderRadius or 2000), function(p1, p2) --[[ Line: 334 ]]
		return p2.Player, false
	end), { p1.CharacterData.Player }) do
		v16:FireClient(v4, p1.CharacterData.Player, p1.AbilityTypeData.Name, table.unpack(p3))
	end
end
function t.Activate(p1, p2, p3) --[[ Activate | Line: 343 | Upvalues: IS_SERVER (copy), v12 (copy) ]]
	if IS_SERVER then
		p1._running = true
		if p1.AbilityTypeData.OnActivatedServer then
			local v1 = p1:_safeGetCurrentCharacter()
			local v2 = table.pack(p1.AbilityTypeData.OnActivatedServer(v1, p1, p1.AbilityTypeData, p1.AbilityItemData, p2))
			if p1.AbilityTypeData.OnClientRender and v1 then
				p1:_fireClientRender(v1, v2)
			end
		end
		v12.Fire({
			Name = "AbilityUsed",
			RenderRadius = 350,
			Source = p1.CharacterData
		})
		if not p1.AbilityTypeData.CooldownOnReactivated then
			p1:_setLastUse(workspace:GetServerTimeNow() - p1:_getOffsetCooldown())
		end
	else
		if p1:IsInTargetMode() then
			p1:ExitTargetMode()
		end
		if p1.AbilityTypeData.OnActivatedClient then
			p1.AbilityTypeData.OnActivatedClient(p1:_safeGetCurrentCharacter(), p1, p1.AbilityTypeData, p1.AbilityItemData, p2, p3)
		end
		p1:_playActivationParticle()
	end
	p1.CharacterData:GetAbilityActivatedSignal():Fire(p1)
	return true
end
function t.Deactivate(p1, p2) --[[ Deactivate | Line: 381 | Upvalues: IS_SERVER (copy) ]]
	if IS_SERVER then
		p1._running = false
		if p1.AbilityTypeData.OnDeactivatedServer then
			p1.AbilityTypeData.OnDeactivatedServer(p1:_safeGetCurrentCharacter(), p1, p1.AbilityTypeData, p1.AbilityItemData)
		end
		if not p1.AbilityTypeData.CooldownOnReactivated then
			return true
		end
		p1:_setLastUse(workspace:GetServerTimeNow() - p1:_getOffsetCooldown())
	else
		if not p1.AbilityTypeData.OnDeactivatedClient then
			return true
		end
		p1.AbilityTypeData.OnDeactivatedClient(p1:_safeGetCurrentCharacter(), p1, p1.AbilityTypeData, p1.AbilityItemData, p2)
	end
	return true
end
function t.Tick(p1) --[[ Tick | Line: 400 | Upvalues: IS_SERVER (copy) ]]
	local AbilityTypeData = p1.AbilityTypeData
	local v1 = p1:_safeGetCurrentCharacter()
	if AbilityTypeData.OnAnyClientTick and not IS_SERVER then
		task.spawn(AbilityTypeData.OnAnyClientTick, v1, p1, p1.AbilityTypeData, p1.AbilityItemData)
	elseif AbilityTypeData.OnAnyServerTick and IS_SERVER then
		task.spawn(AbilityTypeData.OnAnyServerTick, v1, p1, p1.AbilityTypeData, p1.AbilityItemData)
	end
	if not p1._running then
		return
	end
	if AbilityTypeData.OnClientTick and not IS_SERVER then
		task.spawn(AbilityTypeData.OnClientTick, v1, p1, p1.AbilityTypeData, p1.AbilityItemData)
		return
	end
	if not (AbilityTypeData.OnServerTick and IS_SERVER) then
		return
	end
	task.spawn(AbilityTypeData.OnServerTick, v1, p1, p1.AbilityTypeData, p1.AbilityItemData)
end
function t.GetValue(p1) --[[ GetValue | Line: 421 ]]
	return p1.CharacterData:GetWithModifiers(p1.AbilityItemData.Name)
end
function t.Init(p1) --[[ Init | Line: 425 | Upvalues: IS_CLIENT (copy), v16 (copy), v4 (copy) ]]
	if not IS_CLIENT then
		return
	end
	v16.OnClientEvent:Connect(function(p1, p2, ...) --[[ Line: 427 | Upvalues: v4 (ref) ]]
		local v1 = v4.GetDataFromModel(p1.Character)
		if not v1 then
			return
		end
		local v2 = v1:GetAbility(p2)
		if v2 then
			v2.AbilityTypeData.OnClientRender(v2, v1, ...)
		end
	end)
end
task.defer(t.Init)
return t