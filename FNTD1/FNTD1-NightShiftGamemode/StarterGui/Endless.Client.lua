-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local LocalPlayer = game.Players.LocalPlayer
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local Images = require(game.ReplicatedStorage.Configs.Images)
local ClientState = require(game.ReplicatedStorage.PlayerData.ClientState)
local Misc = require(game.ReplicatedStorage.Configs.Misc)
require(game.ReplicatedStorage.Modules.Index)
local Towers = require(game.ReplicatedStorage.Configs.Towers).Towers
local Rewards = script.Parent.Rewards
local Frame = script.Parent.Frame
local Button = Frame:WaitForChild("Button")
local v1 = false
local v2 = nil
local v3 = 0
local function round(p1, p2) --[[ round | Line: 19 ]]
	if p1 then
		local v1 = 10 ^ p2
		return math.floor(p1 * v1) / v1
	else
		return 0
	end
end
function update(p1) --[[ update | Line: 25 | Upvalues: v2 (ref), v3 (ref), ClientState (copy), Misc (copy), Rewards (copy), Images (copy) ]]
	if not v2 then
		v2 = p1
	end
	v3 = v3 + 1
	local v1 = ClientState.GetData()
	if v2 and (not v1.Endless[v2] and v3 <= 3) then
		task.wait(1)
		update(p1)
	end
	v3 = 0
	local tbl = {}
	for k, v in pairs(v1.Endless[v2].Rewards) do
		local v22 = Misc.GetReward(v)
		local v32 = if v.Amount then v.Amount elseif v22 then v22[1] else 1
		local v4 = if v.Name then v.Name elseif v22 then v22[2] else ""
		string.find(v4, "Tokens")
		if tbl[v4] then
			tbl[v4] = tbl[v4] + v32
			continue
		end
		tbl[v4] = v32
	end
	for k, v in pairs(Rewards.ScrollingFrame:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "Example" then
			v:Destroy()
		end
	end
	for k, v in pairs(tbl) do
		local v5 = Rewards.ScrollingFrame:FindFirstChild(k)
		if v5 then
			v5.RewardExample.Text = "+" .. math.floor(tonumber((string.gsub(v5.RewardExample.Text, "+", ""))) + v)
			continue
		end
		local v8 = Rewards.ScrollingFrame.Example:Clone()
		v8.Name = k
		v8.RewardExample.Text = "+" .. math.floor(v)
		v8.RewardExample.ItemImage.Image = if Images[k] then Images[k] else ""
		v8.Parent = Rewards.ScrollingFrame
		v8.Visible = true
		if k == "Tokens" then
			v8.LayoutOrder = -99
			continue
		end
		if k == "Souls" then
			v8.LayoutOrder = -98
		end
	end
end
Button.MouseButton1Click:Connect(function() --[[ Line: 109 | Upvalues: v1 (ref), Rewards (copy), TweenService (copy), Button (copy) ]]
	v1 = not v1
	if v1 then
		Rewards.Size = UDim2.new(0, 0, 0, 0)
		Rewards.Visible = true
		TweenService:Create(Button, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
			Position = UDim2.new(0.825, 0, 0.541, 0)
		}):Play()
		TweenService:Create(Rewards, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
			Size = UDim2.new(0.165, 0, 0.365, 0)
		}):Play()
	else
		TweenService:Create(Button, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
			Position = UDim2.new(0.825, 0, 0.9, 0)
		}):Play()
		TweenService:Create(Rewards, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
			Size = UDim2.new(0, 0, 0, 0)
		}):Play()
		task.wait(0.3)
		Rewards.Visible = false
	end
end)
game.ReplicatedStorage.Remotes.Main.EnemyReward.Remote.OnClientEvent:Connect(function(p1, p2, p3) --[[ Line: 129 | Upvalues: Frame (copy), Images (copy), TweenService (copy), Button (copy) ]]
	if not p2 then
		update(p1)
		return
	end
	local Active = Frame.RewardExample:Clone()
	Active.Name = "Active"
	Active.Text = "+" .. p2
	Active.ItemImage.Image = if Images[p1] then Images[p1] else ""
	Active.Parent = Frame
	Active.Visible = true
	Active.Position = UDim2.new(math.random(10, 80) / 100, 0, math.random(10, 80) / 100, 0)
	Active.Size = UDim2.new(0, 0, 0, 0)
	TweenService:Create(Active, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		Size = Frame.RewardExample.Size
	}):Play()
	delay(1, function() --[[ Line: 143 | Upvalues: TweenService (ref), Active (copy), Button (ref) ]]
		TweenService:Create(Active, TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			Position = Button.Position
		}):Play()
		TweenService:Create(Active, TweenInfo.new(0.4, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
			Size = UDim2.new(0, 0, 0, 0)
		}):Play()
		task.wait(0.4)
		Active:Destroy()
	end)
end)
game.ReplicatedStorage.Values.Wave.Changed:Connect(function() --[[ Line: 157 | Upvalues: Button (copy) ]]
	if game.ReplicatedStorage.Values.TotalWaves.Value == "\226\136\158" then
		Button.Visible = true
	end
end)
Tween:AddButton(Button, nil, "ButtonClick")