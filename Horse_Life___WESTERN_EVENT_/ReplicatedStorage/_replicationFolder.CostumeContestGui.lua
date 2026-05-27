-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local CaptureService = game:GetService("CaptureService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Signal")
local v2 = Sonar("ItemReplicationService")
local v3 = Sonar("AnimalCosmetics")
local v4 = Sonar("Maid")
local v5 = Sonar("GridSort")
local v6 = Sonar("AnimalDataService")
local v7 = Sonar("AnimalGridButton")
local v8 = Sonar("GuiManager")
local v9 = Sonar("RemoteUtils")
local v10 = Sonar("TimeUtils")
local v11 = Sonar("ButtonTest")
local v12 = Sonar("Button")
local v13 = Sonar("PlayerWrapper")
local v14 = Sonar("PromptClient")
local v15 = Sonar("NotificationsClient")
local v16 = Sonar("LightingService")
local v17 = RunService:IsStudio() and true
local CostumeContestGui = ReplicatedStorage:WaitForChild("Storage").Assets.CostumeContestGui
local CurrentCamera = Workspace.CurrentCamera
local v18 = v13.GetClient()
local LocalPlayer = Players.LocalPlayer
local ContainerFrame = LocalPlayer.PlayerGui:WaitForChild("CostumeContestVoteGui").ContainerFrame
local MainFrame = ContainerFrame.MainFrame
local VoteFrame = MainFrame.VoteFrame
local v19 = v9.GetRemoteEvent("CostumeContest")
local v20 = v9.GetRemoteFunction("SelectCostumeContestSlot")
local v21 = v9.GetRemoteEvent("ForceExitCostumeContestRemote")
local CostumeContest = ReplicatedStorage:WaitForChild("CostumeContest")
local v22 = LocalPlayer
local v23 = v1.new()
local PagentPodium = CostumeContestGui.PagentPodium
local t2 = {}
local t3 = {}
local function hideStar(p1) --[[ hideStar | Line: 66 ]]
	p1.ImageColor3 = Color3.fromRGB(103, 91, 116)
end
local function showStar(p1) --[[ showStar | Line: 71 ]]
	p1.ImageColor3 = Color3.fromRGB(255, 255, 255)
end
local function updateStars() --[[ updateStars | Line: 76 | Upvalues: t3 (ref), v22 (ref), t2 (copy) ]]
	local v1 = t3[v22]
	for v2, v3 in t2 do
		if v1 then
			if v2 <= v1 then
				v3.ImageColor3 = Color3.fromRGB(255, 255, 255)
				continue
			end
			v3.ImageColor3 = Color3.fromRGB(103, 91, 116)
			continue
		end
		v3.ImageColor3 = Color3.fromRGB(103, 91, 116)
	end
end
local function updatePlayerView() --[[ updatePlayerView | Line: 91 | Upvalues: VoteFrame (copy), v17 (copy), v22 (ref), LocalPlayer (copy), updateStars (copy) ]]
	VoteFrame.StarContainer.Visible = v17 or v22 ~= LocalPlayer
	VoteFrame.NameLabel.Text = string.format("@%*", v22.Name)
	updateStars()
end
local function moveSpectate(p1) --[[ moveSpectate | Line: 99 | Upvalues: CostumeContest (copy), v22 (ref), Players (copy), v23 (copy), VoteFrame (copy), v17 (copy), LocalPlayer (copy), updateStars (copy) ]]
	local v1 = CostumeContest:GetChildren()
	table.sort(v1, function(p1, p2) --[[ Line: 102 ]]
		return p1.Name < p2.Name
	end)
	local v2 = nil
	for v3, v4 in v1 do
		if v4.Name == v22.Name then
			v2 = v3
			break
		end
	end
	local v5 = (v2 or 1) + p1
	if v5 == 0 then
		v5 = #v1
	elseif #v1 < v5 then
		v5 = 1
	end
	local v6 = v1[v5]
	local v8 = Players:FindFirstChild(if v6 then v6.Name else "")
	if v8 then
		v22 = v8
		v23:Fire()
	end
	VoteFrame.StarContainer.Visible = v17 or v22 ~= LocalPlayer
	VoteFrame.NameLabel.Text = string.format("@%*", v22.Name)
	updateStars()
end
local function onCostumeSlotValueAdded(p1) --[[ onCostumeSlotValueAdded | Line: 140 | Upvalues: v6 (copy), v4 (copy), v2 (copy), v3 (copy), PagentPodium (copy), v17 (copy), CurrentCamera (copy), v22 (ref), v23 (copy), CostumeContest (copy) ]]
	if not p1:IsA("Folder") then
		return
	end
	local Species = p1:WaitForChild("Species")
	local v1 = v6.GetByName(Species.Value)
	local v24 = v4.new()
	local v32 = v24:GiveTask(v2.Get(v1):Clone())
	local v42 = v24:GiveTask(Instance.new("Animation"))
	v42.AnimationId = v1.Animations.Idle
	v24:GiveTask(v32.AnimationController:LoadAnimation(v42)):Play()
	v24:GiveTask(v3.new(v32, {
		InViewport = false,
		SlotValue = p1
	}))
	v32.PrimaryPart.Anchored = true
	v32:PivotTo(PagentPodium.PrimaryPart.CFrame + Vector3.new(0, v32.HumanoidRootPart.Size.Y / 2 - (v32.HumanoidRootPart.Position - v32.PrimaryPart.Position).Y, 0))
	v32.Name = p1.Name
	v24:GiveTask(v23:Connect(function() --[[ onCurrentlyViewingChanged | Line: 168 | Upvalues: v17 (ref), v32 (copy), CurrentCamera (ref), v22 (ref), p1 (copy) ]]
		if v17 then
			v32.Parent = CurrentCamera
			return
		end
		v32.Parent = if v22.Name == p1.Name then CurrentCamera else nil
	end))
	if v17 then
		v32.Parent = CurrentCamera
	else
		v32.Parent = if v22.Name == p1.Name then CurrentCamera else nil
	end
	v24:GiveTask(p1:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 181 | Upvalues: p1 (copy), CostumeContest (ref), v24 (copy) ]]
		if not p1:IsDescendantOf(CostumeContest) then
			v24:Destroy()
		end
	end))
end
function t._bind() --[[ _bind | Line: 191 | Upvalues: CostumeContest (copy), onCostumeSlotValueAdded (copy) ]]
	for v1, v2 in CostumeContest:GetChildren() do
		onCostumeSlotValueAdded(v2)
	end
	CostumeContest.ChildAdded:Connect(onCostumeSlotValueAdded)
end
function t._connect() --[[ _connect | Line: 200 | Upvalues: v23 (copy), v22 (ref), CurrentCamera (copy), v21 (copy), v14 (copy), v19 (copy), v8 (copy), ContainerFrame (copy), v16 (copy), PagentPodium (copy), Workspace (copy), LocalPlayer (copy), VoteFrame (copy), v17 (copy), updateStars (copy), v10 (copy), RunService (copy), t3 (ref) ]]
	local v1 = false
	v23:Connect(function() --[[ Line: 203 | Upvalues: v1 (ref), v22 (ref), CurrentCamera (ref) ]]
		if v1 then
			CurrentCamera.CameraSubject = CurrentCamera:WaitForChild(v22.Name)
		end
	end)
	v21.OnClientEvent:Connect(function() --[[ Line: 214 | Upvalues: v14 (ref) ]]
		v14.Close()
	end)
	v19.OnClientEvent:Connect(function(p1) --[[ Line: 218 | Upvalues: CurrentCamera (ref), v8 (ref), ContainerFrame (ref), v16 (ref), v1 (ref), PagentPodium (ref), Workspace (ref), v22 (ref), LocalPlayer (ref), v23 (ref), VoteFrame (ref), v17 (ref), updateStars (ref), v10 (ref), RunService (ref), t3 (ref) ]]
		v8.OpenMainFrame(ContainerFrame, {
			Blur = false
		})
		v16.setLightingMode("DressUp", true)
		v1 = true
		PagentPodium.Parent = Workspace.Terrain
		CurrentCamera:SetAttribute("Override", true)
		v22 = LocalPlayer
		v23:Fire()
		VoteFrame.ThemeLabel.Text = string.format("Theme: %*", p1.Theme)
		VoteFrame.StarContainer.Visible = v17 or LocalPlayer ~= LocalPlayer
		VoteFrame.NameLabel.Text = string.format("@%*", LocalPlayer.Name)
		updateStars()
		repeat
			local v3 = math.max(p1.EndTime - workspace:GetServerTimeNow(), 0)
			VoteFrame.TimeLabel.Text = string.format("Voting Time: %*", v10.FormatTimeWithoutLeadingZeros(v3))
			RunService.Heartbeat:Wait()
		until v3 == 0
		t3 = {}
		v1 = false
		PagentPodium.Parent = nil
		CurrentCamera.CameraSubject = CurrentCamera.CameraSubject
		CurrentCamera:SetAttribute("Override", nil)
		v22 = LocalPlayer
		v23:Fire()
		v16.setLightingMode("DressUp", false)
		v8.OpenHUD()
	end)
end
function t._setup() --[[ _setup | Line: 256 | Upvalues: v8 (copy), ContainerFrame (copy), v11 (copy), MainFrame (copy), moveSpectate (copy), CaptureService (copy), v14 (copy), v18 (copy), v5 (copy), v7 (copy), LocalPlayer (copy), v12 (copy), v20 (copy), v10 (copy), v15 (copy), VoteFrame (copy), t2 (copy), v22 (ref), v17 (copy), t3 (ref), updateStars (copy), v19 (copy) ]]
	v8.AddFrame(ContainerFrame, {
		TweenAnimation = false,
		KeepPosition = true
	})
	v11.new(MainFrame.LeftButton, {
		Click = function() --[[ Click | Line: 263 | Upvalues: moveSpectate (ref) ]]
			moveSpectate(-1)
		end
	})
	v11.new(MainFrame.RightButton, {
		Click = function() --[[ Click | Line: 269 | Upvalues: moveSpectate (ref) ]]
			moveSpectate(1)
		end
	})
	v11.new(ContainerFrame.Camera, {
		Click = function() --[[ Click | Line: 275 | Upvalues: CaptureService (ref) ]]
			CaptureService:CaptureScreenshot(function(p1) --[[ Line: 276 | Upvalues: CaptureService (ref) ]]
				CaptureService:PromptSaveCapturesToGallery({ p1 }, function() --[[ Line: 277 ]] end)
			end)
		end
	})
	v14.AddPromptCallback("EnterCostumeContest", function(p1, p2) --[[ Line: 283 | Upvalues: v18 (ref), v5 (ref), v7 (ref), LocalPlayer (ref), v12 (ref), v20 (ref), v14 (ref), v10 (ref) ]]
		return {
			Type = "EnterCostumeContest",
			DontSetHUDNavigationEnabled = true,
			Run = function() --[[ Run | Line: 288 ]]
				return true
			end,
			Cancel = function() --[[ Cancel | Line: 292 ]]
				return true
			end,
			Setup = function(p12, p22) --[[ Setup | Line: 296 | Upvalues: v18 (ref), v5 (ref), v7 (ref), LocalPlayer (ref), v12 (ref), v20 (ref), v14 (ref), p1 (copy), v10 (ref), p2 (copy) ]]
				local v1 = v18:GetItemFolder("Animals")
				local Horses = p12.Content.Horses
				local v2 = p22.Maid:GiveTask(v5.new({
					Priority = {
						{
							Priority = 2,
							Run = function(p1) --[[ Run | Line: 305 ]]
								return p1.EquippedLabel.Visible
							end,
							Changed = function(p1) --[[ Changed | Line: 308 ]]
								return p1.EquippedLabel:GetPropertyChangedSignal("Visible")
							end
						},
						{
							Priority = 1,
							Run = function(p1) --[[ Run | Line: 316 ]]
								return p1.SlotValue.Favorite.Value
							end,
							Changed = function(p1) --[[ Changed | Line: 319 ]]
								return p1.SlotValue.Favorite:GetPropertyChangedSignal("Value")
							end
						}
					},
					EmptyString = {
						Text = "You do not have any horses!",
						Label = Horses.EmptyLabel
					},
					Sorts = {
						Alphabet = {
							DisplayName = "Name",
							Reversable = true,
							Run = function(p1, p2, p3) --[[ Run | Line: 334 ]]
								local v1 = p1.NameLabel.Text:lower()
								local v2 = p2.NameLabel.Text:lower()
								if p3 then
									return v2 < v1
								else
									return v1 < v2
								end
							end,
							Changed = function(p1) --[[ Changed | Line: 343 ]]
								return p1.NameLabel:GetPropertyChangedSignal("Text")
							end
						}
					}
				}))
				local function createAnimal(p1, p2) --[[ createAnimal | Line: 350 | Upvalues: p22 (copy), v7 (ref), LocalPlayer (ref), Horses (copy), v12 (ref), v20 (ref), v14 (ref), v2 (copy) ]]
					if p2 then
						task.wait(0.5)
					end
					local v1 = p22.Maid:GiveTask(v7.new({
						SlotValue = p1,
						Owner = LocalPlayer,
						ParentFrame = Horses
					}))
					v1:GiveTask(v12.new(v1.Frame, {
						Click = function() --[[ Click | Line: 362 | Upvalues: v20 (ref), p1 (copy), v14 (ref) ]]
							if v20:InvokeServer(p1.Name) then
								v14.Close()
							end
						end
					}))
					if not v2.Maid then
						return
					end
					v2:Add(v1, p2)
				end
				p22.Maid:GiveTask(v1.ChildAdded:Connect(createAnimal))
				p22.Maid:GiveTask(task.spawn(function() --[[ Line: 379 | Upvalues: p1 (ref), v10 (ref), p12 (copy), p2 (ref) ]]
					while true do
						p12.Content.ContestLabel.Text = ("The current theme is %*! The contest will begin in %*!"):format(p2, (v10.FormatStat(p1 - os.time())))
						task.wait(1)
					end
				end))
				for v3, v4 in v1:GetChildren() do
					p22.Maid:GiveTask(task.spawn(createAnimal, v4, true))
				end
				if not v2.Maid then
					return
				end
				v2:Sort(v2.SortType or "Alphabet")
			end
		}
	end)
	v14.AddPromptCallback("CostumeContest", function(p1, p2) --[[ Line: 400 | Upvalues: v11 (ref), v14 (ref) ]]
		return {
			Type = "CostumeContest",
			Run = function() --[[ Run | Line: 404 ]]
				return true
			end,
			Cancel = function() --[[ Cancel | Line: 408 ]]
				return true
			end,
			Setup = function(p12, p22) --[[ Setup | Line: 412 | Upvalues: p1 (copy), p2 (copy), v11 (ref), v14 (ref) ]]
				local t = {
					{ "#8b1f0d", "#ffc82e" },
					{ "#383956", "#b8e9ff" },
					{ "#48230e", "#cd7f32" }
				}
				local v1 = ""
				for i = #p1, 1, -1 do
					if not (string.len(p1[i]) > 0) then
						table.remove(p1)
					end
				end
				for v3, v4 in p1 do
					local v6, v7 = table.unpack(t[v3])
					v1 = (v1 .. ("<stroke color=\"%*\" joins=\"round\" thickness=\"2\"><font color=\"%*\">%*: %*</font></stroke>"):format(v6, v7, v3, v4)) .. (if v3 < #p1 then "\n" else "")
				end
				p12.YourScore.Text = ("You Scored: %*"):format(p2)
				p12.SellLabel.Text = v1
				p22.Maid:GiveTask(v11.new(p12.RunButton, {
					Click = function() --[[ Click | Line: 441 | Upvalues: v14 (ref) ]]
						v14.Close()
					end
				}))
			end
		}
	end)
	v15.AddNotificationCallback("LeftCostumeContest", function() --[[ Line: 449 ]]
		return {
			Message = "You\'ve left the costume contest!",
			Preset = "Green"
		}
	end)
	v15.AddNotificationCallback("CostumeClashSoon", function(p1, p2) --[[ Line: 456 | Upvalues: v10 (ref) ]]
		return {
			Message = string.format("Costume Clash starting in %*! The theme is now %*!", v10.FormatStat(p1), p2)
		}
	end)
	v15.AddNotificationCallback("CostumeClashInProgress", function(p1) --[[ Line: 462 | Upvalues: v14 (ref), v10 (ref) ]]
		v14.Close()
		return {
			Preset = "Red",
			Message = ("There is a costume contest currently ongoing! Come back in %*!"):format((v10.FormatStat(p1)))
		}
	end)
	v15.AddNotificationCallback("CostumeClashCooldown", function(p1) --[[ Line: 471 | Upvalues: v14 (ref), v10 (ref) ]]
		v14.Close()
		return {
			Preset = "Red",
			Message = ("You have a %* cooldown before you can participate again! Come back soon!"):format((v10.FormatStat(p1)))
		}
	end)
	v15.AddNotificationCallback("CostumeNotEnoughPlayers", function() --[[ Line: 480 | Upvalues: v14 (ref) ]]
		v14.Close()
		return {
			Message = "Not enough players! Come back soon!",
			Preset = "Red"
		}
	end)
	v15.AddNotificationCallback("CostumeNotSubmitted", function() --[[ Line: 489 | Upvalues: v14 (ref) ]]
		v14.Close()
		return {
			Message = "You failed to submit a costume!",
			Preset = "Red"
		}
	end)
	v15.AddNotificationCallback("CostumeSubmissionSuccess", function(p1) --[[ Line: 498 ]]
		return {
			Preset = "Green",
			Message = ("You\'ve submitted %* to the contest!"):format(p1)
		}
	end)
	for i = 1, 3 do
		local v1 = VoteFrame.StarContainer:FindFirstChild("Star" .. i)
		table.insert(t2, v1)
		v12.new(v1, {
			NoHoverColor = true
		})
		v12:RegisterClick(v1, function() --[[ Line: 510 | Upvalues: v22 (ref), LocalPlayer (ref), v17 (ref), t3 (ref), i (copy), updateStars (ref), v19 (ref) ]]
			if v22 ~= LocalPlayer or v17 then
				t3[v22] = i
				updateStars()
				v19:FireServer(v22, i)
			end
		end)
	end
end
function t.Init(p1) --[[ Init | Line: 524 | Upvalues: t (copy) ]]
	t._setup()
	t._bind()
	t._connect()
end
t:Init()
return t