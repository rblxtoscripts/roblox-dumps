-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local LocalPlayer = game.Players.LocalPlayer
local PVPShop = game.ReplicatedStorage.Remotes.Misc.PVPShop
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local PVPShop_2 = require(game.ReplicatedStorage.Configs.PVPShop)
local ClientState = require(game.ReplicatedStorage.Modules.PlayerData.ClientState)
local Formatter = require(game.ReplicatedStorage.Libs.Formatter)
local Items = require(game.ReplicatedStorage.Configs.Items)
local Presents = require(game.ReplicatedStorage.Configs.Presents)
local Ranks = require(game.ReplicatedStorage.Configs.Ranks)
local Misc = require(game.ReplicatedStorage.Configs.Misc)
local v1 = script.Parent
local v2 = nil
function init() --[[ init | Line: 19 | Upvalues: ClientState (copy), PVPShop_2 (copy), v1 (copy), Items (copy), Presents (copy), Formatter (copy), Ranks (copy), Misc (copy), Tween (copy), v2 (ref), TweenService (copy) ]]
	local v12 = ClientState.GetData()
	for k, v in pairs(PVPShop_2) do
		local v22, v3
		local v4 = if game.ReplicatedStorage.Gradients:FindFirstChild(v.Gradient) then game.ReplicatedStorage.Gradients[v.Gradient].Color else game.ReplicatedStorage.Gradients.Common.Color
		local v5 = v1.Items.Example:Clone()
		v5.Name = v.Name
		v22 = v.Image or (if Items[v.Name] and Items[v.Name].Image then Items[v.Name].Image elseif Presents.Presents[v.Name] and Presents.Presents[v.Name].Image then Presents.Presents[v.Name].Image else "")
		v5.BorderImage.TowerImage.Image = v22
		v5.Buy.Info.Text = Formatter.FormatCompact(v.Cost)
		v5.BorderImage.UIGradient.Color = v4
		v5.Frame.UIGradient.Color = v4
		v5.Visible = true
		v5.LayoutOrder = k
		v5.Parent = v1.Items
		if v.Unlock then
			local v6 = Ranks[v.Unlock].Name
			v3 = if v12.Rank and v12.Rank[Misc.RankSave] then v12.Rank[Misc.RankSave] else 0
			if v3 < Ranks[v.Unlock].Requirement then
				v5.Locked.Visible = true
				v5.Locked.TextLabel.Text = v6 .. " required!"
			end
		end
		Tween:AddButton(v5.Buy)
		Tween:AddButton(v5, nil, nil, nil, true)
		local function clicked() --[[ clicked | Line: 50 | Upvalues: v2 (ref), k (copy), v (copy), v1 (ref) ]]
			v2 = k
			v1.Main.ConfirmFrame.Message.Text = "Are you sure you want to buy " .. (if v.Message then v.Message else v.Name) .. " for " .. v.Cost .. " trophies?"
			v1.Main.ConfirmFrame.Visible = true
		end
		v5.Buy.MouseButton1Click:Connect(clicked)
		v5.MouseButton1Click:Connect(clicked)
	end
	local v7 = if v12.Rank[Misc.RankSave] then v12.Rank[Misc.RankSave] else 0
	local v8 = (1 / 0)
	local v9 = nil
	for k, v in pairs(Ranks) do
		if v.Requirement < v8 and v7 < v.Requirement then
			v8 = v.Requirement
			v9 = k
		end
	end
	local v10 = Misc.GetRank(v7)
	local v11 = Ranks[v9].Requirement - Ranks[v10].Requirement
	local v122 = v7 - Ranks[v10].Requirement
	v1.Exp.Bar.Progress.Text = ("%*/%* ELO"):format(v122, v11)
	local v13 = v122 / v11
	if v13 > 1 then
		v13 = 1
	end
	TweenService:Create(v1.Exp.Bar.Move, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		Size = UDim2.new(v13, 0, 1, 0)
	}):Play()
end
v1.Main.ConfirmFrame.Yes.MouseButton1Click:Connect(function() --[[ Line: 83 | Upvalues: PVPShop (copy), v2 (ref), v1 (copy) ]]
	PVPShop:FireServer(v2)
	v1.Main.ConfirmFrame.Visible = false
end)
v1.Main.ConfirmFrame.No.MouseButton1Click:Connect(function() --[[ Line: 88 | Upvalues: v2 (ref), v1 (copy) ]]
	v2 = nil
	v1.Main.ConfirmFrame.Visible = false
end)
v1:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 93 | Upvalues: v1 (copy), v2 (ref) ]]
	if v1.Visible then
		return
	end
	v2 = nil
	v1.Main.ConfirmFrame.Visible = false
end)
PVPShop.OnClientEvent:Connect(function() --[[ Line: 100 | Upvalues: v1 (copy), Tween (copy) ]]
	if script.Parent.Parent.Parent:WaitForChild("Trade"):WaitForChild("TradeFrame").Visible then
		return
	end
	if not v1.Visible then
		Tween:AddButton("Open", v1)
	end
end)
function update() --[[ update | Line: 106 | Upvalues: ClientState (copy), v1 (copy), Formatter (copy), Misc (copy), Ranks (copy) ]]
	local v12 = ClientState.GetData()
	v1.RerollsFrame.TextLabel.Text = Formatter.FormatCompact(v12.Trophies)
	v1.Rank.ShowRank.Text = ("(%*)"):format(v12.Rank[Misc.RankSave] or 0)
	v1.Rank.RankImage.Image = Ranks[Misc.GetRank(v12.Rank[Misc.RankSave])].Image
end
v1.Rank.RankImage.Click.MouseEnter:Connect(function() --[[ Line: 119 | Upvalues: v1 (copy) ]]
	v1.Rank.ShowRank.Visible = true
end)
v1.Rank.RankImage.Click.MouseLeave:Connect(function() --[[ Line: 122 | Upvalues: v1 (copy) ]]
	v1.Rank.ShowRank.Visible = false
end)
task.spawn(init)
Tween:AddButton(v1.Exit, v1)
Tween:AddButton(v1.Main.ConfirmFrame.Yes)
Tween:AddButton(v1.Main.ConfirmFrame.No)
game.ReplicatedStorage.Remotes.PlayerData.UpdateData.OnClientEvent:Connect(update)