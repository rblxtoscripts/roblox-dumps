-- https://lua.expert/
local v1 = script.Parent
local v2 = true
function onEquippedLocal(p1) --[[ onEquippedLocal | Line: 5 | Upvalues: v2 (ref), v1 (copy) ]]
	v2 = true
	if p1 == nil then
		return
	end
	p1.Icon = "rbxasset://textures\\GunCursor.png"
	while v2 do
		while v1.Enabled do
			if not v2 then
				return
			end
			wait(0.01)
		end
		p1.Icon = "rbxasset://textures\\GunWaitCursor.png"
		while not v1.Enabled do
			if not v2 then
				return
			end
			wait(0.01)
		end
		p1.Icon = "rbxasset://textures\\GunCursor.png"
	end
	v2 = true
end
function onUnequippedLocal() --[[ onUnequippedLocal | Line: 34 | Upvalues: v2 (ref) ]]
	v2 = false
end
v1.Equipped:connect(onEquippedLocal)
v1.Unequipped:connect(onUnequippedLocal)