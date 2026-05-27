-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
game:GetService("Players")
local Lighting = game:GetService("Lighting")
local CollectionService = game:GetService("CollectionService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("EventUtils")
local v4 = Sonar("TimeSeed")
local v5 = Sonar("WeightedProbability")
local v6 = Sonar("StorageUtils")
local v7 = Sonar("InstanceUtils")
local v8 = Sonar("PositionUtils")
Sonar("Zone")
local v9 = RunService:IsServer()
local v10 = v6.GetConfig("Ambient")()
local t = {}
t.__index = t
local CurrentCamera = workspace.CurrentCamera
local v11 = nil
local t2 = {}
function t.new(p1) --[[ new | Line: 32 | Upvalues: t (copy), v1 (copy), Lighting (copy), v10 (copy), v4 (copy), t2 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Object = if p1 then p1 else Lighting
	v2.IsGlobal = p1 == nil
	if v2.IsGlobal then
		local v5 = workspace:GetServerTimeNow()
		if v10.TimeCycle.SyncGlobally then
			v5 = nil
		end
		v2.TimeSeed = v4.new({
			Duration = v10.TimeCycle.CycleLength,
			Start = v5
		})
		v2.Maid:GiveTask(v2.TimeSeed)
	end
	v2.RunSeasons = v2.IsGlobal or v2.Object:HasTag("AmbientSeason")
	v2.RunWeathers = v2.IsGlobal or v2.Object:HasTag("AmbientWeather")
	local v8 = workspace:GetServerTimeNow()
	if v10.SeasonCycle.SyncGlobally then
		v8 = if v10.SeasonCycle.GlobalOffset then v10.SeasonCycle.GlobalOffset else nil
	elseif v2.RunSeasons then
		v2:SetState("Season", v10.SeasonCycle.DefaultSeason or "Spring")
	end
	v2.SeasonSeed = v4.new({
		Duration = v10.SeasonCycle.CycleLength,
		Start = v8
	})
	v2.SeasonSeed.SeedChanged:Connect(function(p1) --[[ Line: 69 | Upvalues: v2 (copy) ]]
		v2:_tickSeason(p1)
	end)
	v2.Maid:GiveTask(v2.SeasonSeed)
	local SubSeasons = v10.SeasonCycle.SubSeasons
	if SubSeasons then
		print("Initializing SubSeason cycle")
		v2.SubSeasonSeed = v4.new({
			Duration = SubSeasons.Duration,
			Start = v8
		})
		v2.SubSeasonSeed.SeedChanged:Connect(function(p1) --[[ Line: 83 | Upvalues: v2 (copy) ]]
			v2:_tickSubSeason(p1)
			v2:_tickSeason(v2.SeasonSeed:GetSeed())
		end)
		v2:_tickSubSeason(v2.SubSeasonSeed:GetSeed())
		v2.Maid:GiveTask(v2.SubSeasonSeed)
	end
	v2:_tickSeason(v2.SeasonSeed:GetSeed())
	v2.Maid:GiveTask(v2.Object:GetAttributeChangedSignal("AdminOverrideSeason"):Connect(function() --[[ Line: 95 | Upvalues: v2 (copy) ]]
		v2:_tickSeason(v2.SeasonSeed:GetSeed())
	end))
	local v9 = workspace:GetServerTimeNow()
	if v10.WeatherCycle.SyncGlobally then
		v9 = nil
	elseif v2.RunWeathers then
		v2:SetState("Weather", v10.WeatherCycle.DefaultWeather or "Clear Skies")
	end
	v2.WeatherSeed = v4.new({
		Duration = v10.WeatherCycle.CycleLength,
		Start = v9
	})
	v2.WeatherSeed.SeedChanged:Connect(function(p1) --[[ Line: 109 | Upvalues: v2 (copy) ]]
		v2:_tickWeather(p1)
	end)
	v2:_tickWeather(v2.WeatherSeed:GetSeed())
	v2.Maid:GiveTask(v2.WeatherSeed)
	v2.Object.Destroying:Once(function() --[[ Line: 115 | Upvalues: v2 (copy) ]]
		v2:Destroy()
	end)
	t2[v2.Object] = v2
	return v2
end
function t._getSpecificTimeState(p1) --[[ _getSpecificTimeState | Line: 131 | Upvalues: v10 (copy) ]]
	local v1 = p1.Object:GetAttribute("Time")
	for v3, v4 in v10.TimeCycle.TimeStateMaps or {} do
		local v5 = v4[1]
		local v6 = v4[2]
		if v5 and v6 then
			if v5 <= v6 then
				if v5 <= v1 and v1 < v6 then
					return v3
				end
				continue
			end
			if v5 <= v1 or v1 < v6 then
				return v3
			end
		end
	end
	return p1.Object:GetAttribute("TimeState")
end
function t._tickTime(p1) --[[ _tickTime | Line: 154 | Upvalues: v10 (copy) ]]
	if not p1.IsGlobal then
		return
	end
	local CycleLength = v10.TimeCycle.CycleLength
	local v1 = v10.TimeCycle.MorningClockTime % 24
	local v2 = v10.TimeCycle.NightClockTime % 24
	local v3 = (v2 - v1 + 24) % 24
	if v3 == 0 then
		v3 = 24
	end
	local v4 = 24 - v3
	local v5 = v10.TimeCycle.NightSpeedMultiplier or 1
	if v5 <= 0 then
		v5 = 1
	end
	local v6, v7
	if v3 == 0 then
		v6 = 0
		v7 = CycleLength
	elseif v4 == 0 then
		v6 = CycleLength
		v7 = 0
	else
		v6 = CycleLength / (1 + v4 / v3 / v5)
		v7 = CycleLength - v6
	end
	local v8 = (CycleLength - p1.TimeSeed:GetTime()) % CycleLength
	local v9 = if v8 < v6 then (v1 + v3 * (v8 / v6)) % 24 else (v2 + v4 * ((v8 - v6) / v7)) % 24
	local v102 = p1.Object:GetAttribute("AdminOverrideTime")
	if v102 then
		v9 = v102
	end
	p1:SetState("Time", v9)
	p1:SetState("TimeSeed", p1.TimeSeed:_getSeed())
	p1:SetState("TimeSeedEndTime", p1.TimeSeed:_getEndTime())
	p1:SetState("TimeState", if if v1 < v2 then if v2 <= v9 then true elseif v9 < v1 then true else false elseif v2 <= v9 then if v9 < v1 then true else false else false then "Night" else "Day")
	p1:SetState("SpecificTimeState", p1:_getSpecificTimeState())
	if not p1.IsGlobal then
		return
	end
	p1.Object.ClockTime = v9
end
function t._getRegularSeason(p1, p2) --[[ _getRegularSeason | Line: 231 | Upvalues: v10 (copy) ]]
	local Seasons = v10.SeasonCycle.Seasons
	local v1 = p2 or 1
	return Seasons[v1 - math.floor(v1 / #Seasons) * #Seasons + 1]
end
function t._tickSeason(p1, p2) --[[ _tickSeason | Line: 242 | Upvalues: v10 (copy) ]]
	if not p1.RunSeasons then
		return
	end
	local v1 = p1:_getRegularSeason(p2)
	local v2 = p1:GetState("SubSeason") or v1
	local v3 = p1.Object:GetAttribute("AdminOverrideSeason")
	if v3 then
		v2 = v3
	end
	if v10.SeasonCycle.OnSeasonChanged then
		v10.SeasonCycle.OnSeasonChanged(p1, v1)
	end
	p1:SetState("Season", v2)
	p1:SetState("SeasonSeed", p2)
	p1:SetState("SeasonSeedEndTime", p1.SeasonSeed:_getEndTime())
end
function t._tickWeather(p1, p2) --[[ _tickWeather | Line: 267 | Upvalues: v10 (copy), v11 (ref), v5 (copy) ]]
	if not p1.RunWeathers then
		return
	end
	local Weathers = v10.WeatherCycle.Weathers
	local v1 = table.clone(Weathers)
	local v2 = p1:GetState("Season") or v11:GetState("Season")
	for v3, v4 in Weathers do
		if v4.Seasons and not table.find(v4.Seasons, v2) then
			v1[v3] = nil
			continue
		end
		if v4.CanSelect and not v4.CanSelect(p1) then
			v1[v3] = nil
		end
	end
	local v52 = v5.getRandomWeightedItem(v1)
	p1:SetState("Weather", v52)
	p1:SetState("WeatherSeed", p2)
	p1:SetState("WeatherSeedEndTime", p1.WeatherSeed:_getEndTime())
	if not Weathers[v52].OnSelect then
		return
	end
	Weathers[v52].OnSelect(p1)
end
function t._tickSubSeason(p1, p2) --[[ _tickSubSeason | Line: 298 | Upvalues: v10 (copy) ]]
	if not p1.RunSeasons then
		return
	end
	local SubSeasons = v10.SeasonCycle.SubSeasons
	if not SubSeasons then
		return
	end
	local v1 = Random.new(p2)
	p1:SetState("SubSeason", nil)
	p1:SetState("SubSeasonSeed", p2)
	p1:SetState("SubSeasonSeedEndTime", p1.SubSeasonSeed:_getEndTime())
	local v2 = p1:_getRegularSeason(p1.SeasonSeed:GetSeed())
	local t = {}
	local sum = 0
	for v3, v4 in SubSeasons.Seasons do
		local ParentSeasons = v4.ParentSeasons
		if ParentSeasons == nil or table.find(ParentSeasons, v2) then
			table.insert(t, v4)
			sum = sum + (v4.Chance or 0)
		end
	end
	local v5 = v1:NextNumber() * 100
	if sum < v5 then
		return
	end
	local sum_2 = 0
	local v6 = nil
	for v7, v8 in t do
		sum_2 = sum_2 + (v8.Chance or 0)
		if v5 <= sum_2 then
			v6 = v8.Name
			break
		end
	end
	if not v6 then
		return
	end
	p1:SetState("SubSeason", v6)
end
function t.SetState(p1, p2, p3) --[[ SetState | Line: 353 ]]
	p1.Object:SetAttribute(p2, p3)
end
function t.GetState(p1, p2) --[[ GetState | Line: 357 ]]
	return p1.Object:GetAttribute(p2)
end
function t.GetSeed(p1, p2) --[[ GetSeed | Line: 361 | Upvalues: v9 (copy), Lighting (copy) ]]
	if not v9 then
		return Lighting:GetAttribute((("%*Seed"):format(p2)))
	end
	if p2 == "Weather" then
		return p1.WeatherSeed:_getSeed()
	end
	if p2 == "Season" then
		return p1.SeasonSeed:_getSeed()
	end
	if p2 == "Time" then
		return p1.TimeSeed:_getSeed()
	end
	if p2 == "SubSeason" then
		return p1.SubSeasonSeed:_getSeed()
	end
end
function t.GetSeedEndTime(p1, p2) --[[ GetSeedEndTime | Line: 377 | Upvalues: v9 (copy), Lighting (copy) ]]
	if not v9 then
		return Lighting:GetAttribute((("%*SeedEndTime"):format(p2)))
	end
	if p2 == "Weather" then
		return p1.WeatherSeed:_getEndTime()
	end
	if p2 == "Season" then
		return p1.SeasonSeed:_getEndTime()
	end
	if p2 == "Time" then
		return p1.TimeSeed:_getEndTime()
	end
	if p2 == "SubSeason" then
		return p1.SubSeasonSeed:_getEndTime()
	end
end
function t.GetSeedChangedSignal(p1, p2) --[[ GetSeedChangedSignal | Line: 393 | Upvalues: v9 (copy), Lighting (copy) ]]
	if not v9 then
		return Lighting:GetAttributeChangedSignal((("%*Seed"):format(p2)))
	end
	if p2 == "Weather" then
		return p1.WeatherSeed.SeedChanged
	end
	if p2 == "Season" then
		return p1.SeasonSeed.SeedChanged
	end
	if p2 == "Time" then
		return p1.TimeSeed.SeedChanged
	end
	if p2 == "SubSeason" then
		return p1.SubSeasonSeed.SeedChanged
	else
		return p1.Object:GetAttributeChangedSignal(p2)
	end
end
function t.GetAllSeasons() --[[ GetAllSeasons | Line: 412 | Upvalues: v10 (copy) ]]
	local t = {}
	t[1] = table.unpack(v10.SeasonCycle.Seasons or {})
	for v4, v5 in (v10.SeasonCycle.SubSeasons or {}).Seasons or {} do
		table.insert(t, v5.Name)
	end
	return t
end
function t.Tick(p1) --[[ Tick | Line: 424 ]]
	p1:_tickTime()
end
function t.Destroy(p1) --[[ Destroy | Line: 428 | Upvalues: t2 (copy) ]]
	t2[p1.Object] = nil
	p1.Maid:Destroy()
	table.clear(p1)
	setmetatable(p1, nil)
end
local function initServer() --[[ initServer | Line: 435 | Upvalues: v3 (copy), t2 (copy), v11 (ref), t (copy), CollectionService (copy) ]]
	v3.spawnLoopWithoutYielding(function() --[[ Line: 436 | Upvalues: t2 (ref) ]]
		for v1, v2 in t2 do
			v2:Tick()
		end
	end, 1)
	v11 = t.new()
	CollectionService:GetInstanceAddedSignal("AmbientWeather"):Connect(function(p1) --[[ Line: 445 | Upvalues: t (ref) ]]
		t.new(p1)
	end)
	CollectionService:GetInstanceAddedSignal("AmbientSeason"):Connect(function(p1) --[[ Line: 448 | Upvalues: t (ref) ]]
		t.new(p1)
	end)
	for v1, v2 in { CollectionService:GetTagged("AmbientWeather"), CollectionService:GetTagged("AmbientSeason") } do
		for v32, v4 in v2 do
			t.new(v4)
		end
	end
	return v11
end
local function initClient() --[[ initClient | Line: 460 | Upvalues: v2 (copy), Sonar (copy), v1 (copy), v7 (copy), CurrentCamera (copy), v10 (copy), Lighting (copy), CollectionService (copy), v8 (copy), v6 (copy), RunService (copy), v11 (ref), t (copy) ]]
	local v12 = v2.GetClient()
	local v22 = Sonar("LightingService")
	local v3 = Sonar("MusicService")
	local v4 = Sonar("Raindrop")
	local v5 = v1.new()
	local v62 = v7.Create("Part", {
		Name = "WeatherPart",
		Size = Vector3.new(100, 1, 100),
		CastShadow = false,
		CanCollide = false,
		CanQuery = false,
		CanTouch = false,
		Anchored = true,
		Transparency = 1,
		Parent = workspace.CurrentCamera,
		Position = CurrentCamera.CFrame.Position
	})
	local WeatherAttachment = Instance.new("Attachment")
	WeatherAttachment.Name = "WeatherAttachment"
	WeatherAttachment.Parent = v62
	local SplashAttachment = Instance.new("Attachment")
	SplashAttachment.Name = "SplashAttachment"
	SplashAttachment.Parent = workspace.Terrain
	local v72 = nil
	local v82 = nil
	local v9 = nil
	local v102 = nil
	local Weathers = v10.WeatherCycle.Weathers
	local Wind = Weathers["Clear Skies"].Wind
	local v112 = Lighting
	local v122 = Vector3.new(0, 0, 0)
	local v13 = false
	local function toggleEQ(p1) --[[ toggleEQ | Line: 501 | Upvalues: CollectionService (ref) ]]
		for k, v in pairs(CollectionService:GetTagged("MuffleEQ")) do
			v.Enabled = p1
		end
	end
	local function weatherRaycast(p1) --[[ weatherRaycast | Line: 507 | Upvalues: v10 (ref), v12 (copy), v13 (ref) ]]
		if not p1 then
			return false
		end
		local v1 = v10.WeatherCycle.Weathers[p1]
		if not (v1 and v1.OccludeIndoors) then
			return false
		end
		local Character = v12.Player.Character
		if not (Character and Character.PrimaryPart) then
			return false
		end
		local v2 = v1.RaycastWhitelist or {}
		if not next(v2) then
			return false
		end
		local v3 = RaycastParams.new()
		v3.IncludeInstances = v2
		local v4 = workspace:Raycast(Character.PrimaryPart.Position, Vector3.new(0, 1000, 0), v3)
		v13 = v4
		return v4 ~= nil
	end
	local function endDirection(p1, p2, p3, p4, p5) --[[ endDirection | Line: 539 ]]
		local GlobalWind = workspace.GlobalWind
		if p3 > 0 then
			local v1 = 2 ^ (-p3 * p4)
			local v2 = GlobalWind + (p1 - GlobalWind) * v1 + p2 / (p3 * 0.6931471805599453) * (1 - v1)
			return if v2.Magnitude > 1e-6 then v2.Unit or Vector3.new(0, 0, 0) else Vector3.new(0, 0, 0)
		else
			local v4 = p1 + p2 * p4
			return if v4.Magnitude > 1e-6 then v4.Unit or Vector3.new(0, 0, 0) else Vector3.new(0, 0, 0)
		end
	end
	local function moveAttachment(p1) --[[ moveAttachment | Line: 552 | Upvalues: v62 (copy), WeatherAttachment (copy), SplashAttachment (copy), v13 (ref), endDirection (copy), v12 (copy), v8 (ref) ]]
		if not p1 then
			return
		end
		if not p1.RaycastWhitelist then
			return
		end
		WeatherAttachment.CFrame = CFrame.new(math.random(-v62.Size.X / 2, v62.Size.X / 2), 0, (math.random(-v62.Size.Z / 2, v62.Size.Z / 2)))
		local v3 = RaycastParams.new()
		v3.IncludeInstances = p1.RaycastWhitelist
		local ParticleName = p1.ParticleName
		if typeof(ParticleName) == "table" then
			ParticleName = ParticleName[1]
		end
		local v4 = WeatherAttachment[ParticleName]
		if not v4 then
			return
		end
		local v5 = p1.SplashName and SplashAttachment[p1.SplashName]
		local v7 = workspace:Raycast(WeatherAttachment.WorldPosition, v13 and endDirection(Vector3.new(0, -1, 0), v4.Acceleration, v4.Drag, v4.Lifetime.Max, true) * 50 or Vector3.new(0, -50, 0), v3)
		if not v4:GetAttribute("Enabled") or v7 and not (v7 and v7.Position.Y < v12.Player.Character.PrimaryPart.Position.Y) then
			return
		end
		local v82 = v7
		if v13 and (v82 and (v13.Instance and v8.isPointInsideCFrame(v13.Instance.CFrame, v13.Instance.Size * 20, v82.Position))) then
			return
		end
		v4:Emit(4)
		if not (v82 and v5) then
			return
		end
		SplashAttachment.WorldPosition = v82.Position
		v5:Emit(math.random(1, 5))
	end
	local function updateVisuals(p1) --[[ updateVisuals | Line: 619 | Upvalues: Weathers (copy), v62 (copy), WeatherAttachment (copy), CollectionService (ref), v4 (copy), weatherRaycast (copy), v6 (ref), SplashAttachment (copy), moveAttachment (copy) ]]
		local v1 = if p1 then Weathers[p1] else p1
		local v2 = if v1 then v1.OccludeIndoors else v1
		for v3, v42 in v62:GetDescendants() do
			if v42:IsA("ParticleEmitter") and not v42:GetAttribute("WeatherIgnore") then
				v42.Enabled = false
				v42:SetAttribute("Enabled", false)
			end
		end
		for v5, v63 in WeatherAttachment:GetChildren() do
			if v63:IsA("ParticleEmitter") and not v63:GetAttribute("WeatherIgnore") then
				v63.Enabled = false
				v63:SetAttribute("Enabled", false)
			end
		end
		local v7 = p1 and v1 and v1.MufflesAudio or false
		for k, v in pairs(CollectionService:GetTagged("MuffleEQ")) do
			v.Enabled = v7
		end
		if not p1 then
			v4:Enable(false)
			return
		end
		local v8 = if v2 == "Attachment" or v2 == "All" then weatherRaycast(p1) else false
		local v10 = if v1 then v1.ParticleName else v1
		if v10 then
			local v12 = v2 == "Attachment" and WeatherAttachment or v62
			for i, v in ipairs(if typeof(v10) == "table" and v10 then v10 else { v10 }) do
				local v13 = v12:FindFirstChild(v) or v6.GetAsset(v, "Particles")()
				if v13 then
					if v2 == "Attachment" then
						v13:SetAttribute("Enabled", true)
						v13.Enabled = false
					elseif v2 == "All" then
						v13.Enabled = not v8
					else
						v13.Enabled = true
					end
					v13.Parent = v12
				end
			end
		end
		if v2 == "Attachment" then
			local SplashName = v1.SplashName
			if SplashName then
				local v14 = SplashAttachment:FindFirstChild(SplashName) or v6.GetAsset(SplashName, "Particles")()
				if v14 and v14.Parent ~= SplashAttachment then
					v14.Parent = SplashAttachment
					v14.Enabled = false
				end
			end
			moveAttachment(v1)
		end
		local ScreenRaindrops = v1.ScreenRaindrops
		v4:Enable(if ScreenRaindrops then not v8 and ScreenRaindrops else ScreenRaindrops)
	end
	local function unbind() --[[ unbind | Line: 696 | Upvalues: updateVisuals (copy), v5 (copy) ]]
		updateVisuals(nil)
		v5:DoCleaning()
	end
	local function bind(p1) --[[ bind | Line: 701 | Upvalues: updateVisuals (copy), v5 (copy), v112 (ref), Lighting (ref), v10 (ref), v3 (copy), v22 (copy), v72 (ref), v102 (ref), v82 (ref), v9 (ref) ]]
		updateVisuals(nil)
		v5:DoCleaning()
		v112 = p1
		local function updateLightingProfiles() --[[ updateLightingProfiles | Line: 706 | Upvalues: p1 (copy), Lighting (ref), v10 (ref), v3 (ref), v22 (ref), v72 (ref), v102 (ref), updateVisuals (ref), v82 (ref), v9 (ref), v5 (ref) ]]
			local v1 = p1:GetAttribute("Weather") or Lighting:GetAttribute("Weather")
			local v2 = p1:GetAttribute("Season") or Lighting:GetAttribute("Season")
			local v32 = p1:GetAttribute("SpecificTimeState") or Lighting:GetAttribute("SpecificTimeState")
			if v1 then
				local v4 = v10.WeatherCycle.Weathers[v1]
				local v52 = if v4 then v4.Ambient else v4
				for v6, v7 in v10.WeatherCycle.Weathers do
					if v7 and v7.Ambient then
						v3.setAmbientTrack(v7.Ambient, false)
					end
				end
				if v52 then
					v3.setAmbientTrack(v52, true)
				end
				if v22.getLightingMode(v1) then
					v22.setLightingMode(v1, true)
				end
				if v72 and v72 ~= v1 then
					v22.setLightingMode(v72, false)
				end
				v102 = v52
				v72 = v1
				updateVisuals(v1)
			else
				if v72 then
					v22.setLightingMode(v72, false)
					v72 = nil
				end
				for v8, v92 in v10.WeatherCycle.Weathers do
					if v92 and v92.Ambient then
						v3.setAmbientTrack(v92.Ambient, false)
					end
				end
				v102 = nil
				updateVisuals(nil)
			end
			if v2 and v22.getLightingMode(v2) then
				v22.setLightingMode(v2, true)
				if v82 ~= v2 then
					v22.setLightingMode(v82, false)
				end
				v82 = v2
			end
			if v32 and v22.getLightingMode(v32) then
				v22.setLightingMode(v32, true)
				if v9 ~= v32 then
					v22.setLightingMode(v9, false)
				end
				v9 = v32
			end
			v5:GiveTask(function() --[[ Line: 763 | Upvalues: v72 (ref), v22 (ref), v82 (ref), v9 (ref) ]]
				if v72 then
					v22.setLightingMode(v72, false)
				end
				if v82 then
					v22.setLightingMode(v82, false)
				end
				if not v9 then
					return
				end
				v22.setLightingMode(v9, false)
			end)
		end
		v5:GiveTask(p1.AttributeChanged:Connect(function(p1) --[[ Line: 776 | Upvalues: updateLightingProfiles (copy) ]]
			if p1 ~= "Weather" and (p1 ~= "Season" and p1 ~= "SpecificTimeState") then
				return
			end
			updateLightingProfiles()
		end))
		if p1 ~= Lighting then
			v5:GiveTask(Lighting:GetAttributeChangedSignal("Weather"):Connect(function() --[[ Line: 783 | Upvalues: updateLightingProfiles (copy) ]]
				updateLightingProfiles()
			end))
		end
		updateLightingProfiles()
	end
	if v12.ZoneAmbientChangedSignal then
		v12.ZoneAmbientChangedSignal:Connect(function(p1) --[[ Line: 791 | Upvalues: bind (copy), Lighting (ref) ]]
			if p1 then
				bind(p1)
			else
				bind(Lighting)
			end
		end)
	end
	bind(Lighting)
	RunService.Heartbeat:Connect(function(p1) --[[ Line: 801 | Upvalues: v12 (copy), updateVisuals (copy), v112 (ref), Lighting (ref), CurrentCamera (ref), v62 (copy), Weathers (copy), Wind (copy), v122 (ref) ]]
		local Character = v12.Player.Character
		if not Character then
			updateVisuals(nil)
			return
		end
		local v1 = Character.PrimaryPart or Character:FindFirstChild("HumanoidRootPart")
		local v2 = v112:GetAttribute("Weather") or Lighting:GetAttribute("Weather")
		if not v1 then
			updateVisuals(v2)
			return
		end
		local v5 = math.max(CurrentCamera.CFrame.p.Y + 5, v1.Position.Y) + 25
		local _, v6 = CurrentCamera.CFrame:ToOrientation()
		v62.CFrame = CFrame.new(CurrentCamera.CFrame.p.X, v5, CurrentCamera.CFrame.p.Z) * CFrame.Angles(0, v6, 0) + v1.AssemblyLinearVelocity * p1 * 10 * Vector3.new(1, 0, 1)
		local v7 = workspace:GetServerTimeNow()
		local v8 = Weathers[v2] and Weathers[v2].Wind or Wind
		local v10 = (math.sin(v7 * (v8.Frequency or 1)) + 1) / 2 * ((v8.Range[2] or 0) - (v8.Range[1] or 0)) + (v8.Range[1] or 0)
		local v123 = v10 + math.sin(v7 * (v8.BumpFrequency or 1)) * (v8.BumpAmplitude or 0)
		local v13 = v7 * (v8.AngularSpeed or 0.01)
		local v14 = math.sin(v13)
		local v15 = math.cos(v13)
		local v16 = v122:Lerp(Vector3.new(v14, 0, v15) * v123 + (v112:GetAttribute("WindAddition") or Vector3.new(0, 0, 0)), 0.1)
		workspace.GlobalWind = v16
		v122 = v16
		updateVisuals(v2)
	end)
	return v11 or t
end
local function init() --[[ init | Line: 849 | Upvalues: v9 (copy), initServer (copy), initClient (copy) ]]
	if v9 then
		return initServer()
	else
		return initClient()
	end
end
return if v9 then initServer() else initClient()