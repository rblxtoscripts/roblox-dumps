-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("WeightedProbability")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("TableUtils")
function t.new(p1) --[[ new | Line: 14 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Nodes = {}
	v2.ReservationCount = {}
	v2.WeightFunction = p1.WeightFunction
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 26 | Upvalues: v2 (copy) ]]
	v2(p1)
end
function t.RegisterNodes(p1, p2) --[[ RegisterNodes | Line: 31 ]]
	if #p2 ~= 0 then
		p1.Nodes = p2
		p1.ReservationCount = {}
		return
	end
	warn("NodeSelectorClass: RegisterNodes - Node table is empty", debug.traceback())
	p1.Nodes = p2
	p1.ReservationCount = {}
end
function t.GetAvailableNode(p1, ...) --[[ GetAvailableNode | Line: 41 | Upvalues: v1 (copy), v3 (copy) ]]
	if #p1.Nodes == 0 then
		return nil
	end
	local t = {}
	for i = 1, #p1.Nodes do
		local v12 = p1.Nodes[i]
		if (p1.ReservationCount[v12] or 0) == 0 then
			t[v12] = 1
		end
	end
	local v2 = if next(t) then v1.getRandomWeightedItem(t, nil, p1.WeightFunction(...)) else p1.Nodes[math.random(1, #p1.Nodes)]
	if not v2 then
		v2 = v3.GetRandom(p1.Nodes)
	end
	p1.ReservationCount[v2] = (p1.ReservationCount[v2] or 0) + 1
	return v2
end
function t.ClearNodeReservation(p1, p2) --[[ ClearNodeReservation | Line: 72 ]]
	if p2 and not ((p1.ReservationCount[p2] or 0) <= 0) then
		p1.ReservationCount[p2] = p1.ReservationCount[p2] - 1
	end
end
return t