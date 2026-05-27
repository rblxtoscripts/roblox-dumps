-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
require(ReplicatedStorage.ModDashboardLoader)
t.AllTime = {
	step = "quarter",
	timezone = "America/Los_Angeles",
	relative = {
		step = "year",
		value = 10,
		offset = {
			value = 0,
			step = "year"
		}
	}
}
function t.UserFilter(p1) --[[ UserFilter | Line: 23 ]]
	return {
		data = {
			type = "direct",
			name = "user_id",
			dataType = "string",
			condition = {
				string = {
					operation = "Is",
					value = { (tostring(p1)) }
				}
			}
		}
	}
end
function t.SumStat(p1, p2, p3) --[[ SumStat | Line: 41 | Upvalues: t (copy), HttpService (copy) ]]
	return {
		options = {
			display = "metric"
		},
		report = {
			queryType = "insight",
			time = t.AllTime,
			metrics = {
				{
					visible = true,
					id = HttpService:GenerateGUID(false),
					data = {
						type = "event",
						name = p1,
						measurement = {
							math = {
								["function"] = "sum"
							},
							column = {
								dataType = "number",
								type = "argument",
								name = p2,
								dataTypes = { "number" },
								fullName = p2
							}
						}
					}
				}
			},
			filters = { t.UserFilter(p3) },
			breakdowns = {}
		}
	}
end
function t.SumStatProcessor(p1) --[[ SumStatProcessor | Line: 79 ]]
	return p1.series[next(p1.series)].value.value
end
function t.PlayerTransaction(p1, p2, p3, p4) --[[ PlayerTransaction | Line: 84 ]]
	return {
		player1Id = p1,
		player2Id = p2,
		player1Items = p3,
		player2Items = p4
	}
end
function t.FieldMatches(p1, p2) --[[ FieldMatches | Line: 93 ]]
	return {
		data = {
			type = "argument",
			dataType = "number",
			name = p1,
			condition = {
				numeric = {
					operation = "Equal",
					value = { p2 }
				}
			}
		}
	}
end
function t.QueryPlayerTransactions(p1, p2) --[[ QueryPlayerTransactions | Line: 109 | Upvalues: t (copy) ]]
	return {
		filterJoinType = "or",
		timeFilter = t.AllTime,
		filters = { t.FieldMatches("player1Id", p2), t.FieldMatches("player2Id", p2) }
	}, {
		pageSize = 250,
		pageNumber = 1,
		markerType = p1
	}
end
function t.ParsePlayerTransaction(p1) --[[ ParsePlayerTransaction | Line: 128 ]]
	return {
		player1Id = p1.arguments.player1Id,
		player2Id = p1.arguments.player2Id,
		player1Items = p1.arguments.player1Items,
		player2Items = p1.arguments.player2Items
	}
end
return t