-- https://lua.expert/
local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("CodesService")
return function(p1, p2, p3) --[[ Line: 15 | Upvalues: v1 (copy), DataStoreService (copy), Players (copy) ]]
	local v12 = v1.CodeApprovalsQueue()
	local v2 = string.lower(p2)
	if not v12[v2] then
		return v2 .. " does not exist."
	end
	if not v12[v2].Player then
		return v2 .. " does not have any players in it."
	end
	print("Code " .. v2 .. " had userId " .. p3 .. " removed by " .. p1.Executor.Name)
	local _ = table.find(v12[v2].Player, p3) == nil
	table.remove(v12[v2].Player, table.find(v12[v2].Player, p3))
	if not next(v12[v2].Player) then
		v12[v2].Player = nil
	end
	DataStoreService:GetDataStore("codes/approvals"):SetAsync("1", v12)
	return "UserId: " .. p3 .. " / Username: " .. Players:GetNameFromUserIdAsync(p3) .. " was removed from " .. v2
end