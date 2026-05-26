-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Signal")
local v2 = Sonar("spr")
function t.spring(p1, p2, p3, p4, p5) --[[ spring | Line: 13 | Upvalues: v2 (copy) ]]
	local onCompleted = (if p5 then p5 else {}).onCompleted;
	(if typeof(p1) == "Instance" then v2.target else v2.targetState)(p1, p2, p3, p4)
	if not onCompleted then
		return
	end
	if p3 == (1 / 0) then
		onCompleted()
		return
	end
	if typeof(p1) == "Instance" then
		v2.completed(p1, onCompleted)
		return
	end
	v2.completedState(p1, onCompleted)
end
function t.stopSpring(p1) --[[ stopSpring | Line: 40 | Upvalues: v2 (copy) ]]
	if typeof(p1) == "Instance" then
		v2.stop(p1)
	else
		v2.stopState(p1)
	end
end
function t.onSpringsCompleted(p1, p2) --[[ onSpringsCompleted | Line: 49 | Upvalues: v1 (copy), t (copy) ]]
	local v12 = v1.new()
	local v2 = 0
	if p2 then
		v12:GiveTask(v12:Once(p2))
	end
	for v3, v4 in p1 do
		local v5, v6, v7, v8, v9 = table.unpack(v4)
		local v10 = v9 or {}
		local onCompleted = v10.onCompleted
		task.delay(v10.delay or 0, function() --[[ Line: 64 | Upvalues: v2 (ref), onCompleted (copy), p1 (copy), v12 (copy), t (ref), v5 (copy), v6 (copy), v7 (copy), v8 (copy) ]]
			local t2 = {
				onCompleted = function() --[[ onCompleted | Line: 66 | Upvalues: v2 (ref), onCompleted (ref), p1 (ref), v12 (ref) ]]
					v2 = v2 + 1
					if onCompleted then
						task.spawn(onCompleted)
					end
					if not (v2 < #p1) then
						v12:Fire(v12)
					end
				end
			}
			t.spring(v5, v6, v7, v8, t2)
		end)
	end
	return v12
end
return t