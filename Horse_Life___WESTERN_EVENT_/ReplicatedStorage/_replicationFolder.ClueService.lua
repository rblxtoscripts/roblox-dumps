-- https://lua.expert/
local RunService = game:GetService("RunService")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("PlayerWrapper")
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("TimeUtils")
local v4 = Sonar("TutorialService")
local t = {
	HasAvailableChests = function(p1) --[[ HasAvailableChests | Line: 17 | Upvalues: v1 (copy) ]]
		local v12 = v1.getWrapperFromPlayer(p1)
		if not v12 then
			return false
		end
		for v2, v3 in v12.PlayerData.TreasureChests:GetChildren() do
			for v4, v5 in v3:GetChildren() do
				if not v5.Value then
					return true
				end
			end
		end
		return false
	end,
	GetRemainingClues = function(p1) --[[ GetRemainingClues | Line: 40 | Upvalues: v1 (copy) ]]
		local v12 = v1.getWrapperFromPlayer(p1)
		if not v12 then
			return 0
		end
		local count = 0
		for i = 1, 3 do
			if v12.PlayerData.Clues[tostring(i)] and v12.PlayerData.Clues[tostring(i)].Value then
				count = count + 1
			end
		end
		return math.max(0, 3 - count)
	end
}
function t.CanFindClue(p1) --[[ CanFindClue | Line: 63 | Upvalues: v1 (copy), v3 (copy), t (copy) ]]
	local v12 = v1.getWrapperFromPlayer(p1)
	if not v12 then
		return false
	end
	if v3.Get() - (v12.PlayerData.LastClue.Value or 0) < 180 then
		return false
	end
	return t.HasAvailableChests(p1) and t.GetRemainingClues(p1) > 0
end
function t.Init(p1) --[[ Init | Line: 76 | Upvalues: RunService (copy), v2 (copy), v1 (copy), v4 (copy), t (copy), v3 (copy) ]]
	if not RunService:IsServer() then
		return
	end
	v2.GetRemoteFunction("ClaimClue").OnServerInvoke = function(p1) --[[ Line: 80 | Upvalues: v1 (ref), v4 (ref), t (ref), v3 (ref) ]]
		local v12 = v1.getWrapperFromPlayer(p1)
		if not v12 then
			return false
		end
		if v4.IsInTutorial(v12) then
			return false
		end
		if not t.CanFindClue(p1) then
			return false
		end
		for i = 1, 3 do
			if not v12.PlayerData.Clues[tostring(i)].Value then
				v12.PlayerData.Clues[tostring(i)].Value = true
				v12.PlayerData.LastClue.Value = v3.Get()
				return true
			end
		end
		return false
	end
end
t:Init()
return t