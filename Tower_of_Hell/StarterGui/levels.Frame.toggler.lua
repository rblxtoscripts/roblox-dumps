-- https://lua.expert/
local TweenService = game:GetService("TweenService")
function toggleSkills(p1, p2) --[[ toggleSkills | Line: 3 | Upvalues: TweenService (copy) ]]
	if p1 == nil then
		p1 = not script.Parent.Parent.skills.open.Value
	end
	script.Parent.Parent.skills.open.Value = p1
	if p1 then
		toggleXpBar(p1)
	end
	if p1 then
		script.Parent.Parent.skills.Visible = true
		if p2 then
			script.Parent.Parent.skills.selected.Value = script.Parent.Parent.skills.speed.speed1
		end
	end
	local skills = script.Parent.Parent.skills
	local v2 = TweenInfo.new(0.5)
	local t = {}
	t.Size = p1 and UDim2.new(0.6, 0, 0.4, 0) or UDim2.new(0, 0, 0, 0)
	local v4 = TweenService:Create(skills, v2, t)
	if not p1 then
		v4.Completed:Connect(function(p1) --[[ Line: 15 ]]
			if p1 ~= Enum.PlaybackState.Completed then
				return
			end
			script.Parent.Parent.skills.Visible = false
		end)
	end
	v4:Play()
end
function toggleXpBar(p1) --[[ toggleXpBar | Line: 24 | Upvalues: TweenService (copy) ]]
	if p1 == nil then
		p1 = not script.Parent.open.Value
	end
	script.Parent.open.Value = p1
	local v1 = if p1 then p1 else script.Parent.forceopen.Value
	if v1 then
		script.Parent.xpBar.Visible = true
	end
	local xpBar = script.Parent.xpBar
	local v3 = TweenInfo.new(0.5)
	local t = {}
	t.Size = UDim2.new(UDim.new(if v1 then 1 else 0, 0), script.Parent.xpBar.Size.Y)
	local v7 = TweenService:Create(xpBar, v3, t)
	if not v1 then
		v7.Completed:Connect(function(p1) --[[ Line: 31 ]]
			if p1 ~= Enum.PlaybackState.Completed then
				return
			end
			script.Parent.xpBar.Visible = false
		end)
	end
	v7:Play()
end
script.Parent.level.level.InputBegan:Connect(function(p1) --[[ Line: 40 ]]
	if p1.UserInputType == Enum.UserInputType.MouseMovement then
		toggleXpBar(true)
		return
	end
	if p1.UserInputType ~= Enum.UserInputType.MouseButton1 then
		return
	end
	toggleSkills()
end)
script.Parent.InputEnded:Connect(function(p1) --[[ Line: 47 ]]
	if p1.UserInputType ~= Enum.UserInputType.MouseMovement then
		return
	end
	toggleXpBar(false)
end)
script.Parent.level.level.TouchTap:Connect(function() --[[ Line: 52 ]]
	toggleXpBar()
	toggleSkills()
end)
game:GetService("UserInputService").InputBegan:Connect(function(p1) --[[ Line: 56 ]]
	local VRService = game:GetService("VRService")
	if VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
		return
	end
	if p1.KeyCode ~= Enum.KeyCode.ButtonY or script.Parent.Parent.Parent.shop2.open.Value then
		return
	end
	toggleSkills(nil, true)
end)
local controller = game.Players.LocalPlayer.PlayerGui:WaitForChild("shop2"):WaitForChild("controller")
controller.Changed:Connect(function() --[[ Line: 65 | Upvalues: TweenService (copy), controller (copy) ]]
	local xbox = script.Parent.level.xbox
	local v2 = TweenInfo.new(0.35)
	local t = {}
	t.Size = controller.Value and UDim2.new(0.6, 0, 0.6, 0) or UDim2.new(0, 0, 0, 0)
	TweenService:Create(xbox, v2, t):Play()
end)