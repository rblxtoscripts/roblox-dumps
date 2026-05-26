-- https://lua.expert/
local function OnClientInvoke() --[[ OnClientInvoke | Line: 2 ]]
	return os.time()
end
workspace.Main.GetLocalTime.OnClientInvoke = OnClientInvoke
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
Library:Load("Utility")
Library:Load("Events")
local v1 = Library:Load("SoundFX")
Library:Load("Date")
Library:Load("Queue")
local v2 = Library:Load("Network")
local v3 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
PlayerGui:WaitForChild("GuiTop")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local v4 = require(game.ReplicatedStorage:WaitForChild("Enums"))
require(game.ReplicatedStorage:WaitForChild("Dialog"))
local v5 = GuiManager:RegisterWindow(v3, "Left", "Right", 0.6)
local AButton = v3:WaitForChild("AButton")
v3:WaitForChild("Title")
local Claim = v3:WaitForChild("Claim")
local Streak = v3:WaitForChild("Streak")
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 37 | Upvalues: v3 (copy) ]] end)
v5:RegisterGamepadAction(Enum.KeyCode.ButtonA, function(p1, p2, p3) --[[ Line: 50 | Upvalues: AButton (copy) ]]
	if p2 ~= Enum.UserInputState.Begin then
		return
	end
	cashingOut = true
	AButton.Visible = false
end)
v2:BindEvents({
	ShowStreak = function(p1) --[[ ShowStreak | Line: 58 | Upvalues: Streak (copy), v5 (copy), v4 (copy), Claim (copy), AButton (copy), v1 (copy), v2 (copy) ]]
		Streak.Text = "\240\159\148\165" .. p1 - 1
		v5:SetVisible(true)
		if v4.GamepadEnabled then
			cashingOut = false
			Claim.Visible = false
			AButton.Visible = true
			while not cashingOut do
				wait(0.1)
			end
		else
			Claim.MouseButton1Click:wait()
		end
		game:GetService("TweenService"):Create(Streak, TweenInfo.new(0.5), {
			Size = UDim2.new(1, 0, 0.425, 0)
		}):Play()
		task.wait(0.7)
		v1:PlaySound("LoginStreak")
		Streak.Text = "\240\159\148\165" .. p1
		task.wait(0.3)
		game:GetService("TweenService"):Create(Streak, TweenInfo.new(0.5), {
			Size = UDim2.new(1, 0, 0.25, 0)
		}):Play()
		task.wait(0.7)
		v5:SetVisible(false)
		v2:FireServer("LoginStreakClaimed")
	end
})