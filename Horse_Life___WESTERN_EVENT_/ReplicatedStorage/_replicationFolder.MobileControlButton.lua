-- https://lua.expert/
local t = {}
t.__index = t
t.SubContexts = { "GuiObject" }
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("Maid")
local v4 = Sonar("EventUtils")
local v5 = Sonar("Signal")
function t.new(p1) --[[ new | Line: 16 | Upvalues: t (copy), v3 (copy), v5 (copy), v1 (copy), v4 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v3.new()
	v2.Config = p1
	v2.ActionChangedSignal = v5.new()
	v2.Maid:GiveTask(v2.ActionChangedSignal)
	v2.GuiObject = v1.AddComponent("GuiObject", p1)
	v2.Maid:GiveTask(v2.GuiObject)
	v2.Button = v2.GuiObject.Button
	v2.ActionNameToButtonActionMap = {
		OnDown = v2.Config.InputBegan,
		OnUp = v2.Config.InputEnded
	}
	for v32, v42 in v2.ActionNameToButtonActionMap do
		v2.Button:RegisterAction(v32, function() --[[ Line: 36 | Upvalues: v2 (copy), v42 (copy) ]]
			v2.ActionChangedSignal:Fire()
			if not v42 then
				return
			end
			v42(v2)
		end)
	end
	v2.StateChanged = v4.getConnectionEvents(v2.Config.StateChanged)
	for v52, v6 in v2.StateChanged do
		if v6 == "ActionChanged" then
			v6 = v2.ActionChangedSignal
		end
		v2.Maid:GiveTask(v6:Connect(function(...) --[[ Line: 50 | Upvalues: v2 (copy) ]]
			v2:UpdateState(...)
		end))
	end
	v2.Instance = v2.GuiObject.Instance
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 61 | Upvalues: v2 (copy) ]]
	v2(p1)
end
function t.UpdateState(p1, ...) --[[ UpdateState | Line: 65 ]]
	if not p1.Config.GetState then
		p1.GuiObject:Select()
		p1.Maid.FlashState = task.delay(0.15, function() --[[ Line: 68 | Upvalues: p1 (copy) ]]
			p1.GuiObject:Deselect()
		end)
		return
	end
	p1.CurrentState = p1.Config.GetState(p1, ...)
	if p1.CurrentState then
		p1.GuiObject:Select()
	else
		p1.GuiObject:Deselect()
	end
end
function t.GetState(p1) --[[ GetState | Line: 83 ]]
	return p1.CurrentState
end
return t