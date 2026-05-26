-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ExperienceNotificationService = game:GetService("ExperienceNotificationService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PromptClient")
local v2 = Sonar("NotificationsClient")
local v3 = Sonar("RewardsClient")
local v4 = Sonar("TutorialService")
local LocalPlayer = game.Players.LocalPlayer
local v5 = Sonar("PlayerWrapper").GetClient()
local LoyaltyRewards = workspace:WaitForChild("Interactions"):WaitForChild("LoyaltyRewards")
function t.Init(p1) --[[ Init | Line: 22 | Upvalues: Sonar (copy), LoyaltyRewards (copy), v4 (copy), v3 (copy), LocalPlayer (copy), v5 (copy) ]]
	Sonar("InteractMenu").new(LoyaltyRewards:WaitForChild("InteractPart"), {
		ShowHintLabel = true,
		Hint = "Open Rewards",
		Run = function() --[[ Run | Line: 25 | Upvalues: v4 (ref), v3 (ref) ]]
			if v4.CanDoActionInTutorial("InteractZones") then
				v3.Open()
			end
		end,
		GetRange = function() --[[ GetRange | Line: 31 ]]
			return 25
		end
	})
	local VerifyLoyaltyRewards = LocalPlayer.PlayerGui.PromptGui.PromptFrame.PromptFrames.VerifyLoyaltyRewards
	VerifyLoyaltyRewards.Community.Visible = v5.PlayerData.Metadata.PolicyCheck.Value
	VerifyLoyaltyRewards.Community.Content.TextBox.Text = string.reverse(".drocsid") .. string.reverse("vXZYpb9rnM/gg")
	VerifyLoyaltyRewards.Community.Content.TextBox.PlaceholderText = VerifyLoyaltyRewards.Community.Content.TextBox.Text
end
function t.Prompt(p1) --[[ Prompt | Line: 46 | Upvalues: v1 (copy), v5 (copy), v2 (copy), ExperienceNotificationService (copy), v3 (copy) ]]
	v1.Prompt({
		Type = "VerifyLoyaltyRewards",
		Run = function(p1) --[[ Run | Line: 49 | Upvalues: v5 (ref), v1 (ref), v2 (ref), ExperienceNotificationService (ref), v3 (ref) ]]
			v5.LoyaltyHandler:_promptAllowInventoryReadAccess()
			v5.LoyaltyHandler.PromptActiveChanged:Wait()
			if not (v1.IsActive() and v5.LoyaltyHandler.LoyaltyActive) then
				return
			end
			v2.Notify({
				Type = "LoyaltyVerify",
				Message = "Successfully verified!",
				Preset = "Green"
			})
			local function canPromptOptIn() --[[ canPromptOptIn | Line: 61 | Upvalues: ExperienceNotificationService (ref) ]]
				local v1, v2 = pcall(function() --[[ Line: 62 | Upvalues: ExperienceNotificationService (ref) ]]
					return ExperienceNotificationService:CanPromptOptInAsync()
				end)
				return v1 and v2
			end
			local v12, v22 = pcall(function() --[[ Line: 62 | Upvalues: ExperienceNotificationService (ref) ]]
				return ExperienceNotificationService:CanPromptOptInAsync()
			end)
			if not (v12 and v22) then
				v3.Open()
				return true
			end
			pcall(function() --[[ Line: 70 | Upvalues: ExperienceNotificationService (ref) ]]
				ExperienceNotificationService:PromptOptIn()
			end)
			v3.Open()
			return true
		end,
		Cancel = function() --[[ Cancel | Line: 79 ]]
			return true
		end
	})
end
t:Init()
return t