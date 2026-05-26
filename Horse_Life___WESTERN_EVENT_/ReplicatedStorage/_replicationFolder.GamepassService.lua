-- https://lua.expert/
local t = {}
local MarketplaceService = game:GetService("MarketplaceService")
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar(Sonar("StorageUtils").Get("Gamepasses"))
local Gamepasses
if game:GetService("RunService"):IsServer() then
	Gamepasses = Instance.new("Folder")
	Gamepasses.Name = "Gamepasses"
	local function createPass(p1) --[[ createPass | Line: 20 | Upvalues: Gamepasses (ref) ]]
		local v1 = Instance.new("BoolValue")
		v1.Name = p1
		v1.Parent = Gamepasses
	end
	for k, v in pairs(v1) do
		local v2 = Instance.new("BoolValue")
		v2.Name = k
		v2.Parent = Gamepasses
	end
else
	Gamepasses = nil
end
local function getGamepassOwnership(p1, p2) --[[ getGamepassOwnership | Line: 33 | Upvalues: MarketplaceService (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 34 | Upvalues: MarketplaceService (ref), p1 (copy), p2 (copy) ]]
		return MarketplaceService:UserOwnsGamePassAsync(p1.UserId, p2)
	end)
	return if v1 and v2 then v2 else false
end
local function getCatalogItemOwnership(p1, p2) --[[ getCatalogItemOwnership | Line: 41 | Upvalues: MarketplaceService (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 42 | Upvalues: MarketplaceService (ref), p1 (copy), p2 (copy) ]]
		return MarketplaceService:PlayerOwnsAsset(p1, p2)
	end)
	return if v1 and v2 then v2 else false
end
local function isGamepassOwned(p1, p2, p3) --[[ isGamepassOwned | Line: 49 | Upvalues: MarketplaceService (copy) ]]
	if p2.CatalogItem then
		local v1, v2 = pcall(function() --[[ Line: 42 | Upvalues: MarketplaceService (ref), p1 (copy), p3 (copy) ]]
			return MarketplaceService:PlayerOwnsAsset(p1, p3)
		end)
		return if v1 and v2 then v2 else false
	else
		local v4, v5 = pcall(function() --[[ Line: 34 | Upvalues: MarketplaceService (ref), p1 (copy), p3 (copy) ]]
			return MarketplaceService:UserOwnsGamePassAsync(p1.UserId, p3)
		end)
		return if v4 and v5 then v5 else false
	end
end
function t.GetOwnedGamepasses(p1) --[[ GetOwnedGamepasses | Line: 59 | Upvalues: Gamepasses (ref), v1 (copy), MarketplaceService (copy) ]]
	local v12 = Gamepasses:Clone()
	for k, v in pairs(v1) do
		local v2
		if type(v.ProductId) == "table" then
			for k2, v4 in pairs(v.ProductId) do
				local v3
				if v.CatalogItem then
					local v5, v6 = pcall(function() --[[ Line: 42 | Upvalues: MarketplaceService (ref), p1 (copy), v4 (copy) ]]
						return MarketplaceService:PlayerOwnsAsset(p1, v4)
					end)
					v3 = if v5 and v6 then v6 else false
				else
					local v7, v8 = pcall(function() --[[ Line: 34 | Upvalues: MarketplaceService (ref), p1 (copy), v4 (copy) ]]
						return MarketplaceService:UserOwnsGamePassAsync(p1.UserId, v4)
					end)
					v3 = if v7 and v8 then v8 else false
				end
				v12[k].Value = v3
				if v12[k].Value then
					break
				end
			end
			continue
		end
		local ProductId_2 = v.ProductId
		if v.CatalogItem then
			local v10, v11 = pcall(function() --[[ Line: 42 | Upvalues: MarketplaceService (ref), p1 (copy), ProductId_2 (copy) ]]
				return MarketplaceService:PlayerOwnsAsset(p1, ProductId_2)
			end)
			v2 = if v10 and v11 then v11 else false
		else
			local v122, v13 = pcall(function() --[[ Line: 34 | Upvalues: MarketplaceService (ref), p1 (copy), ProductId_2 (copy) ]]
				return MarketplaceService:UserOwnsGamePassAsync(p1.UserId, ProductId_2)
			end)
			v2 = if v122 and v13 then v13 else false
		end
		v12[k].Value = v2
	end
	v12.Parent = p1
	return v12
end
function t.GetGamepassFromName(p1, p2) --[[ GetGamepassFromName | Line: 81 ]]
	local Gamepasses = p1:FindFirstChild("Gamepasses")
	if Gamepasses then
		return Gamepasses:FindFirstChild(p2)
	end
end
function t.GetGamepassFromId(p1, p2) --[[ GetGamepassFromId | Line: 90 | Upvalues: v1 (copy), t (copy) ]]
	for k, v in pairs(v1) do
		if v.ProductId == p2 then
			return t.GetGamepassFromName(p1, k)
		end
	end
end
function t.GetGamepassIdFromName(p1) --[[ GetGamepassIdFromName | Line: 100 | Upvalues: v1 (copy) ]]
	if not v1[p1] then
		warn("No Gamepass data found for", p1)
	end
	return v1[p1].ProductId
end
function t.PlayerOwnsGamepass(p1, p2) --[[ PlayerOwnsGamepass | Line: 110 | Upvalues: t (copy) ]]
	local v1 = t.GetGamepassFromName(p1, p2)
	return if v1 then v1.Value else v1
end
return t