-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("GuiFrameworkService")
local v4 = Sonar("FormatTime")
local v5 = Sonar("GameUpdateService")
local v6 = Sonar("PlayerWrapper").GetClient()
function t.new(p1) --[[ new | Line: 18 | Upvalues: t (copy), v1 (copy), v3 (copy), v6 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Context = p1
	v2.Config = v3.GetComponentConfig(p1)
	v2.Instance = p1.Instance
	v2.UpdateLog = p1.UpdateLog
	if not v2.UpdateLog then
		warn("\226\154\160\239\184\143 UpdateLogDisplay, UpdateLog is required for update log display", v2.Instance, v2.Config)
		return v2
	end
	v2.ClaimableChangedSignal = v2.Maid:GiveTask(v6:GetClaimableUpdateChangedSignal(v2.UpdateLog.Index))
	v2.TitleLabel = v3.FindElement(v2.Instance, "TitleLabel")
	v2:_setTitle()
	v2.DateLabel = v3.FindElement(v2.Instance, "DateLabel")
	v2:_setDate()
	v2.ThumbnailLabel = v3.FindElement(v2.Instance, "ThumbnailLabel")
	v2:_setThumbnail()
	v2.IconLabel = v3.FindElement(v2.Instance, "IconLabel")
	v2:_setIcon()
	v2.DescriptionLabel = v3.FindElement(v2.Instance, "DescriptionLabel")
	v2:_setDescription()
	v2.Maid:GiveTask(v2.ClaimableChangedSignal:Connect(function() --[[ Line: 55 | Upvalues: v2 (copy) ]]
		v2:_setClaimable()
	end))
	v2:_setClaimable()
	if v2:_hasItemsToClaim() then
		v2.NotificationBadge = v3.FindElement(v2.Instance, "NotificationBadge")
		if v2.NotificationBadge then
			v2.Maid:GiveTask(v3.AddComponent("NotificationBadge", {
				Instance = v2.NotificationBadge,
				CanShow = function() --[[ CanShow | Line: 65 | Upvalues: v2 (copy) ]]
					return v2:IsClaimable()
				end,
				Changed = { v2.ClaimableChangedSignal }
			}))
		end
	end
	v2.ItemsFrame = v3.FindElement(v2.Instance, "ItemsFrame")
	v2:_setItems()
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 81 | Upvalues: v2 (copy) ]]
	v2(p1)
end
function t._hasItemsToClaim(p1) --[[ _hasItemsToClaim | Line: 85 ]]
	return p1.UpdateLog.Items and next(p1.UpdateLog.Items)
end
function t._setTitle(p1) --[[ _setTitle | Line: 89 ]]
	if p1.TitleLabel then
		p1.TitleLabel.Text = p1.UpdateLog.Title
	end
end
function t._setDescription(p1) --[[ _setDescription | Line: 97 ]]
	if p1.DescriptionLabel then
		p1.DescriptionLabel.Text = p1.UpdateLog.Description
	end
end
function t._setDate(p1) --[[ _setDate | Line: 105 | Upvalues: v4 (copy) ]]
	if p1.DateLabel then
		p1.DateLabel.Text = v4.GetFormattedTime("M. j, Y", p1.UpdateLog.ReleaseTime)
	end
end
function t._setThumbnail(p1) --[[ _setThumbnail | Line: 113 ]]
	if not p1.ThumbnailLabel then
		return
	end
	p1.ThumbnailLabel.Image = tonumber(p1.UpdateLog.Thumbnail) and "rbxassetid://" .. p1.UpdateLog.Thumbnail or p1.UpdateLog.Thumbnail
end
function t._setIcon(p1) --[[ _setIcon | Line: 122 ]]
	if not p1.IconLabel then
		return
	end
	p1.IconLabel.Image = tonumber(p1.UpdateLog.Icon) and "rbxassetid://" .. p1.UpdateLog.Icon or p1.UpdateLog.Icon
end
function t._setItems(p1) --[[ _setItems | Line: 131 | Upvalues: v4 (copy), v1 (copy), v3 (copy) ]]
	if p1.ItemsMaid then
		p1.ItemsMaid:DoCleaning()
	end
	if not p1.ItemsFrame then
		return
	end
	if p1.UpdateLog.Items and not (p1.UpdateLog.ClaimExpireTime <= v4.GetTime()) then
		if type(p1.UpdateLog.Items) ~= "table" then
			warn("\226\154\160\239\184\143 UpdateLogDisplay, Items must be a table", p1.UpdateLog.Items, p1.Instance, p1.Config)
			return
		end
		if not p1.ItemsMaid then
			p1.ItemsMaid = v1.new()
			p1.Maid:GiveTask(p1.ItemsMaid)
		end
		p1.ItemsMaid:GiveTask(p1.ClaimableChangedSignal:Connect(function() --[[ Line: 156 | Upvalues: p1 (copy) ]]
			p1:_setItems()
		end))
		p1.ItemsMaid:GiveTask(v3.AddComponent("MultiItemDisplay", {
			Instance = p1.ItemsFrame,
			Items = p1.UpdateLog.Items
		}))
		p1.ItemsFrame.Visible = true
	else
		p1.ItemsFrame.Visible = false
	end
end
function t._setClaimable(p1) --[[ _setClaimable | Line: 168 ]]
	if not p1.Config.OnClaimableChanged then
		return
	end
	p1.Config.OnClaimableChanged(p1)
end
function t.IsClaimable(p1) --[[ IsClaimable | Line: 174 | Upvalues: v5 (copy), v6 (copy) ]]
	return v5.IsUpdateClaimable(v6, p1.UpdateLog.Index)
end
return t