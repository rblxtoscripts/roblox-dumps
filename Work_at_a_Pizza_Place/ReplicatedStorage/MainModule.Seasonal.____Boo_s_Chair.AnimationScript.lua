-- https://lua.expert/
local v1 = false
local v2 = script:WaitForChild("ObjectPointer").Value
local v3 = nil
function PlayAnimation() --[[ PlayAnimation | Line: 10 | Upvalues: v3 (ref), v2 (copy), v1 (ref) ]]
	v3 = v3 or v2.AnimationController:LoadAnimation(v2.Animation)
	v3.Looped = true
	v3:Play()
	v1 = true
end
function StopAnimation() --[[ StopAnimation | Line: 19 | Upvalues: v1 (ref), v3 (ref) ]]
	v1 = false
	if not v3 then
		return
	end
	v3:Stop()
end
if v2:FindFirstChild("ClickDetector") then
	v2.ClickDetector.Detector.Event:connect(function() --[[ Line: 28 | Upvalues: v1 (ref) ]]
		if v1 then
			StopAnimation()
		else
			StopAnimation()
			PlayAnimation()
		end
	end)
end
PlayAnimation()
v2.Seat.Disabled = true