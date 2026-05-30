-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local LocalPlayer = game.Players.LocalPlayer
local Completed = game.ReplicatedStorage.Remotes.Main.Completed
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local Images = require(game.ReplicatedStorage.Configs.Images)
local Misc = require(game.ReplicatedStorage.Configs.Misc)
local ClientState = require(game.ReplicatedStorage.PlayerData.ClientState)
local Lost = script.Parent.Lost
local Won = script.Parent.Won
local PlayAgain = script.Parent.PlayAgain
local Teleporting = script.Parent.Teleporting
local v1 = false
function playingAgain(p1, p2) --[[ playingAgain | Line: 18 | Upvalues: PlayAgain (copy), v1 (ref) ]]
	if p2 then
		PlayAgain.Yes.ImageTransparency = 0.5
		PlayAgain.Yes.TextLabel.TextTransparency = 0.5
		PlayAgain.No.ImageTransparency = 0.5
		PlayAgain.No.TextLabel.TextTransparency = 0.5
	elseif p1 then
		PlayAgain.Yes.ImageTransparency = 0
		PlayAgain.Yes.TextLabel.TextTransparency = 0
		PlayAgain.No.ImageTransparency = 0.5
		PlayAgain.No.TextLabel.TextTransparency = 0.5
	elseif not p1 then
		PlayAgain.Yes.ImageTransparency = 0.5
		PlayAgain.Yes.TextLabel.TextTransparency = 0.5
		PlayAgain.No.ImageTransparency = 0
		PlayAgain.No.TextLabel.TextTransparency = 0
	end
	v1 = p1
end
local function round(p1, p2) --[[ round | Line: 38 ]]
	if p1 then
		local v1 = 10 ^ p2
		return math.floor(p1 * v1) / v1
	else
		return 0
	end
end
function updatePlayAgainText() --[[ updatePlayAgainText | Line: 44 | Upvalues: PlayAgain (copy) ]]
	PlayAgain.Teleporting.Text = ("(%*/%*)"):format(PlayAgain.Teleporting.Players.Value, PlayAgain.Teleporting.TotalPlayers.Value)
end
Completed.OnClientEvent:Connect(function(p1, p2, p3, p4) --[[ Line: 48 | Upvalues: ClientState (copy), Teleporting (copy), TweenService (copy), PlayAgain (copy), Won (copy), Lost (copy), Images (copy), Misc (copy) ]]
	if not p1 and ClientState.GetData().Settings.Jumpscares then
		task.wait(1)
	end
	if p4 and (p4.Game == "4" and (p4.Night == "1" and game.ReplicatedStorage.Values.BaseHealth.Value <= 0)) then
		script.Parent.AprilFools.Visible = true
		task.wait(2)
		script.Parent.AprilFools.Visible = false
	end
	if p1 == "Teleporting" then
		Teleporting.BackgroundTransparency = 1
		Teleporting.Message.TextTransparency = 1
		Teleporting.Visible = true
		local v1 = TweenService:Create(Teleporting, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			BackgroundTransparency = 0
		})
		local v2 = TweenService:Create(Teleporting.Message, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			TextTransparency = 0
		})
		v1:Play()
		v2:Play()
		return
	end
	if p1 == "UpdatePlayAgain" then
		PlayAgain.Teleporting.Players.Value = p2
		updatePlayAgainText()
		return
	end
	playingAgain(false, true)
	PlayAgain.Visible = true
	if game.ReplicatedStorage.Values.PVP.Value and not game.ReplicatedStorage.Values.PVP.Custom.Value then
		PlayAgain.Yes.Visible = false
	end
	if p4 and p4.FirstCompletion then
		PlayAgain.FirstCompletion.Visible = true
	end
	Won.Visible = p1
	Lost.Visible = not p1
	local v3 = if p1 then Won else Lost
	v3.XPReward.Text = "+" .. p2.XP .. " XP"
	local v4 = v3.Rewards.Example:Clone()
	local Money = p2.Money
	v4.Amount.Text = "x" .. (if Money then math.floor(Money * 100) / 100 else 0)
	v4.ItemImage.Image = if p3 == "Western" then Images["Western Tokens"] elseif p3 == "NewSummer" then Images["NewSummer Tokens"] elseif game.ReplicatedStorage.Values.RaidBoss.Value then Images["Death Tokens"] elseif game.ReplicatedStorage.Values.PVP.Value and not game.ReplicatedStorage.Values.PVP.Custom.Value then Images.Trophies else Images.Tokens
	v4.Parent = v3.Rewards
	v4.Visible = true
	local count = 0
	for k, v in pairs(p2.Rewards) do
		if (typeof(v) ~= "string" or not string.find(v, "Tokens_")) and not table.find(Misc.Difficulties, k) then
			local v8 = Misc.GetReward(v)
			local v9 = if v.Amount then v.Amount elseif v8 then v8[1] else 1
			local v10 = if v.Name then v.Name elseif v8 then v8[2] else ""
			count = count + 1
			local v11 = v3.Rewards.Example:Clone()
			v11.Amount.Text = "x" .. (if v9 then math.floor(v9 * 100) / 100 else 0)
			v11.ItemImage.Image = if Images[v10] then Images[v10] else ""
			v11.Parent = v3.Rewards
			v11.Visible = true
		end
	end
	if not (count >= 8) then
		return
	end
	v3.Rewards.UIGridLayout.VerticalAlignment = Enum.VerticalAlignment.Top
end)
PlayAgain.Yes.MouseButton1Click:Connect(function() --[[ Line: 132 | Upvalues: Teleporting (copy) ]]
	if not Teleporting.Visible then
		playingAgain(true)
		game.ReplicatedStorage.Remotes.Main.PlayAgain.Event:FireServer(true)
	end
end)
PlayAgain.No.MouseButton1Click:Connect(function() --[[ Line: 138 | Upvalues: Teleporting (copy) ]]
	if not Teleporting.Visible then
		playingAgain(false)
		game.ReplicatedStorage.Remotes.Main.PlayAgain.Event:FireServer()
	end
end)
function game.ReplicatedStorage.Remotes.Main.PlayAgain.OnClientInvoke() --[[ Line: 144 | Upvalues: v1 (ref) ]]
	return v1
end
local function updateTotalPlayers() --[[ updateTotalPlayers | Line: 148 | Upvalues: PlayAgain (copy) ]]
	PlayAgain.Teleporting.TotalPlayers.Value = #game.Players:GetPlayers()
	updatePlayAgainText()
end
PlayAgain.Teleporting.TotalPlayers.Value = #game.Players:GetPlayers()
updatePlayAgainText()
game.Players.PlayerAdded:Connect(updateTotalPlayers)
game.Players.PlayerRemoving:Connect(updateTotalPlayers)
Tween:AddButton(PlayAgain.Yes)
Tween:AddButton(PlayAgain.No)