-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Tween = require(ReplicatedStorage.Libs.Tween)
local Gifts = require(ReplicatedStorage.Configs.Gifts)
local ClientState = require(ReplicatedStorage.Modules.PlayerData.ClientState)
local Main = script.Parent.Main
local GiftsButton = script.Parent.Parent:WaitForChild("SideDock"):WaitForChild("Container"):WaitForChild("GiftsButton")
local v1 = nil
local v2 = nil
function Format(p1) --[[ Format | Line: 16 ]]
	return string.format("%02i", p1)
end
function convertToHMS(p1) --[[ convertToHMS | Line: 20 ]]
	local v1 = (p1 - p1 % 60) / 60
	local v2 = (v1 - v1 % 60) / 60
	return Format(v2) .. ":" .. Format(v1 - v2 * 60) .. ":" .. Format(p1 - v1 * 60)
end
function update() --[[ update | Line: 28 | Upvalues: v1 (ref), ClientState (copy), Main (copy), Gifts (copy), v2 (ref), GiftsButton (copy) ]]
	local v12 = if v1 then v1 else ClientState.GetData()
	local count = 0
	for k, v in pairs(Main.ScrollingFrame:GetChildren()) do
		if v:IsA("Frame") then
			if v12.FreeGifts[v.Name] then
				v.BuyTowerButton.Info.Text = "Claimed"
				v.BuyTowerButton.Info.TextColor3 = Color3.fromRGB(154, 154, 154)
				v.BuyTowerButton.ImageColor3 = Color3.fromRGB(154, 154, 154)
			else
				if v12.FreeGifts[tonumber(v.Name)] then
					v.BuyTowerButton.Info.Text = "Claimed"
					v.BuyTowerButton.Info.TextColor3 = Color3.fromRGB(154, 154, 154)
					v.BuyTowerButton.ImageColor3 = Color3.fromRGB(154, 154, 154)
					continue
				end
				local Time = Gifts[tonumber(v.Name)].Time
				if Time <= v12.SessionTime + (if v2 then v2 else 0) then
					v.BuyTowerButton.Info.Text = "Claim"
					v.BuyTowerButton.Info.TextColor3 = Color3.fromRGB(89, 255, 80)
					v.BuyTowerButton.ImageColor3 = Color3.fromRGB(89, 255, 80)
					count = count + 1
					continue
				end
				local v6 = convertToHMS
				local Time_2 = Gifts[tonumber(v.Name)].Time
				v.BuyTowerButton.Info.Text = v6(Time_2 - (v12.SessionTime + (if v2 then v2 else 0)))
				v.BuyTowerButton.Info.TextColor3 = Color3.fromRGB(60, 197, 255)
				v.BuyTowerButton.ImageColor3 = Color3.fromRGB(60, 197, 255)
			end
		end
	end
	if count <= 0 then
		GiftsButton.Notifier.Visible = false
	else
		GiftsButton.Notifier.Visible = true
		GiftsButton.Notifier.TextLabel.Text = count
	end
end
local v3 = false
Main:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 62 | Upvalues: v3 (ref), ReplicatedStorage (copy), v1 (ref), ClientState (copy), v2 (ref), Main (copy) ]]
	if v3 then
		return
	end
	v3 = true
	ReplicatedStorage.Remotes.Misc.FreeGift:FireServer("Update")
	v1 = ClientState.GetData()
	v2 = 0
	while Main.Visible and (v3 and v3) do
		update()
		task.wait(1)
		v2 = v2 + 1
	end
	v3 = false
end)
ReplicatedStorage.Remotes.Misc.FreeGift.OnClientEvent:Connect(function() --[[ Line: 79 | Upvalues: v1 (ref), ClientState (copy), v2 (ref) ]]
	v1 = ClientState.GetData()
	v2 = 0
end)
Main.ClaimAll.MouseButton1Click:Connect(function() --[[ Line: 84 | Upvalues: ReplicatedStorage (copy) ]]
	ReplicatedStorage.Remotes.Misc.FreeGift:FireServer("All")
end)
for k, v in pairs(Main.ScrollingFrame:GetChildren()) do
	if v:IsA("Frame") then
		Tween:AddButton(v.BuyTowerButton, nil, "Buy")
		v.BuyTowerButton.MouseButton1Click:Connect(function() --[[ Line: 92 | Upvalues: ReplicatedStorage (copy), v (copy) ]]
			ReplicatedStorage.Remotes.Misc.FreeGift:FireServer((tonumber(v.Name)))
		end)
	end
end
Tween:AddButton(GiftsButton, Main)
Tween:AddButton(Main.Exit, Main)
Tween:AddButton(Main.ClaimAll)