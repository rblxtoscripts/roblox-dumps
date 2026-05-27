-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
return {
	addToReplicatedStorage = function() --[[ addToReplicatedStorage | Line: 12 | Upvalues: ReplicatedStorage (copy), RunService (copy) ]]
		if ReplicatedStorage:FindFirstChild(script.Name) then
			return false
		end
		local v1 = Instance.new("ObjectValue")
		v1.Name = script.Name
		v1.Value = script.Parent
		v1.Parent = ReplicatedStorage
		local v2 = Instance.new("BoolValue")
		v2.Name = if RunService:IsClient() then "Client" else "Server"
		v2.Value = true
		v2.Parent = v1
		return v1
	end,
	getObject = function() --[[ getObject | Line: 28 | Upvalues: ReplicatedStorage (copy) ]]
		local v1 = ReplicatedStorage:FindFirstChild(script.Name)
		if v1 then
			return v1
		else
			return false
		end
	end
}