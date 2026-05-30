-- https://lua.expert/
local CameraShakeInstance = require(script.Parent.CameraShakeInstance)
local t = {
	Bump = function() --[[ Bump | Line: 26 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(2.5, 4, 0.1, 0.75)
		v1.PositionInfluence = Vector3.new(0.15, 0.15, 0.15)
		v1.RotationInfluence = Vector3.new(1, 1, 1)
		return v1
	end,
	Bump2 = function() --[[ Bump2 | Line: 33 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(1.5, 2, 0.1, 0.75)
		v1.PositionInfluence = Vector3.new(0.05, 0.05, 0.05)
		v1.RotationInfluence = Vector3.new(0.2, 0.2, 0.2)
		return v1
	end,
	Bump3 = function() --[[ Bump3 | Line: 40 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(5, 8, 0.2, 1.5)
		v1.PositionInfluence = Vector3.new(0.15, 0.15, 0.15)
		v1.RotationInfluence = Vector3.new(2, 2, 2)
		return v1
	end,
	BumpFst = function() --[[ BumpFst | Line: 47 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(4, 7, 0.1, 0.4)
		v1.PositionInfluence = Vector3.new(0.15, 0.15, 0.15)
		v1.RotationInfluence = Vector3.new(1, 1, 1)
		return v1
	end,
	BumpSoft = function() --[[ BumpSoft | Line: 54 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(0.8333333333333334, 1.3333333333333333, 0.03333333333333333, 0.25)
		v1.PositionInfluence = Vector3.new(0.15, 0.15, 0.15)
		v1.RotationInfluence = Vector3.new(0.2, 0.2, 0.2)
		return v1
	end,
	Explosion = function() --[[ Explosion | Line: 63 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(5, 10, 0, 1.5)
		v1.PositionInfluence = Vector3.new(0.25, 0.25, 0.25)
		v1.RotationInfluence = Vector3.new(4, 1, 1)
		return v1
	end,
	Earthquake = function() --[[ Earthquake | Line: 73 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(0.6, 3.5, 2, 10)
		v1.PositionInfluence = Vector3.new(0.25, 0.25, 0.25)
		v1.RotationInfluence = Vector3.new(1, 1, 4)
		return v1
	end,
	BadTrip = function() --[[ BadTrip | Line: 83 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(10, 0.15, 5, 10)
		v1.PositionInfluence = Vector3.new(0, 0, 0.15)
		v1.RotationInfluence = Vector3.new(2, 1, 4)
		return v1
	end,
	HandheldCamera = function() --[[ HandheldCamera | Line: 93 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(1, 0.25, 5, 10)
		v1.PositionInfluence = Vector3.new(0, 0, 0)
		v1.RotationInfluence = Vector3.new(1, 0.5, 0.5)
		return v1
	end,
	Vibration = function() --[[ Vibration | Line: 103 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(0.4, 20, 2, 2)
		v1.PositionInfluence = Vector3.new(0, 0.15, 0)
		v1.RotationInfluence = Vector3.new(1.25, 0, 4)
		return v1
	end,
	RoughDriving = function() --[[ RoughDriving | Line: 113 | Upvalues: CameraShakeInstance (copy) ]]
		local v1 = CameraShakeInstance.new(1, 2, 1, 1)
		v1.PositionInfluence = Vector3.new(0, 0, 0)
		v1.RotationInfluence = Vector3.new(1, 1, 1)
		return v1
	end
}
return setmetatable({}, {
	__index = function(p1, p2) --[[ __index | Line: 125 | Upvalues: t (copy) ]]
		local v1 = t[p2]
		if type(v1) == "function" then
			return v1()
		else
			error("No preset found with index \"" .. p2 .. "\"")
		end
	end
})