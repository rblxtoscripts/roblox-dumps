-- https://lua.expert/
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local DataStoreService = game:GetService("DataStoreService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("DataCompression")
local v2 = Sonar("DataService")
local v3 = RunService:IsStudio()
local v4 = v2.new("PlayerData")
return function(p1, p2) --[[ Line: 17 | Upvalues: DataStoreService (copy), TeleportService (copy), v3 (copy), v4 (copy), HttpService (copy), v1 (copy) ]]
	local v12 = DataStoreService:GetDataStore("currency/remove/approvals")
	local v2 = v12:GetAsync("Queue") or {}
	local v32 = v2[tostring(p2)]
	if not v32 then
		return "No queued currency removal for userId " .. p2
	end
	local v42, _ = pcall(function() --[[ Line: 29 | Upvalues: TeleportService (ref), p2 (copy) ]]
		return TeleportService:GetPlayerPlaceInstanceAsync(p2)
	end)
	if v42 and not v3 then
		return "Player with userId " .. p2 .. " is currently online; cannot approve offline removal"
	end
	local v5 = v4:GetKeyFromUserId((tostring(p2)))
	local v6 = v4:GetAsync(v5)
	if not v6 then
		return "Failed to get player data"
	end
	local v7, v8 = pcall(function() --[[ Line: 42 | Upvalues: HttpService (ref), v6 (copy) ]]
		return HttpService:JSONDecode(v6)
	end)
	if not v7 then
		return "Failed to decode player data"
	end
	local SerializedData = v8.SerializedData
	if not (SerializedData and SerializedData.CH) then
		return "Invalid player data"
	end
	local v9 = nil
	for v10, v11 in SerializedData.CH do
		if v1.CodeToName(v11.N or v11.Name) == "Currency" then
			v9 = v11
			break
		end
	end
	if not (v9 and v9.CH) then
		return "Failed to retrieve currency data"
	end
	local v13 = nil
	for v14, v15 in v9.CH do
		if v1.CodeToName(v15.N or v15.Name) == "Coins" then
			v13 = v15
			break
		end
	end
	if not v13 then
		return "Player does not have Coins currency data"
	end
	local v17 = v13.V or (v13.Value or 0)
	local v18 = math.min(v17, v32.Amount)
	local v19 = v17 - v18
	if v13.V == nil then
		v13.Value = v19
	else
		v13.V = v19
	end
	local v20, v21 = pcall(function() --[[ Line: 92 | Upvalues: HttpService (ref), v8 (copy) ]]
		return HttpService:JSONEncode(v8)
	end)
	if not v20 then
		return "Failed to encode player data"
	end
	local v22, v23 = pcall(function() --[[ Line: 99 | Upvalues: v4 (ref), v5 (copy), v21 (copy) ]]
		return v4:SetAsync(v5, v21)
	end)
	if v22 then
		v2[tostring(p2)] = nil
		v12:SetAsync("Queue", v2)
		return "Removed " .. v18 .. " Coins from userId " .. p2
	else
		return v23 or "Failed to save updated player data"
	end
end