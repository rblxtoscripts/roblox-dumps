-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("Maid")
local t = {}
t.__index = t
t.ClassName = "Signal"
function t.new() --[[ new | Line: 22 | Upvalues: t (copy), v1 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2._maid = v2.Maid
	v2._bindableEvent = Instance.new("BindableEvent")
	v2._argData = nil
	v2._argCount = nil
	return v2
end
function t.Fire(p1, ...) --[[ Fire | Line: 38 ]]
	p1._argData = { ... }
	p1._argCount = select("#", ...)
	p1._bindableEvent:Fire()
end
function t.Connect(p1, p2) --[[ Connect | Line: 49 ]]
	if type(p2) ~= "function" then
		error(("connect(%s)"):format((typeof(p2))), 2)
	end
	return p1._bindableEvent.Event:Connect(function() --[[ Line: 54 | Upvalues: p1 (copy), p2 (copy) ]]
		if p1._argData then
			p2(unpack(p1._argData, 1, p1._argCount))
		else
			p2()
		end
	end)
end
function t.Once(p1, p2) --[[ Once | Line: 66 ]]
	if type(p2) ~= "function" then
		error(("connect(%s)"):format((typeof(p2))), 2)
	end
	return p1._bindableEvent.Event:Once(function() --[[ Line: 71 | Upvalues: p2 (copy), p1 (copy) ]]
		p2(unpack(p1._argData, 1, p1._argCount))
	end)
end
function t.Wait(p1) --[[ Wait | Line: 78 ]]
	p1._bindableEvent.Event:Wait()
	assert(p1._argData, "Missing arg data, likely due to :TweenSize/Position corrupting threadrefs.")
	return unpack(p1._argData, 1, p1._argCount)
end
function t.GiveTask(p1, p2) --[[ GiveTask | Line: 84 ]]
	return p1.Maid:GiveTask(p2)
end
function t.Destroy(p1) --[[ Destroy | Line: 90 ]]
	if p1._bindableEvent then
		p1._bindableEvent:Destroy()
		p1._bindableEvent = nil
	end
	if p1.Maid then
		p1.Maid:Destroy()
	end
	p1._argData = nil
	p1._argCount = nil
end
return t