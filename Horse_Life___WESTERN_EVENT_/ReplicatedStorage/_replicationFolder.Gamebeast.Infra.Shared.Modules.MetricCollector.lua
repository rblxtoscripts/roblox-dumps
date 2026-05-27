-- https://lua.expert/
local t = {}
local t2 = {}
function t.ReportMetric(p1, p2, p3) --[[ ReportMetric | Line: 31 | Upvalues: t2 (copy) ]]
	if not p2 then
		return
	end
	if typeof(p3) ~= "number" then
		return
	end
	local v1 = t2[p2]
	if not v1 then
		v1 = {}
		t2[p2] = v1
	end
	table.insert(v1, p3)
end
function t.ReadAndResetMetric(p1, p2) --[[ ReadAndResetMetric | Line: 50 | Upvalues: t2 (copy) ]]
	local v1 = t2[p2]
	if v1 then
		local v2 = table.clone(v1)
		t2[p2] = {}
		return v2
	else
		return {}
	end
end
function t.ReadAndResetAllMetrics(p1) --[[ ReadAndResetAllMetrics | Line: 64 | Upvalues: t2 (copy), t (copy) ]]
	local t3 = {}
	for v1, v2 in t2 do
		t3[v1] = t:ReadAndResetMetric(v1)
	end
	return t3
end
return t