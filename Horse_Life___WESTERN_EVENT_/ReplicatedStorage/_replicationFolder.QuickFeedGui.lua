-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiManager")
local v2 = Sonar("Maid")
local v3 = Sonar("ButtonTest")
local v4 = Sonar("AnimalGridButton")
local v5 = Sonar("ItemInfoFrame")
local v6 = Sonar("ItemDataService")
local v7 = Sonar("Button")
local v8 = Sonar("GridSort")
local v9 = Sonar("TimeUtils")
local v10 = Sonar("AnimalDataService")
local v11 = Sonar("ToolTipClient")
local v12 = Sonar("ConsumablesService")
local v13 = Sonar("IssueResponseClient")
local v14 = Sonar("Signal")
local v15 = Sonar("StatBar")
local v16 = Sonar("MutationUtils")
local v17 = Sonar("DisplayUtils")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v18 = Sonar("PlayerWrapper").GetClient()
local ContainerFrame = LocalPlayer.PlayerGui:WaitForChild("QuickFeedGui").ContainerFrame
local v19 = v18:GetItemFolder("Animals")
local v20 = v2.new()
local t2 = {}
local v21 = v2.new()
local v22 = v2.new()
local v23 = v14.new()
local v24 = nil
local v25 = nil
local v26 = nil
local v27 = v8.new({
	Priority = {
		{
			Priority = -1,
			Run = function(p1) --[[ Run | Line: 51 ]]
				return p1:HasLayoutUnableReason()
			end,
			Changed = function(p1) --[[ Changed | Line: 54 ]]
				return p1.UnableChangedSignal
			end
		}
	},
	Sorts = {
		Alphabet = {
			DisplayName = "Name",
			Reversable = true,
			Run = function(p1, p2, p3) --[[ Run | Line: 66 ]]
				local v1 = p1.NameLabel.Text:lower()
				local v2 = p2.NameLabel.Text:lower()
				if p3 then
					return v2 < v1
				else
					return v1 < v2
				end
			end,
			Changed = function(p1) --[[ Changed | Line: 77 ]]
				return p1.NameLabel:GetPropertyChangedSignal("Text")
			end
		}
	},
	Search = {
		TextBox = ContainerFrame.Menu.Content.HorseSelect.SearchBar.Content.TextBox,
		Run = function(p1, p2) --[[ Run | Line: 85 ]]
			if #p1 <= 0 then
				return true
			end
			local v1 = p1:lower()
			local v2 = p2.NameLabel.Text:lower()
			local v3 = if p2.SlotValue and p2.SlotValue.Species then p2.SlotValue.Species.Value:lower() or "" else ""
			return string.find(v2, v1) or string.find(v3, v1)
		end
	}
})
local function selectItem(p1) --[[ selectItem | Line: 97 | Upvalues: v22 (copy), v24 (ref), v23 (copy), v6 (copy), v5 (copy), ContainerFrame (copy) ]]
	v22:DoCleaning()
	v24 = p1
	v23:Fire()
	if not p1 then
		return
	end
	local v1 = v6.GetByName(p1.Name)
	v22:GiveTask(v5.new({
		HideDescriptionIfStats = true,
		KeepDescriptionSize = true,
		Item = v1,
		DataValue = p1,
		Frame = ContainerFrame.Menu.Content.SelectedItem.Content,
		AmountColors = {
			None = Color3.fromRGB(255, 94, 97),
			Default = Color3.fromRGB(255, 255, 255)
		}
	}))
end
local function selectAnimal(p1) --[[ selectAnimal | Line: 118 | Upvalues: v21 (copy), v25 (ref), v11 (copy), t2 (ref) ]]
	v21:DoCleaning()
	v25 = p1
	if p1 then
		v11:RemoveToolTip()
		v11:CreateToolTip({
			Type = "ConsumeItem",
			Offset = Vector2.new(0.65, 0.5),
			GuiObject = t2[p1].Frame,
			Get = function() --[[ Get | Line: 129 | Upvalues: p1 (copy) ]]
				return p1
			end
		})
	else
		v11:RemoveToolTip()
	end
end
local function createAnimal(p1, p2) --[[ createAnimal | Line: 138 | Upvalues: v4 (copy), LocalPlayer (copy), ContainerFrame (copy), v9 (copy), v23 (copy), v24 (ref), v12 (copy), v25 (ref), v11 (copy), v7 (copy), v13 (copy), selectAnimal (copy), t2 (ref), v27 (copy) ]]
	local v1
	if not p2 then
		task.wait()
	end
	v1 = v4.new({
		SlotValue = p1,
		Owner = LocalPlayer,
		ParentFrame = ContainerFrame.Menu.Content.HorseSelect.Horses,
		UnableCheck = {
			ListenForValueAttributes = true,
			Changed = {
				v9.OnTimeChanged,
				p1.LastBreed:GetPropertyChangedSignal("Value"),
				p1.Infertile:GetPropertyChangedSignal("Value"),
				v23
			},
			Get = function() --[[ Get | Line: 155 | Upvalues: v24 (ref), v12 (ref), p1 (copy) ]]
				if v24 then
					return v12.CanGiveConsumable({
						Slot = p1,
						Item = v24.Name
					})
				end
			end,
			Reasons = {}
		}
	})
	v1:GiveTask(v1.UnableFrame:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 166 | Upvalues: v1 (copy), v25 (ref), p1 (copy), v11 (ref) ]]
		if not v1.UnableFrame.Visible then
			return
		end
		if v25 ~= p1 then
			return
		end
		v11:RemoveToolTip()
	end))
	v1:GiveTask(v7.new(v1.Frame, {
		Click = function() --[[ Click | Line: 174 | Upvalues: v24 (ref), v13 (ref), selectAnimal (ref), v25 (ref), p1 (copy), v1 (copy) ]]
			if v24 and v24.Value <= 0 then
				v13.NotifyIssue("NoOwnAnymore")
				selectAnimal()
				return
			end
			if v25 == p1 then
				selectAnimal()
				return
			end
			if not (v1.UnableFrame and v1.UnableFrame.Visible) then
				selectAnimal(p1)
			end
		end
	}))
	t2[p1] = v1
	v27:Add(v1, p2)
end
local function removeAnimal(p1) --[[ removeAnimal | Line: 200 | Upvalues: t2 (ref), v25 (ref), v27 (copy) ]]
	if t2[p1] then
		v27:Remove(t2[p1])
		t2[p1]:Destroy()
		t2[p1] = nil
	end
end
function t.Open(p1) --[[ Open | Line: 214 | Upvalues: v26 (ref), v1 (copy), ContainerFrame (copy), t (copy) ]]
	local v12 = tick()
	v26 = v12
	if v1.IsFrameOpen(ContainerFrame) then
		t:OnOpen(p1)
	else
		v1.OpenFrame(ContainerFrame, {
			UpdateOverlays = true,
			CallbackArgs = { p1 }
		})
	end
	return v12
end
function t.Close() --[[ Close | Line: 231 | Upvalues: v1 (copy), ContainerFrame (copy) ]]
	v1.CloseFrame(ContainerFrame)
end
function t.IsOpen() --[[ IsOpen | Line: 235 | Upvalues: v1 (copy), ContainerFrame (copy), v24 (ref) ]]
	return v1.IsFrameOpen(ContainerFrame) and v24
end
function t.Cleanup(p1) --[[ Cleanup | Line: 239 | Upvalues: selectAnimal (copy), t2 (ref), v25 (ref), v27 (copy), v1 (copy), ContainerFrame (copy), v20 (copy) ]]
	selectAnimal()
	for k, v in pairs(t2) do
		if t2[k] then
			v27:Remove(t2[k])
			t2[k]:Destroy()
			t2[k] = nil
		end
	end
	t2 = {}
	v1.CleanContents(ContainerFrame)
	v20:DoCleaning()
end
function t.SelectSlot(p1) --[[ SelectSlot | Line: 251 | Upvalues: selectAnimal (copy) ]]
	return selectAnimal(p1)
end
function t.OnOpen(p1, p2) --[[ OnOpen | Line: 255 | Upvalues: v1 (copy), ContainerFrame (copy), v20 (copy), v19 (copy), removeAnimal (copy), createAnimal (copy), v27 (copy), selectItem (copy), v18 (copy), selectAnimal (copy), v25 (ref) ]]
	local v12 = v1.getFrameFromInstance(ContainerFrame)
	if not v12.Opened then
		v12.Opened = true
	end
	if not v12.ContentsLoaded then
		v12.ContentsLoaded = true
		v20:GiveTask(v19.ChildRemoved:Connect(removeAnimal))
		v20:GiveTask(v19.ChildAdded:Connect(createAnimal))
		for k, v in pairs(v19:GetChildren()) do
			createAnimal(v, true)
		end
		v27:Sort(v27.SortType or "Alphabet")
	end
	selectItem(v18:GetItemValue(p2.Item))
	selectAnimal(p2.Slot or v25)
end
function t.Init(p1) --[[ Init | Line: 281 | Upvalues: v3 (copy), ContainerFrame (copy), t (copy), v1 (copy), v26 (ref), selectAnimal (copy), v11 (copy), v6 (copy), v24 (ref), v12 (copy), v25 (ref), v13 (copy), v18 (copy), v10 (copy), v15 (copy), v9 (copy), v16 (copy), v17 (copy), v2 (copy), v14 (copy), ReplicatedStorage (copy) ]]
	v3.new(ContainerFrame.Menu.CloseButton, {
		Click = t.Close
	})
	v1.AddFrame(ContainerFrame, {
		TweenAnimation = false,
		ShortcutToClose = true,
		Overlay = true,
		CheckVisibility = function(p1) --[[ CheckVisibility | Line: 287 | Upvalues: v26 (ref) ]]
			return v26
		end,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0),
		SelectOnOpen = ContainerFrame
	})
	v1.AddStateCallback(ContainerFrame, "OnOpen", function(...) --[[ Line: 297 | Upvalues: t (ref) ]]
		t:OnOpen(...)
	end)
	v1.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 300 | Upvalues: v26 (ref), selectAnimal (ref) ]]
		v26 = nil
		selectAnimal()
	end)
	v1.AddStateCallback(ContainerFrame, "OnCleanup", function() --[[ Line: 304 | Upvalues: t (ref) ]]
		t:Cleanup()
	end)
	v11:AddToolTip("ConsumeItem", function(p1, p2, ...) --[[ Line: 308 | Upvalues: v6 (ref), v24 (ref), v12 (ref), v25 (ref), v13 (ref), v18 (ref), v10 (ref), v15 (ref), v9 (ref), v16 (ref), v17 (ref), v2 (ref), v14 (ref), v3 (ref), selectAnimal (ref), ReplicatedStorage (ref) ]]
		local v1 = v6.GetByName(v24.Name)
		local v22, v32 = v12.CanGiveConsumable({
			Slot = v25,
			Item = v24.Name
		})
		if v22 == true then
			p2.Menu.Content.Visible = true
			p2.Menu.UnableDescription.Visible = false
			p2.Menu.Content.Buttons.Use.Visible = v1.ConsumableType and (if v1.ItemType == "Food" then false else true)
			p2.Menu.Content.Buttons.Feed.Visible = v1.ConsumableType and (if v1.ItemType == "Food" then true else false)
			local v62 = if v1.ConsumableType == "InstantFoal" then "SkipGestation" else v1.ConsumableType
			for k, v in pairs(p2.Menu.Content.Status:GetChildren()) do
				v.Visible = v.Name == v62
			end
			if v62 == "SkipGestation" then
				local v7 = v18.Player.Character.Animals:FindFirstChild(v25.Name)
				if v10.IsToyHorse(v25) then
					p2.Menu.Content.Status.SkipGestation.Visible = false
				elseif v7 and v7.Data:GetAttribute("BondEvent") then
					p2.Menu.Content.Status.SkipGestation.Title.Text = "Complete Bond Event"
					p2.Menu.Content.Status.SkipGestation.ProgressBar.Visible = false
				else
					p2.Menu.Content.Status.SkipGestation.Title.Text = "Skip Gestation"
					p2.Menu.Content.Status.SkipGestation.ProgressBar.Visible = true
					p1:GiveTask(v15.new({
						TweenAmount = false,
						Clipped = false,
						Frame = p2.Menu.Content.Status.SkipGestation.ProgressBar.Fill,
						AmountLabel = p2.Menu.Content.Status.SkipGestation.ProgressBar.Amount,
						GetText = function(p1, p2) --[[ GetText | Line: 350 | Upvalues: v9 (ref) ]]
							return v9.FormatString(p2 - p1)
						end,
						Get = function() --[[ Get | Line: 354 | Upvalues: v10 (ref), v18 (ref), v25 (ref) ]]
							return v10.GetBreedCooldown(v18, v25) - v10.GetBirthTimeLeft(v18, v25)
						end,
						GetMax = function() --[[ GetMax | Line: 357 | Upvalues: v10 (ref), v18 (ref), v25 (ref) ]]
							return v10.GetBreedCooldown(v18, v25)
						end,
						Changed = { v9.OnTimeChanged, v25.LastBreed:GetPropertyChangedSignal("Value") }
					}))
				end
			elseif v1.ConsumableType == "UpgradeMutation" then
				local v8, v92 = v16.GetMutationOfType(v25, v1.TargetMutationType)
				p2.Menu.Content.Status.UpgradeMutation.Title.Text = v17.GetDisplayName(v8.Name, v8)
				for i = 1, v8.MaxLevel do
					local Default = p2.Menu.Content.Status.UpgradeMutation.Progress.Default
					Default.Visible = false
					local v102 = Default:Clone()
					v102.Amount.Text = i
					local function setLevelLabel() --[[ setLevelLabel | Line: 375 | Upvalues: v102 (copy), i (copy), v92 (copy) ]]
						local Active = v102:FindFirstChild("Active")
						Active.Visible = i <= v92.Level.Value
						v102.Amount.TextColor3 = v102:FindFirstChild("Active").Visible and Color3.fromRGB(0, 42, 139) or Color3.fromRGB(255, 255, 255)
					end
					p1:GiveTask(v92.Level:GetPropertyChangedSignal("Value"):Connect(setLevelLabel))
					setLevelLabel()
					v102.Visible = true
					v102.Parent = Default.Parent
					p1:GiveTask(v102)
				end
			elseif v1.ConsumableType == "TrophyUpgradePotion" then
				local _, v11 = v16.GetMutationOfName(v25, "Trophy")
				for j = 1, 5 do
					local Default = p2.Menu.Content.Status.TrophyUpgradePotion.Progress.Default
					Default.Visible = false
					local v122 = Default:Clone()
					v122.Amount.Text = j
					local function setLevelLabel() --[[ setLevelLabel | Line: 395 | Upvalues: v122 (copy), j (copy), v11 (copy) ]]
						local Active = v122:FindFirstChild("Active")
						Active.Visible = j <= v11.Level.Value
						v122.Amount.TextColor3 = v122:FindFirstChild("Active").Visible and Color3.fromRGB(0, 42, 139) or Color3.fromRGB(255, 255, 255)
					end
					p1:GiveTask(v11.Level:GetPropertyChangedSignal("Value"):Connect(setLevelLabel))
					setLevelLabel()
					v122.Visible = true
					v122.Parent = Default.Parent
					p1:GiveTask(v122)
				end
			elseif v1.ConsumableType == "Mutation" then
				local TargetMutation = v1.TargetMutation
				if TargetMutation then
					local v132 = v16.GetMutation(TargetMutation)
					p2.Menu.Content.Status.Mutation.Title.Text = string.format("Gives the %s Mutation!", v17.GetDisplayName(v132.Name, v132))
					p2.Menu.Content.Status.Mutation.Icon.Image = v132.Image
				else
					p2.Menu.Content.Status.Mutation.Title.Text = v1.QuickfeedDesc
				end
			elseif v1.ConsumableType == "Boost" then
				p1:GiveTask((v2.new()))
				local v142 = v14.new()
				p1:GiveTask(v142)
				p1:GiveTask(v25.ActiveBoosts.ChildAdded:Connect(function(p12) --[[ Line: 424 | Upvalues: p1 (copy), v142 (copy) ]]
					task.wait()
					for k, v in pairs({ p12, p12.Start }) do
						p1:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 427 | Upvalues: v142 (ref) ]]
							v142:Fire()
						end))
					end
				end))
				for k, v in pairs(v25.ActiveBoosts:GetChildren()) do
					for k2, v7 in pairs({ v, v.Start }) do
						p1:GiveTask(v7:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 434 | Upvalues: v142 (copy) ]]
							v142:Fire()
						end))
					end
				end
				p1:GiveTask(v15.new({
					TweenAmount = false,
					Clipped = false,
					Frame = p2.Menu.Content.Status.Boost.ProgressBar.Fill,
					AmountLabel = p2.Menu.Content.Status.Boost.ProgressBar.Amount,
					GetText = function(p1, p2) --[[ GetText | Line: 445 | Upvalues: v9 (ref) ]]
						if p1 <= 0 then
							return "No Boost"
						else
							return v9.FormatString(p1)
						end
					end,
					Get = function() --[[ Get | Line: 452 | Upvalues: v25 (ref), v1 (copy), v9 (ref) ]]
						local v12 = v25.ActiveBoosts:FindFirstChild(v1.Name)
						if v12 then
							return v12.Value - v9.Get()
						else
							return 0
						end
					end,
					GetMax = function() --[[ GetMax | Line: 460 | Upvalues: v25 (ref), v1 (copy) ]]
						local v12 = v25.ActiveBoosts:FindFirstChild(v1.Name)
						if v12 then
							return v12.Value - v12:WaitForChild("Start").Value
						else
							return 0
						end
					end,
					Changed = {
						v25.ActiveBoosts.ChildAdded,
						v25.ActiveBoosts.ChildRemoved,
						v142,
						v9.OnTimeChanged
					}
				}))
			elseif v1.ConsumableType == "RandomMutation" then
				p2.Menu.Content.Status.RandomMutation.Title.Text = string.format("Random %% chance for any %s mutation", v1.TargetMutationType or v1.Rarity.Name)
			end
			for k, v in pairs(p2.Menu.Content.Buttons:GetChildren()) do
				for k2, v7 in pairs(v:GetChildren()) do
					p1:GiveTask(v3.new(v7, {
						Click = function() --[[ Click | Line: 485 | Upvalues: v18 (ref), v1 (copy), v13 (ref), v12 (ref), v25 (ref), selectAnimal (ref), v7 (copy), ReplicatedStorage (ref) ]]
							if not v18:HasEnoughOfItem(1, v1.Name) then
								return v13.NotifyIssue("NoOwnAnymore")
							end
							local t = {
								Prompt = true,
								Notify = true,
								Item = v1.Name,
								Slot = v25,
								OnClientPrompt = function() --[[ OnClientPrompt | Line: 495 | Upvalues: selectAnimal (ref) ]]
									selectAnimal()
								end
							}
							local t2 = {}
							t2[1] = if v7.Name == "Max" then 10000 else tonumber(v7.Name)
							t.Data = t2
							if not v12.GiveConsumable(t) or v1.ItemType ~= "Food" then
								return
							end
							local v3 = ReplicatedStorage.Storage.SFX.Feeding:GetChildren()
							v3[math.random(1, #v3)]:Play()
						end
					}))
				end
			end
		else
			p2.Menu.Content.Visible = false
			p2.Menu.UnableDescription.Text = v13.GetIssueFromReason(v22, v32) or tostring(v22)
			p2.Menu.UnableDescription.Visible = true
		end
	end)
end
function t.GetSelectedSlot() --[[ GetSelectedSlot | Line: 522 | Upvalues: v25 (ref) ]]
	return v25
end
t:Init()
return t