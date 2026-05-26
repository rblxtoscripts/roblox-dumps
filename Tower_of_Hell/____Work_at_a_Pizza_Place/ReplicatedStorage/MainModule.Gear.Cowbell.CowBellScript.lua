-- https://lua.expert/
local v1 = script.Parent
local Handle = v1.Handle
local v2 = nil
local t = {
	Ring = v1:WaitForChild("Ring"),
	R15Ring = v1:WaitForChild("R15Ring")
}
Debris = game:GetService("Debris")
OcowBell = script:WaitForChild("Sound")
v1.Enabled = true
local v3 = nil
function onActivated() --[[ onActivated | Line: 19 | Upvalues: v1 (copy), Handle (copy), v3 (ref) ]]
	if not v1.Enabled then
		return
	end
	cowBell = OcowBell:clone()
	Debris:AddItem(cowBell, 2)
	cowBell.Parent = Handle
	cowBell:Play()
	if not v3 then
		return
	end
	v3:Play()
	wait(0.4)
	v3:Play()
end
function onEquipped() --[[ onEquipped | Line: 34 | Upvalues: v2 (ref), v1 (copy), v3 (ref), t (copy) ]]
	v2 = v1.Parent.Humanoid
	if v2 and v2.RigType == Enum.HumanoidRigType.R15 then
		v3 = v2:LoadAnimation(t.R15Ring)
	elseif v2 and v2.RigType == Enum.HumanoidRigType.R6 then
		v3 = v2:LoadAnimation(t.Ring)
	end
	if not v3 then
		return
	end
	v3:Play()
end
function onUnequipped() --[[ onUnequipped | Line: 51 | Upvalues: v3 (ref) ]]
	cowBell:Stop()
	if not v3 then
		return
	end
	v3:Stop()
end
script.Parent.Activated:connect(onActivated)
script.Parent.Equipped:connect(onEquipped)
script.Parent.Unequipped:connect(onUnequipped)