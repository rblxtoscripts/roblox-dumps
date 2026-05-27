-- https://lua.expert/
game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Constants")
local v2 = Sonar("Table")
local v3 = Sonar("PlayerWrapper").GetClient()
local v4 = Sonar("SettingsService")
local v5 = Sonar("StorageUtils")
local LightingSettings = v1.LightingSettings
Sonar(v5.Get("Filters"))
local v6 = v2.DeepCopy(LightingSettings)
local t = {}
local t2 = { "Default" }
local t3 = {}
function t.setLightingMode(p1, p2, p3, p4) --[[ setLightingMode | Line: 23 | Upvalues: v6 (copy), t2 (copy), t3 (copy), t (copy) ]]
	if not v6[p1] then
		warn(p1, "is not a valid lighting mode. Did you define it?", debug.traceback())
		return
	end
	if not p2 and table.find(t2, p1) then
		return
	end
	local v1 = t3[p1]
	t3[p1] = p2
	if p3 or p2 == v1 then
		return
	end
	t.refreshLighting(p4)
end
function t.DisableAllStates() --[[ DisableAllStates | Line: 44 | Upvalues: t3 (copy), t2 (copy), t (copy) ]]
	for k, v in pairs(t3) do
		if not table.find(t2, k) then
			t3[k] = false
		end
	end
	t.refreshLighting(true)
end
function t.setSettingDynamically(p1, p2, p3, p4) --[[ setSettingDynamically | Line: 54 | Upvalues: v6 (copy), t (copy) ]]
	local v1 = v6[p1][p2][p3]
	v6[p1][p2][p3] = p4
	local v2 = typeof(p4) == "Color3"
	local v3 = if typeof(p4) == "number" then true else false
	if v2 then
		if math.abs(p4.R - v1.R) > 0.01 or (math.abs(p4.G - v1.G) > 0.01 or math.abs(p4.B - v1.B) > 0.01) then
			t.refreshLighting()
		end
	else
		if not (v3 and math.abs(p4 - v1) > 0.01) then
			return
		end
		t.refreshLighting()
	end
end
function t.getLightingModeEnabled(p1) --[[ getLightingModeEnabled | Line: 72 | Upvalues: t3 (copy) ]]
	return t3[p1]
end
function t.GetEnabledLightingModes() --[[ GetEnabledLightingModes | Line: 76 | Upvalues: t3 (copy), v6 (copy) ]]
	local t = {}
	for v1, v2 in t3 do
		if v2 then
			t[#t + 1] = {
				Name = v1,
				Priority = v6[v1] and v6[v1].Priority or 999999
			}
		end
	end
	table.sort(t, function(p1, p2) --[[ Line: 85 ]]
		if p1.Priority == p2.Priority then
			return p1.Name < p2.Name
		else
			return p1.Priority < p2.Priority
		end
	end)
	local t2 = {}
	for v5, v62 in t do
		t2[#t2 + 1] = v62.Name
	end
	return t2
end
function t.getDefaultProperty(p1, p2, p3) --[[ getDefaultProperty | Line: 98 | Upvalues: LightingSettings (copy) ]]
	return LightingSettings[p1][p2][p3]
end
function t.refreshLighting(p1) --[[ refreshLighting | Line: 102 | Upvalues: t3 (copy), v6 (copy), t (copy) ]]
	local tbl = {}
	local t2 = {}
	for k, v in pairs(t3) do
		local v1 = v6[k]
		if v then
			tbl[#tbl + 1] = {
				name = k,
				data = v1
			}
		end
	end
	table.sort(tbl, function(p1, p2) --[[ Line: 112 ]]
		return p1.data.Priority < p2.data.Priority
	end)
	for k, v in pairs(tbl) do
		for k2, v2 in pairs(v.data) do
			if typeof(v2) == "table" then
				t2[k2] = t2[k2] or {}
				for k3, v3 in pairs(v2) do
					t2[k2][k3] = v3
				end
				continue
			end
			t2[k2] = v2
		end
	end
	t.updateLighting(t2, p1)
end
local t4 = {}
local t5 = {}
local function getOrMakeTerrainValue(p1) --[[ getOrMakeTerrainValue | Line: 134 | Upvalues: t4 (copy) ]]
	local v1 = Enum.Material[p1]
	local v2 = t4[v1]
	if not v2 then
		v2 = Instance.new("Color3Value", game.Lighting)
		v2.Value = workspace.Terrain:GetMaterialColor(v1)
		v2.Changed:Connect(function() --[[ Line: 140 | Upvalues: v1 (ref), v2 (ref) ]]
			workspace.Terrain:SetMaterialColor(v1, v2.Value)
		end)
		t4[v1] = v2
	end
	return v2
end
local function applyValues(p1, p2, p3) --[[ applyValues | Line: 148 | Upvalues: v4 (copy), v3 (copy), t5 (copy), TweenService (copy), getOrMakeTerrainValue (copy) ]]
	local v1 = if p1.Name == "Terrain" then true else false
	local v2 = if p1.Name == "Sky" then true else false
	if if p1.Name == "Bloom" then true else false then
		p1.Enabled = not v4.GetSetting(v3, "LightingBloomEffect")
	end
	if v1 or v2 then
		if v1 then
			for k, v in pairs(p2) do
				local v42 = getOrMakeTerrainValue(k)
				if t5[k] then
					t5[k]:Cancel()
				end
				t5[k] = TweenService:Create(v42, TweenInfo.new(p3), {
					Value = v
				})
				t5[k]:Play()
			end
		else
			if not v2 then
				return
			end
			local v5 = nil
			for k, v in pairs(p2) do
				if p1[k] == v then
					v5 = true
				end
				p1[k] = v
			end
			if v5 then
				return
			end
			local v6 = p1:Clone()
			task.defer(function() --[[ Line: 184 | Upvalues: v6 (copy), p1 (copy) ]]
				v6.Parent = game.Lighting
				p1:Destroy()
			end)
		end
	else
		for k, v in pairs(p2) do
			task.defer(function() --[[ Line: 157 | Upvalues: t5 (ref), p1 (copy), k (copy), TweenService (ref), p3 (copy), v (copy) ]]
				if t5[p1] then
					t5[k]:Cancel()
				end
				t5[k] = TweenService:Create(p1, TweenInfo.new(p3), {
					[k] = v
				})
				t5[k]:Play()
			end)
		end
	end
end
function t.updateLighting(p1, p2) --[[ updateLighting | Line: 193 | Upvalues: applyValues (copy) ]]
	local v1 = if p2 then 0 else p1.TweenTime or 0
	for k, v in pairs(p1) do
		if k == "Lighting" then
			applyValues(game.Lighting, v, v1)
			continue
		end
		if game.Lighting:FindFirstChild(k) then
			applyValues(game.Lighting[k], v, v1)
			continue
		end
		if k == "Terrain" then
			applyValues(workspace.Terrain, v, v1)
			continue
		end
		if k == "Clouds" then
			applyValues(workspace.Terrain.Clouds, v, v1)
			continue
		end
		if k == "Sky" then
			applyValues(game.Lighting.Sky, v, nil)
		end
	end
end
v4.GetSettingChangedSignal(v3, "LightingBloomEffect"):Connect(function() --[[ Line: 210 | Upvalues: t (copy) ]]
	t.refreshLighting(true)
end)
for v7, v8 in t2 do
	t.setLightingMode(v8, true)
end
return t