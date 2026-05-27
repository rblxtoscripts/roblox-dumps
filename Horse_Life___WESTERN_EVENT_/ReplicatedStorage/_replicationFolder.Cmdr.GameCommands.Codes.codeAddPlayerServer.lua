-- https://lua.expert/
local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("CodesService")
return function(p1, p2, p3) --[[ Line: 15 | Upvalues: v1 (copy), DataStoreService (copy), Players (copy) ]]
	local v12 = v1.CodeApprovalsQueue()
	local v2 = string.lower(p2)
	print("Code " .. v2 .. " had UserId " .. p3 .. " added by " .. p1.Executor.Name)
	if not v12[v2].Player then
		v12[v2].Player = {}
	end
	local v3 = v2
	if table.find(v12[v3].Player, p3) then
		return "Code " .. v3 .. " already has " .. p3 .. " in it?"
	else
		table.insert(v12[v3].Player, p3)
		DataStoreService:GetDataStore("codes/approvals"):SetAsync("1", v12)
		return "UserId: " .. p3 .. " / Username: " .. Players:GetNameFromUserIdAsync(p3) .. " was added to code " .. v3
	end
end