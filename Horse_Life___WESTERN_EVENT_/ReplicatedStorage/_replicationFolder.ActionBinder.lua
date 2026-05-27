-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ContextActionService = game:GetService("ContextActionService")
local v1 = require(ReplicatedStorage.Sonar)("Signal")
local t = {
	ActionBound = v1.new(),
	ActionUnbound = v1.new(),
	_bindings = {}
}
function t.BindAction(p1, p2, p3, p4, p5, p6) --[[ BindAction | Line: 16 | Upvalues: t (copy), ContextActionService (copy) ]]
	if t._bindings[p2] then
		warn(string.format("[ActionBinder] \'%s\' is already bound!", p2))
	else
		local t2 = {
			callback = p3,
			inputTable = p4,
			actionName = p2,
			createTouchButton = p6,
			priority = p5 or 0
		}
		ContextActionService:BindActionAtPriority(p2, p3, p6, p5 or 0, table.unpack(p4))
		t._bindings[p2] = t2
		t.ActionBound:Fire(t2)
	end
end
function t.UnbindAction(p1, p2) --[[ UnbindAction | Line: 36 | Upvalues: t (copy), ContextActionService (copy) ]]
	local v1 = t._bindings[p2]
	if v1 then
		t._bindings[p2] = nil
		t.ActionUnbound:Fire(v1)
	end
	ContextActionService:UnbindAction(p2)
end
return t