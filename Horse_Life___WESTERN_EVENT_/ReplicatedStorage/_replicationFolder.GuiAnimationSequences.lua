-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("SequenceAnimation")
local v2 = Sonar("Global")
local v3 = Sonar("StorageUtils")
local v4 = Sonar("TableUtils")
local v5 = Sonar("EventUtils")
local v6 = v3.GetConfig("GuiAnimations")()
local AnimationSequences = v6.AnimationSequences
local PresetAnimations = v6.PresetAnimations
local v7 = v6.NotificationGroups or {}
local v8 = RunService:IsStudio()
local v9 = 0
local t2 = {}
local function getInitialQueuePauseState() --[[ getInitialQueuePauseState | Line: 239 | Upvalues: t2 (copy) ]]
	for v1, v2 in t2 do
		if next(v2.PausingAnimations) then
			return true
		end
	end
	return false
end
function t.GetAnimationPreset(p1) --[[ GetAnimationPreset | Line: 259 | Upvalues: PresetAnimations (copy) ]]
	if type(p1.Animation) == "string" then
		return PresetAnimations[p1.Animation]
	end
	if type(p1.Animation) == "table" then
		return p1.Animation
	else
		return nil
	end
end
function t.QueueAnimation(p1) --[[ QueueAnimation | Line: 294 | Upvalues: t (copy), AnimationSequences (copy), t2 (copy), v4 (copy), v8 (copy), v1 (copy), v7 (copy), v9 (ref) ]]
	local v12 = t.GetAnimationPreset(p1)
	if not v12 then
		warn("\226\154\160\239\184\143 GuiAnimationSequences, Animation preset not found", p1)
		return
	end
	local guianimationsequencesaddeditemtoqueue = p1.Sequence or (v12.Sequence or "Default")
	local v2 = AnimationSequences[guianimationsequencesaddeditemtoqueue]
	if not v2 then
		warn("\226\154\160\239\184\143 GuiAnimationSequences, Animation not found", guianimationsequencesaddeditemtoqueue)
		return
	end
	local v3 = t2[guianimationsequencesaddeditemtoqueue]
	if not v3 then
		local t3 = {
			Running = false,
			Queue = {},
			PausingAnimations = {}
		}
		local v42 = false
		for v5, v6 in t2 do
			if next(v6.PausingAnimations) then
				v42 = true
				break
			end
		end
		t3.Paused = v42
		t2[guianimationsequencesaddeditemtoqueue] = t3
		v3 = t3
	end
	local v72 = v4.MergeOriginal(p1, {
		Sequence = v2,
		AnimationQueue = v3,
		AllAnimationQueues = t2,
		Animation = v12
	})
	if v8 then
		print("\240\159\148\132 GuiAnimationSequences, Added item to queue", guianimationsequencesaddeditemtoqueue, v12.Name or v12)
	end
	local v82 = v72
	for v92, v10 in v3.Queue do
		if v10:CanAdd(v82) then
			task.spawn(v10.Add, v10, v82)
			return
		end
	end
	local v11 = v1.new(v82)
	table.insert(v3.Queue, v11)
	local v122 = v7[guianimationsequencesaddeditemtoqueue]
	local v13 = if v122 then v82.Group and v122[v82.Group] else v122
	local v14 = v13 and v13.Priority or 0
	v9 = v9 + 1
	v11._NotificationPriority = v14
	v11._NotificationInsertOrder = v9
	if v14 > 0 then
		local Queue_2 = v3.Queue
		local v15 = 1
		for v16, v17 in Queue_2 do
			if not v17._started then
				break
			end
			v15 = v16 + 1
		end
		local t3 = {}
		local t4 = {}
		for v18, v19 in Queue_2 do
			if v18 < v15 then
				t3[#t3 + 1] = v19
				continue
			end
			t4[#t4 + 1] = v19
		end
		table.sort(t4, function(p1, p2) --[[ Line: 377 ]]
			local v1 = p1._NotificationPriority or 0
			local v2 = p2._NotificationPriority or 0
			if v1 == v2 then
				return (p1._NotificationInsertOrder or 0) < (p2._NotificationInsertOrder or 0)
			else
				return v2 < v1
			end
		end)
		table.clear(Queue_2)
		for v20, v21 in t3 do
			Queue_2[#Queue_2 + 1] = v21
		end
		for v22, v23 in t4 do
			Queue_2[#Queue_2 + 1] = v23
		end
	end
	local v24 = table.find(v3.Queue, v11)
	if not v3.Paused and (v24 and (v24 <= v2.MaxToDisplay and v2.MaxToDisplay > 1)) then
		task.spawn(v11.Start, v11, {
			StartFromInit = true
		})
	end
	if not v2.StopFirstInQueueIfOverMaxDisplay or v24 ~= v2.MaxToDisplay + 1 then
		task.spawn(t.RunSequence, guianimationsequencesaddeditemtoqueue)
		return v11
	end
	local v25 = v3.Queue[1]
	if not (v25 and v25:GetState("Waited")) then
		task.spawn(t.RunSequence, guianimationsequencesaddeditemtoqueue)
		return v11
	end
	v25:Stop()
	task.spawn(t.RunSequence, guianimationsequencesaddeditemtoqueue)
	return v11
end
function t.RunSequence(p1) --[[ RunSequence | Line: 440 | Upvalues: AnimationSequences (copy), t2 (copy), t (copy), v2 (copy), v5 (copy) ]]
	local v1 = p1 or "Default"
	local v22 = AnimationSequences[v1]
	if not v22 then
		warn("\226\154\160\239\184\143 GuiAnimationSequences, Animation not found", v1)
		return
	end
	local v3 = t2[v1]
	if not v3 then
		return
	end
	if v3.LoopingThroughQueue then
		return
	end
	v3.LoopingThroughQueue = true
	repeat
		while v3.Paused or t.IsPaused() do
			task.wait()
		end
		v2["AnimationQueueRunning_" .. v1] = true
		v2["AnimationQueueEnded_" .. v1] = false
		local v4 = v3.Queue[v22.MaxToDisplay or 1]
		if v4 then
			v4:Start({
				StartFromQueue = true
			})
		end
		local v52 = v3.Queue[1]
		if not v52 then
			break
		end
		v5.safeMethod(v52, "Wait")
		v5.safeMethod(v52, "Stop")
		table.remove(v3.Queue, 1)
	until #v3.Queue <= 0
	v3.LoopingThroughQueue = false
	v2["AnimationQueueEnded_" .. v1] = true
	v2["AnimationQueueRunning_" .. v1] = false
end
function t.AddSequence(p1, p2) --[[ AddSequence | Line: 519 | Upvalues: AnimationSequences (copy) ]]
	if AnimationSequences[p1] then
		warn("\226\154\160\239\184\143 GuiAnimationSequences, Sequence already exists", p1)
	else
		AnimationSequences[p1] = p2
	end
end
function t.IsPaused() --[[ IsPaused | Line: 534 | Upvalues: v2 (copy) ]]
	return v2.AnimationQueuePaused
end
function t.SetPaused(p1) --[[ SetPaused | Line: 544 | Upvalues: v2 (copy) ]]
	v2.AnimationQueuePaused = p1
end
return t