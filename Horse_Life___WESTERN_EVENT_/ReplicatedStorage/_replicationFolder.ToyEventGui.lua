-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiManager")
local v2 = Sonar("ButtonTest")
local v3 = Sonar("TabManager")
local v4 = Sonar("StorageUtils")
local v5 = Sonar("GuiUtils")
local v6 = Sonar("StatBar")
local v7 = Sonar("PlayerWrapper")
local v8 = Sonar("ItemRewardDisplay")
local v9 = Sonar("MissionsService")
local v10 = Sonar("RemoteUtils")
local v11 = Sonar("IssueResponseClient")
local v12 = Sonar("ItemDataService")
local v13 = Sonar("State")
local v14 = Sonar("FormatNumber")
local v15 = Sonar("Maid")
local v16 = Sonar("ShopService")
local v17 = Sonar("DisplayAnimalClient")
local v18 = Sonar("MarketplaceUtils")
local v19 = Sonar("ColorCorrectionUtils")
local v20 = Sonar("DynamicNPCService")
local LocalPlayer = Players.LocalPlayer
local v21 = v7.GetClient()
local ContainerFrame = LocalPlayer.PlayerGui:WaitForChild("LEGOEventGui").ContainerFrame
local v22 = Sonar(v4.Get("DynamicNPCs"))
local v23 = Sonar(ReplicatedStorage.Storage.Events.ToyEvent.ActiveActivities)
local v24 = Sonar(ReplicatedStorage.Storage.Events.ToyEvent.EventShopItems)
local v25 = false
local v26 = false
local v27 = false
local v28 = false
local v29 = v13.new("List")
local v30 = v15.new()
local v31 = nil
local t2 = {}
local function getSelectedNpcMissionSetIndex(p1, p2, p3) --[[ getSelectedNpcMissionSetIndex | Line: 43 | Upvalues: v20 (copy) ]]
	local t = {}
	for v1, v2 in p2:GetChildren() do
		local v4 = tonumber(v2.Name)
		if v4 and p3[v4] then
			table.insert(t, v4)
		end
	end
	if #t <= 1 then
		return nil
	else
		return t[Random.new(v20.RefreshTimer.CurrentSeed + string.len(p1)):NextInteger(1, #t)]
	end
end
local t3 = {
	Event = function() --[[ Event | Line: 60 | Upvalues: v25 (ref) ]]
		if not v25 then
			v25 = true
		end
	end,
	EventActivities = function(p1, p2) --[[ EventActivities | Line: 67 | Upvalues: v26 (ref), v23 (copy) ]]
		if v26 then
			return
		end
		v26 = true
		p1.List.ScrollingFrame.Default.Visible = false
		for v1, v2 in v23 do
			local v3 = p1.List.ScrollingFrame.Default:Clone()
			v3.Title.Text = v2.Name
			v3.Description.Text = v2.Description
			v3.Duration.Text = v2.Duration .. " Seconds"
			v3.ImageLabel.Image = v2.Image
			v3.Visible = true
			v3.Parent = p1.List.ScrollingFrame
		end
	end,
	Missions = function(p1, p2) --[[ Missions | Line: 88 | Upvalues: v27 (ref), v5 (copy), v30 (copy), v21 (copy), Sonar (copy), v4 (copy), v9 (copy), v6 (copy), v15 (copy), v8 (copy), v2 (copy), v11 (copy), v10 (copy), v17 (copy), v31 (ref), v19 (copy), v22 (copy), t2 (copy), getSelectedNpcMissionSetIndex (copy), v29 (copy) ]]
		if v27 then
			return
		end
		v27 = true
		p1.List.TabButtons.NPCButton.Visible = false
		p1.List.MissionsFrame.ScrollingFrame.Default.Visible = false
		local v1 = nil
		local v23 = nil
		local function setSelectedNPC(p1, p2) --[[ setSelectedNPC | Line: 100 | Upvalues: v1 (ref), v5 (ref), v23 (ref) ]]
			if v1 then
				v5.SetButtonColor(v1, "Diagonal", "Green")
			end
			if v23 == p2 then
				v5.SetButtonColor(p1, "Diagonal", "Green")
				v23 = nil
			else
				v5.SetButtonColor(p1, "Diagonal", "Yellow")
				v23 = p2
			end
			v1 = p1
		end
		local function setSelectedMissionSet(p12, p2) --[[ setSelectedMissionSet | Line: 116 | Upvalues: v30 (ref), v21 (ref), Sonar (ref), v4 (ref), p1 (copy), v9 (ref), v6 (ref), v15 (ref), v8 (ref), v2 (ref), v11 (ref), v10 (ref), v17 (ref), v31 (ref), v19 (ref) ]]
			v30:DoCleaning()
			local v1 = v21.PlayerData.Missions.NPCMissions:FindFirstChild(p12)
			local v22 = Sonar(v4.Get("NpcMissions"))[p12]
			local v3 = v1:FindFirstChild((tostring(p2)))
			local v42 = v22[p2]
			if not (v3 and v42) then
				return
			end
			p1.SelectedFrame.TaskList.ScrollingFrame.Default.Visible = false
			if v3:FindFirstChild("Missions") then
				for v5, v62 in v3.Missions:GetChildren() do
					local v92 = v42.Missions[tonumber(v62.Name)]
					if v92 then
						local v102 = p1.SelectedFrame.TaskList.ScrollingFrame.Default:Clone()
						v102.Content.QuestDescription.Text = string.format(v92.Description or v9.Descriptions[v62.Type.Value], v92.Amount)
						v102.Visible = true
						v102.Parent = p1.SelectedFrame.TaskList.ScrollingFrame
						v30:GiveTask(v6.new({
							TweenAmount = false,
							Clipped = false,
							Frame = v102.Content.ProgressBar.Bar,
							AmountLabel = v102.Content.ProgressLabel,
							GetText = function(p1, p2) --[[ GetText | Line: 152 | Upvalues: v62 (copy) ]]
								if v62.Value then
									return "COMPLETE"
								else
									return p1 .. "/" .. p2
								end
							end,
							Get = function() --[[ Get | Line: 159 | Upvalues: v62 (copy), v92 (copy) ]]
								return math.min(v62.Amount.Value, v92.Amount)
							end,
							GetMax = function() --[[ GetMax | Line: 162 | Upvalues: v92 (copy) ]]
								return v92.Amount
							end,
							Changed = { v62.Amount:GetPropertyChangedSignal("Value"), v62:GetPropertyChangedSignal("Value") }
						}))
						v30:GiveTask(v102)
					end
				end
			end
			local CompletedCount = v3:FindFirstChild("CompletedCount")
			local v12 = v15.new()
			v30:GiveTask(v12)
			local function rebuildRewardDisplay() --[[ rebuildRewardDisplay | Line: 180 | Upvalues: v12 (copy), CompletedCount (copy), v8 (ref), p1 (ref), v42 (copy) ]]
				v12:DoCleaning()
				v12:GiveTask(v8.new({
					CycleTime = 5,
					Dots = true,
					ParentFrame = p1.SelectedFrame.RewardFrame.Items,
					CloneFrame = p1.SelectedFrame.RewardFrame.Items.Default,
					Rewards = v42.Rewards,
					CompletedCount = if CompletedCount then CompletedCount.Value or 0 else 0
				}))
			end
			rebuildRewardDisplay()
			if CompletedCount then
				v30:GiveTask(CompletedCount:GetPropertyChangedSignal("Value"):Connect(rebuildRewardDisplay))
			end
			local t = {}
			if v3:FindFirstChild("Missions") then
				for v13, v14 in v3.Missions:GetChildren() do
					table.insert(t, v14:GetPropertyChangedSignal("Value"))
				end
			end
			local v152 = p1.SelectedFrame.RewardFrame.ProgressBar:FindFirstChild("ProgressLabel") or p1.SelectedFrame.RewardFrame:FindFirstChild("ProgressLabel", true)
			v30:GiveTask(v6.new({
				TweenAmount = false,
				Clipped = false,
				Frame = p1.SelectedFrame.RewardFrame.ProgressBar.Bar,
				AmountLabel = v152,
				GetText = function(p1, p2) --[[ GetText | Line: 219 | Upvalues: v3 (copy) ]]
					if v3.Completed.Value then
						return "COMPLETE"
					else
						return p1 .. "/" .. p2
					end
				end,
				Get = function() --[[ Get | Line: 226 | Upvalues: v3 (copy) ]]
					if not v3:FindFirstChild("Missions") then
						return 0
					end
					local count = 0
					for v1, v2 in v3.Missions:GetChildren() do
						if v2.Value then
							count = count + 1
						end
					end
					return count
				end,
				GetMax = function() --[[ GetMax | Line: 238 | Upvalues: v42 (copy) ]]
					local count = 0
					for v1 in v42.Missions do
						count = count + 1
					end
					return count
				end,
				Changed = t
			}))
			local function updateClaimButton() --[[ updateClaimButton | Line: 248 | Upvalues: v3 (copy), p1 (ref) ]]
				local Completed = v3.Completed.Value
				p1.SelectedFrame.RewardFrame.ClaimButton.Visible = if Completed then not v3.Claimed.Value else Completed
			end
			v30:GiveTask(v3.Completed:GetPropertyChangedSignal("Value"):Connect(updateClaimButton))
			v30:GiveTask(v3.Claimed:GetPropertyChangedSignal("Value"):Connect(updateClaimButton))
			local Completed = v3.Completed.Value
			local ClaimButton = p1.SelectedFrame.RewardFrame.ClaimButton
			ClaimButton.Visible = if Completed then not v3.Claimed.Value else Completed
			v30:GiveTask(v2.new(p1.SelectedFrame.RewardFrame.ClaimButton, {
				Click = function() --[[ Click | Line: 263 | Upvalues: v9 (ref), v21 (ref), p12 (copy), p2 (copy), v11 (ref), v10 (ref), v17 (ref) ]]
					local v2 = v9.CanClaimNpcMission(v21, p12, (tostring(p2)))
					if v2 ~= true then
						v11.NotifyIssue(v2)
						return
					end
					local v4 = v10.GetRemoteFunction("ClaimNpcMissionRemote"):InvokeServer(p12, (tostring(p2)))
					if not v4 or v4 == true then
						return
					end
					task.wait()
					for v5, v6 in v4 do
						v17:DisplaySlot({
							Type = "Claimed",
							AllowNaming = true,
							ShowMaxWarning = true,
							MobileClickBackgroundToClose = true,
							Slot = v21:GetItemFolder("Animals"):WaitForChild(v6)
						})
						if v17.YieldForNoDisplay() then
							task.wait(0.5)
						end
					end
				end
			}))
			local function updateStartButtons() --[[ updateStartButtons | Line: 292 | Upvalues: v3 (copy), v31 (ref), p1 (ref), p12 (copy) ]]
				local Started = v3.Started.Value
				local v1 = not v31 and not Started
				p1.SelectedFrame.RewardFrame.CannotStart.Visible = v1
				if v1 then
					(p1.SelectedFrame.RewardFrame.CannotStart:FindFirstChildWhichIsA("TextLabel") or p1.SelectedFrame.RewardFrame.CannotStart).Text = "Talk to " .. p12 .. " to start the mission"
				end
				p1.SelectedFrame.RewardFrame.StartButton.Visible = v31 and not Started
			end
			v30:GiveTask(v3.Started:GetPropertyChangedSignal("Value"):Connect(updateStartButtons))
			updateStartButtons()
			v30:GiveTask(v2.new(p1.SelectedFrame.RewardFrame.StartButton, {
				Click = function() --[[ Click | Line: 309 | Upvalues: v10 (ref), p12 (copy), p2 (copy), v19 (ref), updateStartButtons (copy) ]]
					if not v10.GetRemoteFunction("StartNpcMissionRemote"):InvokeServer(p12, (tostring(p2))) then
						return
					end
					v19:Tween()
					updateStartButtons()
				end
			}))
		end
		for v3, v42 in v22.NPCs do
			if v42.IsToyEvent and not v42.NoMissions then
				local v52 = v21.PlayerData.Missions.NPCMissions:FindFirstChild(v42.Name)
				if v52 then
					local v62 = Sonar(v4.Get("NpcMissions"))[v42.Name]
					local v7 = p1.List.TabButtons.NPCButton:Clone()
					v7.Name = v42.Name
					v7.Top.TextLabel.Text = v42.Name
					v7.Visible = true
					v7.Parent = p1.List.TabButtons
					t2[v42.Name] = v7
					local v82 = getSelectedNpcMissionSetIndex(v42.Name, v52, v62)
					for v92, v102 in v52:GetChildren() do
						local v12 = tonumber(v102.Name)
						if v12 and (v62[v12] and (not v82 or v12 == v82)) then
							local v13 = v62[v12]
							local v14 = p1.List.MissionsFrame.ScrollingFrame.Default:Clone()
							v14.Title.Text = v13.Name
							v14.Name = v42.Name .. v12
							v14.Visible = true
							v14.Parent = p1.List.MissionsFrame.ScrollingFrame
							local t = {}
							if v102:FindFirstChild("Missions") then
								for v152, v16 in v102.Missions:GetChildren() do
									table.insert(t, v16:GetPropertyChangedSignal("Value"))
								end
							end
							v6.new({
								TweenAmount = false,
								Clipped = false,
								Frame = v14.ProgressBar.Bar,
								AmountLabel = v14.ProgressBar.ProgressLabel,
								GetText = function(p1, p2) --[[ GetText | Line: 380 | Upvalues: v102 (copy) ]]
									if v102.Completed.Value then
										return "COMPLETE"
									else
										return p1 .. "/" .. p2
									end
								end,
								Get = function() --[[ Get | Line: 387 | Upvalues: v102 (copy) ]]
									if not v102:FindFirstChild("Missions") then
										return 0
									end
									local count = 0
									for v1, v2 in v102.Missions:GetChildren() do
										if v2.Value then
											count = count + 1
										end
									end
									return count
								end,
								GetMax = function() --[[ GetMax | Line: 399 | Upvalues: v13 (copy) ]]
									local count = 0
									for v1 in v13.Missions do
										count = count + 1
									end
									return count
								end,
								Changed = t
							})
							local CompletedCount = v102:FindFirstChild("CompletedCount")
							local v172 = v15.new()
							local function rebuildMissionListRewardDisplay() --[[ rebuildMissionListRewardDisplay | Line: 413 | Upvalues: v172 (copy), CompletedCount (copy), v8 (ref), v14 (copy), v62 (copy), v12 (copy) ]]
								v172:DoCleaning()
								v172:GiveTask(v8.new({
									CycleTime = 5,
									Dots = true,
									ParentFrame = v14.RewardFrame,
									CloneFrame = v14.RewardFrame.Default,
									Rewards = v62[v12].Rewards,
									CompletedCount = if CompletedCount then CompletedCount.Value or 0 else 0
								}))
							end
							rebuildMissionListRewardDisplay()
							if CompletedCount then
								CompletedCount:GetPropertyChangedSignal("Value"):Connect(rebuildMissionListRewardDisplay)
							end
							v2.new(v14.ViewButton, {
								Click = function() --[[ Click | Line: 433 | Upvalues: v29 (ref), v42 (copy), v12 (copy) ]]
									v29:set(v42.Name .. "_" .. v12)
								end
							})
						end
					end
					v2.new(v7, {
						Click = function() --[[ Click | Line: 440 | Upvalues: v31 (ref), v23 (ref), v42 (copy), setSelectedNPC (copy), v7 (copy), p1 (copy) ]]
							if v31 then
								return
							end
							setSelectedNPC(v7, v42.Name)
							if v23 == v42.Name then
								for v1, v2 in p1.List.MissionsFrame.ScrollingFrame:GetChildren() do
									if v2:IsA("Frame") and v2.Name ~= "Default" then
										v2.Visible = true
									end
								end
							else
								for v3, v4 in p1.List.MissionsFrame.ScrollingFrame:GetChildren() do
									if v4:IsA("Frame") and v4.Name ~= "Default" then
										if v4.Name:match("^" .. v42.Name) then
											v4.Visible = true
											continue
										end
										v4.Visible = false
									end
								end
							end
						end
					})
				end
			end
		end
		for v18, v192 in p1.List.MissionsFrame.ScrollingFrame:GetChildren() do
			if v192:IsA("Frame") and v192.Name ~= "Default" then
				v192.Visible = true
			end
		end
		v2.new(p1.SelectedFrame.Header.BackButton, {
			Click = function() --[[ Click | Line: 476 | Upvalues: v29 (ref) ]]
				v29:set("List")
			end
		})
		v29:subscribe(function(p12) --[[ Line: 481 | Upvalues: p1 (copy), setSelectedMissionSet (copy) ]]
			if p12 == "List" then
				p1.List.Visible = true
				p1.SelectedFrame.Visible = false
				return
			end
			p1.List.Visible = false
			p1.SelectedFrame.Visible = true
			local v1, v2 = p12:match("^(.+)_(%d+)$")
			if not (v1 and v2) then
				return
			end
			setSelectedMissionSet(v1, (tonumber(v2)))
		end)
	end,
	RewardBooth = function(p1, p2) --[[ RewardBooth | Line: 496 | Upvalues: v28 (ref), v24 (copy), v12 (copy), v14 (copy), v2 (copy), v16 (copy), v21 (copy), Sonar (copy), v11 (copy), v18 (copy), LocalPlayer (copy) ]]
		if v28 then
			return
		end
		v28 = true
		p1.List.Items.ScrollingFrame.Default.Visible = false
		for v1, v22 in v24 do
			local v3 = p1.List.Items.ScrollingFrame.Default:Clone()
			v3.ItemImage.Image = v12.GetByName(v1).Image
			v3.Title.Text = v1
			v3.BuyButton.Top.PriceFrame.AmountLabel.Text = v14.suffix(v22)
			v2.new(v3.BuyButton, {
				Click = function() --[[ Click | Line: 513 | Upvalues: v16 (ref), v21 (ref), v1 (copy), Sonar (ref), v11 (ref), v18 (ref), LocalPlayer (ref) ]]
					local v12, v2 = v16.CanPurchaseEventItem(v21, v1)
					if v12 == true then
						if type(v2) == "table" and v2.ProductId then
							v18.PromptPurchase(LocalPlayer, v2.ProductId, "Product")
						else
							v16:PurchaseEventItem(v1)
						end
					else
						if v12 == "MaxInventory" then
							Sonar("InventoryGui").UpgradeSlots()
						end
						v11.NotifyIssue(v12)
					end
				end
			})
			v3.Visible = true
			v3.Parent = p1.List.Items.ScrollingFrame
		end
	end
}
local function lockToNpc(p1) --[[ lockToNpc | Line: 540 | Upvalues: v31 (ref), ContainerFrame (copy), t2 (copy), v5 (copy) ]]
	v31 = p1
	for v1, v2 in t2 do
		if v1 == p1 then
			v5.SetButtonColor(v2, "Diagonal", "Yellow")
			continue
		end
		v5.SetButtonColor(v2, "Diagonal", "Gray")
	end
	for v3, v4 in ContainerFrame.Menu.TabFrames.Missions.List.MissionsFrame.ScrollingFrame:GetChildren() do
		if v4:IsA("Frame") and v4.Name ~= "Default" then
			if v4.Name:match("^" .. p1) then
				v4.Visible = true
				continue
			end
			v4.Visible = false
		end
	end
end
local function unlockNpc() --[[ unlockNpc | Line: 564 | Upvalues: v31 (ref), ContainerFrame (copy), t2 (copy), v5 (copy) ]]
	v31 = nil
	for v1, v2 in t2 do
		v5.SetButtonColor(v2, "Diagonal", "Green")
	end
	for v3, v4 in ContainerFrame.Menu.TabFrames.Missions.List.MissionsFrame.ScrollingFrame:GetChildren() do
		if v4:IsA("Frame") and v4.Name ~= "Default" then
			v4.Visible = true
		end
	end
end
function t.Open(p1) --[[ Open | Line: 580 | Upvalues: v29 (copy), v1 (copy), ContainerFrame (copy), t3 (copy), v3 (copy), lockToNpc (copy) ]]
	local v12 = if p1 then p1 else {}
	v29:set("List")
	v1.OpenFrame(ContainerFrame, {
		CloseAll = "CloseOverlay"
	})
	if not v12.NpcName then
		return
	end
	t3.Missions(ContainerFrame.Menu.TabFrames.Missions, ContainerFrame.TabButtons.Missions)
	v3.OpenTab(ContainerFrame.Menu.TabFrames.Missions)
	lockToNpc(v12.NpcName)
end
function t.Close() --[[ Close | Line: 596 | Upvalues: v1 (copy), ContainerFrame (copy) ]]
	v1.CloseFrame(ContainerFrame)
end
function t.OnOpen(p1) --[[ OnOpen | Line: 600 ]] end
function t.OnClose(p1) --[[ OnClose | Line: 602 | Upvalues: unlockNpc (copy) ]]
	unlockNpc()
end
function t.Setup() --[[ Setup | Line: 606 | Upvalues: ContainerFrame (copy), v3 (copy), v2 (copy), v31 (ref), t3 (copy) ]]
	for v1, v22 in ContainerFrame.TabButtons:GetChildren() do
		if v22:IsA("ImageButton") then
			local v32 = ContainerFrame.Menu.TabFrames:FindFirstChild(v22.Name)
			if v32 then
				v3.AddTab(v32, {
					ParentFrame = ContainerFrame,
					Button = v22
				})
				v2.new(v22, {
					Click = function() --[[ Click | Line: 621 | Upvalues: v32 (copy), v31 (ref), v3 (ref), t3 (ref), v22 (copy) ]]
						if not v32 then
							return
						end
						if not v31 then
							v3.OpenTab(v32)
							t3[v22.Name](v32, v22)
						end
					end
				})
			end
		end
	end
end
function t.Init(p1) --[[ Init | Line: 637 | Upvalues: v1 (copy), ContainerFrame (copy), t (copy), v2 (copy), t3 (copy), v3 (copy) ]]
	v1.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0)
	})
	v1.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 646 | Upvalues: t (ref) ]]
		t:OnClose()
	end)
	v1.AddStateCallback(ContainerFrame, "OnOpen", function() --[[ Line: 649 | Upvalues: t (ref) ]]
		t:OnOpen()
	end)
	v2.new(ContainerFrame.Menu.CloseButton, {
		Click = t.Close
	})
	v2.new(ContainerFrame.Menu.HelpButton, {
		Click = function() --[[ Click | Line: 658 | Upvalues: t3 (ref), v3 (ref), ContainerFrame (ref) ]]
			t3.Event()
			v3.OpenTab(ContainerFrame.Menu.TabFrames.Event)
		end
	})
	t.Setup()
	t3.Missions(ContainerFrame.Menu.TabFrames.Missions, ContainerFrame.TabButtons.Missions)
end
t:Init()
return t