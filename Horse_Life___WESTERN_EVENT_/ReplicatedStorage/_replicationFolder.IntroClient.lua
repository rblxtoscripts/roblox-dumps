-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiManager")
local v2 = Sonar("GuiUtils")
local v3 = Sonar("AdventCalanderGui")
local v4 = Sonar("BirthdayClient")
local v5 = Sonar("ClaimSetsClient")
local v6 = Sonar("FinishTutorialClient")
local v7 = Sonar("NewTutorialClient")
local v8 = Sonar("RewardsGuiNew")
local t2 = {
	Sonar("StarterHorseSelectionClient"),
	v7,
	v6,
	Sonar("TutorialClient"),
	v8,
	v5,
	Sonar("UpdateLogGui"),
	v4,
	Sonar("EventClient"),
	v3
}
function t.Init(p1) --[[ Init | Line: 42 | Upvalues: v1 (copy), Sonar (copy), t2 (copy), v2 (copy) ]]
	v1.CloseAllFrames()
	Sonar("RewardsClient")
	for v12, v22 in t2 do
		local v3 = nil
		local v4 = (if v3 then v3 else v22.OpenFromJoin) or v22.PromptFromJoin or v22.StartFromJoin
		if v4 and v4(v22) == "Skip" then
			return
		end
	end
	v1.OpenHUD()
	v2.SetCoreGui(Enum.CoreGuiType.Chat, true)
end
return t