-- https://lua.expert/
local v1 = script.Parent
local _ = v1.Parent
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local v2 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local Level = require(game.ReplicatedStorage:WaitForChild("Level"))
local CheckboxGroup = require(game.ReplicatedStorage:WaitForChild("CheckboxGroup"))
local UIParticleEmitter = require(game.ReplicatedStorage.UIParticleEmitter)
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v3 = Library:Load("Utility")
local v4 = Library:Load("Events")
local v5 = Library:Load("Queue")
local v6 = Library:Load("SoundFX")
local v7 = Library:Load("Network")
local v8 = Library:Load("Tween")
local PetPanel = MainGui:WaitForChild("Menu"):WaitForChild("Menu"):WaitForChild("PetPanel")
MainGui:WaitForChild("Menu"):WaitForChild("Pet"):WaitForChild("PetMouseIcon")
local GamepadPetHand = MainGui.Menu:WaitForChild("GamepadPetHand")
local Buttons = v1:WaitForChild("Buttons")
local PettingBar = v1.Parent:WaitForChild("PettingBar")
MainGui:WaitForChild("Notifications"):WaitForChild("Hint")
local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local CurrentCamera = workspace.CurrentCamera
local v9 = LocalPlayer:GetMouse()
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local v10 = GuiManager:RegisterWindow(v1, "Top", "Top")
GuiManager:GetWindowDataByName("Backpack")
require(game.ReplicatedStorage:WaitForChild("Dialog"))
local PetStats = PlayerGui:WaitForChild("GuiTop"):WaitForChild("PetStats")
local v11 = GuiManager:RegisterWindow(PetStats, "Bottom", "Bottom")
local PetList = PlayerGui:WaitForChild("GuiTop"):WaitForChild("PetList")
local v12 = GuiManager:RegisterWindow(PetList, "Bottom", "Bottom")
local PetHats = PlayerGui:WaitForChild("GuiTop"):WaitForChild("PetHats")
local v13 = GuiManager:RegisterWindow(PetHats)
local PetDaycare = PlayerGui:WaitForChild("GuiTop"):WaitForChild("PetDaycare")
local v14 = GuiManager:RegisterWindow(PetDaycare)
local v15 = CheckboxGroup.new()
local SetName = PetStats:WaitForChild("Title"):WaitForChild("SetName")
v10.FirstSelectedObject = Buttons:WaitForChild("Pets")
v13.FirstSelectedObject = PetHats:WaitForChild("List"):WaitForChild("No Hat")
v14.UseCursor = true
if not _G.StartedPlaying then
	v4:Wait("StartedPlaying")
end
local Fetch = Buttons:WaitForChild("Fetch")
local Pepperoni = Buttons:WaitForChild("Pepperoni")
local Sausage = Buttons:WaitForChild("Sausage")
local Cheese = Buttons:WaitForChild("Cheese")
local Medicine = Buttons:WaitForChild("Medicine")
local Pet = Buttons:WaitForChild("Pet")
local Hold = Buttons:WaitForChild("Hold")
local Throw = Buttons:WaitForChild("Throw")
local Stay = Buttons:WaitForChild("Stay")
local Hats = Buttons:WaitForChild("Hats")
local Stats = Buttons:WaitForChild("Stats")
local Pets = Buttons:WaitForChild("Pets")
local ScrollingFrame = PetStats:WaitForChild("List"):WaitForChild("ScrollingFrame")
local Bar = ScrollingFrame:WaitForChild("LevelBar"):WaitForChild("Bar")
local Progress = Bar:WaitForChild("Progress")
local Level_2 = Bar:WaitForChild("Level")
local XP = Bar:WaitForChild("XP")
local Bar_2 = v1.Parent:WaitForChild("LevelBar"):WaitForChild("Bar")
local Progress_2 = Bar_2:WaitForChild("Progress")
local Level_3 = Bar_2:WaitForChild("Level")
local XP_2 = Bar_2:WaitForChild("XP")
local XPDisplay = Bar_2:WaitForChild("XPDisplay")
local XP_3 = XPDisplay:WaitForChild("XP")
local Progress_3 = ScrollingFrame:WaitForChild("Happiness"):WaitForChild("Happiness"):WaitForChild("ProgressBar"):WaitForChild("Progress")
local Progress_4 = v1:WaitForChild("DeathMeter"):WaitForChild("ProgressBar"):WaitForChild("Progress")
local Info = ScrollingFrame:WaitForChild("Info")
local TextLabel = Info:WaitForChild("Ability"):WaitForChild("TextLabel")
local Icon = Info:WaitForChild("Ability"):WaitForChild("Icon")
local TextLabel_2 = Info:WaitForChild("AbilityInfo"):WaitForChild("TextLabel")
local TextLabel_3 = Info:WaitForChild("Age"):WaitForChild("TextLabel")
local TextLabel_4 = Info:WaitForChild("Birthday"):WaitForChild("TextLabel")
local TextLabel_5 = Info:WaitForChild("Gender"):WaitForChild("TextLabel")
local TextLabel_6 = Info:WaitForChild("Mood"):WaitForChild("TextLabel")
local TextLabel_7 = Info:WaitForChild("Personality"):WaitForChild("TextLabel")
local TextLabel_8 = Info:WaitForChild("EyeColor"):WaitForChild("TextLabel")
local TextLabel_9 = Info:WaitForChild("Type"):WaitForChild("TextLabel")
local ImageLabel = Info:WaitForChild("FavoriteFood"):WaitForChild("ImageLabel")
local UnknownAbility = TextLabel.Parent:WaitForChild("UnknownAbility")
local UnknownFavoriteFood = ImageLabel.Parent:WaitForChild("UnknownFavoriteFood")
local UnknownEyeColor = TextLabel_8.Parent:WaitForChild("UnknownEyeColor")
local DaycareTemplate2 = PetDaycare:WaitForChild("List"):WaitForChild("ScrollingFrame"):WaitForChild("DaycareTemplate2")
local ScrollingFrame_2 = PetList:WaitForChild("List"):WaitForChild("ScrollingFrame")
local DaycareList = ScrollingFrame_2:WaitForChild("DaycareList")
local Slots = ScrollingFrame_2:WaitForChild("Slots")
local Template = Slots:WaitForChild("Template")
local LockTemplate = Slots:WaitForChild("LockTemplate")
local EmptyTemplate = Slots:WaitForChild("EmptyTemplate")
local DaycareTemplate = DaycareList:WaitForChild("DaycareTemplate")
LockTemplate.Visible = false
DaycareTemplate.Visible = false
DaycareTemplate2.Visible = false
EmptyTemplate.Visible = false
Template.Visible = false
XP_3.Visible = false
Throw.Visible = false
Bar_2.Visible = false
local v16 = nil
local t = {}
local t2 = {}
local v17 = false
local v18 = false
local v19 = false
local v20 = false
local v21 = false
function ShowHide() --[[ ShowHide | Line: 167 | Upvalues: UIEvents (copy), PetPanel (copy) ]]
	UIEvents.TopbarButtonPressed:Fire(PetPanel)
end
Progress_4.Parent.Parent.Visible = false
local v22 = v5.new()
local TweenService = game:GetService("TweenService")
local v23 = game:GetService("TweenService"):Create(Bar_2, TweenInfo.new(0.05, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
	Rotation = -2
})
local v24 = game:GetService("TweenService"):Create(Bar_2, TweenInfo.new(0.05, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
	Rotation = 2
})
local v25 = 0
local t3 = {}
function ShowLevelUpAnimation(p1, p2) --[[ ShowLevelUpAnimation | Line: 181 | Upvalues: v25 (ref), Bar_2 (copy), v21 (ref), XP_3 (copy), v2 (copy), XPDisplay (copy), t3 (ref), v22 (copy), Level (copy), Progress_2 (copy), Level_3 (copy), v16 (ref), XP_2 (copy), v1 (copy), TweenService (copy), v3 (copy), v6 (copy), v23 (copy), v24 (copy), v7 (copy) ]]
	v25 = v25 + 1
	Bar_2.Visible = true
	v21 = true
	task.wait(0.1)
	local v12 = XP_3:Clone()
	v12.Text = "+" .. p2
	v12.Visible = true
	v12.TextColor3 = p2 <= 5 and Color3.fromRGB(254, 239, 212) or (p2 <= 10 and v2.CapsuleTypeToColor.Common or (p2 <= 20 and v2.CapsuleTypeToColor.Uncommon or (p2 <= 30 and v2.CapsuleTypeToColor.Rare or (p2 <= 45 and v2.CapsuleTypeToColor.Legendary or v2.CapsuleTypeToColor.Mythic))))
	v12.Parent = XPDisplay
	table.insert(t3, v12)
	task.wait(0.4)
	v22:Wait(40)
	v21 = true
	Level:GetLevelFromExperience(p1)
	local v4, v5, v62 = Level:GetSubExperience(p1)
	local v72 = v5 <= v4 + p2
	Progress_2.Size = UDim2.new(v62, 0, 1, 0)
	Level_3.Text = "Level " .. v16.Level
	XP_2.Text = "XP " .. v4 .. "/" .. v5
	v1.XPTween.Value = v4
	local v8 = v1.XPTween:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 211 | Upvalues: XP_2 (ref), v1 (ref), v5 (copy) ]]
		XP_2.Text = "XP " .. math.floor(v1.XPTween.Value) .. "/" .. v5
	end)
	local v9 = TweenInfo.new(p2 / 15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
	TweenService:Create(Progress_2, v9, {
		Size = UDim2.new(v3:Clamp(v4 + p2, 0, v5) / v5, 0, 1, 0)
	}):Play()
	local v10 = TweenService:Create(v1.XPTween, v9, {
		Value = v3:Clamp(v4 + p2, 0, v5)
	})
	v10.Completed:Connect(function() --[[ Line: 221 | Upvalues: v8 (ref), v72 (copy), v6 (ref), v23 (ref), v24 (ref), v7 (ref), Bar_2 (ref) ]]
		v8:Disconnect()
		if not v72 then
			return
		end
		v6:PlaySound("LevelUp")
		for i = 1, 10 do
			for j = 1, 2 do
				if j == 1 then
					v23:Play()
					v23.Completed:Wait()
					continue
				end
				if j == 2 then
					v24:Play()
					v24.Completed:Wait()
				end
			end
		end
		v7:FireServer("RevealPetTrait")
		Bar_2.Rotation = 0
	end)
	v10:Play()
	v10.Completed:Wait()
	v21 = false
	v25 = v25 - 1
	if v72 then
		task.wait(4)
		Refresh()
	end
	v22:Next()
	task.wait(2)
	if not (v25 <= 0) then
		return
	end
	for i, v in ipairs(t3) do
		v:Destroy()
	end
	t3 = {}
	if v1.Visible then
		return
	end
	Bar_2.Visible = false
end
local t4 = {
	Sick = {
		Dark = Color3.fromRGB(90, 85, 20),
		Light = Color3.fromRGB(157, 145, 10)
	},
	Death = {
		Dark = Color3.fromRGB(38, 36, 32),
		Light = Color3.fromRGB(35, 41, 44)
	}
}
local t5 = {}
local t6 = { "\240\159\152\162", "\240\159\152\149", "\240\159\153\129", "\240\159\152\144", "\240\159\153\130\239\184\143", "\226\152\186\239\184\143", "\240\159\165\176" }
local t7 = {
	Male = "\226\153\130\239\184\143",
	Female = "\226\153\128\239\184\143"
}
for i, v in ipairs(game:GetService("CollectionService"):GetTagged("Light")) do
	t5[v] = v.BackgroundColor3
end
for i, v in ipairs(game:GetService("CollectionService"):GetTagged("Dark")) do
	t5[v] = v.BackgroundColor3
end
function SetColorPallet(p1) --[[ SetColorPallet | Line: 302 | Upvalues: t4 (copy), t5 (copy) ]]
	local v1 = t4[p1]
	if p1 == "Normal" then
		for k, v in pairs(t5) do
			k.BackgroundColor3 = v
		end
	else
		for i, v in ipairs(game:GetService("CollectionService"):GetTagged("Light")) do
			v.BackgroundColor3 = v1.Light
		end
		for i, v in ipairs(game:GetService("CollectionService"):GetTagged("Dark")) do
			v.BackgroundColor3 = v1.Dark
		end
	end
end
function StartPetCutscene(p1) --[[ StartPetCutscene | Line: 319 | Upvalues: v16 (ref), v6 (copy), CurrentCamera (copy), v8 (copy) ]]
	local Object = v16.Object
	local v1 = v6:GetSoundObject("HouseUpgrade")
	local CurrentCorrection = game.Lighting.CurrentCorrection.Value
	local Brightness = CurrentCorrection.Brightness
	local Contrast = CurrentCorrection.Contrast
	workspace.Main.FadeMusic.FadeMusic:Invoke("Out", true)
	local v2 = v1:Clone()
	v2.Parent = v1.Parent
	v2:Play()
	game.Lighting.PetDepthOfField.Enabled = true
	CurrentCamera.CameraType = Enum.CameraType.Scriptable
	CurrentCamera.CameraType = "Scriptable"
	CurrentCamera:Interpolate(CFrame.new(Object.MouthAttachment.WorldPosition + Vector3.new(0, 0.3, 0) + Object.CFrame.lookVector * 2.3), CFrame.new(Object.MouthAttachment.WorldPosition + Vector3.new(0, 0.3, 0)), 0.5)
	CurrentCamera.InterpolationFinished:connect(function() --[[ Line: 339 | Upvalues: CurrentCamera (ref), Object (copy) ]]
		CurrentCamera.CFrame = CFrame.new(Object.MouthAttachment.WorldPosition + Vector3.new(0, 0.3, 0) + Object.CFrame.lookVector * 2.3, Object.MouthAttachment.WorldPosition + Vector3.new(0, 0.3, 0))
	end)
	while v2.TimePosition < 3.3 do
		task.wait()
	end
	delay(3, function() --[[ Line: 346 | Upvalues: v2 (copy) ]]
		v2:Destroy()
	end)
	CurrentCorrection.Brightness = 1
	CurrentCorrection.Contrast = -1
	p1:FireServer()
	v8(CurrentCorrection, "Brightness", "Number", 1, Brightness, 2, "Linear", "Out")
	v8(CurrentCorrection, "Contrast", "Number", -1, Contrast, 2, "Linear", "Out")
	wait(5)
	CurrentCamera.CameraType = "Custom"
	game.Lighting.PetDepthOfField.Enabled = false
	workspace.Main.FadeMusic.FadeMusic:Invoke("In", true)
end
function Refresh() --[[ Refresh | Line: 376 | Upvalues: v16 (ref), Buttons (copy), Pets (copy), Stats (copy), Fetch (copy), Pet (copy), Hold (copy), Stay (copy), Hats (copy), Medicine (copy), Pepperoni (copy), Cheese (copy), Sausage (copy), PetStats (copy), Level (copy), Progress (copy), Level_2 (copy), XP (copy), v21 (ref), Progress_2 (copy), Level_3 (copy), XP_2 (copy), Progress_3 (copy), v2 (copy), Progress_4 (copy), t (ref), UIParticleEmitter (copy), v1 (copy), TextLabel (copy), Icon (copy), TextLabel_2 (copy), TextLabel_9 (copy), TextLabel_8 (copy), TextLabel_7 (copy), TextLabel_4 (copy), TextLabel_3 (copy), TextLabel_6 (copy), t6 (copy), TextLabel_5 (copy), t7 (copy), ImageLabel (copy), UnknownAbility (copy), UnknownFavoriteFood (copy), UnknownEyeColor (copy) ]]
	if v16 == nil or v16.Object == nil then
		print("Pet is NULL")
		for i, v in ipairs(Buttons:GetChildren()) do
			if v ~= Pets and v:IsA("TextButton") then
				v.Visible = false
			end
		end
	else
		Stats.Visible = v16.Gen == 2
		local Level_4 = v16.Level
		Fetch.Visible = if v16.Gen == 1 then true elseif v16.Timeline.FetchCommand <= Level_4 then true else false
		Pet.Visible = if v16.Gen == 1 then true elseif v16.Timeline.PetCommand <= Level_4 then true else false
		Hold.Visible = true
		Stay.Visible = if v16.Gen == 1 then true elseif v16.Timeline.StayCommand <= Level_4 then true else false
		Hats.Visible = if v16.Gen == 1 then true else v16.Timeline.Hatch <= Level_4
		Fetch.Notification.Visible = v16.Object:GetAttribute("DesiredAction") == "Fetch"
		Pet.Notification.Visible = v16.Object:GetAttribute("DesiredAction") == "Pet"
		Medicine.Notification.Visible = v16.IsSick
		Pepperoni.Notification.Visible = v16.Object:GetAttribute("DesiredAction") == "Feed"
		Cheese.Notification.Visible = v16.Object:GetAttribute("DesiredAction") == "Feed"
		Sausage.Notification.Visible = v16.Object:GetAttribute("DesiredAction") == "Feed"
		PetStats.Title.Text = v16.Name
		local v15, v162, v17 = Level:GetSubExperience(v16.XP)
		Progress.Size = UDim2.new(v17, 0, 1, 0)
		Level_2.Text = "Level " .. v16.Level
		XP.Text = "XP " .. v15 .. "/" .. v162
		if not v21 then
			Progress_2.Size = UDim2.new(v17, 0, 1, 0)
			Level_3.Text = "Level " .. v16.Level
			XP_2.Text = "XP " .. v15 .. "/" .. v162
		end
		Progress_3.Size = UDim2.new(v16.HappinessMeter / 1000, 0, 1, 0)
		if v16.DeathMeter >= v2.DeathMeterStart then
			Progress_4.Size = UDim2.new((v16.DeathMeter - v2.DeathMeterStart) / (1000 - v2.DeathMeterStart), 0, 1, 0)
		end
		Progress_4.Parent.Parent.Visible = v16.DeathMeter >= v2.DeathMeterStart
		for k, v in pairs(v2.DefaultItemCount) do
			local v20 = t[k]
			if v20 and v16.Gen == 2 then
				Buttons[k].Visible = v20 > 0
				Buttons[k].Quantity.Text = v20 or 0
				continue
			end
			Buttons[k].Visible = false
		end
		if v16.IsSick then
			Medicine.Visible = true
		end
		if v16.DeathMeter >= v2.DeathMeterStart then
			SetColorPallet("Death")
		elseif v16.IsSick then
			SetColorPallet("Sick")
			UIParticleEmitter:RemoveEmitter(v1.SkullParticlesUI)
		else
			SetColorPallet("Normal")
			UIParticleEmitter:RemoveEmitter(v1.SkullParticlesUI)
			UIParticleEmitter:RemoveEmitter(v1.SickParticlesUI)
		end
		local v23 = v2.Buffs[v16.Buff][v16.BuffLevel]
		TextLabel.Text = v16.BuffActive and v23.Name or ""
		TextLabel.TextColor3 = v16.BuffActive and v2.BuffIconColors[v16.BuffLevel] or Color3.fromRGB(138, 110, 91)
		Icon.Image = v16.BuffActive and "rbxassetid://" .. v23.Icon or ""
		Icon.Visible = v16.BuffActive
		Icon.Image = "rbxassetid://" .. v2.Buffs[v16.Buff][1].Icon
		Icon.ImageColor3 = v2.BuffIconColors[v16.BuffLevel]
		Icon.Icon.ImageColor3 = v2.BuffIconColors[v16.BuffLevel]
		TextLabel_2.Text = if v16.BuffActive then v23.Description or "" else ""
		local v32 = v2.PetProperties[v16.Type]
		TextLabel_9.Text = if v32 then v32.Name or "???" else "???"
		local v35 = v2.EyeColors[v16.EyeColor]
		TextLabel_8.Text = v35 and v35.Name or ""
		TextLabel_7.Text = v16.Personality
		TextLabel_4.Text = if v16.Birthday == "???" then "???" else v2.FormatNumber("Date", v16.Birthday, TextLabel_4)
		TextLabel_3.Text = if v16.Level == 1 then "???" else v16.Age
		TextLabel_6.Text = if v16.Level == 1 then "???" else t6[math.floor(v16.HappinessMeter / 142)] or "???"
		TextLabel_5.Text = t7[v16.Gender] or "???"
		ImageLabel.Image = v16.FavoriteFood ~= "???" and v2.FavoriteFoodImage[v16.FavoriteFood] or ""
		UnknownAbility.Visible = not v16.BuffActive
		UnknownFavoriteFood.Visible = if v16.FavoriteFood == "???" then true else false
		UnknownEyeColor.Visible = not v35
	end
end
local t8 = {}
function RefreshPetList() --[[ RefreshPetList | Line: 498 | Upvalues: t8 (ref), LocalPlayer (copy), t2 (ref), DaycareTemplate (copy), Template (copy), v2 (copy), v7 (copy), v12 (copy), EmptyTemplate (copy), LockTemplate (copy), DaycareList (copy), ScrollingFrame_2 (copy) ]]
	for i, v in ipairs(t8) do
		v:Destroy()
	end
	t8 = {}
	local v1 = LocalPlayer:GetAttribute("NumPetSlots")
	local count = 0
	local count_2 = 0
	local v22 = nil
	for i, v in ipairs(t2) do
		local v3 = v.InDaycare and DaycareTemplate:Clone() or Template:Clone()
		v3.Visible = true
		v3.Level.Text = v.Gen == 2 and v.Level or ""
		v3.Level.Visible = if v.Gen == 2 then true else false
		v3.PetName.Text = v.Name
		v3.Icon.Visible = v.BuffActive
		v3.Icon.Image = "rbxassetid://" .. v2.Buffs[v.Buff][1].Icon
		v3.Icon.ImageColor3 = v2.BuffIconColors[v.BuffLevel]
		v3.Icon.Icon.ImageColor3 = v2.BuffIconColors[v.BuffLevel]
		v3.Parent = v.InDaycare and DaycareTemplate.Parent or Template.Parent
		if v.InDaycare then
			count = count + 1
		else
			v3.Show.Foreground.TextLabel.Text = if v.Active then "Hide" else "Show"
			v22 = v3.Show
			v3.Show.MouseButton1Click:Connect(function() --[[ Line: 524 | Upvalues: v7 (ref), i (copy), v (copy), v12 (ref) ]]
				v7:FireServer("ShowHidePet", i, not v.Active)
				v12:SetVisible(false)
			end)
			count_2 = count_2 + 1
		end
		table.insert(t8, v3)
	end
	if _G.GamepadEnabled and v22 then
		game:GetService("GuiService").SelectedObject = v22
	end
	for i = 1, v1 - count_2 do
		local v9 = EmptyTemplate:Clone()
		v9.Visible = true
		v9.Parent = EmptyTemplate.Parent
		table.insert(t8, v9)
	end
	for j = 1, v2.MaxNumPetSlots - v1 do
		local v11 = LockTemplate:Clone()
		v11.Visible = true
		v11.Parent = LockTemplate.Parent
		table.insert(t8, v11)
	end
	DaycareList.Visible = count > 0
	ScrollingFrame_2.PetAtDaycare.Visible = count > 0
end
local t9 = {}
function RefreshDaycareList() --[[ RefreshDaycareList | Line: 563 | Upvalues: v15 (copy), LocalPlayer (copy), t9 (ref), t2 (ref), DaycareTemplate2 (copy), v2 (copy) ]]
	v15.MaxNumChecked = LocalPlayer:GetAttribute("NumPetSlots")
	v15:ClearRegistry()
	for i, v in ipairs(t9) do
		v:Destroy()
	end
	t9 = {}
	for i, v in ipairs(t2) do
		local v1 = DaycareTemplate2:Clone()
		v1.Visible = true
		v1.Level.Visible = v.Gen == 2
		v1.Level.Text = v.Level
		v1.Icon.Visible = v.BuffActive
		v1.Icon.Image = "rbxassetid://" .. v2.Buffs[v.Buff][1].Icon
		v1.Icon.ImageColor3 = v2.BuffIconColors[v.BuffLevel]
		v1.Icon.Icon.ImageColor3 = v2.BuffIconColors[v.BuffLevel]
		v1.PetName.Text = v.Name
		v15:RegisterCheckbox(v1.Checkbox)
		v15:SetState(v1.Checkbox, not v.InDaycare)
		v1.Parent = DaycareTemplate2.Parent
		table.insert(t9, v1)
	end
end
PetDaycare:WaitForChild("Save").MouseButton1Click:Connect(function() --[[ Line: 590 | Upvalues: t9 (ref), v15 (copy), v7 (copy), v14 (copy) ]]
	local t = {}
	for i, v in ipairs(t9) do
		t[i] = v15:GetState(v.Checkbox)
	end
	v7:FireServer("UpdatePetDaycareStates", t)
	v14:SetVisible(false)
end)
function RefreshScrollingFrameCanvas() --[[ RefreshScrollingFrameCanvas | Line: 599 | Upvalues: Buttons (copy) ]]
	Buttons.CanvasSize = UDim2.new(0, Buttons.UIListLayout.AbsoluteContentSize.X, 0, 0)
end
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 612 | Upvalues: v16 (ref), v7 (copy), t2 (ref), Bar_2 (copy), v2 (copy), UIParticleEmitter (copy), v1 (copy), v18 (ref) ]]
	if p1.Name == "PetStats" then
		v16 = v7:InvokeServer("GetPetInfo")
		Refresh()
	end
	if p1.Name == "PetList" and p2 then
		t2 = v7:InvokeServer("GetAllPetsInfo")
		RefreshPetList()
	end
	if p1.Name == "PetDaycare" and p2 then
		t2 = v7:InvokeServer("GetAllPetsInfo")
		RefreshDaycareList()
	end
	if p1.Name ~= "PetPanel" then
		return
	end
	Bar_2.Visible = if p2 then v16 and v16.Gen == 2 else p2
	workspace.PetService.RefreshPanel:FireServer()
	RefreshScrollingFrameCanvas()
	if p2 and v16 then
		if v16.DeathMeter >= v2.DeathMeterStart then
			UIParticleEmitter:AddEmitter(v1.SkullParticlesUI)
			return
		end
		if v16.IsSick then
			UIParticleEmitter:AddEmitter(v1.SickParticlesUI)
		end
	else
		if v18 then
			workspace.PetService.Petting:FireServer("Cancel", false)
		end
		UIParticleEmitter:RemoveEmitter(v1.SkullParticlesUI)
		UIParticleEmitter:RemoveEmitter(v1.SickParticlesUI)
	end
end)
workspace.PetService.RefreshPanel.OnClientEvent:Connect(function(p1, p2) --[[ Line: 653 | Upvalues: v16 (ref), t (ref) ]]
	v16 = p1
	t = if p2 then p2 else {}
	Refresh()
	RefreshScrollingFrameCanvas()
end)
local Progress_5 = PettingBar:WaitForChild("Bar"):WaitForChild("Progress")
workspace.PetService.Petting.OnClientEvent:connect(function(p1) --[[ Line: 677 | Upvalues: v9 (copy), v20 (ref), v19 (ref) ]]
	if p1 == "Cancel" then
		v9.Icon = ""
		v20 = true
		v19 = true
		return
	end
	if p1 ~= "Ready" then
		return
	end
	v20 = true
end)
function StartPettting() --[[ StartPettting | Line: 689 | Upvalues: v18 (ref), PettingBar (copy), v16 (ref), Progress_5 (copy), Pet (copy), v19 (ref), v17 (ref), v20 (ref), CurrentCamera (copy), MainGui (copy), v9 (copy), GuiService (copy), ContextActionService (copy), GamepadPetHand (copy), LocalPlayer (copy), Buttons (copy) ]]
	if v18 == true then
		return
	end
	local v1 = PettingBar
	v1.Visible = v16.Object:GetAttribute("DesiredAction") == "Pet"
	Progress_5.Size = UDim2.new(0, 0, 1, 0)
	Pet.BackgroundColor3 = Color3.fromRGB(247, 77, 77)
	Pet.Emoji.Text = "\240\159\155\145"
	Pet.Action.Text = "Stop"
	v18 = true
	v19 = false
	v17 = false
	v20 = false
	local v3 = v16
	if not v3.Active then
		v18 = false
		return
	end
	local v4 = CurrentCamera.CFrame
	workspace.PetService.Petting:FireServer("Start", nil)
	while not v20 do
		wait(0.1)
	end
	Pet.Notification.Visible = false
	local UserInputService = game:GetService("UserInputService")
	local v5 = game:GetService("UserInputService").TouchEnabled and not game:GetService("UserInputService").MouseEnabled and not game:GetService("UserInputService").KeyboardEnabled
	local v6, v7
	if v5 then
		v6 = Instance.new("ImageLabel")
		v6.BackgroundTransparency = 1
		v6.Image = "http://www.roblox.com/asset/?id=321398052"
		v6.Size = UDim2.new(0, 100, 0, 100)
		v6.Parent = MainGui
		v7 = UserInputService.TouchMoved:connect(function(p1, p2) --[[ Line: 750 | Upvalues: v6 (ref) ]]
			v6.Position = UDim2.new(0, p1.Position.X - 50, 0, p1.Position.Y - 50)
		end)
	else
		v7 = nil
		v6 = nil
	end
	local Object = v3.Object
	task.wait()
	local v92 = Object.Size.Y / 2
	CurrentCamera.CameraType = "Scriptable"
	CurrentCamera:Interpolate(CFrame.new(Object.MouthAttachment.WorldPosition + Vector3.new(0, 0.3, 0) + Object.CFrame.lookVector * (v92 + 0.3)), CFrame.new(Object.MouthAttachment.WorldPosition + Vector3.new(0, 0.3, 0)), 0.5)
	local v10 = CurrentCamera.InterpolationFinished:connect(function() --[[ Line: 767 | Upvalues: CurrentCamera (ref), Object (copy), v92 (copy) ]]
		CurrentCamera.CFrame = CFrame.new(Object.MouthAttachment.WorldPosition + Vector3.new(0, 0.3, 0) + Object.CFrame.lookVector * (v92 + 0.3), Object.MouthAttachment.WorldPosition + Vector3.new(0, 0.3, 0))
	end)
	local Part = Instance.new("Part")
	Part.FormFactor = "Custom"
	Part.Size = Vector3.new(0.2, 0.2, 0.2)
	Part.Anchored = true
	Part.Transparency = 1
	Part.Parent = CurrentCamera
	v9.TargetFilter = Part
	local v11 = game.ReplicatedStorage.HeartParticlesPetting:Clone()
	v11.Parent = Part
	local Position = Object.Position
	local v12 = 0
	if _G.GamepadEnabled then
		v9.Icon = ""
	else
		v9.Icon = "http://www.roblox.com/asset/?id=321398052"
	end
	if _G.GamepadEnabled then
		GuiService.GuiNavigationEnabled = false
		ContextActionService:BindAction("CancelPetting", function(p1, p2, p3) --[[ Line: 806 | Upvalues: ContextActionService (ref), v19 (ref) ]]
			if p2 ~= Enum.UserInputState then
				return
			end
			ContextActionService:UnbindAction("CancelPetting")
			v19 = true
			workspace.PetService.Petting:FireServer("Cancel", false)
		end, false, Enum.KeyCode.ButtonB)
	end
	delay(3, function() --[[ Line: 816 | Upvalues: v12 (ref), v18 (ref), v5 (copy) ]]
		if not (v12 < 10 and v18) then
			return
		end
		if v5 then
			workspace.MessageService.ShowHint.ShowHint:Fire("Drag your finger to pet.", 5)
			return
		end
		workspace.MessageService.ShowHint.ShowHint:Fire("Click and drag to pet.", 5)
	end)
	local v13 = nil
	local v14 = 0
	spawn(function() --[[ Line: 830 | Upvalues: v19 (ref), v17 (ref), v13 (ref), CurrentCamera (ref), Object (copy), v12 (ref), Part (copy), v11 (copy), Position (ref), PettingBar (ref), v14 (ref), Progress_5 (ref) ]]
		while not v19 do
			local v1
			wait()
			if not (v17 and v13) then
				continue
			end
			local v2 = CurrentCamera:ScreenPointToRay(v13.Position.X, v13.Position.Y)
			local unit = Ray.new(v2.Origin, v2.Direction * 5).Direction.unit
			local sum = 0.1
			while true do
				if not (sum < 3) then
					continue
				end
				v1 = CurrentCamera.CFrame.p + unit * sum
				if (v1 - Object.Position).magnitude < Object.Size.Y / 2 then
					break
				end
				sum = sum + 0.1
			end
			v12 = v12 + 3
			Part.CFrame = CFrame.new(v1)
			v11.Rate = math.floor((v1 - Position).magnitude * (if PettingBar.Visible then 100 else 20))
			v14 = v14 + (v1 - Position).magnitude * 100
			Position = v1
			if not PettingBar.Visible then
				continue
			end
			Progress_5.Size = UDim2.new(v14 / 3000, 0, 1, 0)
			if not (v14 >= 3000) then
				continue
			end
			workspace.PetService.Petting:FireServer("Cancel", true)
		end
	end)
	local v15 = nil
	if _G.GamepadEnabled then
		local v182 = Vector3.new(MainGui.AbsoluteSize.X / 2, MainGui.AbsoluteSize.Y / 2, 0)
		v13 = {
			Position = v182
		}
		local v192 = v182.Y / 2 - 30
		v12 = 0
		v11.Enabled = true
		GamepadPetHand.Visible = true
		ContextActionService:BindAction("ThumbstickMovedPetting", function(p1, p2, p3) --[[ Line: 885 | Upvalues: v13 (ref), v182 (copy), v192 (copy), GamepadPetHand (ref) ]]
			v13.Position = v182 + Vector3.new(p3.Position.X, -p3.Position.Y, 0) * v192
			GamepadPetHand.Position = UDim2.new(0, v13.Position.X, 0, v13.Position.Y)
		end, false, Enum.KeyCode.Thumbstick1)
		spawn(function() --[[ Line: 891 | Upvalues: v13 (ref), v19 (ref), v17 (ref) ]]
			local Y = v13.Position.Y
			while not v19 do
				wait(0.1)
				v17 = if Y == v13.Position.Y then false else true
				Y = v13.Position.Y
			end
		end)
	else
		v15 = game:GetService("UserInputService").InputChanged:connect(function(p1, p2) --[[ Line: 873 | Upvalues: v13 (ref) ]]
			if p2 or p1.UserInputType ~= Enum.UserInputType.MouseMovement and p1.UserInputType ~= Enum.UserInputType.Touch then
				return
			end
			v13 = p1
		end)
	end
	local v21 = v9.Button1Down:connect(function() --[[ Line: 907 | Upvalues: v9 (ref), v12 (ref), v11 (copy), v17 (ref) ]]
		v9.Icon = "http://www.roblox.com/asset/?id=321398052"
		v12 = 0
		v11.Enabled = true
		v17 = true
	end)
	local v22 = v9.Button1Up:connect(function() --[[ Line: 922 | Upvalues: v12 (ref), v17 (ref), v11 (copy), v9 (ref) ]]
		v12 = 0
		v17 = false
		v11.Enabled = false
		v9.Icon = ""
	end)
	local v23 = nil
	if LocalPlayer and (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) then
		v23 = game.Players.LocalPlayer.Character.Humanoid.Died:connect(function() --[[ Line: 939 | Upvalues: v19 (ref) ]]
			workspace.PetService.Petting:FireServer("Cancel", false)
			v19 = true
		end)
	else
		workspace.PetService.Petting:FireServer("Cancel", false)
		v19 = true
	end
	game.Lighting.PetDepthOfField.Enabled = true
	while not v19 do
		workspace.PetService.Petting:FireServer("Petting", v12)
		wait(0.5)
	end
	game.Lighting.PetDepthOfField.Enabled = false
	PettingBar.Visible = false
	if _G.GamepadEnabled then
		GuiService.GuiNavigationEnabled = true
		GuiService.SelectedObject = Buttons.Pet
	end
	GamepadPetHand.Visible = false
	ContextActionService:UnbindAction("ThumbstickMovedPetting")
	ContextActionService:UnbindAction("CancelPetting")
	v3.Object.Anchored = false
	CurrentCamera.CFrame = v4
	CurrentCamera.CameraType = "Custom"
	v9.Icon = ""
	v19 = false
	v20 = false
	Part:Destroy()
	v11:Destroy()
	v21:disconnect()
	v22:disconnect()
	if v15 then
		v15:disconnect()
	end
	if v23 then
		v23:disconnect()
	end
	if v7 then
		v7:disconnect()
	end
	if v6 then
		v6:Destroy()
	end
	if v10 then
		v10:disconnect()
	end
	v18 = false
	ResetButton("Pet")
end
function ClearStops() --[[ ClearStops | Line: 993 ]] end
function Command(p1) --[[ Command | Line: 997 | Upvalues: v16 (ref), Throw (copy), Hold (copy), Stay (copy) ]]
	local v1 = v16
	if v1 and v1.Active then
		if p1 == "Hold" then
			Throw.Visible = true
			Hold.BackgroundColor3 = Color3.fromRGB(247, 77, 77)
			Hold.Emoji.Text = "\240\159\155\145"
			Hold.Action.Text = "Stop"
			Hold.Notification.Visible = false
		end
		if p1 == "Stay" then
			Stay.BackgroundColor3 = Color3.fromRGB(247, 77, 77)
			Stay.Emoji.Text = "\240\159\155\145"
			Stay.Action.Text = "Stop"
		end
		if workspace.PetService.Command:InvokeServer(p1) then
		end
	else
		error("NO PET ACTIVE")
	end
end
local t10 = {}
local Template_2 = PetHats.List:WaitForChild("Template")
Template_2.Visible = false
PetHats.List["No Hat"].MouseButton1Click:Connect(function() --[[ Line: 1031 ]]
	workspace.PetService.SetCustomHat:FireServer("No Hat", 860395229, false)
end)
function RefreshPetHats() --[[ RefreshPetHats | Line: 1035 | Upvalues: t10 (ref), v3 (copy), Template_2 (copy), v2 (copy), PetHats (copy) ]]
	for i, v in ipairs(t10) do
		v:Destroy()
	end
	t10 = {}
	for i, v in ipairs(v3:SendData("GetInventory", "PlayerChannel", 2, "PetHats") or v3:SendData("GetInventory", "PlayerChannel", 2, "PetHats")) do
		if v.Name ~= "No Hat" then
			local v22 = Template_2:Clone()
			if v.Year or v.Rarity then
				v22.Rarity.Text = v.Year or v.Rarity
				v22.Rarity.BackgroundColor3 = v2.CapsuleTypeToColor[v.Rarity] or v.Year and v2.CapsuleTypeToColor.Limited or Color3.fromRGB(0, 0, 0)
				v22.Rarity.Visible = true
			end
			if v.Quantity and v.Quantity > 1 then
				local v5 = v2.FormatNumber("Multiplier", v.Quantity, v22.Quantity)
				if not v5 then
					v5 = tostring(v.Quantity)
				end
				v22.Quantity.Text = v5
				v22.Quantity.Visible = true
			end
			v22.Visible = true
			v22.ImageLabel.Image = "http://www.roblox.com/Thumbs/Asset.ashx?Width=75&Height=75&AssetID=" .. v.ModelId or v.AssetId
			v22.MouseButton1Click:Connect(function() --[[ Line: 1059 | Upvalues: v (copy) ]]
				workspace.PetService.SetCustomHat:FireServer(v.Name, v.AssetId, false)
			end)
			v22.Parent = Template_2.Parent
			table.insert(t10, v22)
		end
	end
	PetHats.List.CanvasSize = UDim2.new(0, PetHats.List.UIListLayout.AbsoluteContentSize.X, 0, 0)
end
function ShowStats() --[[ ShowStats | Line: 1071 | Upvalues: v11 (copy) ]]
	v11:SetVisible(true)
end
function ShowPets() --[[ ShowPets | Line: 1075 | Upvalues: v12 (copy) ]]
	v12:SetVisible(true)
end
function ShowHatWindow(p1) --[[ ShowHatWindow | Line: 1080 | Upvalues: PetHats (copy), GuiManager (copy) ]]
	if p1 and PetHats.Visible then
		p1 = false
	end
	GuiManager:GetWindowDataByName("PetHats"):SetVisible(p1)
	if not p1 then
		return
	end
	RefreshPetHats()
end
function GetPetName() --[[ GetPetName | Line: 1091 | Upvalues: v16 (ref) ]]
	local v1 = game.Workspace.MessageService.GetShortString.GetShortString:Invoke("Enter Pet Name", "Broadcast", 12, v16.Name)
	game:GetService("HttpService"):JSONEncode(v1)
	workspace.PetService.SetName:FireServer(v1)
end
function ResetButton(p1) --[[ ResetButton | Line: 1098 | Upvalues: Buttons (copy) ]]
	local v1 = Buttons[p1]
	v1.BackgroundColor3 = Color3.fromRGB(247, 169, 90)
	if not v1:GetAttribute("OriginalEmoji") then
		return
	end
	v1.Emoji.Text = v1:GetAttribute("OriginalEmoji")
	v1.Action.Text = v1:GetAttribute("OriginalAction")
end
for i, v in ipairs(Buttons:GetChildren()) do
	if v:FindFirstChild("Action") and v:FindFirstChild("Emoji") then
		v:SetAttribute("OriginalAction", v.Action.Text)
		v:SetAttribute("OriginalEmoji", v.Emoji.Text)
	end
end
Throw.MouseButton1Click:connect(function() --[[ Line: 1113 ]]
	workspace.PetService.ThrowPet:FireServer()
end)
Hold.MouseButton1Click:connect(function() --[[ Line: 1114 ]]
	Command("Hold")
end)
Stay.MouseButton1Click:connect(function() --[[ Line: 1115 ]]
	Command("Stay")
end)
Hats.MouseButton1Click:connect(function() --[[ Line: 1116 ]]
	ShowHatWindow(true)
end)
Pet.MouseButton1Click:connect(StartPettting)
SetName.MouseButton1Click:connect(GetPetName)
Pepperoni.MouseButton1Click:connect(function() --[[ Line: 1119 ]]
	workspace.PetService.FeedPet:FireServer("Pepperoni")
end)
Sausage.MouseButton1Click:connect(function() --[[ Line: 1120 ]]
	workspace.PetService.FeedPet:FireServer("Sausage")
end)
Cheese.MouseButton1Click:connect(function() --[[ Line: 1121 ]]
	workspace.PetService.FeedPet:FireServer("Cheese")
end)
Medicine.MouseButton1Click:connect(function() --[[ Line: 1122 ]]
	workspace.PetService.FeedPet:FireServer("Medicine")
end)
Fetch.MouseButton1Click:connect(function() --[[ Line: 1124 | Upvalues: Fetch (copy) ]]
	Fetch.Notification.Visible = false
	workspace.PetService.PlayBall:FireServer()
end)
Stats.MouseButton1Click:connect(ShowStats)
Pets.MouseButton1Click:connect(ShowPets)
for i, v in ipairs(Buttons:GetChildren()) do
	if v:IsA("GuiBase") then
		v.MouseButton1Click:Connect(function() --[[ Line: 1134 | Upvalues: PetHats (copy), v (copy), Hats (copy), v18 (ref) ]]
			if PetHats.Visible and v ~= Hats then
				ShowHatWindow(false)
			end
			if not v18 then
				return
			end
			workspace.PetService.Petting:FireServer("Cancel", false)
		end)
	end
end
workspace.PetService.RefreshPanel:FireServer()
v7:BindEvents({
	AddXPAnimation = ShowLevelUpAnimation,
	PettingEnded = function() --[[ PettingEnded | Line: 1152 | Upvalues: v19 (ref) ]]
		v19 = true
	end,
	HoldingEnded = function() --[[ HoldingEnded | Line: 1153 | Upvalues: Throw (copy) ]]
		ResetButton("Hold")
		Throw.Visible = false
	end,
	StayingEnded = function() --[[ StayingEnded | Line: 1154 ]]
		ResetButton("Stay")
	end,
	StartPetCutscene = StartPetCutscene,
	RefreshDeathMeter = function(p1) --[[ RefreshDeathMeter | Line: 1157 | Upvalues: v2 (copy), Progress_4 (copy) ]]
		if not (v2.DeathMeterStart <= p1) then
			return
		end
		Progress_4.Size = UDim2.new((p1 - v2.DeathMeterStart) / (1000 - v2.DeathMeterStart), 0, 1, 0)
		if Progress_4.Parent.Parent.Visible ~= false then
			return
		end
		workspace.PetService.RefreshPanel:FireServer()
	end
})