-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("UnlockSequenceService")
local v2 = Sonar("MarketplaceService")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("StorageUtils")
local v5 = Sonar("RemoteUtils")
local v6 = Sonar("EventUtils")
local v7 = Sonar("Signal")
local v8 = Sonar("Constants")
local v9 = v4.GetConfig("Battlepass")()
local v10 = v4.Get("Battlepasses")()
local t = {}
local t2 = {}
local v11 = nil
local v12 = v7.new()
local t3 = {
	GetAllBattlepasses = function() --[[ GetAllBattlepasses | Line: 98 | Upvalues: v10 (copy) ]]
		return v10
	end,
	GetBattlepassData = function(p1) --[[ GetBattlepassData | Line: 103 | Upvalues: v10 (copy) ]]
		return v10[p1]
	end,
	GetBattlepassesForCategory = function(p1) --[[ GetBattlepassesForCategory | Line: 109 | Upvalues: t (copy) ]]
		return t[p1]
	end
}
function t3.GetBattlepassOrder(p1) --[[ GetBattlepassOrder | Line: 116 | Upvalues: t (copy), v10 (copy), t3 (copy) ]]
	local v1 = if p1 then p1 else {}
	local v2, v3
	if v1.Category and v1.Category ~= "All" then
		v2 = t[v1.Category]
		if v2 then
			v3 = v1
		else
			v2 = {}
			v3 = v1
		end
	else
		v3 = v1
		v2 = v10
	end
	local t2 = {}
	for v4, v5 in v2 do
		if v5.StartTime and (not v3.UnlockedOnly or t3.CanBattlepassBeActivated(v4)) and (not v3.PlayerWrapper or v3.PlayerWrapper:IsBattlepassActive(v4)) then
			table.insert(t2, v5)
		end
	end
	local isNotSort = v3.Sort ~= "Descending"
	table.sort(t2, function(p1, p2) --[[ Line: 141 | Upvalues: isNotSort (copy) ]]
		local v1 = p1.StartTime < p2.StartTime
		if isNotSort then
			return v1
		else
			return not v1
		end
	end)
	return t2
end
function t3.GetBattlepassSequence(p1) --[[ GetBattlepassSequence | Line: 151 | Upvalues: t2 (copy), v10 (copy), v1 (copy) ]]
	if t2[p1] then
		return t2[p1]
	end
	local v12 = v10[p1]
	if v12 then
		local v2 = v1.AddSequence(("Battlepass_%*"):format(p1), {
			ClaimInOrder = false,
			RequiredPointsDataValue = "XP",
			Tiers = v12.Tiers,
			Tracks = v12.Tracks,
			StartTime = v12.StartTime,
			Data = function(p12, p2) --[[ Data | Line: 167 | Upvalues: p1 (copy) ]]
				return p2:GetBattlepassPlayerData(p1)
			end,
			OnClaimed = function(p1, p2, p3) --[[ OnClaimed | Line: 170 | Upvalues: v12 (copy) ]]
				if not v12.OnClaimed then
					return
				end
				v12.OnClaimed(p1, p2, p3, v12)
			end
		})
		t2[p1] = v2
		return v2
	else
		return nil
	end
end
function t3.GetMaxBattlepassSequence() --[[ GetMaxBattlepassSequence | Line: 183 | Upvalues: v11 (ref) ]]
	return v11
end
function t3.RequestToIncreaseMaxBattlepasses(p1) --[[ RequestToIncreaseMaxBattlepasses | Line: 190 | Upvalues: v11 (ref), v3 (copy), v1 (copy) ]]
	local v12 = p1 or "Total"
	local v2 = v11:GetNextTierToUnlock(v3.GetClient(), v12)
	if v2 then
		return v1.RequestToClaimTier({
			Sequence = v11,
			Track = v12,
			Tier = v2
		})
	else
		return "NoTierToClaim"
	end
end
function t3.RequestToSkipTier(p1, p2) --[[ RequestToSkipTier | Line: 209 | Upvalues: v3 (copy), t3 (copy), v2 (copy) ]]
	local v1 = v3.GetClient()
	local v22, v32 = t3.GetTierToSkip(v1, p1, p2)
	if v32 then
		v2.PromptPurchase(v1.Player, v32, "DeveloperProduct", {
			PassName = p1,
			TrackName = p2,
			Tier = v22
		})
	end
end
function t3.CanSkipTier(p1, p2, p3) --[[ CanSkipTier | Line: 229 | Upvalues: t3 (copy) ]]
	local v1 = t3.GetBattlepassSequence(p2)
	if not v1 then
		return false
	end
	if v1:IsTierUnlocked(p1, p3) then
		return t3.GetSkipTierProductId(p2, p3) and true or false
	else
		return false
	end
end
function t3.GetTierToSkip(p1, p2, p3) --[[ GetTierToSkip | Line: 247 | Upvalues: t3 (copy) ]]
	local v1 = t3.GetBattlepassData(p2)
	local v2 = t3.GetBattlepassSequence(p2)
	if not (v1 and v2) then
		return nil
	end
	local v3 = v2:GetNextTierToUnlock(p1, p3)
	if not v3 then
		return nil
	end
	local v4 = t3.GetSkipTierProductId(p2, v3)
	if v4 then
		return v3, v4
	else
		return nil
	end
end
function t3.GetSkipTierProductId(p1, p2) --[[ GetSkipTierProductId | Line: 271 | Upvalues: t3 (copy) ]]
	if not p2 then
		return nil
	end
	local v1 = t3.GetBattlepassData(p1)
	if not v1 then
		return nil
	end
	if typeof(v1.SkipTierProductId) == "number" then
		return v1.SkipTierProductId, 1
	end
	if typeof(v1.SkipTierProductId) == "function" then
		return v1.SkipTierProductId(p2)
	else
		return nil
	end
end
function t3.GetActivateBattlepassProductId(p1, p2) --[[ GetActivateBattlepassProductId | Line: 293 | Upvalues: t3 (copy) ]]
	if not p2 and t3.IsFreeToActivate(p1) then
		return nil
	end
	local v1 = t3.GetBattlepassData(p1)
	if v1 then
		return tonumber(v1.ActivateProductId)
	else
		return nil
	end
end
function t3.CanBattlepassBeActivated(p1, p2, p3) --[[ CanBattlepassBeActivated | Line: 315 | Upvalues: v10 (copy), t3 (copy) ]]
	local v1 = if p3 then p3 else {}
	local v2 = v10[p1]
	if not v2 then
		return false
	end
	if v2.StartTime and workspace:GetServerTimeNow() < v2.StartTime then
		return false, "NotStarted"
	end
	if v2.EndTime and workspace:GetServerTimeNow() >= v2.EndTime then
		return false, "Expired"
	end
	local v3 = nil
	if p2 then
		if p2:IsBattlepassActive(p1) then
			return false, "AlreadyActive"
		end
		local v4
		if v1.Robux then
			if not t3.GetActivateBattlepassProductId(p1) then
				return false, "CannotAfford"
			end
			v4 = v1
		else
			local v5 = t3.GetPriceToActivate(p1, p2)
			v4 = v1
			if v5 then
				for v6, v7 in v5 do
					if not p2:HasRequiredItemAmount(v6, v7) then
						return false, "CannotAfford"
					end
				end
			end
		end
		local v8 = if #p2:GetActiveBattlepasses() >= p2:GetMaxActiveBattlepasses({
	Category = "Total"
}) then true else false
		if v8 or (if #p2:GetActiveBattlepasses({
	Category = v2.Category
}) >= p2:GetMaxActiveBattlepasses({
	Category = v2.Category
}) then true else false) then
			if v4.Swap then
				v3 = p2:GetBattlepassToDeactivate(v4.Swap)
			end
			if not v3 then
				return false, "MaxCapacity"
			end
		end
	end
	return true, v3
end
function t3.GetPriceToActivate(p1, p2) --[[ GetPriceToActivate | Line: 375 | Upvalues: t3 (copy) ]]
	local v1 = t3.GetBattlepassData(p1)
	if not v1 then
		return nil
	end
	if not v1.Price then
		return nil
	end
	local Price = v1.Price
	if typeof(v1.Price) == "function" then
		Price = v1.Price(v1, p2)
	end
	return Price
end
function t3.IsFreeToActivate(p1) --[[ IsFreeToActivate | Line: 396 | Upvalues: t3 (copy) ]]
	local v1 = t3.GetPriceToActivate(p1)
	if not v1 then
		return true
	end
	for v2, v3 in v1 do
		if v3 > 0 then
			return false
		end
	end
	return true
end
function t3.CalculateTier(p1, p2) --[[ CalculateTier | Line: 413 ]]
	local v1 = p1:GetBattlepass(p2)
	if v1 then
		return v1:CalculateTier()
	else
		return 0
	end
end
function t3.GetTierChangedSignal(p1, p2, p3) --[[ GetTierChangedSignal | Line: 425 | Upvalues: v7 (copy), t3 (copy) ]]
	local v1 = v7.new()
	local function bindToSequence() --[[ bindToSequence | Line: 428 | Upvalues: t3 (ref), p3 (copy), v1 (copy), p2 (copy) ]]
		v1:GiveTask(t3.GetBattlepassSequence(p3):GetTiersChangedSignal(p2):Connect(function() --[[ Line: 430 | Upvalues: v1 (ref), t3 (ref), p2 (ref), p3 (ref) ]]
			v1:Fire(t3.CalculateTier(p2, p3))
		end))
	end
	if p2:GetBattlepassPlayerData(p3) then
		bindToSequence()
	else
		v1:GiveTask(p2.BattlepassWrapper.BattlepassFolder.ChildAdded:Connect(function(p1) --[[ Line: 439 | Upvalues: p3 (copy), bindToSequence (copy) ]]
			if p1.Name ~= p3 then
				return
			end
			bindToSequence()
		end))
	end
	return v1
end
function t3.GetBattlepassLockChangedSignal(p1, p2) --[[ GetBattlepassLockChangedSignal | Line: 452 | Upvalues: v7 (copy), v12 (copy), t3 (copy) ]]
	local v2 = p2 or {}
	local v3 = v7.new()
	v3:GiveTask(v12:Connect(function(p1, p2) --[[ Line: 456 | Upvalues: v2 (ref), t3 (ref), v3 (copy) ]]
		if v2.Category and (v2.Category ~= "All" and t3.GetBattlepassData(p1).Category ~= v2.Category) then
			return
		end
		if v2.PassName and v2.PassName ~= p1 then
			return
		end
		v3:Fire(p1, p2)
	end))
	return v3
end
function t3.RequestToActivateBattlepass(p1, p2) --[[ RequestToActivateBattlepass | Line: 478 | Upvalues: v5 (copy) ]]
	return v5.GetRemoteFunction("ActivateBattlepassRemote"):InvokeServer(p1, p2)
end
function t3.RequestToDeactivateBattlepass(p1) --[[ RequestToDeactivateBattlepass | Line: 484 | Upvalues: v5 (copy) ]]
	v5.GetRemoteEvent("DeactivateBattlepassRemote"):FireServer(p1)
end
function t3._rotateActiveBattlepasses(p1) --[[ _rotateActiveBattlepasses | Line: 492 | Upvalues: v10 (copy), t3 (copy) ]]
	local t = {}
	for v1, v2 in v10 do
		if p1:IsBattlepassActive(v1) then
			if t3.CanBattlepassBeActivated(v1) then
				p1:_forceActivateBattlepass(v1)
				continue
			end
			p1:DeactivateBattlepass(v1)
			continue
		end
		if v2.ActiveByDefault then
			t[v1] = v2
		end
	end
	for v3, v4 in t do
		p1:ActivateBattlepass(v3, {
			Swap = {
				PreviousOnly = true,
				Category = v4.Category
			}
		})
	end
end
function t3.Init(p1) --[[ Init | Line: 518 | Upvalues: v3 (copy), v10 (copy), t (copy), v9 (copy), v11 (ref), v1 (copy), v8 (copy), t3 (copy), v2 (copy), v5 (copy), v6 (copy), v12 (copy) ]]
	if not v3.IsWrapperInitialising("BattlepassWrapper") then
		warn("\226\154\160\239\184\143 BattlepassService, BattlepassWrapper not found in PlayerWrapperConfig, try adding it to the PlayerWrapperConfig/Shared")
	end
	for v13, v22 in v10 do
		v22.Name = v13
		v22.Category = v22.Category or "Default"
		if not t[v22.Category] then
			t[v22.Category] = {}
		end
		t[v22.Category][v13] = v22
	end
	local t2 = {}
	for v32, v4 in v9.MaxActiveBattlepasses do
		if typeof(v4) == "table" then
			t2[v32] = v4
		end
	end
	v11 = v1.AddSequence("MaxBattlepass", {
		ClaimInOrder = true,
		Tracks = t2,
		Data = function(p1, p2) --[[ Data | Line: 545 ]]
			return p2.PlayerData.BattlepassCapacity
		end
	})
	if v8.IS_SERVER then
		local t4 = {}
		for v52, v62 in v10 do
			for v7, v82 in t3.GetBattlepassSequence(v52).Tracks do
				for v92, v102 in v82.Tiers do
					local v112 = t3.GetSkipTierProductId(v52, v102)
					if v112 then
						local v122 = t4[v112]
						if v122 then
							if v122.ProductCategory ~= "SkipBattlepassTier" then
								warn((("Invalid SkipTierProductId \'%*\' for %* %* %*: Registered under different product category \'%*\'"):format(v112, v52, v7, v92, v122.ProductCategory)))
							end
						else
							t4[v112] = {
								ProductType = "DeveloperProduct",
								ProductCategory = "SkipBattlepassTier",
								Name = ("%*_%*_Tier%*"):format(v52, v7, v92),
								ProductId = v112
							}
						end
					end
					local v13 = t3.GetActivateBattlepassProductId(v52, true)
					if v13 then
						local v14 = t4[v13]
						if v14 then
							if v14.ProductCategory == "ActivateBattlepass" then
								if v14.BattlepassCategory ~= v62.Category then
									warn((("Invalid ActivateBattlepassProductId \'%*\' for %*: Registered under different battlepass category \'%*\'"):format(v13, v52, v14.BattlepassCategory)))
								end
								continue
							end
							warn((("Invalid ActivateBattlepassProductId \'%*\' for %*: Registered under different product category \'%*\'"):format(v13, v52, v14.ProductCategory)))
							continue
						end
						t4[v13] = {
							ProductType = "DeveloperProduct",
							ProductCategory = "ActivateBattlepass",
							Name = ("ActiveBattlepass_%*"):format(v52),
							BattlepassCategory = v62.Category,
							ProductId = v13
						}
					end
				end
			end
		end
		v2.AddPurchasesFromModule(t4)
		v3.bindToPlayers({
			AfterInit = function(p1, p2) --[[ AfterInit | Line: 601 | Upvalues: t3 (ref) ]]
				t3._rotateActiveBattlepasses(p2)
			end
		})
		v5.GetRemoteFunction("ActivateBattlepassRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 606 | Upvalues: v3 (ref) ]]
			local v1 = v3.getWrapperFromPlayer(p1)
			if v1 then
				return v1:PurchaseBattlepassActivation(p2, p3)
			else
				return false
			end
		end
		v5.GetRemoteEvent("DeactivateBattlepassRemote").OnServerEvent:Connect(function(p1, p2) --[[ Line: 614 | Upvalues: v3 (ref) ]]
			local v1 = v3.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			v1:DeactivateBattlepass(p2)
		end)
		v2.AddPurchaseDetailsValidation("SkipBattlepassTier", function(p1, p2, p3) --[[ Line: 621 | Upvalues: t3 (ref) ]]
			local v1 = t3.GetTierToSkip(p1, p3.PassName, p3.TrackName)
			if not v1 then
				return false
			end
			return if p3.Tier.Index == v1.Index and p3.Tier.Sequence == v1.Sequence then p3.Tier.Track == v1.Track else false
		end)
		v2.AddProductPurchasedCallback("SkipBattlepassTier", function(p1, p2, p3) --[[ Line: 632 | Upvalues: t3 (ref) ]]
			local v1 = p1:GetBattlepass(p3.PassName)
			if v1 then
				local _, v2 = t3.GetSkipTierProductId(p3.PassName, p3.Tier)
				v1:SkipTiers(v2)
				return {
					ItemType = p2.Sequence,
					ItemId = p2.Name
				}
			end
		end)
		v2.AddProductPurchasedCallback("ActivateBattlepass", function(p1, p2, p3) --[[ Line: 645 | Upvalues: t3 (ref) ]]
			if t3.GetBattlepassData(p3.PassName) then
				p1:ActivateBattlepass(p3.PassName, p3.CanBattlepassBeActivatedOptions)
				return {
					ItemType = "ActivateBattlepass",
					ItemId = p3.PassName
				}
			end
		end)
	end
	local function canBattlepassChangeState(p1) --[[ canBattlepassChangeState | Line: 658 | Upvalues: t3 (ref) ]]
		local v1 = t3.GetBattlepassData(p1)
		return if v1.StartTime and workspace:GetServerTimeNow() < v1.StartTime then true else v1.EndTime and workspace:GetServerTimeNow() >= v1.EndTime
	end
	local t4 = {}
	for v16, v17 in v10 do
		local v15
		local v18 = t3.GetBattlepassData(v16)
		v15 = if v18.StartTime and workspace:GetServerTimeNow() < v18.StartTime then true else v18.EndTime and (if workspace:GetServerTimeNow() >= v18.EndTime then true else false)
		if v15 then
			t4[v16] = t3.CanBattlepassBeActivated(v16)
		end
	end
	v6.spawnLoop(function() --[[ Line: 671 | Upvalues: t4 (copy), t3 (ref), v12 (ref), v8 (ref), v3 (ref) ]]
		for v2, v32 in t4 do
			local v1
			local v4 = t3.CanBattlepassBeActivated(v2)
			if v4 ~= v32 then
				v12:Fire(v2, not v4)
				local v5 = t3.GetBattlepassData(v2)
				v1 = if v5.StartTime and workspace:GetServerTimeNow() < v5.StartTime then true else v5.EndTime and (if workspace:GetServerTimeNow() >= v5.EndTime then true else false)
				if v1 then
					t4[v2] = v4
				else
					t4[v2] = nil
				end
				if v8.IS_SERVER then
					for v6, v7 in v3.GetPlayers() do
						t3._rotateActiveBattlepasses(v7)
					end
				end
			end
		end
	end, 1)
end
t3:Init()
return t3