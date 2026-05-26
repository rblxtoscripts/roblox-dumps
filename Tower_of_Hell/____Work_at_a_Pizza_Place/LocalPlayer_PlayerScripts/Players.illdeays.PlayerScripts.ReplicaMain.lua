-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ReplicaController = require(ReplicatedStorage.ReplicaController)
local Promise = require(ReplicatedStorage._v6FiRE_Additions.UpdatedLibraries.Promise)
local function createTraceback(p1) --[[ createTraceback | Line: 6 ]]
	return debug.traceback(tostring(p1), 2)
end
local t = {}
for v1, v2 in script:GetChildren() do
	table.insert(t, (Promise.new(function(p1, p2) --[[ Line: 16 | Upvalues: v2 (copy), createTraceback (copy) ]]
		local v1, v22 = xpcall(function() --[[ Line: 18 | Upvalues: v2 (ref) ]]
			local v1 = require(v2)
			if not v1 then
				return
			end
			if typeof(v1.Initialize) ~= "function" then
				return
			end
			v1.Initialize()
		end, createTraceback)
		if v1 then
			p1(v2.Name)
		else
			return p2((("Replica module %* failed to initialize:\n%*"):format(v2.Name, v22)))
		end
	end)))
end
Promise.all(t):andThen(function(p1) --[[ Line: 37 | Upvalues: ReplicaController (copy) ]]
	ReplicaController.RequestData()
end):catch(function(p1) --[[ Line: 40 ]]
	warn((("[%*]: %*"):format(script.Name, p1)))
end)