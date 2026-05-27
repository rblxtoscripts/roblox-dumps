-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("MarketplaceService")
Sonar("Bundle")
Sonar("ForeverPack")
local v2 = Sonar("DataUpdateService", "Server")
local v3 = Sonar("InstanceUtils")
local v4 = Sonar("StorageUtils")
Sonar("BundleService")
local v5 = game:GetService("RunService"):IsServer()
v4.Get("Products")()
function t.Init(p1) --[[ Init | Line: 26 | Upvalues: v5 (copy), v1 (copy), v2 (copy), v3 (copy) ]]
	if not v5 then
		return
	end
	v1.AddProductPurchasedCallback("Currency", function(p1, p2) --[[ Line: 28 ]]
		p1:GiveItem({
			ItemStream = "RobuxPurchase",
			Item = {
				Name = p2.Currency,
				Amount = p2.Amount
			},
			AnalyticsSource = p2.Name
		})
		return {
			ItemType = p2.Currency,
			ItemId = p2.Name
		}
	end)
	v2.AddRigDataCallback(function(p1) --[[ Line: 42 | Upvalues: v3 (ref) ]]
		if p1:FindFirstChild("PremiumShop") then
			return
		end
		v3.Create("Folder", {
			Name = "PremiumShop",
			Parent = p1
		})
	end)
end
t:Init()
return t