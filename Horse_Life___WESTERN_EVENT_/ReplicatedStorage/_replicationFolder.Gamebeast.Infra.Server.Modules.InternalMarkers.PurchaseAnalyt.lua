-- https://lua.expert/
local t = {}
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local v1 = shared.GBMod("Utilities")
local v2 = shared.GBMod("EngagementMarkers")
local v3 = shared.GBMod("ServerClientInfoHandler")
local t2 = {
	[Enum.InfoType.GamePass] = "gamepass",
	[Enum.InfoType.Product] = "devproduct",
	[Enum.InfoType.Asset] = "asset",
	[Enum.InfoType.Subscription] = "subscription"
}
local t3 = {}
local v4 = false
local t4 = {}
local function GetProductInfo(p1, p2) --[[ GetProductInfo | Line: 51 | Upvalues: t3 (copy), v1 (copy) ]]
	if not t3[p2] then
		t3[p2] = {}
	end
	local v12 = t3[p2][p1]
	if not v12 then
		local v2 = v1.getProductInfo(p1, p2)
		if not v2 then
			return
		end
		t3[p2][p1] = v2
		v12 = v2
	end
	return v12
end
local function FlushProductPurchaseCache(p1) --[[ FlushProductPurchaseCache | Line: 69 | Upvalues: t4 (copy), t (copy) ]]
	local v1 = t4[p1]
	if not v1 then
		return
	end
	for i, v in ipairs(v1) do
		task.spawn(function() --[[ Line: 76 | Upvalues: t (ref), p1 (copy), v (copy) ]]
			t:UpdatePlayerSpend(p1, false, v.itemId, Enum.InfoType.Product, {
				position = v.position,
				timestampOverride = v.timestamp
			})
		end)
	end
	t4[p1] = nil
end
function t.UpdatePlayerSpend(p1, p2, p3, p4, p5, p6) --[[ UpdatePlayerSpend | Line: 86 | Upvalues: v1 (copy), GetProductInfo (copy), v3 (copy), t2 (copy), v2 (copy) ]]
	local v12 = v1.resolvePlayerObject(p2)
	local v22 = GetProductInfo(p4, p5)
	if not v22 then
		return
	end
	local v32 = if v22.PriceInRobux then v3:GetProductPriceForPlayer(v12, p4, p5) else nil
	if v32 then
		if v32 / v22.PriceInRobux < 0.3 then
			v32 = nil
		end
		if v22.PriceInRobux < v32 then
			v32 = nil
		end
	end
	local t = {
		fromReceipt = p3,
		type = t2[p5] or "unknown",
		id = p4
	}
	t.price = if v32 then v32 else v22.PriceInRobux
	t.basePrice = v22.PriceInRobux
	t.name = v22.Name
	t.description = v22.Description
	t.imageId = "https://assetdelivery.roblox.com/v1/asset?id=" .. p4
	local v5 = if p6 then p6 else {}
	v5.player = v12
	local v6 = if v12 then v12.Character else v12
	if v5.position == nil and (v6 and v6.PrimaryPart) then
		v5.position = v6.PrimaryPart.Position
	end
	v2:SDKMarker("Purchase", t, v5)
end
function t.DevProductPurchased(p1, p2, p3, p4, p5) --[[ DevProductPurchased | Line: 134 | Upvalues: v4 (ref), Players (copy), GetProductInfo (copy), t4 (copy), FlushProductPurchaseCache (copy) ]]
	if v4 and p2 == false then
		return
	end
	local v1 = Players:GetPlayerByUserId(p3)
	if not v1 then
		return
	end
	if not GetProductInfo(p4, Enum.InfoType.Product) then
		return
	end
	if p2 then
		v4 = true
		t4[v1] = nil
		p1:UpdatePlayerSpend(p3, true, p4, Enum.InfoType.Product, {
			position = p5
		})
		return
	end
	t4[v1] = t4[v1] or {}
	local v42 = t4[v1]
	table.insert(v42, {
		itemId = p4,
		position = p5,
		timestamp = DateTime.now().UnixTimestampMillis
	})
	if not (#v42 >= 3) then
		return
	end
	FlushProductPurchaseCache(v1)
end
function t.Init(p1) --[[ Init | Line: 173 | Upvalues: MarketplaceService (copy), Players (copy), FlushProductPurchaseCache (copy) ]]
	MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(p12, p2, p3) --[[ Line: 175 | Upvalues: p1 (copy) ]]
		if not p3 then
			return
		end
		p1:UpdatePlayerSpend(p12, false, p2, Enum.InfoType.GamePass)
	end)
	MarketplaceService.PromptPurchaseFinished:Connect(function(p12, p2, p3) --[[ Line: 182 | Upvalues: p1 (copy) ]]
		if not p3 then
			return
		end
		p1:UpdatePlayerSpend(p12, false, p2, Enum.InfoType.Asset)
	end)
	MarketplaceService.PromptSubscriptionPurchaseFinished:Connect(function(p12, p2, p3) --[[ Line: 189 | Upvalues: MarketplaceService (ref), p1 (copy) ]]
		if not p3 then
			return
		end
		local v1, v2 = pcall(function() --[[ Line: 191 | Upvalues: MarketplaceService (ref), p12 (copy), p2 (copy) ]]
			return MarketplaceService:GetUserSubscriptionStatusAsync(p12, p2)
		end)
		if not (v1 and v2.IsSubscribed) then
			return
		end
		p1:UpdatePlayerSpend(p12, false, p2, Enum.InfoType.Subscription)
	end)
	Players.PlayerRemoving:Connect(FlushProductPurchaseCache)
end
return t