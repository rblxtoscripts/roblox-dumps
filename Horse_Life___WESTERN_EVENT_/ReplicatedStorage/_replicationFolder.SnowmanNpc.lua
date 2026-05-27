-- https://lua.expert/
local t = {}
t.__index = t
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local v3 = Sonar("InteractMenu")
local v4 = Sonar("DialogueGui")
local v5 = Sonar("ContextualUtils")
local v6 = Sonar("RemoteUtils").GetRemoteEvent("SnowmanNpcRemote")
local t2 = {}
local function GetMainDialogChoices(p1, p2) --[[ GetMainDialogChoices | Line: 17 | Upvalues: v4 (copy), t2 (copy) ]]
	return {
		{
			Text = "Who are you?",
			Dialog = { "I am a talking snowman created by Celeste.", "She used her special magic to bring me to life." },
			OnEnd = function(p12) --[[ OnEnd | Line: 25 | Upvalues: p1 (copy) ]]
				p12:CreateChoices(p1)
			end
		},
		{
			Text = "Where is Celeste?",
			Dialog = { "You can find Celeste in the Winter Map.", "She is very kind and knows everything about this season.", "She might even give you special tasks and rewards." },
			OnEnd = function(p12) --[[ OnEnd | Line: 36 | Upvalues: p1 (copy) ]]
				p12:CreateChoices(p1)
			end
		},
		{
			Text = "Why do other snowmen not talk?",
			Dialog = { "Celeste gave me a bigger spark of magic than the others.", "She said I should welcome new visitors and make them smile.", "I think I am doing a good job!" },
			OnEnd = function(p12) --[[ OnEnd | Line: 47 | Upvalues: p1 (copy) ]]
				p12:CreateChoices(p1)
			end
		},
		{
			Text = "Goodbye",
			Dialog = { "Bye friend! Stay warm and keep exploring.", "I hope we meet again soon!" },
			OnEnd = function() --[[ OnEnd | Line: 57 | Upvalues: v4 (ref), t2 (ref), p2 (copy) ]]
				v4.Stop()
				task.spawn(function() --[[ Line: 59 | Upvalues: t2 (ref), p2 (ref) ]]
					task.wait(0.1)
					t2[p2] = tick()
				end)
			end
		}
	}
end
function t.new(p1) --[[ new | Line: 68 | Upvalues: t (copy), v2 (copy), v3 (copy), v4 (copy), t2 (copy), GetMainDialogChoices (copy), v5 (copy), v6 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Object = p1
	v22.Maid = v2.new()
	v22.Maid:GiveTask(v3.new(p1, {
		ShowHintLabel = true,
		Hint = "Talk",
		Run = function() --[[ Run | Line: 76 | Upvalues: v4 (ref), t2 (ref), p1 (copy), GetMainDialogChoices (ref), v5 (ref), v6 (ref) ]]
			if v4.IsActive() then
				return
			end
			if tick() - (t2[p1] or 0) < 0.5 then
				return
			end
			local t = {}
			for v2, v3 in GetMainDialogChoices(t, p1) do
				t[v2] = v3
			end
			v5.SetGuiWorldspacePointTo()
			v6:FireServer("TalkToSnowman")
			local t3 = {
				Name = "Snowy",
				CameraMode = "LookVector"
			}
			t3.Target = p1:FindFirstChild("CameraPart") or p1
			t3.Dialog = { "Hello there, friend! What would you like to snow?" }
			t3.Choices = t
			v4.Start(t3)
		end,
		Visibility = function() --[[ Visibility | Line: 104 | Upvalues: p1 (copy) ]]
			return p1:IsDescendantOf(workspace)
		end,
		GetRange = function() --[[ GetRange | Line: 108 ]]
			return 25
		end
	}))
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 118 ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
function t.Init() --[[ Init | Line: 123 | Upvalues: v1 (copy), t (copy) ]]
	v1.new("SnowmanNpc", t):Init()
end
t.Init()
return t