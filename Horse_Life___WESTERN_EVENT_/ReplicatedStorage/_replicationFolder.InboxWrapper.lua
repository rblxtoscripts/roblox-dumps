-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("InboxService")
local v2 = Sonar("Signal")
local v3 = Sonar("Maid")
local v4 = Sonar("safeDestroy")
local v5 = Sonar("FormatTime")
local v6 = game:GetService("RunService"):IsServer()
function t.new(p1) --[[ new | Line: 18 | Upvalues: t (copy), v2 (copy), v6 (copy), v5 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.PlayerWrapper = p1
	v22.Player = v22.PlayerWrapper.Player
	v22.Maid = p1.Maid
	if v22.PlayerWrapper:IsLocalOrServer() then
		v22.InboxMessages = {}
		v22.InboxMessageAddedSignal = v22.Maid:GiveTask(v2.new())
		v22.InboxMessageRemovedSignal = v22.Maid:GiveTask(v2.new())
		if v6 then
			v22.PlayerWrapper:AddOnTickCallback(function() --[[ Line: 33 | Upvalues: v22 (copy), v5 (ref) ]]
				for v1, v2 in v22.InboxMessages do
					if v2.ExpireTime and v5.GetTime() >= v2.ExpireTime then
						v2.DataValue:Destroy()
					end
				end
			end)
		end
		v22.Maid:GiveTask(v22.PlayerWrapper.PlayerData.Inbox.ChildRemoved:Connect(function(p1) --[[ Line: 46 | Upvalues: v22 (copy) ]]
			v22:_onInboxMessageRemoved(p1)
		end))
		v22.Maid:GiveTask(v22.PlayerWrapper.PlayerData.Inbox.ChildAdded:Connect(function(p1) --[[ Line: 51 | Upvalues: v22 (copy) ]]
			v22:_onInboxMessageAdded(p1)
		end))
		for v3, v4 in v22.PlayerWrapper.PlayerData.Inbox:GetChildren() do
			v22:_onInboxMessageAdded(v4)
		end
	end
	return v22
end
function t._onInboxMessageAdded(p1, p2) --[[ _onInboxMessageAdded | Line: 62 | Upvalues: v1 (copy), v3 (copy) ]]
	local v2 = tonumber(p2.Name)
	if not v2 then
		return
	end
	local v32 = v1.DecodeMessage(p2)
	if not v32 then
		return
	end
	if not p1:IsMessageDeleted(v32) then
		local v4 = v3.new()
		v32.Maid = v4
		v32.Id = v2
		v32.Player = p1.Player
		v32.Items = v1.GetItemsFromMessage(v32)
		v32.ClaimExpireTime = v1.GetClaimExpireTime(v32)
		v4:GiveTask(p2:WaitForChild("Deleted"):GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 88 | Upvalues: p1 (copy), v32 (copy), p2 (copy) ]]
			if p1:IsMessageDeleted(v32) then
				p1:_onInboxMessageRemoved(p2)
			end
		end))
		p1.InboxMessages[v2] = v32
		p1.InboxMessageAddedSignal:Fire(v32)
	end
end
function t._onInboxMessageRemoved(p1, p2) --[[ _onInboxMessageRemoved | Line: 100 | Upvalues: v4 (copy) ]]
	local v2 = p1.InboxMessages[tonumber(p2.Name)]
	if v2 then
		p1.InboxMessages[tonumber(p2.Name)] = nil
		p1.InboxMessageRemovedSignal:Fire(v2)
		v4(v2)
	end
end
function t.GetInboxMessages(p1) --[[ GetInboxMessages | Line: 113 ]]
	return p1.InboxMessages
end
function t.GetInboxMessageAddedSignal(p1) --[[ GetInboxMessageAddedSignal | Line: 117 ]]
	return p1.InboxMessageAddedSignal
end
function t.GetInboxMessageRemovedSignal(p1) --[[ GetInboxMessageRemovedSignal | Line: 121 ]]
	return p1.InboxMessageRemovedSignal
end
function t.GetInboxMessage(p1, p2) --[[ GetInboxMessage | Line: 125 ]]
	if type(p2) == "number" or type(p2) == "string" then
		return p1.InboxMessages[tonumber(p2)]
	else
		for v1, v2 in p1.InboxMessages do
			if v2.Type == p2.Type and v2.Identifier == p2.Identifier then
				return v2
			end
		end
		return false
	end
end
function t.AddInboxMessage(p1, ...) --[[ AddInboxMessage | Line: 139 | Upvalues: v1 (copy) ]]
	return v1.AddMessage(p1.PlayerWrapper, ...)
end
function t.HasInboxMessage(p1, p2) --[[ HasInboxMessage | Line: 143 ]]
	return p1:GetInboxMessage(p2.Type, p2.Identifier) and true or false
end
function t.IsMessageInspected(p1, p2) --[[ IsMessageInspected | Line: 151 ]]
	return p2.DataValue.Inspected.Value
end
function t.IsMessageClaimed(p1, p2) --[[ IsMessageClaimed | Line: 155 ]]
	if p2.Items then
		return p2.DataValue.Claimed.Value
	else
		return true
	end
end
function t.IsMessageDeleted(p1, p2) --[[ IsMessageDeleted | Line: 163 ]]
	return p2.DataValue.Deleted.Value
end
function t.IsMessageClaimExpired(p1, p2) --[[ IsMessageClaimExpired | Line: 167 | Upvalues: v5 (copy) ]]
	if not p2.ClaimExpireTime then
		return false
	end
	return (p2.ClaimExpireTime or p2.ExpireTime) <= v5.GetTime()
end
function t.IsMessageInteractable(p1, p2) --[[ IsMessageInteractable | Line: 174 | Upvalues: v1 (copy) ]]
	return not p1:IsMessageInspected(p2) or v1.IsMessageClaimable(p1.PlayerWrapper, p2)
end
function t.GetTotalInteractableMessages(p1) --[[ GetTotalInteractableMessages | Line: 178 ]]
	local count = 0
	for v1, v2 in p1:GetInboxMessages() do
		if p1:IsMessageInteractable(v2) then
			count = count + 1
		end
	end
	return count
end
function t.GetInteractableMessagesChangedSignal(p1) --[[ GetInteractableMessagesChangedSignal | Line: 188 | Upvalues: v2 (copy) ]]
	if not p1.ClaimableMessagesChangedSignal then
		local v1 = v2.new()
		local t = {}
		local function getTotalInteractableMessages() --[[ getTotalInteractableMessages | Line: 193 | Upvalues: p1 (copy) ]]
			return p1:GetTotalInteractableMessages()
		end
		local v22 = p1:GetTotalInteractableMessages()
		local function totalToClaimChanged() --[[ totalToClaimChanged | Line: 198 | Upvalues: p1 (copy), v22 (ref), v1 (copy) ]]
			local v12 = p1:GetTotalInteractableMessages()
			if v12 == v22 then
				return
			end
			v22 = v12
			v1:Fire()
		end
		local function messageAdded(p12) --[[ messageAdded | Line: 205 | Upvalues: p1 (copy), totalToClaimChanged (copy), t (copy), v22 (ref), v1 (copy) ]]
			local v12 = p1:GetInteractableMessageChangedSignal(p12)
			v12.Maid:GiveTask(v12:Connect(totalToClaimChanged))
			t[p12.Id] = v12
			local v2 = p1:GetTotalInteractableMessages()
			if v2 == v22 then
				return
			end
			v22 = v2
			v1:Fire()
		end
		local function messageRemoved(p12) --[[ messageRemoved | Line: 213 | Upvalues: t (copy), p1 (copy), v22 (ref), v1 (copy) ]]
			if t[p12.Id] then
				t[p12.Id]:Destroy()
				t[p12.Id] = nil
			end
			local v12 = p1:GetTotalInteractableMessages()
			if v12 == v22 then
				return
			end
			v22 = v12
			v1:Fire()
		end
		v1.Maid:GiveTask(p1:GetInboxMessageAddedSignal():Connect(messageAdded))
		v1.Maid:GiveTask(p1:GetInboxMessageRemovedSignal():Connect(messageRemoved))
		for v3, v4 in p1:GetInboxMessages() do
			local v5 = p1:GetInteractableMessageChangedSignal(v4)
			v5.Maid:GiveTask(v5:Connect(totalToClaimChanged))
			t[v4.Id] = v5
			local v6 = p1:GetTotalInteractableMessages()
			if v6 ~= v22 then
				v22 = v6
				v1:Fire()
			end
		end
		p1.ClaimableMessagesChangedSignal = v1
	end
	return p1.ClaimableMessagesChangedSignal
end
function t.GetInteractableMessageChangedSignal(p1, p2) --[[ GetInteractableMessageChangedSignal | Line: 233 | Upvalues: v2 (copy), v5 (copy) ]]
	local v1 = v2.new()
	local function getClaimableState() --[[ getClaimableState | Line: 236 | Upvalues: p1 (copy), p2 (copy) ]]
		return p1:IsMessageInteractable(p2)
	end
	local v22 = p1:IsMessageInteractable(p2)
	local function claimableUpdateChanged() --[[ claimableUpdateChanged | Line: 241 | Upvalues: p1 (copy), p2 (copy), v22 (ref), v1 (copy) ]]
		local v12 = p1:IsMessageInteractable(p2)
		if v12 == v22 then
			return
		end
		v22 = v12
		v1:Fire()
	end
	v1.Maid:GiveTask(p2.DataValue.Inspected:GetPropertyChangedSignal("Value"):Connect(claimableUpdateChanged))
	v1.Maid:GiveTask(p2.DataValue.Claimed:GetPropertyChangedSignal("Value"):Connect(claimableUpdateChanged))
	v1.Maid._timeExpired = v5.OnTimeChanged(function() --[[ Line: 251 | Upvalues: p1 (copy), p2 (copy), v22 (ref), v1 (copy) ]]
		if not p1:IsMessageClaimExpired(p2) then
			return
		end
		local v12 = p1:IsMessageInteractable(p2)
		if v12 ~= v22 then
			v22 = v12
			v1:Fire()
		end
		v1.Maid._timeExpired = nil
	end)
	return v1
end
return t