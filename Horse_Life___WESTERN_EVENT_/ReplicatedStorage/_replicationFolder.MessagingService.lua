-- https://lua.expert/
local t = {}
local MessagingService = game:GetService("MessagingService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Promise")
local v2 = Sonar("retryAsync")
local v3 = RunService:IsServer()
function t.Subscribe(p1, p2) --[[ Subscribe | Line: 38 | Upvalues: v3 (copy), v1 (copy), v2 (copy), MessagingService (copy) ]]
	if v3 then
		return v1.new(function(p12, p22) --[[ Line: 43 | Upvalues: v2 (ref), MessagingService (ref), p1 (copy), p2 (copy) ]]
			local v1 = v2(function() --[[ Line: 44 | Upvalues: MessagingService (ref), p1 (ref), p2 (ref) ]]
				return MessagingService:SubscribeAsync(p1, p2)
			end)
			if v1 then
				p12(v1)
			else
				p22("\226\154\160\239\184\143 MessagingService, Failed to subscribe to topic: " .. p1)
			end
		end)
	else
		return v1.reject("\226\154\160\239\184\143 MessagingService, Can only be called from the server")
	end
end
function t.Publish(p1, p2) --[[ Publish | Line: 55 | Upvalues: v3 (copy), v1 (copy), v2 (copy), MessagingService (copy) ]]
	if v3 then
		return v1.new(function(p12, p22) --[[ Line: 60 | Upvalues: v2 (ref), MessagingService (ref), p1 (copy), p2 (copy) ]]
			if v2(function() --[[ Line: 61 | Upvalues: MessagingService (ref), p1 (ref), p2 (ref) ]]
				return MessagingService:PublishAsync(p1, p2)
			end) then
				p12(true)
			else
				p22("\226\154\160\239\184\143 MessagingService, Failed to publish message to topic: " .. p1)
			end
		end)
	else
		return v1.reject("\226\154\160\239\184\143 MessagingService, Can only be called from the server")
	end
end
return t