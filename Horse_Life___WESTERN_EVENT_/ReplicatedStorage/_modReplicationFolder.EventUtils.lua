-- https://lua.expert/
local t = {}
local RunService = game:GetService("RunService")
local CollectionService = game:GetService("CollectionService")
local ModDashboardLoader = require(game.ReplicatedStorage.ModDashboardLoader)
local v1 = ModDashboardLoader("Signal")
local v2 = ModDashboardLoader("Maid")
local v3 = ModDashboardLoader("safeDestroy")
t.wait = task.wait
function t.addEventCallback(p1, p2, p3, ...) --[[ addEventCallback | Line: 21 ]]
	local v1 = ...
	local function fire(p1) --[[ fire | Line: 24 | Upvalues: p3 (copy), v1 (copy) ]]
		p3(p1, v1)
	end
	p1[p2]:Connect(fire)
	for k, v in pairs(p1:GetChildren()) do
		p3(v, v1)
	end
end
function t.spawn(p1, ...) --[[ spawn | Line: 35 ]]
	task.spawn(p1, ...)
end
function t.spawnLoop(p1, p2, p3) --[[ spawnLoop | Line: 51 ]]
	local v1 = p2 or 0
	local v2 = true
	return task.spawn(function() --[[ Line: 54 | Upvalues: p3 (copy), v1 (ref), p1 (copy), v2 (ref) ]]
		repeat
			if not p3 then
				task.wait(v1)
			end
			local v12, v22 = pcall(p1, v2)
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
function t.spawnLoopWithoutYielding(p1, p2, p3) --[[ spawnLoopWithoutYielding | Line: 77 | Upvalues: v1 (copy) ]]
	local v12 = p2 or 0
	task.spawn(function() --[[ Line: 79 | Upvalues: v1 (ref), p1 (copy), p3 (copy), v12 (ref) ]]
		local v13 = v1.new()
		v13:Connect(p1)
		local function v2() --[[ startLoop | Line: 82 | Upvalues: p3 (ref), v13 (copy), v12 (ref), v2 (copy) ]]
			local v1, v22 = pcall(function() --[[ Line: 83 | Upvalues: p3 (ref), v13 (ref), v12 (ref) ]]
				if p3 then
					while true do
						v13:Fire()
						task.wait(v12)
					end
				else
					while task.wait(v12) do
						v13:Fire()
					end
				end
			end)
			if v1 then
				v2()
				return
			end
			warn("Tick Error:", v22)
			v2()
		end
		local v3, v4 = pcall(function() --[[ Line: 83 | Upvalues: p3 (ref), v13 (copy), v12 (ref) ]]
			if p3 then
				while true do
					v13:Fire()
					task.wait(v12)
				end
			else
				while task.wait(v12) do
					v13:Fire()
				end
			end
		end)
		if v3 then
			v2()
			return
		end
		warn("Tick Error:", v4)
		v2()
	end)
end
function t.getConnectionEvents(p1, ...) --[[ getConnectionEvents | Line: 105 ]]
	if type(p1) == "function" then
		p1 = p1(...)
	end
	if type(p1) ~= "table" then
		return { p1 }
	end
	if p1.ClassName == "Signal" then
		return { p1 }
	else
		return p1
	end
end
function t.bindToTag(p1, p2, p3) --[[ bindToTag | Line: 120 | Upvalues: CollectionService (copy) ]]
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
function t.waitForFirstChild(p1) --[[ waitForFirstChild | Line: 135 | Upvalues: RunService (copy) ]]
	if #p1:GetChildren() > 0 then
		return
	end
	repeat
		RunService.Heartbeat:Wait()
	until #p1:GetChildren() > 0
	task.wait()
end
function t.removeAllTags(p1, p2) --[[ removeAllTags | Line: 141 | Upvalues: CollectionService (copy) ]]
	for i, v in ipairs(CollectionService:GetTags(p1)) do
		if v ~= p2 then
			CollectionService:RemoveTag(p1, v)
		end
	end
end
function t.yieldForAttribute(p1, p2) --[[ yieldForAttribute | Line: 148 ]]
	if p1:GetAttribute(p2) == true then
		return
	end
	p1:GetAttributeChangedSignal(p2):Wait()
end
function t.safeCall(p1, ...) --[[ safeCall | Line: 154 ]]
	local v1, v2 = pcall(p1, ...)
	if not v1 then
		warn(debug.traceback(), v2)
	end
	return v1 and v2
end
function t.safeCallNoWarn(p1, ...) --[[ safeCallNoWarn | Line: 164 ]]
	local v1, v2 = pcall(p1, ...)
	return v1 and v2
end
function t.safeMethod(p1, p2, ...) --[[ safeMethod | Line: 169 ]]
	if not p1[p2] then
		return
	end
	local v1, v2 = pcall(p1[p2], p1, ...)
	if not v1 then
		warn(debug.traceback(), v2)
	end
	return v1 and v2
end
function t.safeDestroy(p1) --[[ safeDestroy | Line: 183 | Upvalues: v3 (copy) ]]
	return v3(p1)
end
function t.waitForReturn(p1) --[[ waitForReturn | Line: 187 ]]
	local v1 = nil
	while not v1 do
		local v2 = p1()
		if v2 then
			v1 = v2
			continue
		end
		task.wait()
		v1 = v2
	end
	return v1
end
function t.pathToChildAdded(p1, p2, p3) --[[ pathToChildAdded | Line: 201 | Upvalues: v2 (copy) ]]
	local v1 = v2.new()
	local v22 = string.split(p2, "/")
	local v3 = p1
	local t = {}
	local function v4(p1) --[[ processNextPart | Line: 208 | Upvalues: v22 (copy), p3 (copy), t (copy), v3 (ref), v4 (copy), v1 (copy) ]]
		if #v22 < p1 then
			if not p3 then
				return
			end
			p3(t[v22[#v22]], t)
		else
			local v12 = v22[p1]
			local v2 = v3:FindFirstChild(v12)
			if v2 then
				t[v12] = v2
				v3 = v2
				v4(p1 + 1)
			else
				v1:GiveTask((v3.ChildAdded:Connect(function(p12) --[[ Line: 228 | Upvalues: v12 (copy), t (ref), v3 (ref), v4 (ref), p1 (copy) ]]
					if p12.Name ~= v12 then
						return
					end
					t[v12] = p12
					v3 = p12
					v4(p1 + 1)
				end)))
			end
		end
	end
	v4(1)
	return v1
end
return t