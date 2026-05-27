-- https://lua.expert/
local DataStoreService = game:GetService("DataStoreService")
local Players = game:GetService("Players")
require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = DataStoreService:GetDataStore("PlayerData")
return function(p1, p2, p3) --[[ Line: 11 | Upvalues: Players (copy), v1 (copy) ]]
	local v12 = Players:GetPlayerByUserId((tonumber(p2)))
	if v12 then
		v12:Kick("Your data is being modified. Please wait at least 2 minutes then rejoin.")
		p1:Reply("Kicked player.. waiting 5 seconds before attempting rollback")
		task.wait(5)
	end
	p1:Reply("Attempting rollback back " .. p2 .. " to " .. p3)
	local v2 = "keys/alpha1" .. tostring(p2)
	local v3 = p3 * 1000
	local v4, v5 = pcall(function() --[[ Line: 29 | Upvalues: v1 (ref), v2 (copy), v3 (copy) ]]
		return v1:ListVersionsAsync(v2, Enum.SortDirection.Descending, nil, v3)
	end)
	if not v4 then
		return "Unknown error occured, data was not rolled back"
	end
	local v6 = v5:GetCurrentPage()
	if not (#v6 > 0) then
		return "No versions found for timestamp " .. p3
	end
	local v7 = v6[1]
	local v8, v9, v10 = pcall(function() --[[ Line: 38 | Upvalues: v1 (ref), v2 (copy), v7 (copy) ]]
		return v1:GetVersionAsync(v2, v7.Version)
	end)
	if v8 then
		local DataStoreSetOptions = Instance.new("DataStoreSetOptions")
		DataStoreSetOptions:SetMetadata(v10:GetMetadata())
		v1:SetAsync(v2, v9, nil, DataStoreSetOptions)
		return "SUCCESS: Rolled back " .. p2 .. " to " .. DateTime.fromUnixTimestampMillis(v7.CreatedTime):ToIsoDate()
	else
		return "Unknown error occured, data was not rolled back"
	end
end