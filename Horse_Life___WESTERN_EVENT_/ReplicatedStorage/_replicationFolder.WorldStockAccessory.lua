-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local v3 = Sonar("Limited")
local v4 = Sonar("ItemDataService")
local v5 = Sonar("ItemReplicationService")
local v6 = Sonar("InteractMenu")
local v7 = Sonar("PromptClient")
local v8 = Sonar("spr")
local v9 = Sonar("RemoteUtils")
local v10 = Sonar("NotificationsClient")
local v11 = Sonar("FormatNumber")
local v12 = Sonar("ButtonTest")
local v13 = Sonar("WeightedProbability")
local v14 = Sonar("MarketplaceUtils")
local v15 = Sonar("StorageUtils")
local v16 = Sonar("PlayerWrapper")
local v17 = Sonar("LimitedStockUnlocks")
local v18 = Sonar("StockItemGui")
local v19 = Sonar("GameVersionUtils")
local _ = RunService:IsStudio() and false
local v20 = Sonar("Constants")
local LimitedStockAccessories = v20.LimitedStockAccessories
local v21 = v19:IsPrivateServer() or v19:IsReserved()
local LocalPlayer = Players.LocalPlayer
local v22 = v16.GetClient()
local v23 = v9.GetRemoteEvent("LimitedStockAccessoryPurchaseComplete")
local v24 = v9.GetRemoteFunction("PurchaseLimitedStockAccessory")
local v25 = v9.GetRemoteEvent("SetLimitedStockAccessoryStockId")
local v26 = v9.GetRemoteFunction("StartLimitedStockUnlockRemote")
local v27 = v9.GetRemoteFunction("CompleteLimitedStockUnlockRemote")
local v28 = Sonar(v15.Get("LimitedStockProducts"))
local function FindStockId(p1) --[[ FindStockId | Line: 51 | Upvalues: LimitedStockAccessories (copy) ]]
	for v2, v3 in LimitedStockAccessories do
		if v3.StockId == p1 then
			return v3
		end
	end
	return nil
end
local function GetThemeName(p1) --[[ GetThemeName | Line: 64 | Upvalues: v13 (copy), v20 (copy) ]]
	if p1 == "Random" then
		return v13.getRandomWeightedItem(v20.RandomEquipmentDropThemes)
	else
		return p1
	end
end
local function ApplyThemeToModel(p1, p2, p3) --[[ ApplyThemeToModel | Line: 71 ]]
	if not (p3 and p3.RegionsByTag) then
		return
	end
	for v2, v3 in p1:IsA("BasePart") and { p1 } or p1:GetDescendants() do
		if v3:IsA("BasePart") then
			for v4, v5 in v3:GetTags() do
				local v6 = p3.RegionsByTag[v5]
				if v6 then
					if v6.Texture and v3:IsA("MeshPart") then
						v3.TextureID = v6.Texture
					end
					if v6.Color then
						v3.Color = v6.Color
					end
					if v6.Material then
						v3.Material = Enum.Material[v6.Material]
					end
					v3.MaterialVariant = v6.MaterialVariant or ""
				end
			end
		end
	end
end
function t.new(p1) --[[ new | Line: 100 | Upvalues: t (copy), v2 (copy), LimitedStockAccessories (copy), v3 (copy), v4 (copy), v5 (copy), v13 (copy), v20 (copy), ApplyThemeToModel (copy), RunService (copy), v8 (copy), v22 (copy), v6 (copy), v17 (copy), v21 (copy), v7 (copy), v28 (copy), v18 (copy) ]]
	local v23 = setmetatable({}, t)
	for v32, v42 in p1.Data:GetChildren() do
		v23[v42.Name] = v42.Value
	end
	v23.Maid = v2.new()
	local StockId = v23.StockId
	local v52 = nil
	for v62, v72 in LimitedStockAccessories do
		if v72.StockId == StockId then
			v52 = v72
			break
		end
	end
	v23.StockInfo = v52
	if not v23.StockInfo then
		warn("WorldStockAccessory: Could not find StockInfo for StockId:", v23.StockId)
		return v23
	end
	v23.Display = p1:FindFirstChild("StockAccessoryDisplay")
	if v23.Display then
		v23.Display.Frame.Title.Text = v23.StockInfo.DisplayName or v23.StockInfo.Name
		if v23.StockId then
			local v9 = v3:GetSoldCountValue(v23.StockId)
			v23.SoldCountValue = v9
			v23:UpdateStockDisplay()
			v23.Maid:GiveTask(v9:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 125 | Upvalues: v23 (copy) ]]
				v23:UpdateStockDisplay()
			end))
		end
	end
	local v10 = v4.GetByName(v23.StockInfo.Name)
	if not v10 then
		warn("WorldStockAccessory: Could not find ItemData for:", v23.StockInfo.Name)
		return v23
	end
	local v11 = v5.Get(v10.Name):Clone()
	local WorldStockAccessory = Instance.new("Model")
	v11.Parent = WorldStockAccessory
	local Theme = v23.StockInfo.Theme
	local v12 = if Theme == "Random" then v13.getRandomWeightedItem(v20.RandomEquipmentDropThemes) else Theme
	if v12 and v12 ~= "" then
		local v14 = v4.GetByName(v12)
		if v14 then
			ApplyThemeToModel(WorldStockAccessory, v10, v14)
		end
	end
	v23.AccessoryModel = WorldStockAccessory
	if WorldStockAccessory:IsA("BasePart") then
		WorldStockAccessory.Anchored = true
	elseif WorldStockAccessory:IsA("Model") then
		for v15, v16 in WorldStockAccessory:GetDescendants() do
			if v16:IsA("BasePart") then
				v16.Anchored = true
			end
		end
	end
	local v172 = WorldStockAccessory:IsA("Model") and WorldStockAccessory:GetExtentsSize() or WorldStockAccessory.Size
	v23.offsetCFrame = p1.CFrame + Vector3.new(0, v172.Y + 5, 0)
	v23.rotationAccumulator = 0
	WorldStockAccessory:ScaleTo(5)
	if WorldStockAccessory:IsA("Model") then
		WorldStockAccessory:PivotTo(v23.offsetCFrame)
	else
		WorldStockAccessory.CFrame = v23.offsetCFrame
	end
	WorldStockAccessory.Name = "WorldStockAccessory"
	WorldStockAccessory.Parent = workspace
	v23.Maid:GiveTask(WorldStockAccessory)
	if v23.StockInfo.Theme == "Random" then
		local t2 = {}
		for v202 in v20.RandomEquipmentDropThemes do
			table.insert(t2, v202)
		end
		local v212 = 1
		local v222 = 0
		v23.Maid:GiveTask(RunService.Heartbeat:Connect(function(p1) --[[ Line: 190 | Upvalues: v23 (copy), v222 (ref), v212 (ref), t2 (copy), v4 (ref), ApplyThemeToModel (ref), WorldStockAccessory (ref), v10 (copy), v8 (ref) ]]
			v23.rotationAccumulator = v23.rotationAccumulator + 0.004363323129985824
			v222 = v222 + p1
			if v222 >= 3 then
				v222 = 0
				v212 = v212 % #t2 + 1
				local v2 = v4.GetByName(t2[v212])
				if v2 then
					ApplyThemeToModel(WorldStockAccessory, v10, v2)
				end
			end
			if WorldStockAccessory:IsA("Model") then
				v8.target(WorldStockAccessory, 10, 10, {
					Pivot = v23.offsetCFrame * CFrame.Angles(0, v23.rotationAccumulator, 0)
				})
			else
				v8.target(WorldStockAccessory, 10, 10, {
					CFrame = v23.offsetCFrame * CFrame.Angles(0, v23.rotationAccumulator, 0)
				})
			end
		end))
	else
		v23.Maid:GiveTask(RunService.Heartbeat:Connect(function(p1) --[[ Line: 215 | Upvalues: v23 (copy), WorldStockAccessory (ref), v8 (ref) ]]
			v23.rotationAccumulator = v23.rotationAccumulator + 0.004363323129985824
			if WorldStockAccessory:IsA("Model") then
				v8.target(WorldStockAccessory, 10, 10, {
					Pivot = v23.offsetCFrame * CFrame.Angles(0, v23.rotationAccumulator, 0)
				})
			else
				v8.target(WorldStockAccessory, 10, 10, {
					CFrame = v23.offsetCFrame * CFrame.Angles(0, v23.rotationAccumulator, 0)
				})
			end
		end))
	end
	v23.CurrencyData = v4.GetByName(v23.StockInfo.Currency)
	local t2 = { v22.MissionsChangedSignal }
	if v23.SoldCountValue then
		table.insert(t2, v23.SoldCountValue:GetPropertyChangedSignal("Value"))
	end
	v23.InteractMenu = v6.new(p1, {
		Hint = function() --[[ Hint | Line: 238 | Upvalues: v17 (ref), v23 (copy) ]]
			if not v17.MissionUnlockRequired(v23.StockInfo) then
				return "Purchase"
			end
			local v1 = v23:GetMissionState()
			if v1 == "Completed" or not v23:HasStockLeft() then
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
		Run = function() --[[ Run | Line: 256 | Upvalues: v21 (ref), v7 (ref), v17 (ref), v23 (copy), v28 (ref), v18 (ref) ]]
			if v21 then
				v7.Prompt({
					Type = "PrivateServerLimitedItemsDisabled",
					Run = function() --[[ Run | Line: 261 ]]
						return true
					end,
					Cancel = function() --[[ Cancel | Line: 265 ]]
						return true
					end
				})
				return
			end
			if not v17.MissionUnlockRequired(v23.StockInfo) then
				v23:_runCoinStockPurchaseFlow()
				return
			end
			local ProductId = v28.BuyInStock.ProductId
			local ProductId_2 = v28.BuyOutOfStock.ProductId
			local v1 = v23:GetMissionState()
			if v1 == "Completed" then
				if v23:_hasReachedMissionCoinLimit() then
					v23:_promptRobuxPurchase(ProductId, ProductId_2, true)
				else
					v23:_runCoinStockPurchaseFlow(true)
				end
			else
				if v1 == "ReadyToClaim" then
					v23:_claimMission()
					return
				end
				if v1 == "InProgress" then
					v18.Open(v23.StockInfo.StockId)
					return
				end
				if v23:HasStockLeft() then
					v23:_acceptMission()
				else
					v23:_promptRobuxPurchase(ProductId, ProductId_2)
				end
			end
		end,
		GetRange = function() --[[ GetRange | Line: 306 ]]
			return 25
		end
	})
	v23.Maid:GiveTask(v23.InteractMenu)
	return v23
end
function t.GetSoldCount(p1) --[[ GetSoldCount | Line: 316 ]]
	if p1.SoldCountValue then
		return p1.SoldCountValue.Value
	else
		return 0
	end
end
function t.GetMaxStock(p1) --[[ GetMaxStock | Line: 323 ]]
	if p1.StockInfo then
		return p1.StockInfo.MaxStock or 0
	else
		return 0
	end
end
function t.GetStockRemaining(p1) --[[ GetStockRemaining | Line: 330 ]]
	return math.max(0, p1:GetMaxStock() - p1:GetSoldCount())
end
function t.HasStockLeft(p1) --[[ HasStockLeft | Line: 336 ]]
	return p1:GetStockRemaining() > 0
end
function t.GetMissionState(p1) --[[ GetMissionState | Line: 340 | Upvalues: v22 (copy) ]]
	local LimitedStockUnlocks = v22.PlayerData.Missions:FindFirstChild("LimitedStockUnlocks")
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
function t.GetMissionFolder(p1) --[[ GetMissionFolder | Line: 364 | Upvalues: v22 (copy) ]]
	local LimitedStockUnlocks = v22.PlayerData.Missions:FindFirstChild("LimitedStockUnlocks")
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
function t._hasReachedMissionCoinLimit(p1) --[[ _hasReachedMissionCoinLimit | Line: 380 | Upvalues: v22 (copy) ]]
	local LimitedAccessoryStockBought = v22.PlayerData:FindFirstChild("LimitedAccessoryStockBought")
	if not LimitedAccessoryStockBought then
		return false
	end
	local v1 = LimitedAccessoryStockBought:FindFirstChild(p1.StockInfo.StockId)
	return if v1 == nil then false else v1.Value >= 3
end
function t._runCoinStockPurchaseFlow(p1, p2) --[[ _runCoinStockPurchaseFlow | Line: 390 | Upvalues: v28 (copy), v25 (copy), v7 (copy), v14 (copy), LocalPlayer (copy), v11 (copy), v12 (copy), v24 (copy), v10 (copy) ]]
	local ProductId = v28.BuyInStock.ProductId
	local ProductId_2 = v28.BuyOutOfStock.ProductId
	local CurrencyData = p1.CurrencyData
	if p1:HasStockLeft() then
		v7.Prompt({
			Type = "PurchaseLimitedAccessory",
			Setup = function(p12, p2) --[[ Setup | Line: 420 | Upvalues: CurrencyData (copy), v11 (ref), p1 (copy), v14 (ref), ProductId (copy), v12 (ref), v25 (ref), LocalPlayer (ref), v7 (ref) ]]
				p12.Content.Price.IconLabel.Image = CurrencyData.Image
				p12.Content.Price.TextLabel.Text = v11.splice(p1.StockInfo.Price)
				p2.Maid:GiveTask(task.spawn(function() --[[ Line: 424 | Upvalues: v14 (ref), ProductId (ref), p12 (copy) ]]
					local v1 = v14.GetProductInfo(ProductId, Enum.InfoType.Product)
					local v2 = if v1 then v1.PriceInRobux or "N/A" else "N/A"
					p12.Content.PremiumPrice.Top.TextLabel.Text = ("%*%*"):format(utf8.char(57346), v2)
				end))
				p2.Maid:GiveTask(v12.new(p12.Content.PremiumPrice, {
					Click = function() --[[ Click | Line: 431 | Upvalues: v25 (ref), p1 (ref), v14 (ref), LocalPlayer (ref), ProductId (ref), v7 (ref) ]]
						v25:FireServer(p1.StockInfo.StockId)
						v14.PromptPurchase(LocalPlayer, ProductId, "Product")
						v7.Close()
					end
				}))
			end,
			Run = function() --[[ Run | Line: 438 | Upvalues: v24 (ref), p1 (copy), p2 (copy), ProductId (copy), ProductId_2 (copy), v25 (ref), v14 (ref), LocalPlayer (ref), v10 (ref) ]]
				local v1, v2 = v24:InvokeServer(p1.StockInfo.StockId)
				if v1 then
					v10.Notify({
						Preset = "Green",
						Message = "Purchased! Serial #" .. v2
					})
					return true
				end
				if v2 == "LimitReached" and p2 then
					p1:_promptRobuxPurchase(ProductId, ProductId_2, true)
					return
				end
				if v2 == "CannotAfford" then
					v25:FireServer(p1.StockInfo.StockId)
					v14.PromptPurchase(LocalPlayer, ProductId, "Product")
				else
					v10.Notify({
						Preset = "Red",
						Message = v2
					})
				end
			end,
			Cancel = function() --[[ Cancel | Line: 464 ]]
				return true
			end
		})
		return
	end
	v25:FireServer(p1.StockInfo.StockId)
	local Prompt = v7.Prompt
	local t = {}
	t.Type = if p2 then "SoldOutLimitedMissionAccessory" else "SoldOutLimitedAccessory"
	function t.Setup(p1, p2) --[[ Setup | Line: 400 | Upvalues: v14 (ref), ProductId_2 (copy) ]]
		p2.Maid:GiveTask(task.spawn(function() --[[ Line: 401 | Upvalues: v14 (ref), ProductId_2 (ref), p1 (copy) ]]
			local v1 = v14.GetProductInfo(ProductId_2, Enum.InfoType.Product)
			local v2 = if v1 then v1.PriceInRobux or "N/A" else "N/A"
			p1.Content.RunButton.Top.TextLabel.Text = ("%*%*"):format(utf8.char(57346), v2)
		end))
	end
	function t.Run() --[[ Run | Line: 407 | Upvalues: v14 (ref), LocalPlayer (ref), ProductId_2 (copy) ]]
		v14.PromptPurchase(LocalPlayer, ProductId_2, "Product")
		return true
	end
	function t.Cancel() --[[ Cancel | Line: 411 ]]
		return true
	end
	Prompt(t)
end
function t._acceptMission(p1) --[[ _acceptMission | Line: 470 | Upvalues: v26 (copy), v10 (copy), v22 (copy), v18 (copy) ]]
	local v1, v2 = v26:InvokeServer(p1.StockInfo.StockId, nil)
	if v1 then
		if not v22.MissionsChangedSignal then
			v18.Open(p1.StockInfo.StockId)
			v10.Notify({
				Message = "Mission accepted!",
				Preset = "Green"
			})
			return
		end
		v22.MissionsChangedSignal:Fire()
		v18.Open(p1.StockInfo.StockId)
		v10.Notify({
			Message = "Mission accepted!",
			Preset = "Green"
		})
	else
		local v3 = "Failed to accept mission"
		if v2 == "AlreadyStarted" then
			v3 = "You already have a mission for this item!"
		elseif v2 == "TooManyActive" then
			v3 = "Complete your current stock mission first!"
		end
		v10.Notify({
			Preset = "Red",
			Message = v3
		})
	end
end
function t._claimMission(p1) --[[ _claimMission | Line: 497 | Upvalues: v27 (copy), v10 (copy) ]]
	local v1 = p1:GetMissionFolder()
	if not v1 or (not v1.Completed.Value or v1.Claimed.Value) then
		return
	end
	local v2, v3, _ = v27:InvokeServer(v1.Name)
	if v2 then
		v10.Notify({
			Preset = "Green",
			Message = "Claimed! Serial #" .. tostring(v3)
		})
	else
		v10.Notify({
			Preset = "Red",
			Message = "Failed to claim mission reward: " .. tostring(v3)
		})
	end
end
function t._promptRobuxPurchase(p1, p2, p3, p4) --[[ _promptRobuxPurchase | Line: 517 | Upvalues: v25 (copy), v7 (copy), v14 (copy), LocalPlayer (copy) ]]
	local v1 = not p1:HasStockLeft() and p3 or p2
	v25:FireServer(p1.StockInfo.StockId)
	local t = {}
	t.Type = if p4 then "SoldOutLimitedMissionAccessory" else "SoldOutLimitedAccessory"
	function t.Setup(p1, p2) --[[ Setup | Line: 527 | Upvalues: v14 (ref), v1 (copy) ]]
		p2.Maid:GiveTask(task.spawn(function() --[[ Line: 528 | Upvalues: v14 (ref), v1 (ref), p1 (copy) ]]
			local v12 = v14.GetProductInfo(v1, Enum.InfoType.Product)
			local v2 = if v12 then v12.PriceInRobux or "N/A" else "N/A"
			p1.Content.RunButton.Top.TextLabel.Text = ("%*%*"):format(utf8.char(57346), v2)
		end))
	end
	function t.Run() --[[ Run | Line: 534 | Upvalues: v14 (ref), LocalPlayer (ref), v1 (copy) ]]
		v14.PromptPurchase(LocalPlayer, v1, "Product")
		return true
	end
	function t.Cancel() --[[ Cancel | Line: 538 ]]
		return true
	end
	v7.Prompt(t)
end
function t.UpdateStockDisplay(p1) --[[ UpdateStockDisplay | Line: 544 ]]
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
	else
		FullLabel.Text = "SOLD OUT - Available for " .. utf8.char(57346)
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
function t.Destroy(p1) --[[ Destroy | Line: 574 ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
function t.Init(p1) --[[ Init | Line: 580 | Upvalues: v1 (copy), t (copy) ]]
	v1.new("WorldStockAccessory", t):Init()
end
v23.OnClientEvent:Connect(function(p1) --[[ Line: 584 | Upvalues: v10 (copy) ]]
	v10.Notify({
		Preset = "Green",
		Message = if p1 then "Purchased! Serial #" .. tostring(p1) else "Purchased!"
	})
end)
t.Init()
return t