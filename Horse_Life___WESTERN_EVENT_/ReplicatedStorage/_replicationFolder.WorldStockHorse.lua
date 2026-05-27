-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("spr")
local v2 = Sonar("AnimalCosmetics")
local v3 = Sonar("AnimalDataService")
local v4 = Sonar("Binder")
local v5 = Sonar("ButtonTest")
local v6 = Sonar("DisplayAnimalClient")
local v7 = Sonar("FormatNumber")
local v8 = Sonar("InteractMenu")
local v9 = Sonar("ItemDataService")
local v10 = Sonar("ItemReplicationService")
local v11 = Sonar("Limited")
local v12 = Sonar("Maid")
local v13 = Sonar("MarketplaceUtils")
local v14 = Sonar("NotificationsClient")
local v15 = Sonar("PlayerWrapper")
local v16 = Sonar("PromptClient")
local v17 = Sonar("RemoteUtils")
local v18 = Sonar("StorageUtils")
local v19 = Sonar("TimeUtils")
local v20 = Sonar("LimitedStockUnlocks")
local v21 = Sonar("StockItemGui")
local v22 = Sonar("GameVersionUtils")
local LimitedStockHorses = Sonar("Constants").LimitedStockHorses
local v23 = RunService:IsStudio() and false
local v24 = v22:IsPrivateServer() or v22:IsReserved()
local v25 = Sonar(v18.Get("LimitedStockHorseProducts"))
local LocalPlayer = Players.LocalPlayer
local v26 = v15.GetClient()
local v27 = v17.GetRemoteEvent("LimitedStockHorsePurchaseComplete")
local v28 = v17.GetRemoteFunction("PurchaseLimitedStockHorse")
local v29 = v17.GetRemoteEvent("SetLimitedStockHorseStockId")
local v30 = v17.GetRemoteFunction("StartLimitedStockUnlockRemote")
local v31 = v17.GetRemoteFunction("CompleteLimitedStockUnlockRemote")
local function FindStockId(p1) --[[ FindStockId | Line: 58 | Upvalues: LimitedStockHorses (copy) ]]
	for v2, v3 in LimitedStockHorses do
		if v3.StockId == p1 then
			return v3
		end
	end
	return nil
end
function t.new(p1) --[[ new | Line: 71 | Upvalues: t (copy), v12 (copy), LimitedStockHorses (copy), v13 (copy), v11 (copy), v19 (copy), v3 (copy), v26 (copy), v10 (copy), v2 (copy), RunService (copy), v1 (copy), v9 (copy), v8 (copy), v20 (copy), v24 (copy), v16 (copy), v25 (copy), v21 (copy), v5 (copy) ]]
	local v22 = setmetatable({}, t)
	for v32, v4 in p1.Data:GetChildren() do
		v22[v4.Name] = v4.Value
	end
	v22.Maid = v12.new()
	local StockId = v22.StockId
	local v52 = nil
	for v6, v7 in LimitedStockHorses do
		if v7.StockId == StockId then
			v52 = v7
			break
		end
	end
	v22.StockInfo = v52
	v22.SoldOutPriceText = "Out of stock - " .. utf8.char(57346)
	v22.Maid:GiveTask(task.spawn(function() --[[ Line: 83 | Upvalues: v13 (ref), v22 (copy) ]]
		local v1 = v13.GetProductInfo(3531352375, Enum.InfoType.Product)
		if not (v1 and v1.PriceInRobux) then
			return
		end
		v22.SoldOutPriceText = "Out of stock - " .. utf8.char(57346) .. v1.PriceInRobux
		v22:UpdateStockDisplay()
	end))
	v22.Display = p1:FindFirstChild("StockHorseDisplay")
	if v22.Display then
		v22.Display.Frame.Title.Text = v22.StockInfo.DisplayName or "Exclusive " .. v22.StockInfo.Preset[1] .. " " .. v22.StockInfo.Species
		if v22.StockId then
			local v92 = v11:GetSoldCountValue(v22.StockId)
			v22.SoldCountValue = v92
			v22:UpdateStockDisplay()
			v22.Maid:GiveTask(v92:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 100 | Upvalues: v22 (copy) ]]
				v22:UpdateStockDisplay()
			end))
			if v22.StockInfo.StockRefreshTime and v22.StockInfo.StockRefreshAmount then
				v22.Maid:GiveTask(v19.AttachToTime(function() --[[ Line: 105 | Upvalues: v22 (copy) ]]
					v22:UpdateStockDisplay()
				end))
			end
			local v102 = v11:GetStockAdjustmentsFolder()
			if v102 then
				local v112 = v102:FindFirstChild(v22.StockInfo.StockId)
				if v112 then
					v22.Maid:GiveTask(v112:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 114 | Upvalues: v22 (copy) ]]
						v22:UpdateStockDisplay()
					end))
				end
				v22.Maid:GiveTask(v102.ChildAdded:Connect(function(p1) --[[ Line: 119 | Upvalues: v22 (copy) ]]
					if p1.Name ~= v22.StockInfo.StockId then
						return
					end
					v22:UpdateStockDisplay()
					v22.Maid:GiveTask(p1:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 122 | Upvalues: v22 (ref) ]]
						v22:UpdateStockDisplay()
					end))
				end))
			end
		end
	end
	local v122 = v3.CreateSlot(v26, {
		DoNotParent = true,
		DoNotIncrementCount = true,
		Age = 100,
		Species = v22.StockInfo.Species,
		Preset = v22.StockInfo.Preset[1]
	})
	local v15 = v2.new(v10.Get((v3.GetByName(v122.Species.Value))):Clone(), {
		InViewport = false,
		SlotValue = v122
	})
	v22.AnimalModel = v15.AnimalModel
	v22.AnimalModel.HumanoidRootPart.Anchored = true
	v22.AnimalModel:ScaleTo(v3.GetScale(v122) * 2)
	v22.offsetCFrame = p1.CFrame + Vector3.new(0, v15.AnimalModel:GetExtentsSize().Y / 2, 0)
	v22.rotationAccumulator = 0
	v22.AnimalModel:PivotTo(v22.offsetCFrame)
	v22.AnimalModel.Name = "WorldStockHorse"
	v22.AnimalModel.Parent = workspace
	v22.Maid:GiveTask(v15)
	v22.Maid:GiveTask(v122)
	v22.Maid:GiveTask(RunService.Heartbeat:Connect(function(p1) --[[ Line: 165 | Upvalues: v22 (copy), v1 (ref) ]]
		v22.rotationAccumulator = v22.rotationAccumulator + 0.004363323129985824
		v1.target(v22.AnimalModel, 10, 10, {
			Pivot = v22.offsetCFrame * CFrame.Angles(0, v22.rotationAccumulator, 0)
		})
	end))
	v22.CurrencyData = v9.GetByName(v22.StockInfo.Currency)
	local t2 = { v26.MissionsChangedSignal }
	if v22.SoldCountValue then
		table.insert(t2, v22.SoldCountValue:GetPropertyChangedSignal("Value"))
	end
	v22.InteractMenu = v8.new(p1, {
		Hint = function() --[[ Hint | Line: 181 | Upvalues: v20 (ref), v22 (copy) ]]
			if not v20.MissionUnlockRequired(v22.StockInfo) then
				return "Purchase"
			end
			local v1 = v22:GetMissionState()
			if v1 == "Completed" or not v22:HasStockLeft() then
				return "Purchase"
			end
			if v1 == "ReadyToClaim" then
				return "Claim"
			end
			if v1 == "InProgress" then
				return "Mission in Progress"
			else
				return "Start Mission"
			end
		end,
		HintChanged = t2,
		Run = function() --[[ Run | Line: 199 | Upvalues: v24 (ref), v16 (ref), v20 (ref), v22 (copy), v25 (ref), v21 (ref), v5 (ref) ]]
			if v24 then
				v16.Prompt({
					Type = "PrivateServerLimitedItemsDisabled",
					Run = function() --[[ Run | Line: 204 ]]
						return true
					end,
					Cancel = function() --[[ Cancel | Line: 208 ]]
						return true
					end
				})
				return
			end
			if not v20.MissionUnlockRequired(v22.StockInfo) then
				v22:_runCoinStockPurchaseFlow()
				return
			end
			local ProductId = v25.BuyOutOfStockFertile.ProductId
			local ProductId_2 = v25.BuyOutOfStockInfertile.ProductId
			local v1 = v22:GetMissionState()
			if v1 == "Completed" then
				if v22:_hasReachedMissionCoinLimit() then
					v22:_promptRobuxPurchase(ProductId, ProductId_2, true)
				else
					v22:_runCoinStockPurchaseFlow(true)
				end
			else
				if v1 == "ReadyToClaim" then
					v22:_claimMission()
					return
				end
				if v1 == "InProgress" then
					v21.Open(v22.StockInfo.StockId)
					return
				end
				if not v22:HasStockLeft() then
					v22:_promptRobuxPurchase(ProductId, ProductId_2)
					return
				end
				if v22.StockInfo.FertileChoice == true then
					v16.Prompt({
						Type = "LimitedHorseMissionChoice",
						Setup = function(p1, p2) --[[ Setup | Line: 250 | Upvalues: v5 (ref), v22 (ref), v16 (ref) ]]
							p2.Maid:GiveTask(v5.new(p1.Content.Fertile, {
								Click = function() --[[ Click | Line: 252 | Upvalues: v22 (ref), v16 (ref) ]]
									v22:_acceptMission("Fertile")
									v16.Close()
								end
							}))
							p2.Maid:GiveTask(v5.new(p1.Content.Infertile, {
								Click = function() --[[ Click | Line: 259 | Upvalues: v22 (ref), v16 (ref) ]]
									v22:_acceptMission("Infertile")
									v16.Close()
								end
							}))
						end,
						Cancel = function() --[[ Cancel | Line: 265 ]]
							return true
						end
					})
				else
					v22:_acceptMission(nil)
				end
			end
		end,
		GetRange = function() --[[ GetRange | Line: 273 ]]
			return 25
		end
	})
	v22.Maid:GiveTask(v22.InteractMenu)
	return v22
end
function t.GetSoldCount(p1) --[[ GetSoldCount | Line: 283 ]]
	if p1.SoldCountValue then
		return p1.SoldCountValue.Value
	else
		return 0
	end
end
function t.GetMaxStock(p1) --[[ GetMaxStock | Line: 290 | Upvalues: v19 (copy), v11 (copy) ]]
	if not p1.StockInfo then
		return 0
	end
	local sum = p1.StockInfo.MaxStock or 0
	if p1.StockInfo.StockRefreshTime and (p1.StockInfo.StockRefreshAmount and v19.Get() >= p1.StockInfo.StockRefreshTime) then
		sum = sum + p1.StockInfo.StockRefreshAmount
	end
	local v1 = v11:GetStockAdjustmentValue(p1.StockInfo.StockId)
	if v1 then
		sum = sum + v1.Value
	end
	return sum
end
function t.GetStockRemaining(p1) --[[ GetStockRemaining | Line: 305 ]]
	return math.max(0, p1:GetMaxStock() - p1:GetSoldCount())
end
function t.HasStockLeft(p1) --[[ HasStockLeft | Line: 311 | Upvalues: v23 (copy) ]]
	if v23 then
		return false
	end
	return p1:GetStockRemaining() > 0
end
function t.HasPendingRefresh(p1) --[[ HasPendingRefresh | Line: 318 | Upvalues: v19 (copy) ]]
	if not p1.StockInfo then
		return false
	end
	return p1.StockInfo.StockRefreshTime and (p1.StockInfo.StockRefreshAmount and v19.Get() < p1.StockInfo.StockRefreshTime)
end
function t.UpdateStockDisplay(p1) --[[ UpdateStockDisplay | Line: 325 | Upvalues: v19 (copy) ]]
	if not (p1.Display and p1.StockId) then
		return
	end
	local v1 = p1:GetStockRemaining()
	local v2 = p1:HasStockLeft()
	local FullLabel = p1.Display.Frame:FindFirstChild("FullLabel")
	if not FullLabel then
		return
	end
	if v2 then
		FullLabel.Text = "Stock Left: " .. v1
	elseif p1:HasPendingRefresh() then
		FullLabel.Text = "Restock in " .. v19.FormatTimeWithoutLeadingZeros(p1.StockInfo.StockRefreshTime - v19.Get())
	else
		FullLabel.Text = p1.SoldOutPriceText
		FullLabel.TextColor3 = Color3.fromRGB(255, 200, 46)
		local FinishedStroke = FullLabel:FindFirstChild("FinishedStroke")
		if FinishedStroke then
			FinishedStroke.Color = Color3.fromRGB(240, 119, 46)
		end
		local FinishedGradient = FullLabel:FindFirstChild("FinishedGradient")
		if FinishedGradient then
			FinishedGradient.Enabled = false
		end
	end
	FullLabel.Visible = true
end
function t.GetMissionState(p1) --[[ GetMissionState | Line: 358 | Upvalues: v26 (copy) ]]
	local LimitedStockUnlocks = v26.PlayerData.Missions:FindFirstChild("LimitedStockUnlocks")
	if not LimitedStockUnlocks then
		return "NotStarted"
	end
	for v1, v2 in LimitedStockUnlocks:GetChildren() do
		local StockId = v2:FindFirstChild("StockId")
		if StockId and StockId.Value == p1.StockInfo.StockId then
			if v2:FindFirstChild("Claimed") and v2.Claimed.Value then
				return "Completed"
			end
			if v2.Completed.Value then
				return "ReadyToClaim"
			end
			if v2.Started.Value then
				return "InProgress"
			end
		end
	end
	return "NotStarted"
end
function t.GetMissionFolder(p1) --[[ GetMissionFolder | Line: 382 | Upvalues: v26 (copy) ]]
	local LimitedStockUnlocks = v26.PlayerData.Missions:FindFirstChild("LimitedStockUnlocks")
	if not LimitedStockUnlocks then
		return nil
	end
	for v1, v2 in LimitedStockUnlocks:GetChildren() do
		local StockId = v2:FindFirstChild("StockId")
		if StockId and StockId.Value == p1.StockInfo.StockId then
			return v2
		end
	end
	return nil
end
function t._hasReachedMissionCoinLimit(p1) --[[ _hasReachedMissionCoinLimit | Line: 398 | Upvalues: v26 (copy) ]]
	local LimitedHorseStockBought = v26.PlayerData:FindFirstChild("LimitedHorseStockBought")
	if not LimitedHorseStockBought then
		return false
	end
	local v1 = LimitedHorseStockBought:FindFirstChild(p1.StockInfo.StockId)
	return if v1 == nil then false else v1.Value >= 3
end
function t._runCoinStockPurchaseFlow(p1, p2) --[[ _runCoinStockPurchaseFlow | Line: 408 | Upvalues: v25 (copy), v16 (copy), v13 (copy), v5 (copy), v29 (copy), LocalPlayer (copy), v28 (copy), v14 (copy), v6 (copy), v26 (copy), v7 (copy) ]]
	local ProductId = v25.BuyOutOfStockFertile.ProductId
	local ProductId_2 = v25.BuyOutOfStockInfertile.ProductId
	local CurrencyData = p1.CurrencyData
	if p1:HasStockLeft() then
		local function purchaseHorse(p12) --[[ purchaseHorse | Line: 450 | Upvalues: v28 (ref), p1 (copy), p2 (copy), ProductId (copy), ProductId_2 (copy), v29 (ref), v13 (ref), LocalPlayer (ref), v14 (ref), v6 (ref), v26 (ref) ]]
			local v1, v2, v3 = v28:InvokeServer(p1.StockInfo.StockId, p12)
			if v1 then
				v6:DisplaySlot({
					Type = "Purchased",
					AllowNaming = true,
					MobileClickBackgroundToClose = true,
					Slot = v26:GetItemFolder("Animals"):WaitForChild(v3)
				})
				return true
			end
			if v2 == "LimitReached" and p2 then
				p1:_promptRobuxPurchase(ProductId, ProductId_2, true)
				return
			end
			if v2 ~= "CannotAfford" or not p1.StockInfo.FertileChoice then
				v14.Notify({
					Preset = "Red",
					Message = v2
				})
				return
			end
			v29:FireServer(p1.StockInfo.StockId, p12)
			v13.PromptPurchase(LocalPlayer, p12 == "Fertile" and ProductId or ProductId_2, "Product")
		end
		if p1.StockInfo.FertileChoice == true then
			v16.Prompt({
				Type = "LimitedHorseChoice",
				Setup = function(p12, p2) --[[ Setup | Line: 483 | Upvalues: CurrencyData (copy), v7 (ref), p1 (copy), v13 (ref), ProductId (copy), ProductId_2 (copy), v5 (ref), purchaseHorse (copy), v16 (ref) ]]
					p12.Content.PriceContainer.FertilePrice.IconLabel.Image = CurrencyData.Image
					p12.Content.PriceContainer.FertilePrice.TextLabel.Text = v7.splice(p1.StockInfo.FertilePrice)
					p12.Content.PriceContainer.InfertilePrice.IconLabel.Image = CurrencyData.Image
					p12.Content.PriceContainer.InfertilePrice.TextLabel.Text = v7.splice(p1.StockInfo.InfertilePrice)
					p2.Maid:GiveTask(task.spawn(function() --[[ Line: 490 | Upvalues: v13 (ref), ProductId (ref), p12 (copy), ProductId_2 (ref) ]]
						local v1 = v13.GetProductInfo(ProductId, Enum.InfoType.Product)
						local v2 = if v1 then v1.PriceInRobux or "N/A" else "N/A"
						p12.Content.RobuxPriceContainer.FertilePrice.TextLabel.Text = ("%*%*"):format(utf8.char(57346), v2)
						local v3 = v13.GetProductInfo(ProductId_2, Enum.InfoType.Product)
						local v4 = if v3 then v3.PriceInRobux or "N/A" else "N/A"
						p12.Content.RobuxPriceContainer.InfertilePrice.TextLabel.Text = ("%*%*"):format(utf8.char(57346), v4)
					end))
					p2.Maid:GiveTask(v5.new(p12.Content.Fertile, {
						Click = function() --[[ Click | Line: 501 | Upvalues: purchaseHorse (ref), v16 (ref) ]]
							purchaseHorse("Fertile")
							v16.Close()
						end
					}))
					p2.Maid:GiveTask(v5.new(p12.Content.Infertile, {
						Click = function() --[[ Click | Line: 508 | Upvalues: purchaseHorse (ref), v16 (ref) ]]
							purchaseHorse("Infertile")
							v16.Close()
						end
					}))
				end,
				Cancel = function() --[[ Cancel | Line: 514 ]]
					return true
				end
			})
		else
			v16.Prompt({
				Type = "PurchaseLimitedHorse",
				Setup = function(p12) --[[ Setup | Line: 521 | Upvalues: CurrencyData (copy), v7 (ref), p1 (copy) ]]
					p12.Content.Price.IconLabel.Image = CurrencyData.Image
					p12.Content.Price.TextLabel.Text = v7.splice(p1.StockInfo.Price)
				end,
				Run = function() --[[ Run | Line: 526 | Upvalues: purchaseHorse (copy) ]]
					purchaseHorse()
				end,
				Cancel = function() --[[ Cancel | Line: 529 ]]
					return true
				end
			})
		end
	else
		local Prompt = v16.Prompt
		local t = {}
		t.Type = if p2 then "SoldOutLimitedMissionHorse" else "SoldOutLimitedHorse"
		function t.Setup(p12, p2) --[[ Setup | Line: 416 | Upvalues: v13 (ref), ProductId (copy), ProductId_2 (copy), v5 (ref), v29 (ref), p1 (copy), LocalPlayer (ref), v16 (ref) ]]
			p2.Maid:GiveTask(task.spawn(function() --[[ Line: 417 | Upvalues: v13 (ref), ProductId (ref), p12 (copy), ProductId_2 (ref) ]]
				local v1 = v13.GetProductInfo(ProductId, Enum.InfoType.Product)
				local v2 = if v1 then v1.PriceInRobux or "N/A" else "N/A"
				p12.Content.FertileButton.Top.TextLabel.Text = ("%*%*"):format(utf8.char(57346), v2)
				local v3 = v13.GetProductInfo(ProductId_2, Enum.InfoType.Product)
				local v4 = if v3 then v3.PriceInRobux or "N/A" else "N/A"
				p12.Content.InfertileButton.Top.TextLabel.Text = ("%*%*"):format(utf8.char(57346), v4)
			end))
			p2.Maid:GiveTask(v5.new(p12.Content.FertileButton, {
				Click = function() --[[ Click | Line: 428 | Upvalues: v29 (ref), p1 (ref), v13 (ref), LocalPlayer (ref), ProductId (ref), v16 (ref) ]]
					v29:FireServer(p1.StockInfo.StockId, "Fertile")
					v13.PromptPurchase(LocalPlayer, ProductId, "Product")
					v16.Close()
				end
			}))
			p2.Maid:GiveTask(v5.new(p12.Content.InfertileButton, {
				Click = function() --[[ Click | Line: 436 | Upvalues: v29 (ref), p1 (ref), v13 (ref), LocalPlayer (ref), ProductId_2 (ref), v16 (ref) ]]
					v29:FireServer(p1.StockInfo.StockId, "Infertile")
					v13.PromptPurchase(LocalPlayer, ProductId_2, "Product")
					v16.Close()
				end
			}))
		end
		function t.Cancel() --[[ Cancel | Line: 443 ]]
			return true
		end
		Prompt(t)
	end
end
function t._acceptMission(p1, p2) --[[ _acceptMission | Line: 536 | Upvalues: v30 (copy), v14 (copy), v26 (copy), v21 (copy) ]]
	local v1, v2 = v30:InvokeServer(p1.StockInfo.StockId, p2)
	if v1 then
		if not v26.MissionsChangedSignal then
			v21.Open(p1.StockInfo.StockId)
			v14.Notify({
				Message = "Mission accepted!",
				Preset = "Green"
			})
			return
		end
		v26.MissionsChangedSignal:Fire()
		v21.Open(p1.StockInfo.StockId)
		v14.Notify({
			Message = "Mission accepted!",
			Preset = "Green"
		})
	else
		local v3 = "Failed to accept mission"
		if v2 == "AlreadyStarted" then
			v3 = "You already have a mission for this horse!"
		elseif v2 == "TooManyActive" then
			v3 = "Complete your current stock mission first!"
		end
		v14.Notify({
			Preset = "Red",
			Message = v3
		})
	end
end
function t._claimMission(p1) --[[ _claimMission | Line: 563 | Upvalues: v31 (copy), v6 (copy), v26 (copy), v14 (copy) ]]
	local v1 = p1:GetMissionFolder()
	if not v1 or (not v1.Completed.Value or v1.Claimed.Value) then
		return
	end
	local v2, v3, v4 = v31:InvokeServer(v1.Name)
	if v2 and v4 then
		v6:DisplaySlot({
			Type = "Purchased",
			AllowNaming = true,
			MobileClickBackgroundToClose = true,
			Slot = v26:GetItemFolder("Animals"):WaitForChild(v4)
		})
	else
		v14.Notify({
			Preset = "Red",
			Message = "Failed to claim mission reward: " .. tostring(v3)
		})
	end
end
function t._promptRobuxPurchase(p1, p2, p3, p4) --[[ _promptRobuxPurchase | Line: 585 | Upvalues: v16 (copy), v13 (copy), v5 (copy), v29 (copy), LocalPlayer (copy) ]]
	local Prompt = v16.Prompt
	local t = {}
	t.Type = if p4 then "SoldOutLimitedMissionHorse" else "SoldOutLimitedHorse"
	function t.Setup(p12, p22) --[[ Setup | Line: 588 | Upvalues: v13 (ref), p2 (copy), p3 (copy), v5 (ref), v29 (ref), p1 (copy), LocalPlayer (ref), v16 (ref) ]]
		p22.Maid:GiveTask(task.spawn(function() --[[ Line: 589 | Upvalues: v13 (ref), p2 (ref), p12 (copy), p3 (ref) ]]
			local v1 = v13.GetProductInfo(p2, Enum.InfoType.Product)
			local v2 = if v1 then v1.PriceInRobux or "N/A" else "N/A"
			p12.Content.FertileButton.Top.TextLabel.Text = ("%*%*"):format(utf8.char(57346), v2)
			local v3 = v13.GetProductInfo(p3, Enum.InfoType.Product)
			local v4 = if v3 then v3.PriceInRobux or "N/A" else "N/A"
			p12.Content.InfertileButton.Top.TextLabel.Text = ("%*%*"):format(utf8.char(57346), v4)
		end))
		p22.Maid:GiveTask(v5.new(p12.Content.FertileButton, {
			Click = function() --[[ Click | Line: 600 | Upvalues: v29 (ref), p1 (ref), v13 (ref), LocalPlayer (ref), p2 (ref), v16 (ref) ]]
				v29:FireServer(p1.StockInfo.StockId, "Fertile")
				v13.PromptPurchase(LocalPlayer, p2, "Product")
				v16.Close()
			end
		}))
		p22.Maid:GiveTask(v5.new(p12.Content.InfertileButton, {
			Click = function() --[[ Click | Line: 608 | Upvalues: v29 (ref), p1 (ref), v13 (ref), LocalPlayer (ref), p3 (ref), v16 (ref) ]]
				v29:FireServer(p1.StockInfo.StockId, "Infertile")
				v13.PromptPurchase(LocalPlayer, p3, "Product")
				v16.Close()
			end
		}))
	end
	function t.Cancel() --[[ Cancel | Line: 615 ]]
		return true
	end
	Prompt(t)
end
function t.Destroy(p1) --[[ Destroy | Line: 621 ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
function t.Init(p1) --[[ Init | Line: 627 | Upvalues: v4 (copy), t (copy) ]]
	v4.new("WorldStockHorse", t):Init()
end
v27.OnClientEvent:Connect(function(p1, p2) --[[ Line: 631 | Upvalues: v6 (copy), v26 (copy) ]]
	v6:DisplaySlot({
		Type = "Purchased",
		AllowNaming = true,
		MobileClickBackgroundToClose = true,
		Slot = v26:GetItemFolder("Animals"):WaitForChild(p2)
	})
end)
t.Init()
return t