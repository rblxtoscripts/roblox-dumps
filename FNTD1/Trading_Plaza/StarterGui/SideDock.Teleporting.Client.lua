-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local LocalPlayer = game.Players.LocalPlayer
local TPBack = game.ReplicatedStorage.Remotes.Misc.TPBack
local Lighting = require(game.ReplicatedStorage.Configs.Lighting)
local v1 = script.Parent
TPBack.OnClientEvent:Connect(function(p1) --[[ Line: 9 | Upvalues: v1 (copy), TweenService (copy), Lighting (copy) ]]
	v1.BackgroundTransparency = 1
	v1.Message.TextTransparency = 1
	v1.Visible = true
	local v12 = TweenService:Create(v1, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		BackgroundTransparency = 0
	})
	local v2 = TweenService:Create(v1.Message, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		TextTransparency = 0
	})
	v12:Play()
	v2:Play()
	task.wait(1)
	Lighting.Change(p1)
end)