-- https://lua.expert/
local Lighting = game:GetService("Lighting")
return function(p1, p2) --[[ Line: 10 | Upvalues: Lighting (copy) ]]
	if p2 < 0 or p2 > 24 then
		return "Time must be between 0 and 24"
	else
		Lighting:SetAttribute("AdminOverrideTime", p2)
		return "Set admin override time to " .. p2 .. " hours"
	end
end