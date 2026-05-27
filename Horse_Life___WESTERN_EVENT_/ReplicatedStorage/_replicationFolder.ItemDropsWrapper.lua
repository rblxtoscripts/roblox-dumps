-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local PhysicsService = game:GetService("PhysicsService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("StorageUtils")
local v5 = Sonar("MathUtils")
local v6 = RunService:IsServer()
local v7 = v4.GetConfig("ItemDrops")()
local Defaults = v7.Defaults
local v8 = Sonar("ItemDrop", {
	Context = "Client",
	Deferred = true
})
local v9 = v2.GetRemoteEvent("ItemDropsRemote")
function t.new(p1) --[[ new | Line: 88 | Upvalues: t (copy), v1 (copy), v6 (copy), v9 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.PlayerWrapper = p1
	v2.Player = p1.Player
	v2.Maid = v1.new()
	if v6 then
		v2.PendingDrops = {}
		v2.Batches = {}
		v2.NextDropId = 0
		v2.NextBatchId = 0
	end
	if not v6 and p1:IsLocalOrServer() then
		v2.ActiveBatches = {}
		v2.Maid:GiveTask(v9.OnClientEvent:Connect(function(p1, p2) --[[ Line: 105 | Upvalues: v2 (copy) ]]
			if p1 == "Cleanup" then
				v2:_cleanupVisuals()
				return
			end
			v2:_processBatch(if p1 then p1 elseif v2.PlayerWrapper.PrimaryPart then v2.PlayerWrapper.PrimaryPart.Position or Vector3.new(0, 0, 0) else Vector3.new(0, 0, 0), p2)
		end))
	end
	return v2
end
function t.GenerateDrops(p1, p2) --[[ GenerateDrops | Line: 129 | Upvalues: Defaults (copy), v5 (copy), v9 (copy) ]]
	local Position = p2.Position
	local v1 = p2.Lifetime or Defaults.Lifetime
	p1.NextBatchId = p1.NextBatchId + 1
	local NextBatchId = p1.NextBatchId
	local t = {}
	local t2 = {}
	for v3, v4 in p2.Drops do
		local v52 = v4.Name
		local Amount = v4.Amount
		local v6 = v4.Count or 1
		local v7 = math.floor(Amount / v6)
		local v8 = Amount - v7 * v6
		local t3 = {}
		for i = 1, v6 do
			p1.NextDropId = p1.NextDropId + 1
			local NextDropId = p1.NextDropId
			p1.PendingDrops[NextDropId] = {
				Name = v52,
				Amount = v7 + (if i <= v8 then 1 else 0),
				BatchId = NextBatchId
			}
			table.insert(t3, NextDropId)
			table.insert(t, NextDropId)
		end
		table.insert(t2, { v52, v7, t3 })
	end
	p1.Batches[NextBatchId] = {
		ExpiryThread = nil,
		DropIds = t,
		OnExpire = p2.OnExpire or Defaults.OnExpire
	}
	if v1 then
		p1.Batches[NextBatchId].ExpiryThread = task.delay(v1, function() --[[ Line: 172 | Upvalues: p1 (copy), NextBatchId (copy) ]]
			p1:_expireBatch(NextBatchId)
		end)
	end
	if Position then
		Position = v5.roundVector(Position)
	end
	v9:FireClient(p1.Player, Position, t2)
end
function t.ClaimBatch(p1, p2) --[[ ClaimBatch | Line: 188 ]]
	if type(p2) ~= "table" then
		return
	end
	local t = {}
	local t2 = {}
	for v1, v2 in p2 do
		if type(v2) == "number" then
			local v3 = p1.PendingDrops[v2]
			if v3 then
				local v4 = v3.Name
				if not t[v4] then
					t[v4] = 0
				end
				t[v4] = t[v4] + v3.Amount
				t2[v3.BatchId] = true
				p1.PendingDrops[v2] = nil
			end
		end
	end
	for v5, v6 in t do
		p1.PlayerWrapper:GiveItem({
			AnalyticsSource = "ItemDrop",
			ItemStream = false,
			Item = {
				Name = v5,
				Amount = v6
			}
		})
	end
	for v7 in t2 do
		p1:_cleanupBatch(v7)
	end
end
function t._expireBatch(p1, p2) --[[ _expireBatch | Line: 236 | Upvalues: v7 (copy) ]]
	local v1 = p1.Batches[p2]
	if not v1 then
		return
	end
	local OnExpire = v1.OnExpire
	local t = {}
	for v2, v3 in v1.DropIds do
		local v4 = p1.PendingDrops[v3]
		if v4 then
			if not t[v4.Name] then
				t[v4.Name] = 0
			end
			local v5 = v4.Name
			t[v5] = t[v5] + v4.Amount
			p1.PendingDrops[v3] = nil
		end
	end
	if next(t) then
		if OnExpire == "Grant" then
			for v6, v72 in t do
				p1.PlayerWrapper:GiveItem({
					AnalyticsSource = "ItemDropExpiry",
					ItemStream = false,
					Item = {
						Name = v6,
						Amount = v72
					}
				})
			end
		end
		if type(OnExpire) == "function" then
			OnExpire(p1.PlayerWrapper, t)
		end
		local OnBatchExpired = v7.Callbacks.OnBatchExpired
		if OnBatchExpired then
			OnBatchExpired(p1.PlayerWrapper, v1, t)
		end
	end
	p1.Batches[p2] = nil
end
function t._cleanupBatch(p1, p2) --[[ _cleanupBatch | Line: 287 ]]
	local v1 = p1.Batches[p2]
	if not v1 then
		return
	end
	if v1.ExpiryThread then
		task.cancel(v1.ExpiryThread)
		v1.ExpiryThread = nil
	end
	local v2 = false
	for v3, v4 in v1.DropIds do
		if p1.PendingDrops[v4] then
			v2 = true
			break
		end
	end
	if v2 then
		return
	end
	p1.Batches[p2] = nil
end
function t.Cleanup(p1) --[[ Cleanup | Line: 316 | Upvalues: v6 (copy), v9 (copy) ]]
	if not v6 then
		return
	end
	local t = {}
	for v1, v2 in p1.Batches do
		if v2.ExpiryThread then
			task.cancel(v2.ExpiryThread)
			v2.ExpiryThread = nil
		end
		local OnExpire = v2.OnExpire
		for v3, v4 in v2.DropIds do
			local v5 = p1.PendingDrops[v4]
			if v5 then
				if OnExpire == "Grant" then
					if not t[v5.Name] then
						t[v5.Name] = 0
					end
					local v62 = v5.Name
					t[v62] = t[v62] + v5.Amount
				end
				p1.PendingDrops[v4] = nil
			end
		end
		if OnExpire and type(OnExpire) == "function" then
			OnExpire(p1.PlayerWrapper, t)
		end
	end
	for v7, v8 in t do
		p1.PlayerWrapper:GiveItem({
			AnalyticsSource = "ItemDropCleanup",
			ItemStream = false,
			Item = {
				Name = v7,
				Amount = v8
			}
		})
	end
	p1.Batches = {}
	p1.PendingDrops = {}
	v9:FireClient(p1.Player, "Cleanup")
end
function t._processBatch(p1, p2, p3) --[[ _processBatch | Line: 372 | Upvalues: v7 (copy), v8 (copy) ]]
	local t = {
		Claimed = false,
		Drops = {},
		DropIds = {},
		TotalAmounts = {}
	}
	local count = 0
	for v1, v2 in p3 do
		local v3 = v2[1]
		local v4 = v2[2]
		local v5 = v2[3]
		t.TotalAmounts[v3] = (t.TotalAmounts[v3] or 0) + v4 * #v5
		for v6, v72 in v5 do
			table.insert(t.DropIds, v72)
			count = count + 1
			task.delay((count - 1) * (v7.StaggerDelay or 0.02), function() --[[ Line: 394 | Upvalues: t (copy), v8 (ref), p2 (copy), v72 (copy), v3 (copy), v4 (copy), p1 (copy) ]]
				if not t.Claimed then
					local v1 = v8.new({
						Position = p2,
						DropId = v72,
						Type = v3,
						Amount = v4,
						OnPickUp = function(p12) --[[ OnPickUp | Line: 404 | Upvalues: p1 (ref), t (ref) ]]
							p1:_onDropPickedUp(t, p12)
						end
					})
					local Drops = t.Drops
					table.insert(Drops, v1)
				end
			end)
		end
	end
	table.insert(p1.ActiveBatches, t)
end
function t._onDropPickedUp(p1, p2, p3) --[[ _onDropPickedUp | Line: 424 | Upvalues: v7 (copy), v9 (copy) ]]
	local OnDropCollected = v7.Callbacks.OnDropCollected
	if OnDropCollected then
		OnDropCollected(p1.PlayerWrapper, {
			Type = p3.Type,
			Amount = p3.Amount,
			DropId = p3.DropId
		})
	end
	if p2.Claimed then
		return
	end
	p2.Claimed = true
	local OnBatchClaimed = v7.Callbacks.OnBatchClaimed
	if OnBatchClaimed then
		OnBatchClaimed(p1.PlayerWrapper, {
			TotalAmounts = p2.TotalAmounts,
			DropCount = #p2.DropIds
		})
	end
	for v1, v2 in p2.Drops do
		if v2 ~= p3 and not (v2.PickedUp or v2.Destroyed) then
			v2:ForcePickUp()
		end
	end
	v9:FireServer(p2.DropIds)
end
function t._cleanupVisuals(p1) --[[ _cleanupVisuals | Line: 460 ]]
	if not p1.ActiveBatches then
		return
	end
	for v1, v2 in p1.ActiveBatches do
		for v3, v4 in v2.Drops do
			if not v4.Destroyed then
				v4:Destroy()
			end
		end
	end
	p1.ActiveBatches = {}
end
function t.Destroy(p1) --[[ Destroy | Line: 478 | Upvalues: v6 (copy) ]]
	if v6 then
		p1:Cleanup()
	else
		p1:_cleanupVisuals()
	end
	p1.Maid:Destroy()
end
function t.Init(p1) --[[ Init | Line: 491 | Upvalues: v6 (copy), PhysicsService (copy), v9 (copy), v3 (copy) ]]
	if v6 then
		PhysicsService:RegisterCollisionGroup("ItemDrops")
		v9.OnServerEvent:Connect(function(p1, p2) --[[ Line: 498 | Upvalues: v3 (ref) ]]
			local v1 = v3.getWrapperFromPlayer(p1)
			if v1 then
				v1:ClaimBatch(p2)
			end
		end)
	end
end
return t