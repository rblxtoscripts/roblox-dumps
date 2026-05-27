-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("EffectAnimationGroup")
local v4 = Sonar("TableUtils")
local v5 = Sonar("EventUtils")
function t.new(p1) --[[ new | Line: 15 | Upvalues: t (copy), v1 (copy), v3 (copy), v4 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.AllAnimationQueues = p1.AllAnimationQueues
	v2.AnimationQueue = p1.AnimationQueue
	v2.SequenceData = p1.Sequence
	v2.States = {}
	if not p1.Animation then
		warn("\226\154\160\239\184\143 ItemStream, No animation found for", p1)
	end
	v2.EffectAnimationGroup = v3.new(p1.Animation, v4.MergeOriginal(p1, {
		Sequence = v2
	}))
	v2.Maid:GiveTask(v2.EffectAnimationGroup)
	v2.Maid:GiveTask(function() --[[ Line: 37 | Upvalues: v2 (copy) ]]
		v2:_removeFromPausingAnimations()
	end)
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 44 | Upvalues: v2 (copy) ]]
	v2(p1)
end
function t._removeFromPausingAnimations(p1) --[[ _removeFromPausingAnimations | Line: 48 ]]
	for v1, v2 in p1.AllAnimationQueues do
		v2.PausingAnimations[p1] = nil
	end
	p1:ResumeQueues()
end
function t.GetState(p1, p2) --[[ GetState | Line: 57 ]]
	return p1.States[p2]
end
function t.HasAnotherInQueue(p1) --[[ HasAnotherInQueue | Line: 61 ]]
	for v1, v2 in p1.AnimationQueue.Queue do
		if v2 ~= p1 then
			return true
		end
	end
	return false
end
function t.GetTotalInQueue(p1) --[[ GetTotalInQueue | Line: 75 ]]
	return #p1.AnimationQueue.Queue
end
function t.StopOtherQueues(p1) --[[ StopOtherQueues | Line: 79 | Upvalues: v5 (copy) ]]
	p1:PauseOtherQueues()
	for v1, v2 in p1.AllAnimationQueues do
		if v2 ~= p1.AnimationQueue then
			for v3, v4 in v2.Queue do
				if v4._started then
					v5.safeMethod(v4, "AwaitInit")
					v5.safeMethod(v4, "Stop")
				end
				v5.safeMethod(v4, "WaitForAnimationToStop")
			end
		end
	end
end
function t.WaitForQueuesToStop(p1) --[[ WaitForQueuesToStop | Line: 97 | Upvalues: v5 (copy) ]]
	for v1, v2 in p1.AllAnimationQueues do
		if v2 ~= p1.AnimationQueue then
			for v3, v4 in v2.Queue do
				v5.safeMethod(v4, "WaitForAnimationToStop")
			end
		end
	end
end
function t.WaitForAnimationToStop(p1) --[[ WaitForAnimationToStop | Line: 110 ]]
	while true do
		if p1._started then
			if p1.States.Stopped then
				break
			end
		elseif not p1._started then
			break
		end
		task.wait()
	end
end
function t.PauseOtherQueues(p1) --[[ PauseOtherQueues | Line: 125 ]]
	for v1, v2 in p1.AllAnimationQueues do
		if v2 ~= p1.AnimationQueue then
			v2.PausingAnimations[p1] = true
			v2.Paused = true
		end
	end
end
function t.ResumeQueues(p1) --[[ ResumeQueues | Line: 137 ]]
	for v1, v2 in p1.AllAnimationQueues do
		v2.PausingAnimations[p1] = nil
		v2.Paused = next(v2.PausingAnimations)
	end
end
function t.IsFirstInQueue(p1) --[[ IsFirstInQueue | Line: 145 ]]
	return p1.AnimationQueue.Queue[1] == p1
end
function t.GetMaxSequenceDisplay(p1) --[[ GetMaxSequenceDisplay | Line: 149 ]]
	return p1.SequenceData.MaxToDisplay
end
function t.Init(p1, p2) --[[ Init | Line: 153 ]]
	if not p1._initializing then
		p1._initializing = true
		p1.EffectAnimationGroup:Init(p2)
		p1._initialized = true
	end
end
function t.AwaitInit(p1) --[[ AwaitInit | Line: 163 ]]
	if not (p1._started or p1._initializing) then
		return
	end
	while not p1._initialized do
		task.wait()
	end
end
function t.Start(p1, p2) --[[ Start | Line: 175 ]]
	if not p1._started then
		p1._started = true
		p1:Init()
		p1.EffectAnimationGroup:Start(p2)
		p1.States.Started = true
	end
end
function t.Stop(p1, p2) --[[ Stop | Line: 187 ]]
	if not p1._stopped then
		p1._stopped = true
		p1.Maid.WaitThread = nil
		task.spawn(function() --[[ Line: 197 | Upvalues: p1 (copy) ]]
			p1.EffectAnimationGroup:AwaitCleanup()
			p1:Destroy()
		end)
		p1.EffectAnimationGroup:Stop(p2)
		p1.States.Stopped = true
	end
end
function t.AwaitStop(p1) --[[ AwaitStop | Line: 208 ]]
	while not p1.States.Stopped do
		task.wait()
	end
end
function t.Wait(p1, p2) --[[ Wait | Line: 218 ]]
	if p1._waiting then
		return
	end
	p1._waiting = false
	p1.Maid.WaitThread = task.spawn(function() --[[ Line: 224 | Upvalues: p1 (copy), p2 (copy) ]]
		repeat
			task.wait()
		until p1.Maid.WaitThread ~= nil
		p1.States.Waited = true
		p1.EffectAnimationGroup:Wait(p2)
		p1.Maid.WaitThread = nil
	end)
	repeat
		task.wait()
	until p1.Maid.WaitThread == nil
end
function t.CanAdd(p1, p2) --[[ CanAdd | Line: 241 ]]
	return p1.EffectAnimationGroup:CanAdd(p2)
end
function t.Add(p1, p2) --[[ Add | Line: 245 ]]
	return p1.EffectAnimationGroup:Add(p2)
end
return t