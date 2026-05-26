-- https://lua.expert/
local v1 = script.Parent
local v2 = true
function onEquippedLocal(p1) --[[ onEquippedLocal | Line: 4 | Upvalues: v2 (ref), v1 (copy) ]]
	v2 = true
	if p1 == nil then
		return
	end
	while v2 do
		p1.Icon = "rbxasset://textures\\GunCursor.png"
		while v1.Enabled and v2 do
			wait(0.01)
		end
		p1.Icon = "rbxasset://textures\\GunWaitCursor.png"
		while not v1.Enabled and v2 do
			wait(0.01)
		end
	end
end
function onUnequippedLocal() --[[ onUnequippedLocal | Line: 25 | Upvalues: v2 (ref) ]]
	v2 = false
end
v1.Equipped:connect(onEquippedLocal)
v1.Unequipped:connect(onUnequippedLocal)