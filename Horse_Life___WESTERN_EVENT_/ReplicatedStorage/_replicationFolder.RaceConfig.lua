-- https://lua.expert/
local v1 = game:GetService("RunService"):IsStudio()
local t = {
	{
		MinPlayers = 6,
		Default = 75,
		Tiers = {
			{
				Position = 1,
				Amount = 250
			},
			{
				Position = 2,
				Amount = 175
			},
			{
				Position = 3,
				Amount = 150
			}
		}
	},
	{
		MinPlayers = 3,
		Default = 75,
		Tiers = {
			{
				Position = 1,
				Amount = 200
			},
			{
				Position = 2,
				Amount = 150
			}
		}
	},
	{
		MinPlayers = 1,
		Default = 75,
		Tiers = {
			{
				Position = 1,
				Amount = 150
			}
		}
	}
}
local t2 = {
	Tracks = {
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
		},
		BlueCircuit = {
			MinPlayers = 2,
			MaxPlayers = 8,
			CountdownDuration = 15,
			Laps = 2,
			Image = "rbxassetid://139831024082456"
		}
	},
	Defaults = {
		MinPlayers = 2,
		MaxPlayers = 8,
		CountdownDuration = 15,
		MaxRaceDuration = 480,
		PreRaceCountdown = 3,
		LoadTimeout = 15,
		ResultsDisplayDuration = 10,
		Laps = 1,
		TeleportBack = true
	}
}
local t3 = {
	"MinPlayers",
	"MaxPlayers",
	"CountdownDuration",
	"MaxRaceDuration",
	"PreRaceCountdown",
	"LoadTimeout",
	"ResultsDisplayDuration",
	"Laps",
	"TeleportBack"
}
function t2.GetGoldReward(p1, p2) --[[ GetGoldReward | Line: 83 | Upvalues: t (copy) ]]
	if not (p1 and p2) then
		return 0
	end
	for v1, v2 in t do
		if v2.MinPlayers <= p1 then
			for v3, v4 in v2.Tiers do
				if type(v4.Position) == "number" then
					if v4.Position == p2 then
						return v4.Amount
					end
					continue
				end
				if typeof(v4.Position) == "NumberRange" and (v4.Position.Min <= p2 and p2 <= v4.Position.Max) then
					return v4.Amount
				end
			end
			return v2.Default or 0
		end
	end
	return 0
end
function t2.GetTrackConfig(p1) --[[ GetTrackConfig | Line: 107 | Upvalues: t2 (copy), t3 (copy), v1 (copy) ]]
	local v12 = t2.Tracks[p1]
	local t = {}
	for v2, v3 in t3 do
		t[v3] = v12 and v12[v3] or t2.Defaults[v3]
	end
	if v1 then
		t.MinPlayers = 1
	end
	return t
end
return t2