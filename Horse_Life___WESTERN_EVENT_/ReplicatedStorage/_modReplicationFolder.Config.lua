-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("HttpService")
local RunService = game:GetService("RunService")
game:GetService("Players")
local ModDashboardLoader = require(ReplicatedStorage.ModDashboardLoader)
local v1 = ModDashboardLoader("QueryPresets")
local v2 = ModDashboardLoader("FormatNumber")
local v3 = ModDashboardLoader("TimeUtils")
local v4 = ModDashboardLoader("QueryBuilder", {
	Deferred = true
})
local v5 = ModDashboardLoader(script:WaitForChild("ProjectConfig"))
local function runValidation() --[[ runValidation | Line: 19 | Upvalues: v5 (copy) ]]
	if not v5.GameId then
		error("ProjectConfig.GameId is required")
	end
	if v5.CanUse then
		return
	end
	error("ProjectConfig.CanUse is required")
end
if not v5.GameId then
	error("ProjectConfig.GameId is required")
end
if not v5.CanUse then
	error("ProjectConfig.CanUse is required")
end
local t = {
	AuthorizationToken = nil,
	GamebeastModule = nil,
	GameId = v5.GameId
}
t.StudioMode = v5.StudioMode or RunService:IsStudio()
t.CanUse = v5.CanUse
t.KeyCode = v5.KeyCode or Enum.KeyCode.F3
t.Stats = {
	RobuxSpent = {
		LayoutOrder = 1,
		Default = 0,
		Get = function(p1) --[[ Get | Line: 44 | Upvalues: v1 (copy), v4 (copy) ]]
			return v1.SumStatProcessor((v4.SendRequest(v1.SumStat("Purchase", "price", p1), "Base")))
		end,
		Formatter = function(p1) --[[ Formatter | Line: 51 | Upvalues: v2 (copy) ]]
			return v2.splice(p1)
		end
	},
	TimePlayed = {
		LayoutOrder = 2,
		Default = 0,
		Get = function(p1) --[[ Get | Line: 60 | Upvalues: v1 (copy), v4 (copy) ]]
			return v1.SumStatProcessor((v4.SendRequest(v1.SumStat("Logout", "sessionLength", p1), "Base")))
		end,
		Formatter = function(p1) --[[ Formatter | Line: 67 | Upvalues: v3 (copy) ]]
			return v3.ExtendedFormatHMS(p1)
		end
	}
}
t.Tabs = {}
t.Actions = {
	Ban = {
		Run = function(p1) --[[ Run | Line: 80 ]]
			print(p1 .. " banned")
		end
	},
	Unban = {
		Run = function(p1) --[[ Run | Line: 85 ]]
			print(p1 .. " unbanned")
		end
	},
	Tradelock = {
		Run = function(p1) --[[ Run | Line: 90 ]]
			print(p1 .. " trade locked")
		end
	}
}
local v9 = t
for v10, v11 in v5.Stats or {} do
	v9.Stats[v10] = v11
end
for v13, v14 in v5.Tabs or {} do
	v9.Tabs[v13] = v14
end
for v16, v17 in v5.Actions or {} do
	v9.Actions[v16] = v17
end
return v9