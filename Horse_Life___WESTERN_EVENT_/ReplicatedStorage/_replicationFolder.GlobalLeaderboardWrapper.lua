-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("GlobalLeaderboardService")
local v2 = Sonar("StorageUtils")
local v3 = Sonar("PlayerWrapper")
local v4 = v2.GetConfig("GlobalLeaderboard")()
local v5 = game:GetService("RunService"):IsServer()
function t.new(p1) --[[ new | Line: 17 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2.PlayerWrapper = p1
	v2.Player = v2.PlayerWrapper.Player
	return v2
end
function t.IncrementLeaderboards(p1, p2) --[[ IncrementLeaderboards | Line: 26 | Upvalues: v1 (copy) ]]
	local v12 = type(p2) == "string" and {
		Type = p2
	} or p2
	v12.Amount = v12.Amount or 1
	local v2 = v12
	for v3, v4 in v1.GetLeaderboards() do
		v4:IncrementScore(p1.PlayerWrapper, v2)
	end
end
function t.Init(p1) --[[ Init | Line: 36 | Upvalues: v3 (copy), v5 (copy), v4 (copy) ]]
	v3.bindToPlayers({
		AfterInit = function(p1, p2) --[[ AfterInit | Line: 38 | Upvalues: v5 (ref), v4 (ref) ]]
			if not (v5 and v4.Init) then
				return
			end
			v4.Init(p2)
		end
	})
end
return t