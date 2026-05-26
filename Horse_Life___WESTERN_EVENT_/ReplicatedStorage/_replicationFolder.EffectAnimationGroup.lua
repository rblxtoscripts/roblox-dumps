-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("EffectAnimation")
local v2 = Sonar("GuiFrameworkService")
local v3 = Sonar("safeDestroy")
function t._createAnimation(p1, p2) --[[ _createAnimation | Line: 15 | Upvalues: t (copy), v1 (copy) ]]
	if p2.Type == "EffectAnimationGroup" then
		return t.new(p2.EffectAnimations)
	else
		return v1.new(p2)
	end
end
function t._init(p1, p2) --[[ _init | Line: 24 | Upvalues: v1 (copy), v2 (copy), t (copy) ]]
	local t2 = {}
	if p2.Init or p2.Start then
		table.insert(t2, v1.new(p2))
	elseif type(p2) == "string" or p2.Name then
		local v22 = if type(p2) == "string" and p2 then p2 else p2.Name
		table.insert(t2, p1:_createAnimation(v2.GetPresetAnimations()[v22]))
	else
		if p2.Type == "EffectAnimationGroup" then
			table.insert(t2, (t.new(p2.EffectAnimations, p1.Context)))
			return t2
		end
		if #p2 > 0 then
			for v5, v6 in p2 do
				local v7 = p1:_init(v6)
				table.move(v7, 1, #v7, #t2 + 1, t2)
			end
		end
	end
	return t2
end
function t.new(p1, p2) --[[ new | Line: 59 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Context = if p2 then p2 else {}
	v2.EffectAnimations = v2:_init(p1)
	return v2
end
function t.AwaitCleanup(p1) --[[ AwaitCleanup | Line: 71 ]]
	while true do
		local v1 = nil
		for v2, v3 in p1.EffectAnimations do
			if not v3.Cleanup then
				v1 = true
				break
			end
		end
		if not v1 then
			break
		end
		task.wait()
	end
end
function t.Init(p1, ...) --[[ Init | Line: 88 ]]
	for v1, v2 in p1.EffectAnimations do
		v2:Init(p1.Context, ...)
	end
end
function t.Start(p1, ...) --[[ Start | Line: 95 ]]
	for v1, v2 in p1.EffectAnimations do
		v2:Start(p1.Context, ...)
	end
end
function t.Stop(p1, ...) --[[ Stop | Line: 101 ]]
	for v1, v2 in p1.EffectAnimations do
		v2:Stop(p1.Context, ...)
	end
end
function t.Wait(p1, ...) --[[ Wait | Line: 107 ]]
	for v1, v2 in p1.EffectAnimations do
		v2:Wait(p1.Context, ...)
	end
end
function t.CanAdd(p1, ...) --[[ CanAdd | Line: 113 ]]
	for v1, v2 in p1.EffectAnimations do
		if v2:CanAdd(p1.Context, ...) then
			return true
		end
	end
	return false
end
function t.Add(p1, ...) --[[ Add | Line: 122 ]]
	for v1, v2 in p1.EffectAnimations do
		v2:Add(p1.Context, ...)
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 129 | Upvalues: v3 (copy) ]]
	for v1, v2 in p1.EffectAnimations do
		v2:Destroy(true)
	end
	v3(p1)
end
return t