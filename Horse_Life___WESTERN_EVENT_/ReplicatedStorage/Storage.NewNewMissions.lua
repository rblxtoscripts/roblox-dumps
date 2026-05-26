-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("StorageUtils", {
	Deferred = true
})
local v2 = Sonar("TimeSeed")
local v3 = Sonar("Constants")
local IsStudio = v3.IsStudio
local IsServer = v3.IsServer
local v4 = v1.GetConfig("Events")()
local v5 = v4.EventsData[v4.Event]
local v6 = Sonar(script.PresetTaskList)
local t2 = {}
local function setupMission(p1, p2, p3) --[[ setupMission | Line: 156 | Upvalues: v2 (copy), v6 (copy), t2 (copy), t (copy) ]]
	if p1 == "Metadata" then
		return
	end
	p2.Name = p1
	p2.Category = p2.Category or p3
	if not p2.Category then
		warn((("\226\154\160\239\184\143 Missions, Mission \"%*\" has no \'missionCategory\'!"):format(p1)))
		return
	end
	if p2.RotateTime and not p2.SeededPerPlayer then
		local StartTime = p2.StartTime
		if typeof(p2.StartTime) == "DateTime" then
			StartTime = StartTime.UnixTimestamp
		end
		p2.TimeSeed = v2.new({
			Duration = p2.RotateTime,
			Start = StartTime
		})
	end
	for v1, v22 in p2.Tasks do
		if v22.Preset and v6[v22.Preset] then
			for v3, v4 in v6[v22.Preset] do
				if v22[v3] == nil then
					v22[v3] = v4
				end
			end
		end
		t2[v22.Type] = true
	end
	if t[p1] then
		warn((("\226\154\160\239\184\143 Missions, Mission \"%*\" already exists!"):format(p1)))
	else
		t[p1] = p2
	end
end
local function setupEventMissions() --[[ setupEventMissions | Line: 205 | Upvalues: v5 (copy), setupMission (copy) ]]
	if not v5 then
		return
	end
	if typeof(v5.Missions) ~= "table" then
		return
	end
	for v1, v2 in v5.Missions do
		setupMission(v1, v2, "EventMissions")
	end
end
local function setupGameMissions() --[[ setupGameMissions | Line: 220 | Upvalues: Sonar (copy), setupMission (copy) ]]
	for v2, v3 in script:GetChildren() do
		local v1
		if v3.Name ~= "PresetTaskList" then
			v1 = if v3:IsA("Folder") then v3:GetChildren() else { v3 }
			for v5, v6 in v1 do
				if v6:IsA("ModuleScript") then
					for v7, v8 in Sonar(v6) do
						setupMission(v7, v8, v3.Name)
					end
				end
			end
		end
	end
end
function t.Init(p1) --[[ Init | Line: 245 | Upvalues: setupEventMissions (copy), setupGameMissions (copy), IsStudio (copy), IsServer (copy), t2 (copy) ]]
	setupEventMissions()
	setupGameMissions()
	if not (IsStudio and IsServer) then
		return
	end
	print("\240\159\151\146\239\184\143 MissionsService, All mission task types:")
	print(t2)
end
t:Init()
t.Init = nil
return t