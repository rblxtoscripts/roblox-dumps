-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("Maid")
local v3 = Sonar("safeDestroy")
local v4 = Sonar("StorageUtils")
local v5 = Sonar("FormatTime")
local v6 = Sonar("InboxService")
local v7 = v4.GetConfig("Inbox")()
local MessageTextPlaceholders = v7.MessageTextPlaceholders
local DefaultImage = v7.DefaultImage
local v8 = Sonar("PlayerWrapper").GetClient()
local t2 = {}
function t.new(p1) --[[ new | Line: 28 | Upvalues: t (copy), v2 (copy), v1 (copy), v7 (copy), v8 (copy), t2 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.Context = p1
	v22.Config = v1.GetComponentConfig(p1)
	v22.Message = v22.Config.Message
	v22.DataValue = v22.Message.DataValue
	v22.Instance = p1.Instance
	v22.Preset = v7.MessageTypes[v22.Message.Type] or v7.MessageTypes.Default
	v22.GiftLabel = v1.FindElement(v22.Instance, "GiftLabel")
	v22.ClaimableChangedSignal = v22.Maid:GiveTask(v8:GetInteractableMessageChangedSignal(v22.Message))
	v22.Maid:GiveTask(v22.DataValue.Claimed:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 44 | Upvalues: v22 (copy) ]]
		v22:_setClaimed()
	end))
	v22:_setClaimed()
	v22.Maid:GiveTask(v22.ClaimableChangedSignal:Connect(function() --[[ Line: 49 | Upvalues: v22 (copy) ]]
		v22:_setClaimable()
	end))
	v22:_setClaimable()
	v22.TimeLabel = v1.FindElement(v22.Instance, "TimeLabel")
	v22:_setTimeSent()
	v22.ReadLabel = v1.FindElement(v22.Instance, "ReadLabel")
	v22.Maid:GiveTask(v22.DataValue.Inspected:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 58 | Upvalues: v22 (copy) ]]
		v22:_setInspected()
	end))
	v22.Maid:GiveTask(v22.DataValue.Claimed:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 61 | Upvalues: v22 (copy) ]]
		v22:_setInspected()
	end))
	v22:_setInspected()
	v22.MessageLabel = v1.FindElement(v22.Instance, "MessageLabel")
	v22:_setMessage()
	v22.TitleLabel = v1.FindElement(v22.Instance, "TitleLabel")
	v22:_setTitle()
	v22.ItemsFrame = v1.FindElement(v22.Instance, "ItemsFrame")
	v22:_setItems()
	v22.NotificationBadge = v1.FindElement(v22.Instance, "NotificationBadge")
	if v22.NotificationBadge then
		v22.Maid:GiveTask(v1.AddComponent("NotificationBadge", {
			Instance = v22.NotificationBadge,
			CanShow = function() --[[ CanShow | Line: 79 | Upvalues: v8 (ref), v22 (copy) ]]
				return not v8:IsMessageInspected(v22.Message)
			end,
			Changed = { v22.DataValue.Inspected:GetPropertyChangedSignal("Value") }
		}))
	end
	t2[v22] = true
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 93 | Upvalues: v3 (copy), t2 (copy) ]]
	v3(p1)
	t2[p1] = nil
end
function t.Update(p1) --[[ Update | Line: 98 ]]
	p1:_setClaimed()
	p1:_setTimeSent()
end
function t._setItems(p1) --[[ _setItems | Line: 104 | Upvalues: v8 (copy), v2 (copy), v1 (copy) ]]
	if p1.ItemsMaid then
		p1.ItemsMaid:DoCleaning()
	end
	if not p1.ItemsFrame then
		return
	end
	if p1.Message.Items and not v8:IsMessageClaimExpired(p1.Message) then
		if type(p1.Message.Items) ~= "table" then
			warn("\226\154\160\239\184\143 InboxDisplay, Items must be a table", p1.Message.Items, p1.Instance, p1.Config)
			return
		end
		if not p1.ItemsMaid then
			p1.ItemsMaid = v2.new()
			p1.Maid:GiveTask(p1.ItemsMaid)
		end
		p1.ItemsMaid:GiveTask(p1.ClaimableChangedSignal:Connect(function() --[[ Line: 129 | Upvalues: p1 (copy) ]]
			p1:_setItems()
		end))
		p1.ItemsMaid:GiveTask(v1.AddComponent("MultiItemDisplay", {
			Instance = p1.ItemsFrame,
			Items = p1.Message.Items
		}))
		p1.ItemsFrame.Visible = true
	else
		p1.ItemsFrame.Visible = false
	end
end
function t._formatMessageText(p1, p2, ...) --[[ _formatMessageText | Line: 141 | Upvalues: MessageTextPlaceholders (copy) ]]
	local t = { ... }
	return p2:gsub("(%b{})", function(p12) --[[ Line: 143 | Upvalues: MessageTextPlaceholders (ref), p1 (copy), t (copy) ]]
		for v1, v2 in MessageTextPlaceholders do
			if string.lower(p12) == string.lower("{" .. v1 .. "}") then
				return v2(p1.Message, table.unpack(t))
			end
		end
		return p12
	end)
end
function t._getMessage(p1) --[[ _getMessage | Line: 153 | Upvalues: v7 (copy) ]]
	local v1 = p1.Message.Message or p1.Preset.Message
	if type(v1) == "function" then
		v1 = v1(p1.Message)
	end
	if not v1 then
		v1 = v7.MessageTypes.Default.Message
	end
	return p1:_formatMessageText(v1)
end
function t._setMessage(p1) --[[ _setMessage | Line: 170 ]]
	if p1.MessageLabel then
		p1.MessageLabel.Text = p1:_getMessage()
	end
end
function t._getTitle(p1) --[[ _getTitle | Line: 178 ]]
	local Title = p1.Preset.Title
	if type(Title) == "function" then
		return Title(p1.Message)
	else
		return Title
	end
end
function t._setTitle(p1) --[[ _setTitle | Line: 186 ]]
	if p1.TitleLabel then
		p1.TitleLabel.Text = p1:_getTitle()
	end
end
function t._getTimeSent(p1) --[[ _getTimeSent | Line: 194 ]]
	return p1.Message.TimeSent
end
function t._setTimeSent(p1) --[[ _setTimeSent | Line: 198 | Upvalues: v5 (copy) ]]
	if p1.TimeLabel then
		p1.TimeLabel.Text = v5.Relative(p1:_getTimeSent())
	end
end
function t._getInspected(p1) --[[ _getInspected | Line: 206 ]]
	if p1:_hasRewardsAndIsClaimable() then
		return false
	else
		return p1.DataValue.Inspected.Value
	end
end
function t._setInspected(p1) --[[ _setInspected | Line: 214 | Upvalues: DefaultImage (copy) ]]
	if not p1.ReadLabel then
		return
	end
	if p1.ReadLabel:IsA("ImageLabel") then
		local v1 = p1.Preset.Image or DefaultImage
		if type(v1) == "table" then
			v1 = p1:_getInspected() and v1.Read or v1.Unread
		end
		p1.ReadLabel.Image = v1
	else
		p1.ReadLabel.Text = if p1:_getInspected() then "Opened" else "Unread"
	end
end
function t._hasRewardsAndIsClaimable(p1) --[[ _hasRewardsAndIsClaimable | Line: 231 | Upvalues: v6 (copy), v8 (copy) ]]
	return v6.IsMessageClaimable(v8, p1.Message)
end
function t._setClaimed(p1) --[[ _setClaimed | Line: 237 ]]
	if not p1.Config.OnClaimedChanged then
		return
	end
	p1.Config.OnClaimedChanged(p1)
end
function t._setClaimable(p1) --[[ _setClaimable | Line: 243 ]]
	if p1.GiftLabel then
		p1.GiftLabel.Visible = p1:_hasRewardsAndIsClaimable()
	end
	if not p1.Config.OnClaimableChanged then
		return
	end
	p1.Config.OnClaimableChanged(p1)
end
function t.IsClaimable(p1) --[[ IsClaimable | Line: 253 ]]
	return p1:_hasRewardsAndIsClaimable()
end
function t.Init(p1) --[[ Init | Line: 257 | Upvalues: v5 (copy), t2 (copy) ]]
	v5.OnTimeChanged(function() --[[ Line: 258 | Upvalues: t2 (ref) ]]
		for v1, v2 in t2 do
			v1:Update()
		end
	end)
end
t:Init()
return t