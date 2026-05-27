-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Jump")
local v2 = Sonar("TutorialService")
function t.Start() --[[ Start | Line: 11 | Upvalues: t (copy), v2 (copy) ]]
	task.spawn(t.TweenInText, "You\'ve been afflicted with a debuff, escape battle and lay down to heal!")
	t.YieldForTweenCompleted()
	t.EndContextualTutorial("ObstacleJump")
	v2.SetGameElements({
		FailJumpObstacle = true
	})
end
function t.Setup(p1) --[[ Setup | Line: 24 | Upvalues: v2 (copy), v1 (copy) ]]
	v2.SetGameElements({
		FailJumpObstacle = false
	})
	v1.JumpCompletedSignal:Connect(function() --[[ Line: 31 ]] end)
end
return t