-- https://lua.expert/
local Players = game:GetService("Players")
local Chat = game:GetService("Chat")
local v1 = shared.GBMod("Updater")
local v2 = shared.GBMod("Utilities")
local v3 = shared.GBMod("InternalExperiments")
local function Propagate(p1, p2) --[[ Propagate | Line: 22 | Upvalues: v2 (copy) ]]
	v2.publishMessage("GB_PROPAGATE", {
		fromServer = game.JobId,
		requestType = p1,
		args = p2
	})
end
return {
	funcs = {
		Ban = function(p1) --[[ Line: 33 | Upvalues: v2 (copy), Players (copy) ]]
			local playerId = p1.playerId
			local v1
			if tonumber(playerId) then
				v1 = tonumber(playerId)
			else
				local v22, v3 = v2.promiseReturn(1, function() --[[ Line: 40 | Upvalues: Players (ref), playerId (ref) ]]
					return Players:GetUserIdFromNameAsync(playerId)
				end)
				v1 = v22
				if not v3 then
					error("Failed to resolve userId")
				end
			end
			local v4 = if p1.unbanAt then p1.unbanAt - os.time() * 1000 else -1
			local _, v5 = v2.promiseReturn(2, function() --[[ Line: 58 | Upvalues: Players (ref), v1 (ref), v4 (copy), p1 (copy) ]]
				local t = {
					UserIds = { v1 },
					Duration = v4,
					DisplayReason = p1.reason
				}
				t.PrivateReason = p1.privateReason or p1.reason
				t.ExcludeAltAccounts = p1.excludeAlts
				Players:BanAsync(t)
			end)
			if v5 then
				return
			end
			error("Failed to ban user")
		end,
		Unban = function(p1) --[[ Line: 69 | Upvalues: v2 (copy), Players (copy) ]]
			local playerId = p1.playerId
			local v1
			if tonumber(playerId) then
				v1 = tonumber(playerId)
			else
				local v22, v3 = v2.promiseReturn(1, function() --[[ Line: 76 | Upvalues: Players (ref), playerId (ref) ]]
					return Players:GetUserIdFromNameAsync(playerId)
				end)
				v1 = v22
				if not v3 then
					error("Failed to resolve userId")
				end
			end
			local _, v4 = v2.promiseReturn(2, function() --[[ Line: 91 | Upvalues: Players (ref), v1 (ref) ]]
				Players:UnbanAsync({
					ApplyToUniverse = true,
					UserIds = { v1 }
				})
			end)
			if v4 then
				return
			end
			error("Failed to unban user")
		end,
		Kick = function(p1) --[[ Line: 102 | Upvalues: v2 (copy), Chat (copy) ]]
			local playerId = p1.playerId
			local v1 = v2:FindPlayer(playerId)
			if v1 then
				v1:Kick((v2.promiseReturn(1, function() --[[ Line: 112 | Upvalues: Chat (ref), p1 (copy), v1 (copy) ]]
					return Chat:FilterStringForBroadcast(p1.reason, v1)
				end)))
			else
				v2.publishMessage("GB_PROPAGATE", {
					requestType = "Kick",
					fromServer = game.JobId,
					args = {
						playerId = playerId,
						reason = p1.reason
					}
				})
			end
		end,
		UpdateConfigs = function(p1) --[[ Line: 121 | Upvalues: v2 (copy), v1 (copy) ]]
			v2.GBLog("Received config update request", p1)
			v1:UpdateConfigs(p1)
			v2.publishMessage("GB_PROPAGATE", {
				requestType = "UpdateConfigs",
				args = nil,
				fromServer = game.JobId
			})
			task.spawn(function() --[[ Line: 128 | Upvalues: v1 (ref), p1 (copy) ]]
				v1:SaveConfigsToBackup(p1)
			end)
		end,
		PropagateAvailableExperiments = function(p1) --[[ Line: 135 | Upvalues: v2 (copy), v3 (copy) ]]
			v2.GBLog("Received experiment update request", p1)
			v3:UpdateStateFromAvailableExperiments(p1)
			v2.publishMessage("GB_PROPAGATE", {
				requestType = "UpdateExperiments",
				args = nil,
				fromServer = game.JobId
			})
		end,
		PropagateExperimentReassignment = function(p1) --[[ Line: 146 ]] end
	}
}