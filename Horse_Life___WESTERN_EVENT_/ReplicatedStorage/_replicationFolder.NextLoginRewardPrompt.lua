-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("GuiFrameworkService", {
	Deferred = true
})
local v2 = Sonar("GameAffinityService")
Sonar("spr")
local v3 = Sonar("PlayerWrapper").GetClient()
function t.OnOpen(p1, p2) --[[ OnOpen | Line: 15 | Upvalues: v3 (copy), v1 (copy) ]]
	local v12 = v3:GetLoginRewards(p2.LoginRewards):GetProgress()
	p1.Maid:GiveTask(v1.AddComponent("TimerDisplay", {
		Instance = p1.Instance,
		EndTime = function() --[[ EndTime | Line: 21 | Upvalues: v12 (copy) ]]
			return v12.ClaimableTimestamp
		end
	}))
	p1.Maid:GiveTask(v1.AddComponent("RobuxDisplay", {
		Prefix = "Worth ",
		Instance = p1.Instance,
		Robux = v12.NextTier.RobuxValue or 150
	}))
	p1.Maid:GiveTask(v1.AddComponent("MultiItemDisplay", {
		MaxItems = 1,
		DoNotShowToolTip = true,
		Instance = v1.FindElement(p1.Instance, "ItemsFrame"),
		Items = v12.NextTier.Rewards
	}))
	p1.Maid:GiveTask(v1.PlayEffect("PulseStroke", {
		Instance = p1.Instance
	}))
end
function t.Prompt(...) --[[ Prompt | Line: 46 | Upvalues: v1 (copy), v2 (copy) ]]
	return v1.Prompt({
		Type = "NextLoginReward",
		Background = false,
		LoginRewards = ...,
		Run = function(...) --[[ Run | Line: 52 | Upvalues: v2 (ref) ]]
			task.spawn(v2.PromptStatus, "ExperienceNotifications")
			return true
		end,
		Cancel = function(...) --[[ Cancel | Line: 57 ]]
			return true
		end
	})
end
function t.Init(p1) --[[ Init | Line: 63 | Upvalues: v1 (copy), t (copy) ]]
	v1.AddPromptPreset("NextLoginReward", t.OnOpen)
end
t:Init()
return t