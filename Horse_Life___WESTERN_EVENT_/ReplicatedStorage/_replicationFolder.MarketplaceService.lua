-- https://lua.expert/
local t = {}
local MarketplaceService = game:GetService("MarketplaceService")
local CommerceService = game:GetService("CommerceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("Signal")
local v3 = Sonar("retryAsync")
local v4 = Sonar("PlayerWrapper")
local v5 = Sonar("AnalyticsService")
local v6 = Sonar("StorageUtils")
local v7 = Sonar("GameVersionUtils")
local v8 = Sonar("criticalWarn")
local v9 = Sonar("FormatString")
local v10 = Sonar("NotificationsService")
local v11 = Sonar("FormatNumber")
local v12 = RunService:IsServer()
local v13 = RunService:IsStudio()
local v14 = v6.GetConfig("Marketplace")()
local DisableProductPurchasing = v14.DisableProductPurchasing
local t2 = {
	MarketplaceService.PromptGamePassPurchaseFinished,
	MarketplaceService.PromptPurchaseFinished,
	MarketplaceService.PromptProductPurchaseFinished,
	MarketplaceService.PromptSubscriptionPurchaseFinished,
	CommerceService.PromptCommerceProductPurchaseFinished,
	MarketplaceService.PromptPremiumPurchaseFinished
}
local t3 = {
	Gamepass = Enum.InfoType.GamePass,
	Asset = Enum.InfoType.Asset,
	DeveloperProduct = Enum.InfoType.Product
}
local Premium = Enum.MembershipType.Premium
local v15 = v6.Get("Products")()
local LocalPlayer = Players.LocalPlayer
local v16 = v2.new()
local v17 = v1.GetRemoteEvent("MarketplacePurchasingScreenRemote")
local v18 = v1.GetRemoteEvent("MarketplacePurchaseRequestRemote")
local v19 = v1.GetRemoteEvent("MarketplaceGiftRequestRemote")
local v20 = v1.GetRemoteEvent("MarketplaceRedeemGiftItemRemote")
local t4 = {}
local t5 = {}
local t6 = {}
local t7 = {}
local t8 = {}
local function onPurchaseStarted(p1, ...) --[[ onPurchaseStarted | Line: 250 | Upvalues: v12 (copy), v17 (copy), v16 (copy) ]]
	if v12 then
		v17:FireClient(p1, ...)
		v16:Fire(p1, true, ...)
	else
		v16:Fire(true, ...)
	end
end
local function onPurchaseFinished(p1, ...) --[[ onPurchaseFinished | Line: 262 | Upvalues: v12 (copy), t (copy), v16 (copy), LocalPlayer (copy) ]]
	if v12 then
		t.ClearPurchaseDetails(p1)
		v16:Fire(p1, false, ...)
		return
	end
	if p1 ~= LocalPlayer then
		return
	end
	v16:Fire(false, ...)
end
local function getProductPurchasedCallbackFromProduct(p1) --[[ getProductPurchasedCallbackFromProduct | Line: 274 | Upvalues: t5 (copy) ]]
	return t5[p1.ProductId] or (t5[p1.Name] or t5[p1.ProductCategory])
end
local function getPurchaseDetailsValidatorFromProduct(p1) --[[ getPurchaseDetailsValidatorFromProduct | Line: 280 | Upvalues: t7 (copy) ]]
	return t7[p1.ProductId] or (t7[p1.Name] or t7[p1.ProductCategory])
end
local function encodePurchaseDetails(p1) --[[ encodePurchaseDetails | Line: 288 | Upvalues: HttpService (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 289 | Upvalues: HttpService (ref), p1 (copy) ]]
		return HttpService:JSONEncode(p1)
	end)
	if not v1 then
		warn("\226\154\160\239\184\143 MarketplaceService, Error encoding purchase details:", p1, v2)
	end
	return if v1 and v2 then v2 else nil
end
local function decodePurchaseDetails(p1) --[[ decodePurchaseDetails | Line: 302 | Upvalues: HttpService (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 303 | Upvalues: HttpService (ref), p1 (copy) ]]
		return HttpService:JSONDecode(p1)
	end)
	if not v1 then
		warn("\226\154\160\239\184\143 MarketplaceService, Error decoding purchase details:", p1, v2)
	end
	return if v1 and v2 then v2 else nil
end
local function waitAndVerifyProductCallback(p1) --[[ waitAndVerifyProductCallback | Line: 315 | Upvalues: v7 (copy), t5 (copy), v8 (copy) ]]
	v7.OnServerInitialised(function() --[[ Line: 316 | Upvalues: p1 (copy), t5 (ref), v8 (ref) ]]
		task.delay(5, function() --[[ Line: 318 | Upvalues: p1 (ref), t5 (ref), v8 (ref) ]]
			local v1 = p1
			if t5[v1.ProductId] or t5[v1.Name] or t5[v1.ProductCategory] then
				return
			end
			v8("\240\159\154\168 CRITICAL: MarketplaceService, Purchase callback not found for", p1.Name, p1.ProductCategory, p1.ProductId, p1)
		end)
	end)
end
local function postDeveloperProductAnalytics(p1, p2, p3) --[[ postDeveloperProductAnalytics | Line: 330 | Upvalues: t (copy), v5 (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 331 | Upvalues: t (ref), p2 (copy), v5 (ref), p1 (copy), p3 (copy) ]]
		local v1 = t.GetProductInfo(p2.ProductId, Enum.InfoType.Product)
		local t2 = {
			Player = p1,
			Value = p2.CurrencySpent or 0
		}
		local t3 = {}
		local t4 = {
			Key = "ProductName"
		}
		t4.Value = if v1 then v1.Name or "Unknown" else "Unknown"
		t3[1] = t4
		t3[2] = {
			Key = "ItemType",
			Value = p3.ItemType
		}
		t3[3] = {
			Key = "ItemId",
			Value = p3.ItemId
		}
		t3[4] = {
			Key = "CartType",
			Value = p2.ProductPurchaseChannel.Name
		}
		t2.Data = t3
		return v5.ReportEvent("BusinessEvent", t2)
	end)
	if v1 then
		return v1
	end
	warn("\226\154\160\239\184\143 MarketplaceService, Error occured posting analytics for:", p2, v2)
	return v1
end
local function getProductTypePurchasedCallback(p1) --[[ getProductTypePurchasedCallback | Line: 355 | Upvalues: t6 (copy) ]]
	return t6[p1]
end
local function addMetaDataToPlayer(p1, p2) --[[ addMetaDataToPlayer | Line: 362 ]]
	local Metadata = p1.PlayerData:FindFirstChild("Metadata")
	if not Metadata then
		warn("\226\154\160\239\184\143 MarketplaceService, Metadata not found in data folder")
		return
	end
	if not p2.CurrencySpent then
		return
	end
	local RobuxSpent = Metadata:FindFirstChild("RobuxSpent")
	if not RobuxSpent then
		warn("\226\154\160\239\184\143 MarketplaceService, RobuxSpent data value not found in metadata folder")
		return
	end
	RobuxSpent.Value = RobuxSpent.Value + p2.CurrencySpent
end
local function runConfigProductPurchasedCallback(p1, p2, ...) --[[ runConfigProductPurchasedCallback | Line: 386 | Upvalues: v14 (copy) ]]
	local OnProductPurchasedCallback = v14.OnProductPurchasedCallback
	if not OnProductPurchasedCallback then
		return true
	end
	local v1, v2 = pcall(OnProductPurchasedCallback, p1, p2, ...)
	if v1 and v2 then
		return true
	end
	warn("\226\154\160\239\184\143 MarketplaceService, Error occured proccessing a custom purchase callback:", p2.ProductId, v2)
end
local function validatePurchaseDetails(p1, p2, p3) --[[ validatePurchaseDetails | Line: 404 | Upvalues: t (copy), t7 (copy), v4 (copy), v13 (copy) ]]
	local v1 = t.GetPurchaseFromId(p2)
	if not v1 then
		return true
	end
	local v2 = t7[v1.ProductId] or (t7[v1.Name] or t7[v1.ProductCategory])
	if not v2 then
		return true
	end
	local v3 = v4.getWrapperFromPlayer(p1)
	if not v3 then
		return false
	end
	local v42, v5 = pcall(v2, v3, v1, p3)
	if not v42 then
		warn("\226\154\160\239\184\143 MarketplaceService, Error occured validating purchase details:", p2, p3, v5)
		return false
	end
	if v5 or not v13 then
		return v5
	end
	warn("\226\154\160\239\184\143 MarketplaceService, Purchase details are not valid for:", p2, p3)
	return v5
end
local function getGiftRecipientFromPurchaseDetails(p1) --[[ getGiftRecipientFromPurchaseDetails | Line: 438 | Upvalues: Players (copy) ]]
	local v1 = if typeof(p1) == "table" then p1.GiftToPlayer else false
	if not v1 then
		return nil, nil
	end
	if v1 == true then
		return nil, true
	end
	local v2 = typeof(v1) == "number" and Players:GetPlayerByUserId(v1) or (typeof(v1) == "string" and Players:FindFirstChild(v1) or (typeof(v1) == "table" and v1.Player or (if typeof(v1) == "Instance" and v1 then v1 else nil)))
	return v2, if v2 then v2.UserId else v2
end
function t.PromptPurchase(p1, p2, p3, p4) --[[ PromptPurchase | Line: 463 | Upvalues: t (copy), v12 (copy), Players (copy), validatePurchaseDetails (copy), v18 (copy), DisableProductPurchasing (copy), MarketplaceService (copy), CommerceService (copy), onPurchaseStarted (copy) ]]
	local v1 = typeof(p1) == "table" and p1.Player or p1
	local v2 = tonumber(p2) or t.GetProductIdFromName(p2)
	local v3, v4
	if p3 then
		v3 = p3
		v4 = v2
	else
		v3 = t.GetProductType(v2)
		if v3 then
			v4 = v2
		else
			v3 = "DeveloperProduct"
			v4 = v2
		end
	end
	if not v12 and v1 ~= Players.LocalPlayer then
		warn("\226\154\160\239\184\143 MarketplaceService, PromptPurchase can only be called on the client for the local player")
		return
	end
	local v5 = v1
	if typeof(v5) == "Instance" and v5:IsA("Player") then
		if typeof(v4) ~= "number" then
			warn("\226\154\160\239\184\143 MarketplaceService.PromptPurchase, Invalid productId argument:", v4)
			return
		end
		if v12 then
			if t.HasPurchaseDetails(v5) then
				return false
			end
			if typeof(p4) == "table" then
				p4.Gift = nil
			end
			if not validatePurchaseDetails(v5, v4, p4) then
				return
			end
			t.SetPurchaseDetails(v5, p4)
		elseif p4 ~= nil then
			v18:FireServer(v4, v3, p4)
			return
		end
		local v6 = v3
		if DisableProductPurchasing then
			warn("\226\154\160\239\184\143 MarketplaceService, Products are disabled in this version!")
			return
		end
		if v6 == "Gamepass" then
			MarketplaceService:PromptGamePassPurchase(v5, v4)
		elseif v6 == "Asset" then
			MarketplaceService:PromptPurchase(v5, v4)
		elseif v6 == "DeveloperProduct" then
			MarketplaceService:PromptProductPurchase(v5, v4)
		elseif v6 == "Subscription" then
			MarketplaceService:PromptSubscriptionPurchase(v5, v4)
		elseif v6 == "Commerce" then
			CommerceService:PromptCommerceProductPurchase(v5, v4)
		end
		onPurchaseStarted(v5, v4, v6)
	else
		warn("\226\154\160\239\184\143 MarketplaceService.PromptPurchase, Invalid player argument:", v5)
	end
end
function t.PromptGiftPurchase(p1, p2, p3, p4) --[[ PromptGiftPurchase | Line: 540 | Upvalues: getGiftRecipientFromPurchaseDetails (copy), t (copy), v12 (copy), v19 (copy) ]]
	local v1 = p2 or true
	local v2 = if p4 then p4 else {}
	assert(if typeof(v2) == "table" then true else false, "PurchaseDetails must be a table for gifting")
	v2.GiftToPlayer = v1
	local v4, v5 = getGiftRecipientFromPurchaseDetails(v2)
	v2.GiftToPlayer = v5
	local v6, v7
	if typeof(p3) == "table" and p3 then
		v6 = p3
		v7 = v2
	else
		v6 = t.GetPurchase(p3)
		v7 = v2
	end
	local v8 = if v6.GiftProductId then t.GetPurchaseFromId(v6.GiftProductId) else t.GetPurchaseFromId(p3)
	local v9 = if v8 and v8.OriginalProductId then t.GetPurchaseFromId(v8.OriginalProductId) else v8
	if not (v9 and t.CanProductBeGifted(v9)) then
		warn("\226\154\160\239\184\143 MarketplaceService, Product cannot be gifted:", p3)
		return
	end
	if not v12 then
		v19:FireServer(v1, v8.ProductId, v7)
		return
	end
	if t.CanGiftBeSent(p1, v4, v9, v7) then
		t.PromptPurchase(p1, v8.ProductId, nil, v7)
	else
		warn("\226\154\160\239\184\143 MarketplaceService, Player cannot gift to target player:", p1.UserId, v4)
	end
end
function t.GetProductInfo(p1, p2, p3) --[[ GetProductInfo | Line: 583 | Upvalues: t (copy), v3 (copy), CommerceService (copy), MarketplaceService (copy), t3 (copy) ]]
	local v1 = t.GetPurchaseFromId(p1)
	if not p3 and (v1 and v1.ProductInfo) then
		return v1.ProductInfo
	end
	local v32 = p2 or (t.GetProductType(p1) or "DeveloperProduct")
	local v4, v5 = v3(function() --[[ Line: 591 | Upvalues: v32 (ref), CommerceService (ref), p1 (copy), MarketplaceService (ref), t3 (ref) ]]
		if v32 == "Commerce" then
			return CommerceService:GetCommerceProductInfoAsync(p1)
		end
		if v32 == "Subscription" then
			return MarketplaceService:GetSubscriptionProductInfoAsync(p1)
		end
		v32 = type(v32) == "string" and t3[v32] or v32
		return MarketplaceService:GetProductInfo(p1, v32)
	end)
	if not v4 then
		warn("\226\154\160\239\184\143 MarketplaceService, Failed to get product info for productId:", p1)
		return nil
	end
	if v1 then
		v1.ProductInfo = v5
	end
	return v5
end
function t.GetPriceInRobux(p1, p2) --[[ GetPriceInRobux | Line: 617 | Upvalues: t (copy) ]]
	local v1 = t.GetProductInfo(p1, p2)
	if v1 then
		return v1.PriceInRobux
	end
end
function t.SetTextInRobux(p1, p2, p3) --[[ SetTextInRobux | Line: 626 | Upvalues: t (copy), v11 (copy) ]]
	local v2 = p3 or {}
	return task.spawn(function() --[[ Line: 628 | Upvalues: p1 (copy), t (ref), p2 (copy), v2 (ref), v11 (ref) ]]
		p1.Text = "N/A"
		local v1 = t.GetPriceInRobux(p2)
		if not v1 then
			return
		end
		local v22 = if v2.Prefix then v2.Prefix .. v1 else v1
		if v2.Append then
			v22 = v22 .. v2.Append
		end
		if v2.Format == true then
			v22 = v11.robux(v22)
		elseif v2.Format then
			v22 = v2.Format(v22)
		end
		p1.Text = v22
	end)
end
function t.GetPurchaseFromId(p1) --[[ GetPurchaseFromId | Line: 657 | Upvalues: t4 (copy) ]]
	return t4[p1]
end
function t.GetPurchaseFromName(p1) --[[ GetPurchaseFromName | Line: 664 | Upvalues: t4 (copy) ]]
	for v1, v2 in t4 do
		if v2.Name == p1 then
			return v2
		end
	end
	return nil
end
function t.GetPurchase(p1) --[[ GetPurchase | Line: 677 | Upvalues: t (copy) ]]
	return t.GetPurchaseFromId(p1) or t.GetPurchaseFromName(p1)
end
function t.GetProductIdFromName(p1) --[[ GetProductIdFromName | Line: 685 | Upvalues: t (copy) ]]
	local v1 = t.GetPurchaseFromName(p1)
	if v1 then
		return v1.ProductId
	else
		return nil
	end
end
function t.GetGiftPurchase(p1) --[[ GetGiftPurchase | Line: 697 | Upvalues: t (copy) ]]
	local v1 = t.GetGiftProductId(p1)
	if v1 then
		return t.GetPurchaseFromId(v1)
	else
		return nil
	end
end
function t.GetGiftProductId(p1) --[[ GetGiftProductId | Line: 709 | Upvalues: t (copy) ]]
	local v1 = t.GetPurchase(p1)
	if not v1 then
		return nil
	end
	if v1.Giftable then
		return v1.ProductId
	else
		return v1.GiftProductId
	end
end
function t.GetProductType(p1) --[[ GetProductType | Line: 725 | Upvalues: t (copy) ]]
	local v1 = t.GetPurchase(p1)
	if v1 then
		return v1.ProductType
	else
		return nil
	end
end
function t.GetProductCategory(p1) --[[ GetProductCategory | Line: 737 | Upvalues: t (copy) ]]
	local v1 = t.GetPurchase(p1)
	if v1 then
		return v1.ProductCategory
	else
		return nil
	end
end
function t.GetProductsByCategory(p1) --[[ GetProductsByCategory | Line: 749 | Upvalues: t4 (copy) ]]
	local t = {}
	for v1, v2 in t4 do
		if v2.ProductCategory == p1 then
			table.insert(t, v2)
		end
	end
	return t
end
function t.GetProductDisplayName(p1, p2) --[[ GetProductDisplayName | Line: 764 | Upvalues: t (copy), HttpService (copy), v9 (copy) ]]
	local v1 = t.GetPurchase(p1)
	if not v1 then
		return "Unknown Product"
	end
	if typeof(p2) == "string" then
		local v2 = p2
		local v3, v4 = pcall(function() --[[ Line: 303 | Upvalues: HttpService (ref), v2 (copy) ]]
			return HttpService:JSONDecode(v2)
		end)
		if not v3 then
			warn("\226\154\160\239\184\143 MarketplaceService, Error decoding purchase details:", v2, v4)
		end
		p2 = if v3 and v4 then v4 else nil
	end
	return v9.GetDisplayName(v1, v1, p2)
end
function t.GetProductDescription(p1, p2) --[[ GetProductDescription | Line: 781 | Upvalues: t (copy), HttpService (copy) ]]
	local v1 = t.GetPurchase(p1)
	if not (v1 and v1.Description) then
		return nil
	end
	if typeof(p2) == "string" then
		local v2 = p2
		local v3, v4 = pcall(function() --[[ Line: 303 | Upvalues: HttpService (ref), v2 (copy) ]]
			return HttpService:JSONDecode(v2)
		end)
		if not v3 then
			warn("\226\154\160\239\184\143 MarketplaceService, Error decoding purchase details:", v2, v4)
		end
		p2 = if v3 and v4 then v4 else nil
	end
	if typeof(v1.Description) == "function" then
		return v1.Description(v1, p2)
	else
		return v1.Description
	end
end
function t.AddPurchase(p1, p2, p3) --[[ AddPurchase | Line: 802 | Upvalues: t (copy), t4 (copy), v12 (copy), waitAndVerifyProductCallback (copy) ]]
	local v1 = if p3 then p3 else {}
	local Products = p2.Products
	local v2
	if Products then
		v2 = v1
	elseif type(p2.ProductId) == "table" then
		Products = p2.ProductId
		if Products then
			v2 = v1
		else
			Products = {}
			v2 = v1
		end
	else
		Products = {}
		v2 = v1
	end
	if next(Products) then
		for v3, v4 in Products do
			t.AddPurchase(v4, table.clone(p2), v2)
		end
	else
		if not p2.Name then
			warn("\226\154\160\239\184\143 MarketplaceService, Name not found for:", p1, p2)
			return
		end
		p2.ProductCategory = p2.ProductCategory or v2.ProductCategory
		p2.ProductType = p2.ProductType or v2.ProductType
		if not (p2.ProductCategory or p2.ProductType) then
			warn("\226\154\160\239\184\143 MarketplaceService, Product category and type not found for:", p1, p2)
			return
		end
		local v7 = v2.ProductIndex and p2[v2.ProductIndex] or (p2.ProductId or (if type(p1) == "number" then p1 else false))
		if not v7 then
			warn("\226\154\160\239\184\143 MarketplaceService, Product id not found for:", v7, p2)
			return
		end
		t4[v7] = p2
		local GiftProductId = p2.GiftProductId
		if GiftProductId and v7 == GiftProductId then
			p2.GiftProductId = nil
			p2.Giftable = true
		elseif GiftProductId then
			local v8 = table.clone(p2)
			v8.ProductId = GiftProductId
			v8.OriginalProductId = v7
			v8.GiftProductId = nil
			v8.Name = p2.Name .. "_Gift"
			v8.ProductCategory = "MarketplaceGift"
			t4[GiftProductId] = v8
		end
		local v9 = v7
		if p2.Giftable and (not GiftProductId and p2.ProductType ~= "DeveloperProduct") then
			warn("\226\154\160\239\184\143 MarketplaceService, Products cannot be giftable unless they are a DeveloperProduct. Use GiftProductId instead", v9, p2)
			p2.Giftable = false
		end
		if not v12 then
			return
		end
		task.spawn(waitAndVerifyProductCallback, p2)
	end
end
function t.AddPurchasesFromModule(p1, ...) --[[ AddPurchasesFromModule | Line: 877 | Upvalues: Sonar (copy), t (copy) ]]
	for v2, v3 in if type(p1) == "table" and p1 then p1 else Sonar(p1) do
		if type(v3) == "table" then
			t.AddPurchase(v2, v3, ...)
		end
	end
end
function t.AddProductPurchasedCallback(p1, p2) --[[ AddProductPurchasedCallback | Line: 892 | Upvalues: t5 (copy) ]]
	if t5[p1] then
		warn("\226\154\160\239\184\143 MarketplaceService, Purchase callback already exists for callbackId: " .. p1)
	else
		t5[p1] = p2
	end
end
function t.AddPurchaseDetailsValidation(p1, p2) --[[ AddPurchaseDetailsValidation | Line: 904 | Upvalues: t7 (copy) ]]
	if t7[p1] then
		warn("\226\154\160\239\184\143 MarketplaceService, Purchase details validator already exists for validatorId: " .. p1)
	else
		t7[p1] = p2
	end
end
function t.SetGiftPurchasedCallback(p1) --[[ SetGiftPurchasedCallback | Line: 916 | Upvalues: t5 (copy) ]]
	t5.Gift = p1
end
function t.HasProductPurchasedCallback(p1) --[[ HasProductPurchasedCallback | Line: 923 | Upvalues: t (copy), t5 (copy) ]]
	local v1 = t.GetPurchase(p1)
	return v1 and (t5[v1.ProductId] or (t5[v1.Name] or t5[v1.ProductCategory])) ~= nil
end
function t._runProductPurchasedCallback(p1, p2, p3, ...) --[[ _runProductPurchasedCallback | Line: 929 | Upvalues: t5 (copy) ]]
	local v1 = t5[p2.ProductId] or (t5[p2.Name] or t5[p2.ProductCategory])
	if v1 then
		local v2, v3 = pcall(v1, p1, p2, p3, ...)
		return v2, v3
	else
		warn("\226\154\160\239\184\143 MarketplaceService, Product purchase callback not found for:", p2.ProductId, p2)
		return false
	end
end
function t.RunProductPurchasedCallback(p1, p2, ...) --[[ RunProductPurchasedCallback | Line: 947 | Upvalues: t (copy), getGiftRecipientFromPurchaseDetails (copy), v4 (copy), v10 (copy), runConfigProductPurchasedCallback (copy) ]]
	local v1 = t.GetPurchaseDetails(p1.Player)
	local v2, v3 = getGiftRecipientFromPurchaseDetails(v1)
	local v42
	if v3 then
		if v3 == true then
			local v5 = t.GiveGiftItem(p1, p2, v1)
			if v5 then
				return true, v5
			else
				return false, "Failed to give gift item"
			end
		end
		local v6 = if v2 then v4.getWrapperFromPlayer(v2) else v2
		local v7 = true
		if v6 then
			if not t.CanGiftBeSent(p1.Player, v2, p2, v1) then
				warn("\226\154\160\239\184\143 MarketplaceService, Gift to player is not allowed to recieve gift:", v3)
				v7 = false
			end
		else
			warn("\226\154\160\239\184\143 MarketplaceService, Gift to player does not have wrapper loaded:", v3)
			v7 = false
		end
		if not v7 then
			t._onGiftPurchaseFailed(p1, v3, p2, v1, ...)
			return true, {
				ItemType = "MarketplaceGiftToken",
				ItemId = p2.ProductId
			}
		end
		v42 = v6
	else
		v42 = p1
	end
	local v8, v9 = t._runProductPurchasedCallback(v42, p2, v1, ...)
	if v42 ~= p1 then
		v10.Notify(p1.Player, "GiftSent", { v42.Player })
		v10.Notify(v42.Player, "GiftReceived", { p1.Player })
	end
	runConfigProductPurchasedCallback(p1, p2, ...)
	return v8, v9
end
function t._onGiftPurchaseFailed(p1, p2, p3, p4, ...) --[[ _onGiftPurchaseFailed | Line: 1000 ]]
	warn("Gift purchase failed, save to data for future retries")
end
function t.GiveGiftItem(p1, p2, p3) --[[ GiveGiftItem | Line: 1010 | Upvalues: HttpService (copy) ]]
	print("GiveGiftItem", p1.Player, p2.ProductId, p2, p3)
	local v1, v2 = pcall(function() --[[ Line: 289 | Upvalues: HttpService (ref), p3 (copy) ]]
		return HttpService:JSONEncode(p3)
	end)
	if not v1 then
		warn("\226\154\160\239\184\143 MarketplaceService, Error encoding purchase details:", p3, v2)
	end
	local v3 = if v1 and v2 then v2 else nil
	if not v3 then
		return false
	end
	local t = {
		AnalyticsSource = "MarketplaceGift"
	}
	local t2 = {
		Name = "MarketplaceGift",
		Amount = 1,
		PurchaseDetails = v3
	}
	t2.ProductId = p2.OriginalProductId or p2.ProductId
	t.Item = t2
	if p1:GiveItem(t) then
		return {
			ItemType = "MarketplaceGift",
			ItemId = p2.ProductId
		}
	end
	warn("\226\154\160\239\184\143 MarketplaceService, Error occured giving a product gift:", p2.ProductId, p2)
end
function t.RedeemGiftItem(p1, p2, p3) --[[ RedeemGiftItem | Line: 1040 | Upvalues: t (copy), v4 (copy), v12 (copy), v20 (copy), HttpService (copy), v10 (copy) ]]
	print("RedeemGiftItem", p1.Player, p2, p3)
	local v1 = p1:GetItemValue(p3)
	if not v1 then
		return false
	end
	if (tonumber(p3) and v1.Value or p3) ~= "MarketplaceGift" then
		return false
	end
	local ProductId = v1.ProductId.Value
	local v3 = t.GetPurchaseFromId(ProductId)
	if not v3 then
		warn("\226\154\160\239\184\143 MarketplaceService, Failed to redeem gift item, product not found:", ProductId)
		return false
	end
	local v42 = if type(p2) == "table" and p2 then p2 else v4.getWrapperFromPlayer(p2)
	local v5 = v42 and v42.Player or p2
	if not v12 then
		v20:FireServer(v5, p3)
		return true
	end
	if not v42 then
		return false
	end
	local PurchaseDetails = v1.PurchaseDetails.Value
	local v6, v7 = pcall(function() --[[ Line: 303 | Upvalues: HttpService (ref), PurchaseDetails (copy) ]]
		return HttpService:JSONDecode(PurchaseDetails)
	end)
	if not v6 then
		warn("\226\154\160\239\184\143 MarketplaceService, Error decoding purchase details:", PurchaseDetails, v7)
	end
	local v8 = if v6 and v7 then v7 else nil
	if not v8 then
		return false
	end
	v8.GiftToPlayer = nil
	if not t.CanGiftBeSent(p1.Player, v5, v3, v8) then
		return false
	end
	local v9, v102 = t._runProductPurchasedCallback(v42, v3, v8)
	if not v9 then
		return v9, v102
	end
	p1:RemoveItem({
		AnalyticsSource = "MarketplaceGifted",
		Value = v1
	})
	v10.Notify(p1.Player, "GiftSent", { v5 })
	v10.Notify(v5, "GiftReceived", { p1.Player })
	return v9, v102
end
function t.CanProductBeGifted(p1) --[[ CanProductBeGifted | Line: 1104 ]]
	return p1.Giftable or (if p1.GiftProductId == nil then p1.OriginalProductId ~= nil else true)
end
function t.CanGiftBeSent(p1, p2, p3, p4) --[[ CanGiftBeSent | Line: 1116 | Upvalues: t (copy), v13 (copy), validatePurchaseDetails (copy) ]]
	print("CanGiftBeSent", p1, p2, p3, p4)
	if not t.CanProductBeGifted(p3) then
		return false
	end
	if not v13 and p1 == p2 then
		return false
	end
	local v1 = if p4 then p4 else {}
	v1.Gift = true
	return (not p2 or validatePurchaseDetails(p2, p3.ProductId, v1)) and true or false
end
function t.AddProductTypePurchasedEventCallback(p1, p2) --[[ AddProductTypePurchasedEventCallback | Line: 1149 | Upvalues: t6 (copy) ]]
	if t6[p1] then
		warn("\226\154\160\239\184\143 MarketplaceService, Event already has callback:", p1)
	else
		t6[p1] = p2
	end
end
function t.RunProductTypePurchasedCallback(p1, p2, p3) --[[ RunProductTypePurchasedCallback | Line: 1162 | Upvalues: t6 (copy) ]]
	local v1 = t6[p2]
	if v1 == nil then
		return true
	end
	local v2, v3 = pcall(v1, p1, p3)
	if v2 and v3 then
		return v2 and v3
	end
	warn("\226\154\160\239\184\143 MarketplaceService, Error occured proccessing a server purchase finished callback:", p3.ProductId, v3)
	return false
end
function t.GetPurchasingScreenSignal() --[[ GetPurchasingScreenSignal | Line: 1184 | Upvalues: v16 (copy) ]]
	return v16
end
function t.IsInPurchaseScreen() --[[ IsInPurchaseScreen | Line: 1190 ]]
	return false
end
function t.DoesPlayerOwnPremium(p1) --[[ DoesPlayerOwnPremium | Line: 1198 | Upvalues: Premium (copy) ]]
	if not p1 then
		warn("\226\154\160\239\184\143 MarketplaceService, Player is required")
		return false
	end
	return p1.MembershipType == Premium
end
function t.GetMembershipChangedSignal(p1) --[[ GetMembershipChangedSignal | Line: 1210 ]]
	if p1 then
		return p1:GetPropertyChangedSignal("MembershipType")
	else
		warn("\226\154\160\239\184\143 MarketplaceService, Player is required")
		return nil
	end
end
function t.GetPurchaseDetails(p1) --[[ GetPurchaseDetails | Line: 1220 | Upvalues: t8 (copy) ]]
	return t8[p1]
end
function t.HasPurchaseDetails(p1) --[[ HasPurchaseDetails | Line: 1226 | Upvalues: t (copy) ]]
	return t.GetPurchaseDetails(p1) ~= nil
end
function t.SetPurchaseDetails(p1, p2) --[[ SetPurchaseDetails | Line: 1235 | Upvalues: t (copy), t8 (copy) ]]
	if t.HasPurchaseDetails(p1) then
		return false
	else
		t8[p1] = p2
		return true
	end
end
function t.ClearPurchaseDetails(p1) --[[ ClearPurchaseDetails | Line: 1245 | Upvalues: t8 (copy) ]]
	t8[p1] = nil
end
function t.Init(p1) --[[ Init | Line: 1249 | Upvalues: v15 (copy), t (copy), v7 (copy), v12 (copy), t4 (copy), MarketplaceService (copy), Players (copy), v4 (copy), postDeveloperProductAnalytics (copy), addMetaDataToPlayer (copy), v18 (copy), v19 (copy), v20 (copy), v17 (copy), onPurchaseStarted (copy), t2 (copy), onPurchaseFinished (copy) ]]
	for v1, v2 in v15 do
		t.AddPurchasesFromModule(v2)
	end
	v7.OnServerInitialised(function() --[[ Line: 1254 | Upvalues: v12 (ref), t4 (ref) ]]
		if not v12 then
			return
		end
		print("\226\156\133 MarketplaceService, Initialised marketplace products", t4)
	end)
	if v12 then
		function MarketplaceService.ProcessReceipt(p1) --[[ Line: 1263 | Upvalues: Players (ref), v4 (ref), t (ref), postDeveloperProductAnalytics (ref), addMetaDataToPlayer (ref) ]]
			local v1 = Players:GetPlayerByUserId(p1.PlayerId)
			if not v1 then
				warn("\226\154\160\239\184\143 MarketplaceService, Player not found:", p1.PlayerId)
				return Enum.ProductPurchaseDecision.NotProcessedYet
			end
			local v2 = v4.getWrapperWithYield(v1)
			if not v2 then
				warn("\226\154\160\239\184\143 MarketplaceService, Player wrapper not found:", p1.PlayerId)
				return Enum.ProductPurchaseDecision.NotProcessedYet
			end
			local v3 = t.GetPurchaseFromId(p1.ProductId)
			if not v3 then
				warn("\226\154\160\239\184\143 MarketplaceService, Product has not been registered:", p1.ProductId)
				return Enum.ProductPurchaseDecision.NotProcessedYet
			end
			local v42, v5 = t.RunProductPurchasedCallback(v2, v3, p1)
			if v42 and v5 then
				task.spawn(postDeveloperProductAnalytics, v1, p1, v5)
				task.spawn(addMetaDataToPlayer, v2, p1)
				task.spawn(v4.Save, v2)
				return Enum.ProductPurchaseDecision.PurchaseGranted
			end
			warn("\226\154\160\239\184\143 MarketplaceService, Error occured proccessing a product purchase:", p1.ProductId, v5)
			return Enum.ProductPurchaseDecision.NotProcessedYet
		end
		MarketplaceService.PromptPurchaseFinished:Connect(function(p1, p2, p3) --[[ Line: 1306 | Upvalues: v4 (ref), t (ref) ]]
			if not p3 then
				return
			end
			local v1 = v4.getWrapperWithYield(p1)
			if not v1 then
				return
			end
			local v2 = t.GetPurchaseFromId(p2)
			if not v2 then
				warn("\226\154\160\239\184\143 MarketplaceService, Asset has not been registered:", p2)
				return
			end
			if not t.RunProductTypePurchasedCallback(v1, "Asset", v2) then
				return
			end
			local v3, v42 = t.RunProductPurchasedCallback(v1, v2)
			if v3 and v42 then
				return
			end
			warn("\226\154\160\239\184\143 MarketplaceService, Error occured proccessing an asset purchase:", p2, v42)
		end)
		MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(p1, p2, p3) --[[ Line: 1337 | Upvalues: v4 (ref), t (ref) ]]
			if not p3 then
				return
			end
			local v1 = v4.getWrapperWithYield(p1)
			if not v1 then
				return
			end
			local v2 = t.GetPurchaseFromId(p2)
			if not v2 then
				warn("\226\154\160\239\184\143 MarketplaceService, Gamepass has not been registered:", p2)
				return
			end
			if not t.RunProductTypePurchasedCallback(v1, "Gamepass", v2) then
				return
			end
			local v3, v42 = t.RunProductPurchasedCallback(v1, v2)
			if v3 and v42 then
				return
			end
			warn("\226\154\160\239\184\143 MarketplaceService, Error occured proccessing an gamepass purchase:", p2, v42)
		end)
		Players.UserSubscriptionStatusChanged:Connect(function(p1, p2) --[[ Line: 1368 | Upvalues: v4 (ref), t (ref) ]]
			local v1 = v4.getWrapperWithYield(p1)
			if not v1 then
				return
			end
			local v2 = t.GetPurchaseFromId(p2)
			if not v2 then
				warn("\226\154\160\239\184\143 MarketplaceService, Subscription has not been registered:", p2)
				return
			end
			if not t.RunProductTypePurchasedCallback(v1, "Subscription", v2) then
				return
			end
			local v3, v42 = t.RunProductPurchasedCallback(v1, v2)
			if v3 and v42 then
				return
			end
			warn("\226\154\160\239\184\143 MarketplaceService, Error occured proccessing a subscription purchase:", p2, v42)
		end)
		t.AddProductPurchasedCallback("MarketplaceGift", function(p1, p2, p3) --[[ Line: 1394 | Upvalues: t (ref) ]]
			warn("MarketplaceGift", p1.Player, p2.ProductId, p2)
			local v1 = t.GetPurchaseFromId(p2.OriginalProductId)
			if not v1 then
				warn("\226\154\160\239\184\143 MarketplaceService, Product not found:", p2.OriginalProductId)
				return
			end
			local v2 = if p3 then p3 else {}
			v2.GiftToPlayer = v2.GiftToPlayer or true
			local v3, v4 = t.RunProductPurchasedCallback(p1, v1, v2)
			return if v3 and v4 then v4 else nil
		end)
		v18.OnServerEvent:Connect(function(p1, ...) --[[ Line: 1409 | Upvalues: t (ref) ]]
			t.PromptPurchase(p1, ...)
		end)
		v19.OnServerEvent:Connect(function(p1, ...) --[[ Line: 1413 | Upvalues: t (ref) ]]
			t.PromptGiftPurchase(p1, ...)
		end)
		v20.OnServerEvent:Connect(function(p1, ...) --[[ Line: 1417 | Upvalues: v4 (ref), t (ref) ]]
			local v1 = v4.getWrapperWithYield(p1)
			if v1 then
				t.RedeemGiftItem(v1, ...)
			end
		end)
		v4.bindToPlayers({
			OnAdded = function(p1, p2) --[[ OnAdded | Line: 1427 | Upvalues: t (ref) ]]
				p2.Maid:GiveTask(function() --[[ Line: 1428 | Upvalues: t (ref), p1 (copy) ]]
					t.ClearPurchaseDetails(p1)
				end)
			end
		})
	else
		v17.OnClientEvent:Connect(onPurchaseStarted)
	end
	for v3, v42 in t2 do
		v42:Connect(function(p1, p2, p3) --[[ Line: 1440 | Upvalues: Players (ref), t (ref), onPurchaseFinished (ref) ]]
			local v1 = typeof(p1) == "number" and Players:GetPlayerByUserId(p1) or p1
			if not v1 then
				return
			end
			onPurchaseFinished(v1, p2, t.GetProductType(p2), p3)
		end)
	end
end
t:Init()
return t