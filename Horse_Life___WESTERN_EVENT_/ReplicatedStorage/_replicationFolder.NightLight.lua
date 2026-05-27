-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("Binder")
function t.new(p1) --[[ new | Line: 12 | Upvalues: t (copy), v1 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	p1.Enabled = false
	local function update() --[[ update | Line: 17 | Upvalues: p1 (copy) ]]
		local v1 = game.Lighting:GetAttribute("TimeState")
		if v1 == "Night" or v1 == "Dusk" then
			p1.Enabled = true
		else
			p1.Enabled = false
		end
	end
	v2.Maid:GiveTask(game.Lighting:GetAttributeChangedSignal("TimeState"):Connect(update))
	local v3 = game.Lighting:GetAttribute("TimeState")
	if v3 == "Night" or v3 == "Dusk" then
		p1.Enabled = true
	else
		p1.Enabled = false
	end
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 32 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
local function init() --[[ init | Line: 38 | Upvalues: v2 (copy), t (copy) ]]
	v2.new("NightLight", t):Init()
end
v2.new("NightLight", t):Init()
return t