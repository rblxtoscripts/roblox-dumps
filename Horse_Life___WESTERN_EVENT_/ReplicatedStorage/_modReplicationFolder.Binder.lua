-- https://lua.expert/
local ModDashboardLoader = require(game:GetService("ReplicatedStorage"):WaitForChild("ModDashboardLoader"))
local RunService = game:GetService("RunService")
local CollectionService = game:GetService("CollectionService")
local v1 = ModDashboardLoader("Maid")
local v2 = ModDashboardLoader("Signal")
local t = {
	Model = true
}
local t2 = {}
t2.__index = t2
t2.ClassName = "Binder"
function t2.new(p1, p2) --[[ new | Line: 21 | Upvalues: t2 (copy), v1 (copy) ]]
	local v2 = setmetatable({}, t2)
	v2._maid = v1.new()
	v2._tagName = if p1 then p1 else error("Bad argument \'tagName\', expected string")
	v2._constructor = if p2 then p2 else error("Bad argument \'constructor\', expected table or function")
	v2._instToClass = {}
	v2._allClassSet = {}
	v2._pendingInstSet = {}
	v2._listeners = {}
	return v2
end
function t2.isBinder(p1) --[[ isBinder | Line: 38 ]]
	return if type(p1) == "table" then p1.ClassName == "Binder" else false
end
function t2.Init(p1) --[[ Init | Line: 42 | Upvalues: CollectionService (copy) ]]
	if p1._loaded then
		return
	end
	p1._loaded = true
	local v1 = Instance.new("BindableEvent")
	for k, v in pairs(CollectionService:GetTagged(p1._tagName)) do
		local v2 = v1.Event:Connect(function() --[[ Line: 50 | Upvalues: p1 (copy), v (copy) ]]
			p1:_waitForStreamedObject(v, function() --[[ Line: 51 | Upvalues: p1 (ref), v (ref) ]]
				p1:_add(v)
			end)
		end)
		v1:Fire()
		v2:Disconnect()
	end
	v1:Destroy()
	p1._maid:GiveTask(CollectionService:GetInstanceAddedSignal(p1._tagName):Connect(function(p12) --[[ Line: 62 | Upvalues: p1 (copy) ]]
		p1:_waitForStreamedObject(p12, function() --[[ Line: 63 | Upvalues: p1 (ref), p12 (copy) ]]
			p1:_add(p12)
		end)
	end))
	p1._maid:GiveTask(CollectionService:GetInstanceRemovedSignal(p1._tagName):Connect(function(p12) --[[ Line: 67 | Upvalues: p1 (copy) ]]
		p1:_remove(p12)
	end))
end
function t2.GetConstructor(p1) --[[ GetConstructor | Line: 72 ]]
	return p1._constructor
end
function t2.ObserveInstance(p1, p2, p3) --[[ ObserveInstance | Line: 77 ]]
	p1._listeners[p2] = p1._listeners[p2] or {}
	p1._listeners[p2][p3] = true
	return function() --[[ Line: 81 | Upvalues: p1 (copy), p2 (copy), p3 (copy) ]]
		if not p1._listeners[p2] then
			return
		end
		p1._listeners[p2][p3] = nil
		if next(p1._listeners[p2]) then
			return
		end
		p1._listeners[p2] = nil
	end
end
function t2._hasBasePart(p1, p2) --[[ _hasBasePart | Line: 93 ]]
	if p2:IsA("Model") and p2.PrimaryPart then
		return p2.PrimaryPart
	end
	if p2:IsA("GuiObject") then
		return true
	else
		return p2:FindFirstChildWhichIsA("BasePart")
	end
end
function t2._waitForStreamedObject(p1, p2, p3) --[[ _waitForStreamedObject | Line: 103 | Upvalues: t (copy) ]]
	if not t[p2.ClassName] then
		p3()
		return
	end
	if p1:_hasBasePart(p2) then
		p3()
	else
		local v1 = nil
		v1 = p2.ChildAdded:Connect(function() --[[ Line: 109 | Upvalues: p1 (copy), p2 (copy), v1 (ref), p3 (copy) ]]
			if p1:_hasBasePart(p2) then
				v1:Disconnect()
				p3()
			end
		end)
		p1._maid:GiveTask(v1)
	end
end
function t2.GetClassAddedSignal(p1) --[[ GetClassAddedSignal | Line: 122 | Upvalues: v2 (copy) ]]
	if not p1._classAddedSignal then
		p1._classAddedSignal = v2.new()
		p1._maid:GiveTask(p1._classAddedSignal)
	end
	return p1._classAddedSignal
end
function t2.GetClassRemovingSignal(p1) --[[ GetClassRemovingSignal | Line: 132 | Upvalues: v2 (copy) ]]
	if not p1._classRemovingSignal then
		p1._classRemovingSignal = v2.new()
		p1._maid:GiveTask(p1._classRemovingSignal)
	end
	return p1._classRemovingSignal
end
function t2.GetTag(p1) --[[ GetTag | Line: 143 ]]
	return p1._tagName
end
function t2.GetAll(p1) --[[ GetAll | Line: 147 ]]
	local t = {}
	for k, v in pairs(p1._allClassSet) do
		t[#t + 1] = k
	end
	return t
end
function t2.GetAllSet(p1) --[[ GetAllSet | Line: 156 ]]
	return p1._allClassSet
end
function t2.BindClient(p1, p2) --[[ BindClient | Line: 162 | Upvalues: RunService (copy), CollectionService (copy) ]]
	if not RunService:IsClient() then
		warn(("[Binder.BindClient] - Bindings \'%s\' done on the server! Will be replicated!"):format(p1._tagName))
	end
	CollectionService:AddTag(p2, p1._tagName)
	return p1:Get(p2)
end
function t2.Bind(p1, p2) --[[ Bind | Line: 172 | Upvalues: RunService (copy), CollectionService (copy) ]]
	if RunService:IsClient() then
		warn(("[Binder.Bind] - Bindings \'%s\' done on the client! Will be disrupted upon server replication!"):format(p1._tagName))
	end
	CollectionService:AddTag(p2, p1._tagName)
	return p1:Get(p2)
end
function t2.Unbind(p1, p2) --[[ Unbind | Line: 182 | Upvalues: RunService (copy), CollectionService (copy) ]]
	assert(if typeof(p2) == "Instance" then true else false)
	if RunService:IsClient() then
		warn(("[Binder.Bind] - Unbinding \'%s\' done on the client! Might be disrupted upon server replication!"):format(p1._tagName))
	end
	CollectionService:RemoveTag(p2, p1._tagName)
end
function t2.UnbindClient(p1, p2) --[[ UnbindClient | Line: 193 | Upvalues: CollectionService (copy) ]]
	assert(if typeof(p2) == "Instance" then true else false)
	CollectionService:RemoveTag(p2, p1._tagName)
end
function t2.Get(p1, p2) --[[ Get | Line: 198 ]]
	assert(if typeof(p2) == "Instance" then true else false, "Argument \'inst\' is not an Instance")
	return p1._instToClass[p2]
end
function t2._add(p1, p2) --[[ _add | Line: 203 ]]
	assert(if typeof(p2) == "Instance" then true else false, "Argument \'inst\' is not an Instance")
	if p1._instToClass[p2] then
		return
	end
	if p1._pendingInstSet[p2] == true then
		warn("[Binder._add] - Reentered add. Still loading, probably caused by error in constructor.")
		return
	end
	p1._pendingInstSet[p2] = true
	local v2 = if type(p1._constructor) == "function" then p1._constructor(p2) elseif p1._constructor.Create then p1._constructor:Create(p2) else p1._constructor.new(p2)
	if p1._pendingInstSet[p2] == true then
		p1._pendingInstSet[p2] = nil
		if type(v2) ~= "table" then
			warn(("[Binder._add] - Bad class constructed for tag %q"):format(p1._tagName))
		else
			local Destroy = v2.Destroy
			if type(Destroy) ~= "function" then
				warn(("[Binder._add] - Bad class constructed for tag %q"):format(p1._tagName))
			else
				assert(p1._instToClass[p2] == nil, "Overwrote")
				p1._allClassSet[v2] = true
				p1._instToClass[p2] = v2
				local v4 = p1._listeners[p2]
				if v4 then
					local v5 = Instance.new("BindableEvent")
					for k, v in pairs(v4) do
						local v6 = v5.Event:Connect(function() --[[ Line: 255 | Upvalues: k (copy), v2 (ref) ]]
							k(v2)
						end)
						v5:Fire()
						v6:Disconnect()
					end
					v5:Destroy()
				end
				if p1._classAddedSignal then
					p1._classAddedSignal:Fire(v2, p2)
				end
			end
		end
	else
		warn(("[Binder._add] - Failed to load instance %q of %q, removed while loading!"):format(p2:GetFullName(), (tostring(type(p1._constructor) == "table" and p1._constructor.ClassName or p1._constructor))))
	end
end
function t2._remove(p1, p2) --[[ _remove | Line: 271 ]]
	p1._pendingInstSet[p2] = nil
	local v1 = p1._instToClass[p2]
	if v1 == nil then
		return
	end
	if p1._classRemovingSignal then
		p1._classRemovingSignal:Fire(v1, p2)
	end
	p1._instToClass[p2] = nil
	p1._allClassSet[v1] = nil
	local v2 = p1._listeners[p2]
	if v2 then
		local v3 = Instance.new("BindableEvent")
		for k, v in pairs(v2) do
			local v4 = v3.Event:Connect(function() --[[ Line: 294 | Upvalues: k (copy) ]]
				k(nil)
			end)
			v3:Fire()
			v4:Disconnect()
		end
		v3:Destroy()
	end
	if v1.Destroy then
		v1:Destroy()
	end
end
function t2.Destroy(p1) --[[ Destroy | Line: 314 ]]
	local v1, v2 = next(p1._instToClass)
	while v2 ~= nil do
		p1:_remove(v1)
		assert(p1._instToClass[v1] == nil, "Failed to remove")
		local v4, v5 = next(p1._instToClass)
		v2, v1 = v5, v4
	end
	p1._maid:DoCleaning()
end
return t2