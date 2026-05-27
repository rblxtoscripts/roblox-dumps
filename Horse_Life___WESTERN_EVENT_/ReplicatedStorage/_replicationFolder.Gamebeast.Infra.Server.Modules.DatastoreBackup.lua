-- https://lua.expert/
local t = {}
local DataStoreService = game:GetService("DataStoreService")
game:GetService("RunService")
function t.Set(p1, p2, p3) --[[ Set | Line: 35 ]]
	local v1, v2 = pcall(function() --[[ Line: 36 | Upvalues: p1 (copy), p2 (copy), p3 (copy) ]]
		p1._dataStore:SetAsync(p2, p3)
	end)
	if v1 then
		return v1
	end
	warn("Failed to save backup data for key \'" .. p2 .. "\': " .. tostring(v2))
	return v1
end
function t.Update(p1, p2, p3) --[[ Update | Line: 47 ]]
	local v1, v2 = pcall(function() --[[ Line: 48 | Upvalues: p1 (copy), p2 (copy), p3 (copy) ]]
		p1._dataStore:UpdateAsync(p2, p3)
	end)
	if v1 then
		return v1
	end
	warn("Failed to update backup data for key \'" .. p2 .. "\': " .. tostring(v2))
	return v1
end
function t.Get(p1, p2) --[[ Get | Line: 59 ]]
	local v1, v2 = pcall(function() --[[ Line: 60 | Upvalues: p1 (copy), p2 (copy) ]]
		return p1._dataStore:GetAsync(p2)
	end)
	if v1 then
		return v1, v2
	else
		warn("Failed to retrieve backup data for key \'" .. p2 .. "\': " .. tostring(v2))
		return nil
	end
end
t.__index = t
function t.new(p1) --[[ new | Line: 76 | Upvalues: t (copy), DataStoreService (copy) ]]
	local v2 = setmetatable({}, t)
	v2._dataStore = DataStoreService:GetDataStore((if p1 then "Studio" else "") .. "_Gamebeast_Backup")
	return v2
end
return t