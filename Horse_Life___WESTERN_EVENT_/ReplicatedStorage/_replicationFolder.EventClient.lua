-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PlayerWrapper")
local v2 = Sonar("TutorialService")
local v3 = Sonar("Constants")
local v4 = v1.GetClient()
function t.PromptFromJoin() --[[ PromptFromJoin | Line: 18 | Upvalues: v3 (copy), v2 (copy), v4 (copy) ]]
	if not v3.EventName then
		return
	end
	local _ = v2.HasCompletedPrimaryTutorial(v4)
end
return t