-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RemoteUtils")
local NotifyTypes = Sonar("Constants").NotifyTypes
local v2 = v1.GetRemoteEvent("NotificationRemote")
local v3 = v1.GetRemoteEvent("PromptRemote")
function t.NotifyPlayer(p1, p2, ...) --[[ NotifyPlayer | Line: 19 | Upvalues: t (copy), v2 (copy) ]]
	v2:FireClient(p1, t.ConvertNotifyType(p2), ...)
end
function t.PromptPlayer(p1, p2, ...) --[[ PromptPlayer | Line: 25 | Upvalues: t (copy), v3 (copy) ]]
	v3:FireClient(p1, t.ConvertNotifyType(p2), ...)
end
function t.ConvertNotifyType(p1) --[[ ConvertNotifyType | Line: 31 | Upvalues: NotifyTypes (copy) ]]
	local v1 = table.find(NotifyTypes, p1)
	if not v1 then
		warn("No notify type conversion found for", p1)
	end
	return v1 or p1
end
function t.RevertNotifyType(p1) --[[ RevertNotifyType | Line: 40 | Upvalues: NotifyTypes (copy) ]]
	return NotifyTypes[p1]
end
function t.NotifyAll(p1) --[[ NotifyAll | Line: 45 | Upvalues: v2 (copy) ]]
	v2:FireAllClients(p1)
end
return t