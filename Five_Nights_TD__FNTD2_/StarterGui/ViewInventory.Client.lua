-- https://lua.expert/
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local ClientState = require(ReplicatedStorage.Modules.PlayerData.ClientState)
local Tween = require(ReplicatedStorage.Libs.Tween)
local Towers = require(ReplicatedStorage.Configs.Towers)
local MainFrame = script.Parent.MainFrame
function show(p1) --[[ show | Line: 13 | Upvalues: ClientState (copy), Towers (copy), Tween (copy), MainFrame (copy), ReplicatedStorage (copy) ]]
	local v1 = ClientState.GetData().Towers[p1]
	if not v1 then
		return
	end
	local v2 = v1.Name
	local v3 = Towers.Towers[v2]
	if not v3 then
		return
	end
	Tween:AddButton("Open", MainFrame)
	local Rarity = v3.Rarity
	local v4 = if ReplicatedStorage.Gradients:FindFirstChild(Rarity) then ReplicatedStorage.Gradients[Rarity].Color else ReplicatedStorage.Gradients.Common.Color
	MainFrame.TowerName.Text = v2
	MainFrame.Rarity.Text = Rarity
	MainFrame.Rarity.UIGradient.Color = v4
	MainFrame.TowerImage.Image = v3.Image
	if v3.Lore then
		MainFrame.Lore.Holder.Message.Text = v3.Lore
		MainFrame.Lore.Visible = true
	else
		MainFrame.Lore.Visible = false
	end
	if v3.Info then
		MainFrame.Info.Holder.Message.Text = v3.Info
		MainFrame.Info.Visible = true
	else
		MainFrame.Info.Visible = false
	end
	local v5 = if v3.TowerStats and v3.TowerStats.Damage then v3.TowerStats.Damage else v3.Damage
	local v6 = if v3.TowerStats and v3.TowerStats.Range then v3.TowerStats.Range else v3.Range
	local v7 = if v3.TowerStats and v3.TowerStats.Cooldown then v3.TowerStats.Cooldown else v3.Cooldown
	MainFrame.Stats.Holder.Damage.Text = "DAMAGE: " .. v5
	MainFrame.Stats.Holder.Range.Text = "RANGE: " .. v6
	MainFrame.Stats.Holder.Speed.Text = "COOLDOWN: " .. v7
end
local t = {}
MainFrame:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 56 | Upvalues: MainFrame (copy), t (ref) ]]
	if MainFrame.Visible then
		for k, v in pairs(script.Parent.Parent:GetChildren()) do
			if v:IsA("ScreenGui") and (v ~= script.Parent and v.Enabled) then
				v.Enabled = false
				t[v] = v
			end
		end
	else
		for k, v in pairs(t) do
			v.Enabled = true
		end
		t = {}
	end
end)
MainFrame.Exit.MouseButton1Click:Connect(function() --[[ Line: 71 | Upvalues: Tween (copy) ]]
	Tween:AddButton("Open", script.Parent.Parent.Inventory.InventoryFrame)
end)
ReplicatedStorage.Remotes.Towers.ShowInfo.Event:Connect(show)
ReplicatedStorage.Remotes.Towers.MetaData.OnClientEvent:Connect(function(p1) --[[ Line: 77 | Upvalues: Towers (copy) ]]
	if not p1 then
		return
	end
	if pcall(function() --[[ Line: 79 | Upvalues: p1 (ref), Towers (ref) ]]
		p1 = game:GetService("HttpService"):JSONDecode(p1)
		if p1 then
			Towers.Towers = p1
			return
		end
		error(0)
	end) then
		return
	end
	warn("Failed to update Client MetaData.")
end)
Tween:AddButton(MainFrame.Exit)