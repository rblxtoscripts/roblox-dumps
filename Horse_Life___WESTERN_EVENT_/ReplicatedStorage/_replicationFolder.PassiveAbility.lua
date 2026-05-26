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
local v5 = Sonar("AilmentsService")
local v6 = Sonar("Signal")
local v7 = Sonar("ItemDataService")
local IS_SERVER = Sonar("Constants").IS_SERVER
function t.GetCharacterDataFromTarget(p1) --[[ GetCharacterDataFromTarget | Line: 25 | Upvalues: v2 (copy), v4 (copy) ]]
	local v1 = nil
	if typeof(p1) == "Instance" then
		if p1:IsA("Player") then
			local v22 = v2.getWrapperFromPlayer(p1)
			if not v22 then
				warn("\226\154\160\239\184\143 PassiveAbility, GetCharacterDataFromTarget called with invalid target: " .. tostring(p1))
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
	else
		warn("\226\154\160\239\184\143 PassiveAbility, GetCharacterDataFromTarget called with no character data for " .. tostring(p1))
	end
end
function t.Create(p1) --[[ Create | Line: 55 | Upvalues: t (copy), v5 (copy), v7 (copy) ]]
	p1.TargetCharacterData = t.GetCharacterDataFromTarget(p1.Target)
	if not p1.TargetCharacterData then
		local v1 = warn
		v1("\226\154\160\239\184\143 PassiveAbility, Failed to get character data from target: " .. tostring(p1.Target))
		return
	end
	p1.AilmentData = v5.GetAilmentFromName(p1.Name)
	p1.AbilityData = v7.GetByName(p1.Name) or p1.AilmentData
	if p1.AbilityData then
		return t.new(p1)
	end
	warn("\226\157\140 PassiveAbility, Missing ability data for: " .. tostring(p1.Name))
end
function t.new(p1) --[[ new | Line: 72 | Upvalues: t (copy), v3 (copy), v6 (copy), IS_SERVER (copy) ]]
	local v2 = setmetatable(p1, t)
	v2.Maid = v3.new()
	v2.CharacterData = p1.TargetCharacterData
	v2.AbilityItemData = p1.AbilityData
	v2.AbilityData = v2.AbilityItemData
	v2.AilmentData = p1.AilmentData
	v2.AbilityTypeData = v2.AbilityItemData.AbilityType
	v2.Tier = p1.Tier
	v2.Name = p1.Name
	v2._maxUses = v2.AbilityItemData.Uses
	v2._cooldown = v2.AbilityItemData.Cooldown
	v2._uses = v2._maxUses
	v2._lastUse = nil
	v2.UsesChanged = v6.new()
	v2.Maid:GiveTask(v2.UsesChanged)
	v2.LastUseChanged = v6.new()
	v2.Maid:GiveTask(v2.LastUseChanged)
	if IS_SERVER then
		v2:_ensureFolder()
		v2:_writeAttributes()
		if v2.AbilityTypeData and v2.AbilityTypeData.OnServerInit then
			v2.AbilityTypeData.OnServerInit(v2:_safeGetCurrentCharacter(), v2, v2.AbilityTypeData, v2.AbilityItemData)
		end
		v2:_safeSetPassive(v2)
		v2:_refreshAilment()
	else
		if v2.AbilityTypeData and v2.AbilityTypeData.OnClientInit then
			v2.AbilityTypeData.OnClientInit(v2:_safeGetCurrentCharacter(), v2, v2.AbilityTypeData, v2.AbilityItemData)
		end
		local v32 = v2.CharacterData.PassiveAbilitiesFolder and v2.CharacterData.PassiveAbilitiesFolder:FindFirstChild(v2.Name)
		if v32 then
			v2.Folder = v32
			v2:_bindClientReplication()
		end
	end
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 121 | Upvalues: IS_SERVER (copy), v1 (copy) ]]
	if IS_SERVER then
		if p1.Name then
			p1.CharacterData:RemoveAilment({
				Name = p1.Name,
				Tier = p1.Tier
			})
		end
		p1:_safeSetPassive(nil)
		if p1.Folder then
			p1.Folder:Destroy()
			p1.Folder = nil
		end
	end
	v1(p1)
end
function t._ensureFolder(p1) --[[ _ensureFolder | Line: 141 ]]
	if not p1.CharacterData.PassiveAbilitiesFolder then
		return
	end
	local v1 = p1.CharacterData.PassiveAbilitiesFolder:FindFirstChild(p1.Name)
	local v2
	if v1 then
		v1:Destroy()
	end
	v2 = Instance.new("Configuration")
	v2.Name = p1.Name
	v2.Parent = p1.CharacterData.PassiveAbilitiesFolder
	p1.Folder = v2
end
function t._writeAttributes(p1) --[[ _writeAttributes | Line: 157 ]]
	if p1.Folder then
		p1.Folder:SetAttribute("MaxUses", p1._maxUses)
		p1.Folder:SetAttribute("Uses", p1._uses)
		p1.Folder:SetAttribute("Cooldown", p1._cooldown)
		p1.Folder:SetAttribute("LastUse", p1._lastUse)
		p1.Folder:SetAttribute("Active", p1:IsActive())
	end
end
function t._bindClientReplication(p1) --[[ _bindClientReplication | Line: 169 ]]
	if p1.Folder then
		(function() --[[ readAll | Line: 174 | Upvalues: p1 (copy) ]]
			p1._maxUses = p1.Folder:GetAttribute("MaxUses")
			p1._uses = p1.Folder:GetAttribute("Uses")
			p1._cooldown = p1.Folder:GetAttribute("Cooldown")
			p1._lastUse = p1.Folder:GetAttribute("LastUse")
		end)()
		p1.Maid:GiveTask(p1.Folder:GetAttributeChangedSignal("Uses"):Connect(function() --[[ Line: 182 | Upvalues: p1 (copy) ]]
			p1._uses = p1.Folder:GetAttribute("Uses")
			p1.UsesChanged:Fire(p1._uses)
		end))
		p1.Maid:GiveTask(p1.Folder:GetAttributeChangedSignal("LastUse"):Connect(function() --[[ Line: 187 | Upvalues: p1 (copy) ]]
			p1._lastUse = p1.Folder:GetAttribute("LastUse")
			p1.LastUseChanged:Fire(p1._lastUse)
		end))
	end
end
function t._safeGetCurrentCharacter(p1) --[[ _safeGetCurrentCharacter | Line: 193 ]]
	if p1.CharacterData.CurrentCharacter then
		return p1.CharacterData.CurrentCharacter
	end
	if p1.CharacterData.PlayerWrapper then
		return p1.CharacterData.PlayerWrapper:GetCurrentCharacter()
	else
		return nil
	end
end
function t._safeSetPassive(p1, p2) --[[ _safeSetPassive | Line: 203 ]]
	if p1.CharacterData.SetPassiveAbility then
		p1.CharacterData:SetPassiveAbility(p1.Name, p2)
	end
end
function t.GetTier(p1) --[[ GetTier | Line: 210 ]]
	return p1.Tier
end
function t.GetUses(p1) --[[ GetUses | Line: 214 ]]
	return p1._uses
end
function t.GetMaxUses(p1) --[[ GetMaxUses | Line: 218 ]]
	return p1._maxUses
end
function t.GetCooldown(p1) --[[ GetCooldown | Line: 222 ]]
	return p1._cooldown
end
function t.GetLastUse(p1) --[[ GetLastUse | Line: 226 ]]
	return p1._lastUse
end
function t.GetCooldownRemaining(p1) --[[ GetCooldownRemaining | Line: 230 ]]
	if not (p1._cooldown and p1._lastUse) then
		return 0
	end
	local v1 = p1._cooldown - (workspace:GetServerTimeNow() - p1._lastUse)
	if v1 < 0 then
		return 0
	else
		return v1
	end
end
function t.GetUsesChangedSignal(p1) --[[ GetUsesChangedSignal | Line: 241 ]]
	return p1.UsesChanged
end
function t.GetLastUseChangedSignal(p1) --[[ GetLastUseChangedSignal | Line: 245 ]]
	return p1.LastUseChanged
end
function t.IsOnCooldown(p1) --[[ IsOnCooldown | Line: 249 ]]
	return p1:GetCooldownRemaining() > 0
end
function t.HasUsesLeft(p1) --[[ HasUsesLeft | Line: 253 ]]
	if p1._maxUses == nil then
		return true
	end
	return (p1._uses or 0) > 0
end
function t.IsActive(p1) --[[ IsActive | Line: 260 ]]
	return p1:HasUsesLeft() and not p1:IsOnCooldown()
end
function t.AffectsStat(p1, p2) --[[ AffectsStat | Line: 264 ]]
	if not p1.AilmentData then
		return false
	end
	local AilmentTargets = p1.AilmentData.AilmentTargets
	if not AilmentTargets then
		return false
	end
	for v1, v2 in AilmentTargets do
		if v2 == p2 then
			return true
		end
	end
	return false
end
function t.Consume(p1) --[[ Consume | Line: 280 | Upvalues: IS_SERVER (copy) ]]
	if not IS_SERVER then
		return false
	end
	if not p1:IsActive() then
		return false
	end
	local v1
	if p1._maxUses == nil then
		v1 = false
	else
		p1._uses = math.max((p1._uses or 0) - 1, 0)
		v1 = true
	end
	if p1._cooldown then
		p1._lastUse = workspace:GetServerTimeNow()
		v1 = true
	end
	if v1 then
		p1:_writeAttributes()
		p1:_refreshAilment()
		p1:_scheduleCooldownRefresh()
	end
	if not (p1.AbilityTypeData and p1.AbilityTypeData.OnConsumed) then
		return true
	end
	p1.AbilityTypeData.OnConsumed(p1:_safeGetCurrentCharacter(), p1, p1.AbilityTypeData, p1.AbilityItemData)
	return true
end
function t._scheduleCooldownRefresh(p1) --[[ _scheduleCooldownRefresh | Line: 314 ]]
	if not (p1._cooldown and p1._lastUse) then
		return
	end
	local _lastUse = p1._lastUse
	local v1 = p1:GetCooldownRemaining()
	if not (v1 <= 0) then
		task.delay(v1 + 0.05, function() --[[ Line: 325 | Upvalues: p1 (copy), _lastUse (copy) ]]
			if p1._destroyed then
				return
			end
			if p1._lastUse ~= _lastUse then
				return
			end
			p1:_refreshAilment()
			if not p1.Folder then
				return
			end
			p1.Folder:SetAttribute("Active", p1:IsActive())
		end)
	end
end
function t._refreshAilment(p1) --[[ _refreshAilment | Line: 339 | Upvalues: IS_SERVER (copy) ]]
	if not IS_SERVER then
		return
	end
	local v1 = p1.Name
	if not v1 then
		return
	end
	if p1:IsActive() then
		local v2 = p1.CharacterData:GetAilment(v1)
		if not v2 or p1.Tier ~= nil and (v2.GetTier and v2:GetTier() ~= p1.Tier) then
			p1.CharacterData:AddAilment({
				Value = 9000000000,
				Name = v1,
				Tier = p1.Tier
			})
		end
	else
		p1.CharacterData:RemoveAilment({
			Name = v1,
			Tier = p1.Tier
		})
	end
	if not p1.Folder then
		return
	end
	p1.Folder:SetAttribute("Active", p1:IsActive())
end
function t.Tick(p1) --[[ Tick | Line: 370 | Upvalues: IS_SERVER (copy) ]]
	local AbilityTypeData = p1.AbilityTypeData
	local v1 = p1:_safeGetCurrentCharacter()
	if AbilityTypeData and (AbilityTypeData.OnAnyClientTick and not IS_SERVER) then
		task.spawn(AbilityTypeData.OnAnyClientTick, v1, p1, p1.AbilityTypeData, p1.AbilityItemData)
	elseif AbilityTypeData and (AbilityTypeData.OnAnyServerTick and IS_SERVER) then
		task.spawn(AbilityTypeData.OnAnyServerTick, v1, p1, p1.AbilityTypeData, p1.AbilityItemData)
	end
	if not IS_SERVER or (not p1._cooldown or (not p1._lastUse or p1:IsOnCooldown())) then
		return
	end
	p1:_refreshAilment()
end
return t