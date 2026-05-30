-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local LocalPlayer = game.Players.LocalPlayer
local Modifiers = game.ReplicatedStorage.Remotes.Main.Modifiers
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local ClientState = require(game.ReplicatedStorage.PlayerData.ClientState)
local Misc = require(game.ReplicatedStorage.Configs.Misc)
local Images = require(game.ReplicatedStorage.Configs.Images)
local v1 = script.Parent
local t = { v1.Naughty, v1.Nice }
local Size = v1.Size
Modifiers.OnClientEvent:Connect(function(p1, p2) --[[ Line: 15 | Upvalues: ClientState (copy), v1 (copy), Misc (copy), Images (copy), TweenService (copy), Size (copy) ]]
	if not string.find(p1, "NewSummer") then
		return
	end
	local v12 = string.gsub(p1, "NewSummer", "")
	if v12 == "Start" then
		ClientState.GetData()
		for k, v in pairs(v1.Naughty.Rewards.RewardsInfo:GetChildren()) do
			if v:IsA("Frame") and v.Name ~= "Example" then
				v:Destroy()
			end
		end
		local v2 = game.ReplicatedStorage.Values.Wave.Value + 10
		for k, v in pairs(if Misc.SpecialEndlessRewards[v2] then Misc.SpecialEndlessRewards[v2] else Misc.SpecialEndlessRewards["20"]) do
			local v4
			local v5 = v1.Naughty.Rewards.RewardsInfo.Example:Clone()
			v5.Name = k
			v5.RewardImage.Image = if Images[k] then Images[k] else ""
			v4 = if typeof(v) == "table" then if typeof(v.Amount) == "table" then v.Amount[1] .. ", " .. v.Amount[2] elseif typeof(v) == "table" then v.Amount else 1 elseif typeof(v) == "table" then v.Amount else 1
			v5.RewardAmount.Text = v4
			v5.RewardText.Text = if typeof(v) == "table" then v.Chance .. "%" else v .. "%"
			v5.Visible = true
			v5.Parent = v1.Naughty.Rewards.RewardsInfo
		end
		v1.Size = UDim2.new(0, 0, 0, 0)
		v1.Visible = true
		v1.Choose.Text = "CHOOSE MODIFIER"
		TweenService:Create(v1, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
			Size = Size
		}):Play()
	else
		if v12 == "Picked" then
			v1.Choose.Text = "VOTED"
			return
		end
		if v12 == "Update" then
			for k, v in pairs(p2) do
				if v1:FindFirstChild(v.Modifier) then
					v1[v.Modifier].Votes.Text = tonumber(v1[v.Modifier].Votes.Text) + 1
				end
			end
		else
			if v12 ~= "End" then
				return
			end
			TweenService:Create(v1, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
				Size = UDim2.new(0, 0, 0, 0)
			}):Play()
			for k, v in pairs(v1:GetChildren()) do
				if v:FindFirstChild("Votes") then
					v.Votes.Text = "0"
				end
			end
		end
	end
end)
function init() --[[ init | Line: 66 | Upvalues: t (copy), Tween (copy), Modifiers (copy) ]]
	for k, v in pairs(t) do
		local UIScale = Instance.new("UIScale", v)
		Tween:AddButton(v.Click, nil, "ButtonClick", nil, UIScale)
		v.Click.MouseButton1Click:Connect(function() --[[ Line: 71 | Upvalues: Modifiers (ref), v (copy) ]]
			Modifiers:FireServer(v.Name)
		end)
	end
end
v1.Naughty.Info.MouseButton1Click:Connect(function() --[[ Line: 77 | Upvalues: v1 (copy) ]]
	v1.Naughty.Rewards.Visible = not v1.Naughty.Rewards.Visible
end)
init()
Tween:AddButton(v1.Naughty.Info, nil, "ButtonClick")