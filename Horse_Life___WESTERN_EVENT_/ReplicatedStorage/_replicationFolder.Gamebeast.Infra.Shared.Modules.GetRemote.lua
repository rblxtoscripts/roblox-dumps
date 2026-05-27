-- https://lua.expert/
local RunService = game:GetService("RunService")
local function WaitForRemoteFolder() --[[ WaitForRemoteFolder | Line: 23 ]]
	local v1 = false
	repeat
		local Remotes = script:WaitForChild("Remotes", 30)
		if Remotes then
			return Remotes
		end
		if not v1 then
			warn("[Gamebeast] Remote folder not found after 30 seconds, infinite yield is possible.")
			v1 = true
		end
	until Remotes ~= nil
end
local Remotes = RunService:IsClient() and WaitForRemoteFolder() or Instance.new("Folder", script)
Remotes.Name = "Remotes"
local v1 = RunService:IsServer()
return function(p1, p2) --[[ Line: 58 | Upvalues: v1 (copy), Remotes (copy) ]]
	local v12 = if v1 then Remotes:FindFirstChild(p1 .. p2) else Remotes:WaitForChild(p1 .. p2)
	if not v12 then
		local v2 = Instance.new("Remote" .. p1, Remotes)
		v2.Name = p1 .. p2
		v12 = v2
	end
	return v12
end