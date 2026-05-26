-- https://lua.expert/
local t = {}
local CollectionService = game:GetService("CollectionService")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("LightingService", {
	Context = "Client",
	Deferred = true
})
local v2 = Sonar("NotificationsClient", {
	Context = "Client",
	Deferred = true
})
local v3 = Sonar("PlaceTypeService")
local v4 = Sonar("StorageUtils")
local v5 = Sonar("TimeSeed")
local v6 = Sonar("WeightedProbability")
local v7 = Sonar("PlayerWrapper")
local v8 = Sonar("SettingsService")
local v9 = Sonar(v4.Get("Weathers"))
local v10 = RunService:IsServer()
local Ambience = SoundService:FindFirstChild("Ambience")
local function toggleMuffleEQ(p1) --[[ toggleMuffleEQ | Line: 94 | Upvalues: CollectionService (copy) ]]
	for v1, v2 in CollectionService:GetTagged("MuffleEQ") do
		v2.Enabled = p1
	end
end
local function getWeatherPart() --[[ getWeatherPart | Line: 101 ]]
	local CurrentCamera = workspace.CurrentCamera
	if CurrentCamera then
		return CurrentCamera:FindFirstChild("WeatherPart")
	else
		return nil
	end
end
local function weatherEffectsEnabled() --[[ weatherEffectsEnabled | Line: 108 | Upvalues: v10 (copy), v7 (copy), v8 (copy) ]]
	if v10 then
		return true
	end
	local v1 = v7.GetClient()
	if not v1 then
		return true
	end
	local v2 = v8.GetSettingValue(v1, "WeatherEffects")
	if not v2 then
		return true
	end
	return v2.Value ~= false
end
local v11 = v5.new({
	Duration = 600
})
function t.PickWeather(p1, p2, p3) --[[ PickWeather | Line: 129 | Upvalues: v11 (copy), v9 (copy), v6 (copy) ]]
	if not p2 then
		p2 = v11:GetSeed()
	end
	if not p3 then
		p3 = 0
	end
	if not next(v9) then
		return "Normal"
	end
	local v2 = v6.getRandomWeightedItem(v9, p2 + p3) or "Normal"
	local v3 = v9[v2]
	local v4 = 20
	if v3 and v3.Temp then
		if typeof(v3.Temp) == "NumberRange" then
			v4 = math.random(v3.Temp.Min, v3.Temp.Max)
		elseif typeof(v3.Temp) == "number" then
			v4 = v3.Temp
		end
	end
	return v2, v4
end
function t.GetFutureWeathers(p1, p2) --[[ GetFutureWeathers | Line: 159 | Upvalues: v11 (copy) ]]
	local v2 = math.max(1, tonumber(p2) or 1)
	local v3 = v11:GetSeed()
	local v4 = table.create(v2)
	for i = 0, v2 - 1 do
		local v5, v6 = p1:PickWeather(v3, i)
		v4[i + 1] = {
			Weather = v5,
			Temp = v6
		}
	end
	return v4
end
function t.GetSecondsUntilNextWeather(p1) --[[ GetSecondsUntilNextWeather | Line: 176 | Upvalues: v11 (copy) ]]
	return v11:GetTime()
end
function t.GetWeather(p1) --[[ GetWeather | Line: 181 | Upvalues: Lighting (copy) ]]
	return Lighting:GetAttribute("Weather") or p1:PickWeather()
end
function t.GetWeatherData(p1, p2) --[[ GetWeatherData | Line: 186 | Upvalues: v9 (copy) ]]
	return v9[p2]
end
function t.SetWeather(p1, p2) --[[ SetWeather | Line: 191 | Upvalues: v10 (copy), v9 (copy), Lighting (copy) ]]
	if not v10 then
		return
	end
	if not v9[p2] then
		p2 = "Normal"
	end
	Lighting:SetAttribute("Weather", p2)
	local v1 = v9[p2]
	if not (v1 and v1.OnSelect) then
		return
	end
	task.spawn(v1.OnSelect)
end
function t.SetZoneWeather(p1, p2) --[[ SetZoneWeather | Line: 209 ]]
	if p2 == "" then
		p2 = nil
	end
	p1._zoneWeather = p2
	p1:_refreshWeather()
end
function t.ClearZoneWeather(p1) --[[ ClearZoneWeather | Line: 219 ]]
	p1:SetZoneWeather(nil)
end
function t.ApplyWeather(p1, p2) --[[ ApplyWeather | Line: 224 | Upvalues: v9 (copy), CollectionService (copy) ]]
	if p2 == "" then
		p2 = nil
	end
	local v1 = p2 and v9[p2] or nil
	p1:_setParticles(v1)
	p1:_setLighting(v1)
	p1:_setAmbience(v1)
	local v2 = if v1 == nil then false elseif v1.MufflesAudio == true then true else false
	for v3, v4 in CollectionService:GetTagged("MuffleEQ") do
		v4.Enabled = v2
	end
	p1._activeWeather = p2
	p1._activeData = v1
end
function t._refreshWeather(p1) --[[ _refreshWeather | Line: 242 ]]
	local v1 = p1._zoneWeather or p1._globalWeather
	if v1 ~= p1._activeWeather then
		p1:ApplyWeather(v1)
	end
end
function t._setParticles(p1, p2) --[[ _setParticles | Line: 251 | Upvalues: v10 (copy), v7 (copy), v8 (copy) ]]
	local CurrentCamera = workspace.CurrentCamera
	local v1 = if CurrentCamera then CurrentCamera:FindFirstChild("WeatherPart") else nil
	if not v1 then
		return
	end
	local v2
	if v10 then
		v2 = true
	else
		local v3 = v7.GetClient()
		if v3 then
			local v4 = v8.GetSettingValue(v3, "WeatherEffects")
			v2 = if v4 then if v4.Value == false then false else true else true
		else
			v2 = true
		end
	end
	if v2 then
		local t = {}
		if p2 and p2.Particles then
			for v5, v6 in p2.Particles do
				t[v6] = true
			end
		end
		for v72, v82 in v1:GetChildren() do
			if v82:IsA("ParticleEmitter") then
				v82.Enabled = t[v82.Name] == true
			end
		end
	else
		for v102, v11 in v1:GetChildren() do
			if v11:IsA("ParticleEmitter") then
				v11.Enabled = false
			end
		end
	end
end
function t._setLighting(p1, p2) --[[ _setLighting | Line: 281 | Upvalues: v1 (copy) ]]
	local v12 = p1._activeData and p1._activeData.LightingMode
	local v2 = if p2 then p2.LightingMode else p2
	if v12 and v12 ~= v2 then
		v1.setLightingMode(v12, false)
	end
	if not v2 then
		return
	end
	v1.setLightingMode(v2, true)
end
function t._setAmbience(p1, p2) --[[ _setAmbience | Line: 295 | Upvalues: Ambience (copy), v9 (copy) ]]
	if not Ambience then
		return
	end
	local v1 = if p2 then p2.Sound else p2
	for v2, v3 in v9 do
		if v3.Sound and v3.Sound ~= v1 then
			local v4 = Ambience:FindFirstChild(v3.Sound)
			if v4 and (v4:IsA("Sound") and v4.Playing) then
				v4:Stop()
			end
		end
	end
	if not v1 then
		return
	end
	local v5 = Ambience:FindFirstChild(v1)
	if not v5 or (not v5:IsA("Sound") or v5.Playing) then
		return
	end
	v5:Play()
end
function t.SetWeatherOverride(p1, p2) --[[ SetWeatherOverride | Line: 322 | Upvalues: v10 (copy) ]]
	if v10 then
		p1._weatherOverride = p2
		p1:SetWeather(p2)
	end
end
function t.ClearWeatherOverride(p1) --[[ ClearWeatherOverride | Line: 332 | Upvalues: v10 (copy) ]]
	if v10 then
		p1._weatherOverride = nil
		p1:SetWeather(p1:PickWeather())
	end
end
function t._startClock(p1) --[[ _startClock | Line: 342 | Upvalues: v11 (copy) ]]
	v11.SeedChanged:Connect(function() --[[ Line: 343 | Upvalues: p1 (copy) ]]
		if not p1._weatherOverride then
			p1:SetWeather(p1:PickWeather())
		end
	end)
	p1:SetWeather(p1:PickWeather())
end
function t._initClient(p1) --[[ _initClient | Line: 355 | Upvalues: Lighting (copy), v2 (copy), v11 (copy) ]]
	local CurrentCamera = workspace.CurrentCamera
	local v1
	if not CurrentCamera then
		v1 = function() --[[ updateGlobal | Line: 361 | Upvalues: p1 (copy), Lighting (ref), v2 (ref) ]]
			local _globalWeather = p1._globalWeather
			p1._globalWeather = Lighting:GetAttribute("Weather") or p1:PickWeather()
			p1:_refreshWeather()
			if not _globalWeather or (p1._globalWeather == _globalWeather or p1._globalWeather == "Normal") then
				return
			end
			v2.Notify({
				Type = "Weather",
				ChatOnly = true,
				Message = ("The weather has changed to %*!"):format(p1._globalWeather)
			})
		end
		Lighting:GetAttributeChangedSignal("Weather"):Connect(v1)
		v11.SeedChanged:Connect(v1)
		v1()
		return
	end
	CurrentCamera:WaitForChild("WeatherPart", 30)
	v1 = function() --[[ updateGlobal | Line: 361 | Upvalues: p1 (copy), Lighting (ref), v2 (ref) ]]
		local _globalWeather = p1._globalWeather
		p1._globalWeather = Lighting:GetAttribute("Weather") or p1:PickWeather()
		p1:_refreshWeather()
		if not _globalWeather or (p1._globalWeather == _globalWeather or p1._globalWeather == "Normal") then
			return
		end
		v2.Notify({
			Type = "Weather",
			ChatOnly = true,
			Message = ("The weather has changed to %*!"):format(p1._globalWeather)
		})
	end
	Lighting:GetAttributeChangedSignal("Weather"):Connect(v1)
	v11.SeedChanged:Connect(v1)
	v1()
end
function t._bindWeatherEffectsSetting(p1) --[[ _bindWeatherEffectsSetting | Line: 381 | Upvalues: v7 (copy), v8 (copy) ]]
	task.spawn(function() --[[ Line: 382 | Upvalues: v7 (ref), v8 (ref), p1 (copy) ]]
		local v1 = v7.GetClient()
		while not v1 do
			task.wait()
			v1 = v7.GetClient()
		end
		local v3 = v8.GetSettingChangedSignal(v1, "WeatherEffects")
		while not v3 do
			task.wait()
			v3 = v8.GetSettingChangedSignal(v1, "WeatherEffects")
		end
		v3:Connect(function() --[[ Line: 393 | Upvalues: p1 (ref) ]]
			p1:ApplyWeather(p1._activeWeather)
		end)
	end)
end
function t.Init(p1) --[[ Init | Line: 399 | Upvalues: t (copy), Lighting (copy), v3 (copy), v10 (copy) ]]
	t.WeatherChanged = Lighting:GetAttributeChangedSignal("Weather")
	p1:_bindWeatherEffectsSetting()
	if not v3.IsCompHub() then
		return
	end
	if v10 then
		p1:_startClock()
	else
		task.spawn(function() --[[ Line: 410 | Upvalues: p1 (copy) ]]
			p1:_initClient()
		end)
	end
end
t:Init()
return t