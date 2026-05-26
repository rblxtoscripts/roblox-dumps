-- https://lua.expert/
local v1 = script.Parent
local Handle = v1.Handle
local v2 = nil
local v3 = nil
local v4 = nil
local v5 = nil
local v6 = nil
local v7 = nil
local SpecialMesh = Instance.new("SpecialMesh")
SpecialMesh.MeshId = "http://www.roblox.com/asset/?id=60354828"
SpecialMesh.TextureId = "http://www.roblox.com/asset/?id=60257648"
SpecialMesh.Scale = Vector3.new(0.75, 0.75, 0.75)
v1.Enabled = true
local v8 = nil
local v9 = nil
function onActivated() --[[ onActivated | Line: 26 | Upvalues: v1 (copy), v9 (ref), v2 (ref), v3 (ref), v4 (ref), v5 (ref), v6 (ref), v7 (ref), SpecialMesh (copy), v8 (ref), Handle (copy) ]]
	if v1.Enabled == false then
		return
	end
	v9 = v1:FindFirstChild("StiltActive")
	if not v9 or v9.Value ~= 0 then
		return
	end
	v9.Value = 1
	v1.Enabled = false
	v2 = v1.Parent
	v3 = v2:FindFirstChild("Torso")
	myHumanoid = v2:FindFirstChild("Humanoid")
	if v3 == nil or myHumanoid == nil then
		return
	end
	v4 = v3:FindFirstChild("LeftStiltWeld")
	v5 = v3:FindFirstChild("RightStiltWeld")
	v6 = v2:FindFirstChild("LeftStilt")
	v7 = v2:FindFirstChild("RightStilt")
	if not (v6 or v7) then
		v7 = Instance.new("Part")
		v7.CanCollide = true
		v7.Name = "LeftStilt"
		v7.FormFactor = 3
		v7.Shape = "Block"
		v7.Size = Vector3.new(0.4, 6, 0.4)
		v7.Parent = v2
		SpecialMesh:Clone().Parent = v7
		v5 = Instance.new("Weld")
		v5.Name = "RightStiltWeld"
		v5.Part0 = v3
		v5.Part1 = v7
		v5.C1 = CFrame.new(Vector3.new(-1, 2, 0))
		v5.Parent = v3
		v6 = Instance.new("Part")
		v6.CanCollide = true
		v6.Name = "RightStilt"
		v6.FormFactor = 3
		v6.Shape = "Block"
		v6.Size = Vector3.new(0.4, 6, 0.4)
		v6.Parent = v2
		local v12 = SpecialMesh:Clone()
		v12.MeshId = "http://www.roblox.com/asset/?id=60355643"
		v12.Parent = v6
		v4 = Instance.new("Weld")
		v4.Name = "LeftStiltWeld"
		v4.Part0 = v3
		v4.Part1 = v6
		v4.C1 = CFrame.new(Vector3.new(1, 2, 0))
		v4.Parent = v3
		myHumanoid.Jump = true
	end
	v8 = myHumanoid:LoadAnimation(v1.StiltWalkAnim)
	if v8 then
		v8:Play()
	end
	Handle.Transparency = 1
	animateScript = v1:FindFirstChild("StiltAnimateScript")
	if animateScript then
		animateScript = animateScript:Clone()
		animateScript.Parent = v2
		animateScript.Disabled = false
	end
	wait(2)
	v1.Enabled = true
end
function onEquipped() --[[ onEquipped | Line: 105 ]] end
function onUnequipped() --[[ onUnequipped | Line: 108 | Upvalues: Handle (copy), v6 (ref), v7 (ref), v9 (ref), v1 (copy), v8 (ref), v2 (ref) ]]
	Handle.Transparency = 0
	if v6 then
		v6:Remove()
		v6 = nil
	end
	if v7 then
		v7:Remove()
		v7 = nil
	end
	v9 = v1:FindFirstChild("StiltActive")
	if v9 then
		v9.Value = 0
	end
	if v8 then
		v8:Stop()
	end
	local StiltAnimateScript = v2:FindFirstChild("StiltAnimateScript")
	if not StiltAnimateScript then
		return
	end
	StiltAnimateScript:Remove()
end
v1.Activated:connect(onActivated)
v1.Equipped:connect(onEquipped)
v1.Unequipped:connect(onUnequipped)