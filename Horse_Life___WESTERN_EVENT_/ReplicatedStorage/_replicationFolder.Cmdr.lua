-- https://lua.expert/
local RunService = game:GetService("RunService")
local Util = require(script.Shared:WaitForChild("Util"))
if RunService:IsServer() ~= false then
	local v1, v2, v3
	v1 = {
		ReplicatedRoot = nil,
		RemoteFunction = nil,
		RemoteEvent = nil,
		Util = Util,
		DefaultCommandsFolder = script.BuiltInCommands
	}
	v2 = {
		__index = function(p1_2, p2_2) --[[ __index | Line: 16 ]]
			local v1 = p1_2.Registry[p2_2]
			if v1 and type(v1) == "function" then
				return function(p12_2, ...) --[[ Line: 19 | Upvalues: v1 (copy), p1_2 (copy) ]]
					return v1(p1_2.Registry, ...)
				end
			end
		end
	}
	v3 = setmetatable(v1, v2)
	v3.Registry = require(script.Shared.Registry)(v3)
	v3.Dispatcher = require(script.Shared.Dispatcher)(v3)
	require(script.Initialize)(v3)
	function v3.RemoteFunction.OnServerInvoke(p1_2, p2_2, p3_2) --[[ Line: 33 | Upvalues: v3 (ref) ]]
		return v3.Dispatcher:EvaluateAndRun(p2_2, p1_2, p3_2)
	end
	v3:RegisterHooksIn(script:WaitForChild("Hooks"))
	v3:RegisterDefaultCommands()
	v3:RegisterCommandsIn(script:WaitForChild("GameCommands"))
	return v3
end
error("Cmdr server module is somehow running on a client!")