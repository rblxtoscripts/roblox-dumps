-- https://lua.expert/
local Workspace = game:GetService("Workspace")
return function() --[[ Line: 4 | Upvalues: Workspace (copy) ]]
	local v1 = not Workspace:GetAttribute("ModViewEnabled")
	Workspace:SetAttribute("ModViewEnabled", v1)
	return if v1 then "Entered modView" else "Exited modView"
end