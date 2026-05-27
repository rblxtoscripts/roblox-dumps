-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataStoreService = game:GetService("DataStoreService")
require(ReplicatedStorage:WaitForChild("Sonar"))
return function(p1, p2, p3) --[[ Line: 8 | Upvalues: DataStoreService (copy) ]]
	if p3 <= 0 then
		return "Amount must be greater than 0"
	end
	local v1 = DataStoreService:GetDataStore("currency/remove/approvals")
	local v2, v3 = pcall(function() --[[ Line: 15 | Upvalues: v1 (copy), p2 (copy), p3 (copy), p1 (copy) ]]
		local v12 = v1:GetAsync("Queue") or {}
		v12[tostring(p2)] = {
			UserId = p2,
			Amount = p3,
			RequestedBy = p1.Executor.UserId,
			RequestedAt = os.time()
		}
		v1:SetAsync("Queue", v12)
		return v12[tostring(p2)]
	end)
	if v2 then
		return "Queued removal of " .. p3 .. " Coins from userId " .. p2
	else
		warn("Failed to queue currency removal:", v3)
		return "Failed to queue currency removal"
	end
end