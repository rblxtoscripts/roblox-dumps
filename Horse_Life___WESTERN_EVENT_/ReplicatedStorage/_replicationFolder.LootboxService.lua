-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
Sonar("Constants")
local v1 = Sonar("Lootbox")
local t = {}
local t2 = {
	AddLootbox = function(p1, p2) --[[ AddLootbox | Line: 92 | Upvalues: v1 (copy), t (copy) ]]
		p2.Name = p1
		local v12 = v1.new(p2)
		t[p1] = v12
		return v12
	end
}
function t2.Create(p1) --[[ Create | Line: 105 | Upvalues: HttpService (copy), t2 (copy) ]]
	return t2.AddLootbox(p1.Name or HttpService:GenerateGUID(false), p1)
end
function t2.GetLootbox(p1) --[[ GetLootbox | Line: 112 | Upvalues: t (copy) ]]
	return t[p1]
end
function t2.IsALootbox(p1) --[[ IsALootbox | Line: 118 | Upvalues: v1 (copy) ]]
	return if typeof(p1) == "table" then getmetatable(p1) == v1 else false
end
function t2.IsALootboxConfig(p1) --[[ IsALootboxConfig | Line: 124 | Upvalues: v1 (copy) ]]
	return if typeof(p1) == "table" and getmetatable(p1) ~= v1 then typeof(p1.ItemPool) == "table" else false
end
function t2.GetLootboxFromTable(p1, p2) --[[ GetLootboxFromTable | Line: 134 | Upvalues: t2 (copy) ]]
	if typeof(p1) ~= "table" then
		return nil
	end
	if t2.IsALootbox(p1) then
		return p1
	end
	if t2.IsALootboxConfig(p1) then
		p1.Name = p1.Name or p2
		return t2.GetLootbox(p2) or t2.Create(p1)
	elseif p1.LootboxName then
		return t2.GetLootbox(p1.LootboxName)
	else
		return nil
	end
end
function t2.Init(p1) --[[ Init | Line: 151 ]] end
t2:Init()
return t2