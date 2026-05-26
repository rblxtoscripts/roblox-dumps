-- https://lua.expert/
local Head = script.Parent.Parent.Head
Head:GetPropertyChangedSignal("LocalTransparencyModifier"):Connect(function() --[[ Line: 2 | Upvalues: Head (copy) ]]
	script.Parent.Enabled = Head.LocalTransparencyModifier < 0.5
end)