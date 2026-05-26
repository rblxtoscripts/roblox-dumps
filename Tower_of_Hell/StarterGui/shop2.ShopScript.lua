-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
function toggle(p1) --[[ toggle | Line: 4 ]]
	if p1 == nil then
		p1 = not script.Parent.open.Value
	end
	script.Parent.open.Value = p1
end
script.Parent.open.Changed:Connect(function() --[[ Line: 8 | Upvalues: TweenService (copy) ]]
	local shop = script.Parent.shop
	local v2 = TweenInfo.new(0.5, Enum.EasingStyle.Bounce)
	local t = {}
	local v3 = Vector2.new
	t.AnchorPoint = v3(if script.Parent.open.Value then 0 else 1, 1)
	t.Position = UDim2.new(0, 0, 1, 0)
	TweenService:Create(shop, v2, t):Play()
end)
script.Parent.shop.yxle.InputBegan:connect(function(p1) --[[ Line: 13 ]]
	if p1.UserInputType ~= Enum.UserInputType.MouseButton1 then
		return
	end
	toggle()
end)
script.Parent.shop.yxle.TouchTap:Connect(function() --[[ Line: 18 ]]
	toggle()
end)
function enableTab(p1) --[[ enableTab | Line: 22 | Upvalues: TweenService (copy) ]]
	if p1 == nil then
		return
	end
	for k, v in pairs(script.Parent.shop.items:GetChildren()) do
		if v:IsA("GuiBase") then
			TweenService:Create(v, TweenInfo.new(0.5), {
				Position = UDim2.new(v.LayoutOrder - p1.LayoutOrder)
			}):Play()
			if v.Name == p1.Name then
				script.Parent.tab.Value = v
			end
		end
	end
end
script.Parent.enableTab.OnInvoke = enableTab
for k, v in pairs(script.Parent.shop.tabs:GetChildren()) do
	if v:IsA("GuiBase2d") then
		v.InputBegan:connect(function(p1) --[[ Line: 36 | Upvalues: v (copy) ]]
			if p1.UserInputType ~= Enum.UserInputType.MouseButton1 then
				return
			end
			enableTab(v)
		end)
		v.TouchTap:Connect(function() --[[ Line: 41 | Upvalues: v (copy) ]]
			enableTab(v)
		end)
	end
end
UserInputService.InputBegan:connect(function(p1, p2) --[[ Line: 47 ]]
	local VRService = game:GetService("VRService")
	if VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
		return
	end
	if p1.KeyCode == Enum.KeyCode.ButtonSelect then
		return
	end
	if script.Parent.open.Value and p1.KeyCode == Enum.KeyCode.ButtonL2 then
		enableTab(script.Parent.tab.Value.NextSelectionLeft)
		return
	end
	if not script.Parent.open.Value or p1.KeyCode ~= Enum.KeyCode.ButtonR2 then
		return
	end
	enableTab(script.Parent.tab.Value.NextSelectionRight)
end)
script.Parent.controller.Changed:Connect(function() --[[ Line: 62 | Upvalues: TweenService (copy) ]]
	local controller = script.Parent.controller.Value
	local tbl = {}
	local xbox = script.Parent.shop.yxle.xbox
	local v2 = TweenInfo.new(0.5)
	local t = {}
	t.Size = UDim2.new(if controller then 0.5 else 0, 0, if controller then 0.5 else 0, 0)
	local v7 = TweenService:Create(xbox, v2, t)
	local xboxLeftTab = script.Parent.shop.xboxLeftTab
	local v9 = TweenInfo.new(0.5)
	local t2 = {}
	t2.Size = UDim2.new(if controller then 0.1 else 0, 0, if controller then 0.1 else 0, 0)
	local v14 = TweenService:Create(xboxLeftTab, v9, t2)
	local xboxRightTab = script.Parent.shop.xboxRightTab
	local v16 = TweenInfo.new(0.5)
	local t3 = {}
	t3.Size = UDim2.new(if controller then 0.1 else 0, 0, if controller then 0.1 else 0, 0)
	tbl[1] = v7
	tbl[2] = v14
	tbl[3] = TweenService:Create(xboxRightTab, v16, t3)
	if controller then
		for k, v in pairs(tbl) do
			v.Instance.Visible = true
		end
	end
	if not controller then
		for k, v in pairs(tbl) do
			v.Completed:connect(function(p1) --[[ Line: 76 | Upvalues: v (copy) ]]
				if p1 ~= Enum.PlaybackState.Completed then
					return
				end
				v.Instance.Visible = false
			end)
		end
	end
	for k, v in pairs(tbl) do
		v:Play()
	end
end)
game:GetService("ContextActionService"):BindActionAtPriority("open_" .. script.Parent.Name, function(p1, p2, p3) --[[ Line: 88 ]]
	if p2 ~= Enum.UserInputState.End then
		return
	end
	local VRService = game:GetService("VRService")
	if not (VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand)) then
		toggle()
	end
end, false, 34000, Enum.KeyCode.ButtonSelect)