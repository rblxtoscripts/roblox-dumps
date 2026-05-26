-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Signal")
local v2 = Sonar("TutorialService")
local t2 = {
	HarvestNode = Sonar("HarvestNode"),
	Tame = Sonar("TameSpecies"),
	JumpObstacle = Sonar("JumpObstacle"),
	Breed = Sonar("Breed")
}
local v3 = nil
function t.GetObjectiveFromType(p1, p2) --[[ GetObjectiveFromType | Line: 22 | Upvalues: t2 (copy) ]]
	return t2[p2]
end
function t.TrackObjective(p1, p2) --[[ TrackObjective | Line: 26 | Upvalues: v3 (ref), t (copy) ]]
	if v3 then
		t:StopTracking()
	end
	local v1 = t:GetObjectiveFromType(p2.Type)
	if not v1 then
		warn("No objective can be found for", p2)
		return
	end
	if not t:CanTrack() then
		return
	end
	v3 = v1.new(p2)
	if not p2.ListenForUntrack then
		t.ObjectiveChangedSignal:Fire()
		return v3
	end
	p2.ListenForUntrack = type(p2.ListenForUntrack) ~= "table" and { p2.ListenForUntrack } or p2.ListenForUntrack
	for v32, v4 in p2.ListenForUntrack do
		v3.Maid:GiveTask(v4:Connect(function() --[[ Line: 46 | Upvalues: t (ref), p2 (copy) ]]
			t:StopTrackingIfTracked(p2.ID)
		end))
	end
	t.ObjectiveChangedSignal:Fire()
	return v3
end
function t.TrackPinned(p1, ...) --[[ TrackPinned | Line: 57 | Upvalues: t (copy) ]]
	t.TrackPinnedObjectiveSignal:Fire(...)
end
function t.StopTracking(p1) --[[ StopTracking | Line: 61 | Upvalues: v3 (ref), t (copy) ]]
	if v3 then
		v3:Destroy()
	end
	v3 = nil
	t.ObjectiveChangedSignal:Fire()
end
function t.StopTrackingIfTracked(p1, p2) --[[ StopTrackingIfTracked | Line: 69 | Upvalues: t (copy) ]]
	if t:IsTracked(p2) then
		t:StopTracking()
	end
end
function t.CanTrack(p1) --[[ CanTrack | Line: 74 | Upvalues: v2 (copy) ]]
	if _G.InContextualTutorial then
		v2.NotifyCannotDoAction("TrackObjective")
		return
	end
	if v2.GetGameState("TrackObjective") then
		return true
	end
end
function t.IsTracked(p1, p2) --[[ IsTracked | Line: 87 | Upvalues: v3 (ref) ]]
	if not v3 then
		return
	end
	return v3.ID == p2
end
function t.GetObjective(p1) --[[ GetObjective | Line: 92 | Upvalues: v3 (ref) ]]
	return v3
end
function t.HintObjective(p1, p2) --[[ HintObjective | Line: 96 ]] end
function t.Init(p1) --[[ Init | Line: 100 | Upvalues: t (copy), v1 (copy) ]]
	t.ObjectiveChangedSignal = v1.new()
	t.TrackPinnedObjectiveSignal = v1.new()
end
t:Init()
return t