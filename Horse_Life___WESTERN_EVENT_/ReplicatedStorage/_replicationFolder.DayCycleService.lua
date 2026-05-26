-- https://lua.expert/
local t = {}
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("InteractZone", {
	Context = "Client"
})
local v2 = Sonar("MathUtils")
local v3 = Sonar("MusicService", {
	Context = "Client"
})
local v4 = Sonar("PlaceTypeService")
local v5 = Sonar("Signal")
local v6 = RunService:IsServer()
local v7 = 9000000000
local v8 = 0.25
local v9 = false
local v10 = nil
local v11 = nil
local v12 = nil
function t.UpdateStage(p1) --[[ UpdateStage | Line: 30 | Upvalues: v6 (copy), Lighting (copy), v10 (ref), v12 (ref), v11 (ref) ]]
	local v1 = v6 and (Lighting:GetAttribute("AdminOverrideTime") or Lighting:GetAttribute("Time")) or Lighting.ClockTime
	if v1 then
		tonumber(v1)
	end
	local v2 = Lighting:GetAttribute("SpecificTimeState")
	v10 = v2 == "Night"
	v12 = v2 == "Morning"
	v11 = v2 == "Dusk"
end
function t.GetTime(p1) --[[ GetTime | Line: 44 | Upvalues: Lighting (copy), v2 (copy) ]]
	return v2.map(Lighting:GetAttribute("AdminOverrideTime") or Lighting:GetAttribute("Time"), 0, 24, 0, 1439.9)
end
function t.GetClockTime(p1) --[[ GetClockTime | Line: 54 | Upvalues: v2 (copy) ]]
	return v2.map(p1:GetTime(), 0, 1440, 0, 24)
end
function t.IsNight(p1) --[[ IsNight | Line: 58 | Upvalues: Lighting (copy) ]]
	return Lighting:GetAttribute("TimeState") == "Night"
end
function t.GetTimeState(p1) --[[ GetTimeState | Line: 62 ]]
	local v1 = p1:GetClockTime()
	if v1 >= 18 or v1 <= 6 then
		return "Night"
	else
		return "Day"
	end
end
function t.UpdateTime(p1) --[[ UpdateTime | Line: 69 | Upvalues: Lighting (copy) ]]
	Lighting:SetMinutesAfterMidnight(p1:GetTime())
	p1:UpdateStage()
end
local v13 = os.time()
local function getNextRolloverTimestamp(p1) --[[ getNextRolloverTimestamp | Line: 78 ]]
	return math.floor(p1 - p1 % 900 + 900)
end
local v14 = nil
local v15 = nil
local v16 = nil
function t.StartClock(p1, p2) --[[ StartClock | Line: 86 | Upvalues: RunService (copy), Lighting (copy), v13 (ref), v7 (ref), t (copy), Sonar (copy), v8 (ref), v9 (ref), v10 (ref), v11 (ref), v12 (ref), v14 (ref), v15 (ref), v16 (ref) ]]
	if RunService:IsServer() then
		Lighting:SetAttribute("Time", 6.5)
		task.spawn(function() --[[ Line: 89 | Upvalues: v13 (ref), v7 (ref), t (ref), Lighting (ref) ]]
			while true do
				local v1 = false
				local v2 = false
				local v3 = nil
				local v4 = nil
				local v5 = os.time()
				local v6 = v5 % 900
				if v6 < 600 then
					v2 = true
					local v72 = math.floor(v5 - v5 % 900 + 900)
					if v72 ~= v13 then
						v7 = v72
						t.SeedChanged:Fire(v72)
						v13 = v72
					end
					if v6 < 300 then
						v4 = true
					end
				else
					v1 = true
					if v6 - 600 < 150 then
						v3 = true
					end
				end
				Lighting:SetAttribute("Time", if v4 then 6.5 elseif v2 then 10 elseif v3 then 16 else v1 and 20)
				Lighting:SetAttribute("TimeState", if v1 then "Night" else v2 and "Day")
				Lighting:SetAttribute("SpecificTimeState", if v3 then "Dusk" elseif v1 then "Night" elseif v4 then "Morning" else "Day")
				task.wait(1)
			end
		end)
		return
	end
	local v1 = Sonar("LightingService")
	v8 = if p2 then p2 else v8
	v9 = true
	task.spawn(function() --[[ Line: 135 | Upvalues: v9 (ref), p1 (copy), v1 (copy), v10 (ref), v11 (ref), v12 (ref), v14 (ref), v15 (ref), v16 (ref), v8 (ref) ]]
		while v9 do
			p1:UpdateTime()
			v1.setLightingMode("Night", v10, true)
			v1.setLightingMode("Dusk", v11, true)
			v1.setLightingMode("Morning", v12, true)
			if v14 ~= v10 or (v15 ~= v11 or v16 ~= v12) then
				v1.refreshLighting()
			end
			v14 = v10
			v15 = v11
			v16 = v12
			task.wait(v8)
		end
	end)
end
function t.ResetClock(p1) --[[ ResetClock | Line: 157 | Upvalues: v9 (ref), Lighting (copy) ]]
	v9 = false
	Lighting.ClockTime = 12
end
function t.GetCycleStage(p1) --[[ GetCycleStage | Line: 162 | Upvalues: v10 (ref), v11 (ref), v12 (ref) ]]
	p1:UpdateTime()
	if v10 then
		return "Night"
	end
	if v11 then
		return "Dusk"
	end
	if v12 then
		return "Morning"
	else
		return "Day"
	end
end
function t.GetSeed(p1) --[[ GetSeed | Line: 173 | Upvalues: v7 (ref) ]]
	return v7
end
t.TimeStateChanged = Lighting:GetAttributeChangedSignal("TimeState")
t.SeedChanged = v5.new()
t:StartClock()
if not v6 then
	local function updateMusic() --[[ updateMusic | Line: 182 | Upvalues: t (copy), v4 (copy), v1 (copy), v3 (copy) ]]
		local v12 = t:GetCycleStage()
		local v2 = v4.IsCompHub()
		local t2 = {}
		t2.MelodyOfTriumph = if v2 then v1.IsInZone("CompHubMainCenterBuilding") or false else false
		t2.MelodyOfTriumph = t2.MelodyOfTriumph and true or false
		t2.DeepFocus = if v2 then if t2.MelodyOfTriumph == false then if v12 == "Night" then true else false else false else v2
		t2.DeepFocus = t2.DeepFocus and true or false
		t2.SoftClassicalBackground = if v2 then if t2.MelodyOfTriumph == false then if t2.DeepFocus == false then true else false else false else v2
		t2.SoftClassicalBackground = t2.SoftClassicalBackground and true or false
		t2.MusicNight = if v2 == false then v12 == "Night" else false
		t2.MusicNight = t2.MusicNight and true or false
		for v7, v8 in t2 do
			v3.setMusicTrack(v7, v8)
		end
	end
	t.TimeStateChanged:Connect(updateMusic)
	updateMusic()
end
return t