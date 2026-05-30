-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local v1 = UDim2.new(0.398, 0, 0.239, 0)
local v2 = UDim2.new(0.719, 0, 0.354, 0)
script.Parent.Tutorial.Changed:Connect(function() --[[ Line: 6 | Upvalues: TweenService (copy), v2 (copy), v1 (copy) ]]
	while script.Parent.Tutorial.Value do
		TweenService:Create(script.Parent, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			Size = v2,
			ImageColor3 = Color3.fromRGB(0, 255, 0)
		}):Play()
		TweenService:Create(script.Parent.TextLabel2, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			TextColor3 = Color3.fromRGB(0, 255, 0)
		}):Play()
		task.wait(0.5)
		TweenService:Create(script.Parent, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			Size = v1,
			ImageColor3 = Color3.fromRGB(255, 255, 255)
		}):Play()
		TweenService:Create(script.Parent.TextLabel2, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			TextColor3 = Color3.fromRGB(255, 255, 255)
		}):Play()
		task.wait(0.5)
	end
	script.Parent.ImageColor3 = Color3.fromRGB(255, 255, 255)
	script.Parent.Size = v1
	script.Parent.TextLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
end)