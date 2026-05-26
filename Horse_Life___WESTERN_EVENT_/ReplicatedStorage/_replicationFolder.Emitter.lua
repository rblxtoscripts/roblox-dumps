-- https://lua.expert/
local t = {}
local v1 = Random.new()
local t2 = {}
local t3 = {}
local t4 = {}
game:GetService("RunService"):BindToRenderStep("UI_ParticleModule", Enum.RenderPriority.First.Value + 1, function(p1) --[[ Line: 8 | Upvalues: t2 (copy), t3 (copy), t4 (copy) ]]
	for k, v in pairs(t2) do
		if v.Emitter.Enabled and tick() - v.lastEmission >= v.Emitter.Rate ^ (-1) then
			v.lastEmission = tick()
			addParticle(v.Emitter, v.Emitter.Parent, v.Scale)
		end
	end
	local tbl = {}
	for k, v in pairs(t3) do
		local v1 = tick() - v.Start
		local v2 = v1 / v.Lifetime
		if v.Lifetime <= v1 then
			table.insert(tbl, v)
			continue
		end
		local v3, v4, v5 = getKeypointsFromTime(v.Transparency, v2)
		v.UI.ImageTransparency = lerpValue(v3.Value, v4.Value, v5)
		local v6, v7, v8 = getKeypointsFromTime(v.Size, v2)
		local v9 = lerpValue(v6.Value, v7.Value, v8) * 100 * v.Scale
		v.UI.Size = UDim2.new(0, v9, 0, v9)
		local v10, v11, v12 = getKeypointsFromTime(v.Emitter.Color, v2)
		v.UI.ImageColor3 = v10.Value:Lerp(v11.Value, v12)
		v.UI.Rotation = v.UI.Rotation + v.RotSpeed * p1
		local v15 = 1 - math.min(1, v1 ^ 4 * (v.Emitter.Drag / 10))
		local SpreadAngle = v.SpreadAngle
		v.SpeedDisplacement = v.SpeedDisplacement + v.Speed * p1 * v15
		if v.Emitter.EmissionDirection == Enum.NormalId.Bottom then
			SpreadAngle = SpreadAngle + 180
		elseif v.Emitter.EmissionDirection == Enum.NormalId.Right then
			SpreadAngle = SpreadAngle + 90
		elseif v.Emitter.EmissionDirection == Enum.NormalId.Left then
			SpreadAngle = SpreadAngle + 270
		end
		local v20 = UDim2.new(0, math.sin((math.rad(SpreadAngle))) * v.SpeedDisplacement, 0, -math.cos((math.rad(SpreadAngle))) * v.SpeedDisplacement)
		v.Accel = v.Accel + v.Emitter.Acceleration * 100 * v.Scale * v1 ^ 2 * p1 * v15
		v.UI.Position = v.StartPos + v20 + UDim2.new(0, v.Accel.X, 0, -v.Accel.Y)
	end
	for k, v in pairs(tbl) do
		v.UI.ImageTransparency = 1
		table.insert(t4, {
			UI = v.UI,
			RemoveAt = tick() + 3 * v.Emitter.Rate ^ (-1)
		})
		table.remove(t3, table.find(t3, v))
	end
	local tbl2 = {}
	for k, v in pairs(t4) do
		if tick() >= v.RemoveAt then
			v.UI:Destroy()
			table.insert(tbl2, v)
		end
	end
	for k, v in pairs(tbl2) do
		table.remove(t4, table.find(t4, v))
	end
end)
function lerpValue(p1, p2, p3) --[[ lerpValue | Line: 91 ]]
	return p1 + (p2 - p1) * p3
end
function r_num(p1, p2) --[[ r_num | Line: 95 | Upvalues: v1 (copy) ]]
	return v1:NextNumber(if p2 and p1 then p1 else 0, p2 or p1)
end
function addParticle(p1, p2, p3) --[[ addParticle | Line: 99 | Upvalues: t4 (copy), t3 (copy) ]]
	local v1 = nil
	for k, v in pairs(t4) do
		if v.UI then
			v1 = v.UI
			v1.Parent = p2
			table.remove(t4, table.find(t4, v))
			break
		end
	end
	if not v1 then
		local ImageLabel = Instance.new("ImageLabel", p2)
		ImageLabel.BackgroundTransparency = 1
		ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		v1 = ImageLabel
	end
	v1.Image = p1.Texture
	v1.ZIndex = p1.ZOffset
	local v2 = UDim2.new(r_num(0, 1), 0, r_num(0, 1), 0)
	v1.Position = v2
	v1.ImageColor3 = p1.Color.Keypoints[1].Value
	local v3 = p1.Size.Keypoints[1]
	local v4 = r_num(v3.Value - v3.Envelope, v3.Value + v3.Envelope) * 100 * p3
	v1.Size = UDim2.new(0, v4, 0, v4)
	local v5 = p1.Transparency.Keypoints[1]
	v1.ImageTransparency = r_num(v5.Value - v5.Envelope, v5.Value + v5.Envelope)
	v1.Rotation = r_num(p1.Rotation.Min, p1.Rotation.Max)
	local v6 = r_num(p1.Speed.Min, p1.Speed.Max) * 100 * p3
	local v7 = r_num(p1.RotSpeed.Min, p1.RotSpeed.Max)
	local v8 = r_num(-p1.SpreadAngle.X, p1.SpreadAngle.Y)
	local v9 = getRandomNumberSequence(p1.Transparency)
	local v10 = getRandomNumberSequence(p1.Size)
	table.insert(t3, {
		SpeedDisplacement = 0,
		Accel = Vector3.new(0, 0, 0),
		Emitter = p1,
		UI = v1,
		Start = tick(),
		Lifetime = r_num(p1.Lifetime.Min, p1.Lifetime.Max),
		Transparency = v9,
		Size = v10,
		Speed = v6,
		RotSpeed = v7,
		SpreadAngle = v8,
		StartPos = v2,
		Scale = p3
	})
end
function getRandomNumberSequence(p1) --[[ getRandomNumberSequence | Line: 154 ]]
	local t = {
		Keypoints = {}
	}
	for k, v in pairs(p1.Keypoints) do
		table.insert(t.Keypoints, {
			Time = v.Time,
			Value = r_num(v.Value - v.Envelope, v.Value + v.Envelope)
		})
	end
	return t
end
function getKeypointsFromTime(p1, p2) --[[ getKeypointsFromTime | Line: 164 ]]
	for k, v in pairs(p1.Keypoints) do
		if p2 < v.Time then
			local v1 = p1.Keypoints[k - 1]
			local v2 = p1.Keypoints[k]
			return v1, v2, (p2 - v1.Time) / (v2.Time - v1.Time)
		end
	end
end
function t.AddEmitter(p1, p2, p3) --[[ AddEmitter | Line: 179 | Upvalues: t2 (copy) ]]
	table.insert(t2, {
		Emitter = p2,
		lastEmission = tick(),
		Scale = p3 or 1
	})
end
function t.RemoveEmitter(p1, p2) --[[ RemoveEmitter | Line: 183 | Upvalues: t2 (copy) ]]
	local tbl = {}
	for k, v in pairs(t2) do
		if v.Emitter == p2 then
			table.insert(tbl, v)
			break
		end
	end
	for k, v in pairs(tbl) do
		table.remove(t2, table.find(t2, v))
	end
end
return t