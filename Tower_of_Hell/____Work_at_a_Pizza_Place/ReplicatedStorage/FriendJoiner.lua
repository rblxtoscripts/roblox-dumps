-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Network")
local v2 = Library:Load("Timer")
local v3 = Library:Load("Utility")
local v4 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local Dialog = require(game.ReplicatedStorage:WaitForChild("Dialog"))
local t = {
	Show = function(p1, p2, p3) --[[ Show | Line: 13 | Upvalues: v4 (copy), v3 (copy), v1 (copy), v2 (copy) ]]
		if v4.IsClient then
			if _G.GamepadEnabled then
				v3:SendData("TeleportToMainGame", "PlayerChannel", nil, p3)
			else
				v1:FireServer("ShowFriendJoiner", p3)
			end
		else
			v1:FireClient(p2, "DisplayJoinableFriendsList", p3)
			if not v4.LocationName[p3] then
				return
			end
			local v12 = game.Players:GetFriendsAsync(p2.UserId)
			local function iterPageItems(p1) --[[ iterPageItems | Line: 40 ]]
				return coroutine.wrap(function() --[[ Line: 41 | Upvalues: p1 (copy) ]]
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
			local count = 0
			local v22 = 0
			for v32, v42 in coroutine.wrap(function() --[[ Line: 41 | Upvalues: v12 (copy) ]]
				local count_2 = 1
				while true do
					for i2, v in ipairs(v12:GetCurrentPage()) do
						coroutine.yield(v, count_2)
					end
					if v12.IsFinished then
						break
					end
					v12:AdvanceToNextPageAsync()
					count_2 = count_2 + 1
				end
			end) do
				if v32.IsOnline then
					count = count + 1
					task.spawn(function() --[[ Line: 63 | Upvalues: v32 (copy), v22 (ref), v1 (ref), p2 (copy), count (ref) ]]
						local v12 = nil
						local v2 = nil
						local v3 = nil
						local v4, _ = pcall(function() --[[ Line: 65 | Upvalues: v12 (ref), v2 (ref), v3 (ref), v32 (ref) ]]
							local v1, v22, v33, v4 = game:GetService("TeleportService"):GetPlayerPlaceInstanceAsync(v32.Id)
							v12 = v1
							_ = v22
							v2 = v33
							v3 = v4
						end)
						if not v4 or v12 then
							count = count - 1
							return
						end
						v22 = v22 + 1
						v1:FireClient(p2, "JoinableFriendFound", v32.DisplayName, v3, v2)
						count = count - 1
					end)
				end
			end
			local v5 = v2.new(5)
			v5:Start()
			while v5:IsRunning() and (p2 and (p2.Parent and count ~= 0)) do
				wait(0.1)
			end
			v5:Stop()
			if v22 == 0 then
				game:GetService("TeleportService"):Teleport(p3, p2, nil, game.ReplicatedStorage.JoiningGame)
			else
				v1:FireClient(p2, "JoinableFriendsSearchComplete")
			end
		end
	end,
	Hide = function(p1, p2) --[[ Hide | Line: 107 | Upvalues: v4 (copy), v1 (copy) ]]
		if v4.IsClient then
			v1:FireServer("HideFriendJoiner")
		else
			v1:FireClient(p2, "HideFriendJoinList")
		end
	end
}
if v4.IsClient then
	game:GetService("TeleportService").TeleportInitFailed:Connect(function() --[[ Line: 117 | Upvalues: t (copy), Dialog (copy) ]]
		local LocalPlayer = game.Players.LocalPlayer
		t:Hide(LocalPlayer)
		local JoiningGame = LocalPlayer.PlayerGui:FindFirstChild("JoiningGame", true)
		if not JoiningGame then
			Dialog:ShowMessage("Teleport Failed", "Please try again")
			return
		end
		JoiningGame:Destroy()
		Dialog:ShowMessage("Teleport Failed", "Please try again")
	end)
end
if v4.IsServer then
	v1:BindEvents({
		ShowFriendJoiner = {
			MatchParams = { "number" },
			function(p1, p2) --[[ Line: 136 | Upvalues: t (copy) ]]
				t:Show(p1, p2)
			end
		},
		HideFriendJoiner = function(p1) --[[ HideFriendJoiner | Line: 140 | Upvalues: t (copy) ]]
			t:Hide(p1)
		end,
		TeleportToRandomServerInstance = {
			MatchParams = { "number" },
			function(p1, p2) --[[ Line: 146 ]]
				game:GetService("TeleportService"):Teleport(p2, p1, {}, game.ReplicatedStorage.JoiningGame)
			end
		},
		TeleportToServerInstance = function(p1, p2, p3) --[[ TeleportToServerInstance | Line: 154 ]]
			game:GetService("TeleportService"):TeleportToPlaceInstance(p2, p3, p1, nil, {}, game.ReplicatedStorage.JoiningGame)
		end
	})
end
return t