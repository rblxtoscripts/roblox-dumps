-- https://lua.expert/
local v1 = script:WaitForChild("ObjectPointer").Value
local _ = script:WaitForChild("HousePointer").Value
local v2 = 0
while v1 and v1.Parent do
	wait(0.1)
	v2 = if v2 == 0 then 45 else 0
	v1.Wings.Orientation = Vector3.new(0, v2, 0)
	v1.Line.Orientation = Vector3.new(0, v2, 0)
end