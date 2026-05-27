-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Constants")
local v2 = Sonar("Table")
local WorldStorage = ReplicatedStorage:FindFirstChild("WorldStorage")
local v3 = if WorldStorage then WorldStorage:FindFirstChild("RaceEvents") else WorldStorage
local v4 = if v3 then v3:FindFirstChild("Trails") else v3
local v5 = v4 and v4:FindFirstChild("RaceMaps")
local v6 = if v4 then v4:FindFirstChild("StartZones") else v4
local function getTrailCourseFolderInfo(p1) --[[ getTrailCourseFolderInfo | Line: 14 | Upvalues: v5 (copy) ]]
	if not v5 then
		return nil, 0
	end
	local v1 = v5:FindFirstChild(p1)
	if not v1 then
		return nil, 0
	end
	local Checkpoints = v1:FindFirstChild("Checkpoints")
	if not Checkpoints then
		return v1, 0
	end
	local t = {}
	local count = 0
	for v2, v3 in Checkpoints:GetChildren() do
		local v52 = tonumber(v3.Name)
		if v52 and not t[v52] then
			t[v52] = true
			count = count + 1
		end
	end
	return v1, count
end
local t = {}
local t2 = {}
local PermanentTrails = v1.TrailSettings.PermanentTrails
if type(PermanentTrails) == "table" then
	for v7, v8 in PermanentTrails do
		if type(v8) == "string" then
			t2[v8] = true
		end
	end
end
if v5 then
	for v9, v10 in v5:GetChildren() do
		local v11, v12 = getTrailCourseFolderInfo(v10.Name)
		if v11 then
			local v13 = v2.Sync({}, v1.TrailSettings)
			v13.TotalCheckpoints = v12
			v13.CourseFolder = v11
			v13.Name = v10.Name
			t[v10.Name] = v13
		end
	end
else
	warn("could not find ReplicatedStorage.WorldStorage.RaceEvents.Trails.RaceMaps folder")
end
return table.freeze({
	AvailableTrails = t,
	PermanentTrailNames = t2,
	TrailStateEnums = table.freeze({
		LOADING = "LOADING",
		COUNTDOWN = "COUNTDOWN",
		RACING = "RACING",
		COMPLETE = "COMPLETE",
		CLEANINGUP = "CLEANINGUP"
	}),
	StartZonesFolder = v6
})