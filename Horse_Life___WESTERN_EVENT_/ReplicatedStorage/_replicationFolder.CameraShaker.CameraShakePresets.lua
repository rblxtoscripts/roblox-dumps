-- https://lua.expert/
local CameraShakeInstance = require(script.Parent.CameraShakeInstance)
local t = {
	Bump = function() --[[ Bump | Line: 26 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(2, 8, 0, 0.3)
		v1.PositionInfluence = Vector3.new(0.2, 0.2, 0.2)
		v1.RotationInfluence = Vector3.new(0.4, 0.4, 0.4)
		return v1
	end,
	SmallBump = function() --[[ SmallBump | Line: 33 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(0.75, 8, 0, 0.3)
		v1.PositionInfluence = Vector3.new(0.2, 0.2, 0.2)
		v1.RotationInfluence = Vector3.new(0.4, 0.4, 0.4)
		return v1
	end,
	RotationBump = function() --[[ RotationBump | Line: 40 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(14, 7, 0, 0.2)
		v1.PositionInfluence = Vector3.new(0.2, 0.1, 0)
		v1.RotationInfluence = Vector3.new(0, 0.1, 1.35)
		return v1
	end,
	SmallRotationBump = function() --[[ SmallRotationBump | Line: 47 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(8.5, 7, 0, 0.2)
		v1.PositionInfluence = Vector3.new(0.2, 0.1, 0)
		v1.RotationInfluence = Vector3.new(0, 0.1, 1.35)
		return v1
	end,
	BigBump = function() --[[ BigBump | Line: 56 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(4.15, 10, 0, 0.2)
		v1.PositionInfluence = Vector3.new(0.2, 0.75, 0.2)
		v1.RotationInfluence = Vector3.new(0.5, 0.4, 0.5)
		return v1
	end,
	BigRotationBump = function() --[[ BigRotationBump | Line: 63 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(8.5, 10, 0, 0.2)
		v1.PositionInfluence = Vector3.new(0.2, 0.75, 0)
		v1.RotationInfluence = Vector3.new(0, 0.2, 1.65)
		return v1
	end,
	Takeoff = function() --[[ Takeoff | Line: 70 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(4, 1.15, 0.05, 0.45)
		v1.PositionInfluence = Vector3.new(0.75, 6, 0.75)
		v1.RotationInfluence = Vector3.new(0.5, 0.15, 0.5)
		return v1
	end,
	HorsePass = function() --[[ HorsePass | Line: 77 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(7, 8.5, 0.01, 0.4)
		v1.PositionInfluence = Vector3.new(1, 1, 1)
		v1.RotationInfluence = Vector3.new(1, 1, 1)
		return v1
	end,
	CannonBump = function() --[[ CannonBump | Line: 84 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(5, 10, 0.01, 0.3)
		v1.PositionInfluence = Vector3.new(0.3, 0.3, 0.3)
		v1.RotationInfluence = Vector3.new(0.7, 0.7, 0.7)
		return v1
	end,
	CannonBumpFast = function() --[[ CannonBumpFast | Line: 91 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(2.25, 5.5, 0.01, 0.275)
		v1.PositionInfluence = Vector3.new(0.25, 0.25, 0.25)
		v1.RotationInfluence = Vector3.new(0.35, 0.35, 0.35)
		return v1
	end,
	CannonImpact = function() --[[ CannonImpact | Line: 98 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(8, 12, 0.01, 0.5)
		v1.PositionInfluence = Vector3.new(0.8, 0.8, 0.8)
		v1.RotationInfluence = Vector3.new(1.2, 1.2, 1.2)
		return v1
	end,
	Explosion = function() --[[ Explosion | Line: 107 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(5, 8, 0, 1)
		v1.PositionInfluence = Vector3.new(0.25, 0.25, 0.25)
		v1.RotationInfluence = Vector3.new(4, 1, 1)
		return v1
	end,
	Earthquake = function() --[[ Earthquake | Line: 117 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(0.6, 3.5, 2, 10)
		v1.PositionInfluence = Vector3.new(0.25, 0.25, 0.25)
		v1.RotationInfluence = Vector3.new(1, 1, 4)
		return v1
	end,
	Gallop = function() --[[ Gallop | Line: 126 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(0.5, 2, 2, 10)
		v1.PositionInfluence = Vector3.new(0.25, 0.55, 0.25)
		v1.RotationInfluence = Vector3.new(1, 1, 3)
		return v1
	end,
	BadTrip = function() --[[ BadTrip | Line: 135 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(10, 0.15, 5, 10)
		v1.PositionInfluence = Vector3.new(0, 0, 0.15)
		v1.RotationInfluence = Vector3.new(2, 1, 4)
		return v1
	end,
	HandheldCamera = function() --[[ HandheldCamera | Line: 145 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(0.65, 2, 0.25, 0.25)
		v1.PositionInfluence = Vector3.new(0, 0, 0)
		v1.RotationInfluence = Vector3.new(0.2, 0.1, 0.2)
		return v1
	end,
	Flight = function() --[[ Flight | Line: 152 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(0.85, 1.15, 0.25, 0.25)
		v1.PositionInfluence = Vector3.new(0.075, 0.5, 0.075)
		v1.RotationInfluence = Vector3.new(0.5, 0.1, 0.3)
		return v1
	end,
	Swim = function() --[[ Swim | Line: 159 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(0.85, 1.15, 0.25, 0.25)
		v1.PositionInfluence = Vector3.new(0.15, 0.75, 0.1)
		v1.RotationInfluence = Vector3.new(0.35, 0.1, 0.15)
		return v1
	end,
	Morale = function() --[[ Morale | Line: 168 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(3.6, 1.75, 0, 0)
		v1.PositionInfluence = Vector3.new(0.1, 0.1, 0.1)
		v1.RotationInfluence = Vector3.new(0.15, 0.15, 0.15)
		return v1
	end,
	Vibration = function() --[[ Vibration | Line: 177 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(3, 5, 0.5, 2)
		v1.PositionInfluence = Vector3.new(0, 0.15, 0)
		v1.RotationInfluence = Vector3.new(1.25, 0, 4)
		return v1
	end,
	VibrationSmaller = function() --[[ VibrationSmaller | Line: 184 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(1, 5.5, 0.5, 2)
		v1.PositionInfluence = Vector3.new(0.175, 0.175, 0.175)
		v1.RotationInfluence = Vector3.new(0.5, 0, 0.55)
		return v1
	end,
	BoostShake = function() --[[ BoostShake | Line: 191 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(0.25, 6.5, 0.2, -0.2)
		v1.PositionInfluence = Vector3.new(0.175, 0.175, 0)
		v1.RotationInfluence = Vector3.new(0.1, 0, 0.1)
		return v1
	end,
	VibrationRougher = function() --[[ VibrationRougher | Line: 198 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(5, 7, 0.25, 2)
		v1.PositionInfluence = Vector3.new(0, 0.3, 0)
		v1.RotationInfluence = Vector3.new(1.35, 0, 4.75)
		return v1
	end,
	VibrationRoughest = function() --[[ VibrationRoughest | Line: 205 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(1.25, 20, 0.25, 2)
		v1.PositionInfluence = Vector3.new(0, 1.25, 0)
		v1.RotationInfluence = Vector3.new(1.1, 0, 1.35)
		return v1
	end,
	Dive = function() --[[ Dive | Line: 212 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(1, 15, 0.75, 2)
		v1.PositionInfluence = Vector3.new(2.75, 1, 0)
		v1.RotationInfluence = Vector3.new(0, 0, 0)
		return v1
	end,
	Sprint = function() --[[ Sprint | Line: 219 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(0.5, 3.25, 0.65, 1)
		v1.PositionInfluence = Vector3.new(0, 0.15, 0)
		v1.RotationInfluence = Vector3.new(0.8, 0, 1)
		return v1
	end,
	Boost = function() --[[ Boost | Line: 226 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(4, 1.15, 0.05, 0.35)
		v1.PositionInfluence = Vector3.new(0, 6, 0)
		v1.RotationInfluence = Vector3.new(0.5, 0, 0.5)
		return v1
	end,
	RoughDriving = function() --[[ RoughDriving | Line: 236 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(1, 2, 1, 1)
		v1.PositionInfluence = Vector3.new(0, 0, 0)
		v1.RotationInfluence = Vector3.new(1, 1, 1)
		return v1
	end
}
return setmetatable({}, {
	__index = function(p1, p2, p3) --[[ __index | Line: 246 | Upvalues: t (copy) ]]
		local v1 = t[p2]
		if type(v1) == "function" then
			return v1(p3)
		else
			error("No preset found with index \"" .. p2 .. "\"")
		end
	end
})