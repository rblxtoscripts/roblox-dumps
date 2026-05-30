-- https://lua.expert/
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local ClientState = require(ReplicatedStorage.Modules.PlayerData.ClientState)
local Tween = require(ReplicatedStorage.Libs.Tween)
local Main = script.Parent.Main
local DailyButton = script.Parent.Parent:WaitForChild("SideDock"):WaitForChild("Container"):WaitForChild("DailyButton")
function getText(p1, p2) --[[ getText | Line: 13 ]]
	local v1 = p2 - p1
	if v1 > 1 then
		return v1 .. " Days Left"
	end
	if v1 == 1 then
		return v1 .. " Day Left"
	else
		return "CLAIM"
	end
end
function initialize() --[[ initialize | Line: 26 | Upvalues: Main (copy), Tween (copy), ReplicatedStorage (copy) ]]
	for k, v in pairs(Main.ScrollingFrame:GetChildren()) do
		if v:IsA("Frame") then
			Tween:AddButton(v.BuyTowerButton)
			v.BuyTowerButton.MouseButton1Click:Connect(function() --[[ Line: 30 | Upvalues: ReplicatedStorage (ref), v (copy) ]]
				ReplicatedStorage.Remotes.Misc.Daily:FireServer(v.Name)
			end)
		end
	end
end
function update(p1) --[[ update | Line: 38 | Upvalues: ClientState (copy), Main (copy), DailyButton (copy) ]]
	local v1 = ClientState.GetData()
	local count = 0
	for k, v in pairs(Main.ScrollingFrame:GetChildren()) do
		if v:IsA("Frame") then
			local v4 = getText(v1.DayStreak, (tonumber(v.Name)))
			v.BuyTowerButton.Info.Text = v4
			if v1.DailyRewards[tostring(v.Name)] then
				v.BuyTowerButton.Info.Text = "Claimed"
				v.BuyTowerButton.ImageColor3 = Color3.fromRGB(141, 141, 141)
				v.BuyTowerButton.Info.TextColor3 = Color3.fromRGB(141, 141, 141)
			else
				if v1.DailyRewards[tonumber(v.Name)] then
					v.BuyTowerButton.Info.Text = "Claimed"
					v.BuyTowerButton.ImageColor3 = Color3.fromRGB(141, 141, 141)
					v.BuyTowerButton.Info.TextColor3 = Color3.fromRGB(141, 141, 141)
					continue
				end
				if v4 == "CLAIM" then
					v.BuyTowerButton.ImageColor3 = Color3.fromRGB(90, 192, 255)
					v.BuyTowerButton.Info.TextColor3 = Color3.fromRGB(90, 192, 255)
					count = count + 1
					continue
				end
				v.BuyTowerButton.ImageColor3 = Color3.fromRGB(0, 255, 51)
				v.BuyTowerButton.Info.TextColor3 = Color3.fromRGB(0, 255, 51)
			end
		end
	end
	if count <= 0 then
		DailyButton.Notifier.Visible = false
	else
		DailyButton.Notifier.Visible = true
		DailyButton.Notifier.TextLabel.Text = count
	end
end
Main.ClaimAll.MouseButton1Click:Connect(function() --[[ Line: 73 | Upvalues: ReplicatedStorage (copy) ]]
	ReplicatedStorage.Remotes.Misc.Daily:FireServer("All")
end)
initialize()
update()
Tween:AddButton(DailyButton, Main)
Tween:AddButton(Main.Exit, Main)
Tween:AddButton(Main.ClaimAll)
ReplicatedStorage.Remotes.Misc.Daily.OnClientEvent:Connect(update)