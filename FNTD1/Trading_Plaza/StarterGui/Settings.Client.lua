-- https://lua.expert/
local UserInputService = game:GetService("UserInputService")
game:GetService("SoundService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Tween = require(ReplicatedStorage.Libs.Tween)
local ClientState = require(ReplicatedStorage.Modules.PlayerData.ClientState)
local Misc = require(ReplicatedStorage.Configs.Misc)
local Settings = script.Parent.Settings
local SpecialSettings = Misc.SpecialSettings
local t = { "Music", "Sounds", "Effects", "MachinePlacement", "TradeRequests" }
function doSettings() --[[ doSettings | Line: 17 | Upvalues: ClientState (copy), LocalPlayer (copy) ]]
	local v1 = ClientState.GetData()
	if LocalPlayer:FindFirstChild("StopMusic") then
		LocalPlayer.StopMusic:Destroy()
	end
	if not v1.Settings.Music then
		return
	end
	Instance.new("StringValue", LocalPlayer).Name = "StopMusic"
end
function update() --[[ update | Line: 29 | Upvalues: ClientState (copy), Settings (copy), t (copy), SpecialSettings (copy) ]]
	task.spawn(doSettings)
	local v1 = ClientState.GetData()
	for k, v in pairs(Settings.ScrollingFrame:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "Codes" then
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
function init() --[[ init | Line: 56 | Upvalues: Settings (copy), Tween (copy), ReplicatedStorage (copy), ClientState (copy), UserInputService (copy) ]]
	for k, v in pairs(Settings.ScrollingFrame:GetChildren()) do
		if v:IsA("Frame") then
			Tween:AddButton(v.EquipBest, nil, "ButtonClick")
			v.EquipBest.MouseButton1Click:Connect(function() --[[ Line: 60 | Upvalues: v (copy), ReplicatedStorage (ref) ]]
				if v.Name == "Codes" then
					ReplicatedStorage.Remotes.Misc.Codes:FireServer(v.TextBox.Text)
				else
					ReplicatedStorage.Remotes.Misc.Settings:FireServer(v.Name)
				end
			end)
		end
	end
	local v1 = ClientState.GetData()
	if not UserInputService.GamepadEnabled or (not v1 or v1.Settings.InfoPosition) then
		return
	end
	ReplicatedStorage.Remotes.Misc.Settings:FireServer("InfoPosition")
end
ReplicatedStorage.Remotes.Misc.Codes.OnClientEvent:Connect(function(p1) --[[ Line: 76 | Upvalues: Settings (copy) ]]
	if p1 == true then
		Settings.ScrollingFrame.Codes.TextBox.Text = "Success!"
		return
	end
	if p1 == "Used" then
		Settings.ScrollingFrame.Codes.TextBox.Text = "Used Already"
		return
	end
	if p1 == "Expired" then
		Settings.ScrollingFrame.Codes.TextBox.Text = "Expired"
	else
		Settings.ScrollingFrame.Codes.TextBox.Text = "Code Not Found"
	end
end)
init()
update()
Tween:AddButton(Settings.Exit, Settings, "ButtonClick")
Tween:AddButton(script.Parent.Parent.SideDock.Container.SettingsButton, Settings, "ButtonClick")
ReplicatedStorage.Remotes.Misc.Settings.OnClientEvent:Connect(update)