-- https://lua.expert/
local DataStoreService = game:GetService("DataStoreService")
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("CodesService")
return function(p1, p2, p3) --[[ Line: 8 | Upvalues: v1 (copy), DataStoreService (copy) ]]
	local v12 = v1.CodeApprovalsQueue()
	print("Code " .. p2 .. " had role" .. p3 .. " added by " .. p1.Executor.Name)
	if v12[p2][p3] then
		return "Code " .. p2 .. " already has " .. p3 .. " in it?"
	else
		v12[p2][p3] = {}
		DataStoreService:GetDataStore("codes/approvals"):SetAsync("1", v12)
		return "Role " .. p3 .. " was added to code " .. p2
	end
end