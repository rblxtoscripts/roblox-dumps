-- https://lua.expert/
local LocalPlayer = game.Players.LocalPlayer
local Evolve = game.ReplicatedStorage.Remotes.Misc.Evolve
local Towers = require(game.ReplicatedStorage.Configs.Towers)
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local ClientState = require(game.ReplicatedStorage.Modules.PlayerData.ClientState)
require(game.ReplicatedStorage.Modules.Misc.Enchants)
local Crafting = require(game.ReplicatedStorage.Configs.Crafting)
local Items = require(game.ReplicatedStorage.Configs.Items)
local Presents = require(game.ReplicatedStorage.Configs.Presents)
local Formatter = require(game.ReplicatedStorage.Libs.Formatter)
local MainFrame = script.Parent.MainFrame
function updateTowerSlot(p1) --[[ updateTowerSlot | Line: 15 | Upvalues: MainFrame (copy), Tween (copy), ClientState (copy), Towers (copy) ]]
	if p1 == 1 then
		return
	end
	if p1 == "Empty" then
		MainFrame.TowerSlot.BorderImage.TowerImage.Visible = false
		MainFrame.TowerSlot.BorderImage.UIGradient.Enabled = false
		MainFrame.TowerSlot.Frame.UIGradient.Enabled = false
		MainFrame.TowerName.Text = "None"
		MainFrame.TowerSlot.BorderImage.Plus.Visible = true
		for k, v in pairs(MainFrame.Items:GetChildren()) do
			if v:IsA("ImageButton") and v.Name ~= "Example" then
				v:Destroy()
			end
		end
	else
		Tween:AddButton("Open", MainFrame)
		local v1 = ClientState.GetData().Towers[p1]
		if not v1 then
			return
		end
		local v2 = Towers.Towers[v1.Name]
		if not v2 then
			return
		end
		MainFrame.TowerID.Value = p1
		local v3 = if v1.Shiny then game.ReplicatedStorage.Gradients.Shiny.Color elseif game.ReplicatedStorage.Gradients:FindFirstChild(v2.Rarity) then game.ReplicatedStorage.Gradients[v2.Rarity].Color else game.ReplicatedStorage.Gradients.Common.Color
		if v1.Enchant and (#v1.Enchant > 2 and game.ReplicatedStorage.Objects.Enchants:FindFirstChild(v1.Enchant)) then
			local Color = game.ReplicatedStorage.Objects.Enchants[v1.Enchant].UIGradient.Color
		else
			local Color = game.ReplicatedStorage.Gradients.Common.Color
		end
		MainFrame.TowerSlot.BorderImage.TowerImage.Visible = true
		MainFrame.TowerSlot.BorderImage.Plus.Visible = false
		MainFrame.TowerSlot.BorderImage.TowerImage.Image = v2.Image or ""
		MainFrame.TowerName.Text = v1.Name
		MainFrame.TowerSlot.BorderImage.UIGradient.Color = v3
		MainFrame.TowerSlot.Frame.UIGradient.Color = v3
		MainFrame.TowerSlot.BorderImage.UIGradient.Enabled = true
		MainFrame.TowerSlot.Frame.UIGradient.Enabled = true
		updateItems(p1)
	end
end
function updateItems(p1) --[[ updateItems | Line: 58 | Upvalues: ClientState (copy), Crafting (copy), MainFrame (copy), Towers (copy), Formatter (copy), Items (copy), Presents (copy) ]]
	local v1 = ClientState.GetData()
	local v2 = v1.Towers[p1]
	if not v2 then
		return
	end
	if not Crafting[v2.Name] then
		return
	end
	for k, v in pairs(MainFrame.Items:GetChildren()) do
		if v:IsA("ImageButton") and v.Name ~= "Example" then
			v:Destroy()
		end
	end
	for k, v in pairs(Crafting[v2.Name]) do
		local v3, v4
		if k ~= "Reward" then
			local v5 = if v1.Items[k] then v1.Items[k] else 0
			if v5 == 0 and v1.Presents[k] then
				v5 = v1.Presents[k]
			elseif v5 == 0 and Towers.Towers[k] then
				local count = 0
				for k2, v6 in pairs(v1.Towers) do
					if v6.Name == k and not (v6.Shiny or v6.Locked) then
						count = count + 1
					end
				end
				v5 = count
			elseif v5 == 0 and v1[k] then
				v5 = v1[k]
			end
			local v6 = MainFrame.Items.Example:Clone()
			v6.Name = k
			local v7 = if v5 >= 1000 then Formatter.FormatCompact(v5) else math.floor(v5)
			v6.Amount.Text = v7 .. "/" .. (if v >= 1000 then Formatter.FormatCompact(v) else math.floor(v))
			v3 = if Items[k] and Items[k].Image then Items[k].Image else ""
			if v3 == "" and (Presents.Presents[k] and Presents.Presents[k].Image) then
				v3 = Presents.Presents[k].Image
			elseif v3 == "" and Towers.Towers[k] then
				v3 = Towers.Towers[k].Image
			elseif v3 == "" and k == "Greek Tokens" then
				v3 = "rbxassetid://116553408357682"
			elseif v3 == "" and k == "Death Tokens" then
				v3 = "rbxassetid://120491123001721"
			elseif v3 == "" and k == "NewSummer Tokens" then
				v3 = "rbxassetid://85934354030411"
			elseif v3 == "" and k == "Tokens" then
				v3 = "rbxassetid://16777953884"
			end
			v6.BorderImage.TowerImage.Image = v3
			v4 = if Items[k] and Items[k].Rarity then Items[k].Rarity else "Common"
			if v4 == "Common" and Presents.Presents[k] then
				v4 = Presents.Presents[k].Rarity
			elseif v4 == "Common" and Towers.Towers[k] then
				v4 = Towers.Towers[k].Rarity
			end
			v6.BorderImage.UIGradient.Color = if game.ReplicatedStorage.Gradients:FindFirstChild(v4) then game.ReplicatedStorage.Gradients[v4].Color else game.ReplicatedStorage.Gradients.Common.Color
			v6.Visible = true
			v6.Parent = MainFrame.Items
		end
	end
end
MainFrame.TowerSlot.MouseButton1Click:Connect(function() --[[ Line: 133 | Upvalues: Evolve (copy), LocalPlayer (copy) ]]
	Evolve.Bindable:Fire(1)
	if LocalPlayer:FindFirstChild("EvolveTower") then
		return
	end
	local EvolveTower = Instance.new("StringValue")
	EvolveTower.Name = "EvolveTower"
	EvolveTower.Parent = LocalPlayer
end)
MainFrame.Evolve.MouseButton1Click:Connect(function() --[[ Line: 142 | Upvalues: ClientState (copy), MainFrame (copy), Crafting (copy), Towers (copy) ]]
	local v1 = ClientState.GetData()
	local v2 = v1.Towers[MainFrame.TowerID.Value]
	if not v2 then
		return
	end
	for k, v in pairs(Crafting[v2.Name]) do
		if k ~= "Reward" then
			local v3 = if v1.Items[k] then v1.Items[k] else 0
			if v3 == 0 and v1.Presents[k] then
				v3 = v1.Presents[k]
			elseif v3 == 0 and Towers.Towers[k] then
				local count = 0
				for k2, v4 in pairs(v1.Towers) do
					if v4.Name == k and not (v4.Shiny or v4.Locked) then
						count = count + 1
					end
				end
				v3 = count
			elseif v3 == 0 and v1[k] then
				v3 = v1[k]
			end
			if v3 < v then
				game.ReplicatedStorage.Remotes.Misc.Alert.Bindable:Fire("You don\'t have enough " .. k .. "!")
				return
			end
		end
	end
	MainFrame.ConfirmFrame.Visible = true
end)
local v1 = false
MainFrame.ConfirmFrame:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 177 | Upvalues: v1 (ref) ]]
	v1 = true
	task.wait(0.8)
	v1 = false
end)
MainFrame.ConfirmFrame.Yes.MouseButton1Click:Connect(function() --[[ Line: 182 | Upvalues: v1 (ref), MainFrame (copy), Evolve (copy) ]]
	if v1 then
		return
	end
	MainFrame.ConfirmFrame.Visible = false
	Evolve:FireServer(MainFrame.TowerID.Value)
end)
MainFrame.ConfirmFrame.No.MouseButton1Click:Connect(function() --[[ Line: 188 | Upvalues: MainFrame (copy) ]]
	MainFrame.ConfirmFrame.Visible = false
end)
game.ReplicatedStorage.Remotes.Misc.EvolveTouch.OnClientEvent:Connect(function() --[[ Line: 192 | Upvalues: MainFrame (copy), Tween (copy) ]]
	if script.Parent.Parent:WaitForChild("Trade"):WaitForChild("TradeFrame").Visible then
		return
	end
	if not MainFrame.Visible then
		Tween:AddButton("Open", MainFrame)
	end
end)
Evolve.OnClientEvent:Connect(function() --[[ Line: 198 ]]
	updateTowerSlot("Empty")
end)
Evolve.Bindable.Event:Connect(updateTowerSlot)
Tween:AddButton(MainFrame.Exit, MainFrame)
Tween:AddButton(MainFrame.TowerSlot)
Tween:AddButton(MainFrame.Evolve)
Tween:AddButton(MainFrame.ConfirmFrame.Yes)
Tween:AddButton(MainFrame.ConfirmFrame.No)