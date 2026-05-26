-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local v3 = Sonar("InteractMenu")
local v4 = Sonar("ObbyMinigame")
function t.new(p1) --[[ new | Line: 11 | Upvalues: t (copy), v2 (copy), v3 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.InteractMenu = v3.new(p1, {
		Hint = "Start the Obby",
		ShowHintLabel = true,
		Run = function() --[[ Run | Line: 19 | Upvalues: v22 (copy) ]]
			v22:Start()
		end
	})
	return v22
end
function t.Start(p1) --[[ Start | Line: 27 | Upvalues: v4 (copy) ]]
	v4.new()
end
function t.Destroy(p1) --[[ Destroy | Line: 31 ]]
	if p1.Session then
		p1.Session:Stop()
		p1.Session = nil
	end
	p1.Maid:DoCleaning()
end
function t.Init(p1) --[[ Init | Line: 39 | Upvalues: v1 (copy), t (copy) ]]
	v1.new("ObbyStart", t):Init()
end
t:Init()
return t