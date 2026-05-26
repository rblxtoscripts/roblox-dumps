-- https://lua.expert/
local v1 = 0
local v2 = script.Parent
local Handle = v2.Handle
v2:Clone()
local v3 = nil
local v4 = nil
local v5 = nil
local v6 = nil
local v7 = nil
local v8 = nil
local v9 = nil
local v10 = false
local v11 = nil
local v12 = nil
local v13 = nil
local v14 = nil
local v15 = nil
local v16 = nil
local t = { 57197301, 57197341, 57197361 }
local v17 = nil
v2.Enabled = true
function tagHumanoid(p1, p2) --[[ tagHumanoid | Line: 41 ]]
	if not (p1 and p2) then
		return
	end
	local creator = Instance.new("ObjectValue")
	creator.Name = "creator"
	creator.Parent = p1
	creator.Value = p2
end
function untagHumanoid(p1) --[[ untagHumanoid | Line: 50 ]]
	if not p1 then
		return
	end
	local creator = p1:FindFirstChild("creator")
	if not creator then
		return
	end
	creator:Remove()
end
function blow(p1) --[[ blow | Line: 60 | Upvalues: v11 (ref), v2 (copy), v12 (ref), v13 (ref), v15 (ref), Handle (copy) ]]
	if not (p1 and p1.Parent) then
		return
	end
	v11 = v2.Parent
	v12 = v11:FindFirstChild("Humanoid")
	v13 = game.Players:GetPlayerFromCharacter(v11)
	local Humanoid = p1.Parent:FindFirstChild("Humanoid")
	if not v12 or (not Humanoid or v12 == Humanoid) then
		return
	end
	v15 = v11:FindFirstChild("Right Arm")
	if not v15 then
		return
	end
	local RightGrip = v15:FindFirstChild("RightGrip")
	if not RightGrip or RightGrip.Part0 ~= Handle and RightGrip.Part1 ~= Handle then
		return
	end
	tagHumanoid(Humanoid, v13)
	wait(1)
	untagHumanoid(Humanoid)
end
function displayAndWeldPaper() --[[ displayAndWeldPaper | Line: 86 | Upvalues: v3 (ref), v14 (ref), v17 (ref), t (copy), v4 (ref) ]]
	v3 = Instance.new("Part")
	v3.Name = "Paper"
	v3.FormFactor = 3
	v3.Size = Vector3.new(1, 0.2, 1)
	v3.CanCollide = false
	v3.Locked = true
	v3.BrickColor = BrickColor.new(5)
	v3.Parent = game.Workspace
	v3.CFrame = v14.CFrame + 2 * v14.CFrame.lookVector
	v17 = Instance.new("SpecialMesh")
	v17.MeshId = "http://www.roblox.com/asset/?id=57196972"
	math.random(tick())
	v17.TextureId = "http://www.roblox.com/asset/?id=" .. t[math.random(1, 3)]
	v17.Scale = Vector3.new(0.25, 0.25, 0.25)
	v17.Parent = v3
	v4 = Instance.new("Weld")
	v4.Parent = v3
	v4.Part0 = v3
	v4.Part1 = v14
	v4.C0 = CFrame.new(Vector3.new(0, -0.2, 1.5))
end
function unfold(p1) --[[ unfold | Line: 125 | Upvalues: v2 (copy), v11 (ref), v12 (ref), v15 (ref), v16 (ref), v14 (ref), v7 (ref), v10 (ref), v9 (ref), Handle (copy) ]]
	if p1:lower() ~= "x" then
		return
	end
	if not v2.Enabled then
		return
	end
	v2.Enabled = false
	v11 = v2.Parent
	if not v11 then
		return
	end
	v12 = v11:FindFirstChild("Humanoid")
	if not v12 then
		return
	end
	v15 = v11:FindFirstChild("Right Arm")
	v16 = v11:FindFirstChild("Left Arm")
	v14 = v11:FindFirstChild("HumanoidRootPart")
	v7 = v12:LoadAnimation(v2.SwordToPaper)
	if v7 then
		v7:Play()
	end
	if v10 then
		fold()
		return
	end
	v10 = true
	v9 = v2:FindFirstChild("FoldSound")
	if v9 then
		v9:Play()
	end
	wait(0.5)
	displayAndWeldPaper()
	if not (v15 and v16) then
		return
	end
	for i = 1, 25 do
		Handle.Mesh.Scale = (25 - i) / 25 * Vector3.new(2, 2, 2)
		v2.GripPos = Vector3.new(0, 0, -1.75) + Vector3.new(0, 0, i / 12.5)
		wait(0.02)
	end
	v2.Enabled = true
end
function fold() --[[ fold | Line: 169 | Upvalues: v15 (ref), v16 (ref), v10 (ref), v8 (ref), v12 (ref), v2 (copy), v9 (ref), Handle (copy), v17 (ref), v3 (ref) ]]
	if not (v15 and v16) then
		return
	end
	v10 = false
	v8 = v12:LoadAnimation(v2.PaperToSword)
	if v8 then
		v8:Play()
	end
	wait(0.5)
	v9 = v2.Handle:FindFirstChild("FoldSound")
	if v9 then
		v9:Play()
	end
	for i = 1, 25 do
		Handle.Mesh.Scale = i / 25 * Vector3.new(2, 2, 2)
		v2.GripPos = Vector3.new(0, 0, -1.75) + Vector3.new(0, 0, (25 - i) / 12.5)
		v17.Scale = Vector3.new((25 - i) / 100, (25 - i) / 100, (25 - i) / 100)
		wait(0.02)
	end
	if v3 then
		v3:Remove()
	end
	wait(0.5)
	v2.Enabled = true
end
function onActivated() --[[ onActivated | Line: 199 | Upvalues: v10 (ref), v2 (copy), v11 (ref), v12 (ref), v1 (ref), v5 (ref), v6 (ref) ]]
	if v10 then
		return
	end
	if not v2.Enabled then
		return
	end
	v2.Enabled = false
	v11 = v2.Parent
	if not v11 then
		return
	end
	v12 = v11:FindFirstChild("Humanoid")
	if not v12 then
		return
	end
	v1 = 0.3
	v5 = v12:LoadAnimation(v2.Slash)
	if v5 then
		v5:Play()
	end
	v6 = v2.Handle:FindFirstChild("CrumpleSound")
	if not v6 then
		wait(1)
		v1 = 0
		v2.Enabled = true
		return
	end
	v6:Play()
	wait(1)
	v1 = 0
	v2.Enabled = true
end
function onEquipped(p1) --[[ onEquipped | Line: 225 | Upvalues: v3 (ref), v10 (ref), Handle (copy), v2 (copy) ]]
	p1.KeyDown:connect(unfold)
	if v3 then
		v3:Remove()
	end
	if v10 then
		displayAndWeldPaper()
		Handle.Mesh.Scale = Vector3.new(0, 0, 0)
		v2.GripPos = Vector3.new(0, 0, 0.25)
	else
		Handle.Mesh.Scale = Vector3.new(2, 2, 2)
		v2.GripPos = Vector3.new(0, 0, -1.75)
	end
end
function onUnequipped() --[[ onUnequipped | Line: 244 | Upvalues: v5 (ref), v6 (ref), v8 (ref), v7 (ref), v9 (ref), v3 (ref), v10 (ref), Handle (copy), v2 (copy) ]]
	if v5 then
		v5:Stop()
	end
	if v6 then
		v6:Stop()
	end
	if v8 then
		v8:Stop()
	end
	if v7 then
		v7:Stop()
	end
	if v9 then
		v9:Stop()
	end
	if v3 then
		v3:Remove()
	end
	if not v10 then
		return
	end
	Handle.Mesh.Scale = Vector3.new(2, 2, 2)
	v2.GripPos = Vector3.new(0, 0, -1.75)
end
v2.Activated:connect(onActivated)
v2.Equipped:connect(onEquipped)
v2.Unequipped:connect(onUnequipped)