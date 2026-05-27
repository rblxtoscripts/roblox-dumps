-- https://lua.expert/
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("DataCompression")
local v2 = Sonar("DataService").new("PlayerData")
local v3 = RunService:IsStudio()
local UnixTimestamp = DateTime.now().UnixTimestamp
return function(p1, p2) --[[ Line: 20 | Upvalues: UnixTimestamp (ref), TeleportService (copy), v3 (copy), v2 (copy), HttpService (copy), v1 (copy) ]]
	local UnixTimestamp_2 = DateTime.now().UnixTimestamp
	if UnixTimestamp_2 <= UnixTimestamp then
		return ("Ratelimited. Command is only able to be used once every %* seconds"):format(5)
	end
	UnixTimestamp = UnixTimestamp_2 + 5
	local v12, v22 = pcall(function() --[[ Line: 30 | Upvalues: TeleportService (ref), p2 (copy) ]]
		return { TeleportService:GetPlayerPlaceInstanceAsync(p2) }
	end)
	if not (v12 or v3) then
		return v22
	end
	local v32 = v2:GetKeyFromUserId((tostring(p2)))
	local v4 = v2:GetAsync(v32)
	if not v4 then
		return "Failed to get player data"
	end
	local v5, v6 = pcall(function() --[[ Line: 42 | Upvalues: HttpService (ref), v4 (copy) ]]
		return HttpService:JSONDecode(v4)
	end)
	if not v5 then
		return "Failed to decode player data"
	end
	local v7 = nil
	for v8, v9 in v6.SerializedData.CH do
		if v1.CodeToName(v9.N or v9.Name) == "DailyLogin" then
			v7 = v9
			break
		end
	end
	if not v7 then
		return "Failed to retrieve daily login data"
	end
	local v11 = nil
	for v122, v13 in v7.CH do
		if v1.CodeToName(v13.N or v13.Name) == "LongestStreak" then
			v11 = v13.V or v13.Value
			break
		end
	end
	if not v11 then
		return "Failed to retrieve longest streak"
	end
	local v16, v17 = nil, v11
	for v18, v19 in {
		ResetLogin = true,
		RestoredStreakTier = false,
		StreakTier = 0,
		CurrentStreak = v11 % 7,
		LastLogin = UnixTimestamp_2,
		Streak = v11
	} do
		local v20 = nil
		for v21, v222 in v7.CH do
			if v1.CodeToName(v222.N or v222.Name) == v18 then
				v20 = v222
				break
			end
		end
		v16 = v20 and true or false
		if not v16 then
			break
		end
		if v20.V then
			v20.V = v19
		elseif v20.Value then
			v20.Value = v19
		end
		warn((("Set %* %* to %*"):format(p2, v18, v19)))
	end
	if not v16 then
		return "Something went wrong during resetting data"
	end
	local v24, v25 = pcall(function() --[[ Line: 114 | Upvalues: HttpService (ref), v6 (copy) ]]
		return HttpService:JSONEncode(v6)
	end)
	if not v24 then
		return "Failed to encode player data"
	end
	local v26, v27 = pcall(function() --[[ Line: 119 | Upvalues: v2 (ref), v32 (copy), v25 (copy) ]]
		return v2:SetAsync(v32, v25)
	end)
	if not v26 then
		return v27
	end
	local v28 = ("Reset %*\'s daily login streak to %*"):format(p2, v17)
	return if v3 then "Roblox Studio can\'t tell if the player you\'re targeting is in game. If they are when you tried to do this, their data will break again when they leave the game and your command will not have worked. Please check if they are in game.\n" .. v28 else v28
end