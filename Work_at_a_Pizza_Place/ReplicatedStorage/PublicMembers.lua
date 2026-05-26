-- https://lua.expert/
local t = {}
local t2 = {}
script.SyncMember.OnClientEvent:connect(function(p1, p2, p3) --[[ Line: 9 | Upvalues: t2 (copy) ]]
	if not t2[p1] then
		t2[p1] = {}
	end
	t2[p1][p2] = p3
	script.PublicMemberChanged:Fire(p1, p2, p3)
end)
function t.GetMemberValue(p1, p2, p3) --[[ GetMemberValue | Line: 23 | Upvalues: t2 (copy) ]]
	if t2[p2] then
		return t2[p2][p3]
	end
end
return t