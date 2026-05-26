-- https://lua.expert/
local t = {}
local RunService = game:GetService("RunService")
local CollectionService = game:GetService("CollectionService")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Signal")
local v2 = Sonar("Maid")
RunService:IsStudio()
t.wait = task.wait
function t.bindToProperty(p1, p2, p3, p4) --[[ bindToProperty | Line: 28 ]]
	local v1 = p1:GetPropertyChangedSignal(p2):Connect(function() --[[ Line: 29 | Upvalues: p3 (copy), p1 (copy), p2 (copy) ]]
		p3(p1[p2], p1)
	end)
	if p4 == nil then
		p4 = true
	end
	if not p4 then
		return function() --[[ Line: 41 | Upvalues: v1 (ref) ]]
			if not v1 then
				error("binding already disconnected", 2)
			end
			v1:Disconnect()
			v1 = nil
		end
	end
	task.spawn(p3, p1[p2], p1)
	return function() --[[ Line: 41 | Upvalues: v1 (ref) ]]
		if not v1 then
			error("binding already disconnected", 2)
		end
		v1:Disconnect()
		v1 = nil
	end
end
function t.bindToAttributes(p1, p2, p3) --[[ bindToAttributes | Line: 51 ]]
	local v1 = p1.AttributeChanged:Connect(function(p12) --[[ Line: 52 | Upvalues: p2 (copy), p1 (copy) ]]
		p2(p1:GetAttributes())
	end)
	if p3 == nil then
		p3 = true
	end
	if not p3 then
		return function() --[[ Line: 64 | Upvalues: v1 (ref) ]]
			if not v1 then
				error("binding already disconnected", 2)
			end
			v1:Disconnect()
			v1 = nil
		end
	end
	task.spawn(p2, p1:GetAttributes(), p1)
	return function() --[[ Line: 64 | Upvalues: v1 (ref) ]]
		if not v1 then
			error("binding already disconnected", 2)
		end
		v1:Disconnect()
		v1 = nil
	end
end
function t.bindToAttribute(p1, p2, p3, p4) --[[ bindToAttribute | Line: 75 ]]
	local v1 = p1:GetAttributeChangedSignal(p2):Connect(function() --[[ Line: 76 | Upvalues: p3 (copy), p1 (copy), p2 (copy) ]]
		p3(p1:GetAttribute(p2))
	end)
	if p4 == nil then
		p4 = true
	end
	if not p4 then
		return function() --[[ Line: 88 | Upvalues: v1 (ref) ]]
			if not v1 then
				error("binding already disconnected", 2)
			end
			v1:Disconnect()
			v1 = nil
		end
	end
	task.spawn(p3, p1:GetAttribute(p2), p1)
	return function() --[[ Line: 88 | Upvalues: v1 (ref) ]]
		if not v1 then
			error("binding already disconnected", 2)
		end
		v1:Disconnect()
		v1 = nil
	end
end
function t.addEventCallback(p1, p2, p3, ...) --[[ addEventCallback | Line: 98 ]]
	local v1 = ...
	local function fire(p1) --[[ fire | Line: 101 | Upvalues: p3 (copy), v1 (copy) ]]
		p3(p1, v1)
	end
	p1[p2]:Connect(fire)
	for k, v in pairs(p1:GetChildren()) do
		p3(v, v1)
	end
end
function t.spawn(p1, ...) --[[ spawn | Line: 112 ]]
	task.spawn(p1, ...)
end
function t.spawnLoop(p1, p2, p3) --[[ spawnLoop | Line: 128 ]]
	local v1 = p2 or 0
	local v2 = true
	return task.spawn(function() --[[ Line: 131 | Upvalues: p3 (copy), v1 (ref), p1 (copy), v2 (ref) ]]
		repeat
			if not p3 then
				task.wait(v1)
			end
			local v12, v22 = xpcall(p1, function(p1) --[[ Line: 137 ]]
				return debug.traceback(tostring(p1), 2)
			end, v2)
			if not v12 then
				warn(v22)
			end
			v2 = false
			if not p3 then
				continue
			end
			task.wait(v1)
		until v22 and v22 == "Break"
	end)
end
function t.spawnLoopWithoutYielding(p1, p2) --[[ spawnLoopWithoutYielding | Line: 156 | Upvalues: v1 (copy) ]]
	local v12 = p2 or 0
	task.spawn(function() --[[ Line: 158 | Upvalues: v1 (ref), p1 (copy), v12 (ref) ]]
		local v13 = v1.new()
		v13:Connect(p1)
		local function v2() --[[ startLoop | Line: 161 | Upvalues: v12 (ref), v13 (copy), v2 (copy) ]]
			local v1, v22 = pcall(function() --[[ Line: 162 | Upvalues: v12 (ref), v13 (ref) ]]
				while task.wait(v12) do
					v13:Fire()
				end
			end)
			if not v1 then
				warn("Tick Error:", v22)
			end
			v2()
		end
		local v3, v4 = pcall(function() --[[ Line: 162 | Upvalues: v12 (ref), v13 (copy) ]]
			while task.wait(v12) do
				v13:Fire()
			end
		end)
		if not v3 then
			warn("Tick Error:", v4)
		end
		v2()
	end)
end
function t.bindToTag(p1, p2, p3) --[[ bindToTag | Line: 177 | Upvalues: CollectionService (copy) ]]
	local t = {}
	if p3 then
		t[#t + 1] = CollectionService:GetInstanceRemovedSignal(p1):Connect(p3)
	end
	t[#t + 1] = CollectionService:GetInstanceAddedSignal(p1):Connect(p2)
	for k, v in pairs(CollectionService:GetTagged(p1)) do
		task.spawn(p2, v)
	end
	return t
end
function t.waitForFirstChild(p1) --[[ waitForFirstChild | Line: 192 | Upvalues: RunService (copy) ]]
	if #p1:GetChildren() > 0 then
		return
	end
	repeat
		RunService.Heartbeat:Wait()
	until #p1:GetChildren() > 0
	task.wait()
end
function t.removeAllTags(p1, p2) --[[ removeAllTags | Line: 198 | Upvalues: CollectionService (copy) ]]
	for i, v in ipairs(CollectionService:GetTags(p1)) do
		if v ~= p2 then
			CollectionService:RemoveTag(p1, v)
		end
	end
end
function t.yieldForAttribute(p1, p2) --[[ yieldForAttribute | Line: 205 ]]
	if p1:GetAttribute(p2) == true then
		return
	end
	p1:GetAttributeChangedSignal(p2):Wait()
end
function t.safeCall(p1, ...) --[[ safeCall | Line: 211 ]]
	local v1, v2 = pcall(p1, ...)
	if not v1 then
		warn(debug.traceback(), v2)
	end
	return v1 and v2
end
function t.bindToAddRemove(p1, p2, p3, p4) --[[ bindToAddRemove | Line: 221 ]]
	local t = {}
	local v1 = if type(p1) == "table" and p1 then p1 else { p1 }
	if p2 then
		for v2, v3 in v1 do
			table.insert(t, v3.ChildAdded:Connect(function(p1) --[[ Line: 227 | Upvalues: p2 (copy) ]]
				task.defer(p2, p1)
			end))
			for v4, v5 in v3:GetChildren() do
				task.defer(p2, v5, true)
			end
		end
	end
	if p3 then
		for v6, v7 in v1 do
			table.insert(t, v7.ChildRemoved:Connect(p3))
		end
	end
	if not p4 then
		return
	end
	for v8, v9 in t do
		p4:GiveTask(v9)
	end
end
function t.lightweightBinder(p1, p2, p3) --[[ lightweightBinder | Line: 249 | Upvalues: v2 (copy) ]]
	local t = {}
	local v1 = if type(p1) == "table" and p1 then p1 else { p1 }
	local v22 = v2.new()
	for v3, v4 in v1 do
		table.insert(t, v4.ChildAdded:Connect(function(p1) --[[ Line: 255 | Upvalues: p2 (copy), v22 (copy) ]]
			task.defer(function() --[[ Line: 256 | Upvalues: p2 (ref), p1 (copy), v22 (ref) ]]
				v22[p1] = p2(p1)
			end)
		end))
		for v5, v6 in v4:GetChildren() do
			task.defer(function() --[[ Line: 262 | Upvalues: p2 (copy), v6 (copy), v22 (copy) ]]
				v22[v6] = p2(v6)
			end)
		end
	end
	for v7, v8 in v1 do
		table.insert(t, v8.ChildRemoved:Connect(function(p1) --[[ Line: 270 | Upvalues: v22 (copy) ]]
			task.defer(function() --[[ Line: 271 | Upvalues: v22 (ref), p1 (copy) ]]
				v22[p1] = nil
			end)
		end))
	end
	if p3 then
		for v9, v10 in t do
			v22:GiveTask(v10)
		end
		p3:GiveTask(v22)
	end
	return v22
end
return t