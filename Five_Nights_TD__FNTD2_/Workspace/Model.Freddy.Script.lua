-- https://lua.expert/
task.wait(3)
local v1 = script.Parent:WaitForChild("AnimationController").Animator:LoadAnimation(script.Parent.Animation)
v1.Looped = true
v1:Play()