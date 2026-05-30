-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local LocalPlayer = game.Players.LocalPlayer
local Modifiers = game.ReplicatedStorage.Remotes.Main.Modifiers
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local ClientState = require(game.ReplicatedStorage.PlayerData.ClientState)
local Misc = require(game.ReplicatedStorage.Configs.Misc)
local Images = require(game.ReplicatedStorage.Configs.Images)
local v1 = script.Parent
local t = {
	v1.PiratesCove,
	v1.Reanimation,
	v1.Vengeful,
	v1.HellMode
}
local Size = v1.Size
Modifiers.OnClientEvent:Connect(function(p1, p2) --[[ Line: 15 | Upvalues: ClientState (copy), v1 (copy), Misc (copy), Images (copy), TweenService (copy), Size (copy) ]]
	if string.find(p1, "NewSummer") then
		return
	end
	if string.find(p1, "BossRaids") then
		return
	end
	if p1 == "Start" then
		if ClientState.GetData().Wins < 100 then
			v1.HellMode.Locked.Visible = true
		else
			v1.HellMode.Locked.Visible = false
		end
		for k, v in pairs(v1.HellMode.Rewards.RewardsInfo:GetChildren()) do
			if v:IsA("Frame") and v.Name ~= "Example" then
				v:Destroy()
			end
		end
		for k, v in pairs(if Misc.HellModeRewards[p2] then Misc.HellModeRewards[p2] else Misc.HellModeRewards["1_1"]) do
			local v2
			local v3 = v1.HellMode.Rewards.RewardsInfo.Example:Clone()
			v3.Name = k
			v3.RewardImage.Image = if Images[k] then Images[k] else ""
			v2 = if typeof(v) == "table" then if typeof(v.Amount) == "table" then v.Amount[1] .. ", " .. v.Amount[2] elseif typeof(v) == "table" then v.Amount else 1 elseif typeof(v) == "table" then v.Amount else 1
			v3.RewardAmount.Text = v2
			v3.RewardText.Text = if typeof(v) == "table" then v.Chance .. "%" else v .. "%"
			v3.Visible = true
			v3.Parent = v1.HellMode.Rewards.RewardsInfo
		end
		v1.Size = UDim2.new(0, 0, 0, 0)
		v1.Visible = true
		v1.Choose.Text = "CHOOSE MODIFIER"
		TweenService:Create(v1, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
			Size = Size
		}):Play()
	else
		if p1 == "Picked" then
			v1.Choose.Text = "VOTED"
			return
		end
		if p1 == "Update" then
			for k, v in pairs(p2) do
				if v1:FindFirstChild(v.Modifier) then
					v1[v.Modifier].Votes.Text = tonumber(v1[v.Modifier].Votes.Text) + 1
				end
			end
		else
			if p1 ~= "End" then
				return
			end
			TweenService:Create(v1, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
				Size = UDim2.new(0, 0, 0, 0)
			}):Play()
		end
	end
end)
function init() --[[ init | Line: 64 | Upvalues: t (copy), Tween (copy), Modifiers (copy) ]]
	for k, v in pairs(t) do
		local UIScale = Instance.new("UIScale", v)
		Tween:AddButton(v.Click, nil, "ButtonClick", nil, UIScale)
		v.Click.MouseButton1Click:Connect(function() --[[ Line: 69 | Upvalues: Modifiers (ref), v (copy) ]]
			Modifiers:FireServer(v.Name)
		end)
	end
end
v1.HellMode.Info.MouseButton1Click:Connect(function() --[[ Line: 75 | Upvalues: ClientState (copy), v1 (copy) ]]
	if not (ClientState.GetData().Wins < 100) then
		v1.HellMode.Rewards.Visible = not v1.HellMode.Rewards.Visible
	end
end)
init()
Tween:AddButton(v1.HellMode.Info, nil, "ButtonClick")