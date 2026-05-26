-- https://lua.expert/
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("BanService")
local v2 = RunService:IsStudio()
local v3 = v2 and false
local t = { "DisplayReason", "PrivateReason", "StartTime", "Duration", "Ban", "PlaceId" }
local function getUserId(p1) --[[ getUserId | Line: 24 ]]
	return (if typeof(p1) == "number" then {
	UserId = p1
} else p1).UserId
end
local function processBanServiceHistory(...) --[[ processBanServiceHistory | Line: 36 | Upvalues: v1 (copy) ]]
	local v12, v2 = ...
	local UserId = (if typeof(v2) == "number" then {
	UserId = v2
} else v2).UserId
	local v4 = ("Player (%*)"):format(UserId)
	v12:Reply((("Retrieving legacy ban history for %* ..."):format(v4)))
	local v5, v6 = v1.IsBanned({
		UserId = UserId
	})
	if not v5 then
		v12:Reply((("No legacy ban history found for %*"):format(v4)))
		return
	end
	if v6 == -1 then
		v12:Reply((("Player (%*) is permanently banned under old storage"):format(UserId)))
	else
		v12:Reply((("Player (%*) is banned until %* under old storage"):format(UserId, (DateTime.fromUnixTimestamp(v6):ToIsoDate()))))
	end
end
local function processPlayersServiceBanHistory(...) --[[ processPlayersServiceBanHistory | Line: 61 | Upvalues: v2 (copy), v3 (copy), Players (copy), t (copy) ]]
	local v1, v22 = ...
	local UserId = (if typeof(v22) == "number" then {
	UserId = v22
} else v22).UserId
	local v4 = ("Player (%*)"):format(UserId)
	v1:Reply((("Retrieving ban history for %* ..."):format(v4)))
	if v2 and not v3 then
		v1:Reply((("Unable to retrieve ban history for %* in Studio"):format(v4)))
		return
	end
	local v5 = select(-1, pcall(Players.GetBanHistoryAsync, Players, UserId))
	if v3 then
		local v6 = DateTime.now():ToIsoDate()
		v5 = {
			IsFinished = true,
			GetCurrentPage = function() --[[ GetCurrentPage | Line: 81 | Upvalues: v6 (copy) ]]
				return {
					{
						DisplayReason = "Ban reason",
						PrivateReason = "Private ban reason",
						Duration = -1,
						Ban = true,
						StartTime = v6,
						PlaceId = game.PlaceId
					},
					{
						DisplayReason = "Unban reason",
						PrivateReason = "Private unban reason",
						Duration = -1,
						Ban = false,
						StartTime = v6,
						PlaceId = game.PlaceId
					}
				}
			end
		}
	end
	v1:Reply((("Retrieved ban history for %*:"):format(v4)))
	while true do
		for v7, v8 in v5:GetCurrentPage() do
			v1:Reply(string.rep("-", 12))
			for v9, v10 in t do
				v1:Reply((("\t%*: %*,"):format(v10, v8[v10])))
			end
			v1:Reply(string.rep("-", 12))
		end
		if v5.IsFinished then
			break
		end
		v5:AdvanceToNextPageAsync()
	end
end
return function(...) --[[ Line: 129 | Upvalues: processPlayersServiceBanHistory (copy), processBanServiceHistory (copy) ]]
	pcall(processPlayersServiceBanHistory, ...)
	pcall(processBanServiceHistory, ...)
	return ""
end