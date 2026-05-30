-- https://lua.expert/
local t = {}
t.__index = t
local LemonSignal = require(script.Parent.LemonSignal)
function t.new(p1) --[[ new | Line: 8 | Upvalues: LemonSignal (copy), t (copy) ]]
	local v2 = setmetatable({
		signal = LemonSignal.new()
	}, t)
	if p1 then
		v2.connections = 0
		v2.connectionsChanged = LemonSignal.new()
	end
	return v2
end
function t.Connect(p1, p2) --[[ Connect | Line: 19 ]]
	if p1.connectionsChanged then
		p1.connections = p1.connections + 1
		p1.connectionsChanged:Fire(1)
	end
	return p1.signal:Connect(p2)
end
function t.Once(p1, p2) --[[ Once | Line: 27 ]]
	return p1.signal:Once(p2)
end
function t.DisconnectAll(p1) --[[ DisconnectAll | Line: 31 ]]
	if p1.connectionsChanged then
		p1.connectionsChanged:Fire(-p1.connections)
		p1.connections = 0
	end
	p1.signal:DisconnectAll()
end
function t.Destroy(p1) --[[ Destroy | Line: 39 ]]
	p1:DisconnectAll()
	if p1.connectionsChanged then
		p1.connectionsChanged:Destroy()
	end
	p1.signal:Destroy()
	table.clear(p1)
	setmetatable(p1, nil)
end
function t.Wait(p1) --[[ Wait | Line: 49 ]]
	return p1.signal:Wait()
end
function t.Fire(p1, ...) --[[ Fire | Line: 53 ]]
	p1.signal:Fire(...)
end
t.destroy = t.Destroy
return t