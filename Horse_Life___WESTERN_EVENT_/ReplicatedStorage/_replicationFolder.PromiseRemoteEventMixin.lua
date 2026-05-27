-- https://lua.expert/
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("promiseChild")
return {
	Add = function(p1, p2, p3) --[[ Add | Line: 10 ]]
		assert(p3)
		assert(not p2.PromiseRemoteEventMixin)
		assert(not p2._remoteEventName)
		p2.PromiseRemoteEvent = p1.PromiseRemoteEvent
		p2._remoteEventName = p3
	end,
	PromiseRemoteEvent = function(p1) --[[ PromiseRemoteEvent | Line: 20 | Upvalues: v1 (copy) ]]
		return p1._maid:GivePromise(v1(p1._obj, p1._remoteEventName))
	end
}