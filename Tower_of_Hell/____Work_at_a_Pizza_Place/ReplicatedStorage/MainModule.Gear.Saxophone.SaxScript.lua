-- https://lua.expert/
local v1 = script.Parent
local v2 = nil
v1.Enabled = true
function playSax() --[[ playSax | Line: 16 | Upvalues: v1 (copy), v2 (ref) ]]
	if not v1.Enabled then
		return
	end
	v1.Enabled = false
	if v2 then
		v2:Play()
	end
	moveToPlay()
	if math.random(1, 2) == 1 then
		v1.Handle.FirstLoop:Play()
	else
		v1.Handle.SecondLoop:Play()
	end
	if v2 then
		wait(5)
	end
	moveFromPlay()
	v1.Enabled = true
end
function loadAnim() --[[ loadAnim | Line: 32 | Upvalues: v1 (copy), v2 (ref) ]]
	local v12 = v1.Parent
	if v12 == nil then
		return
	end
	local Humanoid = v12:FindFirstChild("Humanoid")
	if Humanoid == nil then
		return
	end
	v2 = Humanoid:LoadAnimation(v1.SaxNoLoop)
end
function destroyAnim() --[[ destroyAnim | Line: 43 | Upvalues: v2 (ref) ]]
	v2 = nil
end
function moveToPlay() --[[ moveToPlay | Line: 47 | Upvalues: v1 (copy) ]]
	for i = 1, 10 do
		v1.GripForward = i / 10 * Vector3.new(-0.6821, 0.5751, -0.4517) + (10 - i) / 10 * Vector3.new(0, 1, 0)
		v1.GripPos = i / 10 * Vector3.new(0.15, -0.25, -0.15) + (10 - i) / 10 * Vector3.new(0.15, -0.25, -0.5)
		v1.GripRight = i / 10 * Vector3.new(0.7313, 0.5364, -0.4214) + (10 - i) / 10 * Vector3.new(1, 0, 0)
		v1.GripUp = i / 10 * Vector3.new(0.00001568, 0.6178, 0.7864) + (10 - i) / 10 * Vector3.new(0, 0, 1)
		wait(0.05)
	end
end
function moveFromPlay() --[[ moveFromPlay | Line: 57 | Upvalues: v1 (copy) ]]
	for i = 1, 10 do
		v1.GripForward = i / 10 * Vector3.new(0, 1, 0) + (10 - i) / 10 * Vector3.new(-0.6821, 0.5751, -0.4517)
		v1.GripPos = i / 10 * Vector3.new(0.15, -0.25, -0.5) + (10 - i) / 10 * Vector3.new(0.15, -0.25, -0.15)
		v1.GripRight = i / 10 * Vector3.new(1, 0, 0) + (10 - i) / 10 * Vector3.new(0.7313, 0.5364, -0.4214)
		v1.GripUp = i / 10 * Vector3.new(0, 0, 1) + (10 - i) / 10 * Vector3.new(0.00001568, 0.6178, 0.7864)
		wait(0.05)
	end
end
v1.Equipped:connect(loadAnim)
v1.Activated:connect(playSax)
v1.Unequipped:connect(destroyAnim)