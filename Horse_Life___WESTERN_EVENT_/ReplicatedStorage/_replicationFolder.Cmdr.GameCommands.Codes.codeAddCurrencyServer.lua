-- https://lua.expert/
local DataStoreService = game:GetService("DataStoreService")
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("CodesService")
return function(p1, p2, p3, p4) --[[ Line: 14 | Upvalues: v1 (copy), DataStoreService (copy) ]]
	if p4 <= 0 then
		return "Cannot add 0 or negative amounts!"
	end
	local v12 = v1.CodeApprovalsQueue()
	local v2 = string.lower(p2)
	print("Code " .. v2 .. " had item " .. p3 .. " " .. p4 .. " added by " .. p1.Executor.Name)
	if v12[v2].Reward[p3] then
		return "Code " .. v2 .. " already has " .. p3 .. " in it?"
	else
		v12[v2].Reward[p3] = p4
		DataStoreService:GetDataStore("codes/approvals"):SetAsync("1", v12)
		return "Item " .. p3 .. " " .. p4 .. " was added to code " .. v2
	end
end