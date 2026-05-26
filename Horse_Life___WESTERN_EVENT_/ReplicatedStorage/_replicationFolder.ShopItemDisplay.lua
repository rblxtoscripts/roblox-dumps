-- https://lua.expert/
local t = {
	SubContexts = { "ItemDisplay", "PriceDisplay" }
}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("Maid")
local v3 = Sonar("safeDestroy")
local v4 = Sonar("FormatNumber")
local v5 = Sonar("EventUtils")
function t.new(p1) --[[ new | Line: 16 | Upvalues: t (copy), v2 (copy), v1 (copy), v5 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.Context = p1
	v22.Config = v1.GetComponentConfig(p1)
	v22.Instance = p1.Instance
	v22.ItemDisplay = v1.AddComponent("ItemDisplay", v22)
	v22.Maid:GiveTask(v22.ItemDisplay)
	if v1.FindElement(v22.Instance, "PriceLabel") then
		v22.Button = v22.Context.Button
		if v22.Config.ColorButtonToCurrency and v22.Config.Price then
			v22.Config.Price.ColorToCurrency = true
		end
		v22.PriceDisplay = v1.AddComponent("PriceDisplay", v22)
		v22.Maid:GiveTask(v22.PriceDisplay)
	end
	v22.StockConfig = p1.Stock or {}
	v22.StockLabel = v22.StockLabel or v1.FindElement(v22.Instance, "StockLabel")
	if v22.StockConfig.Changed then
		v22.StockChanged = v5.getConnectionEvents(v22.StockConfig.Changed)
		for v52, v6 in v22.StockChanged do
			v22.Maid:GiveTask(v6:Connect(function() --[[ Line: 46 | Upvalues: v22 (copy) ]]
				v22:_setStock()
			end))
		end
	end
	v22:_setStock()
	v22.BuyButtons = {}
	v22.BuyButton = v22.BuyButton or v1.FindElement(v22.Instance, "BuyButton")
	if v22.BuyButton then
		v22.BuyButtons[v22.BuyButton] = true
	end
	if not p1.DoNotIncludeInstance and v22.Instance:IsA("GuiButton") then
		v22.BuyButtons[v22.Instance] = true
	end
	for v8, v9 in v22.BuyButtons do
		if v22.Config.Purchase then
			if v22.Context.ButtonInstance == v8 then
				if v22.Context.ButtonActions then
					function v22.Context.ButtonActions.OnClick() --[[ Line: 76 | Upvalues: v22 (copy) ]]
						v22.Config.Purchase(false)
					end
				end
			else
				v22.BuyButton = v1.AddComponent("Button", {
					Instance = v8,
					OnClick = function() --[[ OnClick | Line: 83 | Upvalues: v22 (copy) ]]
						v22.Config.Purchase(false)
					end
				})
				v22.Maid:GiveTask(v22.BuyButton)
			end
			v8.Visible = v22.Config.Price.Value
		end
	end
	v22:_setButtonCurrencyColor()
	v22.BuyButtonRobux = v22.BuyButtonRobux or v1.FindElement(v22.Instance, "BuyButtonRobux")
	if v22.BuyButtonRobux then
		v22.ContainsRobuxPurchase = if v22.Config.Price.ProductId == nil then if v22.Config.Price.Robux == nil then false else true else true
		if v22.ContainsRobuxPurchase then
			v22.Maid:GiveTask(v1.AddComponent("RobuxDisplay", {
				Instance = v22.BuyButtonRobux,
				ProductId = v22.Config.Price.ProductId,
				Robux = v22.Config.Price.Robux,
				OnClick = function() --[[ OnClick | Line: 103 | Upvalues: v22 (copy) ]]
					v22.Config.Purchase(true)
				end
			}))
			v22.BuyButtonRobux.Visible = true
		else
			v22.BuyButtonRobux.Visible = false
		end
	end
	v22.AddOnComponents = v1.AddOnComponents("ShopItemDisplay", v22)
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 120 | Upvalues: v3 (copy) ]]
	v3(p1)
end
function t._getStockAmount(p1) --[[ _getStockAmount | Line: 124 ]]
	if type(p1.StockConfig.Value) == "function" then
		return p1.StockConfig.Value(p1)
	end
	if type(p1.StockConfig.Value) == "number" then
		return p1.StockConfig.Value
	else
		return nil
	end
end
function t._setStock(p1) --[[ _setStock | Line: 134 | Upvalues: v4 (copy) ]]
	if not p1.StockLabel then
		return
	end
	local v1, v2 = p1:_getStockAmount()
	if not v1 then
		p1.StockLabel.Visible = false
		return
	end
	p1.StockLabel.Text = p1.StockConfig.Format and p1.StockConfig.Format(v1, v2) or v4.suffix(v1) .. "/" .. v4.suffix(v2)
	p1.StockLabel.Visible = true
end
function t._setButtonCurrencyColor(p1) --[[ _setButtonCurrencyColor | Line: 149 ]]
	if not p1.PriceDisplay then
		return
	end
	p1.PriceDisplay:_setButtonCurrencyColor()
end
function t.Reset(p1) --[[ Reset | Line: 155 ]]
	if p1.ItemDisplay then
		p1.ItemDisplay:Reset()
	end
	if p1.PriceDisplay then
		p1.PriceDisplay:Reset()
	end
	if not p1.BuyButtonRobux then
		return
	end
	p1.BuyButtonRobux.Visible = false
end
return t