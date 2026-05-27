-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("ToolTip")
local v4 = Sonar("TableUtils")
local v5 = Sonar("EventUtils")
function t.new(p1) --[[ new | Line: 70 | Upvalues: t (copy), v1 (copy), v5 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Config = p1
	v2.Instance = p1.Instance
	if not v2.Instance then
		warn("\226\154\160\239\184\143 NotificationToolTip, Instance is required")
		return v2
	end
	v2.OnChanged = {}
	if v2.Config.OnChanged then
		v2.OnChanged = type(v2.Config.OnChanged) == "table" and v2.Config.OnChanged or { v2.Config.OnChanged }
	end
	if v2.Config.Changed then
		v2.Changed = v5.getConnectionEvents(v2.Config.Changed)
		for v4, v52 in v2.Changed do
			v2.Maid:GiveTask(v52:Connect(function() --[[ Line: 90 | Upvalues: v2 (copy) ]]
				v2:Update()
			end))
		end
	end
	v2.Maid:GiveTask(task.defer(function() --[[ Line: 96 | Upvalues: v2 (copy) ]]
		v2:Update()
	end))
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 104 | Upvalues: v2 (copy) ]]
	v2(p1)
end
function t._getToolTipConfig(p1) --[[ _getToolTipConfig | Line: 108 ]]
	if p1.Config.GetToolTip then
		return p1.Config.GetToolTip(p1)
	else
		return p1.Config.ToolTip
	end
end
function t._runCallbacks(p1, p2, p3) --[[ _runCallbacks | Line: 116 ]]
	if not p1[p2] then
		return
	end
	local v2 = if p3 then p3 else {}
	for v3, v4 in p1[p2] do
		v4(p1, v2)
	end
end
function t.Update(p1) --[[ Update | Line: 130 | Upvalues: v3 (copy), v4 (copy) ]]
	if if type(p1.Config.CanShow) == "function" then p1.Config.CanShow(p1) else true then
		p1.Maid.ActiveToolTip = nil
		local v32 = p1:_getToolTipConfig()
		p1.ActiveToolTip = v3.new(v4.Merge(if v32 then v32 else {}, {
			Persistent = true,
			Instance = p1.Instance
		}))
		p1.Maid.ActiveToolTip = p1.ActiveToolTip
	else
		p1.Maid.ActiveToolTip = nil
		p1.ActiveToolTip = nil
	end
	p1:_runCallbacks("OnChanged")
end
return t