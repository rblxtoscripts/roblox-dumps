-- https://lua.expert/
("[%*]:"):format(script.Name)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
game:GetService("ContextActionService")
local Library = require(ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Utility")
local v2 = Library:Load("Queue")
local v3 = Library:Load("Network")
local v4 = Library:Load("SoundFX")
local Dialog = require(ReplicatedStorage:WaitForChild("Dialog"))
local LocalPlayer = Players.LocalPlayer
local Moneyz = LocalPlayer:WaitForChild("Moneyz")
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
PlayerGui:WaitForChild("UIEvents")
local v5 = script.Parent
local Body = v5:WaitForChild("Body")
local Buy = Body:WaitForChild("Buy")
local Title = v5:WaitForChild("Title")
local CancelButton = v5:WaitForChild("CancelButton")
require(ReplicatedStorage:WaitForChild("Enums"))
local Right = Body.Content.Right
local Amount = Right.Coins.Amount
local Buttons = Right.Buttons
if _G.GamepadEnabled then
	Buttons = Right.GamepadButtons
	CancelButton.Visible = false
	Buy.Visible = false
	v5.AButton.Visible = true
end
Buttons.Visible = true
local Amount_2 = Buttons.Amount
Amount_2.Text = 1
local Plus = Buttons.Plus
local Minus = Buttons.Minus
local AssetImage = Body.Content.AssetImage
local BulkFurniture = ReplicatedStorage._v6FiRE_Additions.BulkFurniture
local Client_GetAssetQuantity = BulkFurniture.Client_GetAssetQuantity
local v6 = GuiManager:RegisterWindow(v5, "Left", "Right")
v6.FirstSelectedItem = Buy
v2.new()
local Position = Buy.Position
require(ReplicatedStorage.AssetLibraryManager)
local v7 = 1
local v8 = -1
local v9 = nil
local v10 = false
local function _updateButtonTransparency(p1, p2) --[[ _updateButtonTransparency | Line: 79 ]]
	local Foreground = p1.Foreground
	p1.Transparency = if p2 then 0 else 0.5
	Foreground.Transparency = if p2 then 0 else 1
end
local function getMostCanAfford() --[[ getMostCanAfford | Line: 90 | Upvalues: Moneyz (copy), v8 (ref) ]]
	local v1 = Moneyz.Value
	if v8 <= 0 then
		return 0
	else
		return math.floor(v1 / v8)
	end
end
local function getCurrentQuantity() --[[ getCurrentQuantity | Line: 104 | Upvalues: v9 (ref), Client_GetAssetQuantity (copy) ]]
	if v9 then
		return Client_GetAssetQuantity:Invoke(v9) or 0
	else
		return 0
	end
end
local function calculateMaxAmount() --[[ calculateMaxAmount | Line: 117 | Upvalues: v9 (ref), Client_GetAssetQuantity (copy), v10 (ref), Moneyz (copy), v8 (ref) ]]
	local v1 = if v9 then Client_GetAssetQuantity:Invoke(v9) or 0 else 0
	return math.max(0, if v10 then v1 else math.min(if v8 <= 0 then 0 else math.floor(Moneyz.Value / v8), 500 - v1)), v1
end
local v11 = nil
local function _getAmount(p1) --[[ _getAmount | Line: 150 | Upvalues: Amount_2 (copy), v9 (ref), Client_GetAssetQuantity (copy), v10 (ref), Moneyz (copy), v8 (ref), v4 (copy), Dialog (copy), v11 (ref), Minus (copy), Plus (copy), v7 (ref) ]]
	if not p1 then
		p1 = 0
	end
	local v1 = tonumber(Amount_2.Text) + p1
	local v2 = if v9 then Client_GetAssetQuantity:Invoke(v9) or 0 else 0
	local v92 = math.max(0, if v10 then v2 else math.min(if v8 <= 0 then 0 else math.floor(Moneyz.Value / v8), 500 - v2))
	if v92 < 1 then
		v4:PlaySound("Invalid")
		if v2 >= 500 then
			Dialog:ShowMessage("Item Limit Reached", "You can only hold a maximum of 500 per item")
		elseif v10 then
			Dialog:ShowMessage("Insufficient Quantity", "You don\'t have any more of this item to sell")
		else
			Dialog:ShowMessage("Insufficient Funds", "You don\'t have enough Coins to afford this")
		end
		v11 = false
	else
		local v102 = math.clamp(v1, 1, v92)
		local v112 = Minus
		local v12 = v102 > 1
		local Foreground = v112.Foreground
		v112.Transparency = if v12 then 0 else 0.5
		Foreground.Transparency = if v12 then 0 else 1
		local v17 = Plus
		local v18 = v102 < v92
		local Foreground_2 = v17.Foreground
		v17.Transparency = if v18 then 0 else 0.5
		Foreground_2.Transparency = if v18 then 0 else 1
		Amount_2.Text = v7
		return v102
	end
end
function comma_value(p1) --[[ comma_value | Line: 202 ]]
	local v1 = p1
	local v2
	while true do
		local v3
		v2, v3 = string.gsub(v1, "^(-?%d+)(%d%d%d)", "%1,%2")
		if v3 == 0 then
			break
		end
		v1 = v2
	end
	return v2
end
local function UpdateAmount(p1) --[[ UpdateAmount | Line: 217 | Upvalues: _getAmount (copy), v7 (ref), Amount_2 (copy), Amount (copy), v8 (ref) ]]
	local v1 = _getAmount(p1) or 1
	v7 = v1
	Amount_2.Text = v1
	Amount.Text = comma_value(v1 * v8)
end
local v12 = 0
local v13 = false
local function setupHoldToIncrement(p1, p2) --[[ setupHoldToIncrement | Line: 234 | Upvalues: v13 (ref), _getAmount (copy), v7 (ref), Amount_2 (copy), Amount (copy), v8 (ref), v12 (ref) ]]
	local v1 = if game["Run Service"]:IsStudio() then 0 else 0.07
	local function stopHolding() --[[ stopHolding | Line: 243 | Upvalues: v13 (ref) ]]
		v13 = false
	end
	local function onMouseButton1Down() --[[ onMouseButton1Down | Line: 247 | Upvalues: v13 (ref), p2 (copy), _getAmount (ref), v7 (ref), Amount_2 (ref), Amount (ref), v8 (ref), v12 (ref), v1 (ref) ]]
		v13 = true
		local v14 = _getAmount(p2) or 1
		v7 = v14
		Amount_2.Text = v14
		Amount.Text = comma_value(v14 * v8)
		task.spawn(function() --[[ Line: 254 | Upvalues: v12 (ref), v13 (ref), p2 (ref), _getAmount (ref), v7 (ref), Amount_2 (ref), Amount (ref), v8 (ref), v1 (ref) ]]
			v12 = v12 + 1
			task.wait(0.5)
			while v13 and v12 == v12 do
				local v2 = _getAmount(p2) or 1
				v7 = v2
				Amount_2.Text = v2
				Amount.Text = comma_value(v2 * v8)
				task.wait(v1)
			end
		end)
	end
	if _G.GamepadEnabled then
		v13 = true
		local v2 = _getAmount(p2) or 1
		v7 = v2
		Amount_2.Text = v2
		Amount.Text = comma_value(v2 * v8)
		task.spawn(function() --[[ Line: 254 | Upvalues: v12 (ref), v13 (ref), p2 (copy), _getAmount (ref), v7 (ref), Amount_2 (ref), Amount (ref), v8 (ref), v1 (ref) ]]
			v12 = v12 + 1
			task.wait(0.5)
			while v13 and v12 == v12 do
				local v2 = _getAmount(p2) or 1
				v7 = v2
				Amount_2.Text = v2
				Amount.Text = comma_value(v2 * v8)
				task.wait(v1)
			end
		end)
	else
		p1.MouseButton1Down:Connect(onMouseButton1Down)
		p1.MouseButton1Up:Connect(stopHolding)
		p1.MouseLeave:Connect(stopHolding)
	end
end
if not _G.GamepadEnabled then
	setupHoldToIncrement(Minus, -1)
	setupHoldToIncrement(Plus, 1)
end
local t = {}
local function disconnectConnections() --[[ disconnectConnections | Line: 295 | Upvalues: t (copy) ]]
	for k, v in pairs(t) do
		if v then
			v:Disconnect()
		end
		t[k] = nil
	end
end
local function onBuyClicked() --[[ onBuyClicked | Line: 305 | Upvalues: v10 (ref), v1 (copy), v9 (ref), v7 (ref), v4 (copy), v3 (copy), v11 (ref) ]]
	if v10 then
		v1:SendData("SellInventoryItem", "PlayerChannel", nil, v9, v7)
	elseif not v3:InvokeServer("BuyCatalogItem", v9, v7) then
		v11 = true
		return
	end
	v4:PlaySound("CashRegister")
	v11 = true
end
local function onCancelClicked() --[[ onCancelClicked | Line: 319 | Upvalues: v11 (ref) ]]
	print("cancel")
	v11 = false
end
local function initGamePadActions() --[[ initGamePadActions | Line: 324 | Upvalues: v6 (copy), v11 (ref), v13 (ref), setupHoldToIncrement (copy), Minus (copy), Plus (copy), onBuyClicked (copy) ]]
	v6:RegisterGamepadAction(Enum.KeyCode.ButtonB, function(p1, p2, p3) --[[ Line: 326 | Upvalues: v11 (ref) ]]
		if p2 ~= Enum.UserInputState.Begin then
			return
		end
		v11 = false
	end)
	v6:RegisterGamepadAction(Enum.KeyCode.DPadLeft, function(p1, p2, p3) --[[ Line: 332 | Upvalues: v13 (ref), setupHoldToIncrement (ref), Minus (ref) ]]
		if p2 == Enum.UserInputState.Begin then
			v13 = true
			setupHoldToIncrement(Minus, -1)
			return
		end
		if p2 ~= Enum.UserInputState.End then
			return
		end
		v13 = false
	end)
	v6:RegisterGamepadAction(Enum.KeyCode.DPadRight, function(p1, p2, p3) --[[ Line: 341 | Upvalues: setupHoldToIncrement (ref), Plus (ref), v13 (ref) ]]
		if p2 == Enum.UserInputState.Begin then
			setupHoldToIncrement(Plus, 1)
			return
		end
		if p2 ~= Enum.UserInputState.End then
			return
		end
		v13 = false
	end)
	v6:RegisterGamepadAction(Enum.KeyCode.ButtonA, function(p1, p2, p3) --[[ Line: 349 | Upvalues: onBuyClicked (ref) ]]
		if p2 ~= Enum.UserInputState.Begin then
			return
		end
		onBuyClicked()
	end)
end
function InitBulkPurchase(p1, p2, p3, p4) --[[ InitBulkPurchase | Line: 356 | Upvalues: initGamePadActions (copy), t (copy), v9 (ref), v7 (ref), Amount_2 (copy), v8 (ref), Title (copy), AssetImage (copy), v11 (ref), _getAmount (copy), Amount (copy), Buy (copy), onBuyClicked (copy), CancelButton (copy), onCancelClicked (copy), v6 (copy) ]]
	if _G.GamepadEnabled then
		initGamePadActions()
	end
	for k, v in pairs(t) do
		if v then
			v:Disconnect()
		end
		t[k] = nil
	end
	v9 = p1
	v7 = 1
	Amount_2.Text = 1
	v8 = p3
	Title.Text = p4
	AssetImage.Image = p2
	v11 = nil
	local v1 = _getAmount(nil) or 1
	v7 = v1
	Amount_2.Text = v1
	Amount.Text = comma_value(v1 * p3)
	table.insert(t, Buy.MouseButton1Click:Connect(onBuyClicked))
	table.insert(t, CancelButton.MouseButton1Click:Connect(onCancelClicked))
	if v11 == nil then
		v6:SetVisible(true)
	end
	while v11 == nil do
		wait()
	end
	for k, v in pairs(t) do
		if v then
			v:Disconnect()
		end
		t[k] = nil
	end
	v6:SetVisible(false)
	wait(v6.TweenDuration)
end
local function initSellMode(p1) --[[ initSellMode | Line: 395 | Upvalues: Buy (copy), v5 (copy), v10 (ref) ]]
	local v1 = if p1 then "SELL" else "BUY"
	Buy.Foreground.TextLabel.Text = v1
	v5.AButton.TextLabel.Text = v1
	v10 = p1
end
local v14 = false
local function _InitLogic(p1, ...) --[[ _InitLogic | Line: 405 | Upvalues: v14 (ref), Buy (copy), v5 (copy), v10 (ref) ]]
	if v14 then
		return
	end
	v14 = true
	local v1 = if p1 then "SELL" else "BUY"
	Buy.Foreground.TextLabel.Text = v1
	v5.AButton.TextLabel.Text = v1
	v10 = p1
	InitBulkPurchase(...)
	v14 = false
end
BulkFurniture.StartBulkPurchase.Event:connect(function(...) --[[ Line: 417 | Upvalues: _InitLogic (copy) ]]
	_InitLogic(false, ...)
end)
BulkFurniture.StartBulkSell.Event:connect(function(...) --[[ Line: 421 | Upvalues: _InitLogic (copy) ]]
	_InitLogic(true, ...)
end)