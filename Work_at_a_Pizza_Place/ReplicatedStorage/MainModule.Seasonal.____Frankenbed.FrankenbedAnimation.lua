-- https://lua.expert/
local v1 = false
local v2 = script:WaitForChild("ObjectPointer").Value
local v3 = nil
local v4 = 1
function PlayAnimation(p1) --[[ PlayAnimation | Line: 11 | Upvalues: v3 (ref), v2 (copy), v4 (ref) ]]
	v3 = v3 or v2.AnimationController:LoadAnimation(v2.Animation)
	v3.Looped = false
	v3:AdjustSpeed(1)
	v3:Play(0.3)
	v4 = v4 + 1
	local v22 = v4
	wait(0.5)
	if v2 and (v2.Parent and v22 == v4) then
		v2.MiddlePost.Lever:Play()
		wait(2)
	end
	while v2 and (v2.Parent and v22 == v4) do
		v2.MiddlePost.Electric:Play()
		v2.MetalElectric.ParticleEmitter.Enabled = true
		v2.MetalElectric.Color = Color3.fromRGB(110, 153, 202)
		v2.MetalElectric.Material = "Neon"
		wait(2.5)
		if v2 and (v2.Parent and v22 == v4) then
			v2.MetalElectric.ParticleEmitter.Enabled = false
			v2.MetalElectric.Color = Color3.fromRGB(153, 109, 143)
			v2.MetalElectric.Material = "SmoothPlastic"
			wait(3)
		end
	end
	v2.MetalElectric.ParticleEmitter.Enabled = false
	v2.MetalElectric.Color = Color3.fromRGB(153, 109, 143)
	v2.MetalElectric.Material = "SmoothPlastic"
end
function StopAnimation() --[[ StopAnimation | Line: 42 | Upvalues: v1 (ref), v3 (ref), v4 (ref) ]]
	v1 = false
	if not v3 then
		return
	end
	v3:Stop()
	v4 = v4 + 1
end
v2.Seat:GetPropertyChangedSignal("Occupant"):connect(function() --[[ Line: 50 | Upvalues: v2 (copy) ]]
	if v2.Seat.Occupant == nil then
		StopAnimation()
	else
		PlayAnimation()
	end
end)