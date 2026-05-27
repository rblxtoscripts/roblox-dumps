-- https://lua.expert/
local t = {}
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local v1 = UDim2.new(0, 0, 5, 0)
local v2 = UDim2.new(5, 0, 5, 0)
local v3 = require(ReplicatedStorage:WaitForChild("Sonar"))("SoundPlayer")
local TransitionGui = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("TransitionGui")
local TransitionLabel = TransitionGui:WaitForChild("TransitionLabel")
local SonarLabel = TransitionGui:WaitForChild("SonarLabel")
local QuickFrame = TransitionGui:WaitForChild("QuickFrame")
local TransitionSound = ReplicatedStorage.Storage.SFX.TransitionSound
function t.Start(p1, p2, p3) --[[ Start | Line: 31 | Upvalues: t (copy), TransitionLabel (copy), TweenService (copy), v1 (copy), TransitionSound (copy), v3 (copy), SonarLabel (copy) ]]
	if t.Transitioning then
		return
	end
	t.Transitioning = true
	local v12 = tick()
	TweeningIn = v12
	TransitionLabel.Visible = true
	local v2 = TweenService:Create(TransitionLabel, TweenInfo.new(0.75, Enum.EasingStyle.Sine), {
		Size = v1
	})
	v2:Play()
	TransitionSound.Pitch = 1
	TransitionSound.TimePosition = 0.2
	v3:PlayLocalSound(TransitionSound)
	task.wait(0.5)
	SonarLabel.UIScale.Scale = 0
	SonarLabel.Visible = true
	TweenService:Create(SonarLabel.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Bounce), {
		Scale = 1
	}):Play()
	for i = 1, 1 do
		SonarLabel.Rotation = 0
		v2 = TweenService:Create(SonarLabel, TweenInfo.new(0.75, Enum.EasingStyle.Quint), {
			Rotation = 360
		})
		v2:Play()
		v2.Completed:Wait()
		wait(0.2)
	end
	task.spawn(function() --[[ Line: 70 | Upvalues: v12 (copy), SonarLabel (ref), v2 (ref), TweenService (ref) ]]
		while TweeningIn == v12 do
			SonarLabel.Rotation = 0
			v2 = TweenService:Create(SonarLabel, TweenInfo.new(0.75, Enum.EasingStyle.Quint), {
				Rotation = 360
			})
			v2:Play()
			v2.Completed:Wait()
			wait(0.2)
		end
	end)
	wait(0.2)
end
function t.End(p1, p2) --[[ End | Line: 87 | Upvalues: TransitionSound (copy), v3 (copy), TweenService (copy), SonarLabel (copy), TransitionLabel (copy), v2 (copy), t (copy) ]]
	TweeningIn = nil
	TransitionSound.Pitch = 1.5
	TransitionSound.TimePosition = 0.2
	v3:PlayLocalSound(TransitionSound)
	TweenService:Create(SonarLabel.UIScale, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
		Scale = 0
	}):Play()
	wait(0.1)
	local v1 = TweenService:Create(TransitionLabel, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
		Size = v2
	})
	v1:Play()
	v1.Completed:Wait()
	TransitionLabel.Visible = false
	t.Transitioning = false
end
function t.QuickStart() --[[ QuickStart | Line: 105 | Upvalues: t (copy), QuickFrame (copy), TweenService (copy), TransitionSound (copy), v3 (copy) ]]
	t.Transitioning = true
	QuickFrame.Position = UDim2.new(3, 0, 0.5, 0)
	QuickFrame.Visible = true
	local v1 = TweenService:Create(QuickFrame, TweenInfo.new(0.8), {
		Position = UDim2.new(0.5, 0, 0.5, 0)
	})
	TransitionSound.Pitch = 1
	TransitionSound.TimePosition = 0.2
	v3:PlayLocalSound(TransitionSound)
	v1:Play()
	v1.Completed:wait()
	task.wait(0.25)
end
function t.QuickEnd() --[[ QuickEnd | Line: 123 | Upvalues: TweenService (copy), QuickFrame (copy), t (copy) ]]
	local v1 = TweenService:Create(QuickFrame, TweenInfo.new(0.8), {
		Position = UDim2.new(-3, 0, 0.5, 0)
	})
	v1:Play()
	v1.Completed:Wait()
	QuickFrame.Visible = false
	t.Transitioning = false
end
function t.YieldForEnd() --[[ YieldForEnd | Line: 137 | Upvalues: t (copy), RunService (copy) ]]
	if not t.Transitioning then
		return
	end
	repeat
		RunService.Heartbeat:Wait()
	until not t.Transitioning
end
return t