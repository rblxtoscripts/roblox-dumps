-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = game.Players.LocalPlayer
local UnitManager = game.ReplicatedStorage.Remotes.Misc.UnitManager
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local Towers = require(game.ReplicatedStorage.Configs.Towers)
local Misc = require(game.ReplicatedStorage.Configs.Misc)
local Enchants = require(game.ReplicatedStorage.Modules.Enchants)
local Main = script.Parent.MainFrame.Main
local UnitManager_2 = script.Parent.Parent:WaitForChild("Placement"):WaitForChild("UnitManager")
local Position = Main.Position
local Rarities = Misc.Rarities
local v1 = false
local t = {}
function update() --[[ update | Line: 21 | Upvalues: v1 (ref), Main (copy), t (copy), LocalPlayer (copy), Towers (copy), Rarities (copy), Tween (copy), UnitManager (copy), Enchants (copy) ]]
	if v1 then
		return
	end
	v1 = true
	local v12 = workspace.Towers:GetChildren()
	for k, v in pairs(Main.Items:GetChildren()) do
		if v:IsA("ImageButton") and (v.Name ~= "Example" and not (v.Tower.Value and v.Tower.Value.Parent)) then
			v:Destroy()
		end
	end
	for k, v in pairs(t) do
		if not (v and v.Parent) then
			table.remove(t, table.find(t, v))
		end
	end
	local tbl = {}
	for k, v in pairs(v12) do
		if tostring(LocalPlayer.UserId) == tostring(v:GetAttribute("Owner")) and not table.find(t, v) then
			table.insert(tbl, v)
			table.insert(t, v)
		end
	end
	for k, v in pairs(tbl) do
		local v3 = Main.Items.Example:Clone()
		v3.Name = v.Name
		v3.Tower.Value = v
		local v4 = Towers.Towers[v.Name]
		v3.BorderImage.TowerImage.Image = v4.Image
		v3.LayoutOrder = if table.find(Rarities, v4.Rarity) then -table.find(Rarities, v4.Rarity) * 100 else 0
		if v3.BorderImage:FindFirstChild("BorderGradient") then
			v3.BorderImage.BorderGradient:Destroy()
		end
		if v:GetAttribute("Shiny") then
			local BorderGradient = game.ReplicatedStorage.Objects.Gradients.Shiny:Clone()
			BorderGradient.Name = "BorderGradient"
			BorderGradient.Parent = v3.BorderImage
		else
			local Rarity = v4.Rarity
			local BorderGradient = if Rarity and game.ReplicatedStorage.Objects.Gradients:FindFirstChild(Rarity) then game.ReplicatedStorage.Objects.Gradients[Rarity]:Clone() else game.ReplicatedStorage.Objects.Gradients.Common:Clone()
			BorderGradient.Name = "BorderGradient"
			BorderGradient.Parent = v3.BorderImage
		end
		v3.Visible = true
		v3.Parent = Main.Items
		Tween:AddButton(v3, nil, nil, nil, true)
		Tween:AddButton(v3.Delete)
		Tween:AddButton(v3.Upgrade)
		v3.MouseButton1Click:Connect(function() --[[ Line: 76 | Upvalues: UnitManager (ref), v (copy) ]]
			UnitManager:Fire(v)
		end)
		v3.Delete.MouseButton1Click:Connect(function() --[[ Line: 79 | Upvalues: UnitManager (ref), v (copy) ]]
			UnitManager:Fire(v, "Sell")
		end)
		v3.Upgrade.MouseButton1Click:Connect(function() --[[ Line: 82 | Upvalues: UnitManager (ref), v (copy) ]]
			UnitManager:Fire(v, "Upgrade")
		end)
	end
	for k, v in pairs(Main.Items:GetChildren()) do
		if v:IsA("ImageButton") and v.Name ~= "Example" then
			local v6 = Towers.Towers[v.Name].Upgrades[v.Tower.Value:GetAttribute("Upgrade") + 2]
			if v6 then
				if math.round(v6.Price * Enchants.GetStatMulti(LocalPlayer, v.Tower.Value, "Cost", "NOTID")) <= LocalPlayer.Money.Value then
					v.Upgrade.Claim.Enabled = true
					v.Upgrade.NoReq.Enabled = false
					v.Upgrade.Info.Claim.Enabled = true
					v.Upgrade.Info.NoReq.Enabled = false
					v.Upgrade.Info.Text = "UPGRADE"
					continue
				end
				v.Upgrade.Claim.Enabled = false
				v.Upgrade.NoReq.Enabled = true
				v.Upgrade.Info.Claim.Enabled = false
				v.Upgrade.Info.NoReq.Enabled = true
				v.Upgrade.Info.Text = "UPGRADE"
				continue
			end
			v.Upgrade.Claim.Enabled = false
			v.Upgrade.NoReq.Enabled = true
			v.Upgrade.Info.Claim.Enabled = false
			v.Upgrade.Info.NoReq.Enabled = true
			v.Upgrade.Info.Text = "MAX"
		end
	end
	v1 = false
end
local v2 = false
function open() --[[ open | Line: 120 | Upvalues: v2 (ref), Main (copy), Position (copy), TweenService (copy) ]]
	v2 = true
	Main.Position = Position + UDim2.new(0.5, 0, 0, 0)
	Main.Parent.Visible = true
	TweenService:Create(Main, TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		Position = Position
	}):Play()
end
function close() --[[ close | Line: 127 | Upvalues: v2 (ref), Main (copy), Position (copy), TweenService (copy) ]]
	v2 = false
	Main.Position = Position
	local v1 = TweenService:Create(Main, TweenInfo.new(0.1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		Position = Position + UDim2.new(0.5, 0, 0, 0)
	})
	v1:Play()
	v1.Completed:Wait()
	Main.Parent.Visible = false
end
UnitManager_2.MouseButton1Click:Connect(function() --[[ Line: 136 | Upvalues: v2 (ref) ]]
	if v2 then
		close()
	else
		open()
	end
end)
Main.Exit.MouseButton1Click:Connect(function() --[[ Line: 143 ]]
	close()
end)
Main.SellAll.MouseButton1Click:Connect(function() --[[ Line: 147 | Upvalues: Main (copy) ]]
	Main.ConfirmFrame.Visible = true
end)
Main.ConfirmFrame.Yes.MouseButton1Click:Connect(function() --[[ Line: 151 | Upvalues: Main (copy), UnitManager (copy) ]]
	Main.ConfirmFrame.Visible = false
	for k, v in pairs(Main.Items:GetChildren()) do
		if v:IsA("ImageButton") and v.Name ~= "Example" then
			UnitManager:Fire(v.Tower.Value, "Sell")
		end
	end
end)
Main.ConfirmFrame.No.MouseButton1Click:Connect(function() --[[ Line: 158 | Upvalues: Main (copy) ]]
	Main.ConfirmFrame.Visible = false
end)
local v3 = false
UserInputService.InputBegan:Connect(function(p1, p2) --[[ Line: 163 | Upvalues: v3 (ref), v2 (ref) ]]
	if p2 then
		return
	end
	if v3 then
		return
	end
	v3 = true
	if p1.KeyCode ~= Enum.KeyCode.F then
		v3 = false
		return
	end
	if v2 then
		close()
	else
		open()
	end
	v3 = false
end)
Main.Position = Position + UDim2.new(0.5, 0, 0, 0)
Tween:AddButton(UnitManager_2)
Tween:AddButton(Main.Exit)
Tween:AddButton(Main.SellAll)
Tween:AddButton(Main.ConfirmFrame.Yes)
Tween:AddButton(Main.ConfirmFrame.No)
workspace.Towers.ChildAdded:Connect(update)
workspace.Towers.ChildRemoved:Connect(update)
UnitManager.Event:Connect(function(p1) --[[ Line: 190 ]]
	if p1 then
		return
	end
	update()
end)
LocalPlayer:WaitForChild("Money", 99).Changed:Connect(update)