-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("GuiFrameworkService", "Client")
local v4 = game:GetService("RunService"):IsServer()
local v5 = v1.GetRemoteEvent("SendConflictRemote")
local v6 = v1.GetRemoteFunction("ResolveConflictRemote")
function t.GetConflict(p1, p2) --[[ GetConflict | Line: 20 ]]
	if p1._itemConflicts then
		return p1._itemConflicts[p2]
	end
end
function t.RemoveConflict(p1, p2) --[[ RemoveConflict | Line: 28 ]]
	if p1._itemConflicts then
		p1._itemConflicts[p2] = nil
	end
end
function t.AddConflict(p1, p2) --[[ AddConflict | Line: 36 | Upvalues: v5 (copy) ]]
	if not (p2.Item and p2.Limit) then
		warn("\226\154\160\239\184\143 ItemLimitConflictService, AddConflict, Item and Limit are required from ItemsWrapper:GiveItem")
		return
	end
	if not p1._itemConflicts then
		p1._itemConflicts = {}
	end
	if not p1._itemConflictId then
		p1._itemConflictId = 0
	end
	p1._itemConflictId = p1._itemConflictId + 1
	local Item = p2.Item
	p1._itemConflicts[p1._itemConflictId] = Item
	print("\240\159\146\165 ItemLimitConflictService, Added conflicted item for", p1.Player.Name, p2)
	v5:FireClient(p1.Player, {
		Item = Item.Item or Item,
		ConflictId = p1._itemConflictId,
		LimitType = p2.Limit.Type,
		Animation = Item.ItemStream,
		Amount = Item.Amount
	})
	return true
end
function t.ResolveConflict(p1, p2) --[[ ResolveConflict | Line: 75 | Upvalues: t (copy) ]]
	local v1 = t.GetConflict(p1, p2.ConflictId)
	if not v1 then
		return
	end
	local v2
	if p2.Ignore then
		v2 = true
	else
		t.RemoveConflictingItems(p1, p2.Items)
		if not p1:CanGiveItem(v1.Name, v1.Amount) then
			return
		end
		v1.IgnoreLimit = true
		v1.ItemStream = false
		local v3 = p1:GiveItem(v1)
		if not v3 then
			return
		end
		v2 = type(v3) == "table"
	end
	print("\226\156\133 ItemLimitConflictService, Resolved conflict for", p1.Player.Name, v1)
	t.RemoveConflict(p1, p2.ConflictId)
	return v2
end
function t.RemoveConflictingItems(p1, p2) --[[ RemoveConflictingItems | Line: 120 ]]
	for v1, v2 in p2 do
		p1:RemoveItem(v2)
	end
end
function t.RequestToResolveConflict(p1) --[[ RequestToResolveConflict | Line: 126 | Upvalues: v6 (copy) ]]
	if not p1.ConflictId then
		warn("\226\154\160\239\184\143 ItemLimitConflictService, RequestToResolveConflict, ConflictId is required")
		return
	end
	if p1.Items then
		return v6:InvokeServer(p1)
	end
	warn("\226\154\160\239\184\143 ItemLimitConflictService, RequestToResolveConflict, Resolution is required")
	return v6:InvokeServer(p1)
end
function t.Init(p1) --[[ Init | Line: 139 | Upvalues: v4 (copy), v1 (copy), v2 (copy), t (copy), v5 (copy), v3 (copy) ]]
	if v4 then
		v1.GetRemoteFunction("ResolveConflictRemote").OnServerInvoke = function(p1, p2) --[[ Line: 141 | Upvalues: v2 (ref), t (ref) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			if v1 then
				return t.ResolveConflict(v1, p2)
			end
		end
		v1.GetRemoteFunction("RemoveConflictingItemsRemote").OnServerInvoke = function(p1, p2) --[[ Line: 150 | Upvalues: v2 (ref), t (ref) ]]
			local v1 = v2.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			if t.GetConflict(v1, p2.ConflictId) then
				return t.RemoveConflictingItems(v1, p2.Items)
			end
		end
	else
		v5.OnClientEvent:Connect(function(p1) --[[ Line: 165 | Upvalues: v3 (ref) ]]
			v3.QueueAnimation({
				Identifier = p1.ConflictId,
				Animation = p1.Animation,
				Amount = p1.Item.Amount,
				Item = p1.Item,
				Conflict = p1
			})
		end)
	end
end
t:Init()
return t