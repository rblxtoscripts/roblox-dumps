-- https://lua.expert/
script.Parent:WaitForChild("Handle")
local t = {
	character = nil,
	equipped = false,
	check = true,
	leftCymbal = nil,
	newAnimation = nil,
	gear = script.Parent,
	handle = script.Parent.Handle,
	newAnimate = script:WaitForChild("NewAnimate"),
	slam = script.Parent.Handle:WaitForChild("Slam"),
	anims = { script.Parent:WaitForChild("Slam") },
	readyAnims = {}
}
function t.createFakeCymbal() --[[ createFakeCymbal | Line: 19 | Upvalues: t (copy) ]]
	t.leftCymbal = t.handle:Clone()
	t.leftCymbal.Name = "FakeHandle"
	t.leftCymbal.CanCollide = false
	local ManualWeld = Instance.new("ManualWeld")
	ManualWeld.Part1 = t.leftCymbal
	ManualWeld.C0 = CFrame.new(0.25, -1, 0) * CFrame.Angles(0, -1.5, 1.5)
	ManualWeld.C1 = CFrame.new(0, 0, -0.1) * CFrame.Angles(0, 1.5, 0)
	ManualWeld.Part0 = t.character:FindFirstChild("Left Arm")
	t.leftCymbal.Parent = t.gear
	ManualWeld.Parent = t.leftCymbal
end
function t.loadNewAnimation() --[[ loadNewAnimation | Line: 35 | Upvalues: t (copy) ]]
	local Animate = t.character:FindFirstChild("Animate")
	if Animate then
		Animate.Disabled = true
	end
	t.newAnimation = t.newAnimate:Clone()
	t.newAnimation.Disabled = false
	t.newAnimation.Parent = t.character
end
t.gear.Unequipped:connect(function() --[[ Line: 43 | Upvalues: t (copy) ]]
	t.equipped = false
	if t.leftCymbal ~= nil then
		t.leftCymbal:Destroy()
		t.leftCymbal = nil
	end
	if t.newAnimation ~= nil then
		t.newAnimation:Destroy()
		t.character:FindFirstChild("Animate").Disabled = false
	end
	t.readyAnims[1]:Stop()
	t.slam:Stop()
end)
t.gear.Equipped:connect(function(p1) --[[ Line: 57 | Upvalues: t (copy) ]]
	t.equipped = true
	if p1 == nil then
		return
	end
	local v1 = script.Parent.Parent:findFirstChild("Humanoid")
	script.Parent.Parent:findFirstChild("Torso")
	t.readyAnims = {}
	for i = 1, #t.anims do
		table.insert(t.readyAnims, v1:LoadAnimation(t.anims[i]))
	end
	t.readyAnims[1].KeyframeReached:connect(function(p1) --[[ Line: 66 | Upvalues: t (ref) ]]
		if p1 ~= "slam" then
			return
		end
		t.slam:Play()
	end)
	t.character = game.Players.LocalPlayer.Character
	local FakeHandle = t.gear:FindFirstChild("FakeHandle")
	if FakeHandle then
		FakeHandle:Destroy()
	end
	wait()
	t.createFakeCymbal()
	t.loadNewAnimation()
	p1.Button1Down:connect(function() --[[ Line: 79 | Upvalues: t (ref), v1 (copy) ]]
		if not (t.check and v1.Health > 0) then
			return
		end
		t.check = false
		t.readyAnims[1]:Play()
		t.readyAnims[1]:AdjustSpeed(1)
		wait(1)
		t.check = true
	end)
end)