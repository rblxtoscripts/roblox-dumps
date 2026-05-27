-- https://lua.expert/
local DataStoreService = game:GetService("DataStoreService")
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("DatastoreClass")
local v2 = Sonar("CodesService")
return function(p1, p2) --[[ Line: 15 | Upvalues: v2 (copy), DataStoreService (copy), v1 (copy) ]]
	local v12 = v2.CodeApprovalsQueue()
	local v22 = string.lower(p2)
	print("Code " .. v22 .. " was removed by " .. p1.Executor.Name)
	if v12[v22] then
		v12[v22] = nil
		DataStoreService:GetDataStore("codes/approvals"):SetAsync("1", v12)
	end
	local v3 = v22
	local v4 = v1.new("live/codes")
	local v5 = v4:Get("ActiveCodes", {})
	if v5[v3] then
		v5[v3] = nil
		v4:Set("ActiveCodes", v5)
		return "Code " .. v3 .. " was removed from live and the approval queue"
	end
	if v12[v3] then
	else
		return v3 .. " is not in the approval queue or live codes"
	end
end