-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ModDashboardLoader = require(ReplicatedStorage.ModDashboardLoader)
local v1 = ModDashboardLoader("FormatNumber")
local v2 = ModDashboardLoader("PlayerUtils")
local v3 = ModDashboardLoader("EventUtils")
local v4 = ModDashboardLoader("FormatDate")
function t.PlayerTransaction(p1) --[[ Line: 13 | Upvalues: v2 (copy), v1 (copy) ]]
	local v12 = p1.logKind or "trade"
	local player1Id = p1.player1Id
	local player2Id = p1.player2Id
	local player1Items = p1.player1Items
	local player2Items = p1.player2Items
	local v22 = v2.GetUserNameFromUserId(player1Id)
	local v3 = v2.GetUserNameFromUserId(player2Id)
	local v4 = "Items given in trade"
	local v5 = "Items given in trade"
	if v12 == "stall" then
		v5 = "Items received (sale payment)"
		v4 = "Items received (stall purchase)"
	elseif v12 == "auction" then
		v5 = "Items received (sale payment)"
		v4 = "Items received (auction win)"
	end
	local function itemEntryString(p1) --[[ itemEntryString | Line: 34 | Upvalues: v1 (ref) ]]
		local v12 = string.format("- %s (x%s)", tostring(p1.ItemName), v1.splice(p1.Amount))
		local t = {}
		for v2, v3 in p1 do
			if v2 ~= "ItemName" and v2 ~= "Amount" then
				local format_2 = string.format
				local v4 = tostring(v2)
				table.insert(t, format_2("%s=%s", v4, (tostring(v3))))
			end
		end
		if #t > 0 then
			v12 = v12 .. " [" .. table.concat(t, ", ") .. "]"
		end
		return v12
	end
	local t = {}
	if #player1Items > 0 then
		for v6, v7 in player1Items do
			table.insert(t, (itemEntryString(v7)))
		end
	else
		table.insert(t, "- None")
	end
	local v9 = table.concat(t, "\n")
	local t2 = {}
	if #player2Items > 0 then
		for v10, v11 in player2Items do
			table.insert(t2, (itemEntryString(v11)))
		end
	else
		table.insert(t2, "- None")
	end
	local v13 = table.concat(t2, "\n")
	local t3 = {}
	table.insert(t3, (("%* (%*) - %*:"):format(v22, player1Id, v4)))
	table.insert(t3, v9)
	table.insert(t3, string.rep("=", 30))
	table.insert(t3, (("%* (%*) - %*:"):format(v3, player2Id, v5)))
	table.insert(t3, v13)
	return table.concat(t3, "\n")
end
function t.Timestamp(p1) --[[ Line: 81 | Upvalues: v3 (copy), v4 (copy) ]]
	return v3.safeCallNoWarn(function() --[[ Line: 82 | Upvalues: p1 (copy), v4 (ref) ]]
		local v1, v2, v3, v42, v5, v6 = string.match(p1, "(%d%d%d%d)%-(%d%d)%-(%d%d) (%d%d):(%d%d):(%d%d)")
		if v1 and (v2 and (v3 and (v42 and (v5 and v6)))) then
			return v4.GetFormattedTime("F d, Y g:i A", (os.time({
				isdst = false,
				year = tonumber(v1),
				month = tonumber(v2),
				day = tonumber(v3),
				hour = tonumber(v42),
				min = tonumber(v5),
				sec = tonumber(v6)
			}))) .. " UTC"
		else
			return "Invalid timestamp format"
		end
	end) or "Invalid timestamp format"
end
return t