-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local ModDashboardLoader = require(ReplicatedStorage.ModDashboardLoader)
local v1 = ModDashboardLoader("Binder")
local v2 = ModDashboardLoader("Maid")
local v3 = ModDashboardLoader("safeDestroy")
local v4 = ModDashboardLoader("InstanceUtils")
local v5 = ModDashboardLoader("Button")
local v6 = ModDashboardLoader("Config")
local v7 = ModDashboardLoader("EventUtils")
local v8 = ModDashboardLoader("GuiProvider", {
	Deferred = true
})
local v9 = ModDashboardLoader("FormatString")
local v10 = ModDashboardLoader("PlayerUtils")
local v11 = ModDashboardLoader("Cancelable")
local v12 = ModDashboardLoader("TableUtils")
local v13 = ModDashboardLoader("FormatPresets")
local ModDashboardRemote = ReplicatedStorage:WaitForChild("ModDashboardRemote")
local v14 = 0
local t2 = {}
function t._resetTab(p1) --[[ _resetTab | Line: 32 ]]
	p1.CurrentConfig = nil
	p1.CurrentTab = nil
	p1:_setPage(1)
end
function t._openTab(p1, p2) --[[ _openTab | Line: 39 | Upvalues: v6 (copy) ]]
	if not p2 then
		p1:_resetTab()
		return
	end
	local v1 = v6.Tabs[p2]
	local v2 = p1.Data.Tabs[p2]
	if not (v2 and v1) then
		warn("Tab data or config not found for tab " .. tostring(p2))
		p1:_resetTab()
		return
	end
	if v2 and #v2 == 0 then
		p1:_resetTab()
		p1.MainTextLabel.Text = "No data found for this tab"
		return
	end
	p1.CurrentConfig = v1
	p1.CurrentTab = v2
	p1:_setPage(1)
end
function t._updateFooter(p1) --[[ _updateFooter | Line: 66 ]]
	local v1 = p1.CurrentTab and #p1.CurrentTab or 0
	p1.PageLabel.Text = (p1.CurrentTab and p1.CurrentPage or 0) .. "/" .. v1
	p1.PreviousButton.BackgroundTransparency = if p1.CurrentTab and p1.CurrentPage ~= 1 then 0.5 else 0.8
	p1.NextButton.BackgroundTransparency = if p1.CurrentTab and p1.CurrentPage ~= v1 then 0.5 else 0.8
end
function t._setPage(p1, p2) --[[ _setPage | Line: 76 | Upvalues: v13 (copy), v7 (copy) ]]
	if not p1.CurrentTab then
		p1.CurrentPage = 1
	end
	if p1.CurrentTab then
		p1.CurrentPage = math.clamp(p2, 1, #p1.CurrentTab)
		local v2 = p1.CurrentTab[p1.CurrentPage]
		if p1.CurrentConfig.Formatter then
			local v3 = v13.Timestamp(v2.Timestamp)
			p1.MainTextLabel.Text = string.format("[%s]\n%s", v3, v7.safeCallNoWarn(p1.CurrentConfig.Formatter, v2) or "An error occurred :(")
		elseif typeof(v2) == "table" then
			p1.MainTextLabel.Text = game:GetService("HttpService"):JSONEncode(v2)
		elseif typeof(v2) == "string" then
			p1.MainTextLabel.Text = v2
		else
			p1.MainTextLabel.Text = "An error occurred processing the data"
		end
	else
		p1.CurrentPage = 1
		p1.MainTextLabel.Text = ""
	end
	p1:_updateFooter()
end
function t._displayData(p1) --[[ _displayData | Line: 107 | Upvalues: v10 (copy), v6 (copy), v4 (copy), v7 (copy) ]]
	p1.UserMaid:DoCleaning()
	p1.UsernameLabel.Text = v10.GetUserNameFromUserId(p1.UserId) or "Unknown"
	p1.PlayerLabel.Image = v10.GetUserThumbnail(p1.UserId) or ""
	for v1, v2 in v6.Stats do
		local v3 = p1.StatsFrameDefault:Clone()
		p1.UserMaid:GiveTask(v3)
		v4.GetTagged(v3, "TitleLabel").Text = v1
		local v42 = v4.GetTagged(v3, "StatLabel")
		local v5 = v6.Stats[v1]
		local v62 = p1.Data.Stats[v1] or v5.Default or 0
		v3.LayoutOrder = v2.LayoutOrder or 99
		if v5 then
			v42.Text = v5.Formatter and v7.safeCallNoWarn(v5.Formatter, v62) or tostring(v62)
		else
			v42.Text = "ERR"
		end
		v3.Visible = true
		v3.Parent = p1.StatsFrameDefault.Parent
	end
	p1:_openTab(next(v6.Tabs))
end
function t._incrementZIndex(p1) --[[ _incrementZIndex | Line: 141 | Upvalues: v14 (ref) ]]
	v14 = v14 + 1
	p1.Instance.ZIndex = v14
end
function t.new(p1) --[[ new | Line: 147 | Upvalues: t (copy), v2 (copy), Players (copy), v4 (copy), v5 (copy), v8 (copy), v7 (copy), ModDashboardRemote (copy), v11 (copy), v10 (copy), v6 (copy), v9 (copy), t2 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.UserMaid = v22.Maid:GiveTask(v2.new())
	v22.Instance = p1
	v22.UserId = Players.LocalPlayer.UserId
	v5.new(v4.GetTagged(v22.Instance, "CloseButton"), {
		OnClick = function() --[[ OnClick | Line: 160 | Upvalues: v22 (copy) ]]
			v22.Instance:Destroy()
		end
	})
	v5.new(v4.GetTagged(v22.Instance, "AddButton"), {
		OnClick = function() --[[ OnClick | Line: 167 | Upvalues: v8 (ref) ]]
			v8.CreateTab()
		end
	})
	v22.UsernameLabel = v4.GetTagged(v22.Instance, "UsernameLabel")
	v22.PlayerLabel = v4.GetTagged(v22.Instance, "PlayerLabel")
	v22.StatsFrameDefault = v4.GetTagged(v22.Instance, "StatsFrameDefault")
	v22.StatsFrameDefault.Visible = false
	local v52 = v4.GetTagged(v22.Instance, "ActionsTab")
	local v62 = v4.GetTagged(v22.Instance, "StatsTab")
	local v72 = v4.GetTagged(v22.Instance, "ActionsButtonDefault")
	v72.Visible = false
	v22.NextButton = v4.GetTagged(v22.Instance, "NextButton")
	v22.PreviousButton = v4.GetTagged(v22.Instance, "PreviousButton")
	v22.PageLabel = v4.GetTagged(v22.Instance, "PageLabel")
	v22.MainTextLabel = v4.GetTagged(v22.Instance, "MainTextLabel")
	local v82 = v4.GetTagged(v22.Instance, "ActionsButton")
	local function fetchData(p1) --[[ fetchData | Line: 192 | Upvalues: v22 (copy), v7 (ref), ModDashboardRemote (ref) ]]
		v22.Maid.FetchDataThread = task.spawn(function() --[[ Line: 193 | Upvalues: v22 (ref), p1 (copy), v7 (ref), ModDashboardRemote (ref) ]]
			v22.Init = false
			print("Fetching data for user " .. tostring(p1))
			local v2_2 = v7.safeCall(ModDashboardRemote.InvokeServer, ModDashboardRemote, p1)
			if v2_2 then
				v22.UserId = p1
				v22.Data = v2_2
				v22.Init = true
				v22:_displayData()
			else
				warn("Failed to fetch data for user " .. tostring(p1))
			end
		end)
	end
	local UserId = v22.UserId
	v22.Maid.FetchDataThread = task.spawn(function() --[[ Line: 193 | Upvalues: v22 (copy), UserId (copy), v7 (ref), ModDashboardRemote (ref) ]]
		v22.Init = false
		print("Fetching data for user " .. tostring(UserId))
		local v2_2 = v7.safeCall(ModDashboardRemote.InvokeServer, ModDashboardRemote, UserId)
		if v2_2 then
			v22.UserId = UserId
			v22.Data = v2_2
			v22.Init = true
			v22:_displayData()
		else
			warn("Failed to fetch data for user " .. tostring(UserId))
		end
	end)
	local v92 = v4.GetTagged(v22.Instance, "SearchTextBox")
	local v102 = v11.new(function(p1) --[[ Line: 215 | Upvalues: v92 (copy), v10 (ref), v22 (copy), v7 (ref), ModDashboardRemote (ref) ]]
		if not p1 then
			return
		end
		local Text = v92.Text
		if tonumber(Text) then
			Text = v10.GetUserNameFromUserId((tonumber(Text)))
		end
		if not Text then
			warn("Failed to find user " .. v92.Text)
			return
		end
		local v2 = v10.GetUserIdFromUsername(Text)
		if not v2 then
			warn("Failed to find user " .. v92.Text)
			return
		end
		v92.Text = ""
		v22.Maid.FetchDataThread = task.spawn(function() --[[ Line: 193 | Upvalues: v22 (ref), v2 (copy), v7 (ref), ModDashboardRemote (ref) ]]
			v22.Init = false
			print("Fetching data for user " .. tostring(v2))
			local v2_2 = v7.safeCall(ModDashboardRemote.InvokeServer, ModDashboardRemote, v2)
			if v2_2 then
				v22.UserId = v2
				v22.Data = v2_2
				v22.Init = true
				v22:_displayData()
			else
				warn("Failed to fetch data for user " .. tostring(v2))
			end
		end)
	end)
	v22.Maid:GiveTask(v92.FocusLost:Connect(v102))
	local v112 = v4.GetTagged(v22.Instance, "TabButtonDefault")
	v112.Visible = false
	for v12, v13 in v6.Tabs do
		local v14 = v112:Clone()
		v14.Text = v9.separateWordsInString(v12)
		v5.new(v14, {
			OnClick = function() --[[ OnClick | Line: 251 | Upvalues: v22 (copy), v12 (copy) ]]
				if v22.Init then
					v22:_openTab(v12)
				end
			end
		})
		v14.Visible = true
		v14.Parent = v112.Parent
	end
	v5.new(v82, {
		OnClick = function() --[[ OnClick | Line: 264 | Upvalues: v22 (copy), v52 (copy), v62 (copy) ]]
			if v22.Init then
				v52.Visible = true
				v62.Visible = false
			end
		end
	})
	v5.new(v4.GetTagged(v22.Instance, "StatsButton"), {
		OnClick = function() --[[ OnClick | Line: 276 | Upvalues: v22 (copy), v52 (copy), v62 (copy) ]]
			if v22.Init then
				v52.Visible = false
				v62.Visible = true
			end
		end
	})
	for v16, v17 in v6.Actions do
		local v18 = v72:Clone()
		v18.Text = v16
		v5.new(v18, {
			OnClick = function() --[[ OnClick | Line: 292 | Upvalues: v22 (copy), v17 (copy) ]]
				if v22.Init then
					v17.Run(v22.UserId)
				end
			end
		})
		v18.Visible = true
		v18.Parent = v72.Parent
	end
	v22:_openTab(nil)
	v5.new(v22.NextButton, {
		OnClick = function() --[[ OnClick | Line: 308 | Upvalues: v22 (copy) ]]
			if v22.Init then
				v22:_setPage(v22.CurrentPage + 1)
			end
		end
	})
	v5.new(v22.PreviousButton, {
		OnClick = function() --[[ OnClick | Line: 318 | Upvalues: v22 (copy) ]]
			if v22.Init then
				v22:_setPage(v22.CurrentPage - 1)
			end
		end
	})
	v22.Maid:GiveTask(v4.GetTagged(v22.Instance, "UIDragDetector").DragStart:Connect(function() --[[ Line: 328 | Upvalues: v22 (copy) ]]
		v22:_incrementZIndex()
	end))
	v22:_incrementZIndex()
	t2[v22.Instance] = v22
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 339 | Upvalues: t2 (copy), v3 (copy) ]]
	t2[p1.Instance] = nil
	v3(p1)
end
function t.ActiveFrames() --[[ ActiveFrames | Line: 345 | Upvalues: t2 (copy) ]]
	return t2
end
function t.ActiveFrameCount() --[[ ActiveFrameCount | Line: 350 | Upvalues: v12 (copy), t2 (copy) ]]
	return v12.Count(t2)
end
function t.Init(p1) --[[ Init | Line: 355 | Upvalues: v1 (copy), t (copy) ]]
	v1.new("ModDashboardGui", t):Init()
end
t:Init()
return t