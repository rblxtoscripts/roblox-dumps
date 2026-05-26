-- https://lua.expert/
local Players = game:GetService("Players")
local v1 = game:GetService("DataStoreService"):GetDataStore("TradeLock-Live"):GetAsync("1")
require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local function returnDate(p1) --[[ returnDate | Line: 15 ]]
	local v1 = os.date("!*t", p1)
	return ("%02i"):format(v1.month) .. "/" .. ("%02i"):format(v1.day) .. "/" .. v1.year
end
return function(p1, p2) --[[ Line: 22 | Upvalues: Players (copy), v1 (copy) ]]
	local v12 = Players:GetUserIdFromNameAsync(p2)
	if not v12 then
		return p2 .. " does not exist?"
	end
	local v2 = v1[tostring(v12)]
	if not v2 then
		return p2 .. " is not tradelocked"
	end
	if v2 == -1 then
		return p2 .. " is permanently tradelocked"
	end
	if v2 <= os.time() then
		local v3 = os.date("!*t", v2)
		return p2 .. " was tradelocked until " .. ("%02i"):format(v3.month) .. "/" .. ("%02i"):format(v3.day) .. "/" .. v3.year
	end
	if os.time() <= v2 then
		local v4 = os.date("!*t", v2)
		return p2 .. " is tradelocked until " .. ("%02i"):format(v4.month) .. "/" .. ("%02i"):format(v4.day) .. "/" .. v4.year
	else
		return p2 .. " is not tradelocked"
	end
end