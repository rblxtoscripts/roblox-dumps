-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ButtonTest")
local v2 = Sonar("Maid")
local v3 = Sonar("Button")
local v4 = Sonar("MarketplaceUtils")
local v5 = Sonar("ItemDataService")
local v6 = Sonar("NotificationsClient")
local v7 = Sonar("FormatString")
local v8 = Sonar("AnimalGridButton")
local v9 = Sonar("AnimalDataService")
local v10 = Sonar("InfoOverlayGui")
local v11 = Sonar("WeightedProbability")
local v12 = Sonar("SortedRandom")
local v13 = Sonar("PromptClient")
local v14 = Sonar("InspectService")
local v15 = Sonar("TimeUtils")
local v16 = Sonar("Constants")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v17 = Sonar("PlayerWrapper").GetClient()
local t = {}
t.__index = t
function formatTime(p1) --[[ formatTime | Line: 29 ]]
	local v1 = math.floor(p1 / 3600)
	local v2 = p1 % 3600
	return string.format("%02d:%02d:%02d", v1, math.floor(v2 / 60), v2 % 60)
end
function t.SetColor(p1) --[[ SetColor | Line: 37 ]]
	if p1.BundleInfo.DisplayOrder then
		p1.Template.LayoutOrder = p1.BundleInfo.DisplayOrder
	end
	if p1.BundleInfo.BackgroundColor then
		p1.Template.BackgroundColor3 = p1.BundleInfo.BackgroundColor
		p1.Template.Footer.BackgroundColor3 = p1.BundleInfo.BarColor
		p1.Template:FindFirstChild("BundleName", true).UIStroke.Color = p1.BundleInfo.BarColor
		p1.InfoFrame.BackgroundColor3 = p1.BundleInfo.BackgroundColor
	end
	if not p1.BundleInfo.BundleArt then
		return
	end
	p1.Template.BundleArt.Image = p1.BundleInfo.BundleArt
end
function t.SetItems(p1) --[[ SetItems | Line: 55 | Upvalues: v16 (copy), v11 (copy), v12 (copy), v5 (copy) ]]
	if not p1.BundleInfo.Items then
		return
	end
	local t = {}
	local t2 = {}
	for v1, v2 in v16.RandomEquipmentDropThemes do
		v2.Name = v1
		table.insert(t, v2)
	end
	table.sort(t, function(p1, p2) --[[ Line: 67 ]]
		return p1.Name < p2.Name
	end)
	for v3, v4 in p1.BundleInfo.Items do
		if v3 == "RandomEquipment" then
			v3 = v12[v11.getRandomWeightedItem(v12, p1.CurrentSeed + v4.SeedOffset)].Name
		end
		if v4.PullTable then
			local v52 = Random.new(p1.CurrentSeed + v4.SeedOffset)
			local t3 = {}
			local v6 = nil
			for v7, v8 in v4.PullTable do
				if not t2[v8] and (type(v8) == "table" or v5.GetByName(v8)) then
					table.insert(t3, v8)
				end
			end
			table.sort(t3, function(p1, p2) --[[ Line: 95 ]]
				local v1 = type(p1) == "table" and p1[1] or p1
				local v2 = type(p2) == "table" and p2[1] or p2
				return tostring(v1) < tostring(v2)
			end)
			if #t3 > 0 then
				for i = 1, #t3 do
					local v9 = t3[v52:NextInteger(1, #t3)]
					if type(v9) == "table" or v5.GetByName(v9) then
						v6 = v9
						break
					end
				end
				if v6 == nil then
					v6 = t3[1]
				end
				t2[v6] = true
				v3 = v6
			end
		end
		if type(v3) == "table" then
			for v10, v112 in v3 do
				p1:_createItem(v112, v4, t)
			end
			continue
		end
		p1:_createItem(v3, v4, t)
	end
end
function t._createItem(p1, p2, p3, p4) --[[ _createItem | Line: 134 | Upvalues: v5 (copy), v16 (copy), v11 (copy), v7 (copy) ]]
	if not v5.GetByName(p2) and v16.RandomDrops[p2] then
		local v3 = v11.getRandomWeightedItem(v16.RandomDrops[p2], p1.CurrentSeed + (p3.SeedOffset or 0))
		if v3 then
			p2 = v3
		end
	end
	local v4 = v5.GetByName(p2)
	if not v4 then
		warn("No item info found for " .. p2)
		return
	end
	local v52 = p1.BundleItems.Default:Clone()
	v52.Icon.Image = v4.Image
	v52.ItemName.Text = string.format("x%s %s", p3.Amount, v7.separateWordsInString(p2))
	v52.Visible = true
	if v4.ColorSequence then
		v52.Icon.UIGradient.Color = v4.ColorSequence
		v52.Icon.UIGradient.Enabled = true
	end
	if p3.Theme then
		local v6 = Random.new(p1.CurrentSeed + (p3.SeedOffset or 0))
		local v72 = if p3.AlwaysTheme then p3.Theme elseif typeof(p3.ThemeChance) == "number" then v6:NextNumber() <= p3.ThemeChance and p3.Theme or nil else v6:NextInteger(1, 2) == 1 and p3.Theme or nil
		if type(v72) == "table" then
			v72 = v72[v6:NextInteger(1, #v72)]
		elseif v72 == "Random" then
			v72 = p4[v11.getRandomWeightedItem(p4, p1.CurrentSeed + p3.SeedOffset)].Name
		end
		if v72 then
			local v10 = v5.GetByName(v72)
			if v10 then
				v52.Theme.ImageLabel.Image = v10.Texture or ""
				v52.Theme.ImageLabel.UIGradient.Color = v10.ColorSequence or ColorSequence.new(Color3.fromRGB(255, 255, 255))
				v52.Theme.ImageLabel.UIGradient.Enabled = true
				v52.Theme.Visible = true
			end
		end
	end
	p1.Maid:GiveTask(v52)
	v52.Parent = p1.BundleItems
end
function t.SetHorse(p1) --[[ SetHorse | Line: 197 | Upvalues: v9 (copy), v17 (copy), v8 (copy), LocalPlayer (copy), v1 (copy), v6 (copy), v10 (copy), v14 (copy) ]]
	for v12, v2 in { "Horse", "Horse2" } do
		if p1.BundleInfo[v2] then
			local v3 = p1.BundleInfo[v2]
			local v4 = v3.Species[p1.R:NextInteger(1, #v3.Species)]
			local v7 = v17
			local t = {
				Origin = "Bought",
				DoNotParent = true,
				DoNotIncrementCount = true,
				Age = 66,
				Species = v4,
				Preset = v3.Preset[p1.R:NextInteger(1, #v3.Preset)] or nil,
				Seed = p1.CurrentSeed + (v3.SeedOffset or 0),
				MaxCosmetics = v3.MaxCosmetics
			}
			t.Gender = if p1.R:NextNumber(0, 1) <= 0.6 then "Male" else "Female"
			t.SkillLevels = v3.SkillLevels
			t.MutationSlotChances = v3.MutationSlotChances
			t.MutationChances = v3.MutationChances
			t.Infertile = if p1.BundleInfo.Fertility == "Choice" then true else not p1.BundleInfo.Fertility
			t.MutationsToGuarantee = v3.MutationsToGuarantee
			t.MutationGroupsToGuarantee = v3.MutationGroupsToGuarantee
			local v102 = v9.CreateSlot(v7, t)
			local t2 = {
				DoNotClone = true,
				SlotValue = v102,
				Owner = LocalPlayer
			}
			t2.ViewportFrame = v2 == "Horse" and p1.Template.InfoFrame.ViewportFrame or p1.Template.InfoFrame.ViewportFrame2
			t2.GuiObject = p1.Template.InfoFrame
			local v13 = v8.new(t2)
			p1.Maid:GiveTask(v1.new(v2 == "Horse" and p1.Template.InfoFrame.Inspect or p1.Template.InfoFrame.Inspect2, {
				Click = function() --[[ Click | Line: 237 | Upvalues: v17 (ref), v6 (ref), v10 (ref), v102 (copy), v14 (ref) ]]
					if v17.Player.Character:GetAttribute("WildMode") then
						v6.Notify({
							Message = "You cannot inspect horses while in Wild Mode!"
						})
					else
						v10.Open({
							SpeciesAsName = true,
							SlotValue = v102,
							ActionButtons = {
								Inspect = {
									Run = function() --[[ Run | Line: 250 | Upvalues: v14 (ref), v102 (ref) ]]
										v14.New({
											SlotInfo = v102
										})
									end
								}
							}
						})
					end
				end
			}))
			p1.Maid:GiveTask(v13)
			p1.Maid:GiveTask(v102)
		end
	end
end
function t.new(p1) --[[ new | Line: 279 | Upvalues: t (copy), v2 (copy), v17 (copy), v4 (copy), v7 (copy), v15 (copy), v6 (copy), v13 (copy), v1 (copy), LocalPlayer (copy), v3 (copy) ]]
	local v22 = setmetatable(p1, t)
	v22.Maid = v2.new()
	v22.BundleInfo = v22.BundleTable[v22.BundleName]
	v22.CurrentSeed = v22.Timer.CurrentSeed
	if v22.BundleInfo.Hide then
		v22.Maid:DoCleaning()
		setmetatable(v22, nil)
		return
	end
	if p1.BundleInfo.DisplayCheck and (p1.BundleInfo.DisplayCheck.PlaytimeMax and v17.PlayerData.Stats.PlayTime.Value / 3600 >= p1.BundleInfo.DisplayCheck.PlaytimeMax) then
		v22.Maid:DoCleaning()
		setmetatable(v22, nil)
		return
	end
	if not v22.DoNotClone then
		v22.Template = v22.Template:Clone()
		v22.Maid:GiveTask(v22.Template)
	end
	v22.BundleItems = v22.Template:FindFirstChild("BundleItems", true)
	v22.InfoFrame = v22.Template:FindFirstChild("InfoFrame", true)
	v22.DepartureContent = v22.Template:FindFirstChild("DepartureContent", true)
	v22.LockedContent = v22.Template:FindFirstChild("LockedContent", true)
	v22.R = Random.new(v22.CurrentSeed + v22.BundleInfo.DisplayOrder)
	v22.Price = v4.GetProductInfo(v22.BundleInfo.ProductId, Enum.InfoType.Product)
	v22.BuyButton = v22.Template:FindFirstChild("BuyButton", true)
	v22.BuyButton.Top.TextLabel.Text = "\238\128\130" .. v22.Price.PriceInRobux or v22.BundleInfo.Cost
	local BundleName = v22.Template:FindFirstChild("BundleName", true)
	local ForcedDisplayName = v22.BundleInfo.ForcedDisplayName
	if not ForcedDisplayName then
		ForcedDisplayName = v7.separateWordsInString(v22.BundleInfo.DisplayName or v22.BundleName)
	end
	BundleName.Text = ForcedDisplayName
	v22:SetColor()
	v22:SetItems()
	v22:SetHorse()
	v22.NewTimer = v22.Template:FindFirstChild("NewTimer", true)
	if v22.DisplayTime and v22.NewTimer then
		v22.Maid:GiveTask(v22.Timer.TimeChanged:Connect(function() --[[ Line: 329 | Upvalues: v22 (copy) ]]
			v22.Template.Footer.NewTimer.Text = string.format("Resets in %s", formatTime(v22.Timer:GetTime()))
		end))
	end
	if v22.BundleInfo.StartTime or v22.BundleInfo.EndTime then
		local function setVisible() --[[ setVisible | Line: 336 | Upvalues: v22 (copy), v15 (ref) ]]
			if v22.BundleInfo.EndTime then
				v22.Template.Visible = v15.Get() < v22.BundleInfo.EndTime
				v22.CanPurchase = false
			else
				v22.Template.Visible = true
			end
			if v22.BundleInfo.StartTime then
				local v2 = v15.Get() >= v22.BundleInfo.StartTime
				if v22.NewTimer then
					v22.NewTimer.Visible = v2
				end
				if v22.LockedContent then
					v22.LockedContent.Visible = not v2
				end
				if v22.DepartureContent then
					if v22.BundleInfo.EndTime then
						v22.DepartureContent.CountdownLabel.Text = v15.FormatString(v22.BundleInfo.EndTime - v15.Get())
					end
					v22.DepartureContent.Visible = v2
				end
				if v22.LockedContent and not v2 then
					v22.LockedContent.CountdownLabel.Text = v15.FormatString(v22.BundleInfo.StartTime - v15.Get())
				end
				v22.BundleItems.Visible = v2
				v22.BuyButton.Visible = v2
				v22.CanPurchase = v2
			else
				v22.BuyButton.Visible = true
				v22.BundleItems.Visible = true
				if v22.NewTimer then
					v22.NewTimer.Visible = true
				end
				if not v22.LockedContent then
					v22.CanPurchase = true
					return
				end
				v22.LockedContent.Visible = false
				v22.CanPurchase = true
			end
		end
		v22.Maid:GiveTask(v15.AttachToTime(setVisible))
		setVisible()
	else
		v22.CanPurchase = true
		v22.BuyButton.Visible = true
		if v22.NewTimer then
			v22.NewTimer.Visible = true
		end
		v22.Template.Visible = true
	end
	local function Purchase() --[[ Purchase | Line: 389 | Upvalues: v22 (copy), v6 (ref), v13 (ref), v4 (ref), v1 (ref), LocalPlayer (ref) ]]
		if not v22.CanPurchase then
			v6.Notify({
				Message = "You cannot purchase this yet!",
				Type = "PurchaseBundle"
			})
			return
		end
		if v22.BundleInfo.Fertility == "Choice" then
			v13.Prompt({
				Type = "HorseBundle",
				Setup = function(p1, p2) --[[ Setup | Line: 401 | Upvalues: v4 (ref), v22 (ref), v1 (ref), LocalPlayer (ref), v13 (ref) ]]
					local v12 = v4.GetProductInfo(v22.BundleInfo.FertileId, Enum.InfoType.Product)
					local v2 = v4.GetProductInfo(v22.BundleInfo.ProductId, Enum.InfoType.Product)
					p1.Content.Fertile.Top.TextLabel.Text = "\238\128\130" .. v12.PriceInRobux or v22.BundleInfo.FertileCost
					p2.Maid:GiveTask(v1.new(p1.Content.Fertile, {
						Click = function() --[[ Click | Line: 408 | Upvalues: v4 (ref), LocalPlayer (ref), v22 (ref), v13 (ref) ]]
							v4.PromptPurchase(LocalPlayer, v22.BundleInfo.FertileId, "Product")
							v13.Close()
						end
					}))
					p1.Content.Infertile.Top.TextLabel.Text = "\238\128\130" .. v2.PriceInRobux or v22.BundleInfo.Cost
					p2.Maid:GiveTask(v1.new(p1.Content.Infertile, {
						Click = function() --[[ Click | Line: 416 | Upvalues: v4 (ref), LocalPlayer (ref), v22 (ref), v13 (ref) ]]
							v4.PromptPurchase(LocalPlayer, v22.BundleInfo.ProductId, "Product")
							v13.Close()
						end
					}))
				end,
				Close = function() --[[ Close | Line: 422 ]]
					return true
				end,
				Cancel = function() --[[ Cancel | Line: 425 ]]
					return true
				end
			})
		else
			v4.PromptPurchase(LocalPlayer, v22.BundleInfo.ProductId, "Product")
		end
	end
	v22.Maid:GiveTask(v1.new(v22.Template:FindFirstChild("BuyButton", true), {
		Click = function() --[[ Click | Line: 435 | Upvalues: Purchase (copy) ]]
			Purchase()
		end
	}))
	v22.Maid:GiveTask(v3.new(v22.Template, {
		Click = function() --[[ Click | Line: 441 | Upvalues: Purchase (copy) ]]
			Purchase()
		end
	}))
	if v22.BundleInfo.SaleStarts and v22.BundleInfo.SaleEnds then
		local SaleBanner = v22.Template:FindFirstChild("SaleBanner", true)
		if SaleBanner then
			v22.Maid:GiveTask(v15.AttachToTime(function() --[[ Line: 449 | Upvalues: v15 (ref), v22 (copy), SaleBanner (copy) ]]
				local v1 = v15.Get()
				SaleBanner.Visible = if v22.BundleInfo.SaleStarts <= v1 then v1 <= v22.BundleInfo.SaleEnds else false
			end))
		end
	end
	if v22.Parent then
		v22.Template.Parent = v22.Parent
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 464 ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
return t