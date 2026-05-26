-- https://lua.expert/
local t = {}
t.__index = t
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("NotificationsClient")
local v2 = Sonar("GuiManager")
local v3 = Sonar("ButtonTest")
local v4 = Sonar("GuiUtils")
local v5 = Sonar("Maid")
local v6 = Sonar("Button")
local v7 = Sonar("TabManager")
local v8 = Sonar("ItemDataService")
local v9 = Sonar("ToolTipClient")
local v10 = Sonar("StatBar")
local v11 = Sonar("RemoteUtils")
local v12 = Sonar("GridSort")
local v13 = Sonar("StorageUtils")
local v14 = Sonar("TitlesService")
local v15 = Sonar("IssueResponseClient")
local TrophyColors = Sonar("Constants").TrophyColors
local v16 = Sonar(v13.Get("Achivements"))
local v17 = Sonar(v13.Get("Titles"))
local v18 = Sonar("PlayerWrapper").GetClient()
local ContainerFrame = Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("AchievementsGui"):WaitForChild("ContainerFrame")
local v19 = v11.GetRemoteEvent("ChangeTitleRemote")
local Trophies = ReplicatedStorage.Storage.Assets.Trophies
local t2 = {}
local t3 = {}
local v20 = v5.new()
local CurrentTitle = v18.PlayerData.CurrentTitle
local v21 = nil
local v22 = 0
local v23 = v12.new({
	Filters = {
		All = true
	},
	Frame = ContainerFrame.Menu.Sorting,
	Sorts = {
		Alphabet = {
			DisplayName = "Alphabetical",
			Reversable = true,
			Run = function(p1, p2, p3) --[[ Run | Line: 69 ]]
				local v1 = p1.Frame.Titles.CurrentTitle.Text:lower()
				local v2 = p2.Frame.Titles.CurrentTitle.Text:lower()
				if p3 then
					return v1 < v2
				else
					return v2 < v1
				end
			end,
			Changed = function(p1) --[[ Changed | Line: 80 ]]
				return p1.Frame.Titles.CurrentTitle:GetPropertyChangedSignal("Text")
			end
		},
		Completed = {
			DisplayName = "Completed",
			Reversable = true,
			Reversed = true,
			Run = function(p1, p2, p3) --[[ Run | Line: 90 ]]
				local Mission = p1.Mission.Value
				local Mission_2 = p2.Mission.Value
				if p3 then
					return if Mission then not Mission_2 else Mission
				else
					return if Mission_2 then not Mission else Mission_2
				end
			end,
			Changed = function(p1) --[[ Changed | Line: 101 ]]
				return p1.Mission:GetPropertyChangedSignal("Value")
			end
		}
	}
})
local t4 = {
	Titles = function() --[[ Titles | Line: 129 | Upvalues: ContainerFrame (copy) ]]
		ContainerFrame.Menu.Sorting.Visible = false
		ContainerFrame.Menu.Title.Text = "Titles"
	end,
	Achievements = function() --[[ Achievements | Line: 134 | Upvalues: ContainerFrame (copy) ]]
		ContainerFrame.Menu.Sorting.Visible = true
		ContainerFrame.Menu.Title.Text = "Achievements"
	end,
	Equip = function(p1) --[[ Equip | Line: 139 | Upvalues: v4 (copy) ]]
		v4.SetButtonColor(p1, "Diagonal", "Red")
		p1.Top.TextLabel.Text = "Unequip"
	end,
	Unequip = function(p1) --[[ Unequip | Line: 144 | Upvalues: v4 (copy) ]]
		v4.SetButtonColor(p1, "Diagonal", "Green")
		p1.Top.TextLabel.Text = "Equip"
	end
}
local function SetupTrophies(p1) --[[ SetupTrophies | Line: 150 | Upvalues: t2 (copy), Trophies (copy), v20 (copy), TrophyColors (copy) ]]
	local Type = p1.Type.Value
	if not t2[Type] then
		local v1 = Trophies:FindFirstChild(Type)
		if not v1 then
			return
		end
		t2[Type] = {
			Index = 0,
			Template = v1
		}
	end
	local v2 = t2[Type]
	if not v2.SessionModel then
		v2.SessionModel = v2.Template:Clone()
		v20:GiveTask(v2.SessionModel)
	end
	local SessionModel = v2.SessionModel
	if v2.Index < tonumber(p1.Name) then
		local v6 = TrophyColors[tonumber(p1.Name)] or TrophyColors[5]
		for v7, v8 in SessionModel:GetChildren() do
			if v8:HasTag("Trophy") then
				local Sparkles = v8:FindFirstChild("Sparkles")
				v8.Color = v6
				if Sparkles then
					Sparkles.Color = ColorSequence.new(v6)
				end
			end
		end
		v2.Index = tonumber(p1.Name)
	end
	SessionModel.Parent = workspace
end
local function forEachAchievementRow(p1) --[[ forEachAchievementRow | Line: 194 | Upvalues: t3 (copy) ]]
	for k, v in pairs(t3) do
		for i, v2 in ipairs(v) do
			p1(v2)
		end
	end
end
local function attachAchievementLiveBindings(p1) --[[ attachAchievementLiveBindings | Line: 202 | Upvalues: t3 (copy), SetupTrophies (copy), v18 (copy), v20 (copy), v10 (copy), v8 (copy), Sonar (copy), v6 (copy), v9 (copy), v3 (copy), v11 (copy), v1 (copy) ]]
	local function sortHide() --[[ sortHide | Line: 203 | Upvalues: t3 (ref), p1 (copy) ]]
		if not t3[p1.Mission.Type.Value] then
			return
		end
		for k, v in pairs(t3[p1.Mission.Type.Value]) do
			if v.Mission.Value and (v.Mission.Claimed.Value and v.MissionData.Amount < p1.MissionData.Amount) then
				v.Frame.Visible = false
			end
		end
	end
	local function setClaimButton() --[[ setClaimButton | Line: 215 | Upvalues: p1 (copy), sortHide (copy), SetupTrophies (ref) ]]
		p1.Frame.ClaimButton.Visible = p1.Mission.Value and not p1.Mission.Claimed.Value
		if not (p1.Mission.Value and p1.Mission.Claimed.Value) then
			return
		end
		sortHide()
		SetupTrophies(p1.Mission)
	end
	if p1.MissionData.Requires and not (p1.Mission.Value or p1.Mission.Claimed.Value) then
		local v2 = v18.PlayerData.Missions.Milestones[p1.Mission.Type.Value][tostring(p1.MissionData.Requires)]
		local function setVisibility() --[[ setVisibility | Line: 228 | Upvalues: v2 (copy), p1 (copy) ]]
			if v2.Value and not v2.Claimed.Value or not v2.Value then
				p1.Frame.Visible = false
			else
				p1.Frame.Visible = true
			end
		end
		v20:GiveTask(v2:GetPropertyChangedSignal("Value"):Connect(setVisibility))
		v20:GiveTask(v2.Claimed:GetPropertyChangedSignal("Value"):Connect(setVisibility))
		if v2.Value and not v2.Claimed.Value then
			p1.Frame.Visible = false
		elseif v2.Value then
			p1.Frame.Visible = true
		else
			p1.Frame.Visible = false
		end
	end
	v20:GiveTask(p1.Mission:GetPropertyChangedSignal("Value"):Connect(setClaimButton))
	v20:GiveTask(p1.Mission.Claimed:GetPropertyChangedSignal("Value"):Connect(setClaimButton))
	p1.Frame.ClaimButton.Visible = p1.Mission.Value and not p1.Mission.Claimed.Value
	if p1.Mission.Value and p1.Mission.Claimed.Value then
		sortHide()
		SetupTrophies(p1.Mission)
	end
	v20:GiveTask(v10.new({
		TweenAmount = false,
		Clipped = false,
		Frame = p1.Frame.Content.ProgressBar.Bar,
		AmountLabel = p1.Frame.Content.ProgressLabel,
		GetText = function(p12, p2) --[[ GetText | Line: 254 | Upvalues: p1 (copy) ]]
			if p1.Mission.Value then
				return "COMPLETE"
			else
				return p12 .. "/" .. p2
			end
		end,
		Get = function() --[[ Get | Line: 261 | Upvalues: p1 (copy) ]]
			local Amount = p1.Mission.Amount.Value
			if p1.MissionData.FormatRatio then
				Amount = math.floor(p1.Mission.Amount.Value / p1.MissionData.FormatRatio)
			end
			if p1.Mission.Value then
				return p1.MissionData.Amount
			else
				return math.min(Amount, p1.MissionData.Amount)
			end
		end,
		GetMax = function() --[[ GetMax | Line: 273 | Upvalues: p1 (copy) ]]
			local Amount = p1.MissionData.Amount
			if p1.MissionData.FormatRatio then
				Amount = p1.MissionData.Amount / p1.MissionData.FormatRatio
			end
			return Amount
		end,
		Changed = { p1.Mission.Amount:GetPropertyChangedSignal("Value"), p1.Mission:GetPropertyChangedSignal("Value") }
	}))
	for k, v in pairs(p1.MissionData.Rewards) do
		local v4 = v8.GetByName(v.Name)
		local v5 = Sonar("ItemGridButton").new({
			ForceVisible = true,
			Item = v4,
			ParentFrame = p1.Frame.Content.RewardContainer,
			Theme = v.Theme,
			GetAmount = function() --[[ GetAmount | Line: 295 | Upvalues: v (copy) ]]
				return v.Amount
			end
		})
		if v4.Description then
			v5:GiveTask(v6.new(v5.Frame, {
				Click = function() --[[ Click | Line: 302 | Upvalues: v9 (ref), v5 (copy), v4 (copy) ]]
					v9:CreateToolTip({
						Type = "ItemDescription",
						Offset = Vector2.new(0.65, 0.5),
						GuiObject = v5.Frame,
						Get = function() --[[ Get | Line: 307 | Upvalues: v4 (ref) ]]
							return v4
						end
					})
				end
			}))
		end
		v20:GiveTask(v5)
	end
	if p1.MissionData.UnlockedRewards then
		for v62, v7 in p1.MissionData.UnlockedRewards do
			local v82 = p1.Frame.Content.RewardContainer:FindFirstChild(v62)
			if v82 then
				v82:FindFirstChild("AmountLabel").Text = "+" .. v7
				v82.Visible = true
			end
		end
	end
	v20:GiveTask(v3.new(p1.Frame.ClaimButton, {
		Click = function() --[[ Click | Line: 329 | Upvalues: p1 (copy), v11 (ref), v1 (ref) ]]
			local v12 = if p1.RowKind == "Achivements" then v11.GetRemoteFunction("ClaimAchievement"):InvokeServer(p1.Mission.Name) else v11.GetRemoteFunction("ClaimMilestone"):InvokeServer(p1.Mission.Type.Value, p1.Mission.Name)
			if v12 ~= true then
				v1.Notify({
					Preset = "Red",
					Message = v12
				})
			end
		end
	}))
	p1.Frame.ClaimButton.Visible = p1.Mission.Value and not p1.Mission.Claimed.Value
	if p1.Mission.Value and p1.Mission.Claimed.Value then
		sortHide()
		SetupTrophies(p1.Mission)
	end
	sortHide()
end
local function refreshAchievementRowsOnOpen() --[[ refreshAchievementRowsOnOpen | Line: 352 | Upvalues: forEachAchievementRow (copy), attachAchievementLiveBindings (copy), v23 (copy) ]]
	forEachAchievementRow(function(p1) --[[ Line: 353 | Upvalues: attachAchievementLiveBindings (ref), v23 (ref) ]]
		attachAchievementLiveBindings(p1)
		v23:Add(p1, true)
	end)
	if not v23.SortType then
		v23.SortType = "Completed"
		v23.SortChangedSignal:Fire()
	end
	v23:UpdateLayout()
	v23:Filter("All")
end
local function buildAchievementRow(p1, p2) --[[ buildAchievementRow | Line: 367 | Upvalues: t (copy), v16 (copy), ContainerFrame (copy), t3 (copy) ]]
	local v2 = setmetatable({}, t)
	if p2 == "Achivements" then
		v2.MissionData = v16.Achievements[tonumber(p1.Name)]
	else
		v2.MissionData = v16.Milestones[p1.Type.Value][tonumber(p1.Name)]
	end
	if not v2.MissionData then
		return
	end
	v2.Mission = p1
	v2.RowKind = p2
	if p2 == "Achivements" then
		v2.Frame = ContainerFrame.Menu.TabFrames.Achievements.AchievementDefault:Clone()
	else
		v2.Frame = ContainerFrame.Menu.TabFrames.Achievements.MilestoneDefault:Clone()
	end
	v2.Frame.Name = p1.Name
	v2.Frame.Visible = true
	v2.Frame.Titles.CurrentTitle.Text = v2.MissionData.Title
	if v2.MissionData.NextTitle then
		v2.Frame.Titles.NextTitleLabel.Text = v2.MissionData.NextTitle
	else
		if v2.Frame.Titles:FindFirstChild("NextTitleLabel") then
			v2.Frame.Titles:FindFirstChild("NextTitleLabel").Visible = false
		end
		if v2.Frame.Titles:FindFirstChild("NextLabel") then
			v2.Frame.Titles:FindFirstChild("NextLabel").Visible = false
		end
	end
	local Amount = v2.MissionData.Amount
	if v2.MissionData.FormatRatio then
		Amount = v2.MissionData.Amount / v2.MissionData.FormatRatio
	end
	if v2.MissionData.DisplayAs then
		Amount = v2.MissionData.DisplayAs
	end
	v2.Frame.Content.Instructions.Text = string.format(v2.MissionData.Description, (math.floor(Amount)))
	v2.Frame.Parent = ContainerFrame.Menu.TabFrames.Achievements
	ContainerFrame.Menu.TabFrames.Achievements.AchievementDefault.Visible = false
	if not t3[v2.Mission.Type.Value] then
		t3[v2.Mission.Type.Value] = {}
	end
	table.insert(t3[v2.Mission.Type.Value], v2)
	return v2
end
local function CreateAchievement(p1, p2) --[[ CreateAchievement | Line: 427 | Upvalues: buildAchievementRow (copy) ]]
	return buildAchievementRow(p1, p2)
end
local function FindTitle(p1) --[[ FindTitle | Line: 431 | Upvalues: v17 (copy) ]]
	for v2, v3 in v17 do
		if v3.Title == p1 then
			return v3
		end
	end
	return nil
end
function darkenColor(p1, p2) --[[ darkenColor | Line: 444 ]]
	local v1 = 1 - p2 / 100
	return Color3.new(p1.R * v1, p1.G * v1, p1.B * v1)
end
local function CreateTitle(p1) --[[ CreateTitle | Line: 449 | Upvalues: v17 (copy), ContainerFrame (copy), CurrentTitle (copy), t4 (copy), v21 (ref), v3 (copy), v22 (ref), v15 (copy), v14 (copy), v18 (copy), v19 (copy) ]]
	local v1 = p1.Name
	local v2 = nil
	for v32, v4 in v17 do
		if v4.Title == v1 then
			v2 = v4
			break
		end
	end
	local v5 = v2
	if not v5 then
		return
	end
	local v6 = ContainerFrame.Menu.TabFrames.Titles.TitleDefault:Clone()
	v6.Visible = true
	v6.Name = v5.Title
	local v7 = v5.Color or v6.Titles.CurrentTitle.TextColor3
	v6.Titles.CurrentTitle.Text = v5.Title
	v6.Titles.CurrentTitle.TextColor3 = v7
	v6.Titles.CurrentTitle.UIStroke.Color = darkenColor(v7, 40)
	v6.Content.Instructions.Text = v5.Description
	if CurrentTitle.Value == p1.Name then
		t4.Equip(v6.EquipButton)
		v21 = v6.EquipButton
	end
	v3.new(v6.EquipButton, {
		Click = function() --[[ Click | Line: 473 | Upvalues: v22 (ref), v15 (ref), CurrentTitle (ref), v5 (copy), v14 (ref), v18 (ref), v19 (ref), v21 (ref), t4 (ref), v6 (copy) ]]
			if tick() - v22 < 0.25 then
				v15.NotifyIssue("TooFast")
				return
			end
			v22 = tick()
			if CurrentTitle.Value ~= v5.Title and not v14.DoesPlayerOwnTitle(v18.PlayerData.Titles, v5.Title) then
				return
			end
			v19:FireServer(if CurrentTitle.Value == v5.Title then nil else v5.Title or nil)
			if v21 then
				t4.Unequip(v21)
			end
			if v21 == v6.EquipButton then
				v21 = nil
			else
				v21 = v6.EquipButton
				t4.Equip(v6.EquipButton)
			end
		end
	})
	v6.Parent = ContainerFrame.Menu.TabFrames.Titles
end
function t.Open() --[[ Open | Line: 505 | Upvalues: v2 (copy), ContainerFrame (copy) ]]
	v2.OpenMainFrame(ContainerFrame)
end
function t.Close() --[[ Close | Line: 509 | Upvalues: v2 (copy), ContainerFrame (copy) ]]
	v2.CloseMainFrame(ContainerFrame)
end
function t.Cleanup(p1) --[[ Cleanup | Line: 513 | Upvalues: forEachAchievementRow (copy), v23 (copy), t2 (copy), v20 (copy) ]]
	forEachAchievementRow(function(p1) --[[ Line: 514 | Upvalues: v23 (ref) ]]
		v23:Remove(p1)
	end)
	for k, v in pairs(t2) do
		v.SessionModel = nil
	end
	v20:DoCleaning()
end
function t.GiveTask(p1, p2) --[[ GiveTask | Line: 523 | Upvalues: v20 (copy) ]]
	v20:GiveTask(p2)
end
function t.SetVisible(p1, p2) --[[ SetVisible | Line: 527 ]] end
function t.SetLayoutOrder(p1, p2) --[[ SetLayoutOrder | Line: 531 ]]
	p1.Frame.LayoutOrder = p2
end
function t.Init(p1) --[[ Init | Line: 535 | Upvalues: v2 (copy), ContainerFrame (copy), refreshAchievementRowsOnOpen (copy), t (copy), v3 (copy), Sonar (copy), v7 (copy), t4 (copy), v18 (copy), buildAchievementRow (copy), CreateTitle (copy) ]]
	v2.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0)
	})
	v2.AddStateCallback(ContainerFrame, "OnOpen", function() --[[ Line: 545 | Upvalues: refreshAchievementRowsOnOpen (ref) ]]
		refreshAchievementRowsOnOpen()
	end)
	v2.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 548 | Upvalues: t (ref) ]]
		t:Cleanup()
	end)
	v2.AddStateCallback(ContainerFrame, "OnCleanup", function() --[[ Line: 551 | Upvalues: t (ref) ]]
		t:Cleanup()
	end)
	v3.new(ContainerFrame.Menu.CloseButton, {
		Click = function() --[[ Click | Line: 556 | Upvalues: t (ref) ]]
			t.Close()
		end
	})
	v3.new(ContainerFrame.Menu.HelpButton, {
		Click = function() --[[ Click | Line: 562 | Upvalues: Sonar (ref) ]]
			Sonar("TutorialService").PromptPopupInfo("Achievements")
		end
	})
	for k, v in pairs(ContainerFrame.TabButtons:GetChildren()) do
		if v:IsA("ImageButton") then
			local v1 = ContainerFrame.Menu.TabFrames:FindFirstChild(v.Name)
			if v1 then
				v7.AddTab(v1, {
					ParentFrame = ContainerFrame,
					Button = v
				})
				local function setSize() --[[ setSize | Line: 578 | Upvalues: v (copy), v7 (ref), v1 (copy) ]]
					v.UIScale.Scale = if v7.IsTabOpen(v1) then 1.2 else 1
				end
				v7.AddStateCallback(v1, "OnOpen", setSize)
				v7.AddStateCallback(v1, "OnClose", setSize)
			end
			v3.new(v, {
				Click = function() --[[ Click | Line: 586 | Upvalues: v1 (copy), v7 (ref), t4 (ref), v (copy) ]]
					if v1 then
						v7.OpenTab(v1)
						t4[v.Name](v1, v)
					end
				end
			})
		end
	end
	for v22, v32 in v18.PlayerData.Missions.Achivements:GetChildren() do
		buildAchievementRow(v32, "Achivements")
	end
	for v4, v5 in v18.PlayerData.Missions.Milestones:GetChildren() do
		for v6, v72 in v5:GetChildren() do
			buildAchievementRow(v72, "Milestones")
		end
	end
	for v8, v9 in v18.PlayerData.Titles:GetChildren() do
		CreateTitle(v9)
	end
	v18.PlayerData.Titles.ChildAdded:Connect(function(p1) --[[ Line: 608 | Upvalues: CreateTitle (ref) ]]
		CreateTitle(p1)
	end)
end
t:Init()
return t