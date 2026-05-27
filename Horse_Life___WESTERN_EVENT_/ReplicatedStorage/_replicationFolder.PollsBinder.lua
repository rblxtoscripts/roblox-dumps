-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Binder")
local v2 = Sonar("GameVersionUtils")
local v3 = Sonar("InteractMenu")
local v4 = Sonar("Maid")
local v5 = Sonar("NotificationsClient")
local v6 = Sonar("PollsClient")
function t.new(p1) --[[ new | Line: 23 | Upvalues: t (copy), v4 (copy), v3 (copy), v2 (copy), v5 (copy), v6 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v4.new()
	v22.Maid:GiveTask(v3.new(p1, {
		ShowHintLabel = true,
		Run = function() --[[ Run | Line: 30 | Upvalues: v2 (ref), v5 (ref), v6 (ref), p1 (copy) ]]
			if v2:IsPrivateServer() or v2:IsReserved() then
				v5.Notify({
					Message = "Polls aren\'t available in private servers.",
					Type = "PollsPrivateServer",
					Preset = "Red"
				})
			else
				v6.Open(p1)
			end
		end,
		Visibility = function() --[[ Visibility | Line: 41 | Upvalues: p1 (copy) ]]
			return p1.Parent ~= nil
		end,
		GetRange = function() --[[ GetRange | Line: 44 | Upvalues: p1 (copy) ]]
			return p1:GetAttribute("Range") or 25
		end,
		Hint = p1:GetAttribute("Hint") or "View Polls"
	}))
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 54 ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
function t.Init() --[[ Init | Line: 60 | Upvalues: v1 (copy), t (copy) ]]
	v1.new("PollsInteract", t):Init()
end
t.Init()
return t