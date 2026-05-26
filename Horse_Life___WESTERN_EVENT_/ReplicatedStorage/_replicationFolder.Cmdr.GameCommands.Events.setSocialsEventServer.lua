-- https://lua.expert/
local Workspace = game:GetService("Workspace")
return function(p1, p2) --[[ Line: 3 | Upvalues: Workspace (copy) ]]
	Workspace:SetAttribute("IsSocialsEventEnabled", p2 and true or false)
	return if Workspace:GetAttribute("IsSocialsEventEnabled") then "Socials event enabled" else "Socials event disabled"
end