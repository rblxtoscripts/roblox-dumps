-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local v1 = shared.GBMod("GetRemote")
local v2 = shared.GBMod("MetricCollector")
local v3 = v1("Event", "ExportClientMetrics")
function t.Init(p1) --[[ Init | Line: 33 | Upvalues: v2 (copy), Players (copy), v3 (copy) ]]
	task.spawn(function() --[[ Line: 35 | Upvalues: v2 (ref), Players (ref) ]]
		while task.wait(1) do
			v2:ReportMetric("PhysicsFps", workspace:GetRealPhysicsFPS())
			v2:ReportMetric("Ping", Players.LocalPlayer:GetNetworkPing())
		end
	end)
	task.spawn(function() --[[ Line: 45 | Upvalues: v2 (ref), v3 (ref) ]]
		while task.wait(10) do
			v3:FireServer((v2:ReadAndResetAllMetrics()))
		end
	end)
end
return t