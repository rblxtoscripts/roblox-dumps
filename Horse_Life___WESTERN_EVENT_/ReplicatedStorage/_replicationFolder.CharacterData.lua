-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("Signal")
local v4 = Sonar("AilmentsService")
local v5 = Sonar("PlayerWrapper")
local v6 = Sonar("StorageUtils")
local v7 = Sonar("TableUtils")
local v8 = Sonar("AbilityService")
local v9 = game:GetService("RunService"):IsServer()
local v10 = game:GetService("RunService"):IsStudio()
local v11 = v6.GetConfig("CharacterData")()
local v12 = v6.GetConfig("Ailments")()
local v13 = v6.GetConfig("Ability")()
local t2 = {}
local t3 = {}
local t4 = {}
local t5 = {}
function t.GetDataFromModel(p1) --[[ GetDataFromModel | Line: 74 | Upvalues: t4 (copy) ]]
	return t4[p1]
end
function t._decompress(p1, p2) --[[ _decompress | Line: 82 | Upvalues: t2 (copy) ]]
	return t2[p2] or p2
end
function t._compress(p1, p2) --[[ _compress | Line: 90 | Upvalues: v11 (copy), v10 (copy), t3 (copy) ]]
	local v1 = v11.Compressed[p2]
	if v1 then
		return v1
	end
	if v10 and not t3[p2] then
		warn("\226\154\160\239\184\143 CharacterData, Data key not compressed, add to CharacterDataCompression:", p2)
	end
	t3[p2] = true
	return p2
end
function t.new(p1) --[[ new | Line: 111 | Upvalues: t (copy), t5 (copy), t4 (copy), v1 (copy), Players (copy), v5 (copy) ]]
	local v12 = t.GetDataFromModel(p1.Model)
	if v12 then
		return v12
	end
	if t5[p1.Model] then
		local v2
		repeat
			warn("\226\154\160\239\184\143 CharacterData, Waiting for character data:", p1.Model:GetFullName())
			v2 = t4[p1.Model]
			task.wait()
		until v2
		return v2
	else
		t5[p1.Model] = true
		local v4 = setmetatable(p1, t)
		v4.Maid = v1.new()
		v4.IsLocalPlayer = p1.Player == Players.LocalPlayer
		v4.PlayerWrapper = v5.getWrapperFromPlayer(v4.Player)
		v4:_init()
		t5[v4.Model] = nil
		return v4
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 143 | Upvalues: t4 (copy), v2 (copy) ]]
	t4[p1.Model] = nil
	v2(p1)
end
function t._getOrCreateInstance(p1, p2, p3) --[[ _getOrCreateInstance | Line: 148 | Upvalues: v9 (copy) ]]
	local v1 = p1.Model:FindFirstChild(p2)
	if not v1 and v9 then
		local Configuration = Instance.new("Configuration")
		Configuration.Name = p2
		Configuration.Parent = p1.Model
		v1 = Configuration
	end
	return if v1 then v1 else p1.Model:WaitForChild(p2)
end
function t._init(p1) --[[ _init | Line: 161 | Upvalues: v9 (copy), v11 (copy), t4 (copy), v3 (copy) ]]
	p1.DataFolder = p1:_getOrCreateInstance("Data")
	if p1.RigAttributes or v9 then
		local v1 = type(p1.Data) == "function" and p1.Data(p1) or p1.Data
		for v4, v5 in pairs(if v1 then v1 else {}) do
			if not v11.Excluded[v4] then
				p1.DataFolder:SetAttribute(p1:_compress(v4), v5)
			end
		end
	end
	t4[p1.Model] = p1
	p1.AilmentsFolder = p1:_getOrCreateInstance("Ailments")
	p1.Ailments = {}
	p1._cachedAilments = {}
	local AilmentImmunities = p1.AilmentImmunities
	p1.AilmentImmunities = {}
	if AilmentImmunities then
		for v6, v7 in AilmentImmunities do
			p1.AilmentImmunities[v7] = true
		end
	end
	p1.AilmentAddedSignal = v3.new()
	p1.Maid:GiveTask(p1.AilmentAddedSignal)
	p1.AilmentRemovedSignal = v3.new()
	p1.Maid:GiveTask(p1.AilmentRemovedSignal)
	p1.AilmentSourcesFolder = p1:_getOrCreateAilmentSourcesFolder()
	p1._cachedSources = {}
	p1.AilmentSourceAddedSignal = v3.new()
	p1.Maid:GiveTask(p1.AilmentSourceAddedSignal)
	p1.AilmentSourceRemovedSignal = v3.new()
	p1.Maid:GiveTask(p1.AilmentSourceRemovedSignal)
	p1.Maid:GiveTask(p1.AilmentsFolder.AttributeChanged:Connect(function(p12) --[[ Line: 203 | Upvalues: p1 (copy) ]]
		p1:_onAilmentChanged(p12)
	end))
	p1.Maid:GiveTask(p1.AilmentSourcesFolder.AttributeChanged:Connect(function(p12) --[[ Line: 206 | Upvalues: p1 (copy) ]]
		p1:_onSourceChanged(p12)
	end))
	for v8, v92 in p1.AilmentsFolder:GetAttributes() do
		p1:_onAilmentChanged(v8)
	end
	for v10, v112 in p1.AilmentSourcesFolder:GetAttributes() do
		p1:_onSourceChanged(v10)
	end
	p1.AbilitiesFolder = p1:_getOrCreateInstance("Abilities")
	p1.Abilities = {}
	p1._cachedAbilities = {}
	for v13, v14 in p1.Abilities or {} do
		p1:AddAbility({
			Name = v14,
			Target = p1
		})
	end
	p1.AbilityAddedSignal = v3.new()
	p1.Maid:GiveTask(p1.AbilityAddedSignal)
	p1.AbilityRemovedSignal = v3.new()
	p1.Maid:GiveTask(p1.AbilityRemovedSignal)
	p1.AbilityActivatedSignal = v3.new()
	p1.Maid:GiveTask(p1.AbilityActivatedSignal)
	p1.Maid:GiveTask(p1.AbilitiesFolder.AttributeChanged:Connect(function(p12) --[[ Line: 238 | Upvalues: p1 (copy) ]]
		p1:_onAbilityChanged(p12)
	end))
	for v15, v16 in p1.AbilitiesFolder:GetAttributes() do
		p1:_onAbilityChanged(v15)
	end
	p1.PassiveAbilitiesFolder = p1:_getOrCreateInstance("PassiveAbilities")
	p1.PassiveAbilities = {}
	p1._cachedPassiveAbilities = {}
	p1.PassiveAbilityAddedSignal = v3.new()
	p1.Maid:GiveTask(p1.PassiveAbilityAddedSignal)
	p1.PassiveAbilityRemovedSignal = v3.new()
	p1.Maid:GiveTask(p1.PassiveAbilityRemovedSignal)
	p1.Maid:GiveTask(p1.PassiveAbilitiesFolder.ChildAdded:Connect(function(p12) --[[ Line: 255 | Upvalues: p1 (copy) ]]
		p1:_onPassiveAbilityChildAdded(p12)
	end))
	p1.Maid:GiveTask(p1.PassiveAbilitiesFolder.ChildRemoved:Connect(function(p12) --[[ Line: 258 | Upvalues: p1 (copy) ]]
		p1:_onPassiveAbilityChildRemoved(p12)
	end))
	for v17, v18 in p1.PassiveAbilitiesFolder:GetChildren() do
		p1:_onPassiveAbilityChildAdded(v18)
	end
	if not v11.OnInit then
		return
	end
	v11.OnInit(p1)
end
function t._getOrCreateAilmentSourcesFolder(p1) --[[ _getOrCreateAilmentSourcesFolder | Line: 270 | Upvalues: v9 (copy) ]]
	local AilmentSources = p1.AilmentsFolder:FindFirstChild("AilmentSources")
	if not AilmentSources and v9 then
		local AilmentSources_2 = Instance.new("Configuration")
		AilmentSources_2.Name = "AilmentSources"
		AilmentSources_2.Parent = p1.AilmentsFolder
		AilmentSources = AilmentSources_2
	end
	return if AilmentSources then AilmentSources else p1.AilmentsFolder:WaitForChild("AilmentSources")
end
function t._parseSourceAttribute(p1, p2) --[[ _parseSourceAttribute | Line: 280 ]]
	local v1 = string.find(p2, "__", 1, true)
	if v1 then
		return string.sub(p2, 1, v1 - 1), string.sub(p2, v1 + 2)
	else
		return p2, nil
	end
end
function t._onAilmentChanged(p1, p2) --[[ _onAilmentChanged | Line: 288 | Upvalues: v4 (copy), v9 (copy) ]]
	local v2, v3 = v4.ParseAilmentAttribute((p1:GetAilmentAttribute(p2)))
	if v2 then
		local v42 = not p1._cachedAilments[p2]
		p1._cachedAilments[p2] = v2
		if v42 and not (p1.Ailments[p2] or v9) then
			p1.Ailments[p2] = v4.AddAilment({
				Name = p2,
				Value = v2,
				Tier = v3,
				Target = p1.Model
			})
		end
	else
		if not p1._cachedAilments[p2] then
			return
		end
		p1._cachedAilments[p2] = nil
	end
end
function t._onSourceChanged(p1, p2) --[[ _onSourceChanged | Line: 309 ]]
	local v1, v2 = p1:_parseSourceAttribute(p2)
	if not v2 then
		return
	end
	if p1.AilmentSourcesFolder:GetAttribute(p2) then
		local v3 = not p1._cachedSources[p2]
		p1._cachedSources[p2] = true
		local v4 = p1.Ailments[v1]
		if v4 and v4._onClientSourceChanged then
			v4:_onClientSourceChanged(v2)
		end
		if v3 then
			p1.AilmentSourceAddedSignal:Fire(v1, v2)
		end
	else
		if not p1._cachedSources[p2] then
			return
		end
		p1._cachedSources[p2] = nil
		local v5 = p1.Ailments[v1]
		if v5 and v5._onClientSourceRemoved then
			v5:_onClientSourceRemoved(v2)
		end
		p1.AilmentSourceRemovedSignal:Fire(v1, v2)
	end
end
function t.IsA(p1, p2) --[[ IsA | Line: 339 ]]
	return p2 == "CharacterData"
end
function t.Get(p1, p2) --[[ Get | Line: 347 | Upvalues: v11 (copy) ]]
	if not p1.DataFolder then
		error("\226\157\140 CharacterData, You tried to call Get without constructing it first. Try using GetCachedData instead.")
	end
	local v1 = p1.DataFolder:GetAttribute(p1:_compress(p2))
	if not v11.DoNotRoundByDefault and (tonumber(v1) and not v11.IgnoreRounding[p2]) then
		v1 = math.round(v1)
	end
	if v11.IncludeRounding[p2] and tonumber(v1) then
		v1 = math.round(v1)
	end
	return v1
end
function t.GetWithModifiers(p1, p2, p3) --[[ GetWithModifiers | Line: 372 | Upvalues: v11 (copy) ]]
	local v1 = if p3 == nil then p1:Get(p2) else p3
	if v1 ~= nil then
		for k, v in pairs(p1:GetAilments()) do
			local v2 = v:Apply(p2, v1)
			if v2 ~= nil then
				v1 = v2
			end
		end
	end
	if not v11.DoNotRoundByDefault and (tonumber(v1) and not v11.IgnoreRounding[p2]) then
		v1 = math.round(v1)
	end
	if v11.IncludeRounding[p2] and tonumber(v1) then
		v1 = math.round(v1)
	end
	return v1
end
function t.GetStatChangedSignal(p1, p2) --[[ GetStatChangedSignal | Line: 401 | Upvalues: v3 (copy) ]]
	local v1 = v3.new()
	v1._maid:GiveTask(p1.DataFolder:GetAttributeChangedSignal(p1:_compress(p2)):Connect(function() --[[ Line: 403 | Upvalues: v1 (copy), p1 (copy), p2 (copy) ]]
		v1:Fire(p1:Get(p2))
	end))
	return v1
end
function t.Set(p1, p2, p3) --[[ Set | Line: 412 ]]
	p1.DataFolder:SetAttribute(p1:_compress(p2), p3)
end
function t.Decrement(p1, p2, p3) --[[ Decrement | Line: 419 ]]
	if not (p3 < 0) then
		p1.DataFolder:SetAttribute(p1:_compress(p2), (math.ceil((math.max(p1:Get(p2) - p3, 0)))))
	end
end
function t.Increment(p1, p2, p3, p4) --[[ Increment | Line: 428 ]]
	if p3 < 0 then
		return
	end
	if p4 then
		p1.DataFolder:SetAttribute(p1:_compress(p2), (math.ceil((math.min(p1:Get(p2) + p3, p4)))))
	else
		local v4 = p1:_compress(p2)
		p1.DataFolder:SetAttribute(v4, (math.ceil(p1:Get(p2) + p3)))
	end
end
function t.GetAilmentAttribute(p1, p2) --[[ GetAilmentAttribute | Line: 440 ]]
	return p1.AilmentsFolder:GetAttribute(p2)
end
function t.SetAilmentAttribute(p1, p2, p3) --[[ SetAilmentAttribute | Line: 447 ]]
	p1.AilmentsFolder:SetAttribute(p2, p3)
end
function t.GetAilmentChangedSignal(p1, p2) --[[ GetAilmentChangedSignal | Line: 454 ]]
	return p1.AilmentsFolder:GetAttributeChangedSignal(p2)
end
function t.GetAilmentAddedSignal(p1) --[[ GetAilmentAddedSignal | Line: 460 ]]
	return p1.AilmentAddedSignal
end
function t.GetAilmentRemovedSignal(p1) --[[ GetAilmentRemovedSignal | Line: 466 ]]
	return p1.AilmentRemovedSignal
end
function t.GetAilmentSourceAddedSignal(p1) --[[ GetAilmentSourceAddedSignal | Line: 470 ]]
	return p1.AilmentSourceAddedSignal
end
function t.GetAilmentSourceRemovedSignal(p1) --[[ GetAilmentSourceRemovedSignal | Line: 474 ]]
	return p1.AilmentSourceRemovedSignal
end
function t.GetAilmentsAttributes(p1) --[[ GetAilmentsAttributes | Line: 480 ]]
	return p1.AilmentsFolder:GetAttributes()
end
function t.TickAilments(p1, p2) --[[ TickAilments | Line: 486 | Upvalues: v12 (copy) ]]
	local v1 = if p2 then p2 else os.clock()
	if not p1.NextAilmentTick then
		p1.NextAilmentTick = v1 + v12.AilmentTickRate * 0.95
		return
	end
	if v1 < p1.NextAilmentTick then
		return
	end
	p1.NextAilmentTick = v1 + v12.AilmentTickRate * 0.95
	for v2, v3 in p1:GetAilments() do
		if v3 and v3.Tick then
			local v4, v5 = pcall(function() --[[ Line: 503 | Upvalues: v3 (copy) ]]
				return v3:Tick()
			end)
			if not v4 then
				warn("\226\154\160\239\184\143 CharacterData, Ailment tick error for:", v3.Name, "-", v5)
			end
		end
	end
end
function t.AddAilment(p1, p2) --[[ AddAilment | Line: 512 | Upvalues: v7 (copy), v4 (copy) ]]
	return v4.AddAilment((v7.MergeOriginal(p2, {
		Target = p1
	})))
end
function t.RemoveAilment(p1, p2) --[[ RemoveAilment | Line: 519 | Upvalues: v4 (copy) ]]
	return v4.RemoveAilment(p1, p2)
end
function t.SetAilment(p1, p2, p3) --[[ SetAilment | Line: 526 | Upvalues: v9 (copy), v10 (copy) ]]
	p1.Ailments[p2] = p3
	if p3 then
		p1.AilmentAddedSignal:Fire(p2, p3:Get())
	else
		p1.AilmentRemovedSignal:Fire(p2)
	end
	if not (v9 and v10) then
		return
	end
	if p3 then
		local v1 = print
		local format = string.format
		v1(format("\226\158\149 CharacterData, %s Added ailment: %s Value: %d", tostring(p1.Model.Name), p2, p3.Value))
		return
	end
	local v3 = print
	local format = string.format
	v3(format("\226\158\150 CharacterData, %s Removed ailment: %s", tostring(p1.Model.Name), p2))
end
function t.GetAilments(p1) --[[ GetAilments | Line: 546 ]]
	return p1.Ailments
end
function t.GetAilment(p1, p2) --[[ GetAilment | Line: 553 ]]
	return p1.Ailments[p2]
end
function t.HasAilment(p1, p2) --[[ HasAilment | Line: 560 ]]
	return p1.Ailments[p2] ~= nil
end
function t.AddAilmentImmunity(p1, p2) --[[ AddAilmentImmunity | Line: 564 ]]
	p1.AilmentImmunities[p2] = true
end
function t.RemoveAilmentImmunity(p1, p2) --[[ RemoveAilmentImmunity | Line: 568 ]]
	p1.AilmentImmunities[p2] = nil
end
function t.HasAilmentImmunity(p1, p2) --[[ HasAilmentImmunity | Line: 572 ]]
	return p1.AilmentImmunities[p2] == true
end
function t.RemoveAllAilments(p1, p2) --[[ RemoveAllAilments | Line: 578 ]]
	local v2 = if p2 then p2 else {}
	for k, v in pairs(p1.Ailments) do
		if v2.Exclude then
			local v3 = false
			for v4, v5 in v2.Exclude do
				if v:GetData(v4) == v5 then
					v3 = true
					break
				end
			end
			if not v3 then
				v:Remove()
				p1.Ailments[k] = nil
			end
		else
			v:Remove()
			p1.Ailments[k] = nil
		end
	end
end
function t.GetAbilityAttribute(p1, p2) --[[ GetAbilityAttribute | Line: 603 ]]
	return p1.AbilitiesFolder:GetAttribute(p2)
end
function t.GetAbilitiesAttributes(p1) --[[ GetAbilitiesAttributes | Line: 609 ]]
	return p1.AbilitiesFolder:GetAttributes()
end
function t.GetAbilityAddedSignal(p1) --[[ GetAbilityAddedSignal | Line: 615 ]]
	return p1.AbilityAddedSignal
end
function t.GetAbilityRemovedSignal(p1) --[[ GetAbilityRemovedSignal | Line: 621 ]]
	return p1.AbilityRemovedSignal
end
function t.GetAbilityActivatedSignal(p1) --[[ GetAbilityActivatedSignal | Line: 627 ]]
	return p1.AbilityActivatedSignal
end
function t.SetAbility(p1, p2, p3) --[[ SetAbility | Line: 634 | Upvalues: v9 (copy), v10 (copy) ]]
	p1.Abilities[p2] = p3
	if not (v9 and v10) then
		return
	end
	if p3 then
		local v1 = print
		local format = string.format
		v1(format("\226\158\149 CharacterData, %s Added ability: %s", tostring(p1.Model.Name), p2))
		return
	end
	local v3 = print
	local format = string.format
	v3(format("\226\158\150 CharacterData, %s Removed ability: %s", tostring(p1.Model.Name), p2))
end
function t.GetAbilities(p1) --[[ GetAbilities | Line: 648 ]]
	return p1.Abilities
end
function t.GetAbility(p1, p2) --[[ GetAbility | Line: 655 ]]
	return p1.Abilities[p2]
end
function t.AddAbility(p1, p2) --[[ AddAbility | Line: 662 | Upvalues: v7 (copy), v8 (copy) ]]
	return v8.AddAbility((v7.MergeOriginal(p2, {
		Target = p1
	})))
end
function t.RemoveAbility(p1, p2) --[[ RemoveAbility | Line: 672 | Upvalues: v8 (copy) ]]
	return v8.RemoveAbility(p1, p2)
end
function t.RemoveAllAbilities(p1) --[[ RemoveAllAbilities | Line: 678 ]]
	for k, v in pairs(p1.Abilities) do
		v:Destroy()
	end
	p1.Abilities = {}
end
function t.GetEmptyAbilitySlot(p1) --[[ GetEmptyAbilitySlot | Line: 688 ]]
	local t = {}
	for v1, v2 in p1.AbilitiesFolder:GetAttributes() do
		t[v2] = true
	end
	local count = 1
	while t[count] do
		count = count + 1
	end
	return count
end
function t.GetSlotForAbility(p1, p2) --[[ GetSlotForAbility | Line: 703 ]]
	local v1 = p1.AbilitiesFolder:GetAttribute(p2)
	if tonumber(v1) then
		return v1
	else
		return nil
	end
end
function t._onAbilityChanged(p1, p2) --[[ _onAbilityChanged | Line: 714 | Upvalues: v9 (copy), v8 (copy) ]]
	if p1:GetAbilityAttribute(p2) then
		local v1 = not p1._cachedAbilities[p2]
		p1._cachedAbilities[p2] = true
		if not v1 then
			return
		end
		if not (p1.Abilities[p2] or v9) then
			p1.Abilities[p2] = v8.AddAbility({
				Name = p2,
				Target = p1
			})
		end
		p1.AbilityAddedSignal:Fire(p2)
		return
	end
	if not p1._cachedAbilities[p2] then
		return
	end
	p1._cachedAbilities[p2] = nil
	p1.AbilityRemovedSignal:Fire(p2)
end
function t.CanActivateAbility(p1, p2) --[[ CanActivateAbility | Line: 739 ]]
	local v1 = p1:GetAbility(p2)
	if v1 then
		return v1:CanActivate()
	else
		return false
	end
end
function t.CanDeactivateAbility(p1, p2) --[[ CanDeactivateAbility | Line: 751 ]]
	local v1 = p1:GetAbility(p2)
	if v1 then
		return v1:CanDeactivate()
	else
		return false
	end
end
function t.ActivateAbility(p1, p2, p3, ...) --[[ ActivateAbility | Line: 763 | Upvalues: v9 (copy), v8 (copy) ]]
	local v1 = p1:GetAbility(p2)
	if not v1 then
		return
	end
	if v9 then
		return v1:Activate(p3, ...)
	end
	if not p3 and v1:IsInTargetMode() then
		v1:ExitTargetMode()
		return
	end
	local v2 = v1:CanActivate(p3)
	if v2 ~= true then
		return v2
	end
	if not p3 and v1:RequiresTarget() then
		v1:EnterTargetMode()
		return
	end
	local v3 = v8.RequestToActivateAbility(p2, p3, ...)
	if v3 ~= true then
		return v3
	end
	v1:Activate(p3, ...)
	return v3
end
function t.DeactivateAbility(p1, p2, ...) --[[ DeactivateAbility | Line: 795 | Upvalues: v9 (copy), v8 (copy) ]]
	local v1 = p1:GetAbility(p2)
	if not v1 then
		return false
	end
	if v9 then
		return v1:Deactivate(...)
	end
	if v8.RequestToDeactivateAbility(p2, ...) ~= true then
		return false
	end
	v1:Deactivate(...)
	return false
end
function t.TickAbilities(p1, p2) --[[ TickAbilities | Line: 813 | Upvalues: v13 (copy), v12 (copy) ]]
	local v1 = if p2 then p2 else os.clock()
	if not p1.NextAbilityTick then
		p1.NextAbilityTick = v1 + v13.AbilityTickRate * 0.7
		return
	end
	if v1 < p1.NextAbilityTick then
		return
	end
	p1.NextAilmentTick = v1 + v12.AilmentTickRate * 0.7
	for v2, v3 in p1:GetAbilities() do
		if v3 and v3.Tick then
			local v4, v5 = pcall(function() --[[ Line: 830 | Upvalues: v3 (copy) ]]
				return v3:Tick()
			end)
			if not v4 then
				warn("\226\154\160\239\184\143 CharacterData, Ability tick error for:", v3.Name, "-", v5)
			end
		end
	end
	for v6, v7 in p1:GetPassiveAbilities() do
		if v7 and v7.Tick then
			local v8, v9 = pcall(function() --[[ Line: 843 | Upvalues: v7 (copy) ]]
				return v7:Tick()
			end)
			if not v8 then
				warn("\226\154\160\239\184\143 CharacterData, PassiveAbility tick error for:", v7.Name, "-", v9)
			end
		end
	end
end
function t.SetPassiveAbility(p1, p2, p3) --[[ SetPassiveAbility | Line: 855 | Upvalues: v9 (copy), v10 (copy) ]]
	p1.PassiveAbilities[p2] = p3
	if p3 then
		p1.PassiveAbilityAddedSignal:Fire(p2, p3)
	else
		p1.PassiveAbilityRemovedSignal:Fire(p2)
	end
	if not (v9 and v10) then
		return
	end
	if p3 then
		local v1 = print
		local format = string.format
		v1(format("\226\158\149 CharacterData, %s Added passive ability: %s", tostring(p1.Model.Name), p2))
		return
	end
	local v3 = print
	local format = string.format
	v3(format("\226\158\150 CharacterData, %s Removed passive ability: %s", tostring(p1.Model.Name), p2))
end
function t.GetPassiveAbilities(p1) --[[ GetPassiveAbilities | Line: 875 ]]
	return p1.PassiveAbilities
end
function t.GetPassiveAbility(p1, p2) --[[ GetPassiveAbility | Line: 882 ]]
	return p1.PassiveAbilities[p2]
end
function t.AddPassiveAbility(p1, p2) --[[ AddPassiveAbility | Line: 889 | Upvalues: v7 (copy), v8 (copy) ]]
	return v8.AddPassiveAbility((v7.MergeOriginal(p2, {
		Target = p1
	})))
end
function t.RemovePassiveAbility(p1, p2) --[[ RemovePassiveAbility | Line: 898 | Upvalues: v8 (copy) ]]
	return v8.RemovePassiveAbility(p1, p2)
end
function t.RemoveAllPassiveAbilities(p1) --[[ RemoveAllPassiveAbilities | Line: 903 ]]
	for k, v in pairs(p1.PassiveAbilities) do
		v:Destroy()
	end
	p1.PassiveAbilities = {}
end
function t.GetPassiveAbilitiesForStat(p1, p2) --[[ GetPassiveAbilitiesForStat | Line: 913 | Upvalues: v8 (copy) ]]
	return v8.GetPassiveAbilitiesForStat(p1, p2)
end
function t.ConsumePassiveFrom(p1, p2) --[[ ConsumePassiveFrom | Line: 922 | Upvalues: v8 (copy) ]]
	return v8.ConsumePassiveFrom(p1, p2)
end
function t._onPassiveAbilityChildAdded(p1, p2) --[[ _onPassiveAbilityChildAdded | Line: 926 | Upvalues: v9 (copy), v8 (copy) ]]
	if p1._cachedPassiveAbilities[p2.Name] then
		return
	end
	p1._cachedPassiveAbilities[p2.Name] = true
	if not (v9 or p1.PassiveAbilities[p2.Name]) then
		local v1 = v8.AddPassiveAbility({
			Name = p2.Name,
			Target = p1,
			Tier = p2:GetAttribute("Tier")
		})
		if v1 then
			p1.PassiveAbilities[p2.Name] = v1
		end
	end
	p1.PassiveAbilityAddedSignal:Fire(p2.Name)
end
function t._onPassiveAbilityChildRemoved(p1, p2) --[[ _onPassiveAbilityChildRemoved | Line: 946 | Upvalues: v9 (copy) ]]
	if not p1._cachedPassiveAbilities[p2.Name] then
		return
	end
	p1._cachedPassiveAbilities[p2.Name] = nil
	if not v9 then
		local v1 = p1.PassiveAbilities[p2.Name]
		if v1 then
			p1.PassiveAbilities[p2.Name] = nil
			if v1.Maid then
				v1.Maid:Destroy()
			end
		end
	end
	p1.PassiveAbilityRemovedSignal:Fire(p2.Name)
end
function t.GetPassiveAbilityAddedSignal(p1) --[[ GetPassiveAbilityAddedSignal | Line: 965 ]]
	return p1.PassiveAbilityAddedSignal
end
function t.GetPassiveAbilityRemovedSignal(p1) --[[ GetPassiveAbilityRemovedSignal | Line: 969 ]]
	return p1.PassiveAbilityRemovedSignal
end
function t.Init(p1) --[[ Init | Line: 976 | Upvalues: v11 (copy), t2 (copy) ]]
	for k, v in pairs(v11.Compressed) do
		if t2[v] then
			warn("\226\157\140 CharacterData, Duplicate compression code", v, "for", k)
		end
		t2[v] = k
	end
end
t:Init()
return t