-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MarketplaceService = game:GetService("MarketplaceService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("MarketplaceService")
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("StorageUtils")
local v4 = Sonar("Promise")
local v5 = Sonar("retryAsync")
local v6 = game:GetService("RunService"):IsServer()
local v7 = v3.Get("Subscriptions")()
local Subscriptions
if v6 then
	Subscriptions = Instance.new("Configuration")
	Subscriptions.Name = "Subscriptions"
else
	Subscriptions = nil
end
function t.GetSubscriptionFromName(p1) --[[ GetSubscriptionFromName | Line: 83 | Upvalues: v7 (copy) ]]
	return v7[p1]
end
function t.GetSubscriptionFromId(p1) --[[ GetSubscriptionFromId | Line: 87 | Upvalues: v7 (copy), t (copy) ]]
	for k, v in pairs(v7) do
		if v.ProductId == p1 then
			return t.GetSubscriptionFromName(k)
		end
	end
	return nil
end
function t.GetSubscriptionOwnership(p1, p2) --[[ GetSubscriptionOwnership | Line: 96 ]]
	local Subscriptions = p1:WaitForChild("Subscriptions")
	if Subscriptions then
		return Subscriptions:GetAttribute(p2)
	else
		return nil
	end
end
function t.GetSubscriptionFolder(p1) --[[ GetSubscriptionFolder | Line: 102 ]]
	local Subscriptions = p1:FindFirstChild("Subscriptions")
	if Subscriptions then
		return Subscriptions
	else
		return nil
	end
end
function t.GetSubscriptionChangedSignal(p1, p2) --[[ GetSubscriptionChangedSignal | Line: 108 ]]
	local Subscriptions = p1:WaitForChild("Subscriptions")
	if Subscriptions then
		return Subscriptions:GetAttributeChangedSignal(p2)
	else
		return nil
	end
end
function t.DoesPlayerOwnSubscription(p1, p2) --[[ DoesPlayerOwnSubscription | Line: 115 | Upvalues: t (copy) ]]
	return t.GetSubscriptionOwnership(p1, p2) == true
end
function t.SetSubscriptionOwnership(p1, p2, p3) --[[ SetSubscriptionOwnership | Line: 119 | Upvalues: t (copy) ]]
	local v1 = t.GetSubscriptionFolder(p1)
	if v1 then
		v1:SetAttribute(p2, p3)
	end
end
function t.GetSubscriptionStatus(p1, p2) --[[ GetSubscriptionStatus | Line: 125 | Upvalues: MarketplaceService (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 126 | Upvalues: MarketplaceService (ref), p1 (copy), p2 (copy) ]]
		return MarketplaceService:GetUserSubscriptionStatusAsync(p1, p2)
	end)
	return if v1 and v2 then v2 else {
	IsSubscribed = false
}
end
function t.Init(p1) --[[ Init | Line: 132 | Upvalues: v6 (copy), v2 (copy), Subscriptions (ref), v7 (copy), v4 (copy), t (copy), v1 (copy), v5 (copy) ]]
	if not v6 then
		return
	end
	v2.bindToPlayers({
		OnInit = function(p1, p2) --[[ OnInit | Line: 135 | Upvalues: Subscriptions (ref), v7 (ref), v4 (ref), t (ref) ]]
			local v1 = Subscriptions:Clone()
			for k, v in pairs(v7) do
				local v2 = v4.new(function(p1) --[[ Line: 138 | Upvalues: t (ref), p2 (copy), v (copy) ]]
					p1(t.GetSubscriptionStatus(p2.Player, v.ProductId) or false)
				end)
				v2:andThen(function(p1) --[[ Line: 142 | Upvalues: v1 (copy), k (copy) ]]
					if not (p1 and p1.IsSubscribed) then
						return
					end
					v1:SetAttribute(k, true)
				end)
				p2.Maid:GivePromise(v2)
			end
			v1.Parent = p2.Player
		end
	})
	v1.AddProductTypePurchasedEventCallback("Subscription", function(p1, p2) --[[ Line: 155 | Upvalues: v5 (ref), t (ref) ]]
		local v1 = v5(t.GetSubscriptionStatus(p1.Player, p2.ProductId))
		if v1 then
			t.SetSubscriptionOwnership(p1.Player, p2.Name, v1.IsSubscribed)
			return v1.IsSubscribed
		end
	end)
end
t:Init()
return t