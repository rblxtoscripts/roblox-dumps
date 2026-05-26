-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("spr")
local v2 = Sonar("Maid")
local t = {
	InstanceName = "WiggleLabel",
	Rotation = 6,
	Damping = 0.5,
	Frequency = 2,
	WaitTime = 0.5,
	WiggleAmount = nil
}
return function(p1, p2) --[[ Line: 16 | Upvalues: t (copy), v2 (copy), v1 (copy) ]]
	local v3 = p2.FindElement(p1.Instance, p1.InstanceName or t.InstanceName) or p1.Instance
	if not v3 then
		return
	end
	local v4 = p1.Rotation or t.Rotation
	local v5 = p1.Damping or t.Damping
	local v6 = p1.Frequency or t.Frequency
	local v7 = p1.WaitTime or t.WaitTime
	local v8 = p1.WiggleAmount or t.WiggleAmount
	local v9 = 1
	local v10 = v2.new()
	v10:GiveTask(task.spawn(function() --[[ Line: 31 | Upvalues: v8 (copy), v9 (ref), v1 (ref), v3 (copy), v5 (copy), v6 (copy), v4 (copy), v7 (copy) ]]
		if v8 then
			for i = 1, v8 do
				v9 = v9 * -1
				v1.target(v3, v5, v6, {
					Rotation = v4 * v9
				})
				if i < v8 then
					task.wait(v7)
				end
			end
			v1.target(v3, v5, v6, {
				Rotation = 0
			})
			return
		end
		while true do
			v9 = v9 * -1
			v1.target(v3, v5, v6, {
				Rotation = v4 * v9
			})
			task.wait(v7)
		end
	end))
	return function() --[[ Line: 50 | Upvalues: v10 (ref), v1 (ref), v3 (copy) ]]
		v10:Destroy()
		v10 = nil
		v1.target(v3, 1, 9000000000, {
			Rotation = 0
		})
	end
end