-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local v1 = require(game.ReplicatedStorage.Sonar)("Maid")
local t = {}
t.__index = t
function t.new(p1, p2) --[[ new | Line: 18 | Upvalues: t (copy), v1 (copy), TweenService (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Entity = p1
	v2.DamageInfo = p2
	v2.Gui = script.DamageGui:Clone()
	v2.Maid:GiveTask(v2.Gui)
	v2.Gui.Parent = p1
	local Damage = v2.Gui.ContainerFrame.Damage
	local UIStroke = Damage:FindFirstChild("UIStroke")
	if v2.DamageInfo.Amount then
		Damage.Text = v2.DamageInfo.Amount
		Damage.Visible = true
	end
	local TextSize = Damage.TextSize
	local v4 = math.rad((math.random(30, 150)))
	local v5 = math.cos(v4) * 100
	local v6 = math.sin(v4) * 100
	local v7 = TweenService:Create(Damage, TweenInfo.new(0.1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		TextSize = TextSize * 1.5,
		TextColor3 = Color3.fromRGB(255, 0, 0)
	})
	if UIStroke then
		local v8 = TweenService:Create(UIStroke, TweenInfo.new(0.1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			Transparency = 0
		})
		v2.Maid:GiveTask(v8)
		v8:Play()
	end
	local v9 = TweenService:Create(Damage, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Position = UDim2.new(0.5, v5, 0, -v6),
		TextColor3 = Color3.fromRGB(255, 255, 255)
	})
	local v10 = TweenService:Create(Damage, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
		TextTransparency = 1,
		Position = UDim2.new(0.5, v5 * 1.5, 0, 50),
		TextSize = TextSize * 1.2
	})
	if UIStroke then
		local v11 = TweenService:Create(UIStroke, TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			Transparency = 1
		})
		v2.Maid:GiveTask(v11)
		v11:Play()
	end
	v7.Completed:Connect(function() --[[ Line: 103 | Upvalues: v9 (copy) ]]
		v9:Play()
	end)
	v9.Completed:Connect(function() --[[ Line: 107 | Upvalues: v10 (copy) ]]
		v10:Play()
	end)
	v2.Maid:GiveTask(v7)
	v2.Maid:GiveTask(v9)
	v2.Maid:GiveTask(v10)
	v7:Play()
	v10.Completed:Connect(function() --[[ Line: 118 | Upvalues: v2 (copy) ]]
		v2:Destroy()
	end)
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 125 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
return t