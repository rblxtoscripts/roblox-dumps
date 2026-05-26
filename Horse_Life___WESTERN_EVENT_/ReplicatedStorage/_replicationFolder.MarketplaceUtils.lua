-- https://lua.expert/
local t = {}
local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("StorageUtils")
local v2 = Sonar("Table")
local v3 = Sonar("Signal")
local v4 = Sonar("RemoteUtils")
local v5 = Sonar("FormatNumber")
local v6 = Sonar("MarketplaceManager", {
	Deferred = true,
	Context = "Server"
})
local v7 = Sonar("PlaceTypeService")
local v8 = Sonar("Constants")
local IsServer = v8.IsServer
local v9 = v7.IsTestGame()
local t2 = {}
local v10 = Sonar(v1.Get("MerchBundles"))
local ProductHandlers = v8.ProductHandlers
local GamepassHandlers = v8.GamepassHandlers
local AssetHandlers = v8.AssetHandlers
local t3 = {}
local t4 = { "CantAfford" }
local LocalPlayer = game:GetService("Players").LocalPlayer
local v11 = v4.GetRemoteEvent("TestPurchaseRemote")
local t5 = {}
function t.GetProductInfo(p1, p2) --[[ GetProductInfo | Line: 47 | Upvalues: t5 (copy), MarketplaceService (copy) ]]
	if t5[p1] then
		return t5[p1]
	end
	local count = 0
	repeat
		local v1, v2 = pcall(MarketplaceService.GetProductInfo, MarketplaceService, p1, p2)
		if v1 and v2 then
			t5[p1] = v2
			return v2
		end
		warn(v2)
		count = count + 1
		wait()
	until count >= 5
end
function t.GetPriceForProduct(p1, p2, p3) --[[ GetPriceForProduct | Line: 67 | Upvalues: t (copy), v5 (copy) ]]
	local v1 = t.GetProductInfo(p1, Enum.InfoType.Product)
	local v2 = t.GetProductInfo(p1, Enum.InfoType.Product) and v1.PriceInRobux or "N/A"
	if p2 then
		if p3 then
			return "\238\128\130" .. v5.splice(v2)
		else
			return "\238\128\130" .. v2
		end
	elseif p3 then
		return v5.splice(v2)
	else
		return v2
	end
end
function t.GetProductFromId(p1) --[[ GetProductFromId | Line: 89 | Upvalues: t2 (copy), v10 (copy) ]]
	local v1 = t2[p1]
	if not v1 then
		for v2, v3 in v10 do
			if v3.CommerceId == p1 then
				return v3
			end
		end
	end
	return v1
end
function t.GetDeveloperProducts() --[[ GetDeveloperProducts | Line: 109 | Upvalues: t2 (copy) ]]
	return t2
end
function t.GetProductFromName(p1) --[[ GetProductFromName | Line: 114 | Upvalues: t2 (copy) ]]
	for v1, v2 in t2 do
		if v2.Name == p1 then
			return v2
		end
	end
end
function t.AddDeveloperProducts(p1, p2, p3) --[[ AddDeveloperProducts | Line: 126 | Upvalues: t (copy), v2 (copy) ]]
	for k, v in pairs(p1) do
		if type(v) == "table" then
			if v.Products then
				for k2, v3 in pairs(v.Products) do
					t.AddDeveloperProduct(k2, v2.Copy(v), p3)
				end
				continue
			end
			local v1 = p2 and v[p2] or (v.ProductId or k)
			if type(v1) == "number" then
				t.AddDeveloperProduct(v1, v, p3)
			end
		end
	end
end
function t.AddDeveloperProduct(p1, p2, p3) --[[ AddDeveloperProduct | Line: 142 | Upvalues: t2 (copy), t3 (copy) ]]
	p2.ProductType = p2.ProductType or p3
	if not p2.ProductType then
		return
	end
	t2[p1] = p2
	p2.ProductId = p1
	if p2.ProductType ~= "Currency" then
		return
	end
	if not t3[p2.Currency] then
		t3[p2.Currency] = {}
	end
	table.insert(t3[p2.Currency], p2)
	table.sort(t3[p2.Currency], function(p1, p2) --[[ Line: 156 ]]
		return p1.Amount < p2.Amount
	end)
end
function t.PromptPurchase(p1, p2, p3) --[[ PromptPurchase | Line: 163 | Upvalues: MarketplaceService (copy), v9 (copy), IsServer (copy), v11 (copy), v6 (copy) ]]
	if p3 == "Gamepass" then
		MarketplaceService:PromptGamePassPurchase(p1, p2)
		return
	end
	if v9 and not IsServer then
		v11:FireServer(p2)
		return
	end
	if v9 and IsServer then
		v6.TestPurchase(p1, p2)
		return
	end
	MarketplaceService:PromptProductPurchase(p1, p2)
end
function t.AddProductHandler(p1, p2) --[[ AddProductHandler | Line: 178 | Upvalues: ProductHandlers (copy) ]]
	if ProductHandlers[p1] then
		warn("Product Handler already added for", p1)
	end
	ProductHandlers[p1] = p2
end
function t.AddGamepassHandler(p1, p2) --[[ AddGamepassHandler | Line: 186 | Upvalues: GamepassHandlers (copy) ]]
	if GamepassHandlers[p1] then
		warn("Gamepass Handler already added for", p1)
	end
	GamepassHandlers[p1] = p2
end
function t.AddAssetHandler(p1, p2) --[[ AddAssetHandler | Line: 194 | Upvalues: AssetHandlers (copy) ]]
	if AssetHandlers[p1] then
		warn("Asset Handler already added for", p1)
	end
	AssetHandlers[p1] = p2
end
function t.PromptDynamicCurrency(p1, p2, p3) --[[ PromptDynamicCurrency | Line: 202 | Upvalues: t3 (copy), t (copy) ]]
	if not t3[p3] then
		return
	end
	local v1 = p1:GetCurrentSlot()
	if not v1 then
		return
	end
	local v3 = math.abs(p1:_getCurrencyValue(v1, p3).Value - p2)
	if v3 <= 0 then
		return
	end
	local v4 = t3[p3][#t3[p3]]
	for i, v in ipairs(t3[p3]) do
		if not (v.Amount < v3) then
			v4 = v
			break
		end
	end
	if not v4 then
		return
	end
	t.PromptPurchase(p1.Player, v4.ProductId, "Product")
end
function t.PromptCurrencyFromReason(p1, p2, p3, p4) --[[ PromptCurrencyFromReason | Line: 225 | Upvalues: t4 (copy), t (copy) ]]
	if table.find(t4, p1) then
		t.PromptDynamicCurrency(p2, p3, p4)
	end
end
if not IsServer then
	MarketplaceService.PromptProductPurchaseFinished:Connect(function(p1, p2, p3) --[[ Line: 232 | Upvalues: LocalPlayer (copy), t (copy) ]]
		if not p3 then
			return
		end
		if p1 == LocalPlayer.UserId then
			t.OnProductPurchased:Fire()
		end
	end)
end
t.OnProductPurchased = v3.new()
return t