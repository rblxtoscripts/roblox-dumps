-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("safeDestroy")
local v2 = Sonar("Maid")
local t = {}
t.__index = t
function t.new(p1) --[[ new | Line: 20 | Upvalues: t (copy), v2 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.PlayerWrapper = p1
	v22.Player = v22.PlayerWrapper.Player
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 31 | Upvalues: v1 (copy) ]]
	v1(p1)
end
function t.GetAilments(p1) --[[ GetAilments | Line: 37 ]]
	local v1 = p1.PlayerWrapper:GetCurrentCharacterData()
	if v1 then
		return v1:GetAilments()
	else
		return {}
	end
end
function t.GetAilment(p1, p2) --[[ GetAilment | Line: 48 ]]
	local v1 = p1.PlayerWrapper:GetCurrentCharacterData()
	if v1 then
		return v1:GetAilment(p2)
	else
		return nil
	end
end
function t.HasAilment(p1, p2) --[[ HasAilment | Line: 59 ]]
	local v1 = p1.PlayerWrapper:GetCurrentCharacterData()
	if v1 then
		return v1:HasAilment(p2)
	else
		return false
	end
end
function t.RemoveAllAilments(p1, ...) --[[ RemoveAllAilments | Line: 69 ]]
	local v1 = p1.PlayerWrapper:GetCurrentCharacterData()
	if v1 then
		v1:RemoveAllAilments(...)
	end
end
return t