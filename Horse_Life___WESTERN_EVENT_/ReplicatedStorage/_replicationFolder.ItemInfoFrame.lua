-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ItemDataService")
local v2 = Sonar("DisplayUtils")
local v3 = Sonar("FormatNumber")
local v4 = Sonar("Maid")
local v5 = Sonar("TimeUtils")
local v6 = Sonar("ItemGridButton")
local v7 = Sonar("AnimalDataService")
local v8 = Sonar("EquipmentService")
local v9 = Sonar("ItemDisplayCreator")
local v10 = Sonar("MathUtils")
local v11 = Sonar("ToolTipClient")
local v12 = Sonar("Button")
local v13 = Sonar("AnimalGridButton")
local v14 = Sonar("Signal")
local v15 = Sonar("State")
local v16 = Sonar("Constants")
local t2 = {
	Lasso = {
		TargetSpecies = function(p1) --[[ TargetSpecies | Line: 31 ]]
			if p1 == "All" then
				return "ALL SPECIES"
			else
				return p1:upper()
			end
		end,
		ItemRarity = function(p1) --[[ ItemRarity | Line: 37 ]]
			return p1.Name:upper()
		end,
		Cooldown = function(p1) --[[ Cooldown | Line: 40 ]]
			return p1 .. "s"
		end,
		Points = function(p1) --[[ Points | Line: 43 ]]
			return "x" .. p1
		end,
		Distance = function(p1) --[[ Distance | Line: 46 ]]
			return p1 .. " studs"
		end,
		Hit = function(p1) --[[ Hit | Line: 49 ]]
			return p1 .. " studs"
		end
	},
	Food = {
		Gestation = function(p1) --[[ Gestation | Line: 54 | Upvalues: v5 (copy) ]]
			return v5.FormatString(p1)
		end,
		Points = function(p1) --[[ Points | Line: 57 ]]
			return "x" .. p1
		end
	},
	Equipment = {
		Theme = function(p1) --[[ Theme | Line: 62 | Upvalues: v2 (copy) ]]
			return v2.SafeUpper(v2.GetDisplayName(p1.Name, p1))
		end,
		WornBy = function(p1) --[[ WornBy | Line: 65 | Upvalues: v7 (copy) ]]
			return v7.GetCustomName(p1)
		end,
		CanEdit = function(p1) --[[ CanEdit | Line: 68 ]]
			return (if p1 then "Yes" else "No"):upper()
		end,
		BodyPart = function(p1) --[[ BodyPart | Line: 72 ]]
			return p1:upper()
		end,
		Species = function(p1) --[[ Species | Line: 75 | Upvalues: v2 (copy) ]]
			return v2.SafeUpper(p1)
		end
	},
	Flairs = {
		WornBy = function(p1) --[[ WornBy | Line: 80 | Upvalues: v7 (copy) ]]
			return v7.GetCustomName(p1)
		end,
		DisplayBodyPart = function(p1) --[[ DisplayBodyPart | Line: 83 ]]
			if p1 == "HumanoidRootPart" then
				return "BODY"
			else
				return p1:upper()
			end
		end
	},
	Boost = {
		Duration = function(p1) --[[ Duration | Line: 91 | Upvalues: v5 (copy) ]]
			return v5.FormatString(p1)
		end
	},
	BondingTool = {
		Experience = function(p1) --[[ Experience | Line: 96 ]]
			return p1 .. " XP"
		end
	}
}
local v17 = Sonar("PlayerWrapper").GetClient()
local t3 = {}
local function v18(p1, p2) --[[ flattenTable | Line: 109 | Upvalues: v18 (copy) ]]
	local v2 = if p2 then p2 else {}
	for k, v in pairs(p1) do
		if type(v) == "table" and (not v.ClassName or v.ClassName ~= "Signal") then
			v18(v, v2)
			continue
		end
		table.insert(v2, v)
	end
	return v2
end
local function isVariantEquipped(p1) --[[ isVariantEquipped | Line: 122 | Upvalues: v17 (copy) ]]
	for v1, v2 in v17:GetItemFolder("Animals"):GetChildren() do
		local EquippedEquipment = v2:FindFirstChild("EquippedEquipment")
		if EquippedEquipment then
			for v3, v4 in p1.Values do
				if EquippedEquipment:FindFirstChild(v4.Name) then
					return true
				end
			end
		end
	end
	return false
end
local function getEquippedAnimalsForVariant(p1) --[[ getEquippedAnimalsForVariant | Line: 140 | Upvalues: v17 (copy) ]]
	local t = {}
	for v1, v2 in v17:GetItemFolder("Animals"):GetChildren() do
		local EquippedEquipment = v2:FindFirstChild("EquippedEquipment")
		if EquippedEquipment then
			for v3, v4 in p1.Values do
				if EquippedEquipment:FindFirstChild(v4.Name) then
					table.insert(t, v2)
					break
				end
			end
		end
	end
	return t
end
local v19 = nil
local function reopenStables(p1) --[[ reopenStables | Line: 160 | Upvalues: v19 (ref), Sonar (copy) ]]
	if v19 then
		v19.ReOpen(p1)
		return
	end
	v19 = Sonar("StablesGui")
	v19.ReOpen(p1)
end
function t._getAmount(p1) --[[ _getAmount | Line: 168 ]]
	if p1.GetAmount then
		return p1.GetAmount(p1)
	end
	if p1.AmountValue then
		return p1.AmountValue.Value
	else
		return p1.DataValue.Value
	end
end
function t.new(p1) --[[ new | Line: 178 | Upvalues: t (copy), v4 (copy), v1 (copy), v18 (copy), v17 (copy), v8 (copy), v7 (copy), v13 (copy), v6 (copy), v3 (copy), v12 (copy), v11 (copy), v16 (copy), v2 (copy), v14 (copy), v15 (copy), getEquippedAnimalsForVariant (copy), v19 (ref), Sonar (copy), isVariantEquipped (copy) ]]
	local v22 = setmetatable(p1, t)
	v22.Maid = v4.new()
	v22.Item = v22.Item or v1.GetByName(v22.DataValue.Name)
	v22.NameLabel = v22.Frame:FindFirstChild("NameLabel", true)
	if v22.NameLabel then
		v22:SetName()
	end
	v22.ViewportFrame = v22.Frame:FindFirstChild("Viewport", true)
	if v22.ViewportFrame and v22.ViewportFrame:IsA("ImageLabel") then
		v22:SetViewport()
	end
	v22.OwnedLabel = v22.ViewportFrame:FindFirstChild("OwnedLabel", true) or v22.Frame:FindFirstChild("OwnedLabel", true)
	v22.NoneOwnedLabel = v22.Frame:FindFirstChild("NoneOwnedLabel", true)
	v22.OwnedTitleLabel = v22.Frame:FindFirstChild("OwnedTitle", true)
	if v22.OwnedLabel then
		if v22.Values and #v22.Values > 0 then
			function v22.GetAmount(p1) --[[ Line: 203 ]]
				local v1 = 0
				for v2, v3 in p1.Values do
					if v3.Parent then
						v1 = if v3:IsA("IntValue") then v1 + v3.Value else v1 + 1
					end
				end
				return v1
			end
			local function RefreshAmountOwned() --[[ RefreshAmountOwned | Line: 219 | Upvalues: v22 (copy) ]]
				pcall(function() --[[ Line: 220 | Upvalues: v22 (ref) ]]
					v22:SetAmountOwned()
				end)
			end
			for v5, v62 in v22.Values do
				if v62:IsA("IntValue") then
					v22.Maid:GiveTask(v62:GetPropertyChangedSignal("Value"):Connect(RefreshAmountOwned))
				end
				v22.Maid:GiveTask(v62:GetPropertyChangedSignal("Parent"):Connect(RefreshAmountOwned))
			end
			if v22.AmountChanged then
				if type(v22.AmountChanged) == "table" and (not v22.AmountChanged.ClassName or v22.AmountChanged.ClassName ~= "Signal") then
					v22.AmountChanged = v18(v22.AmountChanged)
				else
					v22.AmountChanged = { v22.AmountChanged }
				end
				for v72, v82 in v22.AmountChanged do
					v22.Maid:GiveTask(v82:Connect(function() --[[ Line: 241 | Upvalues: v22 (copy) ]]
						pcall(function() --[[ Line: 242 | Upvalues: v22 (ref) ]]
							v22:SetAmountOwned()
						end)
					end))
				end
			end
			v22:SetAmountOwned()
			v22.OwnedLabel.Visible = true
			if v22.OwnedTitleLabel then
				v22.OwnedTitleLabel.Visible = true
			end
		elseif v22.DataValue and v22.DataValue:IsA("IntValue") then
			v22.Maid:GiveTask(v22.DataValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 257 | Upvalues: v22 (copy) ]]
				pcall(function() --[[ Line: 258 | Upvalues: v22 (ref) ]]
					v22:SetAmountOwned()
				end)
			end))
			if v22.AmountChanged then
				if type(v22.AmountChanged) == "table" and (not v22.AmountChanged.ClassName or v22.AmountChanged.ClassName ~= "Signal") then
					v22.AmountChanged = v18(v22.AmountChanged)
				else
					v22.AmountChanged = { v22.AmountChanged }
				end
				for k, v in pairs(v22.AmountChanged) do
					v22.Maid:GiveTask(v:Connect(function() --[[ Line: 269 | Upvalues: v22 (copy) ]]
						pcall(function() --[[ Line: 270 | Upvalues: v22 (ref) ]]
							v22:SetAmountOwned()
						end)
					end))
				end
			end
			v22:SetAmountOwned()
			v22.OwnedLabel.Visible = true
			if v22.OwnedTitleLabel then
				v22.OwnedTitleLabel.Visible = true
			end
		elseif v17:GetTrackedItemValue(v22.Item.Name, v22.Item.ItemType) then
			v22.AmountValue = v17:GetTrackedItemValue(v22.Item.Name, v22.Item.ItemType)
			v22.Maid:GiveTask(v22.AmountValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 284 | Upvalues: v22 (copy) ]]
				pcall(function() --[[ Line: 285 | Upvalues: v22 (ref) ]]
					v22:SetAmountOwned()
				end)
			end))
			v22:SetAmountOwned()
			v22.OwnedLabel.Visible = true
			if v22.OwnedTitleLabel then
				v22.OwnedTitleLabel.Visible = true
			end
		else
			v22.OwnedLabel.Visible = false
			if v22.NoneOwnedLabel then
				v22.NoneOwnedLabel.Visible = false
			end
			if v22.OwnedTitleLabel then
				v22.OwnedTitleLabel.Visible = false
			end
		end
	end
	v22.UsesLabel = v22.ViewportFrame:FindFirstChild("UsesLabel", true) or v22.Frame:FindFirstChild("UsesLabel", true)
	v22.UsesTitleLabel = v22.Frame:FindFirstChild("UsesTitle", true)
	if v22.UsesLabel then
		v22.UsesLeftValue = v22.DataValue:FindFirstChild("UsesLeft")
		local UsesLeftValue = v22.UsesLeftValue
		v22.UsesLabel.Visible = false
		if v22.UsesTitleLabel then
			v22.UsesTitleLabel.Visible = false
		end
	end
	v22.PriceLabel = v22.Frame:FindFirstChild("PriceLabel", true)
	if v22.PriceLabel and v22.Price then
		v22:SetPrice()
	end
	v22.RarityLabel = v22.ViewportFrame:FindFirstChild("RarityLabel", true) or v22.Frame:FindFirstChild("RarityLabel", true)
	if v22.RarityLabel then
		v22:SetRarity()
	end
	v22.DescriptionLabel = v22.Frame:FindFirstChild("Description", true)
	v22.DescriptionSizeIfVisible = {}
	v22.ShowBlankIfVisible = {}
	v22.StatsFrame = v22.Frame:FindFirstChild("Stats", true)
	if v22.StatsFrame then
		v22.InfoFrame = v22.StatsFrame:FindFirstChild(v22.Item.ToolType or "") or (v22.StatsFrame:FindFirstChild(v22.Item.ConsumableType or "") or v22.StatsFrame:FindFirstChild(v22.Item.ItemType))
		for k, v in pairs(v22.StatsFrame:GetChildren()) do
			v.Visible = v == v22.InfoFrame
		end
		if v22.InfoFrame then
			for k, v in pairs(v22.InfoFrame:GetChildren()) do
				if v:IsA("Frame") and not v22.DisregardStats then
					v22:CreateStat({
						CheckForStat = true,
						Name = v.Name,
						Label = v
					})
				end
			end
			if v22.Item.ItemType == "Food" then
				v22:CreateStat({
					Name = "Points",
					Get = function() --[[ Get | Line: 380 | Upvalues: v22 (copy) ]]
						return v22.Item.Points
					end,
					Label = v22.InfoFrame:FindFirstChild("TameBonus")
				})
			elseif v22.Item.ToolType == "Lasso" then
				v22:CreateStat({
					Name = "ItemRarity",
					Get = function() --[[ Get | Line: 390 | Upvalues: v22 (copy) ]]
						return v22.Item.Rarity
					end,
					Label = v22.InfoFrame:FindFirstChild("ItemRarity")
				})
			elseif v22.Item.ItemType == "Equipment" then
				v22.DescriptionSizeIfVisible[4] = {
					Size = UDim2.new(1, 0, 0.128, 0),
					Position = UDim2.new(0.5, 0, 0.741, 0)
				}
				v22:CreateStat({
					Name = "BodyPart",
					CheckForStat = true,
					Get = function() --[[ Get | Line: 405 | Upvalues: v22 (copy) ]]
						return v22.Item.BodyPart
					end,
					Label = v22.InfoFrame:FindFirstChild("BodyPart")
				})
				if not v22.DisregardStats then
					table.insert(v22.ShowBlankIfVisible, {
						Amount = 2,
						Label = v22.InfoFrame.Blank
					})
					v22:CreateStat({
						Name = "CanEdit",
						HideIfNone = true,
						Get = function() --[[ Get | Line: 420 | Upvalues: v22 (copy), v1 (ref) ]]
							if v22.DataValue and v1.GetByName(v22.DataValue.Theme.Value) then
							else
								return v22.Item.Editable
							end
						end,
						Label = v22.InfoFrame:FindFirstChild("CanEdit")
					})
					v22:CreateStat({
						Name = "WornBy",
						HideIfNone = true,
						Get = function() --[[ Get | Line: 430 | Upvalues: v22 (copy), v8 (ref), v17 (ref) ]]
							if v22.DataValue then
								return v8:IsEquipped(v17, v22.DataValue.Name)
							end
						end,
						Label = v22.InfoFrame:FindFirstChild("WornBy")
					})
					v22:CreateStat({
						Name = "Theme",
						HideIfNone = true,
						Get = function() --[[ Get | Line: 440 | Upvalues: v22 (copy), v8 (ref) ]]
							if v22.DataValue then
								return v8.GetThemeFromValue(v22.DataValue)
							end
						end,
						Label = v22.InfoFrame:FindFirstChild("Theme")
					})
					v22:CreateStat({
						Name = "Species",
						HideIfNone = true,
						Get = function() --[[ Get | Line: 450 | Upvalues: v22 (copy) ]]
							return v22.Item.Species
						end,
						Label = v22.InfoFrame:FindFirstChild("RequiredSpecies")
					})
				end
			elseif v22.Item.ItemType == "Flairs" then
				table.insert(v22.ShowBlankIfVisible, {
					Amount = 2,
					Label = v22.InfoFrame.Blank
				})
				v22:CreateStat({
					Name = "WornBy",
					HideIfNone = true,
					Get = function() --[[ Get | Line: 468 | Upvalues: v22 (copy), v8 (ref), v17 (ref) ]]
						if v22.DataValue then
							return v8:IsEquipped(v17, v22.DataValue.Name)
						end
					end,
					Label = v22.InfoFrame:FindFirstChild("WornBy")
				})
			elseif v22.Item.ItemType == "Chests" or v22.Item.ItemType == "StackableChests" then
				local LuckPower = v22.DataValue:FindFirstChild("LuckPower")
				if v22.InfoFrame:FindFirstChild("LuckPower") and LuckPower then
					v22:CreateStat({
						Name = "LuckPower",
						Get = function() --[[ Get | Line: 481 | Upvalues: v22 (copy) ]]
							return v22.DataValue.LuckPower.Value
						end,
						Format = function(p1) --[[ Format | Line: 484 ]]
							return p1 .. "%"
						end,
						Label = v22.InfoFrame:FindFirstChild("LuckPower")
					})
				end
				local Rewards = v22.InfoFrame:FindFirstChild("Rewards")
				if Rewards then
					if v22.DescriptionLabel then
						v22.DescriptionLabel.Visible = false
					end
					local sum = 0
					for k, v in pairs(v22.Item.DropTable.Drops) do
						if not LuckPower or (not (v.P > LuckPower.Value) or v.DoNotRemove) then
							sum = sum + v.P
						end
					end
					if v22.Item.DropTable.OnlyDropSpecies then
						for k, v in pairs(v22.Item.DropTable.Species) do
							for i = 1, 8 do
								local v122 = Rewards.Content.Default:Clone()
								local v132 = v.Preset[math.random(1, #v.Preset)]
								local v142 = v7.CreateSlot(v17, {
									DoNotParent = true,
									DoNotIncrementCount = true,
									SpeciesAsName = true,
									Age = 100,
									Species = v.Species,
									Preset = v132 or nil,
									Origin = v.Origin or "Wild",
									Seed = math.random(1, 1000000),
									MaxCosmetics = v.MaxCosmetics
								})
								local v152 = v13.new({
									ForceVisible = true,
									SpeciesAsName = true,
									SlotValue = v142,
									Owner = game.Players.LocalPlayer,
									GuiObject = v122.Content.HorseViewport,
									ParentFrame = v122.Content,
									ViewportFrame = v122.Content.HorseViewport
								})
								v22.Maid:GiveTask(v122)
								v22.Maid:GiveTask(v142)
								v22.Maid:GiveTask(v152)
								v122.Content.NameLabel.Text = v.Species
								v122.Content.HorseViewport.Visible = true
								v122.Content.Viewport.Visible = false
								v122.Visible = true
								v122.Parent = Rewards.Content
							end
						end
					else
						for k, v in pairs(v22.Item.DropTable.Drops) do
							local v162 = v1.GetByName(v.Name)
							if v162 and (not LuckPower or (not (v.P > LuckPower.Value) or v.DoNotRemove)) then
								local v172 = v6.new({
									ForceVisible = true,
									Item = v162,
									ParentFrame = Rewards.Content,
									GetAmount = function() --[[ GetAmount | Line: 553 | Upvalues: v (copy) ]]
										return v.Amount
									end
								})
								local ChanceLabel = v172.Frame:FindFirstChild("ChanceLabel", true)
								if v.P then
									ChanceLabel.Text = v3.percentage(v.P / sum * 100, 2) .. "%"
									ChanceLabel.Visible = true
								else
									ChanceLabel.Visible = false
								end
								v172.Frame.LayoutOrder = -v.P
								if v162.ItemType ~= "Currency" then
									v172:GiveTask(v12.new(v172.Frame, {
										Click = function() --[[ Click | Line: 570 | Upvalues: v11 (ref), v172 (copy), v162 (copy) ]]
											v11:CreateToolTip({
												Type = "ItemDescription",
												Offset = Vector2.new(0.65, 0.5),
												GuiObject = v172.Frame,
												Get = function() --[[ Get | Line: 575 | Upvalues: v162 (ref) ]]
													return v162
												end
											})
										end
									}))
								end
								v22.Maid:GiveTask(v172)
							end
						end
					end
				end
			elseif v22.Item.ItemType == "Seeds" then
				for v182, v192 in {
					Luck = {
						Format = "%",
						Value = v22.DataValue:FindFirstChild("Luck")
					},
					GrowTime = {
						Format = "",
						Value = v22.DataValue:FindFirstChild("GrowTime")
					},
					Yield = {
						Format = "%",
						Value = v22.DataValue:FindFirstChild("Yield")
					}
				} do
					if v22.InfoFrame:FindFirstChild(v182 .. "Stat") and v192.Value then
						v22:CreateStat({
							Name = v182 .. "Stat",
							Get = function() --[[ Get | Line: 598 | Upvalues: v22 (copy), v182 (copy) ]]
								return v22.DataValue[v182].Value
							end,
							Format = function(p1) --[[ Format | Line: 601 | Upvalues: v192 (copy) ]]
								return p1 .. v192.Format
							end,
							Label = v22.InfoFrame:FindFirstChild(v182 .. "Stat")
						})
					end
				end
				local Rewards = v22.InfoFrame:FindFirstChild("Rewards")
				if Rewards then
					if v22.DescriptionLabel then
						v22.DescriptionLabel.Visible = false
					end
					local v20 = v22.DataValue.Luck.Value / 100
					local sum = 0
					for k, v in pairs(v22.Item.DropTable) do
						local v21 = v.P * (1 + v20)
						if v21 > 100 then
							v21 = 100
						end
						sum = sum + v21
					end
					local v222 = v22.DataValue.Luck.Value / 100
					for v23, v24 in v22.Item.DropTable do
						local v25 = v1.GetByName(v24.Name)
						if v25 then
							local v26 = if v24.P < 50 then v24.P * (1 + v222) else v24.P * (1 - v222)
							if v26 > 100 then
								v26 = 100
							elseif v26 < 0 then
								v26 = 0
							end
							local v27 = v6.new({
								ForceVisible = true,
								Item = v25,
								ParentFrame = Rewards.Content,
								GetAmount = function() --[[ GetAmount | Line: 655 | Upvalues: v24 (copy) ]]
									return v24.Amount or 1
								end
							})
							local ChanceLabel = v27.Frame:FindFirstChild("ChanceLabel", true)
							if v26 then
								ChanceLabel.Text = v3.percentage(v26 / sum * 100, 2) .. "%"
								ChanceLabel.Visible = true
							else
								ChanceLabel.Visible = false
							end
							v27.Frame.LayoutOrder = -v24.P
							if v25.ItemType ~= "Currency" then
								v27:GiveTask(v12.new(v27.Frame, {
									Click = function() --[[ Click | Line: 671 | Upvalues: v11 (ref), v27 (copy), v25 (copy) ]]
										v11:CreateToolTip({
											Type = "ItemDescription",
											Offset = Vector2.new(0.65, 0.5),
											GuiObject = v27.Frame,
											Get = function() --[[ Get | Line: 676 | Upvalues: v25 (ref) ]]
												return v25
											end
										})
									end
								}))
							end
							v22.Maid:GiveTask(v27)
						end
					end
				end
			elseif v22.Item.ModifierStats and v22.Item.ConsumableType == "Boost" then
				if v22.InfoFrame:FindFirstChild("Blank") then
					table.insert(v22.ShowBlankIfVisible, {
						Amount = 2,
						Label = v22.InfoFrame.Blank
					})
				end
				for k, v in pairs(v22.Item.ModifierStats) do
					local v28 = v16.ModifierStats[k]
					if v28 then
						v22:CreateStat({
							Name = k,
							Get = function() --[[ Get | Line: 701 | Upvalues: v (copy) ]]
								return v
							end,
							Format = v16.ModifierStats[k].Format,
							DisplayName = v2.SafeUpper(v2.GetDisplayName(v28.Name, v28)) .. ":",
							Color = v28.Color,
							Image = v28.Image
						})
					end
				end
			end
			if v22.HideDescriptionIfStats then
				if v22.DescriptionLabel then
					v22.DescriptionLabel.Visible = false
				end
			elseif v22.DescriptionLabel then
				v22.DescriptionLabel.Visible = true
			end
		elseif v22.DescriptionLabel then
			v22.DescriptionLabel.Visible = true
		end
	elseif v22.DescriptionLabel then
		v22.DescriptionLabel.Visible = true
	end
	if v22.DescriptionLabel then
		v22:SetDescription()
	end
	v22.CraftingFrame = v22.Frame:FindFirstChild("Crafting", true)
	if v22.CraftingFrame and v22.Item.Crafting then
		for k, v in pairs(v22.Item.Crafting) do
			v22:CreateCraftingMaterial(k, v)
		end
	end
	v22.ThemeFrame = v22.ViewportFrame:FindFirstChild("Theme", true)
	if v22.ThemeFrame then
		if v22.DisregardTheme == nil and (v22.Item.ItemType == "Equipment" and v22.DataValue) then
			for k, v in pairs(v22.DataValue:GetChildren()) do
				v22.Maid:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 752 | Upvalues: v22 (copy) ]]
					v22:SetTheme()
				end))
			end
			v22:SetTheme()
		else
			v22.ThemeFrame.Visible = false
		end
	end
	v22.Variants = v22.Frame:FindFirstChild("Variants", true)
	if v22.Variants then
		if v22.DisregardTheme == nil or (v22.Item.ItemType ~= "Equipment" or not v22.Values) then
			v22.Variants.Visible = false
		else
			local ScrollingFrame = v22.Variants.Content.ScrollingFrame
			local Default = ScrollingFrame.Default
			Default.Visible = false
			local function applySizes() --[[ applySizes | Line: 770 | Upvalues: ScrollingFrame (copy), Default (copy) ]]
				local v2 = math.floor(math.floor(ScrollingFrame.AbsoluteSize.Y) * 0.2)
				local v3 = math.floor(v2 * 2)
				for v4, v5 in ScrollingFrame:GetChildren() do
					if v5 ~= Default and v5:IsA("Frame") then
						local Container = v5:FindFirstChild("Container")
						if Container then
							Container.Size = UDim2.new(1, 0, 0, v2)
						end
						local EquippedHorses = v5:FindFirstChild("EquippedHorses")
						if EquippedHorses then
							EquippedHorses.Size = UDim2.new(0.98, 0, 0, v3)
							local ScrollingFrame_2 = EquippedHorses:FindFirstChild("ScrollingFrame")
							local v6 = next
							local v7, v8 = ScrollingFrame_2:GetChildren()
							for v9, v10 in v6, v7, v8 do
								if v10:IsA("ImageButton") then
									v10.Size = UDim2.fromOffset(v3, v3)
								end
							end
						end
					end
				end
			end
			v22.Maid:GiveTask(ScrollingFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(applySizes))
			table.sort(v22.Values, function(p1, p2) --[[ Line: 801 ]]
				local t = {}
				for v1, v2 in { p1, p2 } do
					local Theme = v2:FindFirstChild("Theme")
					table.insert(t, (if Theme then Theme.Value else nil) or "")
				end
				local v4, v5 = table.unpack(t)
				if v4 == "" then
					if v5 == "" then
						return false
					end
					if v5 ~= "" then
						return true
					end
				else
					if v4 == "" then
						return false
					end
					if v5 == "" then
						return false
					end
					if v5 == "" then
						return false
					end
					if v4 == v5 then
						return false
					end
					if v4 == v5 then
						return false
					end
					return v4 < v5
				end
				return false
			end)
			local v29 = false
			for v30, v31 in v22.Values do
				if v31:FindFirstChild("LimitedSerial") then
					local LimitedSerial = v31.LimitedSerial.Value
					if LimitedSerial and (LimitedSerial ~= 0 and not tostring(LimitedSerial):find(":")) then
						v29 = true
						break
					end
				end
			end
			local t2 = {}
			if v29 then
				for v322, v33 in v22.Values do
					local Theme = v33.Theme.Value
					if Theme == "" then
						Theme = "Default"
					end
					local v34 = v33:FindFirstChild("LimitedSerial") and v33.LimitedSerial.Value or nil
					table.insert(t2, {
						Amount = 1,
						Name = if v34 then ("%* #%*"):format(Theme, v34) else Theme,
						Values = { v33 }
					})
				end
			else
				local t3 = {}
				for v36, v37 in v22.Values do
					local Theme = v37.Theme.Value
					if Theme == "" then
						Theme = "Default"
					end
					t3[Theme] = t3[Theme] or 0
					t3[Theme] = t3[Theme] + 1
				end
				for v38, v39 in t3 do
					local t4 = {}
					for v40, v41 in v22.Values do
						local Theme = v41:FindFirstChild("Theme")
						local v422 = v41:FindFirstChild("Theme") and Theme.Value or ""
						if (if v422 == "" then "Default" else v422) == v38 then
							table.insert(t4, v41)
						end
					end
					table.insert(t2, {
						Amount = v39,
						Name = v38,
						Values = t4
					})
				end
			end
			table.sort(t2, function(p1, p2) --[[ Line: 898 ]]
				if p1.Name == "Default" then
					if p2.Name == "Default" then
						return false
					end
					if p2.Name ~= "Default" then
						return true
					end
				else
					if p1.Name == "Default" then
						return false
					end
					if p2.Name == "Default" then
						return false
					end
					if p2.Name == "Default" then
						return false
					end
					if p1.Name == p2.Name then
						return false
					end
					if p1.Name == p2.Name then
						return false
					end
					return p1.Name < p2.Name
				end
				return false
			end)
			local v44 = v17:GetItemFolder("Animals")
			local v45 = v22.Maid:GiveTask(v14.new())
			local v46 = 0
			for v47, v48 in t2 do
				local v49 = v4.new()
				local v50 = v49:GiveTask(Default:Clone())
				local Theme = v50:FindFirstChild("Theme", true)
				local v51 = Theme and Theme:FindFirstChild("EquippedLabel")
				local v52 = if Theme then Theme:FindFirstChild("ImageLabel") else Theme
				local v53 = if v52 then v52:FindFirstChildOfClass("UIGradient") else v52
				local OwnedLabel = v50:FindFirstChild("OwnedLabel", true)
				local NameLabel = v50:FindFirstChild("NameLabel", true)
				local EquippedHorses = v50:FindFirstChild("EquippedHorses")
				local v54 = EquippedHorses and EquippedHorses:FindFirstChild("ScrollingFrame")
				local v55 = v54 and v54:FindFirstChild("Default")
				local t3 = {}
				local v56 = v49:GiveTask(v15.new(true))
				local v57 = v49:GiveTask(v15.new(0))
				if v55 then
					v55.Visible = false
				end
				if EquippedHorses then
					EquippedHorses.Visible = false
				end
				local function hideHorseTileChildren(p1) --[[ hideHorseTileChildren | Line: 948 ]]
					for v1, v2 in { "Characteristics", "Sell", "Move", "Unable", "Whiteout", "EquippedStroke", "UpperShadowLabel" } do
						local v3 = p1.Frame:FindFirstChild(v2, true)
						if v3 then
							v3.Visible = false
						end
					end
				end
				local function reconcileEquippedHorses() --[[ reconcileEquippedHorses | Line: 967 | Upvalues: EquippedHorses (copy), v54 (copy), v55 (copy), getEquippedAnimalsForVariant (ref), v48 (copy), t3 (copy), v13 (ref), hideHorseTileChildren (copy), v12 (ref), v19 (ref), Sonar (ref), applySizes (copy) ]]
					if not (EquippedHorses and (v54 and v55)) then
						return
					end
					local v1 = getEquippedAnimalsForVariant(v48)
					local t = {}
					for v2, v3 in v1 do
						t[v3] = true
						if not t3[v3] then
							local v4 = v13.new({
								SlotValue = v3,
								Owner = game.Players.LocalPlayer,
								GuiObject = v55
							})
							hideHorseTileChildren(v4)
							v4:GiveTask(v12.new(v4.Frame, {
								Click = function() --[[ Click | Line: 989 | Upvalues: v3 (copy), v19 (ref), Sonar (ref) ]]
									if not v19 then
										v19 = Sonar("StablesGui")
									end
									v19.ReOpen(v3)
								end
							}))
							v4.Frame.Parent = v54
							v4.Frame.Visible = true
							t3[v3] = v4
						end
					end
					for v5, v6 in t3 do
						if not t[v5] then
							v6:Destroy()
							t3[v5] = nil
						end
					end
					EquippedHorses.Visible = #v1 > 0
					applySizes()
				end
				v49:GiveTask(function() --[[ Line: 1012 | Upvalues: t3 (copy) ]]
					for v1, v2 in t3 do
						v2:Destroy()
						t3[v1] = nil
					end
				end)
				for v58, v59 in v48.Values do
					local v60 = v4.new()
					local v61 = v60:GiveTask(v15.new(true))
					local v62 = v60:GiveTask(v15.fromProperty(v59, "Value"))
					v60:GiveTask(v59:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 1025 | Upvalues: v61 (copy), v59 (copy) ]]
						v61:set(v59.Parent)
					end))
					v60:GiveTask(v15.subscribeMulti({ v61, v62 }, function(p1) --[[ Line: 1029 | Upvalues: v49 (copy), v48 (copy), v57 (copy), v56 (copy), v59 (copy) ]]
						v49._update = task.defer(function() --[[ Line: 1030 | Upvalues: v48 (ref), v57 (ref), v56 (ref) ]]
							local v1 = 0
							local v2 = false
							for v3, v4 in v48.Values do
								if v4.Parent then
									v1 = if v4:IsA("IntValue") then v1 + v4.Value else v1 + 1
									v2 = if v2 then v2 else v4.Parent ~= nil
								end
							end
							v57:set(v1)
							v56:set(v2)
						end)
						v49[v59] = if p1 then v49[v59] else nil
					end))
					v49[v59] = v60
				end
				v49:GiveTask(v45:Connect(function() --[[ Line: 1057 | Upvalues: v49 (copy), v51 (copy), isVariantEquipped (ref), v48 (copy), reconcileEquippedHorses (copy) ]]
					v49._equippedUpdate = task.defer(function() --[[ Line: 1058 | Upvalues: v51 (ref), isVariantEquipped (ref), v48 (ref), reconcileEquippedHorses (ref) ]]
						if not v51 then
							reconcileEquippedHorses()
							return
						end
						v51.Visible = isVariantEquipped(v48)
						reconcileEquippedHorses()
					end)
				end))
				v49:GiveTask(v15.subscribeMulti({ v56, v57 }, function(p1, p2) --[[ Line: 1066 | Upvalues: OwnedLabel (copy), v22 (copy), v48 (copy) ]]
					if OwnedLabel then
						OwnedLabel.Text = ("%*x"):format(p2)
					end
					if not (p1 or p2 > 0) then
						v22.Maid[v48] = nil
					end
				end))
				local v64 = v8.GetThemeFromValue((table.unpack(v48.Values)))
				if v64 and v52 then
					if v64.Texture then
						v52.Image = v64.Texture
						if v53 then
							v53.Enabled = false
						end
					elseif v64.ColorSequence and v53 then
						v53.Color = v64.ColorSequence
						v53.Enabled = true
					end
				elseif v53 then
					v53.Color = ColorSequence.new(Color3.new(255/255, 255/255, 255/255))
				end
				if NameLabel then
					NameLabel.Text = v48.Name
				end
				v50.Name = v48.Name
				if v51 then
					v51.Visible = isVariantEquipped(v48)
				end
				reconcileEquippedHorses()
				v50.Visible = true
				v50.Parent = Default.Parent
				v22.Maid[v48] = v49
			end
			local function onAnimalAdded(p1) --[[ onAnimalAdded | Line: 1109 | Upvalues: v4 (ref), v45 (copy), v46 (ref), v22 (copy) ]]
				local EquippedEquipment = p1:FindFirstChild("EquippedEquipment")
				if not EquippedEquipment then
					return
				end
				local v1 = v4.new()
				v1:GiveTask(EquippedEquipment.ChildAdded:Connect(function() --[[ Line: 1117 | Upvalues: v1 (copy), v45 (ref) ]]
					v1._update = task.defer(function() --[[ Line: 1118 | Upvalues: v45 (ref) ]]
						v45:Fire()
					end)
				end))
				v1:GiveTask(EquippedEquipment.ChildRemoved:Connect(function() --[[ Line: 1123 | Upvalues: v1 (copy), v45 (ref) ]]
					v1._update = task.defer(function() --[[ Line: 1124 | Upvalues: v45 (ref) ]]
						v45:Fire()
					end)
				end))
				v46 = v46 + #EquippedEquipment:GetChildren()
				if #EquippedEquipment:GetChildren() > 0 then
					v1._initialFire = task.defer(function() --[[ Line: 1131 | Upvalues: v45 (ref) ]]
						v45:Fire()
					end)
				end
				v1:GiveTask(p1:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 1137 | Upvalues: p1 (copy), v22 (ref) ]]
					if not p1.Parent then
						v22.Maid[p1] = nil
					end
				end))
				v22.Maid[p1] = v1
			end
			v22.Maid:GiveTask(v44.ChildAdded:Connect(onAnimalAdded))
			for v65, v66 in v44:GetChildren() do
				onAnimalAdded(v66)
			end
			if not (v46 > 0) then
				applySizes()
				v22.Variants.Visible = true
				return v22
			end
			v45:Fire()
			applySizes()
			v22.Variants.Visible = true
			return v22
		end
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 1169 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.GiveTask(p1, ...) --[[ GiveTask | Line: 1174 ]]
	return p1.Maid:GiveTask(...)
end
function t.SetTheme(p1, p2) --[[ SetTheme | Line: 1178 | Upvalues: v8 (copy) ]]
	if not p2 then
		p2 = p1.ThemeFrame
	end
	local v1 = v8.GetThemeFromValue(p1.DataValue)
	if v1 then
		if v1.Texture then
			p2.ImageLabel.Image = v1.Texture
			p2.ImageLabel.UIGradient.Enabled = false
		else
			p2.ImageLabel.Image = ""
			p2.ImageLabel.UIGradient.Color = v1.ColorSequence
			p2.ImageLabel.UIGradient.Enabled = true
		end
		p2.Visible = true
	else
		local v2 = v8.GetEditedColorGradient(p1.DataValue)
		if v2 then
			p2.ImageLabel.Image = ""
			p2.ImageLabel.UIGradient.Color = v2
			p2.ImageLabel.UIGradient.Enabled = true
			p2.Visible = true
		else
			p2.Visible = false
		end
	end
end
function t.SetRarity(p1) --[[ SetRarity | Line: 1211 ]]
	local Rarity = p1.Item.Rarity
	p1.RarityLabel.Text = Rarity.Name
	p1.RarityLabel.TextColor3 = Rarity.TextColor
end
function t.CreateCraftingMaterial(p1, p2, p3) --[[ CreateCraftingMaterial | Line: 1218 | Upvalues: v6 (copy), v1 (copy), v17 (copy), v3 (copy) ]]
	p1.Maid:GiveTask(v6.new({
		ForceVisible = true,
		ColorNameLabel = true,
		Item = v1.GetByName(p2),
		DataValue = v17:GetItemValue(p2),
		ParentFrame = p1.CraftingFrame,
		GetAmountText = function(p1) --[[ GetAmountText | Line: 1225 | Upvalues: v3 (ref), p3 (copy) ]]
			return v3.suffix(p1.DataValue.Value) .. "/" .. v3.suffix(p3)
		end,
		CheckAmount = function(p1) --[[ CheckAmount | Line: 1228 | Upvalues: p3 (copy) ]]
			return p3 <= p1.DataValue.Value
		end,
		AmountColors = {
			None = Color3.fromRGB(255, 153, 175),
			Default = Color3.fromRGB(110, 255, 128)
		}
	}))
end
function t.CreateStat(p1, p2) --[[ CreateStat | Line: 1238 | Upvalues: t2 (copy), t3 (copy), v10 (copy) ]]
	local Label = p2.Label
	if not Label and p1.InfoFrame:FindFirstChild("Default") then
		Label = p1.InfoFrame.Default:Clone()
		p1.InfoFrame.Default.Visible = false
		Label.Name = p2.Name
		Label.Parent = p1.InfoFrame
		p1.Maid:GiveTask(Label)
	end
	local v1 = t2[p1.Item.ToolType] or (t2[p1.Item.ItemType] or t2[p1.Item.ConsumableType])
	local v2 = p1.Item[Label.Name]
	if v2 or not p2.CheckForStat then
		local v3 = Label:FindFirstChild("Content") or Label
		local UIGradient = Label:FindFirstChild("UIGradient")
		local NoneLabel = Label:FindFirstChild("NoneLabel")
		local v4 = t3[Label]
		if not v4 then
			t3[Label] = Label.LayoutOrder
			v4 = Label.LayoutOrder
		end
		local function setStatLabel() --[[ setStatLabel | Line: 1265 | Upvalues: p2 (copy), v2 (copy), v3 (copy), v1 (copy), Label (ref), v4 (ref), UIGradient (copy), NoneLabel (copy), v10 (ref), p1 (copy) ]]
			local v12 = p2.Get and p2.Get() or v2
			if v12 then
				v3.ValueLabel.Text = p2.Format and p2.Format(v12) or v1[p2.Name](v12)
				v3.Visible = true
				Label.LayoutOrder = v4
				Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				if UIGradient then
					UIGradient.Enabled = true
				end
				if NoneLabel then
					NoneLabel.Visible = false
				end
				if p2.DisplayName then
					v3.Stat.Text = p2.DisplayName
				end
				if p2.DisplayName then
					v3.Stat.Text = p2.DisplayName
				end
				if p2.Color and UIGradient then
					UIGradient.Color = v10.replaceColors(UIGradient.Color, p2.Color)
				end
				if p2.Image then
					v3.Icon.Image = p2.Image
				end
				if Label:FindFirstChild("BackgroundLabel") then
					Label.BackgroundLabel.Image = v12.Texture or ""
					Label.BackgroundLabel.UIGradient.Color = v12.ColorSequence or ColorSequence.new(Color3.fromRGB(255, 255, 255))
					Label.BackgroundLabel.Visible = true
				end
				Label.Visible = true
			else
				Label.BackgroundColor3 = Color3.fromRGB(196, 164, 148)
				Label.LayoutOrder = 100
				if Label:FindFirstChild("BackgroundLabel") then
					Label.BackgroundLabel.Visible = false
				end
				if p2.HideIfNone then
					Label.Visible = false
				end
				v3.Visible = false
				if UIGradient then
					UIGradient.Enabled = false
				end
				if NoneLabel then
					NoneLabel.Visible = true
				end
			end
			if not p1.ShowBlankIfVisible then
				p1:SetDescription()
				return
			end
			local count = 0
			for k, v in pairs(p1.InfoFrame:GetChildren()) do
				if v:IsA("Frame") and (v.Name ~= "Blank" and v.Visible) then
					count = count + 1
				end
			end
			for k, v in pairs(p1.ShowBlankIfVisible) do
				if count <= v.Amount then
					v.Label.Visible = true
					continue
				end
				v.Label.Visible = false
			end
			p1:SetDescription()
		end
		if p2.Changed then
			p2.Changed = type(p2.Changed) == "table" and p2.Changed or { p2.Changed }
			for k, v in pairs(p2.Changed) do
				p1.Maid:GiveTask(v:Connect(setStatLabel))
			end
		end
		setStatLabel()
	end
end
function t.SetPrice(p1) --[[ SetPrice | Line: 1351 | Upvalues: v3 (copy) ]]
	p1.PriceLabel.Text = "$" .. v3.suffix(p1.Price)
end
function t.SetViewport(p1) --[[ SetViewport | Line: 1355 | Upvalues: v9 (copy) ]]
	p1.Maid:GiveTask(v9:Create({
		Viewport = p1.ViewportFrame,
		Item = p1.Item
	}))
end
function t.SetDescription(p1) --[[ SetDescription | Line: 1362 ]]
	if not p1.DescriptionLabel then
		return
	end
	p1.DescriptionLabel.Text = p1.Item.Description or "Some description here about how this item works or something???"
	if p1.KeepDescriptionSize then
		return
	end
	if p1.InfoFrame then
		if p1.DescriptionSizeIfVisible then
			local count = 0
			for k, v in pairs(p1.InfoFrame:GetChildren()) do
				if v:IsA("Frame") and v.Visible then
					count = count + 1
				end
			end
			local v1 = p1.DescriptionSizeIfVisible[count]
			if v1 then
				p1.DescriptionLabel.Size = v1.Size
				p1.DescriptionLabel.Position = v1.Position
				return
			end
		end
		p1.DescriptionLabel.Size = UDim2.new(1, 0, 0.185, 0)
		p1.DescriptionLabel.Position = UDim2.new(0.5, 0, 0.684, 0)
	else
		p1.DescriptionLabel.Size = UDim2.new(1, 0, 0.382, 0)
		p1.DescriptionLabel.Position = UDim2.new(0.5, 0, 0.425, 0)
	end
end
function t.SetAmountOwned(p1) --[[ SetAmountOwned | Line: 1394 | Upvalues: v3 (copy) ]]
	local v1 = p1:_getAmount()
	p1.OwnedLabel.Text = "x" .. v3.suffix(v1)
	if p1.NoneOwnedLabel then
		p1.NoneOwnedLabel.Visible = v1 <= 0
	end
	if p1.AmountColors then
		p1.OwnedLabel.TextColor3 = v1 <= 0 and p1.AmountColors.None or p1.AmountColors.Default
	end
	if not p1.OnAmountReachedZero then
		return
	end
	if p1._PrevOwnedAmount ~= nil and (p1._PrevOwnedAmount > 0 and v1 <= 0) then
		task.defer(p1.OnAmountReachedZero)
	end
	p1._PrevOwnedAmount = v1
end
function t.SetAmountUsesLeft(p1) --[[ SetAmountUsesLeft | Line: 1416 | Upvalues: v3 (copy) ]]
	p1.UsesLabel.Text = "x" .. v3.suffix((p1.Item.Uses or 0) * (p1.DataValue.Value - 1) + p1.UsesLeftValue.Value)
end
function t.SetName(p1) --[[ SetName | Line: 1422 | Upvalues: v2 (copy) ]]
	p1.NameLabel.Text = v2.GetDisplayName(p1.Item.Name, p1.Item)
end
return t