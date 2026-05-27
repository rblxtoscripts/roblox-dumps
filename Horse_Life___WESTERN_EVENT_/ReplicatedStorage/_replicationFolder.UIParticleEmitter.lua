-- https://lua.expert/
local t = {}
t.__index = t
local function Rotate(p1, p2) --[[ Rotate | Line: 4 ]]
	local v2 = math.sin((math.rad(p2)))
	local v4 = math.cos((math.rad(p2)))
	local x = p1.x
	local y = p1.y
	return Vector2.new(v4 * x - v2 * y, v2 * x + v4 * y)
end
local function Normalize(p1, p2, p3) --[[ Normalize | Line: 13 ]]
	return (p3 - p1) / (p2 - p1)
end
function evalCS(p1, p2) --[[ evalCS | Line: 19 ]]
	if typeof(p1) ~= "ColorSequence" then
		return p1
	end
	if p2 == 0 then
		return p1.Keypoints[1].Value
	end
	if p2 == 1 then
		return p1.Keypoints[#p1.Keypoints].Value
	end
	for i = 1, #p1.Keypoints - 1 do
		local v1 = p1.Keypoints[i]
		local v2 = p1.Keypoints[i + 1]
		if v1.Time <= p2 and p2 < v2.Time then
			local v3 = (p2 - v1.Time) / (v2.Time - v1.Time)
			return Color3.new((v2.Value.R - v1.Value.R) * v3 + v1.Value.R, (v2.Value.G - v1.Value.G) * v3 + v1.Value.G, (v2.Value.B - v1.Value.B) * v3 + v1.Value.B)
		end
	end
end
local function evalNS(p1, p2) --[[ evalNS | Line: 42 ]]
	if typeof(p1) ~= "NumberSequence" then
		return p1
	end
	if p2 == 0 then
		return p1.Keypoints[1].Value
	end
	if p2 == 1 then
		return p1.Keypoints[#p1.Keypoints].Value
	end
	for i = 1, #p1.Keypoints - 1 do
		local v1 = p1.Keypoints[i]
		local v2 = p1.Keypoints[i + 1]
		if v1.Time <= p2 and p2 < v2.Time then
			return (v2.Value - v1.Value) * ((p2 - v1.Time) / (v2.Time - v1.Time)) + v1.Value
		end
	end
end
function evalNR(p1) --[[ evalNR | Line: 61 ]]
	if typeof(p1) == "NumberRange" then
		return math.random(p1.Min, p1.Max)
	else
		return p1
	end
end
function t.new(p1) --[[ new | Line: 65 | Upvalues: t (copy) ]]
	local t2 = {
		Element = p1.Element:Clone(),
		Color = p1.Color
	}
	t2.StartSize = t2.Element.AbsoluteSize
	t2.Transparency = p1.Transparency
	t2.Canvas = Instance.new("CanvasGroup")
	t2.Canvas.Parent = game.Players.LocalPlayer.PlayerGui.WorkspaceGui
	t2.Canvas.Size = UDim2.fromOffset(t2.Element.AbsoluteSize.X, t2.Element.AbsoluteSize.Y)
	t2.Canvas.AnchorPoint = Vector2.new(0.5, 0.5)
	t2.Canvas.BackgroundTransparency = 1
	t2.Canvas.ZIndex = p1.Hook.ZIndex + p1.ZOffset
	t2.Canvas.GroupColor3 = evalCS(t2.Color, 0)
	local Transparency = t2.Transparency
	t2.Canvas.GroupTransparency = if typeof(Transparency) == "NumberSequence" then Transparency.Keypoints[1].Value else Transparency
	t2.Element.Size = UDim2.fromScale(1, 1)
	local v2
	if p1.EmitterMode == "Point" then
		local AbsolutePosition = p1.Hook.AbsolutePosition
		local AbsoluteSize = p1.Hook.AbsoluteSize
		v2 = Vector2.new(AbsolutePosition.X + AbsoluteSize.X / 2, AbsolutePosition.Y + AbsoluteSize.Y / 2)
	else
		local AbsolutePosition = p1.Hook.AbsolutePosition
		local AbsoluteSize = p1.Hook.AbsoluteSize
		v2 = Vector2.new(AbsolutePosition.X + math.random(0, AbsoluteSize.X), AbsolutePosition.Y + math.random(0, AbsoluteSize.Y))
	end
	t2.Position = v2
	t2.Canvas.Position = UDim2.new(UDim.new(0, t2.Position.X), UDim.new(0, t2.Position.Y))
	t2.Element.AnchorPoint = Vector2.new(0.5, 0.5)
	t2.Element.Position = UDim2.fromScale(0.5, 0.5)
	t2.Element.Parent = t2.Canvas
	t2.Size = p1.Size
	p1.preSpawn(t2.Element)
	t2.Speed = Vector2.new(evalNR(p1.xSpeed), evalNR(p1.ySpeed))
	t2.SpreadAngle = evalNR(p1.SpreadAngle)
	t2.RotSpeed = evalNR(p1.RotSpeed)
	local Acceleration = p1.Acceleration
	local v5 = -t2.SpreadAngle
	local v7 = math.sin((math.rad(v5)))
	local v9 = math.cos((math.rad(v5)))
	local x = Acceleration.x
	local y = Acceleration.y
	t2.Acceleration = Vector2.new(v9 * x - v7 * y, v7 * x + v9 * y)
	t2.Transparency = p1.Transparency
	t2.Age = 0
	t2.Ticks = 0
	t2.maxAge = evalNR(p1.Lifetime)
	t2.isDead = false
	return setmetatable(t2, t)
end
function t.Update(p1, p2) --[[ Update | Line: 124 | Upvalues: evalNS (copy) ]]
	if p1.isDead then
		return
	end
	if p1.Age >= p1.maxAge + 1 and p1.maxAge > 0 then
		p1:Destroy()
		return
	end
	p1.Ticks = p1.Ticks + 1
	p1.Age = p1.Age + p2
	local v2 = evalNS(p1.Size.X, (p1.Age - 0) / (p1.maxAge - 0))
	local v4 = evalNS(p1.Size.Y, (math.min(p1.Age, p1.maxAge) - 0) / (p1.maxAge - 0))
	if v2 and v4 then
		p1.Canvas.Size = UDim2.new(UDim.new(0, p1.StartSize.X * v2), UDim.new(0, p1.StartSize.Y * v4))
	end
	local v6 = evalCS(p1.Color, (math.min(p1.Age, p1.maxAge) - 0) / (p1.maxAge - 0))
	if v6 and v6 ~= p1.Canvas.GroupColor3 then
		p1.Canvas.GroupColor3 = v6
	end
	p1.Canvas.GroupTransparency = evalNS(p1.Transparency, (math.min(p1.Age, p1.maxAge) - 0) / (p1.maxAge - 0))
	local Speed = p1.Speed
	local SpreadAngle = p1.SpreadAngle
	local v9 = math.sin((math.rad(SpreadAngle)))
	local v11 = math.cos((math.rad(SpreadAngle)))
	local x = Speed.x
	local y = Speed.y
	local v12 = Vector2.new(v11 * x - v9 * y, v9 * x + v11 * y) * Vector2.new(1, -1)
	p1.Speed = p1.Speed + p1.Acceleration * p2
	p1.Position = p1.Position + v12 * p2
	p1.Canvas.Position = UDim2.new(UDim.new(0, p1.Position.X), UDim.new(0, p1.Position.Y))
	local Canvas_2 = p1.Canvas
	Canvas_2.Rotation = Canvas_2.Rotation + p1.RotSpeed * p2
end
function t.Destroy(p1) --[[ Destroy | Line: 163 ]]
	p1.isDead = true
	p1.Canvas:Destroy()
end
local t2 = {}
t2.__index = t2
function t2.fromEmitter3D(p1, p2, p3) --[[ fromEmitter3D | Line: 198 | Upvalues: t (copy), t2 (copy) ]]
	local t3 = {}
	local v1 = p3 or 1
	t3.particles = {}
	t3.Enabled = false
	t3.Element = Instance.new("ImageLabel")
	t3.Element.Size = UDim2.new(0, v1, 0, v1)
	t3.Element.Image = p2.Texture
	t3.Element.BackgroundTransparency = 1
	t3.Element.Parent = game.ReplicatedStorage
	t3.Hook = p1
	function t3.preSpawn(p1) --[[ Line: 210 ]] end
	t3.Rate = p2.Rate
	t3.Color = p2.Color
	t3.Size = {
		X = p2.Size,
		Y = p2.Size
	}
	t3.Transparency = p2.Transparency
	t3.ZOffset = p2.ZOffset
	t3.xSpeed = NumberRange.new(0, 0)
	t3.ySpeed = NumberRange.new(p2.Speed.Min * v1, p2.Speed.Max * v1)
	t3.SpreadAngle = NumberRange.new(p2.SpreadAngle.X, p2.SpreadAngle.Y)
	t3.RotSpeed = p2.RotSpeed
	t3.Lifetime = p2.Lifetime
	t3.Acceleration = Vector2.new(p2.Acceleration.X * v1, p2.Acceleration.Y * v1)
	t3.EmitterMode = if p2.ShapeStyle == Enum.ParticleEmitterShapeStyle.Volume then "Fill" else "Point"
	t3.__dead = false
	t3.__elapsedTime = 0
	t3.__runServiceConnection = game:GetService("RunService").Heartbeat:Connect(function(p1) --[[ Line: 232 | Upvalues: t3 (copy), t (ref) ]]
		t3.__elapsedTime = t3.__elapsedTime + p1
		for i, v in ipairs(t3.particles) do
			if v.isDead then
				table.remove(t3.particles, i)
				continue
			end
			v:Update(p1)
		end
		if not (t3.Rate > 0) or (t3.__dead ~= false or not t3.Enabled) then
			return
		end
		while t3.__elapsedTime >= 1 / t3.Rate do
			table.insert(t3.particles, t.new(t3))
			t3.__elapsedTime = t3.__elapsedTime - 1 / t3.Rate
		end
	end)
	return setmetatable(t3, t2)
end
function t2.new(p1, p2) --[[ new | Line: 256 | Upvalues: t (copy), t2 (copy) ]]
	local t3 = {
		particles = {},
		Enabled = false,
		Element = p2,
		Hook = p1,
		preSpawn = function(p1) --[[ Line: 264 ]] end,
		Rate = 20,
		Color = ColorSequence.new(Color3.new(255/255, 255/255, 255/255)),
		Size = {
			X = NumberSequence.new(1),
			Y = NumberSequence.new(1)
		},
		Transparency = NumberSequence.new(0),
		ZOffset = 0,
		xSpeed = NumberRange.new(0, 0),
		ySpeed = NumberRange.new(150, 500),
		SpreadAngle = NumberRange.new(-15, 15),
		RotSpeed = NumberRange.new(0),
		Lifetime = NumberRange.new(5, 10),
		Acceleration = Vector2.new(0, -500),
		EmitterMode = "Point",
		__dead = false,
		__elapsedTime = 0
	}
	t3.__runServiceConnection = game:GetService("RunService").Heartbeat:Connect(function(p1) --[[ Line: 288 | Upvalues: t3 (copy), t (ref) ]]
		t3.__elapsedTime = t3.__elapsedTime + p1
		for i, v in ipairs(t3.particles) do
			if v.isDead then
				table.remove(t3.particles, i)
				continue
			end
			v:Update(p1)
		end
		if not (t3.Rate > 0) or (t3.__dead ~= false or not t3.Enabled) then
			return
		end
		while t3.__elapsedTime >= 1 / t3.Rate do
			table.insert(t3.particles, t.new(t3))
			t3.__elapsedTime = t3.__elapsedTime - 1 / t3.Rate
		end
	end)
	return setmetatable(t3, {
		__index = t2
	})
end
function t2.Emit(p1, p2) --[[ Emit | Line: 313 | Upvalues: t (copy) ]]
	local count = 0
	while count < p2 do
		table.insert(p1.particles, t.new(p1))
		count = count + 1
	end
end
function t2.Destroy(p1) --[[ Destroy | Line: 322 ]]
	if p1.__dead then
		error("Cannot destroy dead particle emitter.")
	end
	p1.__dead = true
	for i, v in ipairs(p1.particles) do
		if v then
			v:Destroy()
		end
	end
	if not p1.__runServiceConnection then
		return
	end
	p1.__runServiceConnection:Disconnect()
end
return t2