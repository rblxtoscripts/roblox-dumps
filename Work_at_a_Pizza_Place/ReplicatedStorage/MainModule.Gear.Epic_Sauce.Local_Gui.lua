-- https://lua.expert/
local v1 = script.Parent
local v2 = nil
enabled = true
function onButton1Down(p1) --[[ onButton1Down | Line: 5 | Upvalues: v2 (ref) ]]
	if not enabled then
		return
	end
	enabled = false
	p1.Icon = "rbxasset://textures\\ArrowFarCursor.png"
	if v2 then
		v2:Play()
	end
	wait(61)
	p1.Icon = "rbxasset://textures\\ArrowCursor.png"
	enabled = true
end
function onEquippedLocal(p1) --[[ onEquippedLocal | Line: 21 | Upvalues: v1 (copy), v2 (ref) ]]
	if p1 == nil then
		print("Mouse not found")
		return
	end
	local Humanoid = v1.Parent:FindFirstChildOfClass("Humanoid")
	if Humanoid then
		v2 = if Humanoid.RigType == Enum.HumanoidRigType.R15 then Humanoid:LoadAnimation(v1:WaitForChild("R15Drink")) else Humanoid:LoadAnimation(v1:WaitForChild("drink"))
	end
	p1.Icon = "rbxasset://textures\\ArrowCursor.png"
	p1.Button1Down:connect(function() --[[ Line: 36 | Upvalues: p1 (copy) ]]
		onButton1Down(p1)
	end)
end
function onUnequippedLocal() --[[ onUnequippedLocal | Line: 39 | Upvalues: v2 (ref) ]]
	if not v2 then
		return
	end
	v2:Stop()
	v2:Destroy()
	v2 = nil
end
v1.Unequipped:connect(onUnequippedLocal)
v1.Equipped:connect(onEquippedLocal)