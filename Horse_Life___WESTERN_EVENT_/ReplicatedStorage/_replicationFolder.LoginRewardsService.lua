-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("UnlockSequenceService")
local v2 = Sonar("StorageUtils")
local v3 = Sonar("InstanceUtils")
local v4 = Sonar("DataUpdateService", "Server")
local v5 = Sonar("PlayerWrapper")
local v6 = Sonar("MarketplaceService")
local v7 = game:GetService("RunService"):IsServer()
local v8 = v2.Get("LoginRewards")()
local t2 = {}
function t.GetAllLoginRewards() --[[ GetAllLoginRewards | Line: 132 | Upvalues: v8 (copy) ]]
	return v8
end
function t.GetLoginRewardsData(p1) --[[ GetLoginRewardsData | Line: 137 | Upvalues: v8 (copy) ]]
	return v8[p1]
end
function t.GetLoginRewardsSequence(p1) --[[ GetLoginRewardsSequence | Line: 141 | Upvalues: t2 (copy), v8 (copy), v1 (copy) ]]
	if t2[p1] then
		return t2[p1]
	end
	local v12 = v8[p1]
	if not v12 then
		return nil
	end
	local t = {
		ClaimInOrder = true,
		AutoClaim = false,
		Tiers = v12.Tiers,
		Tracks = v12.Tracks,
		Data = function(p12, p2) --[[ Data | Line: 158 | Upvalues: p1 (copy) ]]
			return p2:GetLoginRewardsPlayerData(p1)
		end,
		CanClaim = function(p12, p2, p3) --[[ CanClaim | Line: 162 | Upvalues: v12 (copy), p1 (copy) ]]
			if v12.CanClaim then
				return v12.CanClaim(p12, p2, p3)
			end
			local v1 = p2:GetLoginRewards(p1)
			if not v1 then
				return
			end
			local v2 = v1:CanClaimTime(p2, p3.Tier)
			if v2 == true then
				return true
			else
				return v2
			end
		end,
		OnClaimed = function(p12, p2, p3) --[[ OnClaimed | Line: 179 | Upvalues: p1 (copy), v12 (copy) ]]
			local v1 = p2:GetLoginRewards(p1)
			if not v1 then
				return
			end
			v1:OnClaimed(p2, p3)
			if not v12.OnClaimed then
				return
			end
			v12.OnClaimed(p12, p2, p3, v12)
		end
	}
	local v2 = v1.AddSequence(("LoginRewards_%*"):format(p1), t)
	for v3, v4 in v2.Tracks do
		if v4.Tiers then
			for v5, v6 in v4.Tiers do
				v6.ClaimTime = v6.ClaimTime or v12.DefaultClaimTime
				v6.GracePeriod = v6.GracePeriod or v12.DefaultGracePeriod or v6.ClaimTime
				v6.ProductId = nil
			end
		end
	end
	t2[p1] = v2
	return v2
end
function t.GetRestoreStreakProductId(p1) --[[ GetRestoreStreakProductId | Line: 210 | Upvalues: v8 (copy), v6 (copy) ]]
	local v1 = v8[p1]
	if not v1 then
		return nil
	end
	if typeof(v1.RestoreStreakProductId) == "number" then
		return v1.RestoreStreakProductId
	end
	if typeof(v1.RestoreStreakProductId) == "function" then
		return v1.RestoreStreakProductId(p1)
	end
	if typeof(v1.RestoreStreakProductName) == "string" then
		return v6.GetProductIdFromName(v1.RestoreStreakProductName)
	end
	if v1.RestoreStreak then
		return v6.GetProductIdFromName("RestoreStreak")
	else
		return nil
	end
end
function t.RequestToRestoreStreak(p1) --[[ RequestToRestoreStreak | Line: 229 | Upvalues: v5 (copy), t (copy), v6 (copy) ]]
	local v1 = v5.GetClient()
	local v2 = t.GetRestoreStreakProductId(p1)
	if v2 then
		v6.PromptPurchase(v1.Player, v2, "DeveloperProduct", {
			Sequence = p1
		})
	end
end
function t.Init(p1) --[[ Init | Line: 242 | Upvalues: v5 (copy), v7 (copy), v8 (copy), t (copy), v6 (copy), v4 (copy), v3 (copy) ]]
	if not v5.IsWrapperInitialising("LoginRewardsWrapper") then
		warn("\226\154\160\239\184\143 LoginRewardsService, LoginRewardsWrapper not found in PlayerWrapperConfig, try adding it to the PlayerWrapperConfig/Shared")
	end
	if not v7 then
		return
	end
	local t2 = {}
	for v1, v2 in v8 do
		local v32 = t.GetRestoreStreakProductId(v1)
		if v32 then
			local v42 = v6.GetPurchaseFromId(v32)
			if v42 then
				if v6.HasProductPurchasedCallback(v32) and v42.ProductCategory ~= "LoginRewardsRestoreStreak" then
					warn("\226\154\160\239\184\143 LoginRewards, Product already has a purchased callback", v32, v42)
				end
				continue
			end
			t2[v32] = {
				ProductType = "DeveloperProduct",
				ProductCategory = "LoginRewardsRestoreStreak",
				Name = p1.Name .. "_RestoreStreak",
				ProductId = v32
			}
		end
	end
	v6.AddPurchasesFromModule(t2)
	v4.AddRigDataCallback(function(p1) --[[ Line: 273 | Upvalues: v3 (ref) ]]
		if p1:FindFirstChild("LoginRewards") then
			return
		end
		v3.Create("Folder", {
			Name = "LoginRewards",
			Parent = p1
		})
	end)
	v6.AddPurchaseDetailsValidation("LoginRewardsRestoreStreak", function(p1, p2, p3) --[[ Line: 283 ]]
		local v1 = p1:GetLoginRewards(p3.Sequence)
		if v1 then
			return v1:CanRestoreStreak(p1) and true or false
		else
			warn("\226\154\160\239\184\143 LoginRewardsService, Sequence not found for restore streak purchase:", p3.Sequence)
			return false
		end
	end)
	v6.AddProductPurchasedCallback("LoginRewardsRestoreStreak", function(p1, p2, p3) --[[ Line: 298 ]]
		local v1 = p1:GetLoginRewards(p3.Sequence)
		if not v1 then
			warn("\226\154\160\239\184\143 LoginRewardsService, Sequence not found for restore streak purchase:", p3.Sequence)
			return
		end
		local v2, v3 = v1:RestoreStreak()
		if v2 then
			return {
				ItemType = "LoginRewardsRestoreStreak",
				ItemId = p3.Sequence
			}
		else
			warn("\226\154\160\239\184\143 LoginRewardsService, Failed to restore streak:", v3)
		end
	end)
end
t:Init()
return t