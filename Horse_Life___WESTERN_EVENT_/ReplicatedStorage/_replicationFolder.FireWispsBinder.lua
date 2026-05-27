-- https://lua.expert/
local t = {}
t.__index = t
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Binder")
local v2 = Sonar("FireWhisps")
local v3 = Sonar("Maid")
local v4 = Sonar("KirinProgressService")
local LocalPlayer = Players.LocalPlayer
local v5 = v1.new("FireWisps", t)
local function spawnWhisps() --[[ spawnWhisps | Line: 26 | Upvalues: v5 (copy), v4 (copy), LocalPlayer (copy) ]]
	local v1 = v5:GetAll()
	for v2, v3 in v1 do
		v3.WhispsMaid:DoCleaning()
	end
	local v42 = 10 - v4.GetWhispsCollected(LocalPlayer)
	if v42 <= 0 then
		return
	end
	local v52 = nil
	for i = 1, v42 do
		local v6
		repeat
			v6 = v1[math.random(1, #v1)]
		until #v1 == 1 or (v6 ~= v52 or math.random(1, 10) <= 2)
		v6:Spawn()
		v52 = v6
	end
end
function t.new(p1) --[[ new | Line: 58 | Upvalues: t (ref), v3 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v3.new()
	v2.WhispsMaid = v2.Maid:GiveTask(v3.new())
	v2.SpawnArea = p1
	return v2
end
function t.Spawn(p1) --[[ Spawn | Line: 69 | Upvalues: v2 (copy) ]]
	p1.WhispsMaid:GiveTask(v2.new(p1.SpawnArea.Part))
end
function t.Destroy(p1) --[[ Destroy | Line: 74 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.Init(p1) --[[ Init | Line: 83 | Upvalues: v5 (copy), v4 (copy), spawnWhisps (copy) ]]
	v5:Init()
	v4.DailyResetTimer.SeedChanged:Connect(spawnWhisps)
	task.delay(1, spawnWhisps)
end
t:Init()
return t