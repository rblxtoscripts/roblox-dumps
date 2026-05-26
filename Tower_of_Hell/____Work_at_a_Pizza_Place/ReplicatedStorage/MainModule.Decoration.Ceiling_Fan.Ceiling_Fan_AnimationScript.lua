-- https://lua.expert/
local v1 = script:WaitForChild("ObjectPointer").Value
local sum = 0
while true do
	sum = sum + 35
	v1.Fan.Orientation = Vector3.new(0, sum % 360, 90)
	task.wait(0.07)
end