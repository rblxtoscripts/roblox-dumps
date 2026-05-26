-- https://lua.expert/
local HttpService = game:GetService("HttpService")
local DataStoreService = game:GetService("DataStoreService")
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("Table")
function countDict(p1) --[[ countDict | Line: 15 ]]
	local count = 0
	for v1 in p1 do
		count = count + 1
	end
	return count
end
function tableToDictionaryAdjust(p1) --[[ tableToDictionaryAdjust | Line: 23 ]]
	local t = {}
	for v1, v2 in p1 do
		t[tostring(v2)] = -1
	end
	return t
end
return function(p1, p2) --[[ Line: 33 | Upvalues: HttpService (copy), DataStoreService (copy), v1 (copy) ]]
	local v12 = HttpService:JSONDecode(p2)
	if #v12 == 0 then
		return "Something went wrong, Table entries are 0"
	else
		local v3 = v1.Merge(DataStoreService:GetDataStore("TradeLock-Live"):GetAsync("1"), tableToDictionaryAdjust(v12))
		DataStoreService:GetDataStore("TradeLock-Live"):SetAsync("1", v3)
		return "Ran mass tradelock, current tradelocked users: " .. countDict(v3)
	end
end