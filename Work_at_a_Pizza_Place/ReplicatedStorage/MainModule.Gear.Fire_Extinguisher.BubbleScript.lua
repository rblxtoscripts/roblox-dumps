-- https://lua.expert/
local v1 = script.Parent
local v2 = false
local v3 = nil
local Debris = game:GetService("Debris")
local Part = Instance.new("Part")
Part.Shape = 0
Part.formFactor = 0
Part.Size = Vector3.new(1, 1, 1)
Part.Transparency = 0.2
Part.BottomSurface = "Smooth"
Part.TopSurface = "Smooth"
Part.CanCollide = true
function onEquipped(p1) --[[ onEquipped | Line: 16 | Upvalues: v3 (ref), v1 (copy) ]]
	v3 = v1.Parent:FindFirstChild("Torso", false) or v1.Parent:FindFirstChild("UpperTorso", false)
	p1.Button1Down:connect(onButton1Down)
	p1.Button1Up:connect(onButton1Up)
end
function onUnequipped() --[[ onUnequipped | Line: 24 | Upvalues: v2 (ref), v1 (copy) ]]
	v2 = false
	v1.Handle.Mesh.MeshId = "http://www.roblox.com/asset/?id=27787143"
	v1.Handle.FoamSound:Stop()
end
function onButton1Down(p1) --[[ onButton1Down | Line: 33 | Upvalues: v2 (ref), v1 (copy) ]]
	v2 = true
	v1.Handle.Mesh.MeshId = "http://www.roblox.com/asset/?id=27787226"
	v1.Handle.FoamSound:Play()
	sprayBubbles()
end
function onButton1Up(p1) --[[ onButton1Up | Line: 42 | Upvalues: v2 (ref), v1 (copy) ]]
	v2 = false
	v1.Handle.Mesh.MeshId = "http://www.roblox.com/asset/?id=27787143"
	v1.Handle.FoamSound:Stop()
end
function sprayBubbles() --[[ sprayBubbles | Line: 50 | Upvalues: v2 (ref), v3 (ref), Part (copy), v1 (copy), Debris (copy) ]]
	while v2 do
		local unit = v3.CFrame.lookVector.unit
		local v12 = Part:clone()
		local lookVector = v3.CFrame.lookVector
		local v22 = math.abs(lookVector.x)
		local v32 = v22 + math.abs(lookVector.z)
		v12.Position = Vector3.new(v1.Handle.Position.x + 5 * (lookVector.x / v32), v1.Handle.Position.y, v1.Handle.Position.z + 5 * (lookVector.z / v32))
		v12.Velocity = Vector3.new(unit.x, unit.y + 0.5, unit.z) * 50
		v12.Size = Vector3.new(math.random(1, 2), math.random(1, 2), math.random(1, 2))
		v12.Parent = game.Workspace
		local v11 = v1.ExtinguishScript:clone()
		v11.Parent = v12
		v11.Disabled = false
		Debris:AddItem(v12, 2)
		wait(0.05)
	end
end
v1.Equipped:connect(onEquipped)
v1.Unequipped:connect(onUnequipped)