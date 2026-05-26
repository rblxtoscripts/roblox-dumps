-- https://lua.expert/
Tool = script.Parent
local v1 = false
function onEquippedLocal(p1) --[[ onEquippedLocal | Line: 5 | Upvalues: v1 (ref) ]]
	v1 = true
	if p1 == nil then
		return
	end
	while v1 do
		p1.Icon = "rbxasset://textures\\GunCursor.png"
		while Tool.Enabled and v1 do
			wait(0.01)
		end
		p1.Icon = "rbxasset://textures\\GunWaitCursor.png"
		while not Tool.Enabled and v1 do
			wait(0.01)
		end
	end
end
function onUnequippedLocal() --[[ onUnequippedLocal | Line: 23 | Upvalues: v1 (ref) ]]
	v1 = false
end
Tool.Equipped:connect(onEquippedLocal)
Tool.Unequipped:connect(onUnequippedLocal)