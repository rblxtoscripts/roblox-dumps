-- https://lua.expert/
local RunService = game:GetService("RunService")
local exp = math.exp
local sin = math.sin
local cos = math.cos
local min = math.min
local sqrt = math.sqrt
local round = math.round
local function magnitudeSq(p1) --[[ magnitudeSq | Line: 51 ]]
	local sum = 0
	for v1, v2 in p1 do
		sum = sum + v2 ^ 2
	end
	return sum
end
local function distanceSq(p1, p2) --[[ distanceSq | Line: 59 ]]
	local sum = 0
	for v1, v2 in p1 do
		sum = sum + (p2[v1] - v2) ^ 2
	end
	return sum
end
local t = {}
t.__index = t
function t.new(p1, p2, p3, p4, p5) --[[ new | Line: 89 | Upvalues: t (copy) ]]
	local v1 = p5.toIntermediate(p3)
	return setmetatable({
		d = p1,
		f = p2,
		g = v1,
		p = v1,
		v = table.create(#v1, 0),
		typedat = p5,
		rawGoal = p4
	}, t)
end
function t.setGoal(p1, p2) --[[ setGoal | Line: 105 ]]
	p1.rawGoal = p2
	p1.g = p1.typedat.toIntermediate(p2)
end
function t.setDampingRatio(p1, p2) --[[ setDampingRatio | Line: 110 ]]
	p1.d = p2
end
function t.setFrequency(p1, p2) --[[ setFrequency | Line: 114 ]]
	p1.f = p2
end
function t.canSleep(p1) --[[ canSleep | Line: 118 ]]
	local sum = 0
	for v1, v2 in p1.v do
		sum = sum + v2 ^ 2
	end
	if sum > 0.0001 then
		return false
	end
	local g = p1.g
	local sum_2 = 0
	for v3, v4 in p1.p do
		sum_2 = sum_2 + (g[v3] - v4) ^ 2
	end
	return not (sum_2 > 6.781684027777778e-8)
end
function t.step(p1, p2) --[[ step | Line: 130 | Upvalues: exp (copy), sqrt (copy), cos (copy), sin (copy) ]]
	local d = p1.d
	local v1 = p1.f * 2 * math.pi
	local g = p1.g
	local p = p1.p
	local v = p1.v
	if d == 1 then
		local v2 = exp(-v1 * p2)
		local v3 = p2 * v2
		local v4 = v2 - v3 * v1
		local v5 = v3 * v1 * v1
		local v6 = v2 + v3 * v1
		for i = 1, #p do
			local v7 = p[i] - g[i]
			p[i] = v7 * v6 + v[i] * v3 + g[i]
			v[i] = v[i] * v4 - v7 * v5
		end
	elseif d < 1 then
		local v8 = exp(-d * v1 * p2)
		local v9 = sqrt(1 - d * d)
		local v10 = cos(p2 * v1 * v9)
		local v11 = sin(p2 * v1 * v9)
		local v12
		if v9 > 0.00001 then
			v12 = v11 / v9
		else
			local v13 = p2 * v1
			v12 = v13 + (v13 * v13 * (v9 * v9) * (v9 * v9) / 20 - v9 * v9) * (v13 * v13 * v13) / 6
		end
		local v14
		if v1 * v9 > 0.00001 then
			v14 = v11 / (v1 * v9)
		else
			local v15 = v1 * v9
			v14 = p2 + (p2 * p2 * (v15 * v15) * (v15 * v15) / 20 - v15 * v15) * (p2 * p2 * p2) / 6
		end
		for j = 1, #p do
			local v16 = p[j] - g[j]
			p[j] = (v16 * (v10 + v12 * d) + v[j] * v14) * v8 + g[j]
			v[j] = (v[j] * (v10 - v12 * d) - v16 * (v12 * v1)) * v8
		end
	else
		local v17 = sqrt(d * d - 1)
		local v18 = -v1 * (d - v17)
		local v19 = -v1 * (d + v17)
		local v20 = exp(v18 * p2)
		local v21 = exp(v19 * p2)
		for k = 1, #p do
			local v22 = p[k] - g[k]
			local v23 = (v[k] - v22 * v18) / (2 * v1 * v17)
			local v24 = v20 * (v22 - v23)
			p[k] = v24 + v23 * v21 + g[k]
			v[k] = v24 * v18 + v23 * v21 * v19
		end
	end
	return p1.typedat.fromIntermediate(p1.p)
end
local t2 = {}
t2.__index = t2
local function angleBetween(p1, p2) --[[ angleBetween | Line: 246 ]]
	local _, v1 = p2:ToObjectSpace(p1):ToAxisAngle()
	return math.abs(v1)
end
local function matrixToAxis(p1) --[[ matrixToAxis | Line: 251 ]]
	local v1, v2 = p1:ToAxisAngle()
	return v1 * v2
end
local function axisToMatrix(p1) --[[ axisToMatrix | Line: 256 ]]
	local Magnitude = p1.Magnitude
	if Magnitude > 1e-6 then
		return CFrame.fromAxisAngle(p1.Unit, Magnitude)
	else
		return CFrame.identity
	end
end
function t2.new(p1, p2, p3, p4) --[[ new | Line: 264 | Upvalues: t2 (copy) ]]
	return setmetatable({
		v = Vector3.new(0, 0, 0),
		d = p1,
		f = p2,
		g = p4,
		p = p3
	}, t2)
end
function t2.setGoal(p1, p2) --[[ setGoal | Line: 277 ]]
	p1.g = p2
end
function t2.setDampingRatio(p1, p2) --[[ setDampingRatio | Line: 281 ]]
	p1.d = p2
end
function t2.setFrequency(p1, p2) --[[ setFrequency | Line: 285 ]]
	p1.f = p2
end
function t2.canSleep(p1) --[[ canSleep | Line: 289 ]]
	local _, v1 = p1.g:ToObjectSpace(p1.p):ToAxisAngle()
	local v2 = math.abs(v1) < 0.00017453292519943296
	return v2 and (if p1.v.Magnitude < 0.0017453292519943296 then true else false)
end
function t2.step(p1, p2) --[[ step | Line: 295 | Upvalues: exp (copy), sqrt (copy), cos (copy), sin (copy) ]]
	local d = p1.d
	local v1 = p1.f * 2 * math.pi
	local g = p1.g
	local v = p1.v
	local v2, v3 = (p1.p * g:Inverse()):ToAxisAngle()
	local v4 = v2 * v3
	local v5 = exp(-d * v1 * p2)
	local v6, v7
	if d == 1 then
		local v8 = (v4 * (1 + v1 * p2) + v * p2) * v5
		local Magnitude = v8.Magnitude
		v6 = (if Magnitude > 1e-6 then CFrame.fromAxisAngle(v8.Unit, Magnitude) else CFrame.identity) * g
		v7 = (v * (1 - p2 * v1) - v4 * (p2 * v1 * v1)) * v5
	elseif d < 1 then
		local v11 = sqrt(1 - d * d)
		local v12 = cos(p2 * v1 * v11)
		local v13 = sin(p2 * v1 * v11)
		local v14 = v13 / v11
		local v15 = (v4 * (v12 + v14 * d) + v * (v13 / (v1 * v11))) * v5
		local Magnitude = v15.Magnitude
		v6 = (if Magnitude > 1e-6 then CFrame.fromAxisAngle(v15.Unit, Magnitude) else CFrame.identity) * g
		v7 = (v * (v12 - v14 * d) - v4 * (v14 * v1)) * v5
	else
		local v18 = sqrt(d * d - 1)
		local v19 = -v1 * (d - v18)
		local v20 = -v1 * (d + v18)
		local v21 = (v - v4 * v19) / (2 * v1 * v18)
		local v22 = (v4 - v21) * exp(v19 * p2)
		local v23 = v21 * exp(v20 * p2)
		local v24 = v22 + v23
		local Magnitude = v24.Magnitude
		v6 = (if Magnitude > 1e-6 then CFrame.fromAxisAngle(v24.Unit, Magnitude) else CFrame.identity) * g
		v7 = v22 * v19 + v23 * v20
	end
	p1.p = v6
	p1.v = v7
	return v6
end
local t3 = {
	springType = t.new,
	toIntermediate = function(p1) --[[ toIntermediate | Line: 351 ]]
		return { p1.X, p1.Y, p1.Z }
	end,
	fromIntermediate = function(p1) --[[ fromIntermediate | Line: 355 ]]
		return Vector3.new(p1[1], p1[2], p1[3])
	end
}
local t4 = {}
t4.__index = t4
function t4.new(p1, p2, p3, p4, p5) --[[ new | Line: 365 | Upvalues: t (copy), t3 (copy), t2 (copy), t4 (copy) ]]
	return setmetatable({
		rawGoal = p4,
		_position = t.new(p1, p2, p3.Position, p4.Position, t3),
		_rotation = t2.new(p1, p2, p3.Rotation, p4.Rotation)
	}, t4)
end
function t4.setGoal(p1, p2) --[[ setGoal | Line: 382 ]]
	p1.rawGoal = p2
	p1._position:setGoal(p2.Position)
	p1._rotation:setGoal(p2.Rotation)
end
function t4.setDampingRatio(p1, p2) --[[ setDampingRatio | Line: 388 ]]
	p1._position:setDampingRatio(p2)
	p1._rotation:setDampingRatio(p2)
end
function t4.setFrequency(p1, p2) --[[ setFrequency | Line: 393 ]]
	p1._position:setFrequency(p2)
	p1._rotation:setFrequency(p2)
end
function t4.canSleep(p1) --[[ canSleep | Line: 398 ]]
	return p1._position:canSleep() and p1._rotation:canSleep()
end
function t4.step(p1, p2) --[[ step | Line: 402 ]]
	local v1 = p1._position:step(p2)
	return p1._rotation:step(p2) + v1
end
local function inverseGammaCorrectD65(p1) --[[ inverseGammaCorrectD65 | Line: 413 ]]
	return p1 < 0.0404482362771076 and p1 / 12.92 or 0.87941546140213 * (p1 + 0.055) ^ 2.4
end
local function gammaCorrectD65(p1) --[[ gammaCorrectD65 | Line: 417 ]]
	return p1 < 0.0031306684425 and 12.92 * p1 or 1.055 * p1 ^ 0.4166666666666667 - 0.055
end
local function rgbToLuv(p1) --[[ rgbToLuv | Line: 421 ]]
	local R = p1.R
	local G = p1.G
	local B = p1.B
	local v1, v2
	if R < 0.0404482362771076 then
		v1 = R / 12.92
		if not v1 then
			v2 = R
			v1 = 0.87941546140213 * (R + 0.055) ^ 2.4
		end
	else
		v2 = R
		v1 = 0.87941546140213 * (R + 0.055) ^ 2.4
	end
	local v3, v4
	if G < 0.0404482362771076 then
		v3 = G / 12.92
		if not v3 then
			v4 = G
			v3 = 0.87941546140213 * (G + 0.055) ^ 2.4
		end
	else
		v4 = G
		v3 = 0.87941546140213 * (G + 0.055) ^ 2.4
	end
	local v5, v6
	if B < 0.0404482362771076 then
		v5 = B / 12.92
		if not v5 then
			v6 = B
			v5 = 0.87941546140213 * (B + 0.055) ^ 2.4
		end
	else
		v6 = B
		v5 = 0.87941546140213 * (B + 0.055) ^ 2.4
	end
	local v7 = 0.9257063972951867 * v1 - 0.8333736323779866 * v3 - 0.09209820666085898 * v5
	local v8 = 0.2125862307855956 * v1 + 0.7151703037034108 * v3 + 0.0722004986433362 * v5
	local v9 = 3.6590806972265884 * v1 + 11.442689580057424 * v3 + 4.114991502426484 * v5
	local v10 = v8 > 0.008856451679035631 and 116 * v8 ^ 0.3333333333333333 - 16 or 903.296296296296 * v8
	local v11, v12
	if v9 > 1e-14 then
		v11 = v10 * v7 / v9
		v12 = v10 * (9 * v8 / v9 - 0.46832)
	else
		v11 = -0.19783 * v10
		v12 = -0.46832 * v10
	end
	return { v10, v11, v12 }
end
local function luvToRgb(p1) --[[ luvToRgb | Line: 450 | Upvalues: min (copy) ]]
	local v1 = p1[1]
	if v1 < 0.0197955 then
		return Color3.new(0/255, 0/255, 0/255)
	end
	local v2 = p1[2] / v1 + 0.19783
	local v3 = p1[3] / v1 + 0.46832
	local v4 = (v1 + 16) / 116
	local v5 = v4 > 0.20689655172413793 and v4 * v4 * v4 or v4 * 0.12841854934601665 - 0.01771290335807126
	local v6 = v5 * v2 / v3
	local v7 = v5 * ((3 - v2 * 0.75) / v3 - 5)
	local sum = v6 * 7.2914074 - v5 * 1.537208 - v7 * 0.4986286
	local sum_2 = v6 * -2.180094 + v5 * 1.8757561 + v7 * 0.0415175
	local sum_3 = v6 * 0.1253477 - v5 * 0.2040211 + v7 * 1.0569959
	if sum < 0 and (sum < sum_2 and sum < sum_3) then
		sum = 0
		sum_2 = sum_2 - sum
		sum_3 = sum_3 - sum
	elseif sum_2 < 0 and sum_2 < sum_3 then
		sum = sum - sum_2
		sum_2 = 0
		sum_3 = sum_3 - sum_2
	elseif sum_3 < 0 then
		sum = sum - sum_3
		sum_2 = sum_2 - sum_3
		sum_3 = 0
	end
	local v8 = Color3.new
	local v9, v10
	if sum < 0.0031306684425 then
		v9 = 12.92 * sum
		if not v9 then
			v10 = sum
			v9 = 1.055 * sum ^ 0.4166666666666667 - 0.055
		end
	else
		v10 = sum
		v9 = 1.055 * sum ^ 0.4166666666666667 - 0.055
	end
	local v11 = min(v9, 1)
	local v12, v13
	if sum_2 < 0.0031306684425 then
		v12 = 12.92 * sum_2
		if not v12 then
			v13 = sum_2
			v12 = 1.055 * sum_2 ^ 0.4166666666666667 - 0.055
		end
	else
		v13 = sum_2
		v12 = 1.055 * sum_2 ^ 0.4166666666666667 - 0.055
	end
	local v14 = min(v12, 1)
	local v15, v16
	if sum_3 < 0.0031306684425 then
		v15 = 12.92 * sum_3
		if not v15 then
			v16 = sum_3
			v15 = 1.055 * sum_3 ^ 0.4166666666666667 - 0.055
		end
	else
		v16 = sum_3
		v15 = 1.055 * sum_3 ^ 0.4166666666666667 - 0.055
	end
	return v8(v11, v14, (min(v15, 1)))
end
local t5 = {
	boolean = {
		springType = t.new,
		toIntermediate = function(p1) --[[ toIntermediate | Line: 496 ]]
			local t = {}
			t[1] = if p1 then 1 else 0
			return t
		end,
		fromIntermediate = function(p1) --[[ fromIntermediate | Line: 500 ]]
			return p1[1] >= 0.5
		end
	},
	number = {
		springType = t.new,
		toIntermediate = function(p1) --[[ toIntermediate | Line: 508 ]]
			return { p1 }
		end,
		fromIntermediate = function(p1) --[[ fromIntermediate | Line: 512 ]]
			return p1[1]
		end
	},
	NumberRange = {
		springType = t.new,
		toIntermediate = function(p1) --[[ toIntermediate | Line: 520 ]]
			return { p1.Min, p1.Max }
		end,
		fromIntermediate = function(p1) --[[ fromIntermediate | Line: 524 ]]
			return NumberRange.new(p1[1], p1[2])
		end
	},
	UDim = {
		springType = t.new,
		toIntermediate = function(p1) --[[ toIntermediate | Line: 532 ]]
			return { p1.Scale, p1.Offset }
		end,
		fromIntermediate = function(p1) --[[ fromIntermediate | Line: 536 | Upvalues: round (copy) ]]
			return UDim.new(p1[1], (round(p1[2])))
		end
	},
	UDim2 = {
		springType = t.new,
		toIntermediate = function(p1) --[[ toIntermediate | Line: 544 ]]
			local X = p1.X
			local Y = p1.Y
			return {
				X.Scale,
				X.Offset,
				Y.Scale,
				Y.Offset
			}
		end,
		fromIntermediate = function(p1) --[[ fromIntermediate | Line: 550 | Upvalues: round (copy) ]]
			return UDim2.new(p1[1], round(p1[2]), p1[3], (round(p1[4])))
		end
	},
	Vector2 = {
		springType = t.new,
		toIntermediate = function(p1) --[[ toIntermediate | Line: 558 ]]
			return { p1.X, p1.Y }
		end,
		fromIntermediate = function(p1) --[[ fromIntermediate | Line: 562 ]]
			return Vector2.new(p1[1], p1[2])
		end
	},
	Vector3 = t3,
	Color3 = {
		springType = t.new,
		toIntermediate = rgbToLuv,
		fromIntermediate = luvToRgb
	},
	ColorSequence = {
		springType = t.new,
		toIntermediate = function(p1) --[[ toIntermediate | Line: 579 | Upvalues: rgbToLuv (ref) ]]
			local Keypoints = p1.Keypoints
			local v1 = rgbToLuv(Keypoints[1].Value)
			local v2 = rgbToLuv(Keypoints[#Keypoints].Value)
			return {
				v1[1],
				v1[2],
				v1[3],
				v2[1],
				v2[2],
				v2[3]
			}
		end,
		fromIntermediate = function(p1) --[[ fromIntermediate | Line: 591 | Upvalues: luvToRgb (ref) ]]
			return ColorSequence.new(luvToRgb({ p1[1], p1[2], p1[3] }), luvToRgb({ p1[4], p1[5], p1[6] }))
		end
	},
	CFrame = {
		springType = t4.new,
		toIntermediate = error,
		fromIntermediate = error
	}
}
local t6 = {
	Pivot = {
		class = "PVInstance",
		get = function(p1) --[[ get | Line: 617 ]]
			return p1:GetPivot()
		end,
		set = function(p1, p2) --[[ set | Line: 620 ]]
			p1:PivotTo(p2)
		end
	},
	Scale = {
		class = "Model",
		get = function(p1) --[[ get | Line: 626 ]]
			return p1:GetScale()
		end,
		set = function(p1, p2) --[[ set | Line: 629 ]]
			p1:ScaleTo(p2)
		end
	}
}
local function getProperty(p1, p2) --[[ getProperty | Line: 635 | Upvalues: t6 (copy) ]]
	local v1 = t6[p2]
	if v1 and p1:IsA(v1.class) then
		return v1.get(p1)
	end
	return p1[p2]
end
local function setProperty(p1, p2, p3) --[[ setProperty | Line: 644 | Upvalues: t6 (copy) ]]
	local v1 = t6[p2]
	if v1 and p1:IsA(v1.class) then
		v1.set(p1, p3)
		return
	end
	p1[p2] = p3
end
local t7 = {}
local t8 = {}
local t9 = {}
local t10 = {}
local function triggerCompletedCallbacks(p1) --[[ triggerCompletedCallbacks | Line: 659 | Upvalues: t9 (copy) ]]
	local v1 = t9[p1]
	if not v1 then
		return
	end
	t9[p1] = nil
	for v2, v3 in v1 do
		task.spawn(v3)
	end
end
local function processSprings(p1, p2) --[[ processSprings | Line: 669 | Upvalues: t6 (copy), t10 (copy), t9 (copy) ]]
	for v1, v2 in p1 do
		for v3, v4 in v2 do
			if v4:canSleep() then
				v2[v3] = nil
				local rawGoal = v4.rawGoal
				local v5 = t6[v3]
				if v5 and v1:IsA(v5.class) then
					v5.set(v1, rawGoal)
					continue
				end
				v1[v3] = rawGoal
				continue
			end
			local v6 = v4:step(p2)
			local v7 = t6[v3]
			if v7 and v1:IsA(v7.class) then
				v7.set(v1, v6)
				continue
			end
			v1[v3] = v6
		end
		if not next(v2) and p1[v1] then
			p1[v1] = nil
			t10[v1] = nil
			local v8 = t9[v1]
			if v8 then
				t9[v1] = nil
				for v9, v10 in v8 do
					task.spawn(v10)
				end
			end
		end
	end
end
RunService.PreSimulation:Connect(function(p1) --[[ Line: 691 | Upvalues: processSprings (copy), t7 (copy) ]]
	processSprings(t7, p1)
end)
RunService.PostSimulation:Connect(function(p1) --[[ Line: 696 | Upvalues: processSprings (copy), t8 (copy) ]]
	processSprings(t8, p1)
end)
local function assertType(p1, p2, p3, p4) --[[ assertType | Line: 702 ]]
	if p3:find((typeof(p4))) then
		return
	end
	error(("bad argument #%* to %* (%* expected, got %*)"):format(p1, p2, p3, (typeof(p4))), 3)
end
local t11 = {}
function t11.target(p1, p2, p3, p4) --[[ target | Line: 711 | Upvalues: t8 (copy), t7 (copy), t10 (copy), t11 (copy), t6 (copy), t5 (copy) ]]
	if not ("Instance"):find((typeof(p1))) then
		error(("bad argument #%* to spr.target (Instance expected, got %*)"):format(1, (typeof(p1))), 3)
	end
	if not ("number"):find((typeof(p2))) then
		error(("bad argument #%* to spr.target (number expected, got %*)"):format(2, (typeof(p2))), 3)
	end
	if not ("number"):find((typeof(p3))) then
		error(("bad argument #%* to spr.target (number expected, got %*)"):format(3, (typeof(p3))), 3)
	end
	if not ("table"):find((typeof(p4))) then
		error(("bad argument #%* to spr.target (table expected, got %*)"):format(4, (typeof(p4))), 3)
	end
	if p2 ~= p2 or p2 < 0 then
		error(("expected damping ratio >= 0; got %.2f"):format(p2), 2)
	end
	if p3 ~= p3 or p3 < 0 then
		error(("expected undamped frequency >= 0; got %.2f"):format(p3), 2)
	end
	local v1 = if p1:IsA("Camera") or p4.Heartbeat then t8 else t7
	if p4.Heartbeat then
		p4.Heartbeat = nil
	end
	local Stop = p4.Stop
	local Priority = p4.Priority
	local v2
	if Priority then
		p4.Priority = nil
		local v3 = t10[p1]
		if v3 and Priority <= v3 then
			if v3 ~= Priority then
				return
			end
			if not Stop then
				return
			end
		end
		if v3 then
			t11.stop(p1)
		end
		t10[p1] = Priority
		v2 = true
	else
		v2 = false
	end
	if Stop and not v2 then
		local v4, v5
		if type(Stop) == "string" and Stop then
			v4 = p1
			v5 = Stop
		else
			v4 = p1
			v5 = nil
		end
		t11.stop(v4, v5)
	end
	p4.Stop = nil
	local v6 = v1[p1]
	if not v6 then
		v6 = {}
		v1[p1] = v6
	end
	for v8, v9 in p4 do
		local v7
		local v10 = t6[v8]
		v7 = if v10 and p1:IsA(v10.class) then v10.get(p1) else p1[v8]
		if typeof(v9) ~= typeof(v7) then
			error(("bad property %* to spr.target (%* expected, got %*)"):format(v8, typeof(v7), (typeof(v9))), 2)
		end
		if p3 == (1 / 0) then
			local v12 = t6[v8]
			if v12 and p1:IsA(v12.class) then
				v12.set(p1, v9)
			else
				p1[v8] = v9
			end
			v6[v8] = nil
			continue
		end
		local v13 = v6[v8]
		if not v13 then
			local v14 = t5[typeof(v9)]
			if not v14 then
				error("unsupported type: " .. typeof(v9), 2)
			end
			local v15 = v14.springType(p2, p3, v7, v9, v14)
			v6[v8] = v15
			v13 = v15
		end
		v13:setGoal(v9)
		v13:setDampingRatio(p2)
		v13:setFrequency(p3)
	end
	if next(v6) then
		return
	end
	v1[p1] = nil
end
function t11.stop(p1, p2) --[[ stop | Line: 805 | Upvalues: t7 (copy), t8 (copy), t10 (copy) ]]
	if not ("Instance"):find((typeof(p1))) then
		error(("bad argument #%* to spr.stop (Instance expected, got %*)"):format(1, (typeof(p1))), 3)
	end
	if not ("string|nil"):find((typeof(p2))) then
		error(("bad argument #%* to spr.stop (string|nil expected, got %*)"):format(2, (typeof(p2))), 3)
	end
	if p2 then
		local v1 = t7[p1] or t8[p1]
		if not v1 then
			return
		end
		v1[p2] = nil
		if not next(v1) then
			t7[p1] = nil
			t8[p1] = nil
			t10[p1] = nil
		end
	else
		t7[p1] = nil
		t8[p1] = nil
		t10[p1] = nil
	end
end
function t11.completed(p1, p2) --[[ completed | Line: 828 | Upvalues: t9 (copy) ]]
	if not ("Instance"):find((typeof(p1))) then
		error(("bad argument #%* to spr.completed (Instance expected, got %*)"):format(1, (typeof(p1))), 3)
	end
	if not ("function"):find((typeof(p2))) then
		error(("bad argument #%* to spr.completed (function expected, got %*)"):format(2, (typeof(p2))), 3)
	end
	local v1 = t9[p1]
	if v1 then
		table.insert(v1, p2)
	else
		t9[p1] = { p2 }
	end
end
return table.freeze(t11)