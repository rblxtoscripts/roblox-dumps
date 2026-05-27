-- https://lua.expert/
local t = {}
t.__index = t
local SmoothDamp = require(script:WaitForChild("SmoothDamp"))
function t.new(p1, p2) --[[ new | Line: 38 | Upvalues: t (copy), SmoothDamp (copy) ]]
	assert(if typeof(p1) == "Vector3" then true else false, "initialValue should be Vector3")
	assert(if typeof(p2) == "number" then true else false, "smoothTime should be a number")
	local v4 = setmetatable({
		Value = p1,
		Goal = p1,
		SmoothTime = p2
	}, t)
	v4._smoothDamp = SmoothDamp.new()
	return v4
end
function t.Destroy(p1) --[[ Destroy | Line: 56 ]]
	p1._smoothDamp:Destroy()
	setmetatable(p1, nil)
end
function t.Update(p1, p2) --[[ Update | Line: 61 ]]
	if p2 then
		p1.Goal = p2
	else
		p2 = p1.Goal
	end
	local v1 = p1._smoothDamp:Update(p1.Value, p2, p1.SmoothTime)
	p1.Value = v1
	return v1
end
function t.UpdateAngle(p1, p2) --[[ UpdateAngle | Line: 73 ]]
	if p2 then
		p1.Goal = p2
	else
		p2 = p1.Goal
	end
	local v1 = p1._smoothDamp:UpdateAngle(p1.Value, p2, p1.SmoothTime)
	p1.Value = v1
	return v1
end
function t.SetMaxSpeed(p1, p2) --[[ SetMaxSpeed | Line: 85 ]]
	p1._smoothDamp.MaxSpeed = p2
end
function t.GetMaxSpeed(p1) --[[ GetMaxSpeed | Line: 90 ]]
	return p1._smoothDamp.MaxSpeed
end
return t