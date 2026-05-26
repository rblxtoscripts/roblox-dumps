-- https://lua.expert/
local stringListContains = require(game.ReplicatedStorage.Library.Utility.stringListContains)
game:GetService("TweenService")
local v1 = game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId)
local effects = v1:WaitForChild("effects")
local activeeffects = v1:WaitForChild("activeeffects")
local v2 = script.Parent.Parent.Parent.Parent.Parent
local Effects = game.ReplicatedStorage.Configuration.Effects
local selected = script.Parent.Parent.selected
local t = {
	Appearance = 0,
	Halo = 3,
	["Glass Halo"] = 3,
	["Obrens Inferno"] = "4a",
	Crown = "4b",
	Label = 5,
	Ears = "7i",
	Tail = "7j",
	["Plastic Coil"] = "9d",
	["Coil Hat"] = "9f",
	["Coil Fusion"] = "AF",
	["Coil Gravity"] = "AG",
	["Coil Speed"] = "AS",
	Hook = "AU",
	Trowel = "AW",
	Hourglass = "AY",
	Radiance = "BC",
	Flames = "BF",
	Smoke = "BI",
	["Pride Trail"] = "CE",
	["Special Trail"] = "CI",
	["Solid Trail"] = "E",
	["Fading Trail"] = "F",
	["Wave Trail"] = "H",
	["TwoColor Trail"] = "J"
}
local function createEffectUI(p1) --[[ createEffectUI | Line: 39 | Upvalues: Effects (copy), v2 (copy), t (copy) ]]
	for k, v in pairs(script.Parent:GetChildren()) do
		if v:FindFirstChild("id") and v.id.Value == p1.Name then
			return
		end
	end
	local v1 = Effects.Rarities:FindFirstChild(p1.rarity.Value)
	local v22 = script.template:Clone()
	local v4 = (p1:FindFirstChild("group") or p1.type).Value
	local id = Instance.new("StringValue")
	id.Name = "id"
	id.Value = p1.Name
	id.Parent = v22
	v22.info.nametext.Text = p1.Name
	if p1:FindFirstChild("customName") then
		v22.info.nametext.Text = require(p1.customName)()
	end
	if p1:FindFirstChild("pic") then
		v22.info.ImageLabel.Image = p1.pic.Value
	end
	if p1:FindFirstChild("customPic") then
		for k, v in pairs(require(p1.customPic)()) do
			v.Parent = v22.info.ImageLabel
		end
	end
	if p1:FindFirstChild("group") and p1.group.Value == "Coil Fusion" then
		v22.info.requirement.icon.Image = game.ReplicatedStorage.Assets.Gear:FindFirstChild("fusion").Configuration.pic.Value
	elseif p1:FindFirstChild("group") and p1.group.Value == "Coil Speed" then
		v22.info.requirement.icon.Image = game.ReplicatedStorage.Assets.Gear:FindFirstChild("speed").Configuration.pic.Value
	elseif p1:FindFirstChild("group") and p1.group.Value == "Coil Gravity" then
		v22.info.requirement.icon.Image = game.ReplicatedStorage.Assets.Gear:FindFirstChild("gravity").Configuration.pic.Value
	elseif p1:FindFirstChild("group") and p1.group.Value == "Hourglass" then
		v22.info.requirement.icon.Image = game.ReplicatedStorage.Assets.Gear:FindFirstChild("hourglass").Configuration.pic.Value
	elseif p1:FindFirstChild("group") and p1.group.Value == "Trowel" then
		v22.info.requirement.icon.Image = game.ReplicatedStorage.Assets.Gear:FindFirstChild("trowel").Configuration.pic.Value
	elseif p1.type.Value == "Trail Tip" then
		v22.info.requirement.Position = UDim2.new(0.1, 0, 0.85, -16)
		v22.info.requirement.AnchorPoint = Vector2.new(0, 1)
		for k, v in pairs(require(game.ReplicatedStorage.Assets.Effects.Trail.customPic)()) do
			v.Parent = v22.info.requirement.icon
		end
	else
		v22.info.requirement.Visible = false
	end
	v22.info.owned.Changed:Connect(function() --[[ Line: 88 | Upvalues: v2 (ref), v22 (copy), t (ref), v4 (copy), p1 (copy), Effects (ref) ]]
		v2.Parent:WaitForChild("uiStyle"):WaitForChild("TextColor")
		v2.Parent.uiStyle:WaitForChild("DisabledTextColor")
		local v23 = if v22.info.owned.Value then "!" else ""
		v22.Name = v23 .. (t[v4] or v4) .. "/" .. p1.Name
		if v22.info.owned.Value then
			v22.LayoutOrder = v22.LayoutOrder - 1000000000
			v22.info.ImageLabel.ImageColor3 = Color3.new(255/255, 255/255, 255/255)
			for k, v in pairs(v22.info.ImageLabel:GetChildren()) do
				if v:IsA("ImageLabel") then
					v.ImageColor3 = v.BackgroundColor3
					continue
				end
				if v:IsA("TextLabel") then
					v.TextColor3 = v.BackgroundColor3
				end
			end
			v22.info.nametext.TextColor3 = v2.Parent.uiStyle.TextColor.Value
			v22.info.nametext.COLORtext.Value = "TextColor"
			v22.info.Frame.BackgroundColor3 = v22.info.Frame.BorderColor3
			v22.info.requirement.icon.ImageColor3 = Color3.new(255/255, 255/255, 255/255)
			v22.info.requirement.TextLabel.TextColor3 = v2.Parent.uiStyle.TextColor.Value
			v22.info.requirement.TextLabel.COLORtext.Value = "TextColor"
			for k, v in pairs(v22.info.requirement.icon:GetChildren()) do
				if v:IsA("ImageLabel") then
					v.ImageColor3 = v.BackgroundColor3
					continue
				end
				if v:IsA("TextLabel") then
					v.TextColor3 = v.BackgroundColor3
				end
			end
		else
			v22.LayoutOrder = v22.LayoutOrder + 1000000000
			v22.info.ImageLabel.ImageColor3 = Color3.new(51/255, 51/255, 51/255)
			for k, v in pairs(v22.info.ImageLabel:GetChildren()) do
				if v:IsA("ImageLabel") then
					v.ImageColor3 = Color3.new(v.BackgroundColor3.R * 0.2, v.BackgroundColor3.G * 0.2, v.BackgroundColor3.B * 0.2)
					continue
				end
				if v:IsA("TextLabel") then
					v.TextColor3 = Color3.new(v.BackgroundColor3.R * 0.2, v.BackgroundColor3.G * 0.2, v.BackgroundColor3.B * 0.2)
				end
			end
			v22.info.nametext.TextColor3 = v2.Parent.uiStyle.DisabledTextColor.Value
			v22.info.nametext.COLORtext.Value = "DisabledTextColor"
			v22.info.Frame.BackgroundColor3 = Color3.new(v22.info.Frame.BorderColor3.R * 0.6, v22.info.Frame.BorderColor3.G * 0.6, v22.info.Frame.BorderColor3.B * 0.6)
			v22.info.requirement.icon.ImageColor3 = Color3.new(51/255, 51/255, 51/255)
			v22.info.requirement.TextLabel.TextColor3 = v2.Parent.uiStyle.DisabledTextColor.Value
			v22.info.requirement.TextLabel.COLORtext.Value = "DisabledTextColor"
			for k, v in pairs(v22.info.requirement.icon:GetChildren()) do
				if v:IsA("ImageLabel") then
					v.ImageColor3 = Color3.new(v.BackgroundColor3.R * 0.2, v.BackgroundColor3.G * 0.2, v.BackgroundColor3.B * 0.2)
					continue
				end
				if v:IsA("TextLabel") then
					v.TextColor3 = Color3.new(v.BackgroundColor3.R * 0.2, v.BackgroundColor3.G * 0.2, v.BackgroundColor3.B * 0.2)
				end
			end
		end
		for k, v in pairs(Effects.Boxes:GetChildren()) do
			if v22.info.boxes:FindFirstChild(v.Name) then
				v22.info.boxes:FindFirstChild(v.Name).Visible = not v22.info.owned.Value and require(v.filter)(p1)
			end
		end
	end)
	v22.info.Frame.BorderColor3 = v1:FindFirstChild("color") and v1.color.Value or Color3.new(255/255, 255/255, 255/255)
	v22.info.owned.Value = false
	v22.Parent = script.Parent
	v22.InputBegan:Connect(function(p12) --[[ Line: 152 | Upvalues: p1 (copy) ]]
		if p12.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end
		game.ReplicatedStorage.Remotes.Cosmetics.activateEffect:InvokeServer(p1.Name)
	end)
	v22.TouchTap:Connect(function() --[[ Line: 157 | Upvalues: p1 (copy) ]]
		game.ReplicatedStorage.Remotes.Cosmetics.activateEffect:InvokeServer(p1.Name)
	end)
	return v22
end
local gridLayoutHelper = require(game.ReplicatedStorage.Library.Utility.gridLayoutHelper)
local function updateGridLayout() --[[ updateGridLayout | Line: 164 | Upvalues: gridLayoutHelper (copy) ]]
	gridLayoutHelper(script.Parent)
end
local function update() --[[ update | Line: 168 | Upvalues: stringListContains (copy), effects (copy), activeeffects (copy), createEffectUI (copy), gridLayoutHelper (copy) ]]
	for k, v in pairs(game.ReplicatedStorage.Assets.Effects:GetChildren()) do
		local v1 = stringListContains(effects.Value, v.Name)
		local v2 = stringListContains(activeeffects.Value, v.Name)
		local v3 = nil
		for k2, v4 in pairs(script.Parent:GetChildren()) do
			if v4:FindFirstChild("id") and v4.id.Value == v.Name then
				v3 = v4
				break
			end
		end
		if v:WaitForChild("rarity").Value < 9 or v1 then
			if not v3 then
				v3 = createEffectUI(v)
			end
			v3.info.equipped.Visible = v2
			v3.info.owned.Value = v1
			continue
		end
		if v3 then
			v3:Destroy()
		end
	end
	gridLayoutHelper(script.Parent)
	local v5 = (1 / 0)
	local v6 = nil
	for k, v in pairs(script.Parent:GetChildren()) do
		if v:IsA("TextButton") and (not v.NextSelectionUp and v.AbsolutePosition.X < v5) then
			v5 = v.AbsolutePosition.X
			v6 = v
		end
	end
	script.Parent.Parent.boxes.NextSelectionDown = v6
end
update()
effects.Changed:Connect(update)
activeeffects.Changed:Connect(update)
game.ReplicatedStorage.Assets.Effects.ChildAdded:Connect(update)
local v3 = nil
selected.Changed:Connect(function() --[[ Line: 210 | Upvalues: v3 (ref), selected (copy) ]]
	if v3 and v3.Parent == script.Parent then
		v3.info.xbox.Visible = false
	end
	if selected.Value.Parent ~= script.Parent then
		v3 = selected.Value
		return
	end
	selected.Value.info.xbox.Visible = selected.Value.info.owned.Value
	v3 = selected.Value
end)
game:GetService("UserInputService").InputBegan:Connect(function(p1) --[[ Line: 220 | Upvalues: v2 (copy), selected (copy) ]]
	local VRService = game:GetService("VRService")
	if VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
		return
	end
	if not v2.open.Value or v2.tab.Value ~= script.Parent.Parent then
		return
	end
	if p1.KeyCode ~= Enum.KeyCode.ButtonX or selected.Value.Parent ~= script.Parent then
		return
	end
	game.ReplicatedStorage.Remotes.Cosmetics.activateEffect:InvokeServer(selected.Value.id.Value)
end)