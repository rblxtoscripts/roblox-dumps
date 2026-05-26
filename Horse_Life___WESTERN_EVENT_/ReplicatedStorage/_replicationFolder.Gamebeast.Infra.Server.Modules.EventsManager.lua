-- https://lua.expert/
local t = {}
game:GetService("ReplicatedStorage")
local v1 = shared.GBMod("InternalConfigs")
shared.GBMod("Utilities")
local v2 = shared.GBMod("Signal")
local v3 = v2.new()
local v4 = v2.new()
local t2 = {}
local function FireEventStatus(p1, p2, p3) --[[ FireEventStatus | Line: 44 | Upvalues: v3 (copy), v4 (copy), t2 (copy) ]]
	if p1 then
		v3:Fire(p2, p3.info)
	else
		v4:Fire(p2, p3.info)
	end
	t2[p2].Started = p1
end
function t.OnStart(p1, p2, p3) --[[ OnStart | Line: 58 | Upvalues: v3 (copy) ]]
	return v3:Connect(function(p1, p22) --[[ Line: 59 | Upvalues: p2 (copy), p3 (copy) ]]
		if p1 ~= p2 then
			return
		end
		p3(p22)
	end)
end
function t.OnEnd(p1, p2, p3) --[[ OnEnd | Line: 66 | Upvalues: v4 (copy) ]]
	return v4:Connect(function(p1, p22) --[[ Line: 67 | Upvalues: p2 (copy), p3 (copy) ]]
		if p1 ~= p2 then
			return
		end
		p3(p22)
	end)
end
function t.Init(p1) --[[ Init | Line: 75 | Upvalues: v1 (copy), t2 (copy), v3 (copy), v4 (copy) ]]
	v1:OnReady(function() --[[ Line: 76 | Upvalues: v1 (ref), t2 (ref), v3 (ref), v4 (ref) ]]
		task.spawn(function() --[[ Line: 79 | Upvalues: v1 (ref), t2 (ref), v3 (ref), v4 (ref) ]]
			while task.wait(0.5) do
				for v12, v2 in v1:GetActiveConfig("GBConfigs").EventData do
					if not t2[v12] then
						t2[v12] = {
							Started = false
						}
					end
					local v32 = t2[v12]
					local v42 = os.time()
					if v2.endTime and (v2.startTime <= v42 and (v42 < v2.endTime and not v32.Started)) then
						print("Starting/continuing the \'" .. v12 .. "\' event!")
						v3:Fire(v12, v2.info)
						t2[v12].Started = true
						continue
					end
					if v42 == v2.endTime and v32.Started then
						print("Ending the \'" .. v12 .. "\' event!")
						v4:Fire(v12, v2.info)
						t2[v12].Started = false
						continue
					end
					if v42 == v2.startTime and not v32.Started then
						print("Starting the \'" .. v12 .. "\' event!")
						v3:Fire(v12, v2.info)
						t2[v12].Started = true
					end
				end
			end
		end)
	end)
end
return t