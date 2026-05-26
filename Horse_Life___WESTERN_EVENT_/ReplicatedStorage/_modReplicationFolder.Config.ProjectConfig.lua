-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ModDashboardLoader = require(ReplicatedStorage.ModDashboardLoader)
local v1 = ModDashboardLoader("QueryPresets")
local v2 = ModDashboardLoader("FormatPresets")
local v3 = ModDashboardLoader("FormatNumber")
local v4 = ModDashboardLoader(ReplicatedStorage.Sonar)
local v5 = v4("PlayerUtils")
local v6 = v4("PlayerWrapper")
local v7 = v4("TradeLockService", {
	Deferred = true
})
local v8 = v4("BanService", {
	Deferred = true
})
local v9 = v4("TimeUtils")
return {
	GameId = 85,
	StudioMode = RunService:IsStudio(),
	CanUse = function(p1) --[[ CanUse | Line: 24 | Upvalues: v6 (copy), v5 (copy) ]]
		local v1 = v6.getWrapperWithYield(p1)
		if v1 then
			return v5.CanRunCommand(v1, "Staff")
		else
			return false
		end
	end,
	KeyCode = Enum.KeyCode.F3,
	Stats = {
		IsTradeLocked = {
			Default = "Not Locked",
			Get = function(p1) --[[ Get | Line: 37 | Upvalues: v7 (copy) ]]
				local _, v1 = v7.IsLocked(p1)
				return v1
			end,
			Formatter = function(p1) --[[ Formatter | Line: 42 | Upvalues: v9 (copy) ]]
				if p1 == -1 or p1 == true then
					return "Permanent"
				end
				if p1 then
					return v9.FormatString((math.round(p1 - workspace:GetServerTimeNow())))
				else
					return "Not Locked"
				end
			end
		},
		IsBanned = {
			Default = "Not Banned",
			Get = function(p1) --[[ Get | Line: 56 | Upvalues: v8 (copy) ]]
				local v1, v2 = v8.IsAPIBanned(p1)
				if v1 then
					return v2
				else
					local _, v3 = v8.IsBanned(p1)
					return v3
				end
			end,
			Formatter = function(p1) --[[ Formatter | Line: 66 | Upvalues: v9 (copy) ]]
				if p1 == -1 or p1 == true then
					return "Permanent"
				end
				if p1 then
					return v9.FormatString((math.round(p1 - workspace:GetServerTimeNow())))
				else
					return "Not Banned"
				end
			end
		},
		TotalCoins = {
			Default = "Not in server",
			Get = function(p1) --[[ Get | Line: 80 | Upvalues: v6 (copy) ]]
				local v1 = v6.getWrapperFromUserId(p1)
				if not (v1 and v1.PlayerData) then
					return nil
				end
				local Currency = v1.PlayerData:FindFirstChild("Currency")
				if not Currency then
					return nil
				end
				local Coins = Currency:FindFirstChild("Coins")
				if Coins and Coins:IsA("ValueBase") then
					return Coins.Value
				else
					return nil
				end
			end,
			Formatter = function(p1) --[[ Formatter | Line: 96 | Upvalues: v3 (copy) ]]
				if type(p1) == "number" then
					return v3.splice(p1)
				else
					return tostring(p1)
				end
			end
		}
	},
	Tabs = {
		TradeLogs = {
			MarkerName = "TradeCompleted",
			LogEvent = function(p1, p2, p3, p4) --[[ LogEvent | Line: 110 | Upvalues: v1 (copy) ]]
				return v1.PlayerTransaction(p1, p2, p3, p4)
			end,
			Query = function(p1, p2) --[[ Query | Line: 114 | Upvalues: v1 (copy) ]]
				return v1.QueryPlayerTransactions(p1, p2)
			end,
			Processor = v1.ParsePlayerTransaction,
			Formatter = function(p1) --[[ Formatter | Line: 120 | Upvalues: v2 (copy) ]]
				local v1 = table.clone(p1)
				v1.logKind = "trade"
				return v2.PlayerTransaction(v1)
			end
		},
		AuctionLogs = {
			MarkerName = "AuctionCompleted",
			LogEvent = function(p1, p2, p3, p4) --[[ LogEvent | Line: 128 | Upvalues: v1 (copy) ]]
				return v1.PlayerTransaction(p1, p2, p3, p4)
			end,
			Query = function(p1, p2) --[[ Query | Line: 133 | Upvalues: v1 (copy) ]]
				return v1.QueryPlayerTransactions(p1, p2)
			end,
			Processor = function(p1) --[[ Processor | Line: 137 ]]
				return {
					player1Id = p1.arguments.player1Id,
					player2Id = p1.arguments.player2Id,
					player1Items = p1.arguments.player1Items,
					player2Items = p1.arguments.player2Items
				}
			end,
			Formatter = function(p1) --[[ Formatter | Line: 146 | Upvalues: v2 (copy) ]]
				local v1 = table.clone(p1)
				v1.logKind = "auction"
				return v2.PlayerTransaction(v1)
			end
		},
		StallLogs = {
			MarkerName = "StallCompleted",
			LogEvent = function(p1, p2, p3, p4) --[[ LogEvent | Line: 154 | Upvalues: v1 (copy) ]]
				return v1.PlayerTransaction(p1, p2, p3, p4)
			end,
			Query = function(p1, p2) --[[ Query | Line: 158 | Upvalues: v1 (copy) ]]
				return v1.QueryPlayerTransactions(p1, p2)
			end,
			Processor = v1.ParsePlayerTransaction,
			Formatter = function(p1) --[[ Formatter | Line: 164 | Upvalues: v2 (copy) ]]
				local v1 = table.clone(p1)
				v1.logKind = "stall"
				return v2.PlayerTransaction(v1)
			end
		}
	},
	Actions = {}
}