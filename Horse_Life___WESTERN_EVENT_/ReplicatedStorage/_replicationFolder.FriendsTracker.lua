-- https://lua.expert/
local t = {}
t.__index = t
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("Signal")
local v2 = Sonar("Maid")
local v3 = Sonar("Promise")
local v4 = Sonar("safeDestroy")
local v5 = Sonar("RemoteUtils")
local v6 = Sonar("StorageUtils")
local v7 = game:GetService("RunService"):IsServer()
local FriendStateCheckInterval = v6.GetConfig("Settings")().FriendStateCheckInterval
local v8 = v5.GetRemoteEvent("FriendStateUpdate")
function t._initOnlineFriends(p1) --[[ _initOnlineFriends | Line: 34 | Upvalues: v3 (copy), Players (copy) ]]
	p1.Maid:GivePromise(v3.new(function(p12) --[[ Line: 35 | Upvalues: Players (ref), p1 (copy) ]]
		local v1, v2 = pcall(function() --[[ Line: 36 | Upvalues: Players (ref), p1 (ref) ]]
			return Players:GetFriendsAsync(p1.Player.UserId)
		end)
		if v1 then
			local function v3() --[[ processNextPage | Line: 46 | Upvalues: v2 (copy), Players (ref), p1 (ref), v3 (copy), p12 (copy) ]]
				for v1, v22 in v2:GetCurrentPage() do
					local v32 = Players:GetPlayerByUserId(v22.Id)
					if v32 and v32 ~= p1.Player then
						p1.InGameFriends[v32] = true
					end
				end
				if v2:IsFinished() then
					p1.OnFriendsChangedSignal:Fire()
					p12()
				else
					v2:AdvanceToNextPageAsync()
					task.spawn(v3)
				end
			end
			v3()
		else
			warn("\226\157\140 FriendsState, Failed to get friends:", v2)
			p12()
		end
	end))
end
function t._init(p1) --[[ _init | Line: 71 | Upvalues: v1 (copy), v2 (copy), Players (copy), v7 (copy), FriendStateCheckInterval (copy), v3 (copy), StarterGui (copy) ]]
	p1.InGameFriends = {}
	p1.FriendshipSignals = {}
	p1.OnFriendsChangedSignal = v1.new()
	p1.Maid = v2.new()
	p1.Maid:GiveTask(p1.OnFriendsChangedSignal)
	p1.Maid:GiveTask(function() --[[ Line: 79 | Upvalues: p1 (copy) ]]
		for v1, v2 in p1.FriendshipSignals do
			v2:Destroy()
		end
		p1.FriendshipSignals = {}
	end)
	p1:_initOnlineFriends()
	local function playerAdded(p12) --[[ playerAdded | Line: 91 | Upvalues: p1 (copy) ]]
		if p12 == p1.Player or not p1:_isFriendsWith(p12) then
			return
		end
		p1:UpdateFriendState(p12, true)
	end
	p1.Maid:GiveTask(Players.PlayerAdded:Connect(playerAdded))
	for v12, v22 in Players:GetPlayers() do
		task.spawn(playerAdded, v22)
	end
	p1.Maid:GiveTask(Players.PlayerRemoving:Connect(function(p12) --[[ Line: 102 | Upvalues: p1 (copy) ]]
		if p1.InGameFriends[p12] then
			p1:UpdateFriendState(p12, false)
		end
		local v1 = p1.FriendshipSignals[p12]
		if not v1 then
			return
		end
		v1:Destroy()
		p1.FriendshipSignals[p12] = nil
	end))
	if v7 then
		p1.Maid:GiveTask(task.spawn(function() --[[ Line: 118 | Upvalues: p1 (copy), FriendStateCheckInterval (ref) ]]
			while true do
				for v1, v2 in p1.InGameFriends do
					if v1 ~= p1.Player then
						local v3 = p1:_isFriendsWith(v1)
						if v3 ~= (if p1.InGameFriends[v1] == true then true else false) then
							p1:UpdateFriendState(v1, v3)
						end
					end
				end
				task.wait(FriendStateCheckInterval)
			end
		end))
	else
		v3.new(function(p1) --[[ Line: 135 | Upvalues: StarterGui (ref) ]]
			local function v1() --[[ tryGetEvents | Line: 136 | Upvalues: StarterGui (ref), p1 (copy), v1 (copy) ]]
				local v12, v2 = pcall(function() --[[ Line: 137 | Upvalues: StarterGui (ref) ]]
					return { StarterGui:GetCore("PlayerFriendedEvent"), StarterGui:GetCore("PlayerUnfriendedEvent") }
				end)
				if v12 then
					p1(v2)
				else
					task.delay(0.5, v1)
				end
			end
			local v2, v3 = pcall(function() --[[ Line: 137 | Upvalues: StarterGui (ref) ]]
				return { StarterGui:GetCore("PlayerFriendedEvent"), StarterGui:GetCore("PlayerUnfriendedEvent") }
			end)
			if v2 then
				p1(v3)
			else
				task.delay(0.5, v1)
			end
		end):andThen(function(p12) --[[ Line: 152 | Upvalues: p1 (copy) ]]
			local v1, v2 = unpack(p12)
			p1.Maid:GiveTask(v1.Event:Connect(function(p12) --[[ Line: 155 | Upvalues: p1 (ref) ]]
				p1:UpdateFriendState(p12, true)
			end))
			p1.Maid:GiveTask(v2.Event:Connect(function(p12) --[[ Line: 159 | Upvalues: p1 (ref) ]]
				p1:UpdateFriendState(p12, false)
			end))
		end):catch(function(p1) --[[ Line: 162 ]]
			warn("\226\157\140 FriendsState, Failed to get friend events:", p1)
		end)
	end
end
function t._isFriendsWith(p1, p2) --[[ _isFriendsWith | Line: 172 ]]
	local v1
	if typeof(p2) == "Instance" and p2:IsA("Player") then
		if not p2.Parent then
			return false
		end
		v1 = p2.UserId
	else
		v1 = p2
	end
	if p1.Player.UserId < 0 and v1 < 0 then
		return true
	end
	local v2, v3 = pcall(function() --[[ Line: 188 | Upvalues: p1 (copy), v1 (ref) ]]
		return p1.Player:IsFriendsWith(v1)
	end)
	if v2 then
		return v3
	else
		warn("\226\157\140 FriendsState, Failed to check friendship status:", v3)
		return false
	end
end
function t._fireFriendshipSignal(p1, p2, p3) --[[ _fireFriendshipSignal | Line: 204 ]]
	local v1 = p1.FriendshipSignals[p2]
	if not v1 then
		return
	end
	v1:Fire(p3)
end
function t.GetFriendshipChangedSignal(p1, p2) --[[ GetFriendshipChangedSignal | Line: 215 | Upvalues: v1 (copy) ]]
	if not p2 then
		warn("\226\154\160\239\184\143 InGameFriendTracker, Target player is required")
		return nil
	end
	if not p1.FriendshipSignals[p2] then
		p1.FriendshipSignals[p2] = v1.new()
		p1:_fireFriendshipSignal(p2, p1:IsFriendsWith(p2))
	end
	return p1.FriendshipSignals[p2]
end
function t.new(p1) --[[ new | Line: 235 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Player = p1.Player
	if p1:IsLocalOrServer() then
		v2:_init()
	end
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 248 | Upvalues: v4 (copy) ]]
	v4(p1)
end
function t.GetFriendsInGame(p1) --[[ GetFriendsInGame | Line: 255 ]]
	local t = {}
	for v1, v2 in p1.InGameFriends do
		if v1.Parent then
			table.insert(t, v1)
		end
	end
	return t
end
function t.GetTotalFriendsInGame(p1) --[[ GetTotalFriendsInGame | Line: 269 ]]
	local count = 0
	for v1 in p1.InGameFriends do
		count = count + 1
	end
	return count
end
function t.IsFriendsWith(p1, p2) --[[ IsFriendsWith | Line: 281 ]]
	return p1.InGameFriends[p2] == true
end
function t.GetFriendsInGameChangedSignal(p1) --[[ GetFriendsInGameChangedSignal | Line: 288 ]]
	return p1.OnFriendsChangedSignal
end
function t.UpdateFriendState(p1, p2, p3) --[[ UpdateFriendState | Line: 296 | Upvalues: v7 (copy), v8 (copy) ]]
	if not p2 then
		warn("\226\154\160\239\184\143 FriendsState, Target player is required")
		return
	end
	if p3 then
		p1.InGameFriends[p2] = true
	else
		p1.InGameFriends[p2] = nil
	end
	p1.OnFriendsChangedSignal:Fire()
	p1:_fireFriendshipSignal(p2, p3)
	if v7 then
		return
	end
	v8:FireServer(p2, p3)
end
return t