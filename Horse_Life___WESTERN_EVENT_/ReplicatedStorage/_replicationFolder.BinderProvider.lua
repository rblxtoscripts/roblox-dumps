-- https://lua.expert/
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("Promise")
local t = {
	ClassName = "BinderProvider"
}
t.__index = t
function t.new(p1) --[[ new | Line: 12 | Upvalues: t (copy), v1 (copy) ]]
	local v2 = setmetatable({}, t)
	v2._bindersAddedPromise = v1.new()
	v2._startPromise = v1.new()
	v2._initMethod = if p1 then p1 else error("No initMethod")
	v2._initialized = false
	v2._started = false
	v2._binders = {}
	return v2
end
function t.isBinderProvider(p1) --[[ isBinderProvider | Line: 31 ]]
	return if type(p1) == "table" then p1.ClassName == "BinderProvider" else false
end
function t.PromiseBinder(p1, p2) --[[ PromiseBinder | Line: 35 | Upvalues: v1 (copy) ]]
	if not p1._bindersAddedPromise:IsFulfilled() then
		return p1._bindersAddedPromise:Then(function() --[[ Line: 46 | Upvalues: p1 (copy), p2 (copy), v1 (ref) ]]
			local v12 = p1:Get(p2)
			if v12 then
				return v12
			else
				return v1.rejected()
			end
		end)
	end
	local v12 = p1:Get(p2)
	if v12 then
		return v1.resolved(v12)
	else
		return v1.rejected()
	end
end
function t.Init(p1) --[[ Init | Line: 57 ]]
	assert(not p1._initialized, "Already initialized")
	p1._initialized = true
	p1:_initMethod(p1)
	p1._started = true
	for k, v in pairs(p1._binders) do
		v:Init()
	end
end
function t.PromiseBindersAdded(p1) --[[ PromiseBindersAdded | Line: 74 ]]
	return p1._bindersAddedPromise
end
function t.PromiseBindersStarted(p1) --[[ PromiseBindersStarted | Line: 78 ]]
	return p1._startPromise
end
function t.__index(p1, p2) --[[ __index | Line: 83 | Upvalues: t (copy) ]]
	if t[p2] then
		return t[p2]
	else
		error(("%q Not a valid index"):format((tostring(p2))))
	end
end
function t.Get(p1, p2) --[[ Get | Line: 91 ]]
	assert(if type(p2) == "string" then true else false, "tagName must be a string")
	return rawget(p1, p2)
end
function t.Add(p1, p2) --[[ Add | Line: 96 ]]
	assert(not p1._started, "Already inited")
	assert(not p1:Get(p2:GetTag()), "Binder already exists")
	table.insert(p1._binders, p2)
	p1[p2:GetTag()] = p2
end
return t