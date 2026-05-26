-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ModDashboardLoader = require(ReplicatedStorage.ModDashboardLoader)
local v1 = ModDashboardLoader("QueryPresets")
local v2 = ModDashboardLoader("FormatPresets")
return {
	GameId = 6,
	StudioMode = RunService:IsStudio(),
	CanUse = function(p1) --[[ CanUse | Line: 16 ]]
		return true
	end,
	KeyCode = Enum.KeyCode.F3,
	Stats = {},
	Tabs = {
		TradeLogs = {
			MarkerName = "TradeCompleted",
			LogEvent = function(p1, p2, p3, p4) --[[ LogEvent | Line: 29 | Upvalues: v1 (copy) ]]
				return v1.PlayerTransaction(p1, p2, p3, p4)
			end,
			Query = function(p1, p2) --[[ Query | Line: 33 | Upvalues: v1 (copy) ]]
				return v1.QueryPlayerTransactions(p1, p2)
			end,
			Processor = v1.ParsePlayerTransaction,
			Formatter = v2.PlayerTransaction
		},
		AuctionLogs = {
			MarkerName = "AuctionCompleted",
			LogEvent = function(p1, p2, p3, p4, p5) --[[ LogEvent | Line: 43 | Upvalues: v1 (copy) ]]
				local v12 = v1.PlayerTransaction(p1, p2, p3, p4)
				v12.wasAutoBuy = p5
				return v12
			end,
			Query = function(p1, p2) --[[ Query | Line: 49 | Upvalues: v1 (copy) ]]
				return v1.QueryPlayerTransactions(p1, p2)
			end,
			Processor = function(p1) --[[ Processor | Line: 53 ]]
				return {
					wasAutoBuy = p1.arguments.wasAutoBuy,
					player1Id = p1.arguments.player1Id,
					player2Id = p1.arguments.player2Id,
					player1Items = p1.arguments.player1Items,
					player2Items = p1.arguments.player2Items
				}
			end,
			Formatter = function(p1) --[[ Formatter | Line: 63 | Upvalues: v2 (copy) ]]
				local format = string.format
				local v22 = if p1.wasAutoBuy then "Yes" else "No"
				return table.concat({ format("Was Auto Buy: %s", v22), (v2.PlayerTransaction(p1)) }, "\n")
			end
		},
		StallLogs = {
			MarkerName = "StallCompleted",
			LogEvent = function(p1, p2, p3, p4) --[[ LogEvent | Line: 72 | Upvalues: v1 (copy) ]]
				return v1.PlayerTransaction(p1, p2, p3, p4)
			end,
			Query = function(p1, p2) --[[ Query | Line: 76 | Upvalues: v1 (copy) ]]
				return v1.QueryPlayerTransactions(p1, p2)
			end,
			Processor = v1.ParsePlayerTransaction,
			Formatter = v2.PlayerTransaction
		}
	},
	Actions = {}
}