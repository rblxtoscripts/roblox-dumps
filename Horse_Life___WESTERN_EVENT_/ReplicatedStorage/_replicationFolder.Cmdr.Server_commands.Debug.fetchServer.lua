-- https://lua.expert/
local HttpService = game:GetService("HttpService")
return function(p1, p2) --[[ Line: 3 | Upvalues: HttpService (copy) ]]
	return HttpService:GetAsync(p2)
end