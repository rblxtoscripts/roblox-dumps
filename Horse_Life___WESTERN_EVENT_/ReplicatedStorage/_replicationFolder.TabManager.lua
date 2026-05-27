-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local t2 = {}
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("Constants")
local function runCallbacksForFrame(p1, p2, p3) --[[ runCallbacksForFrame | Line: 16 ]]
	local v2 = if p3 then p3 else {}
	for k, v in pairs(p2) do
		v(table.unpack(v2))
	end
end
function t.AddTab(p1, p2) --[[ AddTab | Line: 27 | Upvalues: t2 (copy) ]]
	local ParentFrame = p2.ParentFrame
	assert(ParentFrame, "No Parent frame found for " .. p1.Name)
	if not t2[ParentFrame] then
		t2[ParentFrame] = {}
	end
	if t2[ParentFrame][p1] then
		warn(p1, ParentFrame, "has already been added!")
	else
		t2[ParentFrame][p1] = {
			ParentFrame = ParentFrame,
			Button = p2.Button,
			CanOpen = p2.CanOpen
		}
		return true
	end
end
function t.AddStateCallback(p1, p2, p3) --[[ AddStateCallback | Line: 51 | Upvalues: t (copy) ]]
	local v1 = t.getTabFromInstance(p1)
	if not v1 then
		warn("No Frame can be found for", p1)
		return
	end
	if not v1[p2] then
		v1[p2] = {}
	end
	v1[p2][#v1[p2] + 1] = p3
end
function t.OpenTab(p1, p2) --[[ OpenTab | Line: 66 | Upvalues: t (copy), v1 (copy), runCallbacksForFrame (copy) ]]
	local v12 = t.getTabFromInstance(p1)
	if not v12 then
		warn(p1:GetFullName())
	end
	if v12.CanOpen and not v12.CanOpen(p2) then
		return
	end
	if v12.Button then
		v12.Button:SetAttribute(v1.TabSelectedAttribute, true)
	end
	local IsOpen = v12.IsOpen
	v12.IsOpen = true
	if not IsOpen and v12.BeforeOpen then
		runCallbacksForFrame(p1, v12.BeforeOpen, p2)
	end
	p1.Visible = true
	t.CloseAllTabs(v12.ParentFrame, p1)
	if IsOpen or not v12.OnOpen then
		return
	end
	runCallbacksForFrame(p1, v12.OnOpen, p2)
end
function t.CloseTab(p1) --[[ CloseTab | Line: 102 | Upvalues: t (copy), v1 (copy), runCallbacksForFrame (copy) ]]
	local v12 = t.getTabFromInstance(p1)
	if v12.Button then
		v12.Button:SetAttribute(v1.TabSelectedAttribute, false)
	end
	p1.Visible = false
	local isIsOpen = v12.IsOpen == true
	v12.IsOpen = false
	if not (isIsOpen and v12.OnClose) then
		return
	end
	runCallbacksForFrame(p1, v12.OnClose)
end
function t.CloseAllTabs(p1, p2) --[[ CloseAllTabs | Line: 122 | Upvalues: t2 (copy), t (copy) ]]
	for k, v in pairs(t2[p1]) do
		if k ~= p2 then
			t.CloseTab(k)
		end
	end
end
function t.CleanContents(p1) --[[ CleanContents | Line: 130 | Upvalues: t (copy) ]]
	local v1 = t.getTabFromInstance(p1)
	if v1 then
		v1.ContentsLoaded = false
		v1.IsOpen = false
	end
end
function t.IsTabOpen(p1) --[[ IsTabOpen | Line: 139 | Upvalues: t (copy) ]]
	local v1 = t.getTabFromInstance(p1)
	if v1 then
		return v1.IsOpen
	end
end
function t.getFramesFromTab(p1) --[[ getFramesFromTab | Line: 147 | Upvalues: t2 (copy) ]]
	return t2[p1]
end
function t.getTabFromInstance(p1) --[[ getTabFromInstance | Line: 152 | Upvalues: t2 (copy) ]]
	for k, v in pairs(t2) do
		for k2, v2 in pairs(v) do
			if k2 == p1 then
				return v2
			end
		end
	end
end
function t.getOpenedTab(p1) --[[ getOpenedTab | Line: 162 | Upvalues: t2 (copy) ]]
	for k, v in pairs(t2[p1]) do
		if v.IsOpen then
			return k
		end
	end
end
return t