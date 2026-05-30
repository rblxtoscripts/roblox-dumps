-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local LocalPlayer = game.Players.LocalPlayer
local Modifiers = game.ReplicatedStorage.Remotes.Main.Modifiers
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local ClientState = require(game.ReplicatedStorage.PlayerData.ClientState)
require(game.ReplicatedStorage.Configs.Misc)
require(game.ReplicatedStorage.Configs.Images)
local RandomBoosts = require(game.ReplicatedStorage.Configs.RandomBoosts)
local v1 = script.Parent
local t = { v1["1"], v1["2"], v1["3"] }
local Size = v1.Size
Modifiers.OnClientEvent:Connect(function(p1, p2) --[[ Line: 16 | Upvalues: ClientState (copy), RandomBoosts (copy), v1 (copy), TweenService (copy), Size (copy) ]]
	if not string.find(p1, "BossRaids") then
		return
	end
	local v12 = string.gsub(p1, "BossRaids", "")
	if v12 == "Start" then
		ClientState.GetData()
		local count = 0
		for k, v in pairs(p2) do
			count = count + 1
			local v2 = RandomBoosts.Boosts[v]
			if v2 then
				local v3 = v1[count]
				v3.Name = v
				v3.Modifier.Text = v2.Name
				v3.Description.Text = v2.Description
				v3.ModifierImage.Image = v2.Image
			end
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
			local count = 0
			for k, v in pairs(v1:GetChildren()) do
				if v:FindFirstChild("Votes") then
					v.Votes.Text = "0"
					count = count + 1
					v.Name = tostring(count)
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
init()