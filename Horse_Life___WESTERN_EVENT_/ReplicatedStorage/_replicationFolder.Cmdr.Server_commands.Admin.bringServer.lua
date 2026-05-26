-- https://lua.expert/
local teleportServer = require(script.Parent:WaitForChild("teleportServer"))
return function(p1, p2) --[[ Line: 3 | Upvalues: teleportServer (copy) ]]
	return teleportServer(p1, p2, p1.Executor)
end