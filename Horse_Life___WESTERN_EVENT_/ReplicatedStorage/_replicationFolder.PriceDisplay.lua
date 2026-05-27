-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("Maid")
local v3 = Sonar("safeDestroy")
local v4 = Sonar("EventUtils")
local v5 = Sonar("FormatNumber")
local v6 = Sonar("StorageUtils")
local v7 = Sonar("Signal")
local v8 = Sonar("TableUtils")
local DefaultCurrency = v6.GetConfig("ItemsWrapper")().DefaultCurrency
local v9 = Sonar("PlayerWrapper").GetClient()
local v10 = v6.GetConfig("GuiFramework")()
function t.new(p1) --[[ new | Line: 34 | Upvalues: t (copy), v2 (copy), v1 (copy), v10 (copy), v4 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.Context = p1
	v22.Config = v1.GetComponentConfig(p1, "Price")
	v22.Instance = p1.Instance
	if not v22.Instance then
		warn("\226\154\160\239\184\143 PriceDisplay, Instance is required for item display", p1)
		return v22
	end
	v22.PriceLabel = v22.PriceLabel or (v1.FindElement(v22.Instance, "PriceLabel") or v22.Instance)
	if not v22.PriceLabel then
		return v22
	end
	v22.AffordabilityProperties = if v22.Config.AffordabilityProperties == false then nil else v22.Config.AffordabilityProperties or v10.DefaultAffordabilityProperties
	if v22.Config.Changed then
		v22.Changed = v4.getConnectionEvents(v22.Config.Changed)
		for v5, v6 in v22.Changed do
			v22.Maid:GiveTask(v6:Connect(function() --[[ Line: 60 | Upvalues: v22 (copy) ]]
				v22:_setPrice()
			end))
		end
	end
	v22:_setPrice()
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 70 | Upvalues: v3 (copy) ]]
	v3(p1)
end
function t._getPrice(p1) --[[ _getPrice | Line: 74 | Upvalues: DefaultCurrency (copy) ]]
	if type(p1.Config.Value) == "function" then
		return p1.Config.Value(p1.Context)
	end
	if type(p1.Config.Value) == "table" then
		return p1.Config.Value
	end
	if type(p1.Config.Value) == "number" then
		return {
			[DefaultCurrency] = p1.Config.Value
		}
	else
		return nil
	end
end
function t._setPrice(p1) --[[ _setPrice | Line: 86 | Upvalues: v2 (copy), v1 (copy), v5 (copy), v9 (copy) ]]
	if p1.PriceMaid then
		p1.PriceMaid:DoCleaning()
	end
	if not p1.PriceLabel then
		return
	end
	p1._Price = p1:_getPrice()
	p1:_updateAffordability(true)
	if not p1._Price then
		p1.PriceLabel.Visible = false
		return
	end
	if type(p1._Price) ~= "table" then
		warn("\226\154\160\239\184\143 ShopItemDisplay, Price must be a table", p1.Price, p1.Instance, p1.Config)
		return
	end
	if not p1.PriceMaid then
		p1.PriceMaid = v2.new()
		p1.Maid:GiveTask(p1.PriceMaid)
	end
	local t = {
		DoNotShowToolTip = true,
		Instance = p1.PriceLabel,
		Items = p1._Price
	}
	local t2 = {
		AlwaysVisible = true
	}
	t2.Format = p1.Config.Format or (function(p1) --[[ Line: 119 | Upvalues: v5 (ref) ]]
		return v5.suffix(p1)
	end)
	t.Amount = t2
	t.DoNotSetViewport = p1.Config.DoNotSetViewport
	p1.PriceMaid:GiveTask(v1.AddComponent("MultiItemDisplay", t))
	for v3, v4 in p1:GetPrice() do
		p1.PriceMaid:GiveTask(v9:GetTotalOwnedChangedSignal(v3):Connect(function() --[[ Line: 130 | Upvalues: p1 (copy) ]]
			p1:_updateAffordability()
		end))
	end
	p1:_updateAffordability()
	p1.PriceLabel.Visible = true
	p1:_setButtonCurrencyColor()
end
function t.GetPrice(p1) --[[ GetPrice | Line: 140 ]]
	return p1._Price or p1:_getPrice()
end
function t.CanAfford(p1) --[[ CanAfford | Line: 144 | Upvalues: v9 (copy) ]]
	local v1 = p1:GetPrice()
	if not v1 then
		return false
	end
	for v2, v3 in v1 do
		if not v9:HasRequiredItemAmount(v2, v3) then
			return false
		end
	end
	return true
end
function t.GetCanAffordChangedSignal(p1) --[[ GetCanAffordChangedSignal | Line: 159 | Upvalues: v7 (copy) ]]
	if not p1.CanAffordChangedSignal then
		p1.CanAffordChangedSignal = v7.new()
		p1.Maid:GiveTask(p1.CanAffordChangedSignal)
	end
	return p1.CanAffordChangedSignal
end
function t._updateAffordability(p1) --[[ _updateAffordability | Line: 168 | Upvalues: v1 (copy), v8 (copy) ]]
	if p1._canAfford == p1:CanAfford() then
		return
	end
	p1._canAfford = not p1._canAfford
	p1:GetCanAffordChangedSignal():Fire(p1._canAfford)
	if p1.Config.OnAffordabilityChanged then
		p1.Config.OnAffordabilityChanged(p1._canAfford)
	end
	if not p1.AffordabilityProperties then
		return
	end
	if not p1._originalProperties then
		p1._originalProperties = {}
	end
	for v12, v2 in p1.AffordabilityProperties do
		for v3, v4 in v1.FindElement(p1.Instance, v12, {
			GetAllDescendants = true
		}) do
			if v4:GetAttribute("Recolor") ~= false then
				local v5 = v1.GetProperties(v4, v8.ToListByIndex(v2))
				p1._originalProperties[v4] = v5
				for v6, v7 in v2 do
					v4[v6] = if p1._canAfford then v5[v6] else v7
				end
			end
		end
	end
end
function t._getMostExpensiveCurrency(p1) --[[ _getMostExpensiveCurrency | Line: 204 ]]
	local v1 = p1:GetPrice()
	if not v1 then
		return nil
	end
	local v2 = 0
	local v3 = nil
	for v4, v5 in v1 do
		if v2 < v5 then
			v2 = v5
			v3 = v4
		end
	end
	return v3
end
function t._setButtonCurrencyColor(p1) --[[ _setButtonCurrencyColor | Line: 221 ]]
	if not p1.Config.ColorToCurrency then
		return
	end
	local v1 = p1:_getMostExpensiveCurrency()
	if not v1 then
		return
	end
	if p1.Context.Button and p1.Context.Button.SetColor then
		p1.Context.Button:SetColor(v1, true)
	end
	if not (p1.Context.BuyButton and p1.Context.BuyButton.SetColor) then
		return
	end
	p1.Context.BuyButton:SetColor(v1, true)
end
function t.Reset(p1) --[[ Reset | Line: 240 ]]
	if not p1.PriceLabel then
		return
	end
	p1.PriceLabel.Visible = false
	if p1._originalProperties then
		for v1, v2 in p1._originalProperties do
			for v3, v4 in v2 do
				v1[v3] = v4
			end
		end
	end
	p1._originalProperties = nil
end
return t