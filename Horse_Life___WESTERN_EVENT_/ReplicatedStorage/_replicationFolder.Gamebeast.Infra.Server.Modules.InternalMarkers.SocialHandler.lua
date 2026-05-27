-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
shared.GBMod("EngagementMarkers")
local v1 = shared.GBMod("ServerClientInfoHandler")
local v2 = shared.GBMod("PlayerStats")
local v3 = shared.GBMod("Cleaner")
local t2 = {}
local function CreateCacheEntry(p1) --[[ CreateCacheEntry | Line: 41 | Upvalues: v3 (copy), t2 (copy) ]]
	local t = {
		LastClientUpdate = 0,
		Cleaner = v3.new()
	}
	t2[p1] = t
	return t
end
function t.GetTotalFriendPlaytime(p1, p2) --[[ GetTotalFriendPlaytime | Line: 54 | Upvalues: t2 (copy), v1 (copy) ]]
	local v12 = t2[p2]
	if v12 == nil or v1:IsClientInfoResolved(p2) == false then
		return nil
	end
	t2[p2] = nil
	local v2 = v1:GetClientInfo(p2, "hasFriendsOnline")
	local v3 = v1:GetClientInfo(p2, "totalFriendPlaytime")
	if v2 then
		return v3 + (os.time() - v12.LastClientUpdate)
	else
		return v3
	end
end
function t.Init(p1) --[[ Init | Line: 73 | Upvalues: v3 (copy), t2 (copy), v1 (copy), v2 (copy), Players (copy) ]]
	local function playerAdded(p1) --[[ playerAdded | Line: 74 | Upvalues: v3 (ref), t2 (ref), v1 (ref), v2 (ref) ]]
		local t = {
			LastClientUpdate = 0,
			Cleaner = v3.new()
		}
		t2[p1] = t
		local v12 = t
		v12.Cleaner:Add(v1:OnClientInfoChanged(p1, function(p1, p2) --[[ Line: 77 | Upvalues: v12 (copy) ]]
			if p1 ~= "friendClockStart" then
				return
			end
			v12.LastClientUpdate = os.time()
		end))
		local v22 = 0
		p1.OnTeleport:Connect(function(p12, p2) --[[ Line: 84 | Upvalues: v2 (ref), p1 (copy), v22 (ref) ]]
			if p12 == Enum.TeleportState.RequestedFromServer then
				v2:SetStat(p1, "teleporting_to", p2)
				v22 = v22 + 1
				return
			end
			if p12 ~= Enum.TeleportState.Failed then
				return
			end
			v22 = v22 - 1
			if not (v22 <= 0) then
				return
			end
			v2:SetStat(p1, "teleporting_to", nil)
		end)
	end
	Players.PlayerAdded:Connect(playerAdded)
	for i, v in ipairs(Players:GetPlayers()) do
		task.spawn(playerAdded, v)
	end
	Players.PlayerRemoving:Connect(function(p1) --[[ Line: 102 | Upvalues: t2 (ref) ]]
		if not t2[p1] then
			return
		end
		t2[p1].Cleaner:Destroy()
	end)
end
return t