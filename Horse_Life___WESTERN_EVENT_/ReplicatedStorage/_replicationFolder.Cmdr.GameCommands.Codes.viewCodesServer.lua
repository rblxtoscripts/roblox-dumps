-- https://lua.expert/
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("CodesService")
return function() --[[ Line: 11 | Upvalues: v1 (copy) ]]
	local v12 = v1.CodeApprovalsQueue()
	local function tableToString(p1) --[[ tableToString | Line: 17 ]]
		local v1 = ""
		for v2, v3 in p1 do
			v1 = if type(v3) == "boolean" then v1 .. tostring(v3) .. ", " else v1 .. v3 .. ", "
		end
		return v1:gsub(",%s*$", "")
	end
	local function dictionaryToString(p1) --[[ dictionaryToString | Line: 29 ]]
		local v1 = ""
		for v2, v3 in p1 do
			if typeof(v3) == "table" then
				local v4 = v1 .. v2 .. " ["
				for k, v in pairs(v3) do
					if typeof(v) == "boolean" then
						v = if v then "true" else "false"
					end
					v4 = v4 .. k .. ": " .. v .. ", "
				end
				v1 = v4 .. "] "
				continue
			end
			v1 = if type(v3) == "boolean" then v1 .. tostring(v3) .. ", " else v1 .. v2 .. ": " .. v3 .. ", "
		end
		return v1:gsub(",%s*$", "")
	end
	local function returnDate(p1) --[[ returnDate | Line: 50 ]]
		local v1 = os.date("!*t", p1)
		return ("%02i"):format(v1.month) .. "/" .. ("%02i"):format(v1.day) .. "/" .. v1.year
	end
	local v2 = ""
	for v3, v4 in v12 do
		local v5 = v2 .. "Code: " .. v3 .. "\n"
		for v6, v7 in v4 do
			if v6 == "Expire" then
				local v9 = os.date("!*t", os.time() + v7)
				v5 = v5 .. "Expire: " .. (("%02i"):format(v9.month) .. "/" .. ("%02i"):format(v9.day) .. "/" .. v9.year) .. "\n"
				continue
			end
			v5 = if v6 == "Reward" then v5 .. "Reward: " .. dictionaryToString(v7) .. "\n" elseif v6 == "Player" then v5 .. "PlayerIds: " .. tableToString(v7) .. "\n" elseif v6 == "SingleTimeRedeem" then v5 .. "SingleRedeemOnly: " .. dictionaryToString(v7) .. "\n" else v5 .. "OnlyClaimableByRole: " .. v6 .. "\n"
		end
		v2 = v5 .. "-------------------\n"
	end
	if v2 == "" then
		return "There are no codes in the approval queue"
	else
		return v2
	end
end