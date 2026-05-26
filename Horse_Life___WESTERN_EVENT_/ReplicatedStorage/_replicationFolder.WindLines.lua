-- https://lua.expert/
local Terrain = workspace:WaitForChild("Terrain")
local t = {}
local t2 = {
	UpdateQueue = table.create(10)
}
local v1 = Random.new()
function t2.init(p1) --[[ init | Line: 13 | Upvalues: t2 (copy) ]]
	t2.Lifetime = p1.Lifetime or 3
	t2.Direction = p1.Direction or Vector3.new(1, 0, 0)
	t2.Speed = p1.Speed or 6
	t2.SpawnRate = p1.SpawnRate
	t2.Color = p1.Color
	if t2.UpdateConnection then
		t2.UpdateConnection:Disconnect()
		t2.UpdateConnection = nil
	end
	for i, v in ipairs(t2.UpdateQueue) do
		v.Attachment0:Destroy()
		v.Attachment1:Destroy()
		v.Trail:Destroy()
	end
	table.clear(t2.UpdateQueue)
	t2.LastSpawned = os.clock()
end
function t2.cleanup() --[[ cleanup | Line: 77 | Upvalues: t2 (copy) ]]
	if t2.UpdateConnection then
		t2.UpdateConnection:Disconnect()
		t2.UpdateConnection = nil
	end
	for i, v in ipairs(t2.UpdateQueue) do
		v.Attachment0:Destroy()
		v.Attachment1:Destroy()
		v.Trail:Destroy()
	end
	table.clear(t2.UpdateQueue)
end
function t2.create(p1) --[[ create | Line: 91 | Upvalues: t (copy), t2 (copy), v1 (copy), Terrain (copy) ]]
	debug.profilebegin("Add Wind Line")
	local v12 = if p1 then p1 else t
	local v3 = workspace.CurrentCamera.CFrame * CFrame.new(0, 0, -200)
	local Position = v12.Position
	if not Position then
		local v4 = v1:NextNumber(-1, 1)
		local v5 = v1:NextNumber(-1, 1)
		Position = v3.p + Vector3.new(v4, v5, v1:NextNumber(-1, 1)).Unit * v1:NextNumber(30, 150)
	end
	local v7 = v12.Speed or t2.Speed
	if v7 <= 0 then
		return
	end
	local Attachment = Instance.new("Attachment")
	local Attachment_2 = Instance.new("Attachment")
	local Trail = Instance.new("Trail")
	Trail.Color = ColorSequence.new(t2.Color or Color3.new(255/255, 255/255, 255/255))
	Trail.Attachment0 = Attachment
	Trail.Attachment1 = Attachment_2
	Trail.WidthScale = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 0),
		NumberSequenceKeypoint.new(0.2, 32),
		NumberSequenceKeypoint.new(0.8, 32),
		NumberSequenceKeypoint.new(1, 0)
	})
	Trail.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1),
		NumberSequenceKeypoint.new(0.1, 0.5),
		NumberSequenceKeypoint.new(0.6, 0.5),
		NumberSequenceKeypoint.new(1, 1)
	})
	Trail.FaceCamera = true
	Trail.Lifetime = 0.5
	Trail.Parent = Attachment
	Attachment.WorldPosition = Position
	Attachment_2.WorldPosition = Position
	t2.UpdateQueue[#t2.UpdateQueue + 1] = {
		Attachment0 = Attachment,
		Attachment1 = Attachment_2,
		Trail = Trail,
		Lifetime = v12.Lifetime or t2.Lifetime,
		Position = Position,
		Direction = t2.Direction,
		Speed = v7 + math.random(-10, 10) * 0.1,
		StartClock = os.clock(),
		Seed = math.random(1, 1000) * 0.1,
		CurlSize = math.random(1, 3)
	}
	Attachment.Parent = Terrain
	Attachment_2.Parent = Terrain
	debug.profileend()
end
return t2