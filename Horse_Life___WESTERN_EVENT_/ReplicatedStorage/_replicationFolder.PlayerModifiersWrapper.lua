-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Signal")
local v2 = Sonar("FormatTime")
local v3 = Sonar("StorageUtils")
local v4 = game:GetService("RunService"):IsServer()
local v5 = v3.GetConfig("PlayerModifiers")()
local v6 = v3.Get("PlayerModifiers")()
local BaseStats = v5.BaseStats
function t.new(p1) --[[ new | Line: 71 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = p1.Maid
	v2.Player = p1.Player
	v2.PlayerWrapper = p1
	v2.PlayerData = v2.PlayerWrapper.PlayerData
	if v2.PlayerWrapper:IsLocalOrServer() then
		v2:_initModifiers()
	end
	return v2
end
function t._initModifiers(p1) --[[ _initModifiers | Line: 90 | Upvalues: v4 (copy), v1 (copy) ]]
	p1.ActiveModifiers = {}
	p1._cachedModifiers = {}
	if v4 then
		p1.ModifiersFolder = Instance.new("Configuration")
		p1.ModifiersFolder.Name = "Modifiers"
		p1.ModifiersFolder.Parent = p1.Player
		p1.Maid:GiveTask(p1.ModifiersFolder)
	else
		p1.ModifiersFolder = p1.Player:WaitForChild("Modifiers")
	end
	p1.PlayerWrapper:AddOnRemovedCallback(function() --[[ Line: 106 | Upvalues: p1 (copy) ]]
		p1:_saveModifiers()
	end)
	p1.PlayerWrapper:AddOnTickCallback(function() --[[ Line: 112 | Upvalues: p1 (copy) ]]
		p1:_tickModifiers()
	end)
	p1.ModifierAddedSignal = v1.new()
	p1.Maid:GiveTask(p1.ModifierAddedSignal)
	p1.ModifierRemovedSignal = v1.new()
	p1.Maid:GiveTask(p1.ModifierRemovedSignal)
	p1.Maid:GiveTask(p1.ModifiersFolder.AttributeChanged:Connect(function(p12) --[[ Line: 122 | Upvalues: p1 (copy) ]]
		p1:_onModifierChanged(p12)
	end))
	for v12, v2 in p1.ModifiersFolder:GetAttributes() do
		p1:_onModifierChanged(v12)
	end
end
function t._getModifierDataValue(p1, p2) --[[ _getModifierDataValue | Line: 154 ]]
	return nil
end
function t._tickModifiers(p1) --[[ _tickModifiers | Line: 162 | Upvalues: v2 (copy) ]]
	p1.LastModifierCheck = p1.LastModifierCheck or tick()
	if tick() - p1.LastModifierCheck < 1 then
		return
	end
	p1.LastModifierCheck = tick()
	for v22, v3 in p1.ModifiersFolder:GetAttributes() do
		if v3.Offset ~= -1 and v2.GetTime() >= v3.Offset then
			p1:RemoveModifier(v22)
		end
	end
end
function t._saveModifiers(p1) --[[ _saveModifiers | Line: 179 ]]
	for k, v in pairs(p1.ActiveModifiers) do
		if v.EndTime ~= -1 then
			local v1 = p1:_getModifierDataValue(k)
			if v1 then
				v1.Value = math.max(0, v1.Value - (workspace:GetServerTimeNow() - v.StartTime))
			end
		end
	end
end
function t._onModifierChanged(p1, p2) --[[ _onModifierChanged | Line: 194 | Upvalues: v4 (copy), v2 (copy) ]]
	local v1 = p1:GetModifier(p2)
	if v1 then
		local v22 = not p1._cachedModifiers[p2]
		p1._cachedModifiers[p2] = v1
		if not v22 then
			return
		end
		if v4 then
			print(string.format("\240\159\147\136 PlayerModifiersWrapper, %s Added modifier: %s Value: %d Expires: %s", tostring(p1.Player), p2, v1.Scale, if v1.Offset == -1 then "Never" else v2.FormatString(v1.Offset - workspace:GetServerTimeNow())))
		end
		p1.ModifierAddedSignal:Fire(p2, v1)
		return
	end
	if not p1._cachedModifiers[p2] then
		return
	end
	if v4 then
		local v7 = print
		local format = string.format
		v7(format("\240\159\147\137 PlayerModifiersWrapper, %s Removed modifier: %s", tostring(p1.Player), p2))
	end
	p1._cachedModifiers[p2] = nil
	p1.ModifierRemovedSignal:Fire(p2)
end
function t._doesModifierEffectStat(p1, p2, p3) --[[ _doesModifierEffectStat | Line: 224 ]]
	for k, v in pairs(p2.TargetStats) do
		if p3 == v then
			return true
		end
	end
	return false
end
function t._getBaseStat(p1, p2) --[[ _getBaseStat | Line: 236 | Upvalues: BaseStats (copy) ]]
	return BaseStats[p2]
end
function t.GetWithModifiers(p1, p2) --[[ GetWithModifiers | Line: 249 | Upvalues: v6 (copy), v5 (copy) ]]
	local v1 = p1:_getBaseStat(p2)
	if v1 then
		for v2, v3 in p1:GetModifiers() do
			if v3.Scale ~= 0 then
				local v4 = v6[v2]
				if v4 and (p1:_doesModifierEffectStat(v4, p2) and v4.OnGet) then
					local v52 = v4.OnGet(p2, v1, v3.Scale)
					if v52 then
						v1 = v52
					end
				end
			end
		end
		if v5.ApplyAdditionalModifiers then
			local v62 = v5.ApplyAdditionalModifiers(p1.PlayerWrapper, p2, v1)
			if v62 then
				v1 = v62
			end
		end
	end
	return v1
end
function t.GetModifiers(p1) --[[ GetModifiers | Line: 283 ]]
	return p1.ModifiersFolder:GetAttributes()
end
function t.GetModifier(p1, p2) --[[ GetModifier | Line: 290 ]]
	return p1.ModifiersFolder:GetAttribute(p2)
end
function t.GetModifierChangedSignal(p1, p2) --[[ GetModifierChangedSignal | Line: 297 ]]
	return p1.ModifiersFolder:GetAttributeChangedSignal(p2)
end
function t.GetModifierAddedSignal(p1) --[[ GetModifierAddedSignal | Line: 303 ]]
	return p1.ModifierAddedSignal
end
function t.GetModifierRemovedSignal(p1) --[[ GetModifierRemovedSignal | Line: 309 ]]
	return p1.ModifierRemovedSignal
end
function t.AddModifier(p1, p2) --[[ AddModifier | Line: 318 | Upvalues: v4 (copy), v6 (copy), v2 (copy) ]]
	if not v4 then
		warn("\226\154\160\239\184\143 PlayerModifiersWrapper, AddModifier can only be called on the server")
		return
	end
	if not v6[p2.Type] then
		warn("\226\154\160\239\184\143 PlayerModifiersWrapper, Unknown modifier type:", p2.Type)
		return
	end
	local v1 = p1.ActiveModifiers[p2.Type] or {}
	local sum = v1.Value or (if p2.Value then 0 else 1)
	if p2.Value then
		sum = sum + p2.Value
	end
	local v22 = v1.Start or v2.GetTime()
	local v3 = if p2.Duration then (v1.EndTime or v22) + p2.Duration else -1
	p1.ActiveModifiers[p2.Type] = {
		StartTime = v22,
		EndTime = v3,
		Value = sum
	}
	p1.ModifiersFolder:SetAttribute(p2.Type, UDim.new(sum, v3))
	return function() --[[ Line: 353 | Upvalues: p1 (copy), p2 (copy) ]]
		p1:RemoveModifier(p2.Type)
	end
end
function t.RemoveModifier(p1, p2) --[[ RemoveModifier | Line: 360 | Upvalues: v4 (copy) ]]
	if not v4 then
		warn("\226\154\160\239\184\143 PlayerModifiersWrapper, RemoveModifier can only be called on the server")
		return
	end
	p1.ActiveModifiers[p2] = nil
	p1.ModifiersFolder:SetAttribute(p2, nil)
	local v1 = p1:_getModifierDataValue(p2)
	if not v1 then
		return
	end
	v1.Value = 0
end
function t.Init(p1) --[[ Init | Line: 378 ]] end
t:Init()
return t