-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")
local LocalPlayer = Players.LocalPlayer
local Lighting = require(ReplicatedStorage.Configs.Lighting)
local v1 = script.Parent
TeleportService:SetTeleportGui(v1)
local v2 = nil
Remotes.Misc.EventTP.OnClientEvent:Connect(function(p1) --[[ Line: 18 | Upvalues: v2 (ref), v1 (copy), TweenService (copy), Lighting (copy) ]]
	local v12 = tick()
	v2 = v12
	if p1 == "Space2" then
		workspace.Gravity = 30
	else
		workspace.Gravity = 196.2
	end
	v1.BackgroundTransparency = 1
	v1.Message.TextTransparency = 1
	v1.Visible = true
	TweenService:Create(v1, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		BackgroundTransparency = 0
	}):Play()
	TweenService:Create(v1.Message, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		TextTransparency = 0
	}):Play()
	task.wait(1)
	Lighting.Change(p1)
	if v12 == v12 then
		TweenService:Create(v1, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			BackgroundTransparency = 1
		}):Play()
		TweenService:Create(v1.Message, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			TextTransparency = 1
		}):Play()
	end
end)
Remotes.Misc.TradingPlazaTP.OnClientEvent:Connect(function(p1) --[[ Line: 43 | Upvalues: v1 (copy), TweenService (copy), Lighting (copy) ]]
	if p1 then
		v1.BackgroundTransparency = 1
		v1.Message.TextTransparency = 1
		v1.Visible = true
		TweenService:Create(v1, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			BackgroundTransparency = 0
		}):Play()
		TweenService:Create(v1.Message, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			TextTransparency = 0
		}):Play()
		task.wait(1)
		Lighting.Change(p1)
	end
end)
Remotes.Misc.OnTP.OnClientEvent:Connect(function(p1) --[[ Line: 57 | Upvalues: v1 (copy), TweenService (copy), Lighting (copy) ]]
	if not p1 then
		p1 = "Normal"
	end
	v1.BackgroundTransparency = 1
	v1.Message.TextTransparency = 1
	v1.Visible = true
	TweenService:Create(v1, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		BackgroundTransparency = 0
	}):Play()
	TweenService:Create(v1.Message, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		TextTransparency = 0
	}):Play()
	task.wait(1)
	Lighting.Change(p1)
end)