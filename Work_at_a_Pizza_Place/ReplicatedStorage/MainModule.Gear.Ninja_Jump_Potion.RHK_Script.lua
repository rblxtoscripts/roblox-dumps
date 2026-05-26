-- https://lua.expert/
r = game:service("RunService")
local v1 = script.Parent
v1.Enabled = true
local v2 = nil
local v3 = nil
local Sound = Instance.new("Sound")
Sound.SoundId = "http://www.roblox.com/asset/?id=45763159"
Sound.Parent = v1
Sound.Volume = 1
function blow(p1) --[[ blow | Line: 28 | Upvalues: v1 (copy), v3 (ref) ]]
	if cantHitNow then
		return
	end
	local v12 = p1.Parent:findFirstChild("Humanoid")
	local v2 = v1.Parent
	local v32 = game.Players:playerFromCharacter(v2)
	local v4 = v2:findFirstChild("Humanoid")
	if v12 == nil or (v12 == v4 or (v4 == nil or v2:FindFirstChild("Left Leg") == nil)) then
		return
	end
	tagHumanoid(v12, v32)
	if v3 then
		v3:disconnect()
		v3 = nil
	end
	wait(1)
	untagHumanoid(v12)
end
function tagHumanoid(p1, p2) --[[ tagHumanoid | Line: 57 ]]
	local creator = Instance.new("ObjectValue")
	creator.Value = p2
	creator.Name = "creator"
	creator.Parent = p1
end
function untagHumanoid(p1) --[[ untagHumanoid | Line: 66 ]]
	if p1 == nil then
		return
	end
	local v1 = p1:findFirstChild("creator")
	if v1 == nil then
		return
	end
	v1.Parent = nil
end
function onActivated() --[[ onActivated | Line: 77 | Upvalues: v1 (copy), v2 (ref), Sound (copy), v3 (ref) ]]
	v1.Handle.Transparency = 1
	if not v1.Enabled then
		return
	end
	local v12 = v1.Parent
	if v12 == nil then
		return
	end
	local HumanoidRootPart = v1.Parent:FindFirstChild("HumanoidRootPart")
	if HumanoidRootPart == nil then
		return
	end
	local Humanoid = v12:FindFirstChild("Humanoid")
	if Humanoid == nil then
		return
	end
	if v1.Parent:FindFirstChild("Left Leg") == nil then
		return
	end
	v1.Enabled = false
	v2 = Humanoid:LoadAnimation(v1.RHK2)
	v2:Play()
	torsoFrame1 = HumanoidRootPart.CFrame * CFrame.Angles(0, 1.0471975511965976, 0)
	torsoFrame2 = HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(120), 0)
	torsoFrame3 = HumanoidRootPart.CFrame * CFrame.Angles(0, math.pi, 0)
	torsoFrame4 = HumanoidRootPart.CFrame * CFrame.Angles(0, 4.1887902047863905, 0)
	torsoFrame5 = HumanoidRootPart.CFrame * CFrame.Angles(0, 5.235987755982989, 0)
	torsoFrame6 = HumanoidRootPart.CFrame
	bodyGyro = Instance.new("BodyGyro")
	bodyGyro.P = 100000
	bodyGyro.D = 3000
	local v22 = bodyGyro
	local P = bodyGyro.P
	local P_2 = bodyGyro.P
	v22.maxTorque = Vector3.new(P, P_2, bodyGyro.P)
	bodyGyro.cframe = torsoFrame1
	bodyGyro.Parent = HumanoidRootPart
	wait(0.13333333333333333)
	bodyGyro.cframe = torsoFrame2
	wait(0.13333333333333333)
	Humanoid.Jump = true
	Sound:Play()
	bodyGyro.cframe = torsoFrame3
	wait(0.13333333333333333)
	bodyGyro.cframe = torsoFrame4
	wait(0.13333333333333333)
	bodyGyro.cframe = torsoFrame5
	wait(0.13333333333333333)
	bodyGyro.cframe = torsoFrame6
	wait(0.13333333333333333)
	wait(0.5)
	if not v3 then
		bodyGyro:remove()
		wait(0.5)
		v1.Enabled = true
		v1.Handle.Transparency = 0
		return
	end
	v3:disconnect()
	v3 = nil
	bodyGyro:remove()
	wait(0.5)
	v1.Enabled = true
	v1.Handle.Transparency = 0
end
function onEquipped() --[[ onEquipped | Line: 166 | Upvalues: Sound (copy) ]]
	Sound.Volume = 1
end
function onUnequipped() --[[ onUnequipped | Line: 171 | Upvalues: v2 (ref), v3 (ref), Sound (copy) ]]
	if v2 ~= nil then
		v2:Stop()
	end
	if v3 then
		v3:disconnect()
		v3 = nil
	end
	if Sound == nil then
		return
	end
	Sound:Stop()
	Sound.Volume = 0
end
v1.Activated:connect(onActivated)
v1.Equipped:connect(onEquipped)
v1.Unequipped:connect(onUnequipped)