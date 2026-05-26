-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
function t.new(p1) --[[ new | Line: 14 | Upvalues: t (copy), v1 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.AnimationData = p1
	return v2
end
function t.Init(p1, ...) --[[ Init | Line: 24 ]]
	if p1.AnimationData.Init then
		p1.AnimationData.Init(p1, ...)
	end
end
function t.Start(p1, ...) --[[ Start | Line: 33 ]]
	if p1.AnimationData.Start then
		p1.AnimationData.Start(p1, ...)
	end
end
function t.Stop(p1, ...) --[[ Stop | Line: 41 ]]
	if p1.AnimationData.Stop then
		p1.AnimationData.Stop(p1, ...)
	end
end
function t.Wait(p1, ...) --[[ Wait | Line: 49 ]]
	if p1.AnimationData.Wait then
		p1.AnimationData.Wait(p1, ...)
	end
end
function t.CanAdd(p1, ...) --[[ CanAdd | Line: 57 ]]
	if p1.AnimationData.CanAdd then
		return p1.AnimationData.CanAdd(p1, ...)
	else
		return false
	end
end
function t.Add(p1, ...) --[[ Add | Line: 65 ]]
	if p1.AnimationData.Add then
		p1.AnimationData.Add(p1, ...)
	end
end
function t.Destroy(p1, p2) --[[ Destroy | Line: 74 | Upvalues: v2 (copy) ]]
	if p2 then
		v2(p1)
	else
		p1.Cleanup = true
	end
end
return t