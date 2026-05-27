-- https://lua.expert/
local DataStoreService = game:GetService("DataStoreService")
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("CodesService")
local v2 = Sonar("DatastoreClass")
local v3 = Sonar("PlayerWrapper")
return function(p1, p2) --[[ Line: 17 | Upvalues: v3 (copy), v1 (copy), v2 (copy), DataStoreService (copy) ]]
	local v12 = v3.getWrapperFromPlayer(p1.Executor)
	if not v12 then
		return
	end
	local v22 = v1.CodeApprovalsQueue()
	local v32 = string.lower(p2)
	if v22[v32] == nil then
		return "Code " .. v32 .. " is not in approval queue?"
	end
	local Player = v22[v32].Player
	local v4
	if Player then
		if #v22[v32].Player > 0 then
			Player = true
			v4 = v32
		else
			Player = false
			v4 = v32
		end
	else
		v4 = v32
	end
	if not (v12:HasPermission("Developer") or Player) then
		return "Code " .. v4 .. " must have a player id added"
	end
	local v5 = v22[v4]
	local v6 = os.time()
	local t = {}
	for v7, v8 in v5.Reward do
		if typeof(v8) == "table" then
			t[v7] = v8
			continue
		end
		t[v7] = {
			Name = v7,
			Amount = v8
		}
	end
	local v9 = v2.new("live/codes")
	local v10 = v9:Get("ActiveCodes", {})
	v10[v4] = {
		StartTime = v6,
		EndTime = v6 + (v5.Expire or 0),
		Rewards = t,
		Player = v5.Player
	}
	v9:Set("ActiveCodes", v10)
	v22[v4] = nil
	DataStoreService:GetDataStore("codes/approvals"):SetAsync("1", v22)
	return v4 .. " was added to live codes"
end