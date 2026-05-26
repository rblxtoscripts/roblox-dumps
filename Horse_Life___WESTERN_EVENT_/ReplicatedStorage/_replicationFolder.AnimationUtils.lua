-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage.Sonar)("InstanceUtils")
function t.CreateOrGetAnimationController(p1) --[[ CreateOrGetAnimationController | Line: 11 | Upvalues: v1 (copy) ]]
	local v12 = p1:FindFirstChildWhichIsA("Animator", true)
	if v12 then
		return v12
	else
		return v1.Create("Animator", {
			Parent = v1.Create("AnimationController", {
				Parent = p1
			})
		})
	end
end
function t.LoadAnimation(p1, p2, p3) --[[ LoadAnimation | Line: 27 | Upvalues: v1 (copy) ]]
	local v12 = p1:LoadAnimation((v1.Create("Animation", {
		Name = "Animation",
		AnimationId = p2
	})))
	if p3 then
		p3:GiveTask(v12)
	end
	return v12
end
function t.YieldForAnimationLoaded(p1) --[[ YieldForAnimationLoaded | Line: 42 ]]
	repeat
		task.wait()
	until p1.Length > 0
end
return t