-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local LocalPlayer = game.Players.LocalPlayer
local Boss = game.ReplicatedStorage.Remotes.Main.Boss
local BossHealth = game.ReplicatedStorage.Values.BossHealth
local Formatter = require(game.ReplicatedStorage.Libs.Formatter)
local BossBar = script.Parent.BossBar
local Size = BossBar.Size
local MaxPlacement = script.Parent.MaxPlacement
local Size_2 = MaxPlacement.Size
local v1 = 0
game.ReplicatedStorage.Remotes.Main.Modifiers.OnClientEvent:Connect(function() --[[ Line: 16 | Upvalues: BossBar (copy) ]]
	BossBar.Visible = false
end)
Boss.OnClientEvent:Connect(function(p1, p2) --[[ Line: 20 | Upvalues: BossBar (copy), Formatter (copy), v1 (ref), TweenService (copy), Size (copy) ]]
	if p2 == "Dead" then
		BossBar.Visible = false
	else
		local v12 = Formatter.FormatCompact(p2)
		v1 = Formatter.FormatToNumber(v12)
		BossBar.BossName.Text = p1
		BossBar.Main.TextLabel.Text = v12
		BossBar.Size = UDim2.new(0, 0, 0, 0)
		BossBar.Main.Move.Size = UDim2.new(1, 0, 1, 0)
		BossBar.Visible = true
		TweenService:Create(BossBar, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
			Size = Size
		}):Play()
	end
end)
BossHealth.Changed:Connect(function() --[[ Line: 39 | Upvalues: Formatter (copy), BossHealth (copy), v1 (ref), TweenService (copy), BossBar (copy) ]]
	local v12 = Formatter.FormatCompact(BossHealth.Value)
	local v2 = Formatter.FormatToNumber(v12) / v1
	TweenService:Create(BossBar.Main.Move, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		Size = UDim2.new(v2, 0, 1, 0)
	}):Play()
	BossBar.Main.TextLabel.Text = v12
	if not (tonumber(Formatter.FormatToNumber(v12)) <= 0) then
		return
	end
	BossBar.Visible = false
end)
local v2 = 0
game.ReplicatedStorage.Remotes.Misc.MaxPlacement.OnClientEvent:Connect(function(p1, p2) --[[ Line: 54 | Upvalues: v2 (ref), TweenService (copy), MaxPlacement (copy), Size_2 (copy) ]]
	local v1 = tick()
	v2 = v1
	TweenService:Create(MaxPlacement, TweenInfo.new(0.01, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		TextTransparency = 0
	}):Play()
	if p2 then
		MaxPlacement.Text = p2
	elseif p1 then
		MaxPlacement.Text = "You can only place " .. p1 .. " units!"
	else
		MaxPlacement.Text = "You can\'t place any more of this unit!"
	end
	MaxPlacement.TextTransparency = 0
	MaxPlacement.Size = UDim2.new(0, 0, 0, 0)
	MaxPlacement.Visible = true
	TweenService:Create(MaxPlacement, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		Size = Size_2
	}):Play()
	if v1 == v1 then
		task.wait(1)
		TweenService:Create(MaxPlacement, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			TextTransparency = 1
		}):Play()
	end
end)