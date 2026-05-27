-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiManager")
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("InputTypeDetector")
local v4 = Sonar("ButtonTest")
local v5 = Sonar("SliderClass")
local v6 = Sonar("Button")
local v7 = Sonar("UINavigator")
local v8 = Sonar("PlayerWrapper").GetClient()
local ContainerFrame = Players.LocalPlayer.PlayerGui:WaitForChild("SettingsGui").ContainerFrame
local v9 = nil
local v10 = v2.GetRemoteEvent("ChangeSettingsRemote")
local Settings = v8.PlayerData.Settings
local function setSoundGroupVolume(p1, p2, p3) --[[ setSoundGroupVolume | Line: 34 ]]
	p1.Volume = (p2.Value and p3.Value or 0) / 100
end
local function setupVolumeSlider(p1, p2) --[[ setupVolumeSlider | Line: 40 | Upvalues: Settings (copy), v5 (copy), v10 (copy), v1 (copy), ContainerFrame (copy) ]]
	local v12 = Settings.Volume:FindFirstChild(p1.Name)
	if not v12 then
		return
	end
	local Volume = v12.Volume
	Volume:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 46 | Upvalues: p2 (copy), v12 (copy), Volume (copy) ]]
		p2.Volume = (if v12.Value then Volume.Value or 0 else 0) / 100
	end)
	p2.Volume = (v12.Value and Volume.Value or 0) / 100
	local v3 = v5.new(p1.SliderFrame.Fill, function(p12) --[[ Line: 52 | Upvalues: v10 (ref), p1 (copy), v12 (copy) ]]
		v10:FireServer("Volume", { p1.Name, p12, v12.Value })
		p1.SliderFrame.Fill.Mover.Size = UDim2.new(p12 / 100, 0, 1, 0)
	end, 0, 100, true)
	v3:Set(Volume.Value)
	v3.canMove = false
	v1.AddStateCallback(ContainerFrame, "OnOpen", function() --[[ Line: 65 | Upvalues: v3 (copy) ]]
		v3.canMove = true
	end)
	v1.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 69 | Upvalues: v3 (copy) ]]
		v3.canMove = false
	end)
	p1.SliderFrame.Fill.Mover.Size = UDim2.new(Volume.Value / 100, 0, 1, 0)
end
function t.Open(p1) --[[ Open | Line: 77 | Upvalues: v1 (copy), ContainerFrame (copy), v9 (ref), t (copy) ]]
	if v1.IsFrameOpen(ContainerFrame) then
		t.Close()
	else
		v9 = p1
		v1.OpenFrame(ContainerFrame, {
			CloseAll = "CloseOverlay"
		})
	end
end
function t.Close() --[[ Close | Line: 91 | Upvalues: v9 (ref), v1 (copy), ContainerFrame (copy) ]]
	if v9 then
		v9()
	else
		v1.CloseFrame(ContainerFrame)
	end
end
function t.Init(p1) --[[ Init | Line: 100 | Upvalues: v1 (copy), ContainerFrame (copy), v4 (copy), t (copy), v7 (copy), Settings (copy), SoundService (copy), setupVolumeSlider (copy), v6 (copy), v10 (copy), v3 (copy) ]]
	v1.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0),
		SelectOnOpen = ContainerFrame.Menu.Content.Settings
	})
	v4.new(ContainerFrame.Menu.CloseButton, {
		Click = t.Close
	})
	v7.SetUnselectableWhenSelected(ContainerFrame.Menu.Content.Settings)
	local t2 = {}
	for k, v in pairs({ "Ambience", "Effects", "Interface", "Soundtrack", "HorseSounds" }) do
		local v12 = ContainerFrame.Menu.Content.Settings[v]
		if v12:IsA("Frame") and Settings.Volume:FindFirstChild(v12.Name) then
			local v2 = SoundService:FindFirstChild(v12.Name)
			if v2 then
				t2[v12.Name] = true
				setupVolumeSlider(v12, v2)
			end
		end
	end
	SoundService.ChildAdded:Connect(function(p1) --[[ Line: 135 | Upvalues: t2 (copy), ContainerFrame (ref), Settings (ref), setupVolumeSlider (ref) ]]
		if not p1:IsA("SoundGroup") then
			return
		end
		if t2[p1.Name] then
			return
		end
		local v1 = ContainerFrame.Menu.Content.Settings:FindFirstChild(p1.Name)
		if not (v1 and v1:IsA("Frame")) then
			return
		end
		if Settings.Volume:FindFirstChild(v1.Name) then
			t2[p1.Name] = true
			setupVolumeSlider(v1, p1)
		end
	end)
	for k, v in pairs({
		"CameraSmoothing",
		"WeatherEffects",
		"ShowPlayerAnimals",
		"TameStopMovement",
		"TopNotifications",
		"LightingBloomEffect",
		"ChatTips",
		"ScreenFlashes",
		"VisualEffects"
	}) do
		local v32 = ContainerFrame.Menu.Content.Settings[v]
		if v32:IsA("Frame") then
			local v42 = Settings.States:FindFirstChild(v32.Name)
			if v42 then
				v6.new(v32.ClickFrame, {
					Click = function() --[[ Click | Line: 157 | Upvalues: v10 (ref), v32 (copy), v42 (copy) ]]
						v10:FireServer("States", { v32.Name, not v42.Value })
					end
				})
				local function setToggle() --[[ setToggle | Line: 165 | Upvalues: v32 (copy), v42 (copy) ]]
					v32.ClickFrame.Fill.Off.Visible = not v42.Value
					v32.ClickFrame.Fill.On.Visible = v42.Value
				end
				v42:GetPropertyChangedSignal("Value"):Connect(setToggle)
				v32.ClickFrame.Fill.Off.Visible = not v42.Value
				v32.ClickFrame.Fill.On.Visible = v42.Value
			end
		end
	end
	local function setMobileControls() --[[ setMobileControls | Line: 173 | Upvalues: v3 (ref), ContainerFrame (ref) ]]
		local v1 = v3.IsMobileInputType()
		ContainerFrame.Menu.Content.Settings.MobileMovementControls.Visible = v1
		ContainerFrame.Menu.Content.Settings.MobileControlsDivider.Visible = v1
	end
	v3.InputTypeChanged:Connect(setMobileControls)
	local v5 = v3.IsMobileInputType()
	ContainerFrame.Menu.Content.Settings.MobileMovementControls.Visible = v5
	ContainerFrame.Menu.Content.Settings.MobileControlsDivider.Visible = v5
	for k, v in pairs({
		MobileMovementControls = "States",
		CoRide = "Permissions",
		PVP = "Permissions",
		Trade = "Permissions",
		JoustingRequests = "Permissions"
	}) do
		local v62 = ContainerFrame.Menu.Content.Settings[k]
		if v62:IsA("Frame") then
			local v72 = Settings[v]:FindFirstChild(v62.Name)
			if v72 then
				local function setDropdownFrame(p1) --[[ setDropdownFrame | Line: 193 | Upvalues: v62 (copy) ]]
					if p1 == nil then
						p1 = not v62.ClickFrame.Dropdown.Visible
					end
					v62.ClickFrame.Dropdown.Visible = p1
					v62.ClickFrame.Content.Icon.Rotation = if p1 then 180 else 0
				end
				for k2, v2 in pairs(v62.ClickFrame.Dropdown:GetChildren()) do
					if v2:IsA("ImageButton") then
						v6.new(v2, {
							HoverLabel = v2.Hover,
							Click = function() --[[ Click | Line: 205 | Upvalues: v10 (ref), v (copy), v62 (copy), v2 (copy) ]]
								v10:FireServer(v, { v62.Name, v2.Name })
								local v1 = false
								if v1 == nil then
									v1 = not v62.ClickFrame.Dropdown.Visible
								end
								v62.ClickFrame.Dropdown.Visible = v1
								v62.ClickFrame.Content.Icon.Rotation = if v1 then 180 else 0
							end
						})
						local function setSortButton() --[[ setSortButton | Line: 214 | Upvalues: v2 (copy), v72 (copy) ]]
							v2.Current.Visible = v72.Value == v2.Name
						end
						v72:GetPropertyChangedSignal("Value"):Connect(setSortButton)
						v2.Current.Visible = v72.Value == v2.Name
					end
				end
				local function setSettingLabel() --[[ setSettingLabel | Line: 221 | Upvalues: v62 (copy), v72 (copy) ]]
					local v1 = v62.ClickFrame.Dropdown:FindFirstChild(v72.Value)
					v62.ClickFrame.Content.Setting.Text = if v1 then v1.TextLabel.Text or "N/A" else "N/A"
				end
				v72:GetPropertyChangedSignal("Value"):Connect(setSettingLabel)
				local v8 = v62.ClickFrame.Dropdown:FindFirstChild(v72.Value)
				v62.ClickFrame.Content.Setting.Text = v8 and v8.TextLabel.Text or "N/A"
				v6.new(v62.ClickFrame, {
					Click = function() --[[ Click | Line: 229 | Upvalues: v62 (copy) ]]
						local v1 = nil
						if v1 == nil then
							v1 = not v62.ClickFrame.Dropdown.Visible
						end
						v62.ClickFrame.Dropdown.Visible = v1
						v62.ClickFrame.Content.Icon.Rotation = if v1 then 180 else 0
					end
				})
				v1.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 234 | Upvalues: v62 (copy) ]]
					local v1 = false
					if v1 == nil then
						v1 = not v62.ClickFrame.Dropdown.Visible
					end
					v62.ClickFrame.Dropdown.Visible = v1
					v62.ClickFrame.Content.Icon.Rotation = if v1 then 180 else 0
				end)
			end
		end
	end
	if not v3.IsMobileInputType() then
		return
	end
	game.Lighting.GlobalShadows = false
end
t:Init()
return t