-- https://lua.expert/
Tool = script.Parent
local v1 = nil
local v2 = nil
function CheckEnabled() --[[ CheckEnabled | Line: 7 | Upvalues: v2 (ref) ]]
	if v2 == nil then
		return
	end
	if Tool.Enabled then
		v2.Icon = "rbxasset://textures\\GunCursor.png"
		return
	end
	v2.Icon = "rbxasset://textures\\GunWaitCursor.png"
end
function onEquippedLocal(p1) --[[ onEquippedLocal | Line: 17 | Upvalues: v2 (ref), v1 (ref) ]]
	if p1 ~= nil then
		v2 = p1
		v1 = Tool.Changed:connect(CheckEnabled)
	end
end
function onUnequippedLocal() --[[ onUnequippedLocal | Line: 26 | Upvalues: v1 (ref) ]]
	if not v1 then
		return
	end
	v1:disconnect()
end
Tool.Equipped:connect(onEquippedLocal)
Tool.Unequipped:connect(onUnequippedLocal)