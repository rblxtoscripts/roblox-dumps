-- https://lua.expert/
local t = {}
game:GetService("ReplicatedStorage")
local t2 = {}
function t.Set(p1, p2, p3) --[[ Set | Line: 36 | Upvalues: t2 (copy) ]]
	t2[p2] = p3
end
function t.Get(p1, p2) --[[ Get | Line: 40 | Upvalues: t2 (copy) ]]
	return t2[p2]
end
return t