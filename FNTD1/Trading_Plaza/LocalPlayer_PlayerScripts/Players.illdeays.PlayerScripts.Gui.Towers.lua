-- https://lua.expert/
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
game:GetService("TweenService")
game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local ClientState = require(ReplicatedStorage.Modules.PlayerData.ClientState)
local Tween = require(ReplicatedStorage.Libs.Tween)
local Towers = require(ReplicatedStorage.Configs.Towers)
local TowersModule = require(ReplicatedStorage.Modules.Towers.TowersModule)
local Enchants = require(ReplicatedStorage.Modules.Misc.Enchants)
local Formatter = require(ReplicatedStorage.Libs.Formatter)
local Crafting = require(ReplicatedStorage.Configs.Crafting)
local Misc = require(ReplicatedStorage.Configs.Misc)
local Presents = require(ReplicatedStorage.Configs.Presents)
local StatRerolls = require(ReplicatedStorage.Modules.Misc.StatRerolls)
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Inventory = PlayerGui:WaitForChild("Inventory")
local SideDock = PlayerGui:WaitForChild("SideDock")
local InventoryFrame = Inventory:WaitForChild("InventoryFrame")
local Container = SideDock:WaitForChild("Container")
local HolderFrame = InventoryFrame:WaitForChild("HolderFrame")
local InventoryButton = Container:WaitForChild("InventoryButton")
local Units = HolderFrame:WaitForChild("Units")
local TowerStats = InventoryFrame:WaitForChild("TowerStats")
local Template = script:WaitForChild("Template")
local v1 = LocalPlayer:GetMouse()
local Towers_2 = ReplicatedStorage.Remotes.Towers
local v2 = nil
local v3 = 0
local v4 = false
local t = {}
local t2 = {}
local t3 = {}
local Rarities = Misc.Rarities
local t4 = {}
local function hasEnchant(p1) --[[ hasEnchant | Line: 46 ]]
	if p1 and typeof(p1) == "string" then
		return p1 and #p1 > 1 and true or false
	else
		return false
	end
end
local function update(p1, p2) --[[ update | Line: 56 | Upvalues: ClientState (copy), UserInputService (copy), v1 (copy), InventoryFrame (copy), Towers (copy), v2 (ref), TowerStats (copy), t4 (copy), ReplicatedStorage (copy), Formatter (copy), t3 (ref), Units (copy), Misc (copy), Enchants (copy), LocalPlayer (copy) ]]
	local v12 = ClientState.GetData().Towers[p1]
	if not v12 then
		return
	end
	local v22 = v12.Name
	local v3 = if v12.Shiny then "Shiny " else ""
	local v4 = if UserInputService.MouseEnabled then (Vector2.new(v1.X, v1.Y) - InventoryFrame.AbsolutePosition) / InventoryFrame.AbsoluteSize else nil
	local v5 = Towers.Towers[v22]
	if v2 == p1 then
		TowerStats.Visible = false
		v2 = nil
		return
	end
	TowerStats.Visible = true
	v2 = p1
	task.spawn(function() --[[ Line: 80 | Upvalues: v2 (ref), t4 (ref), v3 (copy), v22 (copy), TowerStats (ref), ReplicatedStorage (ref), Formatter (ref) ]]
		if not t4[v3 .. v22] then
			TowerStats.Frame.Exists.Text = "Exists: N/A"
		end
		local v23 = ReplicatedStorage.Remotes.Misc.GetExists:InvokeServer(v3 .. v22)
		t4[v3 .. v22] = v23
		if v2 ~= v2 then
			return
		end
		if v23 > 0 then
			TowerStats.Frame.Exists.Text = Formatter.FormatCompact(v23) .. " Exists"
			return
		end
		TowerStats.Frame.Exists.Text = "Exists: N/A"
	end)
	local v6 = if t4[v3 .. v22] then t4[v3 .. v22] else 0
	if v6 > 0 then
		TowerStats.Frame.Exists.Text = Formatter.FormatCompact(v6) .. " Exists"
	else
		TowerStats.Frame.Exists.Text = "Exists: N/A"
	end
	if v12.Locked then
		TowerStats.Frame.Lock.ImageColor3 = Color3.fromRGB(255, 203, 46)
		TowerStats.Frame.Lock.ImageLabel.Image = "rbxassetid://129873382316985"
	else
		TowerStats.Frame.Lock.ImageColor3 = Color3.fromRGB(118, 93, 139)
		TowerStats.Frame.Lock.ImageLabel.Image = "rbxassetid://138428323187185"
	end
	if v5.Passive then
		TowerStats.Frame.Passive.Visible = true
	else
		TowerStats.Frame.Passive.Visible = false
	end
	if v12.Stats then
		TowerStats.Frame.Stats.Visible = true
	else
		TowerStats.Frame.Stats.Visible = false
	end
	TowerStats.Frame.PassiveFrame.Visible = false
	TowerStats.Frame.StatFrame.Visible = false
	if p2 then
		local v7 = t3[p1]
		if UserInputService.MouseEnabled then
			if not v4 then
				v4 = (Vector2.new(v1.X, v1.Y) - InventoryFrame.AbsolutePosition) / InventoryFrame.AbsoluteSize
			end
			TowerStats.Position = UDim2.fromScale(v4.X, v4.Y)
		else
			local v8 = UDim2.new(0, v7.AbsolutePosition.X, 0, v7.AbsolutePosition.Y, 0)
			TowerStats.Position = if v7 then v8 - UDim2.new(0, InventoryFrame.AbsolutePosition.X, 0, InventoryFrame.AbsolutePosition.Y) else InventoryFrame.Position
		end
		local v11 = nil
		v11 = Units:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 136 | Upvalues: TowerStats (ref), v11 (ref) ]]
			TowerStats.Visible = false
			v11:Disconnect()
		end)
	end
	local TowerName = TowerStats.Frame.TowerName
	TowerName.Text = if v12.Shiny then "Shiny " .. v22 else v22
	TowerStats.Frame.Rarity.Text = v5.Rarity
	TowerStats.Frame.Rarity:ClearAllChildren()
	ReplicatedStorage.Gradients[v5.Rarity]:Clone().Parent = TowerStats.Frame.Rarity
	local v13 = if v5.TowerStats and v5.TowerStats.Damage then v5.TowerStats.Damage else v5.Damage
	local v14 = if v5.TowerStats and v5.TowerStats.Range then v5.TowerStats.Range else v5.Range
	local v15 = if v5.TowerStats and v5.TowerStats.Cooldown then v5.TowerStats.Cooldown else v5.Cooldown
	local v16 = if v5.TowerStats and v5.TowerStats.DamageBoost then v5.TowerStats.DamageBoost else nil
	local v17 = if v5.TowerStats and v5.TowerStats.RangeBoost then v5.TowerStats.RangeBoost else nil
	local v18 = if v5.TowerStats and v5.TowerStats.CooldownBoost then v5.TowerStats.CooldownBoost else nil
	local v19 = if v5.TowerStats and v5.TowerStats.Farm then v5.TowerStats.Farm else nil
	local v21 = if v12.Shiny then " " .. (if Misc.SpecialShinyBooster[v22] then Misc.SpecialShinyBooster[v22] else "(+25%)") else ""
	if v22 == "Rockstar Foxy" then
		v17 = nil
	elseif v22 == "Popstar Chica" then
		v16 = nil
	elseif v22 == "Wet Floor Bot" then
		v18 = nil
	elseif v22 == "Stardrop" then
		v17 = nil
	elseif v22 == "Hermes Puppeteer" then
		v18 = nil
	elseif v22 == "Soulmate Puppet" then
		v17 = nil
	end
	if v17 then
		TowerStats.Frame.Damage.TextColor3 = Color3.fromRGB(76, 207, 255)
	elseif v18 then
		TowerStats.Frame.Damage.TextColor3 = Color3.fromRGB(255, 241, 84)
	else
		TowerStats.Frame.Damage.TextColor3 = Color3.fromRGB(255, 0, 0)
	end
	TowerStats.Frame.Type.Text = "Type: " .. v5.Type
	local count = 0
	for k, v in pairs({ v16, v17, v18 }) do
		count = count + 1
	end
	if count >= 2 then
		TowerStats.Frame.Damage.Text = (if count == 2 then "Dual Boost: " else "Triple Boost: ") .. (if v16 then v16 .. ", " else "") .. (if v17 then v17 .. ", " else "") .. (v18 or "") .. v21
	elseif v16 then
		TowerStats.Frame.Damage.Text = "Damage Boost: x" .. v16 .. v21
	elseif v17 then
		TowerStats.Frame.Damage.Text = "Range Boost: x" .. v17 .. v21
	elseif v18 then
		TowerStats.Frame.Damage.Text = "Cooldown Boost: x" .. v18 .. v21
	elseif v19 then
		TowerStats.Frame.Damage.Text = "Farm: +" .. v19
	else
		TowerStats.Frame.Damage.Text = "Damage: " .. v13 .. Enchants.GetStatMulti(LocalPlayer, p1, "Damage", true) .. v21
	end
	TowerStats.Frame.Range.Text = "Range: " .. v14 .. Enchants.GetStatMulti(LocalPlayer, p1, "Range", true)
	TowerStats.Frame.Cooldown.Text = "Cooldown: " .. v15 .. Enchants.GetStatMulti(LocalPlayer, p1, "Speed", true)
	local TextLabel = TowerStats.Frame.Equip.TextLabel
	TextLabel.Text = if v12.Equipped then "Unequip" else "Equip"
end
local function clearInv() --[[ clearInv | Line: 206 | Upvalues: t3 (ref), Units (copy) ]]
	t3 = {}
	for v1, v2 in Units:GetChildren() do
		if v2:IsA("ImageButton") then
			v2:Destroy()
		end
	end
end
local t5 = {}
local function onClickInvFrame(p1, p2) --[[ onClickInvFrame | Line: 216 | Upvalues: InventoryFrame (copy), v4 (ref), t (ref), LocalPlayer (copy), ReplicatedStorage (copy), t2 (ref), Units (copy), update (copy), t5 (copy) ]]
	t5[p1] = p1.Activated:Connect(function() --[[ Line: 218 | Upvalues: InventoryFrame (ref), v4 (ref), p1 (copy), t (ref), p2 (copy), LocalPlayer (ref), ReplicatedStorage (ref), t2 (ref), Units (ref), update (ref) ]]
		if InventoryFrame.DeleteFrame.Visible then
			return
		end
		if InventoryFrame.ConfirmFrame.Visible then
			return
		end
		if v4 then
			if p1.Locked.Visible then
				return
			end
			if table.find(t, p2) then
				table.remove(t, table.find(t, p2))
				p1.Delete.Visible = false
			else
				table.insert(t, p2)
				p1.Delete.Visible = true
			end
			updateMassDelete()
			return
		end
		if LocalPlayer:FindFirstChild("EvolveTower") then
			InventoryFrame.Items.Visible = true
			InventoryFrame.Shop.Visible = true
			InventoryFrame.Units.Visible = true
			InventoryFrame.EnchantText.Visible = false
			InventoryFrame.RerollText.Visible = false
			InventoryFrame.EvolveText.Visible = true
			InventoryFrame.Search.Visible = true
			InventoryFrame.ItemText.Visible = false
			InventoryFrame.TradingText.Visible = false
			InventoryFrame.Search.Visible = false
			InventoryFrame.Search.TextBox.Text = ""
			for k, v in pairs(InventoryFrame.Units:GetChildren()) do
				if v:IsA("ImageButton") and v.Name ~= "Example" then
					v.Visible = true
				end
			end
			LocalPlayer.EvolveTower:Destroy()
			ReplicatedStorage.Remotes.Misc.Evolve.Bindable:Fire(p2)
			return
		end
		if LocalPlayer:FindFirstChild("EnchantTower") then
			InventoryFrame.Items.Visible = true
			InventoryFrame.Shop.Visible = true
			InventoryFrame.Units.Visible = true
			InventoryFrame.EnchantText.Visible = false
			InventoryFrame.RerollText.Visible = false
			InventoryFrame.EvolveText.Visible = false
			InventoryFrame.ItemText.Visible = false
			InventoryFrame.TradingText.Visible = false
			LocalPlayer.EnchantTower:Destroy()
			ReplicatedStorage.Remotes.Misc.Enchant.Bindable:Fire(p2)
			return
		end
		if LocalPlayer:FindFirstChild("StatTower") then
			InventoryFrame.Items.Visible = true
			InventoryFrame.Shop.Visible = true
			InventoryFrame.Units.Visible = true
			InventoryFrame.EnchantText.Visible = false
			InventoryFrame.RerollText.Visible = false
			InventoryFrame.EvolveText.Visible = false
			InventoryFrame.ItemText.Visible = false
			InventoryFrame.TradingText.Visible = false
			LocalPlayer.StatTower:Destroy()
			ReplicatedStorage.Remotes.Misc.StatReroll.Bindable:Fire(p2)
			return
		end
		if LocalPlayer:FindFirstChild("UsingItem") then
			InventoryFrame.Items.Visible = true
			InventoryFrame.Shop.Visible = true
			InventoryFrame.Units.Visible = true
			InventoryFrame.EnchantText.Visible = false
			InventoryFrame.RerollText.Visible = false
			InventoryFrame.EvolveText.Visible = false
			InventoryFrame.ItemText.Visible = false
			InventoryFrame.TradingText.Visible = false
			InventoryFrame.UnequipAll.Visible = true
			InventoryFrame.Teams.Visible = true
			InventoryFrame.Search.Visible = true
			for k, v in pairs(t2) do
				v.Visible = true
			end
			t2 = {}
			LocalPlayer.UsingItem:Destroy()
			ReplicatedStorage.Remotes.Misc.UseItem.Bindable:Fire(p2, LocalPlayer.UsingItem.Value)
			return
		end
		if LocalPlayer:FindFirstChild("TradingItem") then
			if #Units:GetChildren() == 2 then
				ReplicatedStorage.Remotes.Misc.Alert.Bindable:Fire("You can\'t trade your only unit!")
			else
				LocalPlayer.TradingItem.Value = p2
				InventoryFrame.TradeAmount.Visible = true
			end
			return
		end
		task.spawn(update, p2, true)
	end)
end
function trueCheckEquipped(p1) --[[ trueCheckEquipped | Line: 305 | Upvalues: ClientState (copy) ]]
	local v1 = ClientState.GetData()
	local v2 = v1.Towers[p1]
	local Stats = v2.Stats
	if v2.Equipped then
		return true
	end
	for k, v in pairs(v1.Towers) do
		if v.Name == v2.Name and (not v.Stats and v.Equipped) then
			return true
		end
	end
	return false
end
local function updateInv(p1, p2, p3) --[[ updateInv | Line: 322 | Upvalues: ClientState (copy), Units (copy), t3 (ref), Towers (copy), Rarities (copy), clearInv (copy), t5 (copy), onClickInvFrame (copy), ReplicatedStorage (copy), Template (copy), HttpService (copy), Misc (copy), PlayerGui (copy), Tween (copy) ]]
	local v1 = ClientState.GetData()
	if not v1 then
		return
	end
	local Towers_2 = v1.Towers
	local v2 = nil
	if p1 then
		local v3 = if typeof(p1) == "table" or not Units:FindFirstChild(p1) then t3[p1] else Units[p1]
		Towers_2 = {}
		if v3 then
			for k, v in pairs(t3) do
				if v == v3 then
					Towers_2[k] = v1.Towers[k]
				end
			end
			if not p2 then
				v2 = v3.LayoutOrder
			end
			v3:Destroy()
			for k, v in pairs(Units:GetChildren()) do
				local v4, v5
				if v:IsA("ImageButton") then
					local v6 = v1.Towers[v.TowerID.Value]
					if v6 then
						if v.TowerPrice.ImageColor3 == Color3.fromRGB(0, 255, 0) and not (v6.Equipped or trueCheckEquipped(v.TowerID.Value)) then
							local Rarity = Towers.Towers[v6.Name].Rarity
							local v7 = v:GetAttribute("SetLayoutOrder")
							if v7 then
								v4 = v7
							else
								local v8 = if table.find(Rarities, Rarity) then table.find(Rarities, Rarity) else 0
								v4 = (10 - v8) * 1000 + #Units:GetChildren()
							end
							v.LayoutOrder = v4
							v.TowerPrice.ImageColor3 = Color3.fromRGB(255, 0, 0)
							v.TowerPrice.Info.TextColor3 = Color3.fromRGB(255, 0, 0)
							continue
						end
						if v.TowerPrice.ImageColor3 == Color3.fromRGB(255, 0, 0) and v6.Equipped then
							local Rarity = Towers.Towers[v6.Name].Rarity
							local v9 = v:GetAttribute("SetLayoutOrder")
							if v9 then
								v5 = v9
							else
								local v10 = if table.find(Rarities, Rarity) then table.find(Rarities, Rarity) else 0
								v5 = (10 - v10) * 1000 + #Units:GetChildren()
							end
							v.LayoutOrder = v5 - 10000
							v.TowerPrice.ImageColor3 = Color3.fromRGB(0, 255, 0)
							v.TowerPrice.Info.TextColor3 = Color3.fromRGB(0, 255, 0)
						end
					end
				end
			end
		elseif typeof(p1) == "table" then
			for k, v in pairs(p1) do
				Towers_2[v] = v1.Towers[v]
			end
		else
			Towers_2[p1] = v1.Towers[p1]
		end
	else
		pcall(clearInv)
	end
	for v19, v20 in Towers_2 do
		local v11, v12, v13, v14, v15, v16, v17, v18
		local v21 = Towers.Towers[v20.Name]
		if v21 then
			local Rarity = v21.Rarity
			local v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51
			if v20.Shiny then
				if not v20.Stats then
					v22 = v20.Enchant
					v23 = if v22 and typeof(v22) == "string" then if v22 and #v22 > 1 then true else false else false
					if v23 and not v20.Shiny then
						v24 = Units:FindFirstChild(v20.Enchant .. v20.Name)
						t3[v20.ID] = v24
						if v24 then
							v24:SetAttribute("Owned", v24:GetAttribute("Owned") + 1)
							v24.Info.Text = ("x%*"):format((v24:GetAttribute("Owned")))
							v24.Info.Visible = true
							if v20.Equipped then
								if t5[v24] then
									t5[v24]:Disconnect()
									task.defer(onClickInvFrame, v24, v19)
								end
								v25 = v24:GetAttribute("SetLayoutOrder")
								if v25 then
									v11 = v25
								else
									v26 = if table.find(Rarities, Rarity) then table.find(Rarities, Rarity) else 0
									v11 = (10 - v26) * 1000 + #Units:GetChildren()
								end
								v27 = if v20.Equipped then v11 - 10000 else v11
								v24.LayoutOrder = v27
								v28 = v24.TowerPrice
								v29 = if v20.Equipped then Color3.fromRGB(0, 255, 0) else Color3.fromRGB(255, 0, 0)
								v28.ImageColor3 = v29
								v30 = v24.TowerPrice.Info
								v31 = if v20.Equipped then Color3.fromRGB(0, 255, 0) else Color3.fromRGB(255, 0, 0)
								v30.TextColor3 = v31
							end
							continue
						end
					end
					v32 = v20.Enchant
					v33 = if v32 and typeof(v32) == "string" then if v32 and #v32 > 1 then true else false else false
					if v33 and v20.Shiny then
						v34 = Units:FindFirstChild("Shiny" .. v20.Enchant .. v20.Name)
						t3[v20.ID] = v34
						if v34 and v34.Shiny.Visible then
							v34:SetAttribute("Owned", v34:GetAttribute("Owned") + 1)
							v34.Info.Text = ("x%*"):format((v34:GetAttribute("Owned")))
							v34.Info.Visible = true
							if v20.Equipped then
								if t5[v34] then
									t5[v34]:Disconnect()
									task.defer(onClickInvFrame, v34, v19)
								end
								v35 = v34:GetAttribute("SetLayoutOrder")
								if v35 then
									v12 = v35
								else
									v36 = if table.find(Rarities, Rarity) then table.find(Rarities, Rarity) else 0
									v12 = (10 - v36) * 1000 + #Units:GetChildren()
								end
								v37 = if v20.Equipped then v12 - 10000 else v12
								v34.LayoutOrder = v37
								v38 = v34.TowerPrice
								v39 = if v20.Equipped then Color3.fromRGB(0, 255, 0) else Color3.fromRGB(255, 0, 0)
								v38.ImageColor3 = v39
								v40 = v34.TowerPrice.Info
								v41 = if v20.Equipped then Color3.fromRGB(0, 255, 0) else Color3.fromRGB(255, 0, 0)
								v40.TextColor3 = v41
							end
							continue
						end
					end
					v42 = v20.Enchant
					v43 = if v42 and typeof(v42) == "string" then if v42 and #v42 > 1 then true else false else false
					if not v43 and v20.Shiny then
						v44 = Units:FindFirstChild("Shiny" .. v20.Name)
						t3[v20.ID] = v44
						if v44 and v44.Shiny.Visible then
							v44:SetAttribute("Owned", v44:GetAttribute("Owned") + 1)
							v44.Info.Text = ("x%*"):format((v44:GetAttribute("Owned")))
							v44.Info.Visible = true
							if v20.Equipped then
								if t5[v44] then
									t5[v44]:Disconnect()
									task.defer(onClickInvFrame, v44, v19)
								end
								v45 = v44:GetAttribute("SetLayoutOrder")
								if v45 then
									v13 = v45
								else
									v46 = if table.find(Rarities, Rarity) then table.find(Rarities, Rarity) else 0
									v13 = (10 - v46) * 1000 + #Units:GetChildren()
								end
								v47 = if v20.Equipped then v13 - 10000 else v13
								v44.LayoutOrder = v47
								v48 = v44.TowerPrice
								v49 = if v20.Equipped then Color3.fromRGB(0, 255, 0) else Color3.fromRGB(255, 0, 0)
								v48.ImageColor3 = v49
								v50 = v44.TowerPrice.Info
								v51 = if v20.Equipped then Color3.fromRGB(0, 255, 0) else Color3.fromRGB(255, 0, 0)
								v50.TextColor3 = v51
							end
							continue
						end
					end
				end
			else
				local Enchant = v20.Enchant
				if (if Enchant and typeof(Enchant) == "string" then if Enchant and #Enchant > 1 then true else false else false) or v20.Stats then
					if not v20.Stats then
						v22 = v20.Enchant
						v23 = if v22 and typeof(v22) == "string" then if v22 and #v22 > 1 then true else false else false
						if v23 and not v20.Shiny then
							v24 = Units:FindFirstChild(v20.Enchant .. v20.Name)
							t3[v20.ID] = v24
							if v24 then
								v24:SetAttribute("Owned", v24:GetAttribute("Owned") + 1)
								v24.Info.Text = ("x%*"):format((v24:GetAttribute("Owned")))
								v24.Info.Visible = true
								if v20.Equipped then
									if t5[v24] then
										t5[v24]:Disconnect()
										task.defer(onClickInvFrame, v24, v19)
									end
									v25 = v24:GetAttribute("SetLayoutOrder")
									if v25 then
										v11 = v25
									else
										v26 = if table.find(Rarities, Rarity) then table.find(Rarities, Rarity) else 0
										v11 = (10 - v26) * 1000 + #Units:GetChildren()
									end
									v27 = if v20.Equipped then v11 - 10000 else v11
									v24.LayoutOrder = v27
									v28 = v24.TowerPrice
									v29 = if v20.Equipped then Color3.fromRGB(0, 255, 0) else Color3.fromRGB(255, 0, 0)
									v28.ImageColor3 = v29
									v30 = v24.TowerPrice.Info
									v31 = if v20.Equipped then Color3.fromRGB(0, 255, 0) else Color3.fromRGB(255, 0, 0)
									v30.TextColor3 = v31
								end
								continue
							end
						end
						v32 = v20.Enchant
						v33 = if v32 and typeof(v32) == "string" then if v32 and #v32 > 1 then true else false else false
						if v33 and v20.Shiny then
							v34 = Units:FindFirstChild("Shiny" .. v20.Enchant .. v20.Name)
							t3[v20.ID] = v34
							if v34 and v34.Shiny.Visible then
								v34:SetAttribute("Owned", v34:GetAttribute("Owned") + 1)
								v34.Info.Text = ("x%*"):format((v34:GetAttribute("Owned")))
								v34.Info.Visible = true
								if v20.Equipped then
									if t5[v34] then
										t5[v34]:Disconnect()
										task.defer(onClickInvFrame, v34, v19)
									end
									v35 = v34:GetAttribute("SetLayoutOrder")
									if v35 then
										v12 = v35
									else
										v36 = if table.find(Rarities, Rarity) then table.find(Rarities, Rarity) else 0
										v12 = (10 - v36) * 1000 + #Units:GetChildren()
									end
									v37 = if v20.Equipped then v12 - 10000 else v12
									v34.LayoutOrder = v37
									v38 = v34.TowerPrice
									v39 = if v20.Equipped then Color3.fromRGB(0, 255, 0) else Color3.fromRGB(255, 0, 0)
									v38.ImageColor3 = v39
									v40 = v34.TowerPrice.Info
									v41 = if v20.Equipped then Color3.fromRGB(0, 255, 0) else Color3.fromRGB(255, 0, 0)
									v40.TextColor3 = v41
								end
								continue
							end
						end
						v42 = v20.Enchant
						v43 = if v42 and typeof(v42) == "string" then if v42 and #v42 > 1 then true else false else false
						if not v43 and v20.Shiny then
							v44 = Units:FindFirstChild("Shiny" .. v20.Name)
							t3[v20.ID] = v44
							if v44 and v44.Shiny.Visible then
								v44:SetAttribute("Owned", v44:GetAttribute("Owned") + 1)
								v44.Info.Text = ("x%*"):format((v44:GetAttribute("Owned")))
								v44.Info.Visible = true
								if v20.Equipped then
									if t5[v44] then
										t5[v44]:Disconnect()
										task.defer(onClickInvFrame, v44, v19)
									end
									v45 = v44:GetAttribute("SetLayoutOrder")
									if v45 then
										v13 = v45
									else
										v46 = if table.find(Rarities, Rarity) then table.find(Rarities, Rarity) else 0
										v13 = (10 - v46) * 1000 + #Units:GetChildren()
									end
									v47 = if v20.Equipped then v13 - 10000 else v13
									v44.LayoutOrder = v47
									v48 = v44.TowerPrice
									v49 = if v20.Equipped then Color3.fromRGB(0, 255, 0) else Color3.fromRGB(255, 0, 0)
									v48.ImageColor3 = v49
									v50 = v44.TowerPrice.Info
									v51 = if v20.Equipped then Color3.fromRGB(0, 255, 0) else Color3.fromRGB(255, 0, 0)
									v50.TextColor3 = v51
								end
								continue
							end
						end
					end
				else
					local v53 = Units:FindFirstChild(v20.Name)
					t3[v20.ID] = v53
					if v53 and not v53.Shiny.Visible then
						v53:SetAttribute("Owned", v53:GetAttribute("Owned") + 1)
						v53.Info.Text = ("x%*"):format((v53:GetAttribute("Owned")))
						v53.Info.Visible = true
						if v20.Equipped then
							if t5[v53] then
								t5[v53]:Disconnect()
								task.defer(onClickInvFrame, v53, v19)
							end
							local v54 = v53:GetAttribute("SetLayoutOrder")
							if v54 then
								v14 = v54
							else
								local v55 = if table.find(Rarities, Rarity) then table.find(Rarities, Rarity) else 0
								v14 = (10 - v55) * 1000 + #Units:GetChildren()
							end
							v53.LayoutOrder = if v20.Equipped then v14 - 10000 else v14
							v53.TowerPrice.ImageColor3 = if v20.Equipped then Color3.fromRGB(0, 255, 0) else Color3.fromRGB(255, 0, 0)
							v53.TowerPrice.Info.TextColor3 = if v20.Equipped then Color3.fromRGB(0, 255, 0) else Color3.fromRGB(255, 0, 0)
						end
						continue
					end
				end
			end
			v15 = if v20.Shiny then ReplicatedStorage.Gradients.Shiny.Color elseif v21.Rarity and ReplicatedStorage.Gradients:FindFirstChild(v21.Rarity) then ReplicatedStorage.Gradients[v21.Rarity].Color else ReplicatedStorage.Gradients.Common.Color
			if v2 then
				v16 = v2
			else
				local v59 = if table.find(Rarities, Rarity) then table.find(Rarities, Rarity) else 0
				v16 = (10 - v59) * 1000 + #Units:GetChildren()
			end
			local v60 = Template:Clone()
			local Enchant = v20.Enchant
			if (if Enchant and typeof(Enchant) == "string" then if Enchant and #Enchant > 1 then true else false else false) and not v20.Shiny then
				v17 = v20.Enchant .. v20.Name
			else
				local Enchant_2 = v20.Enchant
				v17 = if (if Enchant_2 and typeof(Enchant_2) == "string" then if Enchant_2 and #Enchant_2 > 1 then true else false else false) and v20.Shiny then "Shiny" .. v20.Enchant .. v20.Name elseif v20.Shiny then "Shiny" .. v20.Name else v20.Name
			end
			v60.Name = v17
			if v20.Stats then
				v60.Name = v60.Name .. "_Stats" .. HttpService:GenerateGUID(false)
			end
			v60.LayoutOrder = if v20.Equipped then v16 - 10000 else v16
			v60.TowerPrice.Info.Text = "$ " .. v21.PlacePrice or "$ 0"
			v60.TowerPrice.ImageColor3 = if v20.Equipped then Color3.fromRGB(0, 255, 0) else Color3.fromRGB(255, 0, 0)
			v60.TowerPrice.Info.TextColor3 = if v20.Equipped then Color3.fromRGB(0, 255, 0) else Color3.fromRGB(255, 0, 0)
			v60.BorderImage.TowerImage.Image = v21.Image or ""
			v60.BorderImage.UIGradient.Color = v15
			v60.Frame.UIGradient.Color = v15
			local Enchant_2 = v20.Enchant
			if (if Enchant_2 and typeof(Enchant_2) == "string" then if Enchant_2 and #Enchant_2 > 1 then true else false else false) and not v20.Shiny then
				v18 = v20.Enchant .. v20.Name
			else
				local Enchant_3 = v20.Enchant
				v18 = if (if Enchant_3 and typeof(Enchant_3) == "string" then if Enchant_3 and #Enchant_3 > 1 then true else false else false) and v20.Shiny then "Shiny" .. v20.Enchant .. v20.Name elseif v20.Shiny then "Shiny" .. v20.Name else v20.Name
			end
			v60.TowerName.Value = v18
			v60.TowerID.Value = v20.ID
			v60.Shiny.Visible = if v20.Shiny then true else false
			v60.Locked.Visible = if v20.Locked then true else false
			v60.Stat.Visible = if v20.Stats then true else false
			v60.Info.Text = "x1"
			v60.Info.Visible = false
			v60:SetAttribute("Owned", 1)
			v60:SetAttribute("Rarity", v20.Rarity)
			v60:SetAttribute("Unit", v20.Name)
			v60:SetAttribute("Shiny", v20.Shiny)
			v60:SetAttribute("SetLayoutOrder", v2)
			v60.Parent = Units
			v60.Visible = true
			t3[v20.ID] = v60
			local Enchant_3 = v20.Enchant
			local v71 = if Enchant_3 and typeof(Enchant_3) == "string" then if Enchant_3 and #Enchant_3 > 1 then true else false else false
			if v71 and ReplicatedStorage.Objects.Enchants:FindFirstChild(v20.Enchant) then
				local v72 = ReplicatedStorage.Objects.Enchants[v20.Enchant]:Clone()
				v72.Parent = v60
				if table.find(Misc.EnchantShines, v20.Enchant) then
					local v73 = PlayerGui:WaitForChild("Effects").Shine:Clone()
					v73.Parent = v72
					PlayerGui:WaitForChild("Effects").Event:Fire(v73)
				end
			end
			Tween:AddButton(v60, nil, nil, nil, true)
			task.spawn(onClickInvFrame, v60, v19)
		end
	end
end
function updateFrame(p1) --[[ updateFrame | Line: 523 | Upvalues: ClientState (copy), Towers (copy), t3 (ref), Rarities (copy), Units (copy), v2 (ref), update (copy), TowerStats (copy) ]]
	if not p1 then
		return
	end
	local v1 = ClientState.GetData().Towers[p1]
	if not (v1 and Towers.Towers[v1.Name]) then
		return
	end
	local v22 = t3[p1]
	if not (v1 and v22) then
		return
	end
	local Rarity = Towers.Towers[v1.Name].Rarity
	local v3 = v22:GetAttribute("SetLayoutOrder")
	local v4
	if v3 then
		v4 = v3
	else
		local v5 = if table.find(Rarities, Rarity) then table.find(Rarities, Rarity) else 0
		v4 = (10 - v5) * 1000 + #Units:GetChildren()
	end
	local v6 = trueCheckEquipped(p1)
	v22.TowerPrice.ImageColor3 = if v6 then Color3.fromRGB(0, 255, 0) else Color3.fromRGB(255, 0, 0)
	v22.TowerPrice.Info.TextColor3 = if v6 then Color3.fromRGB(0, 255, 0) else Color3.fromRGB(255, 0, 0)
	v22.LayoutOrder = if v6 then v4 - 10000 else v4
	if v2 ~= p1 then
		return
	end
	task.spawn(update, v22.Name, false)
	TowerStats.Visible = false
end
TowerStats.Frame.Equip.Activated:Connect(function() --[[ Line: 548 | Upvalues: v2 (ref), Towers_2 (copy) ]]
	if not v2 then
		return
	end
	Towers_2.Equip:FireServer(v2)
end)
TowerStats.Frame.Delete.Activated:Connect(function() --[[ Line: 554 | Upvalues: v2 (ref), ClientState (copy), t3 (ref), InventoryFrame (copy), v3 (ref) ]]
	if not v2 then
		return
	end
	local v1 = ClientState.GetData().Towers[v2]
	if not v1 then
		return
	end
	local v22 = t3[v1.ID]
	if not (v1 and v22) then
		return
	end
	if not (v2 and (v1 and v22)) then
		return
	end
	if v22.Info.Visible then
		InventoryFrame.DeleteFrame.Visible = true
		return
	end
	InventoryFrame.ConfirmFrame.Message.Text = ("Are you sure you want to sell %*?"):format(v1.Shiny and "Shiny " .. v1.Name or v1.Name)
	InventoryFrame.ConfirmFrame.Visible = true
	v3 = -1
end)
function updateMassDelete() --[[ updateMassDelete | Line: 573 | Upvalues: v4 (ref), InventoryFrame (copy), Units (copy) ]]
	if v4 then
		InventoryFrame.MultiDelete.ImageColor3 = Color3.fromRGB(102, 255, 75)
		InventoryFrame.MultiDelete.ImageLabel.ImageColor3 = Color3.fromRGB(102, 255, 75)
		InventoryFrame.MultiDeleteText.Visible = true
		return
	end
	InventoryFrame.MultiDelete.ImageColor3 = Color3.fromRGB(255, 0, 0)
	InventoryFrame.MultiDelete.ImageLabel.ImageColor3 = Color3.fromRGB(255, 0, 0)
	InventoryFrame.MultiDeleteText.Visible = false
	for v1, v2 in Units:GetChildren() do
		if v2:IsA("ImageButton") and v2.Delete.Visible then
			v2.Delete.Visible = false
		end
	end
end
InventoryFrame.MultiDelete.MouseButton1Click:Connect(function() --[[ Line: 592 | Upvalues: v4 (ref), t (ref), InventoryFrame (copy) ]]
	if v4 then
		if #t >= 1 then
			InventoryFrame.ConfirmFrame.Message.Text = "Are you sure you want to sell all selected towers?"
			InventoryFrame.ConfirmFrame.Visible = true
		else
			v4 = false
		end
	else
		v4 = true
	end
	updateMassDelete()
end)
TowerStats.Frame.Lock.Activated:Connect(function() --[[ Line: 607 | Upvalues: v2 (ref), ClientState (copy), t3 (ref), Towers_2 (copy) ]]
	if not v2 then
		return
	end
	local v1 = ClientState.GetData().Towers[v2]
	if not v1 then
		return
	end
	local v22 = t3[v1.ID]
	if not (v1 and v22) then
		return
	end
	if not (v2 and (v1 and v22)) then
		return
	end
	Towers_2.Lock:FireServer(v2)
end)
TowerStats.Frame.Passive.Activated:Connect(function() --[[ Line: 620 | Upvalues: TowerStats (copy), v2 (ref), ClientState (copy), Towers (copy), ReplicatedStorage (copy) ]]
	if TowerStats.Frame.PassiveFrame.Visible then
		TowerStats.Frame.PassiveFrame.Visible = false
		return
	end
	if not v2 then
		return
	end
	local v1 = ClientState.GetData().Towers[v2]
	if not v1 then
		return
	end
	if TowerStats.Frame.StatFrame.Visible then
		TowerStats.Frame.StatFrame.Visible = false
	end
	local v22 = Towers.Towers[v1.Name]
	local v3 = if v22.Passive then v22.Passive.Name else "No Passive"
	TowerStats.Frame.PassiveFrame.Visible = true
	TowerStats.Frame.PassiveFrame.Holder.ItemName.Text = v3
	TowerStats.Frame.PassiveFrame.Holder.ItemName.UIGradient.Color = (if ReplicatedStorage.Gradients:FindFirstChild(v3) then ReplicatedStorage.Gradients[v3] else ReplicatedStorage.Gradients["No Passive"]).Color
	TowerStats.Frame.PassiveFrame.Holder.Description.Text = if v22.Passive then v22.Passive.Description else "None"
end)
TowerStats.Frame.Stats.Activated:Connect(function() --[[ Line: 640 | Upvalues: TowerStats (copy), v2 (ref), ClientState (copy), StatRerolls (copy), LocalPlayer (copy) ]]
	if TowerStats.Frame.StatFrame.Visible then
		TowerStats.Frame.StatFrame.Visible = false
		return
	end
	if not v2 then
		return
	end
	if not ClientState.GetData().Towers[v2] then
		return
	end
	if TowerStats.Frame.PassiveFrame.Visible then
		TowerStats.Frame.PassiveFrame.Visible = false
	end
	TowerStats.Frame.StatFrame.Visible = true
	local Holder = TowerStats.Frame.StatFrame.Holder
	for k, v in pairs({ "Damage", "Range", "Cooldown" }) do
		local v1 = StatRerolls.GetStatMulti(LocalPlayer, v2, v, true)
		Holder[v .. "Letter"].TextLabel.Text = v1.Letter
		Holder[v .. "Show"].TextLabel.Text = v1.Value
		if Holder[v .. "Letter"]:FindFirstChild("ImageLabel") then
			Holder[v .. "Letter"].ImageLabel:Destroy()
		end
		if v1.Image then
			Holder[v .. "Letter"].TextLabel.Text = ""
			local ImageLabel = Instance.new("ImageLabel", Holder[v .. "Letter"])
			ImageLabel.Size = UDim2.new(1, 0, 1, 0)
			ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
			ImageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
			ImageLabel.BackgroundTransparency = 1
			ImageLabel.Image = v1.Image
			ImageLabel.ScaleType = Enum.ScaleType.Fit
		end
		if v1.Gradient then
			Holder[v .. "Letter"].Rare.Color = v1.Gradient
			Holder[v .. "Letter"].Frame.Rare.Color = v1.Gradient
			Holder[v .. "Letter"].TextLabel.Rare.Color = v1.Gradient
			Holder[v .. "Show"].Rare.Color = v1.Gradient
			Holder[v .. "Show"].Frame.Rare.Color = v1.Gradient
			Holder[v .. "Show"].TextLabel.Rare.Color = v1.Gradient
		end
	end
end)
Towers_2.Lock.OnClientEvent:Connect(function(p1, p2) --[[ Line: 682 | Upvalues: TowerStats (copy), v2 (ref), ClientState (copy), t3 (ref) ]]
	if p2 then
		TowerStats.Frame.Lock.ImageColor3 = Color3.fromRGB(255, 203, 46)
		TowerStats.Frame.Lock.ImageLabel.Image = "rbxassetid://129873382316985"
	else
		TowerStats.Frame.Lock.ImageColor3 = Color3.fromRGB(118, 93, 139)
		TowerStats.Frame.Lock.ImageLabel.Image = "rbxassetid://138428323187185"
	end
	if not v2 then
		return
	end
	local v1 = ClientState.GetData().Towers[v2]
	if not v1 then
		return
	end
	local v22 = t3[p1]
	if v1 and v22 then
		v22.Locked.Visible = p2
	end
end)
TowerStats.Frame.Info.Activated:Connect(function() --[[ Line: 699 | Upvalues: v2 (ref), Towers_2 (copy) ]]
	if v2 then
		Towers_2.ShowInfo:Fire(v2)
	end
end)
InventoryFrame.TradeAmount.Confirm.Activated:Connect(function() --[[ Line: 704 | Upvalues: InventoryFrame (copy), LocalPlayer (copy), ReplicatedStorage (copy) ]]
	InventoryFrame.Items.Visible = true
	InventoryFrame.Shop.Visible = true
	InventoryFrame.Units.Visible = true
	InventoryFrame.EnchantText.Visible = false
	InventoryFrame.RerollText.Visible = false
	InventoryFrame.EvolveText.Visible = false
	InventoryFrame.ItemText.Visible = false
	InventoryFrame.TradingText.Visible = false
	InventoryFrame.TradeAmount.Visible = false
	InventoryFrame.Search.Visible = true
	if not LocalPlayer:FindFirstChild("TradingItem") then
		return
	end
	ReplicatedStorage.Remotes.Trading.Trade.Bindable:Fire(LocalPlayer.TradingItem.Value, InventoryFrame.TradeAmount.Enter.TextBox.Text)
	LocalPlayer.TradingItem:Destroy()
end)
InventoryFrame.TradeAmount.Exit.Activated:Connect(function() --[[ Line: 721 | Upvalues: InventoryFrame (copy) ]]
	InventoryFrame.TradeAmount.Visible = false
end)
InventoryFrame.DeleteFrame.Confirm.Activated:Connect(function() --[[ Line: 725 | Upvalues: v3 (ref), InventoryFrame (copy), ClientState (copy), v2 (ref) ]]
	v3 = InventoryFrame.DeleteFrame.Enter.TextBox.Text
	InventoryFrame.DeleteFrame.Visible = false
	InventoryFrame.ConfirmFrame.Visible = true
	v3 = tonumber(v3) or 1
	local v22 = if v3 > 1 then "s" else ""
	local v32 = ClientState.GetData().Towers[v2]
	if v3 == -1 then
		InventoryFrame.ConfirmFrame.Message.Text = "Are you sure you want to sell " .. v32.Name .. "?"
	else
		InventoryFrame.ConfirmFrame.Message.Text = "Are you sure you want to sell " .. v3 .. " " .. v32.Name .. v22 .. "?"
	end
end)
InventoryFrame.DeleteFrame.Exit.Activated:Connect(function() --[[ Line: 743 | Upvalues: InventoryFrame (copy), v3 (ref), v2 (ref), TowerStats (copy) ]]
	InventoryFrame.DeleteFrame.Visible = false
	v3 = 0
	InventoryFrame.ConfirmFrame.Visible = false
	v2 = nil
	TowerStats.Visible = false
end)
InventoryFrame.ConfirmFrame.Yes.Activated:Connect(function() --[[ Line: 751 | Upvalues: v4 (ref), Towers_2 (copy), t (ref), v3 (ref), v2 (ref), InventoryFrame (copy), TowerStats (copy) ]]
	if v4 then
		Towers_2.Delete:FireServer(t, 1000)
		v4 = false
		t = {}
		updateMassDelete()
	elseif v3 == -1 then
		Towers_2.Delete:FireServer(v2)
	else
		Towers_2.Delete:FireServer(v2, v3)
	end
	v3 = 0
	InventoryFrame.ConfirmFrame.Visible = false
	v2 = nil
	TowerStats.Visible = false
end)
InventoryFrame.ConfirmFrame.No.Activated:Connect(function() --[[ Line: 768 | Upvalues: v4 (ref), t (ref), v3 (ref), InventoryFrame (copy) ]]
	if not v4 then
		v3 = 0
		InventoryFrame.ConfirmFrame.Visible = false
		return
	end
	v4 = false
	t = {}
	updateMassDelete()
	v3 = 0
	InventoryFrame.ConfirmFrame.Visible = false
end)
InventoryFrame.ConfirmFrame.No.Activated:Connect(function() --[[ Line: 778 | Upvalues: InventoryFrame (copy) ]]
	InventoryFrame.ConfirmFrame.Visible = false
end)
InventoryFrame.UnequipAll.Activated:Connect(function() --[[ Line: 782 | Upvalues: Towers_2 (copy) ]]
	Towers_2.Equip:FireServer("UnequipAll")
end)
InventoryFrame.Search.TextBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 786 | Upvalues: InventoryFrame (copy), Units (copy) ]]
	local v1 = InventoryFrame.Search.TextBox.Text:lower()
	local v2 = false
	local v3 = false
	for v4, v5 in Units:GetChildren() do
		if v5:IsA("ImageButton") then
			v5.Visible = false
			if not v2 or v5.Shiny then
				if v2 and #InventoryFrame.Search.TextBox.Text == 5 then
					v5.Visible = true
					continue
				end
				if v3 then
					v1 = v1:sub(v3 + 1, #v1)
				end
				if v5.Name:lower():match(v1) then
					v5.Visible = true
				end
			end
		end
	end
end)
Towers_2.Give.OnClientEvent:Connect(function(p1, p2) --[[ Line: 813 | Upvalues: updateInv (copy) ]]
	task.defer(updateInv, p1, p2)
end)
Towers_2.Delete.OnClientEvent:Connect(function(p1, p2) --[[ Line: 818 | Upvalues: updateInv (copy) ]]
	task.defer(updateInv, p1, p2)
end)
Towers_2.Enchanted.OnClientEvent:Connect(function(p1) --[[ Line: 823 | Upvalues: updateInv (copy) ]]
	task.defer(updateInv, p1)
end)
Towers_2.TowerUpdated.OnClientEvent:Connect(function(p1) --[[ Line: 828 | Upvalues: updateInv (copy) ]]
	task.defer(updateInv, p1)
end)
Towers_2.Equip.OnClientEvent:Connect(function(p1) --[[ Line: 833 | Upvalues: updateInv (copy) ]]
	task.spawn(updateFrame, p1)
	task.defer(updateInv, p1, true)
end)
Towers_2.Unequip.OnClientEvent:Connect(function(p1) --[[ Line: 838 | Upvalues: updateInv (copy) ]]
	task.spawn(updateFrame, p1)
	task.defer(updateInv, p1, true)
end)
Towers_2.FullUpdate.OnClientEvent:Connect(function() --[[ Line: 843 | Upvalues: updateInv (copy) ]]
	task.defer(updateInv)
end)
InventoryFrame:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 847 | Upvalues: InventoryFrame (copy), LocalPlayer (copy), t2 (ref), PlayerGui (copy), Tween (copy) ]]
	if InventoryFrame.Visible then
		return
	end
	InventoryFrame.Items.Visible = true
	InventoryFrame.Shop.Visible = true
	InventoryFrame.Units.Visible = true
	InventoryFrame.EnchantText.Visible = false
	InventoryFrame.RerollText.Visible = false
	InventoryFrame.EvolveText.Visible = false
	InventoryFrame.ItemText.Visible = false
	InventoryFrame.TradingText.Visible = false
	InventoryFrame.Search.Visible = true
	if LocalPlayer:FindFirstChild("EvolveTower") then
		for k, v in pairs(InventoryFrame.Units:GetChildren()) do
			if v:IsA("ImageButton") and v.Name ~= "Example" then
				v.Visible = true
			end
		end
		LocalPlayer.EvolveTower:Destroy()
	end
	if LocalPlayer:FindFirstChild("EnchantTower") then
		LocalPlayer.EnchantTower:Destroy()
	end
	if LocalPlayer:FindFirstChild("StatTower") then
		LocalPlayer.StatTower:Destroy()
	end
	for k, v in pairs(t2) do
		v.Visible = true
	end
	if not LocalPlayer:FindFirstChild("CurrentlyTrading") or PlayerGui:WaitForChild("Trade"):WaitForChild("TradeFrame").Visible then
		return
	end
	Tween:AddButton("Open", PlayerGui:WaitForChild("Trade"):WaitForChild("TradeFrame"))
end)
InventoryFrame.Exit.Activated:Connect(function() --[[ Line: 884 | Upvalues: LocalPlayer (copy), InventoryFrame (copy), t2 (ref) ]]
	if LocalPlayer:FindFirstChild("EvolveTower") then
		for k, v in pairs(InventoryFrame.Units:GetChildren()) do
			if v:IsA("ImageButton") and v.Name ~= "Example" then
				v.Visible = true
			end
		end
		LocalPlayer.EvolveTower:Destroy()
	end
	if LocalPlayer:FindFirstChild("EnchantTower") then
		LocalPlayer.EnchantTower:Destroy()
	end
	if LocalPlayer:FindFirstChild("StatTower") then
		LocalPlayer.StatTower:Destroy()
	end
	if LocalPlayer:FindFirstChild("UsingItem") then
		LocalPlayer.UsingItem:Destroy()
	end
	if LocalPlayer:FindFirstChild("TradingItem") then
		LocalPlayer.TradingItem:Destroy()
	end
	InventoryFrame.Items.Visible = true
	InventoryFrame.Shop.Visible = true
	InventoryFrame.Units.Visible = true
	InventoryFrame.EnchantText.Visible = false
	InventoryFrame.RerollText.Visible = false
	InventoryFrame.EvolveText.Visible = false
	InventoryFrame.ItemText.Visible = false
	InventoryFrame.Search.Visible = true
	for k, v in pairs(t2) do
		v.Visible = true
	end
end)
ReplicatedStorage.Remotes.PlayerData.UpdateData.OnClientEvent:Connect(function() --[[ Line: 918 | Upvalues: ClientState (copy), InventoryFrame (copy), TowersModule (copy) ]]
	local v1 = ClientState.GetData()
	InventoryFrame.Inventory.TextLabel.Text = TowersModule.GetStorage(v1) .. "/" .. TowersModule.GetMaxStorage(v1)
end)
ReplicatedStorage.Remotes.Misc.Evolve.Bindable.Event:Connect(function(p1) --[[ Line: 923 | Upvalues: Units (copy), HolderFrame (copy), TowerStats (copy), InventoryFrame (copy), ClientState (copy), Crafting (copy), t2 (ref), Tween (copy) ]]
	if p1 ~= 1 then
		return
	end
	Units.Visible = true
	HolderFrame.Items.Visible = false
	HolderFrame.Shop.Visible = false
	HolderFrame.Teams.Visible = false
	TowerStats.Visible = false
	InventoryFrame.OpenPresent.Visible = false
	InventoryFrame.Search.TextBox.Text = ""
	task.wait(0.1)
	local v1 = ClientState.GetData()
	for k, v in pairs(HolderFrame.Units:GetChildren()) do
		if v:IsA("ImageButton") and v.Name ~= "Example" and not Crafting[if v1.Towers[v.TowerID.Value] then v1.Towers[v.TowerID.Value].Name else ""] then
			if not t2[v] then
				t2[v] = v
			end
			v.Visible = false
		end
	end
	InventoryFrame.Items.Visible = false
	InventoryFrame.Shop.Visible = false
	InventoryFrame.Units.Visible = false
	HolderFrame.Teams.Visible = false
	InventoryFrame.EnchantText.Visible = false
	InventoryFrame.RerollText.Visible = false
	InventoryFrame.EvolveText.Visible = true
	InventoryFrame.ItemText.Visible = false
	InventoryFrame.TradingText.Visible = false
	InventoryFrame.Search.Visible = false
	Tween:AddButton("Open", InventoryFrame)
end)
ReplicatedStorage.Remotes.Misc.Enchant.Bindable.Event:Connect(function(p1) --[[ Line: 959 | Upvalues: Units (copy), HolderFrame (copy), TowerStats (copy), InventoryFrame (copy), Tween (copy) ]]
	if p1 == 1 then
		Units.Visible = true
		HolderFrame.Items.Visible = false
		HolderFrame.Shop.Visible = false
		HolderFrame.Teams.Visible = false
		TowerStats.Visible = false
		InventoryFrame.OpenPresent.Visible = false
		InventoryFrame.Items.Visible = false
		InventoryFrame.Shop.Visible = false
		InventoryFrame.Units.Visible = false
		HolderFrame.Teams.Visible = false
		InventoryFrame.EnchantText.Visible = true
		InventoryFrame.RerollText.Visible = false
		InventoryFrame.ItemText.Visible = false
		InventoryFrame.TradingText.Visible = false
		Tween:AddButton("Open", InventoryFrame)
	end
end)
ReplicatedStorage.Remotes.Misc.StatReroll.Bindable.Event:Connect(function(p1) --[[ Line: 979 | Upvalues: Units (copy), HolderFrame (copy), TowerStats (copy), InventoryFrame (copy), Tween (copy) ]]
	if p1 == 1 then
		Units.Visible = true
		HolderFrame.Items.Visible = false
		HolderFrame.Shop.Visible = false
		HolderFrame.Teams.Visible = false
		TowerStats.Visible = false
		InventoryFrame.OpenPresent.Visible = false
		InventoryFrame.Items.Visible = false
		InventoryFrame.Shop.Visible = false
		InventoryFrame.Units.Visible = false
		HolderFrame.Teams.Visible = false
		InventoryFrame.EnchantText.Visible = false
		InventoryFrame.RerollText.Visible = true
		InventoryFrame.ItemText.Visible = false
		InventoryFrame.TradingText.Visible = false
		Tween:AddButton("Open", InventoryFrame)
	end
end)
ReplicatedStorage.Remotes.Misc.UseItem.Bindable.Event:Connect(function(p1, p2) --[[ Line: 999 | Upvalues: Units (copy), HolderFrame (copy), TowerStats (copy), InventoryFrame (copy), Tween (copy), Towers (copy), Presents (copy), ClientState (copy), t2 (ref) ]]
	if p1 ~= 1 then
		return
	end
	Units.Visible = true
	HolderFrame.Items.Visible = false
	HolderFrame.Shop.Visible = false
	HolderFrame.Teams.Visible = false
	TowerStats.Visible = false
	InventoryFrame.OpenPresent.Visible = false
	InventoryFrame.Items.Visible = false
	InventoryFrame.Shop.Visible = false
	InventoryFrame.Units.Visible = false
	HolderFrame.Teams.Visible = false
	InventoryFrame.EnchantText.Visible = false
	InventoryFrame.RerollText.Visible = false
	InventoryFrame.ItemText.Visible = true
	InventoryFrame.TradingText.Visible = false
	Tween:AddButton("Open", InventoryFrame)
	local function show(p1, p2) --[[ show | Line: 1018 | Upvalues: Towers (ref), Presents (ref) ]]
		if p1.Shiny or (not Towers.Towers[p1.Name] or Towers.Towers[p1.Name].Rarity ~= p2) then
			return false
		else
			return (not Presents.Chances[p2] or Presents.Chances[p2][p1.Name]) and true or false
		end
	end
	if not string.find(p2, "Remnant") then
		return
	end
	local v1 = string.gsub(p2, "Remnant", "")
	local v2 = ClientState.GetData()
	for k, v in pairs(Units:GetChildren()) do
		local v3
		if v:FindFirstChild("TowerID") then
			local v4 = v2.Towers[v.TowerID.Value]
			if v4 then
				v3 = not v4.Shiny and (Towers.Towers[v4.Name] and Towers.Towers[v4.Name].Rarity == v1) and (not Presents.Chances[v1] or Presents.Chances[v1][v4.Name])
				if v3 then
					v.Visible = true
					continue
				end
				if not t2[v] then
					t2[v] = v
				end
				v.Visible = false
			end
		end
	end
end)
ReplicatedStorage.Remotes.Trading.Trade.Bindable.Event:Connect(function(p1, p2) --[[ Line: 1047 | Upvalues: Units (copy), HolderFrame (copy), TowerStats (copy), InventoryFrame (copy), Tween (copy) ]]
	if p1 == 1 then
		Units.Visible = true
		HolderFrame.Items.Visible = false
		HolderFrame.Shop.Visible = false
		HolderFrame.Teams.Visible = false
		TowerStats.Visible = false
		InventoryFrame.OpenPresent.Visible = false
		InventoryFrame.Items.Visible = true
		InventoryFrame.Shop.Visible = false
		InventoryFrame.Units.Visible = true
		HolderFrame.Teams.Visible = false
		InventoryFrame.TradingText.Visible = true
		InventoryFrame.EnchantText.Visible = false
		InventoryFrame.RerollText.Visible = false
		InventoryFrame.ItemText.Visible = false
		Tween:AddButton("Open", InventoryFrame)
	end
end)
ReplicatedStorage.Remotes.Towers.MetaData.OnClientEvent:Connect(function(p1) --[[ Line: 1067 | Upvalues: Towers (copy) ]]
	if not p1 then
		return
	end
	if pcall(function() --[[ Line: 1069 | Upvalues: p1 (ref), Towers (ref) ]]
		p1 = game:GetService("HttpService"):JSONDecode(p1)
		if not p1 then
			error(0)
		end
		Towers.Towers = p1
	end) then
		return
	end
	warn("Failed to update Client MetaData.")
end)
InventoryFrame.Units.Activated:Connect(function() --[[ Line: 1082 | Upvalues: Units (copy), HolderFrame (copy), TowerStats (copy), InventoryFrame (copy) ]]
	Units.Visible = true
	HolderFrame.Items.Visible = false
	HolderFrame.Shop.Visible = false
	HolderFrame.Teams.Visible = false
	TowerStats.Visible = false
	InventoryFrame.OpenPresent.Visible = false
	InventoryFrame.UnequipAll.Visible = true
	InventoryFrame.Teams.Visible = true
	InventoryFrame.Search.Visible = true
	InventoryFrame.Search.TextBox.Text = ""
	for k, v in pairs(InventoryFrame.Units:GetChildren()) do
		if v:IsA("ImageButton") and v.Name ~= "Example" then
			v.Visible = true
		end
	end
end)
function updateTeamSlots(p1, p2) --[[ updateTeamSlots | Line: 1100 | Upvalues: ClientState (copy), Towers (copy), ReplicatedStorage (copy) ]]
	local v1 = ClientState.GetData()
	local tbl = {}
	for k, v in pairs(p1:GetChildren()) do
		if v:IsA("ImageButton") then
			tbl[v] = true
		end
	end
	for k, v in pairs(p2) do
		local v2 = string.gsub(k, "Slot", "")
		local v3 = v1.Towers[v]
		if v3 then
			local v4 = p1[v2]
			v4.BorderImage.TowerImage.Image = if Towers.Towers[v3.Name] then Towers.Towers[v3.Name].Image else ""
			v4.Price.Info.Text = if Towers.Towers[v3.Name] then "$" .. Towers.Towers[v3.Name].PlacePrice else ""
			v4.Price.Visible = true
			v4.Shiny.Visible = if v3.Shiny then true else false
			if v4.BorderImage:FindFirstChild("BorderGradient") then
				v4.BorderImage.BorderGradient:Destroy()
			end
			if v3.Shiny then
				local BorderGradient = ReplicatedStorage.Gradients.Shiny:Clone()
				BorderGradient.Name = "BorderGradient"
				BorderGradient.Parent = v4.BorderImage
			else
				local Rarity = Towers.Towers[v3.Name].Rarity
				local BorderGradient = if ReplicatedStorage.Gradients:FindFirstChild(Rarity) then ReplicatedStorage.Gradients[Rarity]:Clone() else ReplicatedStorage.Gradients.Common:Clone()
				BorderGradient.Name = "BorderGradient"
				BorderGradient.Parent = v4.BorderImage
			end
			if v4:FindFirstChild("Enchant") then
				v4.Enchant:Destroy()
			end
			if v3.Enchant and (#v3.Enchant > 2 and ReplicatedStorage.Objects.Enchants:FindFirstChild(v3.Enchant)) then
				local Enchant = ReplicatedStorage.Objects.Enchants[v3.Enchant]:Clone()
				Enchant.Name = "Enchant"
				Enchant.ZIndex = 100
				Enchant.Parent = v4
			end
			tbl[v4] = nil
		end
	end
	for k, v in pairs(tbl) do
		k.BorderImage.TowerImage.Image = ""
		k.Price.Visible = false
		k.Shiny.Visible = false
		if k:FindFirstChild("Enchant") then
			k.Enchant:Destroy()
		end
		if k.BorderImage:FindFirstChild("BorderGradient") then
			k.BorderImage.BorderGradient:Destroy()
		end
	end
end
function updateTeams(p1) --[[ updateTeams | Line: 1161 | Upvalues: ClientState (copy), HolderFrame (copy) ]]
	local v1 = ClientState.GetData()
	for k, v in pairs(HolderFrame.Teams:GetChildren()) do
		if v:IsA("ImageButton") and (not p1 or v.Name == p1) then
			local t = {}
			if v1.Teams[v.Name] then
				local v2 = v1.Teams[v.Name]
				v.Info.Text = if v2.Name then v2.Name else v.Name
				for k2, v4 in pairs(v2.Towers) do
					if v1.Towers[v4] then
						t[k2] = v4
					end
				end
			else
				v.Info.Text = v.Name
			end
			updateTeamSlots(v.Hotbar.Main, t)
		end
	end
end
function initTeams() --[[ initTeams | Line: 1185 | Upvalues: HolderFrame (copy), Tween (copy) ]]
	task.spawn(updateTeams)
	for k, v in pairs(HolderFrame.Teams:GetChildren()) do
		if v:IsA("ImageButton") then
			Tween:AddButton(v.Equip)
			Tween:AddButton(v.Reset)
			Tween:AddButton(v.Set)
			v.Equip.MouseButton1Click:Connect(function() --[[ Line: 1195 | Upvalues: v (copy) ]]
				game.ReplicatedStorage.Remotes.Misc.Teams:FireServer("Equip", v.Name)
			end)
			v.Reset.MouseButton1Click:Connect(function() --[[ Line: 1198 | Upvalues: v (copy) ]]
				game.ReplicatedStorage.Remotes.Misc.Teams:FireServer("Clear", v.Name)
			end)
			v.Set.MouseButton1Click:Connect(function() --[[ Line: 1201 | Upvalues: v (copy) ]]
				game.ReplicatedStorage.Remotes.Misc.Teams:FireServer("Set", v.Name)
			end)
			v.Info.FocusLost:Connect(function() --[[ Line: 1204 | Upvalues: v (copy) ]]
				game.ReplicatedStorage.Remotes.Misc.Teams:FireServer("Name", v.Name, v.Info.Text)
			end)
		end
	end
end
InventoryFrame.Teams.MouseButton1Click:Connect(function() --[[ Line: 1211 | Upvalues: HolderFrame (copy), Units (copy) ]]
	local Visible = HolderFrame.Teams.Visible
	Units.Visible = Visible
	HolderFrame.Teams.Visible = not Visible
	HolderFrame.Items.Visible = false
	HolderFrame.Shop.Visible = false
end)
Units.Visible = true
HolderFrame.Items.Visible = false
HolderFrame.Shop.Visible = false
HolderFrame.Teams.Visible = false
Tween:AddButton(InventoryFrame.Exit, InventoryFrame)
Tween:AddButton(InventoryButton, InventoryFrame, "ButtonClick", true)
Tween:AddButton(InventoryFrame.Units)
Tween:AddButton(TowerStats.Frame.Equip)
Tween:AddButton(InventoryFrame.ConfirmFrame.Yes)
Tween:AddButton(InventoryFrame.ConfirmFrame.No)
Tween:AddButton(TowerStats.Frame.Delete)
Tween:AddButton(TowerStats.Frame.Info)
Tween:AddButton(TowerStats.Frame.Lock)
Tween:AddButton(TowerStats.Frame.Passive)
Tween:AddButton(TowerStats.Frame.Stats)
Tween:AddButton(InventoryFrame.TradeAmount.Confirm)
Tween:AddButton(InventoryFrame.TradeAmount.Exit)
Tween:AddButton(InventoryFrame.DeleteFrame.Exit)
Tween:AddButton(InventoryFrame.UnequipAll)
Tween:AddButton(InventoryFrame.Teams)
Tween:AddButton(InventoryFrame.MultiDelete)
task.delay(2, updateInv)
task.spawn(initTeams)
updateMassDelete()
game.ReplicatedStorage.Remotes.Misc.Teams.OnClientEvent:Connect(updateTeams)