-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local SocialService = game:GetService("SocialService")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local t2 = {}
local v2 = nil
local function isFriendsWith(p1, p2) --[[ isFriendsWith | Line: 21 ]]
	local v1, v2 = pcall(p1.IsFriendsWith, p1, p2.UserId)
	return v1 and v2
end
local function getFriendsOnline(p1) --[[ getFriendsOnline | Line: 27 ]]
	local v1, v2 = pcall(p1.GetFriendsOnline, p1)
	return v1 and v2
end
if v1 then
	function t.IsFriendsWith(p1, p2, p3) --[[ IsFriendsWith | Line: 36 | Upvalues: t2 (copy), t (copy) ]]
		local v1 = t2[p2]
		if v1 and v1[p3] ~= nil then
			return v1[p3]
		end
		local v2, v3 = pcall(p2.IsFriendsWith, p2, p3.UserId)
		local v4 = v2 and v3
		t:AddFriend(p2, p3, v4)
		t:AddFriend(p3, p2, v4)
		return v4
	end
	function t.AddFriend(p1, p2, p3, p4) --[[ AddFriend | Line: 57 | Upvalues: t2 (copy) ]]
		if not t2[p2] then
			t2[p2] = {}
		end
		t2[p2][p3] = p4
		task.delay(60, function() --[[ Line: 64 | Upvalues: t2 (ref), p2 (copy), p3 (copy) ]]
			if t2[p2] then
				t2[p2][p3] = nil
			end
		end)
	end
	local function iterateFriends(p1) --[[ iterateFriends | Line: 71 ]]
		return coroutine.wrap(function() --[[ Line: 72 | Upvalues: p1 (copy) ]]
			local count_2 = 1
			while true do
				for i2, v in ipairs(p1:GetCurrentPage()) do
					coroutine.yield(v, count_2)
				end
				if p1.IsFinished then
					break
				end
				p1:AdvanceToNextPageAsync()
				count_2 = count_2 + 1
			end
		end)
	end
	function t.GetOnlineFriends(p1) --[[ GetOnlineFriends | Line: 87 ]]
		local v1 = game.Players:GetFriendsAsync(p1.UserId)
		local t = {}
		for v2, v3 in coroutine.wrap(function() --[[ Line: 72 | Upvalues: v1 (copy) ]]
			local count_2 = 1
			while true do
				for i2, v in ipairs(v1:GetCurrentPage()) do
					coroutine.yield(v, count_2)
				end
				if v1.IsFinished then
					break
				end
				v1:AdvanceToNextPageAsync()
				count_2 = count_2 + 1
			end
		end) do
			if v2.IsOnline then
				table.insert(t, v2)
			end
		end
		return t
	end
	function t.Init(p1) --[[ Init | Line: 101 | Upvalues: Players (copy), t2 (copy) ]]
		Players.PlayerRemoving:Connect(function(p1) --[[ Line: 102 | Upvalues: t2 (ref) ]]
			t2[p1] = nil
			for k, v in pairs(t2) do
				v[p1] = nil
			end
		end)
	end
else
	local LocalPlayer = Players.LocalPlayer
	local function playerFriended(p1) --[[ playerFriended | Line: 113 | Upvalues: t2 (copy), t (copy) ]]
		t2[p1] = true
		t.OnFriended:Fire(p1)
	end
	local function playerUnfriended(p1) --[[ playerUnfriended | Line: 118 | Upvalues: t2 (copy), t (copy) ]]
		t2[p1] = false
		t.OnUnfriended:Fire(p1)
	end
	function t.IsFriendsWith(p1, p2) --[[ IsFriendsWith | Line: 126 | Upvalues: t2 (copy), LocalPlayer (copy) ]]
		if t2[p2] == nil then
			local v1 = LocalPlayer
			local v2, v3 = pcall(v1.IsFriendsWith, v1, p2.UserId)
			local v4 = v2 and v3
			t2[p2] = v4
			return v4
		else
			return t2[p2]
		end
	end
	function t.GetFriends() --[[ GetFriends | Line: 143 | Upvalues: t2 (copy) ]]
		return t2
	end
	function t.GetOnlineFriends() --[[ GetOnlineFriends | Line: 147 | Upvalues: v2 (ref), LocalPlayer (copy) ]]
		if v2 then
			return v2
		end
		local v1 = LocalPlayer
		local v22, v3 = pcall(v1.GetFriendsOnline, v1)
		v2 = v22 and v3 or {}
		task.delay(10, function() --[[ Line: 153 | Upvalues: v2 (ref) ]]
			v2 = nil
		end)
		return v2
	end
	function t.Init(p1) --[[ Init | Line: 160 | Upvalues: StarterGui (copy), t (copy), Sonar (copy), playerFriended (copy), playerUnfriended (copy), Players (copy), t2 (copy) ]]
		local v1 = nil
		local v2 = nil
		repeat
			local v3 = pcall(function() --[[ Line: 164 | Upvalues: v1 (ref), StarterGui (ref), v2 (ref) ]]
				v1 = StarterGui:GetCore("PlayerFriendedEvent")
				v2 = StarterGui:GetCore("PlayerUnfriendedEvent")
			end)
			if v3 then
				continue
			end
			task.wait()
		until v3
		t.OnFriended = Sonar("Signal").new()
		t.OnUnfriended = Sonar("Signal").new()
		v1.Event:Connect(playerFriended)
		v2.Event:Connect(playerUnfriended)
		Players.PlayerRemoving:Connect(function(p1) --[[ Line: 179 | Upvalues: t2 (ref) ]]
			t2[p1] = nil
		end)
	end
end
function t.PromptGameInvite(p1, p2) --[[ PromptGameInvite | Line: 185 | Upvalues: SocialService (copy) ]]
	local v1 = pcall(function() --[[ Line: 186 | Upvalues: SocialService (ref), p1 (copy), p2 (copy) ]]
		SocialService:PromptGameInvite(p1, p2)
	end)
	if not v1 then
		warn(v1)
	end
	return v1
end
task.spawn(t.Init)
return t