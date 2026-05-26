-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("PlayerWrapper")
local v3 = game:GetService("RunService"):IsServer()
local v4 = nil
function t.GetLatest() --[[ GetLatest | Line: 15 | Upvalues: ReplicatedStorage (copy) ]]
	local v1 = nil
	for k, v in pairs(ReplicatedStorage.Storage.UpdateLogs:GetChildren()) do
		if tonumber(v.Name) then
			local v3, v4
			if v1 then
				if v1 < tonumber(v.Name) then
					v3 = v.Name
					v4 = tonumber(v3)
					v1 = v4
				end
			else
				v3 = v.Name
				v4 = tonumber(v3)
				v1 = v4
			end
		end
	end
	return v1
end
function t.SetLastPlayedUpdate(p1) --[[ SetLastPlayedUpdate | Line: 26 | Upvalues: v4 (ref) ]]
	p1.PlayerData.LastPlayedUpdate.Value = v4
end
function t.Init(p1) --[[ Init | Line: 30 | Upvalues: v3 (copy), v4 (ref), t (copy), v1 (copy), v2 (copy) ]]
	if not v3 then
		return
	end
	v4 = t.GetLatest()
	v1.GetRemoteEvent("SetLastPlayedUpdateRemote").OnServerEvent:Connect(function(p1) --[[ Line: 34 | Upvalues: v2 (ref), t (ref) ]]
		local v1 = v2.getWrapperFromPlayer(p1)
		if v1 then
			t.SetLastPlayedUpdate(v1)
		end
	end)
end
t:Init()
return t