-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("SettingsService", {
	Deferred = true
})
local v2 = Sonar("Signal")
local v3 = game:GetService("RunService"):IsServer()
function t.new(p1) --[[ new | Line: 138 | Upvalues: t (copy), v3 (copy), v1 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = p1.Maid
	v2.IsLocalPlayer = p1.IsLocalPlayer
	v2.Player = p1.Player
	v2.PlayerWrapper = p1
	if v2.PlayerWrapper:IsLocalOrServer() then
		v2.SettingsData = v2.PlayerWrapper.PlayerData.Settings
	end
	v2.TemporarySettings = {}
	if not v3 then
		v2.SettingsFolder = v2.Player:WaitForChild("Settings")
		return v2
	end
	v2.SettingsFolder = Instance.new("Configuration")
	v2.SettingsFolder.Name = "Settings"
	v2.SettingsFolder.Parent = v2.Player
	v2.Maid:GiveTask(v2.SettingsFolder)
	for v32, v4 in v2.SettingsData:GetChildren() do
		local v5 = v1.GetSettingFromName(v4.Name)
		if v5 and v5.Default then
			if v5.MaxValue and v5.MinValue then
				v4.Value = v1:_clampSetting(v4.Value, v5)
				continue
			end
			if v5.Choices and not table.find(v5.Choices, v4.Value) then
				v4.Value = v5.Default
			end
		end
	end
	for v6, v7 in v1.GetAllSettings() do
		if v7.Replicate then
			local v8 = v2:GetSettingValue(v6)
			if v8 then
				local function replicateSetting() --[[ replicateSetting | Line: 184 | Upvalues: v2 (copy), v6 (copy), v8 (copy) ]]
					v2.SettingsFolder:SetAttribute(v6, v8.Value)
				end
				v2.Maid:GiveTask(v8:GetPropertyChangedSignal("Value"):Connect(replicateSetting))
				v2.SettingsFolder:SetAttribute(v6, v8.Value)
			end
		end
	end
	return v2
end
function t._getSettingValueOverride(p1, p2) --[[ _getSettingValueOverride | Line: 200 | Upvalues: v1 (copy) ]]
	local v12 = v1.GetSettingFromName(p2)
	if not v12 then
		return nil
	end
	if not v12.ValueOverride then
		return nil
	end
	if type(v12.ValueOverride) == "function" then
		return v12.ValueOverride(p1.PlayerWrapper)
	else
		return v12.ValueOverride
	end
end
function t.AddTemporarySetting(p1, p2) --[[ AddTemporarySetting | Line: 217 ]]
	p1.TemporarySettings[p2.Name] = p2
	return p2
end
function t.GetTemporarySetting(p1, p2) --[[ GetTemporarySetting | Line: 222 ]]
	return p1.TemporarySettings[p2]
end
function t._setSetting(p1, p2, p3) --[[ _setSetting | Line: 226 ]]
	local v1 = p1:GetSettingValue(p2)
	if v1 then
		v1.Value = p3
	else
		p1.SettingsFolder:SetAttribute(p2, p3)
	end
end
function t.GetSettingValue(p1, p2) --[[ GetSettingValue | Line: 235 ]]
	local v1 = p1:_getSettingValueOverride(p2)
	if v1 then
		return v1
	end
	if p1.SettingsData then
		return p1.SettingsData:FindFirstChild(p2, true)
	else
		return nil
	end
end
function t.SetSetting(p1, p2, p3) --[[ SetSetting | Line: 247 | Upvalues: v1 (copy) ]]
	return v1.SetSetting(p1.Player, p2, p3)
end
function t.ChangeSetting(p1, p2, ...) --[[ ChangeSetting | Line: 251 | Upvalues: v1 (copy) ]]
	return v1.ChangeSetting(p1.Player, p2, ...)
end
function t.GetSetting(p1, p2, p3) --[[ GetSetting | Line: 255 | Upvalues: v1 (copy) ]]
	local v12 = p1:GetSettingValue(p2)
	if v12 then
		if not p3 then
			return v12.Value
		end
		local v2 = v12:FindFirstChild(p3, true)
		if v2 then
			return v2.Value
		else
			return nil
		end
	else
		if not (v1.GetSettingFromName(p2) or p1:GetTemporarySetting(p2)) then
			return nil
		end
		return p1.SettingsFolder:GetAttribute(p2)
	end
end
function t.GetSettingChangedSignal(p1, p2) --[[ GetSettingChangedSignal | Line: 278 | Upvalues: v2 (copy) ]]
	local v1 = v2.new()
	local v22 = p1:GetSettingValue(p2)
	if not v22 then
		v1.Maid:GiveTask(p1.SettingsFolder:GetAttributeChangedSignal(p2):Connect(function() --[[ Line: 296 | Upvalues: v1 (copy) ]]
			v1:Fire()
		end))
		return v1
	end
	v1.Maid:GiveTask(v22:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 284 | Upvalues: v1 (copy) ]]
		v1:Fire()
	end))
	for v3, v4 in v22:GetChildren() do
		v1.Maid:GiveTask(v4:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 289 | Upvalues: v1 (copy) ]]
			v1:Fire()
		end))
	end
	return v1
end
function t.CanBeRequested(p1, p2, p3) --[[ CanBeRequested | Line: 304 | Upvalues: v1 (copy) ]]
	return v1.CanPlayerBeRequested(p2, p1.Player, p3)
end
return t