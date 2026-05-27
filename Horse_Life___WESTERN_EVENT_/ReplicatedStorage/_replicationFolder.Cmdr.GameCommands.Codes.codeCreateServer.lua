-- https://lua.expert/
local DataStoreService = game:GetService("DataStoreService")
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("CodesService")
local v2 = Sonar("DatastoreClass")
return function(p1, p2, p3) --[[ Line: 15 | Upvalues: v1 (copy), v2 (copy), DataStoreService (copy) ]]
	local v12 = v1.CodeApprovalsQueue()
	local v22 = string.lower(p2)
	if v2.new("live/codes"):Get("ActiveCodes", {})[v22] then
		return "Code " .. v22 .. " already exists in live! Choose a new codename."
	end
	print("Code " .. v22 .. " was created by " .. p1.Executor.Name)
	if v12[v22] then
		return "Code " .. v22 .. " is already waiting for approval"
	else
		v12[v22] = {
			Expire = p3 or 604800,
			Reward = {}
		}
		DataStoreService:GetDataStore("codes/approvals"):SetAsync("1", v12)
		return "Code " .. v22 .. " is now pending approval"
	end
end