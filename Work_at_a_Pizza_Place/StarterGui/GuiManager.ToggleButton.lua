-- https://lua.expert/
require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local t = {}
local UIEvents = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("UIEvents")
require(game.ReplicatedStorage:WaitForChild("Enums"))
t.__index = t
function t.new(p1, p2, p3) --[[ new | Line: 15 | Upvalues: t (copy) ]]
	local t2 = {}
	setmetatable(t2, t)
	t2.Object = p1
	t2.Type = "ToggleButton"
	t2.IsOn = true
	t2.WindowData = p2
	t2.Dragger = p1:WaitForChild("Dragger")
	p1.MouseButton1Click:connect(function() --[[ Line: 27 | Upvalues: t2 (copy) ]]
		t2:Toggle(true)
	end)
	t2:SetValue(p3)
	return t2
end
function t.Toggle(p1, p2) --[[ Toggle | Line: 39 | Upvalues: UIEvents (copy) ]]
	if p1.IsOn then
		p1.IsOn = false
		game:GetService("TweenService"):Create(p1.Dragger, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
			Position = UDim2.new(0.5, -14, 0.5, 0)
		}):Play()
		game:GetService("TweenService"):Create(p1.Object.BackgroundBar, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
			BackgroundColor3 = Color3.fromRGB(232, 219, 195)
		}):Play()
	else
		game:GetService("TweenService"):Create(p1.Dragger, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
			Position = UDim2.new(0.5, 14, 0.5, 0)
		}):Play()
		game:GetService("TweenService"):Create(p1.Object.BackgroundBar, TweenInfo.new(0.2, Enum.EasingStyle.Sine), {
			BackgroundColor3 = Color3.fromRGB(140, 167, 176)
		}):Play()
		p1.IsOn = true
	end
	if not p2 then
		return
	end
	UIEvents.ToggleButtonPressed:Fire(p1.WindowData.Object, p1.Object, p1.IsOn)
end
function t.SetValue(p1, p2, p3) --[[ SetValue | Line: 59 ]]
	if p1.IsOn == p2 then
		return
	end
	p1:Toggle(p3)
end
return t