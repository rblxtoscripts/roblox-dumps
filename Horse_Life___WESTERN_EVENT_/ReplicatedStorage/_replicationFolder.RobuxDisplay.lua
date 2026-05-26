-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("safeDestroy")
local v2 = Sonar("Maid")
local v3 = Sonar("GuiFrameworkService")
local v4 = Sonar("MarketplaceService")
local v5 = Sonar("FormatNumber")
function t.new(p1) --[[ new | Line: 17 | Upvalues: t (copy), v2 (copy), v3 (copy), v4 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.Context = p1
	v22.Config = v3.GetComponentConfig(p1, "RobuxDisplay")
	v22.Instance = p1.Instance
	if not v22.Instance then
		warn("\226\154\160\239\184\143 RobuxDisplay, Instance is required", p1)
		return v22
	end
	v22.RobuxPriceLabel = v3.FindElement(v22.Instance, "PriceLabel") or (v3.FindElement(v22.Instance, "Title") or (v3.FindElement(v22.Instance, "TextLabel") or v22.Instance:IsA("TextLabel") and v22.Instance))
	if not v22.RobuxPriceLabel then
		warn("\226\154\160\239\184\143 RobuxDisplay, RobuxPriceLabel is required", p1)
		return v22
	end
	v22.BuyButtons = {}
	if v22.Config.Format == nil then
		v22.Config.Format = true
	end
	if not v22.Config.ProductId and v22.Config.Product then
		v22.Config.ProductId = v4.GetProductIdFromName(v22.Config.Product)
	end
	v22.BuyButton = v3.FindElement(v22.Instance, "BuyButton") or (v3.FindElement(v22.Instance, "BuyButtonRobux") or v22.Instance:IsA("GuiButton") and v22.Instance)
	if v22.BuyButton then
		v22.BuyButtons[v22.BuyButton] = true
	end
	if not p1.DoNotIncludeInstance and v22.Instance:IsA("GuiButton") then
		v22.BuyButtons[v22.Instance] = true
	end
	for v5, v6 in v22.BuyButtons do
		if v22.Context.ButtonInstance == v5 then
			if v22.Context.ButtonActions then
				v22.Context.ButtonActions.OnClick = v22.Config.OnClick
			end
			continue
		end
		v22.Maid:GiveTask(v3.AddComponent("Button", {
			Preset = "RobuxButton",
			Instance = v5,
			OnClick = v22.Config.OnClick
		}))
	end
	v22.ShowRobuxAmount = not (if v22.Config.RobuxAmountVisible == false then true elseif v22.RobuxPriceLabel:GetAttribute("RobuxAmountVisible") == false then true else false)
	v22:_setRobuxPrice()
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 88 | Upvalues: v1 (copy) ]]
	v1(p1)
end
function t._setRobuxPrice(p1) --[[ _setRobuxPrice | Line: 92 | Upvalues: v4 (copy), v5 (copy) ]]
	local function formatText(p12) --[[ formatText | Line: 93 | Upvalues: p1 (copy) ]]
		if p1.Config.Prefix then
			p12 = p1.Config.Prefix .. p12
		end
		if p1.Config.Append then
			p12 = p12 .. p1.Config.Append
		end
		return p12
	end
	if p1.ShowRobuxAmount then
		if p1.Config.ProductId then
			p1.Maid:GiveTask(v4.SetTextInRobux(p1.RobuxPriceLabel, p1.Config.ProductId, p1.Config))
			return
		end
		if not p1.Config.Robux then
			return
		end
		local v1 = v5.robux(p1.Config.Robux)
		local v2 = if p1.Config.Prefix then p1.Config.Prefix .. v1 else v1
		if p1.Config.Append then
			v2 = v2 .. p1.Config.Append
		end
		p1.RobuxPriceLabel.Text = v2
		return
	end
	local v3 = v5.robux()
	local v42 = if p1.Config.Prefix then p1.Config.Prefix .. v3 else v3
	if p1.Config.Append then
		v42 = v42 .. p1.Config.Append
	end
	p1.RobuxPriceLabel.Text = v42
end
return t