-- https://lua.expert/
local DataStoreService = game:GetService("DataStoreService")
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("CodesService")
local function tableToString(p1) --[[ tableToString | Line: 14 ]]
	local v1 = ""
	for v2, v3 in p1 do
		v1 = if type(v3) == "boolean" then v1 .. tostring(v3) .. ", " else v1 .. v3 .. ", "
	end
	return v1:gsub(",%s*$", "")
end
local function dictionaryToString(p1) --[[ dictionaryToString | Line: 26 ]]
	local v1 = ""
	for v2, v3 in p1 do
		v1 = if type(v3) == "boolean" then v1 .. tostring(v3) .. ", " else v1 .. v3 .. ", "
	end
	return v1:gsub(",%s*$", "")
end
local function returnDate(p1) --[[ returnDate | Line: 38 ]]
	local v1 = os.date("!*t", p1)
	return ("%02i"):format(v1.month) .. "/" .. ("%02i"):format(v1.day) .. "/" .. v1.year
end
return function(p1, p2) --[[ Line: 45 | Upvalues: v1 (copy), DataStoreService (copy), dictionaryToString (copy), tableToString (copy) ]]
	local v12 = string.lower(p2)
	local v2 = v1.CodeApprovalsQueue()
	local v3 = DataStoreService:GetDataStore("codes/live"):GetAsync(v12)
	local v4 = "Code does not exist?"
	if v2[v12] == nil then
		if v3 ~= nil then
			local v5 = os.date("!*t", v3.Expire)
			local v6 = ("%02i"):format(v5.month) .. "/" .. ("%02i"):format(v5.day) .. "/" .. v5.year
			local v7 = if v3.Expire <= os.time() then "Live Code " .. v12 .. " expired at " .. v6 else "Code " .. v12 .. " is a live code expiring at " .. v6
			local v8 = ""
			for v9, v10 in v3 do
				if v9 == "Expire" then
					local v122 = os.date("!*t", os.time() + v10)
					v8 = v8 .. "Expire: " .. (("%02i"):format(v122.month) .. "/" .. ("%02i"):format(v122.day) .. "/" .. v122.year) .. "\n"
					continue
				end
				v8 = if v9 == "Reward" then v8 .. "Reward: " .. dictionaryToString(v10) .. "\n" elseif v9 == "Player" then v8 .. "PlayerIds: " .. tableToString(v10) .. "\n" elseif v9 == "SingleTimeRedeem" then v8 .. "SingleRedeemOnly: " .. dictionaryToString(v10) .. "\n" else v8 .. "OnlyClaimableByRole: " .. v9 .. "\n"
			end
			v4 = v7 .. "\n" .. v8
		end
		return v4
	else
		local v13 = ""
		for v15, v16 in v2[v12] do
			if v15 == "Expire" then
				local v18 = os.date("!*t", os.time() + v16)
				v13 = v13 .. "Expire: " .. (("%02i"):format(v18.month) .. "/" .. ("%02i"):format(v18.day) .. "/" .. v18.year) .. "\n"
				continue
			end
			v13 = if v15 == "Reward" then v13 .. "Reward: " .. dictionaryToString(v16) .. "\n" elseif v15 == "Player" then v13 .. "PlayerIds: " .. tableToString(v16) .. "\n" elseif v15 == "SingleTimeRedeem" then v13 .. "SingleRedeemOnly: " .. dictionaryToString(v16) .. "\n" else v13 .. "OnlyClaimableByRole: " .. v15 .. "\n"
		end
		return ("Code " .. v12 .. " needs approval") .. "\n" .. v13
	end
end