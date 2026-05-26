-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
Library:Load("Utility")
Library:Load("Events")
local v1 = Library:Load("SoundFX")
local v2 = Library:Load("Network")
local v3 = script.Parent
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
PlayerGui:WaitForChild("UIEvents")
local v4 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local v5 = GuiManager:RegisterWindow(v3, "Top", "Bottom", nil, nil, true)
v5.IsCoreGuiWindow = true
v5.CanBeFocused = false
v5.CanBeOverriden = true
function wiggle(p1, p2, p3, p4) --[[ wiggle | Line: 22 ]]
	local v1 = 1
	game:GetService("RunService"):BindToRenderStep("Wiggle", Enum.RenderPriority.First.Value, function() --[[ Line: 24 | Upvalues: p1 (copy), v1 (ref), p3 (copy), p2 (copy) ]]
		p1.Rotation = p1.Rotation + v1 * p3
		if not (p2 <= math.abs(p1.Rotation)) then
			return
		end
		v1 = -v1
	end)
	spawn(function() --[[ Line: 30 | Upvalues: p4 (copy), p1 (copy) ]]
		wait(p4)
		game:GetService("RunService"):UnbindFromRenderStep("Wiggle")
		p1.Rotation = 0
	end)
end
v2:BindEvents({
	StartDoubleTimeCountdown = function(p1, p2) --[[ StartDoubleTimeCountdown | Line: 41 | Upvalues: v1 (copy), v3 (copy), v5 (copy), v4 (copy) ]]
		local v12 = nil
		if p1 == "DoubleTime" or p1 == "ClassicPt2" then
			v1:PreloadAsync("DoubleTimeCountdown", "Tada2", "DoubleTimeCountdown", "DoubleTimeSong")
			v3.NeonTime.Visible = false
			v5.TweenDuration = 0.3
			v12 = p1 == "DoubleTime" and v3.DoubleTime or v3.ChallengeTime
		elseif p1 == "NeonTime" then
			v1:PreloadAsync("NeonTimeCountdown", "NeonTimeIntro", "NeonTimeMusic")
			v12 = v3.NeonTime
			v3.DoubleTime.Visible = false
			v5.TweenDuration = 3
			local StartedBy = v12.StartedBy
			StartedBy.Visible = p2 and true or false
			local StartedBy_2 = v12.StartedBy
			StartedBy_2.Text = p2 and "Started By " .. p2.DisplayName or ""
			spawn(function() --[[ Line: 57 | Upvalues: v12 (ref), p2 (copy) ]]
				v12.PlayerImage.Image = ""
				if not p2 then
					return
				end
				local v1, _ = game.Players:GetUserThumbnailAsync(p2.UserId, Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size100x100)
				v12.PlayerImage.Image = v1
			end)
		end
		task.wait(3)
		local Countdown = v12.Countdown
		Countdown.Text = ""
		v12.Visible = true
		workspace.Main.FadeMusic.FadeMusic:Invoke("Out", true)
		v5:SetVisible(true)
		if p1 ~= "ClassicPt2" then
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
		end
		if p1 == "DoubleTime" then
			task.wait(0.3)
			v1:PlaySound("Tada2")
			task.wait(1)
		elseif p1 == "NeonTime" then
			v1:PlaySound("NeonTimeIntro")
			task.wait(4)
		end
		v1:PlaySound(if p1 == "DoubleTime" then "DoubleTimeCountdown" else "NeonTimeCountdown")
		Countdown.Text = v4.FormatNumber("Int", 3, Countdown)
		wiggle(Countdown, 10, 7, 0.1)
		task.wait(1)
		Countdown.Text = v4.FormatNumber("Int", 2, Countdown)
		wiggle(Countdown, 10, 7, 0.1)
		task.wait(1)
		Countdown.Text = v4.FormatNumber("Int", 1, Countdown)
		wiggle(Countdown, 10, 7, 0.1)
		task.wait(1)
		Countdown.Text = "Go!"
		wiggle(Countdown, 10, 7, 0.1)
		workspace.Main.FadeMusic.FadeMusic:Invoke("In", false)
		if p1 ~= "ClassicPt2" then
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 23
		end
		task.wait(1)
		if p1 == "ClassicPt2" then
			game.ReplicatedStorage._v6FiRE_Additions.ClassicPt2Event.onCountdownOver:Fire()
		end
		v5:SetVisible(false)
	end
})
local function SetLighting(p1) --[[ SetLighting | Line: 126 ]]
	for k, v in pairs(p1) do
		game.Lighting[k] = v
	end
end
if not game.ReplicatedStorage.GlobalData.NeonTime.Value or LocalPlayer:FindFirstChild("NeonTimeToken") then
	return
end
game.Lighting.Sky:Destroy()
game.Lighting.NeonTimeColor.Enabled = false
for k, v in pairs({
	TimeOfDay = "12:00:00",
	FogEnd = 10000000,
	GeographicLatitude = 40,
	Brightness = 1,
	OutdoorAmbient = Color3.fromRGB(255, 255, 255),
	Ambient = Color3.fromRGB(112, 112, 112),
	ColorShift_Bottom = Color3.fromRGB(0, 0, 0),
	ColorShift_Top = Color3.fromRGB(0, 0, 0)
}) do
	game.Lighting[k] = v
end