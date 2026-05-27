-- https://lua.expert/
local UserService = game:GetService("UserService")
local t = {}
local t2 = {}
return {
	Get = function(p1) --[[ Get | Line: 12 | Upvalues: t2 (copy) ]]
		return t2[p1]
	end,
	AddToQueue = function(p1) --[[ AddToQueue | Line: 15 | Upvalues: t2 (copy), t (copy) ]]
		for k, v in pairs(if type(p1) == "table" and p1 then p1 else { p1 }) do
			local v2 = t2[v]
			if v2 then
				return v2
			end
			if not t[v] then
				t[v] = {}
			end
		end
	end,
	FetchAll = function() --[[ FetchAll | Line: 29 | Upvalues: t (copy), UserService (copy), t2 (copy) ]]
		if not next(t) then
			return t2
		end
		local count = 0
		local t3 = {}
		for v1, v2 in t do
			count = count + 1
			if count <= 150 then
				table.insert(t3, v1)
			end
		end
		local v3, v4 = pcall(function() --[[ Line: 41 | Upvalues: UserService (ref), t3 (copy) ]]
			return UserService:GetUserInfosByUserIdsAsync(t3)
		end)
		if v3 then
			for v5, v6 in v4 do
				local Id = v6.Id
				t2[Id] = v6
				t[Id] = nil
			end
		else
			warn("Unable to get batch userInfos for: " .. #t3 .. " because: " .. tostring(v4))
		end
		return t2
	end
}