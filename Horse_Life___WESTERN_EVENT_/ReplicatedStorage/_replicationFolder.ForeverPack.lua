-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("DataUpdateService", "Server")
local v2 = Sonar("MarketplaceService")
local v3 = Sonar("InstanceUtils")
local v4 = Sonar("WeightedProbability")
local v5 = Sonar("Signal")
local v6 = Sonar("TimeSeed")
local v7 = Sonar("PlayerWrapper")
local v8 = Sonar("DataUtils")
local v9 = Sonar("Maid")
local v10 = Sonar("RemoteUtils")
local v11 = Sonar("StorageUtils")
local v12 = game:GetService("RunService"):IsServer()
local t2 = {}
function t.new(p1, p2) --[[ new | Line: 27 | Upvalues: t (copy), v9 (copy), v2 (copy), v6 (copy), v12 (copy), v7 (copy), v8 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v9.new()
	v22.Name = p1
	v22.Config = p2
	for v3, v4 in v22.Config.PurchaseTiers do
		v4.ProductType = "DeveloperProduct"
		v4.ProductCategory = "ForeverPackTier"
		v4.Name = v22.Name .. "_" .. v3
		v4.Pack = v22.Name
	end
	v2.AddPurchasesFromModule(v22.Config.PurchaseTiers)
	if v22.Config.Refresh then
		v22.RefreshTimer = v22.Config.Refresh.TimeSeed or v6.new({
			DoNotDeferSeedInit = true,
			Duration = v22.Config.Refresh.Duration,
			Start = v22.Config.Refresh.StartTime
		})
		v22.Maid:GiveTask(v22.RefreshTimer)
	end
	if v12 then
		local function resetPlayerData(p1, p2) --[[ resetPlayerData | Line: 58 | Upvalues: v22 (copy) ]]
			local LastRefresh = p2:FindFirstChild("LastRefresh")
			if not LastRefresh then
				warn("\226\154\160\239\184\143 ForeverPack, No LastRefresh data value found in", p2, v22.Name)
				return
			end
			if LastRefresh.Value ~= v22.RefreshTimer.CurrentSeed then
				LastRefresh.Value = v22.RefreshTimer.CurrentSeed
				v22:ResetPlayerData(p1)
			end
		end
		v7.bindToPlayers({
			OnAdded = function(p1, p2) --[[ OnAdded | Line: 79 | Upvalues: v22 (copy), v8 (ref) ]]
				local v1 = v22:_getDataFolder(p2)
				if not v1 and v22.Config.Data == nil then
					v1 = v8.CreateDataValueFromType("ForeverPack")
					v1.Name = v22.Name
					v1.Parent = p2.PlayerData.PremiumShop.ForeverPacks
				end
				if not v1 then
					warn("\226\154\160\239\184\143 ForeverPack, No pack data folder found in", p2.Player, v22.Name)
				else
					p2.Maid:GiveTask(v22.RefreshTimer.SeedChanged:Connect(function() --[[ Line: 94 | Upvalues: p2 (copy), v1 (ref), v22 (ref) ]]
						local v12 = p2
						local v2 = v1
						local LastRefresh = v2:FindFirstChild("LastRefresh")
						if not LastRefresh then
							warn("\226\154\160\239\184\143 ForeverPack, No LastRefresh data value found in", v2, v22.Name)
							return
						end
						if LastRefresh.Value ~= v22.RefreshTimer.CurrentSeed then
							LastRefresh.Value = v22.RefreshTimer.CurrentSeed
							v22:ResetPlayerData(v12)
						end
					end))
					local v2 = v1
					local LastRefresh = v2:FindFirstChild("LastRefresh")
					if LastRefresh then
						if LastRefresh.Value ~= v22.RefreshTimer.CurrentSeed then
							LastRefresh.Value = v22.RefreshTimer.CurrentSeed
							v22:ResetPlayerData(p2)
						end
					else
						warn("\226\154\160\239\184\143 ForeverPack, No LastRefresh data value found in", v2, v22.Name)
					end
				end
			end
		})
	end
	return v22
end
function t._getValueOrFunction(p1, p2, p3, ...) --[[ _getValueOrFunction | Line: 105 ]]
	if not p2 then
		return
	end
	if type(p2[p3]) == "function" then
		return p2[p3](p1, ...)
	else
		return p2[p3]
	end
end
function t._getDataFolder(p1, p2) --[[ _getDataFolder | Line: 117 ]]
	local v1 = p1:_getValueOrFunction(p1.Config, "Data", p2)
	if type(v1) == "string" then
		v1 = p2.PlayerData.PremiumShop.ForeverPacks:FindFirstChild(v1)
	end
	if not v1 then
		v1 = p2.PlayerData.PremiumShop.ForeverPacks:FindFirstChild(p1.Name)
	end
	return v1
end
function t._getClaimedValue(p1, p2) --[[ _getClaimedValue | Line: 130 ]]
	local v1 = p1:_getDataFolder(p2)
	if v1 then
		return v1:FindFirstChild("Claimed")
	else
		return nil
	end
end
function t._calculateTier(p1, p2, p3) --[[ _calculateTier | Line: 139 ]]
	local v1, sum
	if p1.Config then
		v1 = p1.Config.PurchaseTiers
		if v1 then
			sum = p3
		else
			v1 = {}
			sum = p3
		end
	else
		v1 = {}
		sum = p3
	end
	local function makeResult(p12, p22) --[[ makeResult | Line: 144 | Upvalues: p1 (copy), p2 (copy), p3 (copy) ]]
		return {
			ProductId = p22,
			Items = p1:_calculateItems(p2, p3, p12),
			Index = p3
		}
	end
	local v2 = #v1
	for v5, v6 in v1 do
		local v3, v4
		local FreeTiers = v6.FreeTiers
		local v8 = if FreeTiers == nil then false else true
		if v8 then
			v3 = FreeTiers.AmountBeforeFirstRepeat or 0
			v4 = FreeTiers.AmountPerRepeat or 0
		else
			v4 = 0
			v3 = 0
		end
		local v9 = v4 + 1
		local v10 = v8 and FreeTiers.RewardPool or v6.RewardPool
		if if v5 == v2 then true else false then
			if sum <= v3 then
				return {
					ProductId = nil,
					Items = p1:_calculateItems(p2, p3, v10),
					Index = p3
				}
			end
			if (sum - v3 - 1) % v9 + 1 == 1 then
				return {
					ProductId = v6.ProductId,
					Items = p1:_calculateItems(p2, p3, v6.RewardPool),
					Index = p3
				}
			else
				return {
					ProductId = nil,
					Items = p1:_calculateItems(p2, p3, v10),
					Index = p3
				}
			end
		end
		local v12 = v3 + (v6.Repeats or 1) * v9
		if v12 < sum then
			sum = sum - v12
		else
			if sum <= v3 then
				return {
					ProductId = nil,
					Items = p1:_calculateItems(p2, p3, v10),
					Index = p3
				}
			end
			if (sum - v3 - 1) % v9 + 1 == 1 then
				return {
					ProductId = v6.ProductId,
					Items = p1:_calculateItems(p2, p3, v6.RewardPool),
					Index = p3
				}
			else
				return {
					ProductId = nil,
					Items = p1:_calculateItems(p2, p3, v10),
					Index = p3
				}
			end
		end
	end
	return nil
end
function t._calculateItems(p1, p2, p3, p4) --[[ _calculateItems | Line: 200 | Upvalues: v4 (copy) ]]
	local sum = p3.Index * 100
	if p1.Config.UseUserIdAsSeed then
		sum = sum + p2.Player.UserId
	end
	return v4.getRandomWeightedItem(p1.Config.RewardPools[p4] or p1.Config.RewardPools.Default, sum)
end
function t.IsRobuxTier(p1, p2) --[[ IsRobuxTier | Line: 211 ]]
	local isNotProductId = p1:GetTier(p2).ProductId ~= nil
	return isNotProductId
end
function t.GetTier(p1, p2, p3) --[[ GetTier | Line: 216 ]]
	if type(p3) == "table" then
		return p3
	else
		return p1:_calculateTier(p2, p3)
	end
end
function t.GetCurrentTier(p1, p2) --[[ GetCurrentTier | Line: 224 ]]
	return p1:GetTier(p2, p1:_getClaimedValue(p2).Value)
end
function t.GetNextTier(p1, p2) --[[ GetNextTier | Line: 229 ]]
	return p1:GetTier(p2, p1:GetCurrentTier(p2).Index + 1)
end
function t.IsTierClaimed(p1, p2, p3) --[[ IsTierClaimed | Line: 234 ]]
	local v1 = type(p3) == "table" and p3.Index or p3
	return v1 <= p1:_getClaimedValue(p2).Value
end
function t.IsTierUnlocked(p1, p2, p3) --[[ IsTierUnlocked | Line: 240 ]]
	return p3 == p1:_getClaimedValue(p2).Value - 1
end
function t.GetTierState(p1, p2, p3) --[[ GetTierState | Line: 245 ]]
	if p1:IsTierClaimed(p2, p3) then
		return "Claimed"
	end
	if p1:IsTierUnlocked(p2, p3) then
		return "Unlocked"
	else
		return "Locked"
	end
end
function t.GetTiersChangedSignal(p1, p2) --[[ GetTiersChangedSignal | Line: 255 ]]
	return p1:_getClaimedValue(p2):GetPropertyChangedSignal("Value")
end
function t.GetTierChangedSignal(p1, p2, p3) --[[ GetTierChangedSignal | Line: 260 | Upvalues: v5 (copy) ]]
	local v1 = v5.new()
	local v2 = nil
	local function setTierState() --[[ setTierState | Line: 264 | Upvalues: p1 (copy), p2 (copy), p3 (copy), v2 (ref), v1 (copy) ]]
		local v12 = p1:GetTierState(p2, p3)
		if v12 == v2 then
			return
		end
		v2 = v12
		v1:Fire(v12)
	end
	v1:GiveTask(p1:GetTiersChangedSignal(p2):Connect(setTierState))
	local v3 = p1:GetTierState(p2, p3)
	if v3 ~= v2 then
		v2 = v3
		v1:Fire(v3)
	end
	return v1
end
function t.CanClaim(p1, p2) --[[ CanClaim | Line: 277 ]]
	local v1 = p1:GetNextTier(p2)
	if not v1 then
		return "TierNotFound"
	end
	if not p1:IsTierUnlocked(p2, v1) then
		return "NotUnlocked"
	end
	if p1:IsTierClaimed(p2, v1) then
		return "AlreadyClaimed"
	else
		return true, v1
	end
end
function t.Claim(p1, p2, p3) --[[ Claim | Line: 296 ]]
	local v1 = if p3 then p3 else p1:GetNextTier(p2)
	p1:_getClaimedValue(p2).Value = v1.Index
	p2:GiveItems({
		IgnoreLimit = true,
		Items = v1.Items,
		Actions = {
			Preset = "NewItem"
		},
		AnalyticsSource = p1.Name
	})
	return true
end
function t.ClaimOrPromptPurchase(p1, p2) --[[ ClaimOrPromptPurchase | Line: 315 | Upvalues: v2 (copy) ]]
	local v1 = p1:GetNextTier(p2)
	if p1:IsRobuxTier(v1) then
		v2.PromptPurchase(p2.Player, v1.ProductId, v1.ProductType)
		return true
	else
		return p1:Claim(p2, v1)
	end
end
function t.ResetPlayerData(p1, p2) --[[ ResetPlayerData | Line: 327 | Upvalues: v7 (copy) ]]
	local v1 = v7.getWrapperFromPlayer(p2)
	if not v1 then
		return
	end
	local v2 = p1:_getClaimedValue(v1)
	if v2 then
		v2.Value = 0
	end
end
function t.GetRefreshTimeChangedSignal(p1) --[[ GetRefreshTimeChangedSignal | Line: 341 ]]
	if p1.RefreshTimer then
		return p1.RefreshTimer.SeedChanged
	else
		return nil
	end
end
function t.GetRefreshTime(p1) --[[ GetRefreshTime | Line: 348 ]]
	if p1.RefreshTimer then
		return p1.RefreshTimer:GetEndTime()
	else
		return nil
	end
end
function t.RequestPurchase(p1) --[[ RequestPurchase | Line: 355 | Upvalues: v10 (copy) ]]
	return v10.GetRemoteFunction("PurchaseForeverPackRemote"):InvokeServer(p1.Name)
end
function t.Add(p1, p2) --[[ Add | Line: 359 | Upvalues: t2 (copy), v11 (copy), t (copy) ]]
	if t2[p1] then
		warn("\226\154\160\239\184\143 ForeverPack, Pack already exists", p1)
		return
	end
	local v2 = t.new(p1, if p2 then p2 else v11.Get(p1)())
	t2[p1] = v2
	return v2
end
function t.Get(p1) --[[ Get | Line: 372 | Upvalues: t2 (copy), t (copy) ]]
	if t2[p1] then
		return t2[p1]
	else
		return t.Add(p1)
	end
end
function t.Init(p1) --[[ Init | Line: 380 | Upvalues: v12 (copy), v1 (copy), v3 (copy), v10 (copy), v7 (copy), t (copy), v2 (copy) ]]
	if not v12 then
		return
	end
	v1.AddRigDataCallback(function(p1) --[[ Line: 382 | Upvalues: v3 (ref) ]]
		if p1.PremiumShop:FindFirstChild("ForeverPacks") then
			return
		end
		v3.Create("Folder", {
			Name = "ForeverPacks",
			Parent = p1.PremiumShop
		})
	end)
	v10.GetRemoteFunction("PurchaseForeverPackRemote").OnServerInvoke = function(p1, p2) --[[ Line: 391 | Upvalues: v7 (ref), t (ref) ]]
		local v1 = v7.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local v2 = t.Get(p2)
		if not v2 then
			return "PackNotFound"
		end
		local v3, v4 = v2:CanClaim(v1)
		if v3 == true then
			return v2:ClaimOrPromptPurchase(v1, v4)
		else
			return v3
		end
	end
	v2.AddProductPurchasedCallback("ForeverPackTier", function(p1, p2) --[[ Line: 410 | Upvalues: t (ref) ]]
		local v1 = t.Get(p2.Pack)
		if v1 then
			v1:Claim(p1)
			return {
				ItemType = p2.ProductCategory,
				ItemId = p2.Name
			}
		end
	end)
end
return t