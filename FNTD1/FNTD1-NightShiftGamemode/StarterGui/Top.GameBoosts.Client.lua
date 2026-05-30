-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local LocalPlayer = game.Players.LocalPlayer
local GameBoosts = game.ReplicatedStorage.Remotes.Misc.GameBoosts
require(game.ReplicatedStorage.Libs.Tween)
local RandomBoosts = require(game.ReplicatedStorage.Configs.RandomBoosts)
local v1 = script.Parent
local ShowBoosts = script.Parent.Parent.ShowBoosts
local Size = v1.Size
function add(p1) --[[ add | Line: 13 | Upvalues: RandomBoosts (copy), ShowBoosts (copy) ]]
	local v1 = RandomBoosts.Boosts[p1]
	local v2 = ShowBoosts:FindFirstChild(p1)
	if v2 then
		v2.Amount.Text = "x" .. tonumber((string.gsub(v2.Amount.Text, "x", ""))) + 1
		return
	end
	local v5 = ShowBoosts.Example:Clone()
	v5.Name = p1
	v5.BoostName.Text = if v1 then v1.Name else p1
	v5.Image = if v1 then v1.Image else ""
	v5.Visible = true
	v5.Parent = ShowBoosts
end
GameBoosts.OnClientEvent:Connect(function(p1, p2) --[[ Line: 31 | Upvalues: ShowBoosts (copy), v1 (copy), RandomBoosts (copy), Size (copy), TweenService (copy) ]]
	for k, v in pairs(ShowBoosts:GetChildren()) do
		if v:IsA("ImageLabel") and v.Name ~= "Example" then
			v:Destroy()
		end
	end
	for k, v in pairs(v1.Boosts:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "Example" then
			v:Destroy()
		end
	end
	for k, v in pairs(p1) do
		task.spawn(add, v)
	end
	local count = 0
	for k, v in pairs(p2 or p1) do
		count = count + 1
		local v12 = RandomBoosts.Boosts[v]
		local v2 = v1.Boosts.Example:Clone()
		v2.Name = v
		v2.BoostName.Text = if v12 then v12.Name else v
		v2.ImageLabel.Image = if v12 then v12.Image else ""
		v2.Description.Text = if v12 then v12.Description else ""
		v2.Visible = true
		v2.Parent = v1.Boosts
	end
	if not (count <= 0) then
		v1.Size = UDim2.new(0, 0, Size.Y.Scale, 0)
		v1.Visible = true
		TweenService:Create(v1, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
			Size = Size
		}):Play()
		task.wait(5)
		TweenService:Create(v1, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
			Size = UDim2.new(Size.X.Scale, 0, 0, 0)
		}):Play()
		task.wait(0.5)
		v1.Visible = false
	end
end)