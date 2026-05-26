-- https://lua.expert/
local Black = script.Parent:WaitForChild("Black")
workspace.Main.FadeInBlack.Event:connect(function(p1) --[[ Line: 3 | Upvalues: Black (copy) ]]
	game:GetService("TweenService"):Create(Black, TweenInfo.new(p1), {
		BackgroundTransparency = 0
	}):Play()
end)
workspace.Main.FadeOutBlack.Event:connect(function(p1) --[[ Line: 7 | Upvalues: Black (copy) ]]
	game:GetService("TweenService"):Create(Black, TweenInfo.new(p1), {
		BackgroundTransparency = 1
	}):Play()
end)