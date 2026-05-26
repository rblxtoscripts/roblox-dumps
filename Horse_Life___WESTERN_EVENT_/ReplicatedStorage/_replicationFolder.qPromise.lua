-- https://lua.expert/
local RunService = game:GetService("RunService")
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("deferred")
local function isPromise(p1) --[[ isPromise | Line: 11 ]]
	return if type(p1) == "table" then p1.ClassName == "Promise" else false
end
local v2 = nil
local v3 = nil
local t = {
	ClassName = "Promise"
}
t.__index = t
t.isPromise = isPromise
function t.new(p1) --[[ new | Line: 31 | Upvalues: t (copy) ]]
	local v2 = setmetatable({
		_unconsumedException = true,
		_source = "",
		_pendingExecuteList = {}
	}, t)
	if type(p1) == "function" then
		p1(v2:_getResolveReject())
	end
	return v2
end
function t.defer(p1) --[[ defer | Line: 46 | Upvalues: t (copy), v1 (copy) ]]
	local v12 = t.new()
	v1(p1, v12:_getResolveReject())
	return v12
end
function t.resolved(...) --[[ resolved | Line: 55 | Upvalues: v3 (ref), t (copy) ]]
	local v1 = select("#", ...)
	if v1 == 0 then
		return v3
	end
	local v2
	if v1 ~= 1 then
		v2 = t.new()
		v2:Resolve(...)
		return v2
	end
	local v32 = ...
	if not (if type(v32) == "table" then v32.ClassName == "Promise" else false) then
		v2 = t.new()
		v2:Resolve(...)
		return v2
	end
	local v5 = ...
	if v5._pendingExecuteList then
		v2 = t.new()
		v2:Resolve(...)
		return v2
	else
		return v5
	end
end
function t.rejected(...) --[[ rejected | Line: 74 | Upvalues: v2 (ref), t (copy) ]]
	local v1 = select("#", ...)
	if v1 == 0 then
		return v2
	else
		local v22 = t.new()
		v22:_reject({ ... }, v1)
		return v22
	end
end
function t.IsPending(p1) --[[ IsPending | Line: 88 ]]
	return p1._pendingExecuteList ~= nil
end
function t.IsFulfilled(p1) --[[ IsFulfilled | Line: 92 ]]
	return p1._fulfilled ~= nil
end
function t.IsRejected(p1) --[[ IsRejected | Line: 96 ]]
	return p1._rejected ~= nil
end
function t.Wait(p1) --[[ Wait | Line: 101 ]]
	if p1._fulfilled then
		return unpack(p1._fulfilled, 1, p1._valuesLength)
	end
	if p1._rejected then
		local v1 = error
		return v1(tostring(p1._rejected[1]), 2)
	end
	local v3 = Instance.new("BindableEvent")
	p1:Then(function() --[[ Line: 109 | Upvalues: v3 (copy) ]]
		v3:Fire()
	end, function() --[[ Line: 111 | Upvalues: v3 (copy) ]]
		v3:Fire()
	end)
	v3.Event:Wait()
	v3:Destroy()
	if p1._rejected then
		local v4 = error
		return v4(tostring(p1._rejected[1]), 2)
	else
		return unpack(p1._fulfilled, 1, p1._valuesLength)
	end
end
function t.Yield(p1) --[[ Yield | Line: 126 ]]
	if p1._fulfilled then
		return true, unpack(p1._fulfilled, 1, p1._valuesLength)
	end
	if p1._rejected then
		return false, unpack(p1._rejected, 1, p1._valuesLength)
	end
	local v1 = Instance.new("BindableEvent")
	p1:Then(function() --[[ Line: 134 | Upvalues: v1 (copy) ]]
		v1:Fire()
	end, function() --[[ Line: 136 | Upvalues: v1 (copy) ]]
		v1:Fire()
	end)
	v1.Event:Wait()
	v1:Destroy()
	if p1._fulfilled then
		return true, unpack(p1._fulfilled, 1, p1._valuesLength)
	end
	if p1._rejected then
		return false, unpack(p1._rejected, 1, p1._valuesLength)
	end
end
function t.Resolve(p1, ...) --[[ Resolve | Line: 155 ]]
	if not p1._pendingExecuteList then
		return
	end
	local v1 = select("#", ...)
	if v1 == 0 then
		p1:_fulfill({}, 0)
		return
	end
	if p1 == ... then
		p1:Reject("TypeError: Resolved to self")
		return
	end
	local v2 = ...
	if if type(v2) == "table" then v2.ClassName == "Promise" else false then
		if v1 > 1 then
			warn((("When resolving a promise, extra arguments are discarded! See:\n\n%s"):format(p1._source)))
		end
		local v5 = ...
		if v5._pendingExecuteList then
			v5._unconsumedException = false
			v5._pendingExecuteList[#v5._pendingExecuteList + 1] = { function(...) --[[ Line: 176 | Upvalues: p1 (copy) ]]
					p1:Resolve(...)
				end, function(...) --[[ Line: 179 | Upvalues: p1 (copy) ]]
					if not p1._pendingExecuteList then
						return
					end
					p1:_reject({ ... }, select("#", ...))
				end, nil }
			return
		end
		if v5._rejected then
			v5._unconsumedException = false
			p1:_reject(v5._rejected, v5._valuesLength)
			return
		end
		if v5._fulfilled then
			p1:_fulfill(v5._fulfilled, v5._valuesLength)
		else
			error("[Promise.Resolve] - Bad promise2 state")
		end
	else
		if type(...) ~= "function" then
			p1:_fulfill({ ... }, v1)
			return
		end
		if v1 > 1 then
			warn((("When resolving a function, extra arguments are discarded! See:\n\n%s"):format(p1._source)))
		end
		({ ... })(p1:_getResolveReject())
	end
end
function t._fulfill(p1, p2, p3) --[[ _fulfill | Line: 215 ]]
	if not p1._pendingExecuteList then
		return
	end
	p1._fulfilled = p2
	p1._valuesLength = p3
	local _pendingExecuteList = p1._pendingExecuteList
	p1._pendingExecuteList = nil
	for k, v in pairs(_pendingExecuteList) do
		p1:_executeThen(unpack(v))
	end
end
function t.Reject(p1, ...) --[[ Reject | Line: 233 ]]
	p1:_reject({ ... }, select("#", ...))
end
function t._reject(p1, p2, p3) --[[ _reject | Line: 237 | Upvalues: RunService (copy) ]]
	if not p1._pendingExecuteList then
		return
	end
	p1._rejected = p2
	p1._valuesLength = p3
	local _pendingExecuteList = p1._pendingExecuteList
	p1._pendingExecuteList = nil
	for k, v in pairs(_pendingExecuteList) do
		p1:_executeThen(unpack(v))
	end
	if not (p1._unconsumedException and p1._valuesLength > 0) then
		return
	end
	coroutine.resume(coroutine.create(function() --[[ Line: 253 | Upvalues: RunService (ref), p1 (copy) ]]
		RunService.Heartbeat:Wait()
		if not p1._unconsumedException then
			return
		end
		local v1 = warn
		v1(("[Promise] - Uncaught exception in promise: %q"):format((tostring(p1._rejected[1]))))
	end))
end
function t.Then(p1, p2, p3) --[[ Then | Line: 283 | Upvalues: t (copy) ]]
	if type(p3) == "function" then
		p1._unconsumedException = false
	end
	if p1._pendingExecuteList then
		local v1 = t.new()
		p1._pendingExecuteList[#p1._pendingExecuteList + 1] = { p2, p3, v1 }
		return v1
	else
		return p1:_executeThen(p2, p3, nil)
	end
end
function t.Tap(p1, p2, p3) --[[ Tap | Line: 300 ]]
	local v1 = p1:Then(p2, p3)
	if v1 == p1 then
		return v1
	end
	if v1._fulfilled then
		return p1
	end
	if v1._rejected then
		return p1
	end
	if v1._pendingExecuteList then
		local function returnSelf() --[[ returnSelf | Line: 316 | Upvalues: p1 (copy) ]]
			return p1
		end
		return v1:Then(returnSelf, returnSelf)
	else
		error("Bad result state")
	end
end
function t.Finally(p1, p2) --[[ Finally | Line: 326 ]]
	return p1:Then(p2, p2)
end
function t.Catch(p1, p2) --[[ Catch | Line: 332 ]]
	return p1:Then(nil, p2)
end
function t.Destroy(p1) --[[ Destroy | Line: 339 ]]
	p1:_reject({}, 0)
end
function t.GetResults(p1) --[[ GetResults | Line: 343 ]]
	if p1._rejected then
		return false, unpack(p1._rejected, 1, p1._valuesLength)
	end
	if p1._fulfilled then
		return true, unpack(p1._fulfilled, 1, p1._valuesLength)
	else
		error("Still pending")
	end
end
function t._getResolveReject(p1) --[[ _getResolveReject | Line: 353 ]]
	return function(...) --[[ Line: 354 | Upvalues: p1 (copy) ]]
		p1:Resolve(...)
	end, function(...) --[[ Line: 356 | Upvalues: p1 (copy) ]]
		p1:_reject({ ... }, select("#", ...))
	end
end
function t._executeThen(p1, p2, p3, p4) --[[ _executeThen | Line: 362 | Upvalues: v3 (ref), t (copy) ]]
	if p1._fulfilled then
		if type(p2) == "function" then
			if p4 then
				p4:Resolve(p2(unpack(p1._fulfilled, 1, p1._valuesLength)))
				return p4
			end
			local v1 = table.pack(p2(unpack(p1._fulfilled, 1, p1._valuesLength)))
			if v1.n == 0 then
				return v3
			end
			if v1.n == 1 then
				local v2 = v1[1]
				if if type(v2) == "table" then v2.ClassName == "Promise" else false then
					return v1[1]
				end
			end
			local v4 = t.new()
			v4:Resolve(table.unpack(v1, 1, v1.n))
			return v4
		elseif p4 then
			p4:_fulfill(p1._fulfilled, p1._valuesLength)
			return p4
		else
			return p1
		end
	else
		if not p1._rejected then
			error("Internal error: still pending")
		end
		if type(p3) == "function" then
			if p4 then
				p4:Resolve(p3(unpack(p1._rejected, 1, p1._valuesLength)))
				return p4
			end
			local v5 = table.pack(p3(unpack(p1._rejected, 1, p1._valuesLength)))
			if v5.n == 0 then
				return v3
			end
			if v5.n == 1 then
				local v6 = v5[1]
				if if type(v6) == "table" then v6.ClassName == "Promise" else false then
					return v5[1]
				end
			end
			local v8 = t.new()
			v8:Resolve(table.unpack(v5, 1, v5.n))
			return v8
		elseif p4 then
			p4:_reject(p1._rejected, p1._valuesLength)
			return p4
		else
			return p1
		end
	end
end
v3 = t.new()
v3:_fulfill({}, 0)
v2 = t.new()
v2:_reject({}, 0)
return t