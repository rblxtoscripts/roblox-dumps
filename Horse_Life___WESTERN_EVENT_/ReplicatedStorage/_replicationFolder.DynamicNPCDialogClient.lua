-- https://lua.expert/
local t = {}
t.__index = t
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("WorldspaceGuiUtils")
local v3 = Sonar("GuiManager")
local v4 = Sonar("CharacterEffects")
local v5 = Sonar("LightingService")
local v6 = Sonar("DynamicNPCService")
local v7 = Sonar("StatBar")
local v8 = Sonar("Button")
local v9 = Sonar("Signal")
local v10 = Sonar("RemoteUtils")
local v11 = Sonar("MessagesClient")
local v12 = Sonar("TimeUtils")
local v13 = Sonar("PromptClient")
local v14 = Sonar("PlayerUtils")
local v15 = Sonar("NPCShopGui")
local v16 = Sonar("CharacterUtils")
local v17 = Sonar("DisplayAnimalClient")
local v18 = Sonar("ItemRewardDisplay")
local v19 = Sonar("StorageUtils")
local v20 = Sonar("Constants")
local v21 = Sonar("EventMissionsGui")
local v22 = v6.GetAll()
local v23 = Sonar(ReplicatedStorage.Storage.Events.ToyEvent.AutumnEvent)
local v24 = Sonar(v19.Get("NpcMissions"))
local LocalPlayer = game:GetService("Players").LocalPlayer
local v25 = Sonar("PlayerWrapper").GetClient()
local PlayerGui = LocalPlayer.PlayerGui
local ContainerFrame = PlayerGui:WaitForChild("DynamicNPCGui").ContainerFrame
local BottomFrame = ContainerFrame.BottomFrame
local TopFrame = ContainerFrame.TopFrame
local DialogContainer = BottomFrame.Menu.DialogContainer
local v26 = nil
local v27 = 0
local v28 = nil
local v29 = false
local v30 = v10.GetUnreliableRemoteEvent("ReportClientAnalyticsRemote")
local v31 = v10.GetRemoteFunction("InteractNPCRemote")
t.GiftSignal = v9.new()
local v32 = nil
function t.SetPendingNpcSellResume(p1) --[[ SetPendingNpcSellResume | Line: 66 | Upvalues: v32 (ref) ]]
	v32 = p1
end
function t.TakePendingNpcSellResume() --[[ TakePendingNpcSellResume | Line: 70 | Upvalues: v32 (ref) ]]
	local v1 = v32
	v32 = nil
	return v1
end
local function getAllChoices(p1) --[[ getAllChoices | Line: 76 ]]
	local t = {}
	for k, v in pairs(p1) do
		for k2, v2 in pairs(v) do
			t[#t + 1] = v2
		end
	end
	return t
end
function t.Start(p1) --[[ Start | Line: 86 | Upvalues: v26 (ref), t (copy) ]]
	if v26 then
	else
		v26 = t.new(p1)
		return v26
	end
end
function t.Stop() --[[ Stop | Line: 94 | Upvalues: v26 (ref) ]]
	if not v26 then
		return
	end
	v26:Destroy()
	v26 = nil
end
function t.YieldForNoInteraction(p1) --[[ YieldForNoInteraction | Line: 101 | Upvalues: v26 (ref) ]]
	if not v26 or v26.Type ~= p1 then
		return true
	end
	repeat
		task.wait()
	until not v26 or v26.Type ~= p1
	return true
end
local function promptCompleted(p1) --[[ promptCompleted | Line: 112 | Upvalues: v13 (copy), v12 (copy) ]]
	v13.Prompt({
		Type = "DynamicNPCBondTask",
		Setup = function(p12, p2) --[[ Setup | Line: 115 | Upvalues: p1 (copy), v12 (ref) ]]
			local function setTimeLabel() --[[ setTimeLabel | Line: 116 | Upvalues: p1 (ref), v12 (ref), p12 (copy) ]]
				local v1 = if p1.DynamicNPData.NextBond.Value == 0 then false else p1.DynamicNPData.NextBond.Value - v12.Get()
				if v1 then
					p12.Content.Timer.TextLabel.Text = v12.FormatString((math.max(0, v1)))
				end
			end
			p2.Maid:GiveTask(p1.DynamicNPData.NextBond:GetPropertyChangedSignal("Value"):Connect(setTimeLabel))
			p2.Maid:GiveTask(v12.AttachToTime(setTimeLabel))
			local v1 = if p1.DynamicNPData.NextBond.Value == 0 then false else p1.DynamicNPData.NextBond.Value - v12.Get()
			if v1 then
				p12.Content.Timer.TextLabel.Text = v12.FormatString((math.max(0, v1)))
			end
		end,
		Run = function() --[[ Run | Line: 129 ]]
			return true
		end
	})
end
t.GiftSignal:Connect(function(p1) --[[ Line: 135 | Upvalues: v26 (ref) ]]
	v26:Bond("Gift", p1)
end)
local t2 = {
	{
		Text = "Chat",
		OnRun = function(p1) --[[ OnRun | Line: 143 | Upvalues: v30 (copy), v6 (copy), v25 (copy), promptCompleted (copy) ]]
			v30:FireServer("NpcOptionSelected", "Chat", p1.Type)
			if v6.HasCompletedInteraction(v25, p1.Type, "Chat") then
				promptCompleted(p1)
			else
				p1:CreateChoices(p1.NPCData.Dialog.Chat, {
					CloseOption = {
						RemoveWhenDisplayed = true,
						Text = "Nevermind...",
						OnRun = function() --[[ OnRun | Line: 154 | Upvalues: p1 (copy) ]]
							p1:ReturnToIntro()
						end
					},
					OnDialog = function(p1, p2) --[[ OnDialog | Line: 158 ]] end,
					OnEnd = function() --[[ OnEnd | Line: 161 | Upvalues: p1 (copy) ]]
						p1:Bond("Chat")
					end
				})
			end
		end,
		Update = function(p1, p2) --[[ Update | Line: 166 | Upvalues: v6 (copy), v25 (copy) ]]
			if v6.HasCompletedInteraction(v25, p1.Type, "Chat") then
				p2.BackgroundTransparency = 0.5
				p2.Content.TextLabel.TextTransparency = 0.5
				p2.Content.Icon.ImageTransparency = 0.5
				p2.Content.Icon.Image = "rbxassetid://16190533260"
				p2.Content.TextLabel.TextColor3 = Color3.fromRGB(222, 191, 172)
				p2.BackgroundColor3 = Color3.fromRGB(222, 191, 172)
			else
				p2.BackgroundTransparency = 0
				p2.Content.TextLabel.TextTransparency = 0
				p2.Content.Icon.ImageTransparency = 0
				p2.Content.Icon.Image = "rbxassetid://17494461853"
				p2.Content.TextLabel.TextColor3 = Color3.fromRGB(255, 200, 46)
				p2.BackgroundColor3 = Color3.fromRGB(255, 200, 46)
			end
		end,
		Changed = function(p1) --[[ Changed | Line: 183 | Upvalues: v6 (copy), v25 (copy) ]]
			return v6.GetInteractionValue(v25, p1.Type, "Chat"):GetPropertyChangedSignal("Value")
		end
	},
	{
		Text = "Give Gift",
		OnRun = function(p1) --[[ OnRun | Line: 190 | Upvalues: v30 (copy), v6 (copy), v25 (copy), promptCompleted (copy), v28 (ref), v3 (copy), PlayerGui (copy) ]]
			v30:FireServer("NpcOptionSelected", "Gift", p1.Type)
			if v6.HasCompletedInteraction(v25, p1.Type, "Gift") then
				promptCompleted(p1)
			else
				v28 = true
				v3.OpenFrame(PlayerGui.InventoryGui.ContainerFrame)
			end
		end,
		Update = function(p1, p2) --[[ Update | Line: 200 | Upvalues: v6 (copy), v25 (copy) ]]
			if p1.NPCData.HasShop ~= nil and p1.NPCData.HasShop == false then
				p2.Visible = false
				return
			end
			if v6.HasCompletedInteraction(v25, p1.Type, "Gift") then
				p2.BackgroundTransparency = 0.5
				p2.Content.TextLabel.TextTransparency = 0.5
				p2.Content.Icon.ImageTransparency = 0.5
				p2.Content.Icon.Image = "rbxassetid://16190533260"
				p2.Content.TextLabel.TextColor3 = Color3.fromRGB(222, 191, 172)
				p2.BackgroundColor3 = Color3.fromRGB(222, 191, 172)
			else
				p2.BackgroundTransparency = 0
				p2.Content.TextLabel.TextTransparency = 0
				p2.Content.Icon.ImageTransparency = 0
				p2.Content.Icon.Image = "rbxassetid://17494461853"
				p2.Content.TextLabel.TextColor3 = Color3.fromRGB(255, 200, 46)
				p2.BackgroundColor3 = Color3.fromRGB(255, 200, 46)
			end
		end,
		Changed = function(p1) --[[ Changed | Line: 223 | Upvalues: v6 (copy), v25 (copy) ]]
			return v6.GetInteractionValue(v25, p1.Type, "Gift"):GetPropertyChangedSignal("Value")
		end
	},
	{
		Text = "Quest",
		OnRun = function(p1) --[[ OnRun | Line: 230 | Upvalues: v30 (copy), v6 (copy), v25 (copy), promptCompleted (copy), v31 (copy), BottomFrame (copy), v17 (copy), v23 (copy), v18 (copy), Sonar (copy), v24 (copy), t (copy) ]]
			v30:FireServer("NpcOptionSelected", "Quest", p1.Type)
			if v6.HasCompletedInteraction(v25, p1.Type, "Quest") then
				promptCompleted(p1)
				return
			end
			if p1.NPCData.IsToyEvent then
				local v1 = v25.EventData and v25.EventData:FindFirstChild("AutumnEvent")
				if not (p1.Type == "Autumn") or (if v1 then v1.Value and v1.Claimed.Value else v1) then
					p1:Parse({
						Dialog = "Would you like to open your quests?",
						Choices = {
							{
								Text = "Open Quests",
								OnRun = function(p1) --[[ OnRun | Line: 389 | Upvalues: Sonar (ref) ]]
									Sonar("ToyEventGui").Open({
										NpcName = p1.Type
									})
								end
							},
							{
								Text = "Back",
								OnRun = function(p1) --[[ OnRun | Line: 397 ]]
									p1:ReturnToIntro()
								end
							}
						}
					})
					return
				end
				local v3, v4 = v31:InvokeServer(p1.Type, "GetAutumnEventQuest")
				if v3 == "ReadyToClaim" then
					local v5 = v25.EventData and v25.EventData:FindFirstChild("AutumnEvent")
					local v62 = if v5 then v5:FindFirstChild("CompletedCount") else v5
					local v7 = v62 and v62.Value or 0
					local v8 = nil
					p1:Parse({
						Dialog = "You did it! Here\'s your first LEGO\194\174 Horse as promised!",
						Choices = {
							{
								Text = "Claim Reward",
								OnRun = function(p1) --[[ OnRun | Line: 256 | Upvalues: BottomFrame (ref), v8 (ref), v31 (ref), v17 (ref), v25 (ref) ]]
									BottomFrame.Reward.Visible = false
									if v8 then
										v8:Destroy()
									end
									local Type = p1.Type
									if not Type then
										return
									end
									local v1 = v31:InvokeServer(Type, "ClaimAutumnEventQuest")
									p1:ReturnToIntro()
									if not (v1 and #v1 > 0) then
										return
									end
									for v2, v3 in v1 do
										v17:DisplaySlot({
											Type = "Claimed",
											AllowNaming = true,
											ShowMaxWarning = true,
											MobileClickBackgroundToClose = true,
											Slot = v25:GetItemFolder("Animals"):WaitForChild(v3)
										})
										v17.YieldForNoDisplay()
									end
								end,
								Update = function(p1, p2) --[[ Update | Line: 282 ]]
									p2.Content.Icon.Image = "rbxassetid://88686317331511"
									p2.Content.TextLabel.TextColor3 = Color3.fromRGB(255, 200, 46)
									p2.BackgroundColor3 = Color3.fromRGB(255, 200, 46)
								end
							}
						}
					}, {
						OnDialog = function(p1, p2) --[[ OnDialog | Line: 290 | Upvalues: v23 (ref), BottomFrame (ref), v8 (ref), v18 (ref), v7 (copy) ]]
							if not (v23 and (v23[1] and v23[1].Rewards)) then
								return
							end
							BottomFrame.Reward.Visible = true
							v8 = v18.new({
								CycleTime = 999,
								Dots = false,
								DoNotClearChildren = true,
								ParentFrame = BottomFrame,
								CloneFrame = BottomFrame.Reward,
								Rewards = v23[1].Rewards,
								CompletedCount = v7
							})
						end
					})
				else
					if v3 == "AlreadyStarted" then
						p1:Parse({
							Dialog = "How\'s it going? You\'re almost done with your quest!",
							Choices = {
								{
									Text = "Back",
									OnRun = function(p1) --[[ OnRun | Line: 314 ]]
										p1:ReturnToIntro()
									end
								}
							}
						})
						return
					end
					local v9 = v25.EventData and v25.EventData:FindFirstChild("AutumnEvent")
					local v10 = if v9 then v9:FindFirstChild("CompletedCount") else v9
					local v11 = v10 and v10.Value or 0
					local v12 = nil
					local t2 = {}
					t2.Dialog = v4 and v4.Description or "Before we get started, I need to see what you can do! Tame 10 horses and harvest 5 forageables."
					t2.Choices = {
						{
							Text = "Accept",
							OnRun = function(p1) --[[ OnRun | Line: 334 | Upvalues: BottomFrame (ref), v12 (ref), v31 (ref) ]]
								BottomFrame.Reward.Visible = false
								if v12 then
									v12:Destroy()
								end
								v31:InvokeServer(p1.Type, "StartAutumnEventQuest")
								p1:Parse({
									Dialog = "Good luck!"
								}, {
									OnEnd = function() --[[ OnEnd | Line: 343 | Upvalues: p1 (copy) ]]
										p1:ReturnToIntro()
									end
								})
							end,
							Update = function(p1, p2) --[[ Update | Line: 348 ]]
								p2.Content.Icon.Image = "rbxassetid://17504294157"
								p2.Content.TextLabel.TextColor3 = Color3.fromRGB(255, 200, 46)
								p2.BackgroundColor3 = Color3.fromRGB(255, 200, 46)
							end
						},
						{
							Text = "Back",
							OnRun = function(p1) --[[ OnRun | Line: 356 | Upvalues: BottomFrame (ref), v12 (ref) ]]
								BottomFrame.Reward.Visible = false
								if v12 then
									v12:Destroy()
								end
								p1:ReturnToIntro()
							end
						}
					}
					p1:Parse(t2, {
						OnDialog = function(p1, p2) --[[ OnDialog | Line: 366 | Upvalues: v23 (ref), BottomFrame (ref), v12 (ref), v18 (ref), v11 (copy) ]]
							if not (v23 and (v23[1] and v23[1].Rewards)) then
								return
							end
							BottomFrame.Reward.Visible = true
							v12 = v18.new({
								CycleTime = 999,
								Dots = false,
								DoNotClearChildren = true,
								ParentFrame = BottomFrame,
								CloneFrame = BottomFrame.Reward,
								Rewards = v23[1].Rewards,
								CompletedCount = v11
							})
						end
					})
				end
			else
				local v14, v15 = v31:InvokeServer(p1.Type, "GetQuest")
				if v14 == true then
					local Description = v15.Description
					local v16 = v24[p1.Type][v15.MissionIndex]
					if v15.ChosenMission then
						Description = string.format(Description, v15.ChosenMission)
					end
					p1:Parse({
						Dialog = Description,
						Choices = {
							{
								Text = "Take Quest",
								OnRun = function(p1) --[[ OnRun | Line: 481 | Upvalues: v31 (ref), v16 (copy), v15 (copy), t (ref) ]]
									local v1 = v31:InvokeServer(p1.Type, "StartQuest")
									if not v1 then
										p1:Parse({
											Dialog = "Looks like I cant have you do that quest right now. Sorry!",
											OnEnd = function() --[[ OnEnd | Line: 503 | Upvalues: v1 (copy), t (ref), p1 (copy) ]]
												if v1 then
													t.Stop()
												else
													p1:ReturnToIntro()
												end
											end
										})
										return
									end
									if v16.RunFunction then
										warn("HasRunFunction")
										v16.RunFunction(p1.Type, v15.ChosenMission, 5)
									end
									p1:Parse({
										Dialog = "Good luck!",
										OnEnd = function() --[[ OnEnd | Line: 492 | Upvalues: v1 (copy), t (ref), p1 (copy) ]]
											if v1 then
												t.Stop()
											else
												p1:ReturnToIntro()
											end
										end
									})
								end,
								Update = function(p1, p2) --[[ Update | Line: 513 ]]
									p2.Content.Icon.Image = "rbxassetid://17514218413"
									p2.Content.TextLabel.TextColor3 = Color3.fromRGB(255, 200, 46)
									p2.BackgroundColor3 = Color3.fromRGB(255, 200, 46)
								end
							},
							{
								Text = "Decline Quest",
								OnRun = function(p1) --[[ OnRun | Line: 522 ]]
									p1:Parse({
										Dialog = "No worries, maybe another time then!",
										OnEnd = function() --[[ OnEnd | Line: 525 | Upvalues: p1 (copy) ]]
											p1:ReturnToIntro()
										end
									})
								end
							}
						}
					})
				else
					local v182 = "Sorry I don\'t have any quests for you today! Come back tomorrow"
					if v14 == "AlreadyStarted" then
						v182 = "How\'s your quest going? Have you completed it yet?"
					elseif v14 == "QuestAlreadyActive" then
						v182 = "You already have a quest! Go finish that one!"
					end
					if v14 == "ReadyToClaim" then
						p1:Parse({
							Dialog = "Thanks for completing that quest. It\'s nice to have an extra set of helping hands around here!",
							Choices = {
								{
									Text = "Claim Reward",
									OnRun = function(p1) --[[ OnRun | Line: 427 | Upvalues: v31 (ref) ]]
										p1:Parse({
											Dialog = "ENJOY!",
											OnEnd = function() --[[ OnEnd | Line: 430 | Upvalues: v31 (ref), p1 (copy) ]]
												v31:InvokeServer(p1.Type, "FinishQuest")
												p1:ReturnToIntro()
											end
										})
									end,
									Update = function(p1, p2) --[[ Update | Line: 437 ]]
										p2.Content.Icon.Image = "rbxassetid://88686317331511"
										p2.Content.TextLabel.TextColor3 = Color3.fromRGB(255, 200, 46)
										p2.BackgroundColor3 = Color3.fromRGB(255, 200, 46)
									end
								}
							}
						})
					else
						p1:Parse({
							Dialog = v182,
							Choices = {
								{
									Text = "Back",
									OnRun = function(p1) --[[ OnRun | Line: 454 ]]
										p1:Parse({
											Dialog = "No worries, maybe another time then!",
											OnEnd = function() --[[ OnEnd | Line: 457 | Upvalues: p1 (copy) ]]
												p1:ReturnToIntro()
											end
										})
									end
								}
							}
						})
					end
				end
			end
		end,
		Update = function(p1, p2) --[[ Update | Line: 534 | Upvalues: v24 (copy), v6 (copy), v25 (copy) ]]
			local v1 = v24[p1.Type]
			if p1.NPCData.NoMissions or (p1.Type == "EventGuide" or (not v1 or next(v1) == nil)) then
				p2.Visible = false
				return
			end
			if v6.HasCompletedInteraction(v25, p1.Type, "Quest") then
				p2.Content.Icon.Image = "rbxassetid://17276478099"
				p2.Content.TextLabel.TextColor3 = Color3.fromRGB(222, 191, 172)
				p2.BackgroundColor3 = Color3.fromRGB(222, 191, 172)
			else
				p2.Content.Icon.Image = "rbxassetid://17276478099"
				p2.Content.TextLabel.TextColor3 = Color3.fromRGB(182, 99, 255)
				p2.BackgroundColor3 = Color3.fromRGB(182, 99, 255)
			end
		end,
		Changed = function(p1) --[[ Changed | Line: 551 | Upvalues: v6 (copy), v25 (copy) ]]
			return v6.GetInteractionValue(v25, p1.Type, "Quest"):GetPropertyChangedSignal("Value")
		end
	},
	{
		Text = "Shop",
		OnRun = function(p1) --[[ OnRun | Line: 558 | Upvalues: v30 (copy), v3 (copy), ContainerFrame (copy), v15 (copy) ]]
			v30:FireServer("NpcOptionSelected", "Shop", p1.Type)
			v3.CloseFrame(ContainerFrame)
			v15.Open(p1.NPCData, function() --[[ Line: 561 ]] end)
		end,
		Update = function(p1, p2) --[[ Update | Line: 564 ]]
			if p1.NPCData.HasShop == nil or p1.NPCData.HasShop ~= false then
				p2.BackgroundTransparency = 0
				p2.Content.TextLabel.TextTransparency = 0
				p2.Content.Icon.ImageTransparency = 0
				p2.Content.Icon.Image = "rbxassetid://16550454602"
				p2.Content.TextLabel.TextColor3 = Color3.fromRGB(37, 206, 181)
				p2.BackgroundColor3 = Color3.fromRGB(37, 206, 181)
			else
				p2.Visible = false
			end
		end,
		Changed = function(p1) --[[ Changed | Line: 579 ]]
			return p1.DynamicNPData.Bond:GetPropertyChangedSignal("Value")
		end
	},
	{
		Text = "Sell Stock",
		OnRun = function(p1) --[[ OnRun | Line: 585 | Upvalues: v30 (copy), t (copy), v3 (copy), PlayerGui (copy) ]]
			v30:FireServer("NpcOptionSelected", "Sell", p1.Type)
			t.SetPendingNpcSellResume({
				Type = p1.Type,
				Character = p1.Character,
				Target = p1.Target,
				NPC = p1.NPC
			})
			v3.OpenMainFrame(PlayerGui.NPCSellGui.ContainerFrame, {
				DisableControls = true,
				CallbackArgs = { p1.Type }
			})
		end,
		Update = function(p1, p2) --[[ Update | Line: 598 | Upvalues: v20 (copy) ]]
			if v20[("%*SellStock"):format(p1.Type)] then
				p2.BackgroundTransparency = 0
				p2.Content.TextLabel.TextTransparency = 0
				p2.Content.Icon.ImageTransparency = 0
				p2.Content.Icon.Image = "rbxassetid://118373103862903"
				p2.Content.Icon.ScaleType = Enum.ScaleType.Fit
				p2.Content.TextLabel.TextColor3 = Color3.fromRGB(85, 255, 127)
				p2.BackgroundColor3 = Color3.fromRGB(85, 255, 127)
			else
				p2.Visible = false
			end
		end,
		Changed = function(p1) --[[ Changed | Line: 613 ]]
			return p1.DynamicNPData.Bond:GetPropertyChangedSignal("Value")
		end
	},
	{
		Text = "Open Event Missions",
		OnRun = function(p1) --[[ OnRun | Line: 619 | Upvalues: t (copy), v21 (copy) ]]
			t.Stop()
			v21:Open()
		end,
		Update = function(p1, p2) --[[ Update | Line: 623 | Upvalues: v20 (copy) ]]
			if p1.Type == "EventGuide" and v20.EventName then
				p2.Content.Icon.Image = "rbxassetid://17276478099"
				p2.Content.TextLabel.TextColor3 = Color3.fromRGB(182, 99, 255)
				p2.BackgroundColor3 = Color3.fromRGB(182, 99, 255)
			else
				p2.Visible = false
			end
		end
	},
	{
		Text = "Goodbye",
		OnRun = t.Stop,
		Update = function(p1, p2) --[[ Update | Line: 637 ]]
			p2.Content.XIcon.Visible = true
			p2.Content.Icon.Visible = false
		end
	}
}
function t.IsGifting() --[[ IsGifting | Line: 644 | Upvalues: v28 (ref) ]]
	return v28
end
function t.CancelGifting() --[[ CancelGifting | Line: 648 | Upvalues: v28 (ref) ]]
	v28 = false
end
function t.GetDialogByBondLevel(p1, p2) --[[ GetDialogByBondLevel | Line: 652 ]]
	for i, v in ipairs(p1.NPCData.Dialog.Gift.Dialog) do
		if v.Bond.Min <= p2 and p2 <= v.Bond.Max then
			return v.Dialog[1].Dialog
		end
	end
	return "Here\'s a gift!"
end
function t.new(p1) --[[ new | Line: 661 | Upvalues: v25 (copy), t (copy), v1 (copy), v16 (copy), LocalPlayer (copy), v22 (copy), v9 (copy), UserInputService (copy), RunService (copy), v27 (ref), v15 (copy), v6 (copy), v7 (copy), TopFrame (copy), v12 (copy), BottomFrame (copy), v2 (copy), v3 (copy), ContainerFrame (copy), t2 (ref), v29 (ref), v31 (copy), v24 (copy), ReplicatedStorage (copy) ]]
	if v25:IsInAction("BossFight") or v25:IsInAction("GlobalBossFight") then
		return
	end
	local ResumeFromNpcSell = p1.ResumeFromNpcSell
	p1.ResumeFromNpcSell = nil
	local v13 = t
	local v23 = setmetatable(p1, v13)
	v23.Maid = v1.new()
	v23.ChoicesMaid = v1.new()
	v23.Maid:GiveTask(v23.ChoicesMaid)
	v25:SetActionState("SpeakingToNPC", true)
	v16.unequipTools(LocalPlayer)
	v23.NPCData = v22[v23.Type]
	v23.DynamicNPData = v25.PlayerData.DynamicNPCs[v23.Type]
	v23.ProceedSignal = v9.new()
	v23.Maid:GiveTask(v23.ProceedSignal)
	v23.Maid:GiveTask(UserInputService.InputBegan:Connect(function(p1, p2) --[[ Line: 693 | Upvalues: RunService (ref), t (ref), v23 (copy) ]]
		if p2 then
			return
		end
		if p1.KeyCode == Enum.KeyCode.X or p1.KeyCode == Enum.KeyCode.ButtonX then
			if RunService:IsStudio() then
				t.Stop()
			else
				v23:Proceed()
			end
		else
			if p1.UserInputType ~= Enum.UserInputType.MouseButton1 and p1.UserInputType ~= Enum.UserInputType.Touch then
				return
			end
			v23:Proceed()
		end
	end))
	v23.Maid:GiveTask(v23.Target.AncestryChanged:Connect(function() --[[ Line: 711 | Upvalues: t (ref) ]]
		t.Stop()
	end))
	v23.Maid:GiveTask(UserInputService.InputChanged:Connect(function(p1, p2) --[[ Line: 715 | Upvalues: v27 (ref) ]]
		if p2 then
			return
		end
		if p1.UserInputType == Enum.UserInputType.MouseWheel then
			v27 = math.clamp(v27 + p1.Position.Z * 1.5, -1, 12)
			return
		end
		if p1.UserInputType ~= Enum.UserInputType.Gamepad1 or p1.KeyCode ~= Enum.KeyCode.Thumbstick2 then
			return
		end
		v27 = math.clamp(v27 - p1.Position.Y * 0.5, -1, 12)
	end))
	local v32 = 1
	v23.Maid:GiveTask(UserInputService.TouchPinch:Connect(function(p1, p2, p3, p4) --[[ Line: 727 | Upvalues: v32 (ref), v27 (ref) ]]
		if p4 ~= Enum.UserInputState.Begin then
			if p4 ~= Enum.UserInputState.Change then
				return
			end
			v27 = math.clamp(v27 - (p2 - v32) * 10, -1, 12)
		end
		v32 = p2
	end))
	v27 = 0
	v23.Maid:GiveTask(RunService.RenderStepped:Connect(function() --[[ Line: 739 | Upvalues: v23 (copy), t (ref), v15 (ref) ]]
		local Position = v23.Target:GetPivot().Position
		if not (((v23.Character:GetPivot().Position - Position) * Vector3.new(1, 0, 1)).Magnitude > 32.5) then
			return
		end
		t.Stop()
		v15.Close()
	end))
	if v6.CanBondWithNPC(v23.Type) then
		v23.Maid:GiveTask(v7.new({
			TweenAmount = true,
			Clipped = false,
			Frame = TopFrame.Content.ProgressBar.FillColor,
			Get = function() --[[ Get | Line: 761 | Upvalues: v23 (copy) ]]
				return v23.DynamicNPData.Bond.Value
			end,
			GetMax = function() --[[ GetMax | Line: 764 | Upvalues: v23 (copy) ]]
				return v23.NPCData.BondPointsForFull
			end,
			OnChanged = function(p1, p2) --[[ OnChanged | Line: 767 | Upvalues: TopFrame (ref) ]]
				local v1 = p1 / p2 * 100
				TopFrame.Content.Bond.TextLabel.Text = if v1 % 1 == 0 then string.format("%d%%", v1) else string.format("%.2f%%", v1)
			end,
			Changed = { v23.DynamicNPData.Bond:GetPropertyChangedSignal("Value") }
		}))
		TopFrame.Content.ProgressBar.Visible = true
		local Shop = TopFrame.Content.ProgressBar.BondUnlocks.Shop
		Shop.Visible = v23.NPCData.HasShop ~= false
		local function SetStreak() --[[ SetStreak | Line: 784 | Upvalues: v23 (copy), TopFrame (ref) ]]
			local Streak = v23.DynamicNPData.Streak.Value
			TopFrame.Content.Streak.TextLabel.Text = Streak .. " Day Streak"
			TopFrame.Content.StreakGain.TextLabel.Text = math.clamp(Streak, 0, 4) * 15 .. "% More Experience!"
		end
		v23.Maid:GiveTask(v23.DynamicNPData.Streak:GetPropertyChangedSignal("Value"):Connect(SetStreak))
		local Streak = v23.DynamicNPData.Streak.Value
		TopFrame.Content.Streak.TextLabel.Text = Streak .. " Day Streak"
		TopFrame.Content.StreakGain.TextLabel.Text = math.clamp(Streak, 0, 4) * 15 .. "% More Experience!"
	else
		TopFrame.Content.ProgressBar.Visible = false
	end
	local function setTimeLabel() --[[ setTimeLabel | Line: 798 | Upvalues: v23 (copy), v12 (ref), TopFrame (ref) ]]
		local v1 = if v23.DynamicNPData.NextBond.Value == 0 then false else v23.DynamicNPData.NextBond.Value - v12.Get()
		if v1 and v1 > 0 then
			TopFrame.Content.Timer.TextLabel.Text = "Tasks reset in " .. v12.FormatString(v1)
			TopFrame.Content.Timer.Visible = true
		else
			TopFrame.Content.Timer.Visible = false
		end
	end
	v23.Maid:GiveTask(v23.DynamicNPData.NextBond:GetPropertyChangedSignal("Value"):Connect(setTimeLabel))
	v23.Maid:GiveTask(v12.AttachToTime(setTimeLabel))
	setTimeLabel()
	BottomFrame.Menu.NameLabel.Text = v23.Type
	v2.SetWorldspaceGuiVisibility(false)
	v3.OpenMainFrame(ContainerFrame, {
		Blur = false,
		DisableControls = true,
		CloseAll = true
	})
	local tbl = { BottomFrame, TopFrame }
	for k, v in pairs(tbl) do
		v3.UpdateFrame(v)
	end
	local function doIntro() --[[ doIntro | Line: 823 | Upvalues: v23 (copy), t2 (ref) ]]
		local Intro = v23.NPCData.Dialog.Intro
		local t = {
			OnDialog = function(p1, p2) --[[ OnDialog | Line: 826 ]]
				if not p1.IntroDialog then
					p1.IntroDialog = p2
				end
			end
		}
		if typeof(Intro) ~= "table" or rawget(Intro, "Choices") == nil then
			t.Choices = t2
		end
		v23:Parse(Intro, t)
	end
	if ResumeFromNpcSell then
		local v4 = v23.NPCData.Dialog.ShopRespones and v23.NPCData.Dialog.ShopRespones.Selling.Success or "Thanks for the business!"
		local t3 = {}
		t3.Dialog = if ResumeFromNpcSell.Sold and v4 then v4 else v23.NPCData.Dialog.ShopRespones and v23.NPCData.Dialog.ShopRespones.Selling.Fail or "Maybe next time!"
		v23:Parse(t3, {
			OnEnd = doIntro
		})
	else
		v29 = false
		local v72 = v31:InvokeServer(v23.Type, "GetGift")
		v31:InvokeServer(v23.Type, "GetStreak")
		if not v23.NPCData.NoMissions then
			local v8 = v24[v23.Type]
			if v8 and (next(v8) ~= nil and v31:InvokeServer(v23.Type, "GetQuest") == "ReadyToClaim") then
				v29 = true
			end
		end
		if v72 then
			v23.Maid:GiveTask(function() --[[ Line: 865 | Upvalues: v23 (copy) ]]
				v23.NPC:AnimateGift(false)
			end)
			v23:Parse({
				Dialog = v23:GetDialogByBondLevel(v23:GetBondPercentage())
			}, {
				Choices = {
					{
						Text = "Claim Gift",
						OnRun = function(p1) --[[ OnRun | Line: 875 | Upvalues: ReplicatedStorage (ref), v31 (ref), v72 (copy), doIntro (copy) ]]
							ReplicatedStorage.Storage.SFX.ClaimGift:Play()
							game.TweenService:Create(game.Lighting.ColorCorrection, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true), {
								Brightness = 0.15
							}):Play()
							p1.NPC:AnimateGift(false)
							if v31:InvokeServer(p1.Type, "ClaimGift") then
								p1.NPC:AnimateGift(v72)
							end
							p1:Parse({
								Dialog = "Please enjoy your gift!",
								OnEnd = doIntro
							})
						end,
						Update = function(p1, p2) --[[ Update | Line: 898 ]]
							p2.Content.Icon.Image = "rbxassetid://17514218413"
							p2.Content.TextLabel.TextColor3 = Color3.fromRGB(255, 200, 46)
							p2.BackgroundColor3 = Color3.fromRGB(255, 200, 46)
						end
					}
				}
			})
		elseif v29 then
			v23:Parse({
				Dialog = "Hey there! Thanks for getting those for me!"
			}, {
				Choices = {
					{
						Text = "Claim Reward",
						OnRun = function(p1) --[[ OnRun | Line: 915 | Upvalues: ReplicatedStorage (ref), v31 (ref), v29 (ref), doIntro (copy) ]]
							ReplicatedStorage.Storage.SFX.ClaimGift:Play()
							v29 = false
							if v31:InvokeServer(p1.Type, "FinishQuest") then
								p1:Parse({
									Dialog = "Enjoy your reward!",
									OnEnd = doIntro
								})
							else
								p1:Parse({
									Dialog = "THANKS!",
									OnEnd = doIntro
								})
							end
						end,
						Update = function(p1, p2) --[[ Update | Line: 934 ]]
							p2.Content.Icon.Image = "rbxassetid://17514218413"
							p2.Content.TextLabel.TextColor3 = Color3.fromRGB(255, 200, 46)
							p2.BackgroundColor3 = Color3.fromRGB(255, 200, 46)
						end
					}
				}
			})
		else
			doIntro()
		end
	end
	return v23
end
function t.Destroy(p1) --[[ Destroy | Line: 949 | Upvalues: v29 (ref), v25 (copy), v5 (copy), v4 (copy), v2 (copy), PlayerGui (copy), v3 (copy) ]]
	v29 = false
	v25:SetActionState("SpeakingToNPC", false)
	v5.setLightingMode("NPCDialog", false, nil, true)
	v4.UpdateVisibility()
	v2.SetWorldspaceGuiVisibility(true)
	local NPCSellGui = PlayerGui:FindFirstChild("NPCSellGui")
	local v1 = if NPCSellGui then NPCSellGui:FindFirstChild("ContainerFrame") else NPCSellGui
	if not (v1 and v3.IsFrameOpen(v1)) then
		v3.OpenHUD()
	end
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.ReturnToIntro(p1) --[[ ReturnToIntro | Line: 967 | Upvalues: t2 (ref) ]]
	if not p1.IntroDialog then
		return
	end
	local t = {
		SkipTypewriter = true
	}
	if typeof(p1.IntroDialog) == "table" then
		if rawget(p1.IntroDialog, "Choices") == nil then
			t.Choices = t2
		end
	else
		t.Choices = t2
	end
	p1:Parse(p1.IntroDialog, t)
end
function t.ActiveNPC() --[[ ActiveNPC | Line: 980 | Upvalues: v26 (ref) ]]
	return v26.DynamicNPData
end
function t.Parse(p1, p2, p3) --[[ Parse | Line: 984 | Upvalues: getAllChoices (copy), DialogContainer (copy), v14 (copy), LocalPlayer (copy), ReplicatedStorage (copy) ]]
	local v1 = if p3 then p3 else {}
	if type(p2.Dialog) == "table" and type(p2.Dialog[1]) ~= "string" then
		t = {}
		v3 = v1
		for k, v in pairs(p2.Dialog) do
			if v.Bond then
				local v4 = p1:GetBondPercentage()
				if v.Bond.Min <= v4 and v4 <= v.Bond.Max then
					t[#t + 1] = v
				end
				continue
			end
			t[#t + 1] = v
		end
		p1:Parse(t[math.random(1, #t)], v3)
		return
	end
	p1.ChoicesMaid:DoCleaning()
	local v5 = getAllChoices({ p2.Choices, v1.Choices })
	if v1.OnDialog then
		v1.OnDialog(p1, p2)
	end
	local v6 = v1
	local v7 = type(p2.Dialog) == "table" and p2.Dialog or { p2.Dialog }
	for k, v in pairs(v7) do
		p1:SetCanProceed(false, v6)
		DialogContainer.DialogLabel.Text = v:gsub("PLAYERNAME", v14.GetPlayerName(LocalPlayer))
		DialogContainer.DialogLabel.MaxVisibleGraphemes = 0
		if v6.SkipTypewriter then
			DialogContainer.DialogLabel.MaxVisibleGraphemes = utf8.len(DialogContainer.DialogLabel.ContentText)
		else
			ReplicatedStorage.Storage.SFX.DialogSound:Play()
			for i = 1, utf8.len(DialogContainer.DialogLabel.ContentText) do
				task.wait(0.015)
				DialogContainer.DialogLabel.MaxVisibleGraphemes = i
			end
			ReplicatedStorage.Storage.SFX.DialogSound:Stop()
		end
		p1:SetCanProceed(true, next(v5))
		if next(v5) and k ~= #v7 or not next(v5) then
			p1.ProceedSignal:Wait()
		end
	end
	if next(v5) then
		p1:CreateChoices(v5, v6)
		return
	end
	if v6.CloseOption then
		p1:CreateChoices({}, v6)
	end
	for k, v in pairs({ p2.OnEnd, v6.OnEnd }) do
		if v then
			v(p1, p2)
		end
	end
	if not p1.ReturnToIntro then
		return
	end
	p1:ReturnToIntro()
end
function t.Proceed(p1) --[[ Proceed | Line: 1059 ]]
	if p1.CanProceed then
		p1.ProceedSignal:Fire()
	end
end
function t.SetCanProceed(p1, p2, p3) --[[ SetCanProceed | Line: 1066 | Upvalues: DialogContainer (copy) ]]
	p1.CanProceed = p2
	if p3 then
		DialogContainer.ProceedLabel.Visible = false
	else
		DialogContainer.ProceedLabel.Visible = p2
	end
end
function t.CreateChoices(p1, p2, p3) --[[ CreateChoices | Line: 1075 | Upvalues: BottomFrame (copy), v8 (copy) ]]
	local v2 = p3 or {}
	p1.ChoicesMaid:DoCleaning()
	for k, v in pairs({
		p2,
		{ v2.CloseOption }
	}) do
		for k2, v4 in pairs(v) do
			local v3
			if v4 then
				local v42 = BottomFrame.ChatOptions.Default:Clone()
				v42.Name = k2
				v42.Content.TextLabel.Text = v4.Text
				v42.Visible = true
				if v4.Update then
					if v4.Changed then
						local v5 = type(v4.Changed) == "function" and v4.Changed(p1) or v4.Changed
						v3 = if type(v5) == "table" and v5 then v5 else { v5 }
						for k3, v6 in pairs(v3) do
							p1.ChoicesMaid:GiveTask(v6:Connect(function() --[[ Line: 1094 | Upvalues: v4 (copy), p1 (copy), v42 (copy) ]]
								v4.Update(p1, v42)
							end))
						end
					end
					v4.Update(p1, v42)
				else
					v42.Content.Icon.ImageColor3 = Color3.fromRGB(255, 243, 226)
				end
				p1.ChoicesMaid:GiveTask(v8.new(v42, {
					Click = function() --[[ Click | Line: 1105 | Upvalues: v4 (copy), p1 (copy), v2 (ref) ]]
						if v4.OnRun then
							v4.OnRun(p1)
						end
						if not v4.Dialog then
							return
						end
						p1:Parse(v4, v2)
					end
				}))
				v42.Parent = BottomFrame.ChatOptions
				p1.ChoicesMaid:GiveTask(v42)
			end
		end
	end
	if not (v2.CloseOption and v2.CloseOption.RemoveWhenDisplayed) then
		return
	end
	v2.CloseOption = nil
end
function t.GetBondPercentage(p1) --[[ GetBondPercentage | Line: 1126 ]]
	return math.clamp(p1.DynamicNPData.Bond.Value / p1.NPCData.BondPointsForFull * 100, 0, 100)
end
function t.Bond(p1, ...) --[[ Bond | Line: 1130 | Upvalues: v31 (copy), v28 (ref), v11 (copy), ReplicatedStorage (copy) ]]
	local v1 = v31:InvokeServer(p1.Type, ...)
	if not v1 then
		return
	end
	local v2 = v1 / p1.NPCData.BondPointsForFull * 100
	v28 = false
	local v3 = v2 % 1 == 0 and string.format("%d%%", v2) or string.format("%.2f%%", v2)
	v11:AddNotification({
		Type = "DynamicNPCBond",
		DoNotSkip = true,
		Duration = 3.5,
		Text = "+" .. v3,
		RunBefore = function() --[[ RunBefore | Line: 1140 | Upvalues: p1 (copy) ]]
			p1.NPC:AnimateBond()
			game.TweenService:Create(game.Lighting.ColorCorrection, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true), {
				Brightness = 0.15
			}):Play()
		end,
		Sound = { ReplicatedStorage.Storage.SFX.BondSound }
	})
end
function t.Init(p1) --[[ Init | Line: 1159 | Upvalues: v3 (copy), ContainerFrame (copy), BottomFrame (copy), TopFrame (copy), t (copy) ]]
	v3.AddFrame(ContainerFrame, {
		KeepPosition = true,
		ExcludeInteractMenu = true,
		OpenPosition = ContainerFrame.Position
	})
	v3.AddFrame(BottomFrame, {
		TweenAnimation = true,
		OpenPosition = BottomFrame.Position,
		ClosePosition = BottomFrame.Position + UDim2.new(0, 0, 0.5, 0),
		TweenStyle = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
		CheckVisibility = function() --[[ CheckVisibility | Line: 1172 | Upvalues: v3 (ref), ContainerFrame (ref) ]]
			return v3.IsFrameOpen(ContainerFrame)
		end
	})
	v3.AddFrame(TopFrame, {
		TweenAnimation = true,
		OpenPosition = TopFrame.Position,
		ClosePosition = TopFrame.Position + UDim2.new(0, 0, -0.25, 0),
		TweenStyle = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
		CheckVisibility = function() --[[ CheckVisibility | Line: 1181 | Upvalues: v3 (ref), ContainerFrame (ref) ]]
			return v3.IsFrameOpen(ContainerFrame)
		end
	})
	v3.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 1186 | Upvalues: t (ref) ]]
		t.Stop()
	end)
end
t:Init()
return t