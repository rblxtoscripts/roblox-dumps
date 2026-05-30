-- https://lua.expert/
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Top = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Top", 9000000000)
local function Comma(p1) --[[ Comma | Line: 9 ]]
	local v2 = math.floor(p1)
	local v3
	while true do
		local v4
		v3, v4 = string.gsub(v2, "^(-?%d+)(%d%d%d)", "%1,%2")
		if v4 == 0 then
			break
		end
		v2 = v3
	end
	return v3
end
local function getBaseHealth() --[[ getBaseHealth | Line: 21 | Upvalues: ReplicatedStorage (copy), LocalPlayer (copy) ]]
	if not ReplicatedStorage.Values.PVP.Value then
		return game.ReplicatedStorage.Values.BaseHealth
	end
	repeat
		task.wait()
	until LocalPlayer:GetAttribute("PVPNumber")
	return game.ReplicatedStorage.Values.PVPFolder:FindFirstChild("BaseHealth" .. LocalPlayer:GetAttribute("PVPNumber"))
end
local function UpdateHealth() --[[ UpdateHealth | Line: 30 | Upvalues: ReplicatedStorage (copy), Top (copy), LocalPlayer (copy), getBaseHealth (copy) ]]
	if ReplicatedStorage.Values.PVP.Value then
		Top.Health.Visible = false
		Top.PVPHealth.Visible = true
		local BaseHealthPlayer1 = ReplicatedStorage.Values.PVPFolder.BaseHealthPlayer1.Value
		local BaseHealthPlayer2 = ReplicatedStorage.Values.PVPFolder.BaseHealthPlayer2.Value
		local v1 = BaseHealthPlayer1 / 100
		local v2 = BaseHealthPlayer2 / 100
		if v1 > 1 then
			v1 = 1
		end
		if v2 > 1 then
			v2 = 1
		end
		local v3 = UDim2.fromScale(v1, 1)
		Top.PVPHealth.Player1.TextLabel.Text = BaseHealthPlayer1 .. "/100"
		Top.PVPHealth.Player1.Move:TweenSize(v3, Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.01)
		local v4 = UDim2.fromScale(v2, 1)
		Top.PVPHealth.Player2.TextLabel.Text = BaseHealthPlayer2 .. "/100"
		Top.PVPHealth.Player2.Move:TweenSize(v4, Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.01)
		if not LocalPlayer:GetAttribute("PVPNumber") then
			return
		end
		Top.PVPHealth.Player1.OnTeam.Visible = LocalPlayer:GetAttribute("PVPNumber") == "Player1"
		Top.PVPHealth.Player2.OnTeam.Visible = LocalPlayer:GetAttribute("PVPNumber") == "Player2"
		return
	end
	Top.Health.Visible = true
	Top.PVPHealth.Visible = false
	local v7 = getBaseHealth().Value / 100
	if v7 > 1 then
		v7 = 1
	end
	local v8 = UDim2.fromScale(v7, 1)
	Top.Health.Main.TextLabel.Text = getBaseHealth().Value .. "/100"
	Top.Health.Main.Move:TweenSize(v8, Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.01)
end
local function UpdateWave() --[[ UpdateWave | Line: 64 | Upvalues: ReplicatedStorage (copy), Top (copy) ]]
	if not ReplicatedStorage.Values.PowerMode.Value then
		Top.Wave.Text = "Wave " .. ReplicatedStorage.Values.Wave.Value .. "/" .. ReplicatedStorage.Values.TotalWaves.Value
		return
	end
	local v2 = math.floor(ReplicatedStorage.Values.TotalWaves.Value / 6)
	Top.Wave.Text = if ReplicatedStorage.Values.Wave.Value < v2 then "12 AM" else ("%* AM"):format((math.floor(ReplicatedStorage.Values.Wave.Value / v2)))
end
ReplicatedStorage.Values.BaseHealth:GetPropertyChangedSignal("Value"):Connect(UpdateHealth)
ReplicatedStorage.Values.PVPFolder.BaseHealthPlayer1:GetPropertyChangedSignal("Value"):Connect(UpdateHealth)
ReplicatedStorage.Values.PVPFolder.BaseHealthPlayer2:GetPropertyChangedSignal("Value"):Connect(UpdateHealth)
ReplicatedStorage.Values.PVP.Changed:Connect(UpdateHealth)
ReplicatedStorage.Values.Wave:GetPropertyChangedSignal("Value"):Connect(UpdateWave)
ReplicatedStorage.Values.TotalWaves:GetPropertyChangedSignal("Value"):Connect(UpdateWave)
game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 80 | Upvalues: LocalPlayer (copy), Top (copy), Comma (copy) ]]
	if not LocalPlayer:FindFirstChild("Money") then
		return
	end
	Top.Money.Text = "$" .. Comma(LocalPlayer.Money.Value)
end)
task.spawn(UpdateHealth)
task.spawn(UpdateWave)