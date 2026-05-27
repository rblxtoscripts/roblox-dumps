-- https://lua.expert/
local t = {}
local LocalPlayer = game.Players.LocalPlayer
local TutorialBeam = script.TutorialBeam
local t2 = {}
function t.Create(p1, p2, p3) --[[ Create | Line: 10 | Upvalues: TutorialBeam (copy), t2 (ref) ]]
	local v1 = if p3 then p3 else {}
	local v2, v3
	if v1.customBeam then
		v2, v3 = script[v1.customBeam]:Clone(), v1
	else
		v2, v3 = TutorialBeam:Clone(), v1
	end
	local Attachment0 = v2:WaitForChild("Attachment0")
	local Attachment1 = v2:WaitForChild("Attachment1")
	local Beam1 = v2:WaitForChild("Beam1")
	local Beam2 = v2:WaitForChild("Beam2")
	Attachment0.Parent = p1
	Attachment1.Parent = p2
	Beam1.Parent = p1
	Beam2.Parent = p1
	Attachment1.Position = if v3.CenterOfPart then Vector3.new(0, 0, 0) else Vector3.new(0, p2.Size.Y / 2, 0)
	local t = {
		Attachment0 = Attachment0,
		Attachment1 = Attachment1,
		Beam1 = Beam1,
		Beam2 = Beam2
	}
	table.insert(t2, t)
	return t
end
function t.FromPlayer(p1, p2, p3) --[[ FromPlayer | Line: 47 | Upvalues: LocalPlayer (copy), t (copy) ]]
	if p2 == nil then
		p1 = LocalPlayer
		p2 = LocalPlayer
	end
	local HumanoidRootPart = (p1.Character or p1.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart")
	return t.Create(HumanoidRootPart, p2, p3)
end
function t.UpdatePosition(p1, p2, p3) --[[ UpdatePosition | Line: 59 ]]
	local v1 = if p3 then p3 else {}
	p1.Attachment1.Parent = p2
	if v1.WorldPosition then
		p1.Attachment1.WorldPosition = v1.WorldPosition
		return
	end
	p1.Attachment1.Position = if v1.CenterOfPart then Vector3.new(0, 0, 0) else Vector3.new(0, p2.Size.Y / 2, 0)
end
function t.Destroy(p1) --[[ Destroy | Line: 71 ]]
	for v1, v2 in p1 do
		v2:Destroy()
	end
end
function t.ClearBeams() --[[ ClearBeams | Line: 78 | Upvalues: t2 (ref), t (copy) ]]
	for k, v in pairs(t2) do
		t.Destroy(v)
	end
	t2 = {}
end
t.TemplateBeam = TutorialBeam
return t