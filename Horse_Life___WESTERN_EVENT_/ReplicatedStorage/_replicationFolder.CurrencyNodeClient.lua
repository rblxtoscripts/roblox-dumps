-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local v3 = Sonar("Constants")
local v4 = Sonar("PlayerWrapper").GetClient()
local t2 = {}
local t3 = {}
t3.__index = t3
local Spawned = workspace:WaitForChild("Interactions"):WaitForChild("CurrencyNodes"):WaitForChild("Spawned")
function t3.new(p1) --[[ new | Line: 28 | Upvalues: t3 (copy), v2 (copy), v3 (copy), t2 (copy) ]]
	local v22 = setmetatable({}, t3)
	v22.Maid = v2.new()
	v22.DropInfo = v3.CurrencyNodes[p1.Name]
	v22.SpawnPart = p1
	v22:_attemptSpawn()
	t2[v22.SpawnPart] = v22
	v22.Maid:GiveTask(function() --[[ Line: 38 | Upvalues: t2 (ref), v22 (copy) ]]
		t2[v22.SpawnPart] = nil
	end)
	return v22
end
function t3.Destroy(p1, p2) --[[ Destroy | Line: 45 ]]
	p1.Destroyed = true
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t3._attemptSpawn(p1) --[[ _attemptSpawn | Line: 52 | Upvalues: CollectionService (copy) ]]
	p1:_setSpawnTick()
	CollectionService:AddTag(p1.SpawnPart, "SpawnedCurrencyDrop")
end
function t3._setSpawnTick(p1) --[[ _setSpawnTick | Line: 58 ]]
	p1.SpawnPart:SetAttribute("SpawnTick", (math.floor((workspace:GetServerTimeNow()))))
end
function t3._canClaim(p1) --[[ _canClaim | Line: 63 | Upvalues: CollectionService (copy), v4 (copy) ]]
	if p1.Destroyed then
		return false
	end
	if not CollectionService:HasTag(p1.SpawnPart, "SpawnedCurrencyDrop") then
		return false
	end
	if not p1.DropInfo.RequiresRiding then
		return true
	end
	return v4.CurrentHorse ~= nil
end
function t3._claimed(p1) --[[ _claimed | Line: 77 | Upvalues: CollectionService (copy) ]]
	if not p1.Destroyed then
		CollectionService:RemoveTag(p1.SpawnPart, "SpawnedCurrencyDrop")
		task.delay(p1.DropInfo.WaitTimeToSpawn, function() --[[ Line: 83 | Upvalues: p1 (copy) ]]
			if not p1.Destroyed then
				p1:_attemptSpawn()
			end
		end)
	end
end
function t.Init(p1) --[[ Init | Line: 91 | Upvalues: v1 (copy), t3 (copy) ]]
	v1.new("InitiatedCurrencyDrop", t3):Init()
end
function t.getSpawnNode(p1) --[[ getSpawnNode | Line: 95 | Upvalues: t2 (copy) ]]
	return t2[p1]
end
t.SpawnedFolder = Spawned
t:Init()
return t