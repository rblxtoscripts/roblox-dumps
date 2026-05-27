-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RadialMenu")
local v2 = Sonar("Maid")
local v3 = Sonar("GuiManager")
local v4 = Sonar("GuiUtils")
local v5 = Sonar("InputTypeDetector")
local v6 = Sonar("Animal")
local v7 = Sonar("CharacterControls")
local v8 = Sonar("NotificationsClient")
local v9 = Sonar("MoveToCommand")
local v10 = Sonar("UINavigator")
local v11 = Sonar("TutorialService")
local v12 = Sonar("PlaceTypeService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v13 = Sonar("PlayerWrapper").GetClient()
local RadialFrame = LocalPlayer.PlayerGui:WaitForChild("HUDGui"):WaitForChild("RadialFrame")
local t2 = {}
local v14 = v2.new()
local v15 = tick()
local function focusMenu(p1) --[[ focusMenu | Line: 36 | Upvalues: t2 (ref), v5 (copy) ]]
	for k, v in pairs(t2) do
		v.Radial.Frame.Visible = v == p1
		v.Radial.Enabled = if v == p1 then true else false
	end
	if not v5.IsMobileInputType() then
		p1.Radial:SetDialProps({
			ImageTransparency = 0,
			ImageColor3 = Color3.fromRGB(97, 73, 151)
		})
	end
	p1.Radial:SetRadialPropRotation("1")
end
local t3 = {
	Horse = {
		{
			Name = "Emotes",
			Image = "rbxassetid://16538222739",
			Color = Color3.fromHex("9bfeff"),
			InputBegan = function(p1) --[[ InputBegan | Line: 57 | Upvalues: focusMenu (copy), t2 (ref) ]]
				focusMenu(t2.Emotes)
				return true
			end
		},
		{
			Name = "Wild Mode",
			Image = "rbxassetid://16727873125",
			Color = Color3.fromRGB(255, 170, 127),
			NameLabelSize = UDim2.new(1.35, 0, 0.8, 0),
			Inputs = {
				Keyboard = Enum.KeyCode.B
			},
			InputBegan = function(p1) --[[ InputBegan | Line: 70 | Upvalues: v4 (copy), v13 (copy) ]]
				if v4.GetGameState("Lassoing") then
					return
				end
				local v1 = v13:GetCurrentAnimal()
				if not v1 then
					return
				end
				v1:SetWildMode(not v1.WildMode)
			end
		}
	},
	Emotes = {
		{
			Name = "Short Buck",
			Image = "rbxassetid://16538291199",
			Color = Color3.fromHex("9bfeff"),
			NameLabelSize = UDim2.new(1.35, 0, 0.8, 0),
			Inputs = {},
			InputBegan = function(p1) --[[ InputBegan | Line: 91 | Upvalues: v13 (copy) ]]
				local v1 = v13:GetCurrentAnimal()
				if not v1 then
					return
				end
				if not p1._ragdoll then
					v1:SetState("ShortBuck")
				end
			end
		},
		{
			Name = "Jump Buck",
			Image = "rbxassetid://16538294968",
			Color = Color3.fromHex("9bfeff"),
			NameLabelSize = UDim2.new(1.35, 0, 0.8, 0),
			Inputs = {
				Keyboard = Enum.KeyCode.R
			},
			InputBegan = function(p1) --[[ InputBegan | Line: 110 | Upvalues: v4 (copy), v11 (copy), v8 (copy), v13 (copy) ]]
				if v4.GetGameState("Lassoing") then
					return
				end
				if not v11.HasCompletedPrimaryTutorial(p1) then
					v8.Notify({
						Message = "You must complete the tutorial to do this action!",
						Preset = "Red"
					})
					return
				end
				local v1 = v13:GetCurrentAnimal()
				if not v1 then
					return
				end
				if p1._ragdoll then
					return
				end
				if not v13:IsInAction("Race") then
					v1:SetState("JumpBuck")
				end
			end
		},
		{
			Name = "Rear",
			Image = "rbxassetid://16538222739",
			Color = Color3.fromHex("9bfeff"),
			Inputs = {
				Keyboard = Enum.KeyCode.V
			},
			InputBegan = function(p1) --[[ InputBegan | Line: 144 | Upvalues: v13 (copy), v8 (copy) ]]
				if v13:IsInAction("Race") then
					return
				end
				local v1 = v13:GetCurrentAnimal()
				if v1 and not v1.IsMoving then
					task.spawn(function() --[[ Line: 150 | Upvalues: v1 (copy) ]]
						v1:Rear()
					end)
					return
				end
				if not v1 then
					return
				end
				v8.Notify({
					Message = "You cannot do that while moving!",
					Type = "RearMoving"
				})
			end
		}
	},
	Player = {}
}
local t4 = {}
local t5 = {
	Name = "Move To",
	Image = "rbxassetid://16538297052",
	Color = Color3.fromHex("ffe375"),
	InputBegan = function() --[[ InputBegan | Line: 169 | Upvalues: v9 (copy), v6 (copy) ]]
		v9:Start(function(p1) --[[ Line: 170 | Upvalues: v6 (ref) ]]
			return v6:ChangeCommand("MoveTo", p1)
		end)
	end
}
local t6 = {
	Name = "Stay Here",
	Image = "rbxassetid://16538298616",
	Color = Color3.fromHex("d2b5ff"),
	InputBegan = function() --[[ InputBegan | Line: 179 | Upvalues: v6 (copy) ]]
		v6:ChangeCommand("Stay")
	end
}
local t7 = {
	Name = "Follow",
	Image = "rbxassetid://16538288591",
	Color = Color3.fromHex("ff878f"),
	Inputs = {
		Keyboard = Enum.KeyCode.Z
	},
	InputBegan = function() --[[ InputBegan | Line: 190 | Upvalues: v6 (copy) ]]
		v6:ChangeCommand()
	end
}
local v16 = if v12.IsMarketWorld() then nil else {
	Name = "Map",
	Image = "rbxassetid://18149176225",
	Color = Color3.fromRGB(255, 255, 255),
	Inputs = {
		Keyboard = Enum.KeyCode.M
	},
	InputBegan = function() --[[ InputBegan | Line: 201 | Upvalues: v4 (copy), Sonar (copy) ]]
		if not v4.GetGameState("Lassoing") then
			Sonar("MapGui").Open()
		end
	end
} or nil
t4[1] = t5
t4[2] = t6
t4[3] = t7
t4[4] = v16
t3.Shared = t4
local function getActionsFromType(p1, p2) --[[ getActionsFromType | Line: 212 | Upvalues: t3 (copy) ]]
	local t = {}
	for v1, v2 in next, t3 do
		if p2 or v1 ~= "Shared" then
			if v1 == p1 then
				for v3, v4 in next, v2 do
					if not v4.Check or v4.Check() then
						t[#t + 1] = v4
					end
				end
			end
		else
			for v3, v4 in next, v2 do
				if not v4.Check or v4.Check() then
					t[#t + 1] = v4
				end
			end
		end
	end
	return t
end
local function createMenu(p1, p2) --[[ createMenu | Line: 231 | Upvalues: getActionsFromType (copy), v1 (copy), v14 (copy), v15 (ref), ReplicatedStorage (copy), v13 (copy), t (copy), TweenService (copy), v5 (copy), RadialFrame (copy), t2 (ref) ]]
	local v12 = getActionsFromType(p1, p2)
	local v2 = v1.new(#v12, 0.5, 0, UDim2.new(1.5, 0, 1.5, 0))
	v2.Enabled = false
	v14:GiveTask(v2._ClickedBind.Event:Connect(function(p1) --[[ Line: 236 | Upvalues: v2 (copy), v15 (ref), v12 (copy), ReplicatedStorage (ref), v13 (ref), t (ref) ]]
		if not v2.Enabled then
			return
		end
		if tick() - v15 < 0.35 then
			return
		end
		v15 = tick()
		local v1 = v12[p1]
		if not v1 then
			return
		end
		ReplicatedStorage.Storage.SFX.ClickSound:Play()
		if v1.InputBegan(v13) then
			return
		end
		task.defer(t.Close)
	end))
	local v3 = script.NameLabel:Clone()
	v3.Parent = v2.Frame
	v2:SetInputSinkButton()
	v2:SetRadialProps({
		ImageTransparency = 1
	})
	local t3 = {}
	v14:GiveTask(v2._HoverBind.Event:Connect(function(p1, p2) --[[ Line: 263 | Upvalues: v2 (copy), v12 (copy), v3 (copy), t3 (copy), TweenService (ref), ReplicatedStorage (ref) ]]
		if not v2.Frame.Visible then
			return
		end
		local v1 = v12[p2]
		if not v1 then
			v3.Visible = false
			v2:SetDialProps({
				ImageTransparency = 1
			})
			return
		end
		v3.Text = v1.Name
		v3.Visible = true
		v2:SetDialProps({
			ImageTransparency = 0,
			ImageColor3 = Color3.fromRGB(97, 73, 151)
		})
		for k, v in pairs(v12) do
			t3[k].ImageLabel.ImageColor3 = k == p2 and Color3.fromHex("7dffad") or v.Color
			if k == p2 then
				t3[k].UIScale.Scale = 1.5
				TweenService:Create(t3[k].UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
					Scale = 1.1
				}):Play()
				ReplicatedStorage.Storage.SFX.HoverSound:Play()
				continue
			end
			TweenService:Create(t3[k].UIScale, TweenInfo.new(0), {
				Scale = 1
			}):Play()
		end
	end))
	v3.Visible = false
	for v4, v52 in next, v12 do
		local ImageLabel = Instance.new("ImageLabel")
		ImageLabel.Image = ""
		ImageLabel.Name = v52.Name
		ImageLabel.BackgroundTransparency = 1
		ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
		local ImageLabel_2 = Instance.new("ImageLabel")
		ImageLabel_2.Image = v52.Image
		ImageLabel_2.BackgroundTransparency = 1
		ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
		ImageLabel_2.Position = UDim2.new(0.5, 0, 0.5, 0)
		ImageLabel_2.Size = UDim2.new(1, 0, 1, 0)
		ImageLabel_2.Parent = ImageLabel
		local v6 = script.DescriptionLabel:Clone()
		v6.Text = v52.Name
		v6.Visible = true
		v6.Size = v52.NameLabelSize or UDim2.new(1.25, 0, 0.6, 0)
		v6.Parent = ImageLabel
		local Background = script.BackgroundFrame:Clone()
		Background.Name = "Background"
		Background.Size = UDim2.new(1.5, 0, 1.5, 0)
		Background.Parent = v2:GetAttachment(v4)
		if v52.Inputs and v52.Inputs.Keyboard then
			local v8 = script.Keybind:Clone()
			v8:SetAttribute("KeyCode", v52.Inputs.Keyboard.Name)
			v8:AddTag("KeyboardControlLabel")
			v8.Parent = v2:GetAttachment(v4)
		end
		local UIScale = Instance.new("UIScale")
		UIScale.Scale = 1
		UIScale.Parent = ImageLabel
		ImageLabel.Size = v5.IsMobileInputType() and UDim2.new(1.1, 0, 1.1, 0) or UDim2.new(1, 0, 1, 0)
		ImageLabel.Parent = v2:GetAttachment(v4)
		v52.UIScale = UIScale
		t3[v4] = {
			UIScale = UIScale,
			ImageLabel = ImageLabel_2
		}
		v12[v4] = v52
	end
	v2.Frame.Parent = RadialFrame
	v14:GiveTask(v2)
	t2[p1] = {
		Radial = v2,
		Actions = v12,
		Labels = t3
	}
	return v2
end
function t.Create(p1) --[[ Create | Line: 362 | Upvalues: v14 (copy), t2 (ref), createMenu (copy), RadialFrame (copy), v5 (copy) ]]
	v14:DoCleaning()
	t2 = {}
	createMenu("Horse")
	createMenu("Player")
	createMenu("Emotes", true)
	RadialFrame.MobileLabel.Visible = v5.IsMobileInputType()
end
function t.Open() --[[ Open | Line: 373 | Upvalues: v3 (copy), RadialFrame (copy) ]]
	v3.OpenHUD()
	v3.OpenFrame(RadialFrame)
end
function t.Close() --[[ Close | Line: 378 | Upvalues: v3 (copy), RadialFrame (copy) ]]
	v3.CloseFrame(RadialFrame)
end
function t.IsOpen() --[[ IsOpen | Line: 383 | Upvalues: v3 (copy), RadialFrame (copy) ]]
	return v3.IsFrameOpen(RadialFrame)
end
function t.Init(p1) --[[ Init | Line: 387 | Upvalues: v3 (copy), RadialFrame (copy), t2 (ref), TweenService (copy), v5 (copy), v10 (copy), focusMenu (copy), v13 (copy), t3 (copy), v7 (copy), v11 (copy), t (copy) ]]
	v3.AddFrame(RadialFrame, {
		KeepPosition = true,
		ShortcutToClose = true
	})
	v3.AddStateCallback(RadialFrame, "OnOpen", function() --[[ Line: 393 | Upvalues: RadialFrame (ref), t2 (ref), TweenService (ref), v5 (ref), v10 (ref), focusMenu (ref), v13 (ref) ]]
		RadialFrame.Modal = true
		for k, v in pairs(t2) do
			v.Radial._LastHoverIndex = nil
			v.Radial.Frame.NameLabel.Visible = false
			for k2, v2 in pairs(v.Labels) do
				v2.ImageLabel.ImageColor3 = v.Actions[k2].Color
				TweenService:Create(v2.UIScale, TweenInfo.new(0), {
					Scale = 1
				}):Play()
			end
			if v5.IsMobileInputType() then
				v.Radial:SetDialProps({
					ImageTransparency = 1,
					ImageColor3 = Color3.new(255/255, 255/255, 255/255)
				})
			end
		end
		v10.ResetGamepadSelection()
		_G.StopThumbstick = true
		focusMenu(v13:GetCurrentAnimal() and t2.Horse or t2.Player)
	end)
	v3.AddStateCallback(RadialFrame, "OnClose", function() --[[ Line: 419 | Upvalues: RadialFrame (ref), v10 (ref), t2 (ref) ]]
		RadialFrame.Modal = false
		v10.ResetSelectionToTargetFrame()
		_G.StopThumbstick = false
		for k, v in pairs(t2) do
			v.Radial.Frame.Visible = false
			v.Radial.Enabled = false
		end
	end)
	for k, v in pairs(t3) do
		for k2, v2 in pairs(v) do
			if v2.Inputs then
				v7:AddControls(k .. k2, v2.Inputs, v2, function() --[[ Line: 433 | Upvalues: v11 (ref), v3 (ref), v10 (ref) ]]
					if not v11.GetGameState("ActionMenu") then
						return
					end
					if v3.IsHUDOpen() and v10.CanNavigateHUD() then
						return true
					end
				end)
			end
		end
	end
	v13:GetSignal("WildCutsceneMode"):Connect(function() --[[ Line: 442 | Upvalues: v13 (ref), v3 (ref), RadialFrame (ref), t (ref) ]]
		if not v13.WildCutsceneMode then
			return
		end
		if not v3.IsFrameOpen(RadialFrame) then
			return
		end
		t.Close()
	end)
	v13.CurrentAnimalChangedSignal:Connect(function() --[[ Line: 451 | Upvalues: v3 (ref), RadialFrame (ref), t (ref) ]]
		if not v3.IsFrameOpen(RadialFrame) then
			return
		end
		t.Close()
	end)
end
t:Init()
return t