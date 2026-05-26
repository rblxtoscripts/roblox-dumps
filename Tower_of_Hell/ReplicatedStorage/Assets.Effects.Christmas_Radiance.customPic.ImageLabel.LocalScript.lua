-- https://lua.expert/
local TweenService = game:GetService("TweenService")
while true do
	TweenService:Create(script.Parent, TweenInfo.new(1.5, Enum.EasingStyle.Linear), {
		ImageColor3 = Color3.fromRGB(255, 85, 73)
	}):Play()
	wait(1.5)
	TweenService:Create(script.Parent, TweenInfo.new(1.5, Enum.EasingStyle.Linear), {
		ImageColor3 = Color3.fromRGB(118, 255, 60)
	}):Play()
	wait(1.5)
end