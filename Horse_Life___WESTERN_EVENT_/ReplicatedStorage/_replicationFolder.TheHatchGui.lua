-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("InteractMenu")
local v2 = Sonar("NotificationsClient")
local v3 = Sonar("RemoteUtils")
local v4 = Sonar("TutorialService")
local v5 = v3.GetRemoteFunction("TheHatchRemote")
local TheHatchSign = workspace:WaitForChild("Interactions"):WaitForChild("TheHatchSign")
function t.Init(p1) --[[ Init | Line: 23 | Upvalues: v1 (copy), TheHatchSign (copy), v4 (copy), Workspace (copy), v5 (copy), v2 (copy) ]]
	v1.new(TheHatchSign, {
		Hint = "The Hatch",
		ShowHintLabel = true,
		Run = function() --[[ Run | Line: 28 | Upvalues: v4 (ref), Workspace (ref), v5 (ref), v2 (ref) ]]
			if not v4.CanDoActionInTutorial("InteractZones") then
				return
			end
			local v1 = Workspace:GetAttribute("HatchEventActive")
			local v22 = v5:InvokeServer("IsPlayerParticipating")
			local v3, v42
			if v1 then
				if v22 then
					v3 = "A strange egg appeared somewhere near the aqueducts! Go look!"
					v42 = "Green"
				else
					v3 = "You have to come from the hub to participate in the event!"
					v42 = "Red"
				end
			else
				v3 = "The Hatch Event is not underway.. come back soon!"
				v42 = "Red"
			end
			v2.Notify({
				Message = v3,
				Preset = v42
			})
		end,
		GetRange = function() --[[ GetRange | Line: 51 ]]
			return 25
		end
	})
end
t:Init()
return t