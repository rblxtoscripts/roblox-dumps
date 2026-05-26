-- https://lua.expert/
game.Players.LocalPlayer:GetMouse()
local v1 = false
script.Parent.Activated:connect(function() --[[ Line: 3 | Upvalues: v1 (ref) ]]
	if v1 ~= true then
		game.Players.LocalPlayer.PlayerScripts.timefreeze.Value = not game.Players.LocalPlayer.PlayerScripts.timefreeze.Value
		wait()
		v1 = false
	end
end)
function deactivate() --[[ deactivate | Line: 12 ]]
	game.Players.LocalPlayer.PlayerScripts.timefreeze.Value = false
end
script.Parent.Unequipped:Connect(deactivate)
script.Parent.AncestryChanged:Connect(deactivate)
game.Players.LocalPlayer.PlayerScripts.timefreeze.Changed:Connect(function() --[[ Line: 17 ]]
	local timefreeze = game.Players.LocalPlayer.PlayerScripts.timefreeze.Value
	local v1 = game.Players.LocalPlayer.PlayerScripts.timefreeze.Value and script.Parent.base.ActiveWeld.C0 or script.Parent.base.InactiveWeld.C0
	game:GetService("TweenService"):Create(script.Parent.base.weld, TweenInfo.new(0.5), {
		C0 = v1
	}):Play()
	local TweenService = game:GetService("TweenService")
	local hourglassColor = game.Lighting.hourglassColor
	local v2 = TweenInfo.new(0.5)
	local t = {}
	t.Saturation = if timefreeze then -0.1 else 0
	t.TintColor = timefreeze and Color3.fromRGB(234, 249, 255) or Color3.new(255/255, 255/255, 255/255)
	TweenService:Create(hourglassColor, v2, t):Play()
end)