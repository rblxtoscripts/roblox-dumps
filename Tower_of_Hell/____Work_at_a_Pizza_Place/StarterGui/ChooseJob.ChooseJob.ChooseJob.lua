-- https://lua.expert/
local v1 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local Debug = require(game.ReplicatedStorage:WaitForChild("Debug"))
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local FriendJoiner = require(game.ReplicatedStorage:WaitForChild("FriendJoiner"))
local v2 = Library:Load("Events")
local v3 = Library:Load("Utility")
Library:Load("WaitEvent")
local v4 = Library:Load("SoundFX")
local v5 = Library:Load("Network")
game:GetService("GuiService"):WaitForChild("ScreenshotHud").ExperienceNameOverlayEnabled = false
local LocalPlayer = game.Players.LocalPlayer
if v1.IsPartyServer or v1.PlaceSettings.SkipIntro then
	if not v1.PlaceSettings.CustomSpawnLocation then
		_G.StartedPlaying = true
		_G.ChoosingJob = false
		v2:Fire("StartedPlaying")
		script.Parent:Destroy()
		return
	end
	local CustomSpawnLocation = v1.PlaceSettings.CustomSpawnLocation
	local v6 = workspace._SpawnLocations.Custom:FindFirstChild(CustomSpawnLocation)
	jobs = {}
	local v7 = jobs
	table.insert(v7, 1, {
		CustomSpawnLocation,
		1,
		v6,
		v6.CFrame
	})
	v3:SendData("TeleportToJob", "PlayerChannel", nil, CustomSpawnLocation)
	_G.StartedPlaying = true
	_G.ChoosingJob = false
	v2:Fire("StartedPlaying")
else
	if (not Debug.Enabled or Debug.IntroEnabled) and v1.IntroSequenceEnabled then
		if v1.IsNormalServer or v1.IsVoiceChatServer then
			spawn(function() --[[ Line: 61 | Upvalues: v1 (copy), FriendJoiner (copy), v3 (copy) ]]
				local LocalPlayer = game.Players.LocalPlayer
				local v12, v2 = pcall(function() --[[ Line: 63 | Upvalues: LocalPlayer (copy) ]]
					return game:GetService("VoiceChatService"):IsVoiceEnabledForUserIdAsync(LocalPlayer.UserId)
				end)
				if v1.IsNormalServer and (v12 and v2) then
					local v32 = script.Parent
					v32.Parent:WaitForChild("Play"):WaitForChild("VoiceChat").Visible = true
					v32.Parent.Play.RedArrow.Visible = true
					v32.Parent.Play.VoiceChat:WaitForChild("Join").MouseButton1Click:Connect(function() --[[ Line: 70 | Upvalues: v1 (ref), FriendJoiner (ref), LocalPlayer (copy) ]]
						local PizzaPlaceVoiceChatId = v1.PizzaPlaceVoiceChatId
						if v1.IsTestPlace then
							PizzaPlaceVoiceChatId = v1.PizzaPlaceVoiceChatTestId
						end
						FriendJoiner:Show(LocalPlayer, PizzaPlaceVoiceChatId)
					end)
					return
				end
				if v1.IsVoiceChatServer and not (v12 and v2) then
					v3:SendData("TeleportToPlace", "PlayerChannel", nil, v1.MainPlaceId)
					return
				end
				if v12 and not v2 then
					print("Voice chat not enabled")
					return
				end
				if v12 then
					return
				end
				print("VOICECHATSERVICE error")
			end)
		end
		local CurrentCamera = workspace.CurrentCamera
		local v8 = script.Parent
		local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
		PlayerGui:WaitForChild("MainGui")
		local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
		local v9 = require(game.ReplicatedStorage:WaitForChild("Enums"))
		local v10 = Library:Load("Utility")
		require(game.ReplicatedStorage:WaitForChild("Dialog"))
		local v11 = GuiManager:GetWindowDataByName("Backpack")
		local v12 = GuiManager:GetWindowDataByName("ChatWindow")
		local v13 = GuiManager:GetWindowDataByName("PlayerList")
		local v14 = GuiManager:GetWindowDataByName("Menu")
		local ContextActionService = game:GetService("ContextActionService")
		local Play = v8.Parent:WaitForChild("Play"):WaitForChild("Play")
		local GameDisplay = v8.Parent.Play:WaitForChild("GameDisplay")
		GameDisplay:WaitForChild("Play")
		GameDisplay:WaitForChild("GameIcon")
		GameDisplay:WaitForChild("GameName")
		local Chooser = v8:WaitForChild("Chooser")
		local AButton = Chooser:WaitForChild("AButton")
		local Next = Chooser:WaitForChild("Next")
		local Previous = Chooser:WaitForChild("Previous")
		local Choose = Chooser:WaitForChild("Choose")
		local v15 = GuiManager:RegisterWindow(v8)
		v4:Preload("Music/ThemeSong")
		workspace.Main.StartedPlaying.OnClientEvent:connect(function() --[[ Line: 127 | Upvalues: v15 (copy), v2 (copy), LocalPlayer (copy), CurrentCamera (copy) ]]
			wait()
			tick()
			v15:SetVisible(false)
			_G.StartedPlaying = true
			v2:Fire("StartedPlaying")
			if not LocalPlayer.Character:WaitForChild("Humanoid", 1) then
				spawn(function() --[[ Line: 138 ]]
					error("Humanoid does not exist")
				end)
			end
			CurrentCamera.CameraType = Enum.CameraType.Custom
			LocalPlayer.Character.Humanoid.WalkSpeed = game.StarterPlayer.CharacterWalkSpeed
			delay(0.3, function() --[[ Line: 161 ]]
				workspace.Main.FadeOutBlack:Fire(0.8)
			end)
		end)
		local v16 = nil
		local v17 = false
		spawn(function() --[[ Line: 171 | Upvalues: Debug (copy), v17 (ref), CurrentCamera (copy) ]]
			if Debug.Enabled and not Debug.IntroEnabled then
				return
			end
			while not v17 do
				CurrentCamera.CameraType = "Scriptable"
				CurrentCamera.CoordinateFrame = CFrame.new(47.434, 6.956, 217.24)
				CurrentCamera.Focus = workspace.FrontDoor.CFrame
				wait(0.1)
			end
		end)
		if not Debug.Enabled or Debug.IntroEnabled then
			v11:SetVisible(false)
			v13:SetVisible(false)
			v12:SetVisible(false)
			v14:SetVisible(false)
		end
		_G.Skip = false
		_G.IntroStarted = false
		_G.ChoosingJob = true
		local Loading = script.Parent.Parent.Loading
		Loading.Visible = true
		spawn(function() --[[ Line: 211 | Upvalues: Debug (copy), Loading (copy) ]]
			if Debug.Enabled and not Debug.IntroEnabled then
				return
			end
			local count = 0
			while _G.IsNewPlayer == nil do
				Loading.TextLabel.Text = "Loading" .. string.rep(".", count % 4)
				task.wait(0.5)
				count = count + 1
			end
		end)
		local v18 = workspace.Main.GetPlayerInfo:InvokeServer()
		_G.IsNewPlayer = v18
		Loading.Visible = false
		jobs = {
			{
				"Cashier",
				21,
				workspace.Focuses.CashierFocus,
				CFrame.new(64.3526154, 12.9045506, 77.2645416)
			},
			{
				"Cook",
				24,
				workspace.Focuses.CookFocus,
				CFrame.new(23.0893536, 11.8223886, 70.4057999)
			},
			{
				"Pizza Boxer",
				106,
				workspace.Focuses.BoxerFocus,
				CFrame.new(47.1844292, 12.1402969, 5.29981661)
			},
			{
				"Delivery",
				23,
				workspace.Focuses.DeliveryFocus,
				CFrame.new(75.0271759, 14.1454096, -27.2053604)
			},
			{
				"Supplier",
				1,
				workspace.Focuses.SupplierFocus,
				CFrame.new(33.5457458, 23.495554, -1008.54919)
			},
			{ "House", 194, nil, nil }
		}
		if (if game.ReplicatedStorage.GlobalData.Holiday.Value == "Halloween" then true else false) and not v18 then
			if v9.IsTrickOrTreatServer then
				jobs = {}
				local v20 = jobs
				table.insert(v20, 1, {
					"Trick-or-Treat",
					1,
					workspace.StreetMiddle,
					CFrame.new(-6.98126984, 8.9656992, -562.780396)
				})
			end
			local v21 = if v9.IsTrickOrTreatServer then 2 else 1
			if workspace.Halloween:FindFirstChild("TeleporterBoat") then
				local v22 = jobs
				table.insert(v22, v21, {
					"Maze of Terror",
					1,
					workspace.Halloween.TeleporterBoat.BoatBottom,
					CFrame.new(-364.055206, 6.60782766, -336.277161)
				})
			end
		end
		local customEventSpawn = game.ReplicatedStorage._v6FiRE_Additions.customEventSpawn
		if customEventSpawn.spawnActive.Value then
			local spawnIndex = customEventSpawn.spawnIndex.Value
			table.insert(jobs, spawnIndex, {
				customEventSpawn.spawnName.Value,
				spawnIndex,
				customEventSpawn.spawnFocus.Value:Clone(),
				customEventSpawn.cameraCFrame.Value
			})
		end
		index = #jobs
		local t = {
			House3 = true,
			House4 = true,
			House7 = true,
			House8 = true,
			House11 = true,
			House12 = true
		}
		house = nil
		spawn(function() --[[ Line: 295 | Upvalues: LocalPlayer (copy) ]]
			while house == nil do
				wait(0.1)
				for i, v in ipairs(workspace.Houses:GetChildren()) do
					if v.Owner.Value == LocalPlayer then
						house = v
						break
					end
				end
			end
		end)
		local v25 = Debug.Enabled and Debug.JobTransitionSpeed or 1.3
		local v26 = false
		local t2 = {
			Cashier = {
				Difficulty = "Easy",
				Color = Color3.fromRGB(0, 179, 255)
			},
			Cook = {
				Difficulty = "Hard",
				Color = Color3.fromRGB(203, 0, 0)
			},
			["Pizza Boxer"] = {
				Difficulty = "Medium",
				Color = Color3.fromRGB(223, 179, 0)
			},
			Delivery = {
				Difficulty = "Medium",
				Color = Color3.fromRGB(223, 179, 0)
			},
			Supplier = {
				Difficulty = "Hard",
				Color = Color3.fromRGB(203, 0, 0)
			}
		}
		function buttonPress(p1) --[[ buttonPress | Line: 322 | Upvalues: CurrentCamera (copy), v25 (copy), t (copy), v26 (ref), AButton (copy), Choose (copy), v18 (copy), t2 (copy) ]]
			CurrentCamera.CameraType = "Scriptable"
			if p1 then
				index = index + 1
				if index == #jobs + 1 then
					index = 1
				end
			else
				index = index - 1
				if index == 0 then
					index = #jobs
				end
			end
			if jobs[index][1] == "House" and house == nil then
				buttonPress(p1)
				return
			end
			local v1 = jobs[index]
			if v1[1] == "House" then
				if house.CurrentUpgrade.Value then
					local v2 = house.CurrentUpgrade.Value.GivePizza.CFrame + Vector3.new(20, 5, 20)
					if t[house] then
						v2 = house.CurrentUpgrade.Value.GivePizza.CFrame + Vector3.new(-20, 5, 20)
					end
					CurrentCamera:Interpolate(v2, house.CurrentUpgrade.Value.Doors.FrontDoorMain.Door_Closed.Door.CFrame, v25)
				end
			else
				CurrentCamera:Interpolate(v1[4], v1[3].CFrame, v25)
			end
			local JobName = script.Parent.JobName
			script.Parent:WaitForChild("Lock").Visible = false
			v26 = false
			if _G.GamepadEnabled then
				AButton.Visible = true
			else
				Choose.Visible = true
			end
			JobName:TweenPosition(UDim2.new(1, 0, 0.7, -20), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, v25 / 2, true)
			wait(v25 / 2)
			if v1[1] == "House" or not (v18 and t2[v1[1]]) then
				JobName.Difficulty.Visible = false
			else
				JobName.Difficulty.TextLabel.Text = t2[v1[1]].Difficulty
				JobName.Difficulty.TextLabel.TextColor3 = t2[v1[1]].Color
				JobName.Difficulty.Visible = true
			end
			JobName.name.Text = v1[1]
			JobName.name.TextColor3 = BrickColor.new(1).Color
			JobName.Position = UDim2.new(-0.3, 0, 0.7, -20)
			JobName:TweenPosition(UDim2.new(0.35, 0, 0.7, -20), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, v25 / 2, true)
			wait(v25 / 2)
		end
		function telespawn() --[[ telespawn | Line: 401 | Upvalues: v26 (ref), v11 (copy), v13 (copy), v14 (copy), v12 (copy), GuiManager (copy), v15 (copy), v10 (copy), CurrentCamera (copy), v2 (copy), LocalPlayer (copy) ]]
			if v26 then
				return
			end
			game:GetService("UserInputService")
			v11:SetVisible(true)
			v13:SetVisible(true)
			v14:SetVisible(true)
			v12:SetVisible(true)
			GuiManager:TouchControlsEnabled(true)
			v15:SetVisible(false)
			local v1 = jobs[index]
			_G.FirstJobIndex = index
			_G.FirstJobName = v1[1]
			workspace.Main.FadeInBlack:Fire(0.5)
			wait(0.5)
			if v1[1] == "House" then
				v10:SendData("TeleportToJob", "PlayerChannel", nil, "House")
			else
				v10:SendData("TeleportToJob", "PlayerChannel", nil, v1[1])
			end
			_G.ChoosingJob = false
			wait(5)
			if CurrentCamera.CameraType == Enum.CameraType.Custom then
				return
			end
			v15:SetVisible(false)
			_G.StartedPlaying = true
			v2:Fire("StartedPlaying")
			CurrentCamera.CameraType = Enum.CameraType.Custom
			workspace.Main.FadeOutBlack:Fire(0.8)
			LocalPlayer.Character.Humanoid.WalkSpeed = game.StarterPlayer.CharacterWalkSpeed
		end
		function distance(p1, p2) --[[ distance | Line: 463 ]]
			return (p1 - p2).magnitude
		end
		Next.MouseButton1Click:connect(function() --[[ Line: 469 ]]
			buttonPress(true)
		end)
		Previous.MouseButton1Click:connect(function() --[[ Line: 470 ]]
			buttonPress(false)
		end)
		Choose.MouseButton1Click:connect(function() --[[ Line: 471 ]]
			telespawn()
		end)
		if not Debug.Enabled or Debug.IntroEnabled then
			GuiManager:TouchControlsEnabled(false)
			if not _G.GamepadEnabled and (game.ReplicatedStorage.GlobalData.EventPlaceInfo.PlaceId.Value ~= 0 and (v9.IsTestPlace or not _G.IsNewPlayer)) then
				GuiManager:GetWindowDataByName("PlaceEventTeleporter"):SetVisible(true)
				wait(1)
			end
			Play.Parent.Visible = true
			if v9.GamepadEnabled then
				Play.Visible = false
				Play.Parent:WaitForChild("AButton").Visible = true
				if v9.IsTestPlace and v9.IsOnline or Debug.Enabled and Debug.IntroEnabled then
					while #game:GetService("UserInputService"):GetConnectedGamepads() == 0 do
						script.Parent.Parent:WaitForChild("PlugInGamepad").Visible = true
						wait(0.3)
					end
					script.Parent.Parent:WaitForChild("PlugInGamepad").Visible = false
				end
				game:GetService("GuiService").GuiNavigationEnabled = false
				local v27 = nil
				v27 = game:GetService("UserInputService").InputBegan:Connect(function(p1) --[[ Line: 524 | Upvalues: v27 (ref), v17 (ref) ]]
					if p1.KeyCode ~= Enum.KeyCode.ButtonA then
						return
					end
					v27:Disconnect()
					v17 = true
				end)
			end
			v16 = Play.MouseButton1Click:connect(function() --[[ Line: 582 | Upvalues: v16 (ref), v17 (ref) ]]
				v16:disconnect()
				v16 = nil
				v17 = true
			end)
			while not v17 do
				wait(0.1)
			end
			v5:FireServer("PlayButtonPressed")
			ContextActionService:UnbindAction("StartGame")
			ContextActionService:UnbindAction("PlayDisplayGame")
			if v16 then
				v16:disconnect()
			end
		end
		Play.Parent:Destroy()
		if not Debug.Enabled or Debug.IntroEnabled then
			local v28 = v10:SendData("GetGender", "PlayerChannel", 5)
			if not v28 or v28 == "None" then
				local ChooseGender = script.Parent.Parent.ChooseGender
				ChooseGender.Visible = true
				local v29 = nil
				local v30 = nil
				local function GenderSelected(p1) --[[ GenderSelected | Line: 620 | Upvalues: ChooseGender (copy), v10 (copy), v29 (ref), v30 (ref), v28 (ref) ]]
					ChooseGender.Visible = false
					v10:SendData("SetGender", "PlayerChannel", nil, p1)
					v29:disconnect()
					v30:disconnect()
					v28 = p1
				end
				v29 = ChooseGender.Boy.MouseButton1Click:connect(function() --[[ Line: 627 | Upvalues: ChooseGender (copy), v10 (copy), v29 (ref), v30 (ref), v28 (ref) ]]
					ChooseGender.Visible = false
					v10:SendData("SetGender", "PlayerChannel", nil, "Boy")
					v29:disconnect()
					v30:disconnect()
					v28 = "Boy"
				end)
				v30 = ChooseGender.Girl.MouseButton1Click:connect(function() --[[ Line: 628 | Upvalues: ChooseGender (copy), v10 (copy), v29 (ref), v30 (ref), v28 (ref) ]]
					ChooseGender.Visible = false
					v10:SendData("SetGender", "PlayerChannel", nil, "Girl")
					v29:disconnect()
					v30:disconnect()
					v28 = "Girl"
				end)
				if _G.GamepadEnabled then
					game:GetService("GuiService").GuiNavigationEnabled = true
					game:GetService("GuiService").SelectedObject = ChooseGender.Boy
				end
			end
			while v28 == nil or v28 == "None" do
				wait(0.1)
			end
			game:GetService("GuiService").GuiNavigationEnabled = false
		end
		_G.IntroStarted = true
		local v31 = Debug.Enabled and Debug.JobTransitionSpeed or 3
		workspace.Main.ChooseJobAgain.OnClientEvent:connect(function() --[[ Line: 666 ]] end)
		if not Debug.Enabled or Debug.IntroEnabled then
			CurrentCamera.CameraType = "Scriptable"
			CurrentCamera:Interpolate(CFrame.new(47.434, 6.956, 161.040009), workspace.Focuser.CFrame, v31)
			local v32 = nil
			v32 = CurrentCamera.InterpolationFinished:connect(function() --[[ Line: 687 | Upvalues: v32 (ref), v13 (copy), v18 (copy), v15 (copy) ]]
				v32:disconnect()
				v32 = nil
				v13:SetVisible(true)
				buttonPress(true)
				v15:SetVisible(true)
			end)
		end
		local v33 = nil
		local v34 = nil
		local v35 = nil
		if not v9.GamepadEnabled then
			return
		end
		Next.Style = Enum.ButtonStyle.Custom
		Previous.Style = Enum.ButtonStyle.Custom
		Next.BackgroundTransparency = 1
		Previous.BackgroundTransparency = 1
		Choose.Visible = false
		AButton.Visible = true
		v15:RegisterGamepadAction(Enum.KeyCode.ButtonA, function(p1, p2, p3) --[[ Line: 723 ]]
			if p2 ~= Enum.UserInputState.Begin then
				return
			end
			telespawn()
		end)
		v15:RegisterGamepadAction(Enum.KeyCode.Thumbstick1, function(p1, p2, p3) --[[ Line: 731 | Upvalues: v33 (ref), v34 (ref), v35 (ref) ]]
			v33 = p3.Position.X
			v34 = p3.Position.Y
			if math.sqrt(math.pow(v33, 2) + math.pow(v34, 2)) > 0.7 then
				if v35 ~= nil then
					return
				end
				if v33 > -0.5 and v33 < 0.5 then
					v35 = if v34 > 0 then "Up" else "Down"
				elseif v33 > 0.5 then
					v35 = "Right"
				else
					if not (v33 < -0.5) then
						workspace.Main.ThumbstickGesture:Fire(v35)
						return
					end
					v35 = "Left"
				end
				workspace.Main.ThumbstickGesture:Fire(v35)
				return
			end
			v35 = nil
		end)
		workspace.Main.ThumbstickGesture.Event:connect(function(p1) --[[ Line: 768 ]]
			if p1 == "Right" then
				buttonPress(true)
				return
			end
			if p1 ~= "Left" then
				return
			end
			buttonPress(false)
		end)
		return
	end
	_G.StartedPlaying = true
	v2:Fire("StartedPlaying")
	_G.ChoosingJob = false
	_G.IsNewPlayer = Debug.Enabled and Debug.StartAsNewPlayer
end
script.Parent:Destroy()