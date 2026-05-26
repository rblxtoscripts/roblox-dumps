-- https://lua.expert/
local v1 = script.Parent
local v2 = nil
local Debris = game:GetService("Debris")
local v3 = true
local v4 = nil
local v5 = nil
function onActivated() --[[ onActivated | Line: 11 | Upvalues: v3 (ref), v5 (ref), v1 (copy), v4 (ref), Debris (copy), v2 (ref) ]]
	if not v3 then
		return
	end
	v3 = false
	v5 = v1.Parent:FindFirstChild("Humanoid")
	local BodyPosition = Instance.new("BodyPosition")
	v4 = v5:LoadAnimation(v1.drink)
	v4:Play()
	wait(0.35)
	v1.Handle.Drink:Play()
	wait(1)
	v4:remove()
	local t = {}
	if v5.Parent:FindFirstChild("GoalHat") == nil then
		local v12 = v5.Parent:GetChildren()
		for i = 1, #v12 do
			if v12[i].className == "Hat" then
				table.insert(t, v12[i])
				if v12[i]:FindFirstChild("Handle") ~= nil then
					v12[i].Handle.Transparency = 1
				end
			end
		end
		local Hat = Instance.new("Hat")
		Hat.AttachmentPos = Vector3.new(0, 0.7, 0.1)
		local Handle = Instance.new("Part")
		Handle.Name = "Handle"
		Handle.Size = Vector3.new(4, 2.4, 2)
		local SpecialMesh = Instance.new("SpecialMesh")
		SpecialMesh.MeshId = "http://www.roblox.com/asset/?id=28663399"
		SpecialMesh.TextureId = "http://www.roblox.com/asset/?id=28663458"
		SpecialMesh.Parent = Handle
		Handle.Parent = Hat
		Hat.Parent = v5.Parent
		Debris:AddItem(Hat, 6.3)
	end
	v1.Handle.Goal:Play()
	BodyPosition.P = recursiveGetLift(v1.Parent) * 5
	BodyPosition.D = 0
	BodyPosition.maxForce = Vector3.new(BodyPosition.P, BodyPosition.P, BodyPosition.P)
	BodyPosition.position = Vector3.new(0, 0, 0)
	local Torso = v5.Parent:FindFirstChild("Torso")
	if Torso ~= nil then
		local unit = Torso.CFrame.lookVector.unit
		local v32 = math.abs(unit.x)
		local v42 = v32 + math.abs(unit.z)
		BodyPosition.position = Vector3.new(Torso.Position.x + unit.x / v42 * 48, Torso.Position.y, Torso.Position.z + unit.z / v42 * 48)
	end
	v2 = v5:LoadAnimation(v1.goal)
	v2:Play(0.1, 1, 0.5)
	wait(0.5)
	if Torso ~= nil then
		BodyPosition.Parent = Torso
	end
	Debris:AddItem(BodyPosition, 2.25)
	wait(2.3)
	v5.Jump = true
	wait(3.5)
	for j = 1, #t do
		t[j].Handle.Transparency = 0
	end
	v3 = true
end
function onEquipped() --[[ onEquipped | Line: 105 | Upvalues: v1 (copy) ]]
	v1.Handle.Goal:Stop()
end
function onUnequipped() --[[ onUnequipped | Line: 109 | Upvalues: v1 (copy), v2 (ref) ]]
	print("hit it")
	v1.Handle.Goal:Stop()
	if v2 == nil then
		return
	end
	v2:Stop()
	v2:remove()
end
function recursiveGetLift(p1) --[[ recursiveGetLift | Line: 120 ]]
	local sum = 0
	local v1 = p1:GetChildren()
	if p1:FindFirstChild("Head") ~= nil then
		head = p1:FindFirstChild("Head")
	end
	for i = 1, #v1 do
		if v1[i].className == "Part" and (head ~= nil and (v1[i].Position - head.Position).magnitude < 10) then
			sum = if v1[i].Name == "Handle" then sum + v1[i]:GetMass() * 196.66666666666669 * 1 else sum + v1[i]:GetMass() * 196.66666666666669 * 1.05
		end
		sum = sum + recursiveGetLift(v1[i])
	end
	return sum
end
v1.Activated:connect(onActivated)
v1.Equipped:connect(onEquipped)
v1.Unequipped:connect(OnUnequipped)