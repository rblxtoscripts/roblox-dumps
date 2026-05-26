-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local v1 = shared.GBMod("ClientInfoHandler")
local t2 = {}
local v2 = 0
local function UpdateFriendCache() --[[ UpdateFriendCache | Line: 39 | Upvalues: Players (copy), t2 (copy), v1 (copy), v2 (ref) ]]
	local v12 = 0
	local v22, v3 = pcall(function() --[[ Line: 41 | Upvalues: Players (ref), v12 (ref), t2 (ref) ]]
		local v1 = Players:GetFriendsAsync(Players.LocalPlayer.UserId)
		while true do
			for i, v in ipairs((v1:GetCurrentPage())) do
				if Players:GetPlayerByUserId(v.Id) then
					v12 = v12 + 1
				end
				t2[v.Id] = true
			end
			if v1.IsFinished then
				break
			end
			v1:AdvanceToNextPageAsync()
		end
	end)
	local v4 = v1:GetClientInfo("hasFriendsOnline") or false
	if v4 == true and v12 <= 0 then
		v1:UpdateClientInfo("totalFriendPlaytime", (v1:GetClientInfo("totalFriendPlaytime") or 0) + os.time() - v1:GetClientInfo("friendClockStart"))
	elseif v12 > 0 and v4 == false then
		v1:UpdateClientInfo("friendClockStart", os.time())
	end
	v2 = v12
	local v7 = if v12 > 0 then true else false
	v1:UpdateClientInfo("hasFriendsOnline", v7)
	return v22, v3
end
function t.Init(p1) --[[ Init | Line: 80 | Upvalues: Players (copy), t2 (copy), v2 (ref), UpdateFriendCache (copy) ]]
	task.spawn(function() --[[ Line: 81 | Upvalues: Players (ref), t2 (ref), v2 (ref), UpdateFriendCache (ref) ]]
		Players.PlayerAdded:Connect(function(p1) --[[ Line: 82 | Upvalues: t2 (ref), v2 (ref) ]]
			if not t2[p1.UserId] then
				return
			end
			v2 = v2 + 1
		end)
		Players.PlayerRemoving:Connect(function(p1) --[[ Line: 88 | Upvalues: t2 (ref), v2 (ref) ]]
			if not t2[p1.UserId] then
				return
			end
			v2 = v2 - 1
		end)
		UpdateFriendCache()
		while task.wait(600) do
			UpdateFriendCache()
		end
	end)
end
return t