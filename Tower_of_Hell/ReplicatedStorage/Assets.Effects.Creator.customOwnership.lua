-- https://lua.expert/
local t = {}
return function(p1, p2) --[[ Line: 3 | Upvalues: t (ref) ]]
	if typeof(p1) ~= "Instance" then
		t = p2
		return
	end
	for k, v in pairs(t) do
		if v == p1.UserId then
			return true
		end
	end
end