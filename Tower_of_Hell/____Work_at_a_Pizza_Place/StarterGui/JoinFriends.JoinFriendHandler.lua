-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
Library:Load("Utility")
Library:Load("SoundFX")
local v1 = Library:Load("Network")
local v2 = Library:Load("Maid")
local v3 = require(game.ReplicatedStorage:WaitForChild("Enums"))
game:GetService("TweenService")
game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui")
local v4 = script.Parent
local FriendsList = v4:WaitForChild("FriendsList")
local JoinRandom = v4:WaitForChild("JoinRandom")
local Template = FriendsList:WaitForChild("Template")
local Loading = v4:WaitForChild("Loading")
local Close = v4:WaitForChild("Close")
local ButtonWrapper = require(game.ReplicatedStorage.ButtonWrapper)
local v5 = nil
function Hide() --[[ Hide | Line: 25 | Upvalues: v4 (copy), Template (copy), JoinRandom (copy), Loading (copy), Close (copy) ]]
	v4.Enabled = false
	Template.Visible = false
	JoinRandom.Visible = false
	Loading.Visible = false
	Close.Visible = false
end
Hide()
local v6 = v2.new()
function AddFriendToList(p1, p2, p3) --[[ AddFriendToList | Line: 38 | Upvalues: Template (copy), ButtonWrapper (copy), Loading (copy), v1 (copy), v3 (copy), FriendsList (copy), v6 (copy) ]]
	local v12 = Template:Clone()
	v12.Visible = true
	ButtonWrapper.Wrap(v12.Join.Mover, function() --[[ Line: 43 | Upvalues: Loading (ref), v1 (ref), p3 (copy), p2 (copy) ]]
		Loading.Visible = true
		v1:FireServer("TeleportToServerInstance", p3, p2)
	end)
	v12.LocationName.Text = v3.LocationName[p3] or ""
	v12.PlayerName.Text = p1
	v12.Parent = FriendsList
	v6:GiveTask(v12)
end
ButtonWrapper.Wrap(Close.Mover, function() --[[ Line: 54 | Upvalues: v4 (copy) ]]
	v4.Enabled = false
end)
ButtonWrapper.Wrap(JoinRandom.Mover, function() --[[ Line: 58 | Upvalues: ButtonWrapper (copy), JoinRandom (copy), Loading (copy), v1 (copy), v5 (ref) ]]
	ButtonWrapper.Unwrap(JoinRandom.Mover)
	Loading.Visible = true
	v1:FireServer("TeleportToRandomServerInstance", v5)
end)
v1:BindEvents({
	DisplayJoinableFriendsList = function(p1) --[[ DisplayJoinableFriendsList | Line: 66 | Upvalues: v6 (copy), v4 (copy), Loading (copy), JoinRandom (copy), Close (copy), v5 (ref) ]]
		v6:DoCleaning()
		v4.Enabled = true
		Loading.Visible = true
		JoinRandom.Visible = false
		Close.Visible = false
		v5 = p1
	end,
	JoinableFriendsSearchComplete = function() --[[ JoinableFriendsSearchComplete | Line: 76 | Upvalues: Loading (copy), JoinRandom (copy), Close (copy) ]]
		Loading.Visible = false
		JoinRandom.Visible = true
		Close.Visible = true
	end,
	JoinableFriendFound = function(p1, p2, p3) --[[ JoinableFriendFound | Line: 82 | Upvalues: Loading (copy), Close (copy) ]]
		Loading.Visible = false
		Close.Visible = true
		AddFriendToList(p1, p2, p3)
	end,
	HideFriendJoinList = Hide
})