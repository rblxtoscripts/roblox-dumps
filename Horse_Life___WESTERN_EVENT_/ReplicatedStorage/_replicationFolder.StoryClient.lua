-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("DialogueGui")
local v4 = Sonar("Binder")
local v5 = Sonar("Maid")
local v6 = Sonar("InteractMenu")
local v7 = Sonar("MissionsService")
local v8 = Sonar("AnimalDataService")
local v9 = Sonar("ItemReplicationService")
local v10 = Sonar("AnimalCosmetics")
local v11 = Sonar("NotificationsClient")
local v12 = Sonar("DisplayAnimalClient")
local v13 = Sonar("CameraShaker")
local v14 = Sonar("ContextualUtils")
local v15 = Sonar("Constants")
local v16 = Sonar("PlaceTypeService")
local v17 = v7.GetType("StoryMissions")
local StoryLore = v15.StoryLore
local LocalPlayer = Players.LocalPlayer
local CurrentCamera = workspace.CurrentCamera
local v18 = v2.GetClient()
local v19 = v1.GetRemoteEvent("StoryIncrement")
local v20 = v1.GetRemoteFunction("GiftFoal")
local SFX = game.ReplicatedStorage.Storage.SFX
local t = {}
t.__index = t
local v21 = nil
local t2 = {
	{
		PartName = "TopCoat",
		HintName = "Top"
	},
	{
		PartName = "BottomCoat",
		HintName = "Bottom"
	},
	{
		PartName = "Hoof"
	}
}
local v22 = v5.new()
v13.new(Enum.RenderPriority.Camera.Value + 1, "StoryShaker", function(p1) --[[ Line: 51 | Upvalues: CurrentCamera (copy) ]]
	CurrentCamera.CFrame = CurrentCamera.CFrame * p1
end):Start()
local function spawnFoal(p1) --[[ spawnFoal | Line: 57 | Upvalues: v8 (copy), v18 (copy), LocalPlayer (copy), v9 (copy), v10 (copy), v22 (ref), v5 (copy), SFX (copy), Workspace (copy), v14 (copy) ]]
	local v1 = v8.CreateSlot(v18, {
		Species = "Horse",
		Preset = "LightBrown",
		Origin = "Bought",
		DoNotParent = true,
		DoNotIncrementCount = true,
		Age = 0,
		Seed = LocalPlayer.UserId
	})
	local v3 = v9.Get((v8.GetByName("Foal"))):Clone()
	local v4 = v10.new(v3, {
		InViewport = false,
		SlotValue = v1
	})
	v4.AnimalModel.HumanoidRootPart.Anchored = true
	v4.AnimalModel:ScaleTo((v8.GetScale(v1)))
	v4.AnimalModel:PivotTo(p1.Object.CFrame)
	v4.AnimalModel.Name = "StoryFoal"
	v4.AnimalModel.Parent = workspace
	local Animation = Instance.new("Animation")
	Animation.AnimationId = "rbxassetid://15841678580"
	v4.AnimalModel.AnimationController:LoadAnimation(Animation):Play()
	v22 = v5.new()
	v22:GiveTask(v1)
	v22:GiveTask(v3)
	v22:GiveTask(v4)
	local v6 = v22:GiveTask(SFX.Neigh4:Clone())
	v6.Parent = v4.AnimalModel.RootPart
	v22:GiveTask(task.spawn(function() --[[ Line: 98 | Upvalues: v4 (copy), v6 (copy) ]]
		while v4.AnimalModel and v4.AnimalModel.Parent ~= nil do
			v6:Play()
			task.wait(math.random(10, 15))
		end
	end))
	if p1.Object:IsDescendantOf(Workspace) then
		v14.SetGuiWorldspacePointTo(v4.AnimalModel.RootPart.Position, nil, "Head to the Foal!")
	end
	return v4, v1, v3
end
local v23 = nil
v23 = {
	FindClues = {
		Setup = function(p1) --[[ Setup | Line: 114 | Upvalues: v6 (copy), v14 (copy), v19 (copy), v23 (ref) ]]
			local v1 = p1.Object.Parent.Particles.MoonDust:Clone()
			local v2 = p1.Object.Parent.Particles.SunRays:Clone()
			v1.Parent = p1.Object
			v2.Parent = p1.Object
			p1.Maid:GiveTask(v1)
			p1.Maid:GiveTask(v2)
			p1.Maid:GiveTask(v6.new(p1.Object, {
				ShowHintLabel = true,
				Hint = "Clue",
				Run = function() --[[ Run | Line: 126 | Upvalues: v14 (ref), p1 (copy), v19 (ref), v23 (ref) ]]
					v14.SetGuiWorldspacePointTo()
					if p1.Object:FindFirstChild("IncrementMission") then
						v19:FireServer(p1.Object.Name)
						v23[p1.Type].Run(p1)
					end
				end,
				GetRange = function() --[[ GetRange | Line: 138 ]]
					return 50
				end,
				Visibility = function() --[[ Visibility | Line: 141 | Upvalues: v23 (ref), p1 (copy), v1 (copy), v2 (copy) ]]
					local v12 = v23[p1.Type].Check(p1)
					if v12 == true then
						v1.Enabled = true
						v2.Enabled = true
					else
						v1.Enabled = false
						v2.Enabled = false
					end
					return v12
				end
			}))
		end,
		Check = function(p1) --[[ Check | Line: 159 ]]
			if not p1.Mission then
				return false
			end
			if p1.DataFolder.Completed.Value then
				return false
			end
			if not p1.DataFolder.Started.Value then
				return false
			end
			if "Clue" .. p1.Mission.Amount.Value + 1 == p1.Object.Name then
				return true
			end
		end,
		Run = function(p1) --[[ Run | Line: 169 | Upvalues: t (copy) ]]
			t.RunDialog(p1.Object)
		end
	},
	FindStatue = {
		Setup = function(p1) --[[ Setup | Line: 175 | Upvalues: v6 (copy), v19 (copy), v23 (ref) ]]
			local v1 = p1.Object.Parent.Particles.MoonDust:Clone()
			local v2 = p1.Object.Parent.Particles.SunRays:Clone()
			v1.Parent = p1.Object
			v2.Parent = p1.Object
			p1.Maid:GiveTask(v1)
			p1.Maid:GiveTask(v2)
			p1.Maid:GiveTask(v6.new(p1.Object, {
				ShowHintLabel = true,
				Hint = "Inspect",
				Run = function() --[[ Run | Line: 187 | Upvalues: p1 (copy), v19 (ref), v23 (ref) ]]
					if p1.Object:FindFirstChild("IncrementMission") then
						v19:FireServer(p1.Object.Name)
						v23[p1.Type].Run(p1)
					end
				end,
				GetRange = function() --[[ GetRange | Line: 198 ]]
					return 50
				end,
				Visibility = function() --[[ Visibility | Line: 201 | Upvalues: v23 (ref), p1 (copy), v1 (copy), v2 (copy) ]]
					local v12 = v23[p1.Type].Check(p1)
					if v12 == true then
						v1.Enabled = true
						v2.Enabled = true
					else
						v1.Enabled = false
						v2.Enabled = false
					end
					return v12
				end
			}))
		end,
		Check = function(p1) --[[ Check | Line: 219 ]]
			if not p1.Mission then
				return false
			end
			if p1.DataFolder.Completed.Value then
				return false
			end
			if not p1.DataFolder.Started.Value then
				return false
			end
			if p1.DataFolder.Missions[tonumber(p1.Mission.Name) - 1] and not p1.DataFolder.Missions[tonumber(p1.Mission.Name) - 1].Value then
				return false
			end
			if "Statue" .. p1.Mission.Amount.Value + 1 == p1.Object.Name then
				return true
			end
		end,
		Run = function(p1) --[[ Run | Line: 230 | Upvalues: t (copy) ]]
			t.RunDialog(p1.Object)
		end
	},
	InspectFoal = {
		Setup = function(p1) --[[ Setup | Line: 237 | Upvalues: v23 (ref) ]]
			if not p1.Mission then
				return false
			end
			if p1.DataFolder.Completed.Value then
				return false
			end
			if not p1.DataFolder.Started.Value then
				return false
			end
			if p1.Mission.Value then
				return false
			end
			local v2 = tonumber(p1.Mission.Name)
			if p1.DataFolder.Missions[v2 - 1] and not p1.DataFolder.Missions[v2 - 1].Value then
				p1.Maid:GiveTask(p1.DataFolder.Missions[v2 - 1]:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 247 | Upvalues: v23 (ref), p1 (copy) ]]
					v23[p1.Type].Run(p1, v23)
				end))
				return false
			end
			p1.Maid:GiveTask(p1.Mission:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 254 | Upvalues: p1 (copy) ]]
				if p1.ChatMaid then
					return
				end
				p1.ChatMaid:DoCleaning()
				p1.ChatMaid = nil
			end))
			v23[p1.Type].Run(p1)
		end,
		Check = function(p1, p2) --[[ Check | Line: 265 ]]
			return p1.Mission.Amount.Value + 1 == p2
		end,
		Run = function(p1) --[[ Run | Line: 273 | Upvalues: spawnFoal (copy), v5 (copy), t2 (copy), v6 (copy), v14 (copy), v19 (copy), t (copy), v23 (ref) ]]
			local v1 = spawnFoal(p1)
			p1.ChatMaid = v5.new()
			p1.Maid:GiveTask(p1.ChatMaid)
			for v2, v3 in t2 do
				local v52 = v1.AnimalModel:FindFirstChild(v3.PartName)
				local t3 = {
					ShowHintLabel = true,
					Run = function() --[[ Run | Line: 282 | Upvalues: p1 (copy), v14 (ref), v19 (ref), t (ref), v3 (copy) ]]
						if p1.Object:FindFirstChild("IncrementMission") then
							v14.SetGuiWorldspacePointTo()
							v19:FireServer(p1.Object.Name)
							t.RunDialog(p1.Object, v3.PartName)
						end
					end,
					GetRange = function() --[[ GetRange | Line: 294 ]]
						return 10
					end,
					Visibility = function() --[[ Visibility | Line: 297 | Upvalues: v23 (ref), p1 (copy), v2 (copy) ]]
						return v23[p1.Type].Check(p1, v2)
					end
				}
				t3.Hint = "Inspect " .. (v3.HintName or v3.PartName)
				p1.ChatMaid:GiveTask(v6.new(v52, t3))
			end
		end
	},
	TalkToHorse = {
		Setup = function(p1) --[[ Setup | Line: 308 | Upvalues: v23 (ref) ]]
			if not p1.Mission then
				return false
			end
			if p1.DataFolder.Completed.Value then
				return false
			end
			if not p1.DataFolder.Started.Value then
				return false
			end
			if p1.Mission.Value then
				return false
			end
			local v2 = tonumber(p1.Mission.Name)
			if p1.DataFolder.Missions[v2 - 1] and not p1.DataFolder.Missions[v2 - 1].Value then
				p1.Maid:GiveTask(p1.DataFolder.Missions[v2 - 1]:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 318 | Upvalues: v23 (ref), p1 (copy) ]]
					v23[p1.Type].Run(p1)
				end))
				return false
			end
			v23[p1.Type].Run(p1)
		end,
		Check = function(p1) --[[ Check | Line: 328 ]]
			return not p1.Mission.Value
		end,
		Run = function(p1) --[[ Run | Line: 332 | Upvalues: spawnFoal (copy), v6 (copy), v14 (copy), v19 (copy), t (copy), v23 (ref) ]]
			if workspace:FindFirstChild("StoryFoal") then
				workspace:FindFirstChild("StoryFoal")
			else
				local AnimalModel = spawnFoal(p1).AnimalModel
			end
			p1.Maid:GiveTask(v6.new(p1.Object, {
				ShowHintLabel = true,
				Hint = "Talk to Foal",
				Run = function() --[[ Run | Line: 344 | Upvalues: p1 (copy), v14 (ref), v19 (ref), t (ref) ]]
					if p1.Object:FindFirstChild("IncrementMission") then
						v14.SetGuiWorldspacePointTo()
						v19:FireServer(p1.Object.Name)
						t.RunDialog(p1.Object, "HorseDialogue")
					end
				end,
				GetRange = function() --[[ GetRange | Line: 357 ]]
					return 50
				end,
				Visibility = function() --[[ Visibility | Line: 360 | Upvalues: v23 (ref), p1 (copy) ]]
					return v23[p1.Type].Check(p1)
				end
			}))
		end
	},
	FeedFoal = {
		Setup = function(p1) --[[ Setup | Line: 370 | Upvalues: v23 (ref) ]]
			if not p1.Mission then
				return false
			end
			if p1.DataFolder.Completed.Value then
				return false
			end
			if not p1.DataFolder.Started.Value then
				return false
			end
			if p1.Mission.Value then
				return false
			end
			local v2 = tonumber(p1.Mission.Name)
			if p1.DataFolder.Missions[v2 - 1] and not p1.DataFolder.Missions[v2 - 1].Value then
				p1.Maid:GiveTask(p1.DataFolder.Missions[v2 - 1]:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 380 | Upvalues: v23 (ref), p1 (copy) ]]
					v23[p1.Type].Run(p1, v23)
				end))
				return false
			end
			v23[p1.Type].Run(p1)
		end,
		Check = function(p1) --[[ Check | Line: 391 ]]
			return not p1.Mission.Value
		end,
		Run = function(p1) --[[ Run | Line: 395 | Upvalues: spawnFoal (copy), v6 (copy), v18 (copy), v14 (copy), v20 (copy), SFX (copy), v22 (ref), v12 (copy), v11 (copy), v23 (ref) ]]
			if workspace:FindFirstChild("StoryFoal") then
				workspace:FindFirstChild("StoryFoal")
			else
				local AnimalModel = spawnFoal(p1).AnimalModel
			end
			p1.Maid:GiveTask(v6.new(p1.Object, {
				ShowHintLabel = true,
				Hint = "Feed Foal",
				Run = function() --[[ Run | Line: 407 | Upvalues: v18 (ref), p1 (copy), v14 (ref), v20 (ref), SFX (ref), v22 (ref), v12 (ref), v11 (ref) ]]
					local EquippedTool = v18.EquippedTool
					if EquippedTool and EquippedTool.ToolData.ItemType == "Food" then
						if not p1.Object:FindFirstChild("IncrementMission") then
							return
						end
						v14.SetGuiWorldspacePointTo()
						local v1 = v20:InvokeServer(p1.Object.Name, EquippedTool.ToolData.Name)
						local v2 = p1.Maid:GiveTask(SFX.Feed:Clone())
						v2.Parent = p1.Object
						v2:Play()
						if not v1 then
							return
						end
						v22:DoCleaning()
						v12:DisplaySlot({
							Type = "StoreLore",
							AllowNaming = true,
							ShowMaxWarning = true,
							MobileClickBackgroundToClose = false,
							Slot = v18:GetItemFolder("Animals"):WaitForChild(v1)
						})
						return
					end
					v11.Notify({
						Message = "You need to be holding food!",
						Preset = "Red"
					})
				end,
				GetRange = function() --[[ GetRange | Line: 441 ]]
					return 50
				end,
				Visibility = function() --[[ Visibility | Line: 444 | Upvalues: v23 (ref), p1 (copy) ]]
					return v23[p1.Type].Check(p1)
				end
			}))
		end
	},
	LocateAetheris = {
		Setup = function(p1) --[[ Setup | Line: 453 | Upvalues: SFX (copy), v23 (ref) ]]
			if not p1.Mission then
				return false
			end
			if p1.DataFolder.Completed.Value then
				return false
			end
			if not p1.DataFolder.Started.Value then
				return false
			end
			if p1.Mission.Value then
				return false
			end
			local v2 = tonumber(p1.Mission.Name)
			local v3 = p1.Maid:GiveTask(SFX.Crystal:Clone())
			v3.Parent = p1.Object.Parent:FindFirstChild("AetherisSpawn")
			v3:Play()
			if p1.DataFolder.Missions[v2 - 1] and not p1.DataFolder.Missions[v2 - 1].Value then
				p1.Maid:GiveTask(p1.DataFolder.Missions[v2 - 1]:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 466 | Upvalues: p1 (copy), v23 (ref) ]]
					p1.Completed = false
					v23[p1.Type].Run(p1, v23)
				end))
				return false
			end
			v23[p1.Type].Run(p1)
		end,
		Check = function(p1) --[[ Check | Line: 477 ]]
			return not p1.Completed
		end,
		Run = function(p1) --[[ Run | Line: 481 | Upvalues: ReplicatedStorage (copy), v6 (copy), t (copy), v19 (copy), v22 (ref), v21 (ref), Workspace (copy), v14 (copy), v23 (ref) ]]
			local function EndFunction() --[[ EndFunction | Line: 482 | Upvalues: ReplicatedStorage (ref), p1 (copy), v6 (ref), t (ref), v19 (ref), v22 (ref), v21 (ref) ]]
				local v1 = ReplicatedStorage.Storage.Assets:FindFirstChild("Aetheris"):Clone()
				v1.Parent = workspace
				local Animation = Instance.new("Animation")
				Animation.AnimationId = "rbxassetid://16138403342"
				local Animation_2 = Instance.new("Animation")
				Animation_2.AnimationId = "rbxassetid://15841722583"
				local Animation_3 = Instance.new("Animation")
				Animation_3.AnimationId = "rbxassetid://16139256552"
				local Animation_4 = Instance.new("Animation")
				Animation_4.AnimationId = "rbxassetid://15841678580"
				local v2 = v1.NPC.Humanoid.Animator:LoadAnimation(Animation)
				v2:Play()
				local v3 = v1.NPC.Humanoid.Animator:LoadAnimation(Animation_2)
				local v4 = v1.NPC.Humanoid.Animator:LoadAnimation(Animation_3)
				local v5 = v1.NPC.Humanoid.Animator:LoadAnimation(Animation_4)
				p1.Maid:GiveTask(v1)
				p1.Maid:GiveTask(Animation)
				p1.Maid:GiveTask(Animation_2)
				p1.Maid:GiveTask(Animation_3)
				p1.Maid:GiveTask(Animation_4)
				p1.Maid:GiveTask(v2)
				p1.Maid:GiveTask(v3)
				p1.Maid:GiveTask(v4)
				p1.Maid:GiveTask(v5)
				p1.Maid:GiveTask(v6.new(p1.Object, {
					ShowHintLabel = true,
					Hint = "Whats this?",
					Run = function() --[[ Run | Line: 521 | Upvalues: v3 (copy), v4 (copy), v5 (copy), t (ref), p1 (ref), v19 (ref), v22 (ref), v21 (ref), ReplicatedStorage (ref) ]]
						task.delay(1, function() --[[ Line: 524 | Upvalues: v3 (ref) ]]
							v3:Play()
						end)
						task.delay(2, function() --[[ Line: 528 | Upvalues: v4 (ref) ]]
							v4:Play()
						end)
						task.delay(3, function() --[[ Line: 532 | Upvalues: v5 (ref) ]]
							v5:Play()
						end)
						t.RunDialog(p1.Object, nil, function() --[[ Line: 536 | Upvalues: v19 (ref), p1 (ref), v22 (ref), v21 (ref), ReplicatedStorage (ref) ]]
							v19:FireServer(p1.Object.Name)
							v22:DoCleaning()
							p1.Maid:DoCleaning()
							v21.Parent = ReplicatedStorage.Storage.Assets.Chapters[v21.Chapter.Value].Stories
							v21 = nil
						end, "LookVector")
					end,
					GetRange = function() --[[ GetRange | Line: 548 ]]
						return 25
					end,
					Visibility = function() --[[ Visibility | Line: 551 | Upvalues: p1 (ref) ]]
						return p1.Completed
					end
				}))
			end
			if p1.Object:IsDescendantOf(Workspace) then
				v14.SetGuiWorldspacePointTo(p1.Object.Parent:FindFirstChild("AetherisSpawn"), nil, "Go to the Crystal")
			end
			p1.Maid:GiveTask(v6.new(p1.Object.Parent:FindFirstChild("AetherisSpawn"), {
				ShowHintLabel = true,
				Hint = "Whats this?",
				Run = function() --[[ Run | Line: 565 | Upvalues: t (ref), p1 (copy), EndFunction (copy), v14 (ref) ]]
					t.RunDialog(p1.Object.Parent:FindFirstChild("AetherisSpawn"))
					p1.Completed = true
					EndFunction()
					v14.SetGuiWorldspacePointTo()
				end,
				GetRange = function() --[[ GetRange | Line: 577 ]]
					return 50
				end,
				Visibility = function() --[[ Visibility | Line: 580 | Upvalues: v23 (ref), p1 (copy) ]]
					return v23[p1.Type].Check(p1)
				end
			}))
		end
	}
}
function t.RunDialog(p1, p2, p3, p4) --[[ RunDialog | Line: 590 | Upvalues: StoryLore (copy), v3 (copy), LocalPlayer (copy), SFX (copy) ]]
	local v32 = StoryLore[if p2 then p2 else p1.Name]
	if not v32 then
		return
	end
	local t = {}
	if typeof(v32.Choice) == "string" then
		t = {
			{
				Text = v32.Choice,
				OnRun = function(p1) --[[ OnRun | Line: 600 | Upvalues: v3 (ref) ]]
					v3.Stop()
				end
			}
		}
	elseif typeof(v32.Choice) == "table" then
		t = v32.Choice
	end
	local Text = v32.Text
	if typeof(Text) == "string" then
		Text = { Text }
	end
	local v4 = v32.Name or "Mysterious Stranger"
	if v4 == "Player" then
		v4 = LocalPlayer.DisplayName
	end
	local t2 = {
		Target = p1:FindFirstChild("CameraPart") or p1,
		Name = v4,
		Dialog = Text,
		Choices = t,
		CameraMode = p4,
		OnEnd = function(p1) --[[ OnEnd | Line: 625 | Upvalues: p3 (copy) ]]
			if not p3 then
				return
			end
			p3()
		end
	}
	SFX.Paper:Play()
	v3.Start(t2)
end
local v24 = v5.new()
function t.ParentStoryFolder(p1, p2, p3) --[[ ParentStoryFolder | Line: 638 | Upvalues: v24 (copy), v14 (copy), v21 (ref), ReplicatedStorage (copy), LocalPlayer (copy) ]]
	v24:DoCleaning()
	v14.SetGuiWorldspacePointTo()
	if v21 then
		v21.Parent = ReplicatedStorage.Storage.Assets.Chapters[v21.Chapter.Value].Stories
	end
	local v1 = ReplicatedStorage.Storage.Assets.Chapters[p1].Stories:FindFirstChild(p2)
	if v1 then
		v1.Parent = workspace
		v21 = v1
		if p1 == 1 and (p2 == 1 and p3 == 1) then
			v14.SetGuiWorldspacePointTo(v1.CenterPoint.Position, nil, "Head to the portal!")
			v24:GiveTask(v1.CenterPoint.Touched:Connect(function(p1) --[[ Line: 656 | Upvalues: LocalPlayer (ref), v14 (ref), v24 (ref) ]]
				if not p1:IsDescendantOf(LocalPlayer.Character) then
					return
				end
				v14.SetGuiWorldspacePointTo()
				v24:DoCleaning()
			end))
		end
	else
		warn("No asset folder can be found for Chapter", p1, "Story", p2)
	end
end
function t.IsStoryRunning() --[[ IsStoryRunning | Line: 668 | Upvalues: v21 (ref) ]]
	return v21
end
function t.new(p1) --[[ new | Line: 672 | Upvalues: t (copy), v5 (copy), v18 (copy), v17 (copy), Workspace (copy), v22 (ref), v23 (ref) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v5.new()
	v2.Object = p1
	v2.Object.Transparency = 1
	local IncrementMission = v2.Object:FindFirstChild("IncrementMission")
	v2.Type = IncrementMission and IncrementMission.Value or v2.Object.Name
	local Chapter = v2.Object.Parent.Chapter.Value
	local v4 = v2.Object.Parent.Name
	v2.DataFolder = v18.PlayerData.Missions.StoryMissions[Chapter].Stories[v4]
	local v52 = v17.Chapters[tonumber(Chapter)].Stories[tonumber(v4)]
	if v2.Type then
		if v52 then
			for v6, v7 in v52.Missions do
				if v7.Type == v2.Type then
					v2.Index = v6
					break
				end
			end
		end
		if v2.Index then
			v2.Mission = v2.DataFolder.Missions[v2.Index]
		end
	end
	v2.Object.Parent:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 728 | Upvalues: v2 (copy), Workspace (ref), v22 (ref), v23 (ref) ]]
		v2.Maid:DoCleaning()
		if not v2.Object:IsDescendantOf(Workspace) then
			v22:DoCleaning()
			return
		end
		if v23[v2.Type] then
			v23[v2.Type].Setup(v2, v23)
		end
	end)
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 746 ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
function t.Init(p1) --[[ Init | Line: 755 | Upvalues: v16 (copy), v15 (copy), v18 (copy), v4 (copy), t (copy) ]]
	if v16.IsMarketWorld() or v15.IsEventWorld and not v15.MainWorldIsEventWorld or v16.IsCompHub() then
		return
	end
	v4.new("StoryLore", t):Init()
	for v1, v2 in v18.PlayerData.Missions.StoryMissions:GetChildren() do
		for v3, v42 in v2.Stories:GetChildren() do
			local function getCurrentMission() --[[ getCurrentMission | Line: 769 | Upvalues: v42 (copy) ]]
				local v1 = 1
				for v2, v3 in v42.Missions:GetChildren() do
					local v5 = tonumber(v3.Name)
					if v5 then
						local v6 = v5 + 1
						if v3.Value and v1 < v6 then
							v1 = v6
						end
					end
				end
				return v1
			end
			local function check() --[[ check | Line: 786 | Upvalues: v42 (copy), t (ref), v1 (copy), v3 (copy), getCurrentMission (copy) ]]
				if not v42.Started.Value or v42.Completed.Value then
					return
				end
				t.ParentStoryFolder(v1, v3, (getCurrentMission()))
			end
			if v42.Started.Value and not v42.Completed.Value then
				t.ParentStoryFolder(v1, v3, (getCurrentMission()))
			end
			v42.Started:GetPropertyChangedSignal("Value"):Connect(check)
		end
	end
end
t:Init()
return t