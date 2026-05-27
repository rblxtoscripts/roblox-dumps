-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("State")
local v2 = Sonar("Constants")
local v3 = v1.new(nil)
local function setGameState() --[[ setGameState | Line: 18 | Upvalues: v2 (copy), v3 (copy) ]]
	local t = {}
	for v1, v22 in v2.GameStates do
		t[v1] = v22
	end
	v3:set(t)
end
function t._setupGameState(p1) --[[ _setupGameState | Line: 29 | Upvalues: v2 (copy), setGameState (copy), v3 (copy) ]]
	v2.GameStateChangedSignal:Connect(setGameState)
	local t = {}
	for v1, v22 in v2.GameStates do
		t[v1] = v22
	end
	v3:set(t)
end
function t.Init(p1) --[[ Init | Line: 35 ]]
	p1:_setupGameState()
end
t:Init()
return v3