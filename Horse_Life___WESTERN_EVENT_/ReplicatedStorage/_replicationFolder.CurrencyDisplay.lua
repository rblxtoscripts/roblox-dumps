-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("safeDestroy")
local v2 = Sonar("Maid")
local v3 = Sonar("GuiFrameworkService")
local v4 = Sonar("StorageUtils")
local v5 = Sonar("ItemDataService")
local DefaultCurrency = v4.GetConfig("ItemsWrapper")().DefaultCurrency
local DefaultGroupToOpen = v4.GetConfig("Marketplace")().DefaultGroupToOpen
local v6 = Sonar("PlayerWrapper").GetClient()
function t.new(p1) --[[ new | Line: 79 | Upvalues: t (copy), v2 (copy), v3 (copy), DefaultCurrency (copy), v6 (copy), DefaultGroupToOpen (copy), v5 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.Config = p1
	v22.Instance = p1.Instance
	v22.Instance = v3.FindElement(v22.Instance, "CurrencyDisplay") or v22.Instance
	if not v22.Instance then
		warn("\226\154\160\239\184\143 CurrencyDisplay, Instance is required", p1)
		return v22
	end
	v22.Currency = v22.Config.Currency or (v22.Instance:GetAttribute("Currency") or (v22.Value and v22.Value.Name or DefaultCurrency))
	v22.Config.Value = v22.Config.Value or v6:GetItemValue(v22.Currency)
	if not v22.Config.Value then
		warn("\226\154\160\239\184\143 CurrencyDisplay, Value is required", p1)
		return v22
	end
	v22.GuiScreenGroupToOpen = not v22.Config.OnClick and (v22.Config.GuiScreenGroupToOpen or (if v22.Config.GuiScreenGroupToOpen == nil then DefaultGroupToOpen else false))
	if v22.GuiScreenGroupToOpen ~= false and not v3.GetScreenGroup(v22.GuiScreenGroupToOpen) then
		warn("\226\154\160\239\184\143 CurrencyDisplay, UI group not found:", v22.GuiScreenGroupToOpen)
	end
	v22.IconLabel = v3.FindElement(v22.Instance, "IconLabel")
	if v22.IconLabel then
		local v7 = v5.GetByName(v22.Currency)
		if v7 then
			v22.IconLabel.Image = v7.CurrencyDisplayImage or v7.Image
		end
	end
	if v22.Instance:IsA("TextButton") or v22.Instance:IsA("ImageButton") then
		v22.Maid:GiveTask(v3.AddComponent("Button", {
			Instance = v22.Instance,
			OnClick = function() --[[ OnClick | Line: 122 | Upvalues: v22 (copy) ]]
				v22:_openShop()
			end
		}))
	end
	v22.BuyButton = v3.FindElement(v22.Instance, "Button")
	if v22.BuyButton then
		v22.Maid:GiveTask(v3.AddComponent("Button", {
			Instance = v22.BuyButton,
			OnClick = function() --[[ OnClick | Line: 132 | Upvalues: v22 (copy) ]]
				v22:_openShop()
			end
		}))
	end
	local function handleEffects(p1, p2, p3, p4) --[[ handleEffects | Line: 139 ]] end
	if v22.Config.OnChanged then
		if type(v22.Config.OnChanged) == "function" then
			v22.Config.OnChanged = { v22.Config.OnChanged }
		end
	else
		v22.Config.OnChanged = {}
	end
	table.insert(v22.Config.OnChanged, handleEffects)
	v22.Maid:GiveTask(v3.AddComponent("AnimatedValueDisplay", v22.Config))
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 158 | Upvalues: v1 (copy) ]]
	v1(p1)
end
function t._openShop(p1) --[[ _openShop | Line: 164 | Upvalues: v3 (copy) ]]
	if p1.Config.OnClick then
		p1.Config.OnClick(p1, {
			Tab = p1.Currency
		})
		return
	end
	local t = {}
	t.Args = p1.Config.Args or {
		Tab = p1.Currency
	}
	v3.OpenScreenGroup(p1.GuiScreenGroupToOpen, t)
end
return t