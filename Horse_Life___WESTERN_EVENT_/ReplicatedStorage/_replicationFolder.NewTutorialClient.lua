-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiManager")
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("State")
local v5 = Sonar("TutorialService")
local t2 = { 15696848933, 16727629658, 16618922530 }
local v6 = v3.GetClient()
local NewTutorial = v6.PlayerCohorts.NewTutorial
local v7 = v4.fromProperty(v6.PlayerData.NewTutorialComplete, "Value")
local Container = Players.LocalPlayer.PlayerGui:WaitForChild("NewTutorialGui").Container
local v8 = v2.GetRemoteEvent("NewTutorialRemote")
local t3 = {
	{
		Name = "PreTutorialOption",
		Class = Sonar("PreTutorialOption")
	},
	{
		Name = "PreTutorialCinematic",
		Class = Sonar("PreTutorialCinematic")
	},
	{
		Name = "LearnBasicControls",
		Class = Sonar("LearnBasicControls")
	},
	{
		Name = "PreJumpCinematic",
		Class = Sonar("PreJumpCinematic")
	},
	{
		Name = "JumpTwice",
		Class = Sonar("JumpTwice")
	},
	{
		Name = "LearnToTameAHorse",
		Class = Sonar("LearnToTameAHorse")
	},
	{
		Name = "LearnToFeedYourHorse",
		Class = Sonar("LearnToFeedYourHorse")
	},
	{
		Name = "PreHelpBoardOption",
		Class = Sonar("PreHelpBoardOption")
	},
	{
		Name = "VisitTheHelpBoard",
		Class = Sonar("VisitTheHelpBoard")
	}
}
function t.StartFromJoin(p1) --[[ StartFromJoin | Line: 85 | Upvalues: NewTutorial (copy), v7 (copy), v6 (copy), v5 (copy), t2 (copy), v1 (copy), Container (copy), t3 (copy), v8 (copy) ]]
	if not NewTutorial:get() then
		return
	end
	if v7:get() then
		return
	end
	if v6.PrimaryTutorialStageValue and v5.HasCompletedPrimaryTutorial(v6) then
		return
	end
	if not table.find(t2, game.PlaceId) then
		return
	end
	v1.CloseAllFrames()
	v1.OpenFrame(Container)
	for v12, v2 in t3 do
		local Class = v2.Class
		local Run = Class.Run
		if Run then
			v8:FireServer(v2.Name)
			Run(Class, p1)
		end
	end
end
function t.Init(p1) --[[ Init | Line: 126 | Upvalues: v4 (copy), Container (copy), v1 (copy) ]]
	v4.fromProperty(Container, "Interactable"):subscribe(function(p1) --[[ Line: 127 | Upvalues: Container (ref) ]]
		Container.Selectable = p1
	end)
	v1.AddFrame(Container, {
		HUD = true,
		KeepPosition = true,
		TweenAnimation = false
	})
end
t:Init()
return t