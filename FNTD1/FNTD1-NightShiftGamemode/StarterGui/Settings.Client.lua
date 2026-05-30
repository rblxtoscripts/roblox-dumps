-- https://lua.expert/
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local LocalPlayer = Players.LocalPlayer
local Tween = require(ReplicatedStorage.Libs.Tween)
local ClientState = require(ReplicatedStorage.PlayerData.ClientState)
local Sound = require(ReplicatedStorage.Libs.Sound)
local Misc = require(ReplicatedStorage.Configs.Misc)
local Settings = script.Parent.Settings
local t = {
	"Music",
	"Sounds",
	"Effects",
	"MachinePlacement",
	"TradeRequests",
	"BossVoicelines",
	"AutoSkipPopup",
	"TowerVoicelines",
	"PartyRequests",
	"RaidBossCamera"
}
local t2 = { "LeaveFrame" }
local SpecialSettings = Misc.SpecialSettings
local v1 = false
function doSettings() --[[ doSettings | Line: 20 | Upvalues: ClientState (copy), SoundService (copy), Sound (copy), v1 (ref), ReplicatedStorage (copy) ]]
	local v12 = ClientState.GetData()
	SoundService.Music.Playing = not v12.Settings.Music
	if workspace:FindFirstChild("Music") then
		for k, v in pairs(workspace.Music:GetChildren()) do
			v.Playing = not v12.Settings.Music
		end
	end
	Sound.SoundSetting(not v12.Settings.Sounds)
	if not v1 then
		v1 = true
		delay(0.5, function() --[[ Line: 34 | Upvalues: ReplicatedStorage (ref), v12 (copy) ]]
			ReplicatedStorage.Remotes.Misc.UpgradesFrame:Fire(if v12.Settings.InfoPosition then v12.Settings.InfoPosition else "Left")
		end)
		return
	end
	local UpgradesFrame = ReplicatedStorage.Remotes.Misc.UpgradesFrame
	UpgradesFrame:Fire(if v12.Settings.InfoPosition then v12.Settings.InfoPosition else "Left")
end
function update() --[[ update | Line: 42 | Upvalues: ClientState (copy), Settings (copy), t2 (copy), t (copy), SpecialSettings (copy) ]]
	task.spawn(doSettings)
	local v1 = ClientState.GetData()
	for k, v in pairs(Settings.ScrollingFrame:GetChildren()) do
		if v:IsA("Frame") and not table.find(t2, v.Name) then
			local v2 = v1.Settings[v.Name] and true or false
			if table.find(t, v.Name) then
				v2 = not v2
			end
			if SpecialSettings[v.Name] then
				v.EquipBest.Label.Text = if v1.Settings[v.Name] then string.upper(v1.Settings[v.Name]) else string.upper(SpecialSettings[v.Name][1])
				continue
			end
			if v2 then
				v.EquipBest.ImageColor3 = Color3.fromRGB(81, 255, 0)
				v.EquipBest.Label.Text = "ON"
				v.EquipBest.Label.TextColor3 = Color3.fromRGB(81, 255, 0)
				continue
			end
			v.EquipBest.ImageColor3 = Color3.fromRGB(255, 0, 0)
			v.EquipBest.Label.Text = "OFF"
			v.EquipBest.Label.TextColor3 = Color3.fromRGB(255, 0, 0)
		end
	end
end
function init() --[[ init | Line: 71 | Upvalues: Settings (copy), t2 (copy), Tween (copy), ReplicatedStorage (copy) ]]
	for k, v in pairs(Settings.ScrollingFrame:GetChildren()) do
		if v:IsA("Frame") and not table.find(t2, v.Name) then
			Tween:AddButton(v.EquipBest, nil, "ButtonClick")
			v.EquipBest.MouseButton1Click:Connect(function() --[[ Line: 76 | Upvalues: ReplicatedStorage (ref), v (copy) ]]
				ReplicatedStorage.Remotes.Misc.Settings:FireServer(v.Name)
			end)
		end
	end
	Tween:AddButton(Settings.ScrollingFrame.LeaveFrame.Leave, nil, "ButtonClick")
end
Settings.ScrollingFrame.LeaveFrame.Leave.MouseButton1Click:Connect(function() --[[ Line: 84 ]]
	script.Parent.ConfirmLeave.Visible = true
end)
script.Parent.ConfirmLeave.Yes.MouseButton1Click:Connect(function() --[[ Line: 88 | Upvalues: ReplicatedStorage (copy) ]]
	ReplicatedStorage.Remotes.Main.Leave:FireServer()
	script.Parent.ConfirmLeave.Visible = false
end)
script.Parent.ConfirmLeave.No.MouseButton1Click:Connect(function() --[[ Line: 92 ]]
	script.Parent.ConfirmLeave.Visible = false
end)
init()
update()
ReplicatedStorage.Remotes.Misc.Settings.OnClientEvent:Connect(update)
Tween:AddButton(Settings.Exit, Settings, "ButtonClick")
Tween:AddButton(script.Parent.Parent:WaitForChild("Placement"):WaitForChild("SettingsButton"), Settings, "ButtonClick")
Tween:AddButton(script.Parent.ConfirmLeave.Yes, nil, "ButtonClick")
Tween:AddButton(script.Parent.ConfirmLeave.No, nil, "ButtonClick")