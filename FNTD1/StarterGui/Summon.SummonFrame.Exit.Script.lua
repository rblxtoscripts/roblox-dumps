-- https://lua.expert/
local TweenService = game:GetService("TweenService")
script.Parent.Tutorial.Changed:Connect(function() --[[ Line: 3 | Upvalues: TweenService (copy) ]]
	while script.Parent.Tutorial.Value do
		TweenService:Create(script.Parent.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			Scale = 1.5
		}):Play()
		TweenService:Create(script.Parent.TextLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			TextColor3 = Color3.fromRGB(255, 255, 255)
		}):Play()
		task.wait(0.5)
		TweenService:Create(script.Parent.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			Scale = 1
		}):Play()
		TweenService:Create(script.Parent.TextLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			TextColor3 = Color3.fromRGB(255, 0, 0)
		}):Play()
		task.wait(0.5)
	end
	script.Parent.ImageColor3 = Color3.fromRGB(255, 0, 0)
	script.Parent.UIScale.Scale = 1
	script.Parent.TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
end)