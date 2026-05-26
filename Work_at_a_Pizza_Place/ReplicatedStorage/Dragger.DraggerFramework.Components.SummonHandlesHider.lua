-- https://lua.expert/
local v2 = require(script.Parent.Parent.Parent.Roact).PureComponent:extend("SummonHandlesHider")
local v3 = 2
local v4 = nil
function v2.didMount(p1) --[[ didMount | Line: 18 ]]
	p1._startTime = os.clock()
end
function v2.willUnmount(p1) --[[ willUnmount | Line: 22 | Upvalues: v3 (ref), v4 (ref) ]]
	v3 = v3 - (os.clock() - p1._startTime)
	if v4 == nil then
		v4 = p1.props.DraggerContext:getSetting("CoreDraggersSummonHintHidden")
	end
	if not (v3 <= 0) or v4 then
		return
	end
	p1.props.DraggerContext:setSetting("CoreDraggersSummonHintHidden", true)
	v4 = true
end
function v2.render(p1) --[[ render | Line: 34 ]]
	return nil
end
function v2.hasSeenEnough(p1) --[[ hasSeenEnough | Line: 38 | Upvalues: v4 (ref), v3 (ref) ]]
	if v4 == nil then
		v4 = p1:getSetting("CoreDraggersSummonHintHidden")
	end
	return v4 or v3 <= 0
end
return v2