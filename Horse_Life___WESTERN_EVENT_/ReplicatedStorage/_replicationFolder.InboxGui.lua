-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("InboxService")
local v3 = Sonar("GameAffinityService")
local v4 = Sonar("GameUpdateService")
local v5 = Sonar("WebsiteGameEventsService")
local v6 = Sonar("Mutex")
local v7 = Sonar("Maid")
local v8 = Sonar("FormatTime")
local v9 = Sonar("StipendService")
local v10 = Sonar("PlayerWrapper").GetClient()
function t.new(p1) --[[ new | Line: 22 | Upvalues: t (copy), v1 (copy), v10 (copy), v9 (copy), v8 (copy), v3 (copy), v6 (copy), v5 (copy), v7 (copy), v4 (copy), v2 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.GuiProvider = p1
	v22.InboxScreen = p1.GuiScreens.Inbox
	local function buildInbox(p1, p2) --[[ buildInbox | Line: 29 | Upvalues: v22 (copy), v1 (ref), v10 (ref), v9 (ref), v8 (ref), v3 (ref), v6 (ref), v5 (ref), v7 (ref), v4 (ref), v2 (ref) ]]
		if not v22._buildInbox then
			v22._buildInbox = true
			v22.InboxTabNavigator = v1.AddComponent("TabNavigator", {
				Instance = v22.InboxScreen.Instance,
				Tabs = {
					Stipends = {
						OnCreated = function(p1) --[[ OnCreated | Line: 38 | Upvalues: v1 (ref), v10 (ref) ]]
							v1.AddComponent("NotificationBadge", {
								Instance = p1.Button,
								Amount = function() --[[ Amount | Line: 41 | Upvalues: v10 (ref) ]]
									return v10:GetTotalClaimableStipends()
								end,
								OnChanged = function(p12, p2) --[[ OnChanged | Line: 44 | Upvalues: p1 (copy), v10 (ref) ]]
									p1.Button.Visible = v10:HasAnyStipendPermission(v10)
								end,
								Changed = { v10:GetClaimableStipendsChangedSignal() }
							})
						end,
						OnOpen = function(p1) --[[ OnOpen | Line: 52 | Upvalues: v1 (ref), v9 (ref) ]]
							if p1.Initialized then
								return
							end
							p1.Initialized = true
							local v12 = v1.FindElement(p1.Instance, "ContentFrame")
							for v2, v3 in v9.GetAllStipends() do
								v1.AddComponent("GuiObject", {
									DisplayType = "StipendDisplay",
									Parent = v12,
									Name = v3.Name,
									Stipend = v3,
									Visibility = function(p1) --[[ Visibility | Line: 65 ]]
										return p1:HasPermission()
									end,
									VisibilityChanged = function(p1) --[[ VisibilityChanged | Line: 68 ]]
										return p1.ClaimableChangedSignal
									end,
									LayoutOrder = v3.LayoutOrder or 1
								})
							end
						end
					},
					Rewards = {
						OnOpen = function(p1) --[[ OnOpen | Line: 78 | Upvalues: v1 (ref), v10 (ref), v8 (ref), v3 (ref) ]]
							if p1.Initialized then
								return
							end
							p1.Initialized = true
							for v12, v2 in v1.FindElement(p1.Instance, "ContentFrame"):GetChildren() do
								if v2:IsA("GuiObject") then
									local v32 = v2.Name
									local v4 = v1.FindElement(v2, "VerifiedLabel")
									local v5 = v1.FindElement(v2, "VerifyButton")
									local function setVerified() --[[ setVerified | Line: 91 | Upvalues: v10 (ref), v32 (copy), v4 (copy), v5 (copy) ]]
										if v10:IsAffinityStatusEnabled(v32) then
											v4.Visible = true
											v5.Visible = false
										else
											v4.Visible = false
											v5.Visible = true
										end
									end
									local function createAffinityReward() --[[ createAffinityReward | Line: 101 | Upvalues: v10 (ref), v32 (copy), setVerified (copy), v4 (copy), v5 (copy), v1 (ref), v8 (ref), v3 (ref), v2 (copy) ]]
										v10:GetAffinityStatusChangedSignal(v32):Connect(setVerified)
										if v10:IsAffinityStatusEnabled(v32) then
											v4.Visible = true
											v5.Visible = false
										else
											v4.Visible = false
											v5.Visible = true
										end
										v1.AddComponent("TimerDisplay", {
											Instance = v5,
											Format = function(p1) --[[ Format | Line: 107 | Upvalues: v8 (ref) ]]
												if p1 <= 0 then
													return "Verify"
												else
													return string.format("Verify in %s", v8.FormatString(p1))
												end
											end,
											EndTime = function() --[[ EndTime | Line: 113 | Upvalues: v10 (ref), v32 (ref) ]]
												return v10:GetNextAffinityStatusVerifyTime(v32) or 0
											end,
											OnTimeChanged = function(p1, p2) --[[ OnTimeChanged | Line: 116 ]]
												if p2.TimeLeft <= 0 then
													p1.TimerLabel.TextColor3 = Color3.fromRGB(72, 108, 55)
													p1.TimerLabel.TextTransparency = 0
													p1.Instance.BG.ImageColor3 = Color3.fromRGB(159, 191, 94)
													p1.Instance.BG.Image = "rbxassetid://87714936832036"
												else
													p1.TimerLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
													p1.TimerLabel.TextTransparency = 0.44
													p1.Instance.BG.ImageColor3 = Color3.fromRGB(171, 171, 171)
													p1.Instance.BG.Image = "rbxassetid://114195461342870"
												end
											end
										})
										v1.AddComponent("Button", {
											Instance = v5,
											OnClick = function() --[[ OnClick | Line: 132 | Upvalues: v10 (ref), v32 (ref), v3 (ref) ]]
												if not v10:IsAffinityStatusEnabled(v32) then
													v3.PromptStatus(v32)
												end
											end
										})
										v2.Visible = true
									end
									v2.Visible = false
									v10:OnAffinityStatusInitialised(v32, createAffinityReward)
								end
							end
						end
					},
					UpdateLog = {
						OnCreated = function(p1) --[[ OnCreated | Line: 153 | Upvalues: v1 (ref), v10 (ref) ]]
							v1.AddComponent("NotificationBadge", {
								Instance = p1.Button,
								Amount = function() --[[ Amount | Line: 156 | Upvalues: v10 (ref) ]]
									return v10:GetTotalClaimableUpdates()
								end,
								Changed = { v10:GetClaimableUpdatesChangedSignal() }
							})
						end,
						OnOpen = function(p1, p2) --[[ OnOpen | Line: 164 | Upvalues: v22 (ref), v1 (ref), v6 (ref), v3 (ref), v10 (ref), v5 (ref), v7 (ref), v4 (ref) ]]
							if not p1.Initialized then
								p1.Initialized = true
								v22.NotifyButton = v1.FindElement(p1.Instance, "NotifyButton")
								v1.AddComponent("Button", {
									Instance = v22.NotifyButton,
									OnClick = v6.new(function() --[[ Line: 172 | Upvalues: v3 (ref), v22 (ref) ]]
										if not v3.CanPromptExperienceNotifications() then
											return
										end
										if v3.PromptExperienceNotifications() then
											v22.NotifyButton.Visible = true
										else
											v22.NotifyButton.Visible = false
										end
									end)
								})
								v22.NotifyStatusLabel = v1.FindElement(p1.Instance, "StatusLabel")
								if v22.NotifyStatusLabel then
									local function setNotifyStatus() --[[ setNotifyStatus | Line: 187 | Upvalues: v10 (ref), v22 (ref) ]]
										if v10:IsAffinityStatusEnabled("ExperienceNotifications") then
											v22.NotifyStatusLabel.Image = "rbxassetid://130308696604150"
											v22.NotifyStatusLabel.ImageColor3 = Color3.fromRGB(159, 191, 94)
										else
											v22.NotifyStatusLabel.Image = "rbxassetid://88868855168897"
											v22.NotifyStatusLabel.ImageColor3 = Color3.fromRGB(222, 102, 102)
										end
									end
									v10:GetAffinityStatusChangedSignal("ExperienceNotifications"):Connect(setNotifyStatus)
									setNotifyStatus()
								end
								v22.WebsiteEvents = {}
								v22.WebsiteEventsFrame = v1.FindElement(p1.Instance, "WebsiteEventsFrame")
								local function createEvent(p1) --[[ createEvent | Line: 203 | Upvalues: v1 (ref), v22 (ref) ]]
									v22.WebsiteEvents[p1.Id] = v1.AddComponent("GuiObject", {
										DisplayType = "WebsiteEventDisplay",
										Parent = v1.FindElement(v22.WebsiteEventsFrame, "ScrollingFrame"),
										Name = p1.Id,
										Event = p1
									})
								end
								v5.EventRemoved:Connect(function(p1) --[[ Line: 213 | Upvalues: v22 (ref) ]]
									if not v22.WebsiteEvents[p1] then
										return
									end
									v22.WebsiteEvents[p1]:Destroy()
									v22.WebsiteEvents[p1] = nil
								end)
								v5.EventRemoved:Connect(createEvent)
								for v12, v2 in v5.GetAllEvents() do
									task.spawn(createEvent, v2)
								end
								v22.UpdateLogs = {}
								v22.SelectedUpdateLogMaid = v7.new()
								v22.UpdateLogFrame = v1.FindElement(p1.Instance, "UpdateLogFrame")
								v22.SelectedUpdateLogFrame = v1.FindElement(p1.Instance, "SelectedFrame")
								v22.AllUpdateLogsFrame = v1.FindElement(p1.Instance, "AllFrame")
								for v32, v42 in v4.GetUpdateLogs() do
									v22.UpdateLogs[v42.Index] = v1.AddComponent("GuiObject", {
										DisplayType = "UpdateLogDisplay",
										Parent = v22.AllUpdateLogsFrame,
										Name = v42.Index,
										UpdateLog = v42,
										OnClick = function(p1) --[[ OnClick | Line: 238 | Upvalues: v22 (ref), v42 (copy) ]]
											v22:_setSelectedUpdateLog(v42)
										end
									})
								end
								v22.ClaimUpdateButton = v1.FindElement(v22.SelectedUpdateLogFrame, "ClaimButton")
								if v22.ClaimUpdateButton then
									v1.AddComponent("Button", {
										Instance = v22.ClaimUpdateButton,
										OnClick = function() --[[ OnClick | Line: 249 | Upvalues: v22 (ref), v4 (ref), v10 (ref), v1 (ref) ]]
											if not v22.SelectedUpdateLog then
												return
											end
											local v12 = v4.CanClaimUpdate(v10, v22.SelectedUpdateLog.Index)
											if v12 then
												v4.RequestToClaimUpdate(v22.SelectedUpdateLog.Index)
											else
												v1.Notify({
													Preset = "Response",
													Message = v12
												})
											end
										end
									})
								end
							end
							p1.ContentMaid._setNotifyButtonThread = task.spawn(function() --[[ Line: 271 | Upvalues: v22 (ref), v10 (ref), v3 (ref) ]]
								v22.NotifyButton.Visible = if v10:IsAffinityStatusEnabled("ExperienceNotifications") then true else v3.CanPromptExperienceNotifications()
							end)
							local v62 = v22
							local v72 = p2.UpdateLog or v4.GetLatestUpdate()
							v62:_setSelectedUpdateLog(v72)
						end
					},
					Mail = {
						OpenAsDefault = true,
						OnCreated = function(p1) --[[ OnCreated | Line: 281 | Upvalues: v1 (ref), v10 (ref) ]]
							v1.AddComponent("NotificationBadge", {
								Instance = p1.Button,
								Amount = function() --[[ Amount | Line: 284 | Upvalues: v10 (ref) ]]
									return v10:GetTotalInteractableMessages()
								end,
								Changed = { v10:GetInteractableMessagesChangedSignal() }
							})
						end,
						OnOpen = function(p1) --[[ OnOpen | Line: 292 | Upvalues: v22 (ref), v1 (ref), v10 (ref), v2 (ref) ]]
							if p1.Initialized then
								return
							end
							p1.Initialized = true
							v22.SelectedMessageFrame = v1.FindElement(p1.Instance, "SelectedFrame")
							v22.AllMessagesFrame = v1.FindElement(p1.Instance, "AllFrame")
							v22.MessagesTabNavigator = v1.AddComponent("TabNavigator", {
								Instance = p1.Instance,
								ReturnToTab = v22.AllMessagesFrame
							})
							v22.MessagesTabNavigator:AddTab("AllMessages", {
								Instance = v22.AllMessagesFrame,
								OnOpen = function(p1) --[[ OnOpen | Line: 308 | Upvalues: v22 (ref), v1 (ref), v10 (ref) ]]
									if p1.Initialized then
										return
									end
									p1.Initialized = true
									v22.MessagesLayoutSort = v1.AddComponent("LayoutSort", {
										Instance = p1.Instance
									})
									local v12 = v1.FindElement(p1.Instance, "ContentFrame")
									v22.Messages = {}
									local function createMessage(p1) --[[ createMessage | Line: 319 | Upvalues: v1 (ref), v12 (copy), v22 (ref) ]]
										local v13 = v1.AddComponent("GuiObject", {
											DisplayType = "InboxDisplay",
											Parent = v12,
											Message = p1,
											Name = p1.Type .. "_" .. p1.Identifier,
											Button = {
												NoHoverAnimation = true,
												OnClick = function() --[[ OnClick | Line: 330 | Upvalues: v22 (ref), p1 (copy) ]]
													v22.MessagesTabNavigator:OpenTab("SelectedMessage", {
														Args = {
															Message = p1
														}
													})
												end
											}
										})
										v22.MessagesLayoutSort:Add(v13)
										v13:GiveTask(function() --[[ Line: 339 | Upvalues: v22 (ref), v13 (copy) ]]
											v22.MessagesLayoutSort:Remove(v13)
										end)
										v13:SetLayoutOrder(-p1.TimeSent)
										v22.Messages[p1] = v13
									end
									v10:GetInboxMessageRemovedSignal():Connect(function(p1) --[[ Line: 347 | Upvalues: v22 (ref) ]]
										if not v22.Messages[p1] then
											return
										end
										v22.Messages[p1]:Destroy()
										v22.Messages[p1] = nil
									end)
									v10:GetInboxMessageAddedSignal():Connect(createMessage)
									for v2, v3 in v10:GetInboxMessages() do
										createMessage(v3)
									end
								end
							})
							local v12 = v1.FindElement(p1.Instance, "ClaimButton")
							if v12 then
								v1.AddComponent("Button", {
									Instance = v12,
									OnClick = function() --[[ OnClick | Line: 367 | Upvalues: v22 (ref), v2 (ref), v10 (ref), v1 (ref) ]]
										if not v22.SelectedMessage then
											return
										end
										local v12 = v2.CanClaimMessage(v10, v22.SelectedMessage)
										if v12 == true then
											v2.RequestToClaimMessage(v22.SelectedMessage.Id)
										else
											v1.Notify({
												Response = v12
											})
										end
									end
								})
							end
							v22.MessagesTabNavigator:AddTab("SelectedMessage", {
								Instance = v22.SelectedMessageFrame,
								OnOpen = function(p1, p2) --[[ OnOpen | Line: 388 | Upvalues: v22 (ref), v10 (ref), v2 (ref), v1 (ref), v12 (copy) ]]
									v22.SelectedMessage = p2.Message
									if not v10:IsMessageInspected(p2.Message) then
										v2.RequestToActionMessage("Inspect", p2.Message.Id)
									end
									p1.ContentMaid:GiveTask(v1.AddComponent("InboxDisplay", {
										Instance = v1.FindElement(p1.Instance, "ContentFrame"),
										Message = p2.Message,
										OnClaimableChanged = function(p1) --[[ OnClaimableChanged | Line: 401 | Upvalues: v12 (ref) ]]
											v12.Visible = p1:IsClaimable()
										end
									}))
									p1.ContentMaid:GiveTask(v10:GetInboxMessageRemovedSignal():Connect(function(p1) --[[ Line: 406 | Upvalues: v22 (ref) ]]
										if p1 ~= v22.SelectedMessage then
											return
										end
										v22.SelectedMessage = nil
										v22.MessagesTabNavigator:Return()
									end))
								end,
								OnClose = function(p1) --[[ OnClose | Line: 415 | Upvalues: v22 (ref) ]]
									v22.MessagesTabNavigator:ResetTab("SelectedMessage")
								end
							})
							local v23 = v1.FindElement(p1.Instance, "ClaimAllButton")
							if v23 then
								v1.AddComponent("Button", {
									Instance = v23,
									OnClick = function() --[[ OnClick | Line: 426 | Upvalues: v2 (ref), v10 (ref), v1 (ref) ]]
										local v12 = v2.GetAllMessagesToClaim(v10)
										if next(v12) then
											v2.RequestToClaimAllMessages(v12)
										else
											v1.Notify({
												Preset = "Response",
												Message = "You have no messages you are able to claim!",
												Type = "ClaimAllMessages-NoneToClaim"
											})
										end
									end
								})
							end
							local v3 = v1.FindElement(p1.Instance, "DeleteButton")
							if v3 then
								v1.AddComponent("Button", {
									Instance = v3,
									OnClick = function() --[[ OnClick | Line: 447 | Upvalues: v10 (ref), v22 (ref), v1 (ref), v2 (ref) ]]
										if v10:IsMessageClaimed(v22.SelectedMessage) then
											v2.RequestToActionMessage("Delete", v22.SelectedMessage.Id)
										else
											v1.Prompt({
												Type = "SimpleConfirmation",
												Text = "You have not claimed your rewards yet! Are sure you want to delete it?",
												Run = function() --[[ Run | Line: 452 | Upvalues: v2 (ref), v22 (ref) ]]
													v2.RequestToActionMessage("Delete", v22.SelectedMessage.Id)
													return true
												end,
												Cancel = function() --[[ Cancel | Line: 456 ]]
													return true
												end
											})
										end
									end
								})
							end
							local v4 = v1.FindElement(p1.Instance, "DeleteReadButton")
							if v4 then
								v1.AddComponent("Button", {
									Instance = v4,
									OnClick = function() --[[ OnClick | Line: 474 | Upvalues: v2 (ref) ]]
										v2.RequestToActionMessage("DeleteAllRead")
									end
								})
							end
							local v5 = v1.FindElement(p1.Instance, "ReturnButton")
							if v5 then
								v1.AddComponent("Button", {
									Instance = v5,
									OnClick = function() --[[ OnClick | Line: 485 | Upvalues: v22 (ref) ]]
										v22.MessagesTabNavigator:Return()
									end
								})
							end
							v22.MessagesTabNavigator:Return()
						end
					}
				}
			})
			if not p2.TabToOpen then
				v22.InboxTabNavigator:OpenDefaultTab()
			end
		end
		if not p2.TabToOpen then
			return
		end
		v22.InboxTabNavigator:OpenTab(p2.TabToOpen, {})
	end
	v22.InboxScreen:AddCallback("OnOpen", buildInbox)
	v1.AddComponent("CloseButton", {
		Instance = v1.FindElement(v22.InboxScreen.Instance, "CloseButton")
	})
	v10:GetInboxMessageAddedSignal():Connect(function(p1) --[[ Line: 513 | Upvalues: v1 (ref) ]]
		v1.Notify({
			Type = "NewMessage",
			Text = "You received a new message in your inbox!",
			Prefix = {
				Text = "[\240\159\147\169]",
				TextColor = Color3.fromRGB(159, 191, 94),
				TextStrokeColor = Color3.fromRGB(72, 108, 55)
			}
		})
	end)
	v1.BindToTag("HUD_InboxButton", function(p1) --[[ Line: 525 | Upvalues: v1 (ref), v10 (ref) ]]
		v1.AddComponent("Button", {
			Instance = p1,
			OnClick = function() --[[ OnClick | Line: 528 | Upvalues: v1 (ref) ]]
				v1.OpenScreenGroup("Inbox", {
					Args = {}
				})
			end
		})
		v1.AddComponent("NotificationBadge", {
			Instance = p1,
			Amount = function() --[[ Amount | Line: 537 | Upvalues: v10 (ref) ]]
				return v10:GetTotalInteractableMessages() + v10:GetTotalClaimableUpdates() + v10:GetTotalClaimableStipends()
			end,
			Changed = { v10:GetInteractableMessagesChangedSignal(), v10:GetClaimableUpdatesChangedSignal(), v10:GetClaimableStipendsChangedSignal() }
		})
	end)
	return v22
end
function t._setSelectedUpdateLog(p1, p2) --[[ _setSelectedUpdateLog | Line: 553 | Upvalues: v4 (copy), v1 (copy) ]]
	local v12 = type(p2) == "number" and v4.GetUpdateFromIndex(p2) or p2
	if v12 == p1.SelectedUpdateLog then
		return
	end
	if not v12 then
		return
	end
	local v2 = p1.SelectedUpdateLog and p1.UpdateLogs[p1.SelectedUpdateLog.Index]
	local v3
	if not v2 then
		p1.SelectedUpdateLogMaid:DoCleaning()
		p1.SelectedUpdateLog = v12
		p1.UpdateLogs[v12.Index]:Select()
		v3 = v1.AddComponent("UpdateLogDisplay", {
			Instance = p1.SelectedUpdateLogFrame,
			UpdateLog = v12,
			OnClaimableChanged = function(p12_2) --[[ OnClaimableChanged | Line: 580 | Upvalues: p1 (copy) ]]
				p1.ClaimUpdateButton.Visible = p12_2:IsClaimable()
			end
		})
		p1.SelectedUpdateLogMaid:GiveTask(v3)
		return
	end
	v2:Deselect()
	p1.SelectedUpdateLogMaid:DoCleaning()
	p1.SelectedUpdateLog = v12
	p1.UpdateLogs[v12.Index]:Select()
	v3 = v1.AddComponent("UpdateLogDisplay", {
		Instance = p1.SelectedUpdateLogFrame,
		UpdateLog = v12,
		OnClaimableChanged = function(p12_2) --[[ OnClaimableChanged | Line: 580 | Upvalues: p1 (copy) ]]
			p1.ClaimUpdateButton.Visible = p12_2:IsClaimable()
		end
	})
	p1.SelectedUpdateLogMaid:GiveTask(v3)
end
function t.OpenNewUpdateLog(p1) --[[ OpenNewUpdateLog | Line: 587 | Upvalues: v1 (copy) ]]
	v1.OpenScreenGroup("Inbox", {
		Args = {
			TabToOpen = "UpdateLog"
		}
	})
	repeat
		task.wait()
	until not v1.IsScreenGroupOpen("Inbox")
	return true
end
function t.Init(p1) --[[ Init | Line: 602 ]] end
t:Init()
return t