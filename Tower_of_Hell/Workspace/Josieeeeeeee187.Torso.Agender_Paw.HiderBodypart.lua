-- https://lua.expert/
local v1 = script.Parent.Parent
v1:GetPropertyChangedSignal("LocalTransparencyModifier"):Connect(function() --[[ Line: 2 | Upvalues: v1 (copy) ]]
	script.Parent.Enabled = v1.LocalTransparencyModifier < 0.5
end)