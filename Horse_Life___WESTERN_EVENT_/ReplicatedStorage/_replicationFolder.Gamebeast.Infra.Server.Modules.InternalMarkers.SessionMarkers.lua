-- https://lua.expert/
local t = {}
game:GetService("HttpService")
local Players = game:GetService("Players")
local PolicyService = game:GetService("PolicyService")
local AssetService = game:GetService("AssetService")
game:GetService("RunService")
local v1 = shared.GBMod("Utilities")
local v2 = shared.GBMod("LaunchDataResolver")
local v3 = shared.GBMod("EngagementMarkers")
local v4 = shared.GBMod("PlayerStats")
local v5 = shared.GBMod("SocialHandler")
local v6 = shared.GBMod("ServerClientInfoHandler")
local t2 = {}
local t3 = {}
function t.Init(p1) --[[ Init | Line: 52 | Upvalues: v1 (copy), t2 (copy), PolicyService (copy), v2 (copy), v3 (copy), v4 (copy), v6 (copy), Players (copy), v5 (copy), t3 (copy), AssetService (copy) ]]
	v1:OnPlayerAdded(function(p1) --[[ Line: 53 | Upvalues: t2 (ref), v1 (ref), PolicyService (ref), v2 (ref), v3 (ref), v4 (ref), v6 (ref) ]]
		p1.CharacterRemoving:Connect(function(p12) --[[ Line: 55 | Upvalues: t2 (ref), p1 (copy) ]]
			t2[p1] = if p12.PrimaryPart then p12.PrimaryPart.Position or nil else nil
		end)
		local v12 = p1:GetJoinData()
		if v12.SourceGameId == game.GameId then
			return
		end
		local v22 = v1.promiseReturn(1, function() --[[ Line: 65 | Upvalues: PolicyService (ref), p1 (copy) ]]
			return PolicyService:GetPolicyInfoForPlayerAsync(p1)
		end)
		local v32 = if v12.ReferredByPlayerId then v1.promiseReturn(1, function() --[[ Line: 72 | Upvalues: p1 (copy), v12 (copy) ]]
	return p1:IsFriendsWith(v12.ReferredByPlayerId)
end) else nil
		local t = {
			policyInfo = v22
		}
		t.publicServer = if game.PrivateServerId == "" then true else false
		local v62
		if v12.ReferredByPlayerId and v12.ReferredByPlayerId ~= 0 then
			v62 = {}
			v62.type = if v32 then "friend" else "user"
			v62.id = v12.ReferredByPlayerId
		else
			v62 = nil
		end
		t.referrer = v62
		v2:OnResolved(p1, function(p12) --[[ Line: 86 | Upvalues: t (copy), v3 (ref), p1 (copy) ]]
			if not p12 then
				v3:SDKMarker("Login", t, {
					position = nil,
					player = p1
				})
				return
			end
			if p12._gbDeeplink then
				t.referrer = {
					type = "gamebeastDeeplink",
					id = p12._gbDeeplink.deeplinkId
				}
			else
				if t.referrer then
					v3:SDKMarker("Login", t, {
						position = nil,
						player = p1
					})
					return
				end
				t.referrer = {
					type = "deeplink",
					id = nil
				}
			end
			v3:SDKMarker("Login", t, {
				position = nil,
				player = p1
			})
		end)
		v4:OnDefaultStatsResolved(function() --[[ Line: 104 | Upvalues: v6 (ref), p1 (copy), v4 (ref) ]]
			v6:UpdateClientData(p1, "joinTime", v4:GetStat(p1, "join_time"))
		end)
	end)
	Players.PlayerRemoving:Connect(function(p1) --[[ Line: 110 | Upvalues: t2 (ref), v6 (ref), v1 (ref), v4 (ref), v5 (ref), t3 (ref), v3 (ref) ]]
		local v12 = t2[p1]
		t2[p1] = nil
		local v2 = v6:GetClientInfo(p1, "joinTime")
		local v32 = os.time()
		local v52 = v1.roundNum(v32 - (if v2 then v2 else v4:GetStat(p1, "join_time")), 0.1)
		local v62 = v5:GetTotalFriendPlaytime(p1)
		local t = {
			sessionLength = v52
		}
		t.sessionLengthPercentageWithFriends = if v62 then v1.roundNum(v62 / v52, 0.01) else nil
		local v8 = v4:GetStat(p1, "teleporting_to")
		if v6:IsClientInfoResolved(p1) == true and (v8 and t3[v8]) then
			v3:SDKMarker("PlaceTeleport", {
				sourcePlaceId = game.PlaceId,
				destinationPlaceId = v8,
				sessionLength = v1.roundNum(os.time() - v4:GetStat(p1, "join_time"), 0.1)
			}, {
				player = p1,
				position = v12
			})
		else
			v3:SDKMarker("Logout", t, {
				player = p1,
				position = v12
			})
		end
	end)
	task.spawn(function() --[[ Line: 140 | Upvalues: AssetService (ref), t3 (ref), v1 (ref) ]]
		local v12, v2 = pcall(function() --[[ Line: 142 | Upvalues: AssetService (ref), t3 (ref) ]]
			local v1 = AssetService:GetGamePlacesAsync()
			while true do
				for k, v in pairs(v1:GetCurrentPage()) do
					if not t3[v.PlaceId] then
						t3[v.PlaceId] = v
					end
				end
				if v1.IsFinished then
					break
				end
				v1:AdvanceToNextPageAsync()
			end
		end)
		if v12 then
			return
		end
		v1.GBWarn("Failed to get places in universe:", v2)
	end)
end
return t