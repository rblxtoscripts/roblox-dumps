-- https://lua.expert/
local DataStoreService = game:GetService("DataStoreService")
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("CodesService")
return function(p1, p2, p3) --[[ Line: 14 | Upvalues: v1 (copy), DataStoreService (copy) ]]
	local v12 = v1.CodeApprovalsQueue()
	local v2 = string.lower(p2)
	print("Code " .. v2 .. " had item " .. p3 .. " reward removed by " .. p1.Executor.Name)
	if v12[v2].Reward[p3] then
		v12[v2].Reward[p3] = nil
		DataStoreService:GetDataStore("codes/approvals"):SetAsync("1", v12)
		return "Item " .. p3 .. " reward was removed from code " .. v2
	else
		return "Code " .. v2 .. " does not have " .. p3 .. " reward in it?"
	end
end