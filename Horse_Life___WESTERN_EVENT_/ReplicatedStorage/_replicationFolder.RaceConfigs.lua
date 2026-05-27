-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("Table")
local RaceCourses = ReplicatedStorage:FindFirstChild("WorldStorage"):FindFirstChild("RaceCourses")
local function getTrackCourseFolderInfo(p1) --[[ getTrackCourseFolderInfo | Line: 8 | Upvalues: RaceCourses (copy) ]]
	local v1 = RaceCourses:FindFirstChild(p1)
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
		local v5 = tonumber(v3.Name)
		if v5 and not t[v5] then
			t[v5] = true
			count = count + 1
		end
	end
	return v1, count
end
local v2 = RunService:IsStudio()
local t = {
	MinPlayers = 2,
	MaxPlayers = 8,
	CountdownDuration = 15,
	MaxRaceDuration = 480,
	PreRaceCountdown = 3,
	LoadTimeout = 15,
	ResultsDisplayDuration = 10,
	TotalCheckpoints = 0,
	Laps = 1,
	TeleportBack = true
}
local t2 = {}
t2.MapVoteDuration = if v2 then 15 else 30
t2.IntervalDuration = if v2 then 15 else 300
local t3 = {
	{
		MinPlayers = 6,
		Default = 50,
		Tiers = {
			{
				Position = 1,
				Amount = 100
			},
			{
				Amount = 70,
				Position = NumberRange.new(2, 3)
			}
		}
	},
	{
		MinPlayers = 3,
		Default = 50,
		Tiers = {
			{
				Position = 1,
				Amount = 100
			},
			{
				Position = 2,
				Amount = 70
			}
		}
	},
	{
		MinPlayers = 1,
		Default = 30,
		Tiers = {
			{
				Position = 1,
				Amount = 50
			}
		}
	}
}
local t4 = {
	CrimsonLoopTrack = {
		MinPlayers = 2,
		MaxPlayers = 8,
		CountdownDuration = 15,
		Laps = 3,
		Image = "rbxassetid://135806552037602"
	},
	IslandRun = {
		MinPlayers = 2,
		MaxPlayers = 8,
		CountdownDuration = 15,
		Laps = 2,
		Image = "rbxassetid://125223280878606"
	}
}
for v5, v6 in t4 do
	local v7, v8 = getTrackCourseFolderInfo(v5)
	if not v7 then
		warn((("could not find track course folder for track: %*"):format(v5)))
	end
	local v9 = v1.Sync(v6, t)
	v9.TotalCheckpoints = v8
	v9.CourseFolder = v7
	v9.Name = v5
	t4[v5] = v9
end
local v10 = table.freeze({
	LOADING = "LOADING",
	COUNTDOWN = "COUNTDOWN",
	RACING = "RACING",
	COMPLETE = "COMPLETE",
	CLEANINGUP = "CLEANINGUP"
})
return table.freeze({
	SystemControls = t2,
	AvailableTracks = t4,
	CoinsRewardBrackets = t3,
	RaceStateEnums = v10,
	VotingStateEnums = table.freeze({
		INRACE = "INRACE",
		VOTING = "VOTING",
		COOLDOWN = "COOLDOWN"
	})
})