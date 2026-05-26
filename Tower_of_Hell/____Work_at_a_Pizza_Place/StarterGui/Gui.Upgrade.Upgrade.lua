-- https://lua.expert/
local v1 = require(game.ReplicatedStorage:WaitForChild("Library")):Load("Tween")
local v2 = script.Parent
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("Gui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local v3 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local Dialog = require(game.ReplicatedStorage:WaitForChild("Dialog"))
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v4 = Library:Load("Utility")
Library:Load("Events")
local v5 = Library:Load("SoundFX")
local v6 = Library:Load("CameraUtil")
local v7 = Library:Load("Signal")
local v8 = Library:Load("Network")
Library:Load("Table")
local Tabs = v2:WaitForChild("Tabs")
local ScrollingFrame = v2:WaitForChild("Upgrades"):WaitForChild("ScrollingFrame")
local LoadHouse = v2:WaitForChild("LoadHouse")
local Template = ScrollingFrame:WaitForChild("Template")
Template.Parent = game.ReplicatedStorage
local v9 = GuiManager:RegisterWindow(v2, "Left", "Right", 0.3, nil, true)
v9.FirstSelectedObject = Tabs.TabButtons.Brick
local v10 = GuiManager:RegisterTabs(v2, Tabs)
local t = {}
local v11 = nil
local v12 = "Brick"
local v13 = nil
local v14 = nil
local v15 = nil
local v16 = nil
local v17 = "Brick"
for k, v in pairs(v3.HouseInfo) do
	t[k] = {}
	for k2, v18 in pairs(v) do
		v18.Id = k2
		t[k][v18.Index] = v18
	end
end
local v18 = v7.New()
v8:BindEvents({
	HouseLoaded = function(p1, p2, p3) --[[ HouseLoaded | Line: 71 | Upvalues: v11 (ref), v12 (ref), v18 (ref), v10 (copy), Tabs (copy) ]]
		p1[p2].Upgrade = p3
		v11 = p1
		v12 = p2
		if v18 then
			v18:Fire()
			v18 = nil
		else
			v10:SelectTab(Tabs.TabButtons:FindFirstChild(p2))
		end
	end
})
local v19, v20, v21, v22, _
if not v18 then
	LoadHouse.MouseButton1Click:Connect(function() --[[ Line: 89 | Upvalues: LoadHouse (copy), v2 (copy), v4 (copy), v17 (ref) ]]
		LoadHouse.Visible = false
		v2.LoadingScreen.Visible = true
		local v1 = v4:SendData("SetHouseType", "HouseChannel", 10, v17)
		wait(1)
		v2.LoadingScreen.Visible = false
		if v1 then
			return
		end
		LoadHouse.Visible = true
	end)
	function Refresh() --[[ Refresh | Line: 102 | Upvalues: v17 (ref), v11 (ref), Tabs (copy), v3 (copy), ScrollingFrame (copy), LoadHouse (copy), v12 (ref), t (copy), v15 (ref), Template (copy), v16 (ref), LocalPlayer (copy), v8 (copy), v9 (copy), v13 (ref) ]]
		local count_2 = 0
		for k2, v in pairs(v11) do
			count_2 = count_2 + 1
		end
		for i2, v in ipairs(Tabs.TabButtons:GetChildren()) do
			if v:IsA("TextButton") then
				local v2 = v3.HouseInfo[v.Name][v11[v.Name] and v11[v.Name].Upgrade or v3.HouseTypeInfo[v.Name].FirstUpgrade]
				if v2.ModelId then
					local ModelId = v2.ModelId
					v.UpgradeImage.Image = "http://www.roblox.com/thumbs/asset.ashx?x=100&y=100&format=png&assetid=" .. ModelId
					v.UpgradeShadow.Image = "http://www.roblox.com/thumbs/asset.ashx?x=100&y=100&format=png&assetid=" .. ModelId
					continue
				end
				if v2.ImageId then
					local ImageId = v2.ImageId
					v.UpgradeImage.Image = "rbxassetid://" .. ImageId
					v.UpgradeShadow.Image = "rbxassetid://" .. ImageId
				end
			end
		end
		ScrollingFrame.CanvasPosition = Vector2.new(0, 0)
		for i2, v in ipairs(ScrollingFrame:GetChildren()) do
			if v:IsA("Frame") then
				v:Destroy()
			end
		end
		local v32 = v11[v17] == nil
		LoadHouse.Visible = if v12 == v17 then false else v11[v17]
		for i2, v in ipairs(t[v17]) do
			local v6
			local IsBundle = v.IsBundle
			v6 = if v15 + 1 < v.Index and v.GamepassId ~= nil then true elseif v.GamepassId == "Cabin" then true else false
			local v7 = Template:Clone()
			v7.Selectable = if v.Index <= v15 then true else false
			v7.LayoutOrder = i2
			v7.UpgradeName.Text = v.Name
			v7.Price.Visible = if v15 < v.Index then not IsBundle else false
			v7.Price.PriceText.Text = v.Id == v16 and v3.FormatNumber("Number", v.Price, v7.Price.PriceText) or (if v15 + 1 < v.Index then "???" elseif v32 then "???" else "")
			v7.Icon.Image = v.ModelId and "http://www.roblox.com/thumbs/asset.ashx?x=100&y=100&format=png&assetid=" .. v.ModelId or (v.ImageId and "rbxassetid://" .. v.ImageId or "")
			v7.Buy.Visible = if v15 < v.Index then true else v6
			v7.Locked.Visible = if v15 + 1 < v.Index then true else v32
			v7.Locked.EstateRequired.Visible = if v32 then if v.Index == 1 then not IsBundle and not v6 else false else v32
			v7.BackgroundBottom.Checkmark.Visible = if v.Index <= v15 then true else false
			if v.Id == v16 or (v6 or IsBundle) then
				v7.Buy.MouseButton1Click:Connect(function() --[[ Line: 167 | Upvalues: v6 (copy), v (copy), v16 (ref), IsBundle (copy), v3 (ref), LocalPlayer (ref), v8 (ref), v17 (ref), v9 (ref) ]]
					if v6 and v.Id ~= v16 or IsBundle then
						if IsBundle then
							workspace.Main.ShowGamePassPrompt:Fire(v.GamepassId)
						else
							game:GetService("MarketplaceService"):PromptGamePassPurchase(LocalPlayer, v3.GamePasses[v.GamepassId].ProductId)
						end
					else
						if not v8:InvokeServer("BuyHouseUpgradeWithCoins", v.Id, v17) then
							return
						end
						v9:SetVisible(false)
					end
				end)
			end
			if v.Id == v16 then
				v13 = v7.Buy
			end
			if v6 and v.Id ~= v16 or IsBundle then
				v7.Buy.Foreground.TextLabel.Text = "Buy Now"
				v7.Buy.Parent = v7.Locked
			end
			v7.Parent = ScrollingFrame
			if i2 == 1 then
				v9.FirstSelectedObject = v7
			end
		end
	end
	function TabChanged(p1_2, p2_2, p3_2) --[[ TabChanged | Line: 198 | Upvalues: v2 (copy), v17 (ref), v14 (ref), v11 (ref), v15 (ref), v3 (copy), v16 (ref) ]]
		if p1_2 ~= v2 then
			return
		end
		v17 = p2_2.Name
		v14 = v11[v17] and v11[v17].Upgrade or nil
		v15 = v11[v17] and v3.HouseInfo[v17][v14].Index or 0
		v16 = v14 and v3.HouseInfo[v17][v14].NextUpgrade or nil
		if p3_2 and p3_2 ~= p2_2 then
			p3_2.ZIndex = p3_2.ZIndex - 2
			p3_2.BackgroundColor3 = Color3.fromRGB(221, 208, 185)
		end
		p2_2.BackgroundColor3 = Color3.fromRGB(254, 239, 212)
		if p2_2 ~= p3_2 then
			p2_2.ZIndex = p2_2.ZIndex + 2
		end
		Refresh()
		if not _G.GamepadEnabled then
			return
		end
		game:GetService("GuiService").SelectedObject = p2_2
	end
	UIEvents.TabChanged.Event:connect(TabChanged)
	v10:SelectTab(Tabs.TabButtons:FindFirstChild(v12))
	UIEvents.WindowVisibilityChanged.Event:connect(function(p1_2, p2_2) --[[ Line: 224 | Upvalues: v2 (copy), v10 (copy), Tabs (copy), v12 (ref) ]]
		if p1_2 ~= v2 or not p2_2 then
			return
		end
		wait()
		v10:SelectTab(Tabs.TabButtons:FindFirstChild(v12))
	end)
	v19 = {
		Brick = {
			Shack = CFrame.new(-20.1513672, 12.4086637, 25.2020264, 0.689010382, 0.219818145, -0.690611899, 1.49011612e-8, 0.952894807, 0.303301424, 0.724751472, -0.208977848, 0.656554341),
			Tiny = CFrame.new(-22.2919617, 11.6489248, 21.9883728, 0.633162737, 0.238986582, -0.736200094, 1.49011594e-8, 0.951139927, 0.308760732, 0.774018764, -0.195495799, 0.602226257),
			Small = CFrame.new(-21.5307007, 12.4938002, 23.1558838, 0.605746388, 0.281004161, -0.744384348, -0, 0.935558438, 0.353172094, 0.795657873, -0.213932723, 0.566711068),
			Medium = CFrame.new(-26.8104553, 11.8914042, 25.7923279, 0.600266755, 0.266761184, -0.754001558, 1.4901163e-8, 0.942737818, 0.333534867, 0.799799979, -0.200209901, 0.565894067),
			Large = CFrame.new(-36.4672852, 24.937645, 34.3004456, 0.611608565, 0.306388646, -0.729425073, -1.4901163e-8, 0.921968579, 0.387264848, 0.791160524, -0.236854479, 0.563883841),
			TwoStory = CFrame.new(-41.9396973, 39.4231453, 39.1841125, 0.611189425, 0.306478411, -0.729738772, 1.49011594e-8, 0.921987653, 0.387219757, 0.791484416, -0.236664638, 0.563508987),
			ThreeStory = CFrame.new(93.791275, 29.1934509, -38.5803223, -0.748807847, -0.352124304, 0.561511636, 1.4901163e-8, 0.847197533, 0.531278074, -0.662787199, 0.397825181, -0.634388089),
			Backyard = CFrame.new(-4.2641449, -15.1953869, -15.4087524, -0.508251667, 0.209720671, -0.835282862, 0, 0.969896078, 0.243519023, 0.861208558, 0.123768948, -0.492951334),
			Basement = CFrame.new(-71.084671, 46.3775482, 52.3440857, 0.411318123, 0.27691412, -0.868410051, -7.45058149e-9, 0.952734947, 0.303803146, 0.91149199, -0.12495973, 0.391877055),
			Garage = CFrame.new(30.5450745, 12.9179039, -21.4428864, -0.484797299, -0.3407529, 0.805517912, 1.49011612e-8, 0.920985103, 0.389598131, -0.874626637, 0.188876137, -0.446491003),
			Mansion = CFrame.new(-88.4641495, 52.9547958, 61.9632874, 0.43107897, 0.201450497, -0.879538953, -0, 0.974759161, 0.223259792, 0.902314305, -0.0962425992, 0.420198083),
			Estate = nil
		},
		Brick2 = {
			Shack = CFrame.new(-20.1513672, 12.4086637, 25.2020264, 0.689010382, 0.219818145, -0.690611899, 1.49011612e-8, 0.952894807, 0.303301424, 0.724751472, -0.208977848, 0.656554341),
			Tiny = CFrame.new(-22.2919617, 11.6489248, 21.9883728, 0.633162737, 0.238986582, -0.736200094, 1.49011594e-8, 0.951139927, 0.308760732, 0.774018764, -0.195495799, 0.602226257),
			Small = CFrame.new(-21.5307007, 12.4938002, 23.1558838, 0.605746388, 0.281004161, -0.744384348, -0, 0.935558438, 0.353172094, 0.795657873, -0.213932723, 0.566711068),
			Medium = CFrame.new(-26.8104553, 11.8914042, 25.7923279, 0.600266755, 0.266761184, -0.754001558, 1.4901163e-8, 0.942737818, 0.333534867, 0.799799979, -0.200209901, 0.565894067),
			Large = CFrame.new(-36.4672852, 24.937645, 34.3004456, 0.611608565, 0.306388646, -0.729425073, -1.4901163e-8, 0.921968579, 0.387264848, 0.791160524, -0.236854479, 0.563883841),
			TwoStory = CFrame.new(-41.9396973, 39.4231453, 39.1841125, 0.611189425, 0.306478411, -0.729738772, 1.49011594e-8, 0.921987653, 0.387219757, 0.791484416, -0.236664638, 0.563508987),
			ThreeStory = CFrame.new(93.791275, 29.1934509, -38.5803223, -0.748807847, -0.352124304, 0.561511636, 1.4901163e-8, 0.847197533, 0.531278074, -0.662787199, 0.397825181, -0.634388089),
			Backyard = CFrame.new(-4.2641449, -15.1953869, -15.4087524, -0.508251667, 0.209720671, -0.835282862, 0, 0.969896078, 0.243519023, 0.861208558, 0.123768948, -0.492951334),
			Basement = CFrame.new(-71.084671, 46.3775482, 52.3440857, 0.411318123, 0.27691412, -0.868410051, -7.45058149e-9, 0.952734947, 0.303803146, 0.91149199, -0.12495973, 0.391877055),
			Garage = CFrame.new(30.5450745, 12.9179039, -21.4428864, -0.484797299, -0.3407529, 0.805517912, 1.49011612e-8, 0.920985103, 0.389598131, -0.874626637, 0.188876137, -0.446491003),
			Mansion = CFrame.new(-88.4641495, 52.9547958, 61.9632874, 0.43107897, 0.201450497, -0.879538953, -0, 0.974759161, 0.223259792, 0.902314305, -0.0962425992, 0.420198083),
			Estate = nil
		},
		Modern = {
			Tiny = CFrame.new(-22.2919617, 11.6489248, 21.9883728, 0.633162737, 0.238986582, -0.736200094, 1.49011594e-8, 0.951139927, 0.308760732, 0.774018764, -0.195495799, 0.602226257),
			Small = CFrame.new(-21.5307007, 12.4938002, 23.1558838, 0.605746388, 0.281004161, -0.744384348, -0, 0.935558438, 0.353172094, 0.795657873, -0.213932723, 0.566711068),
			Medium = CFrame.new(-26.8104553, 11.8914042, 25.7923279, 0.600266755, 0.266761184, -0.754001558, 1.4901163e-8, 0.942737818, 0.333534867, 0.799799979, -0.200209901, 0.565894067),
			Large = CFrame.new(-36.4672852, 24.937645, 34.3004456, 0.611608565, 0.306388646, -0.729425073, -1.4901163e-8, 0.921968579, 0.387264848, 0.791160524, -0.236854479, 0.563883841),
			TwoStory = CFrame.new(-41.9396973, 39.4231453, 39.1841125, 0.611189425, 0.306478411, -0.729738772, 1.49011594e-8, 0.921987653, 0.387219757, 0.791484416, -0.236664638, 0.563508987),
			ThreeStory = CFrame.new(93.791275, 29.1934509, -38.5803223, -0.748807847, -0.352124304, 0.561511636, 1.4901163e-8, 0.847197533, 0.531278074, -0.662787199, 0.397825181, -0.634388089),
			Backyard = CFrame.new(-4.2641449, -15.1953869, -15.4087524, -0.508251667, 0.209720671, -0.835282862, 0, 0.969896078, 0.243519023, 0.861208558, 0.123768948, -0.492951334),
			Basement = CFrame.new(-71.084671, 46.3775482, 52.3440857, 0.411318123, 0.27691412, -0.868410051, -7.45058149e-9, 0.952734947, 0.303803146, 0.91149199, -0.12495973, 0.391877055),
			Garage = CFrame.new(30.5450745, 12.9179039, -21.4428864, -0.484797299, -0.3407529, 0.805517912, 1.49011612e-8, 0.920985103, 0.389598131, -0.874626637, 0.188876137, -0.446491003),
			Mansion = CFrame.new(-88.4641495, 52.9547958, 61.9632874, 0.43107897, 0.201450497, -0.879538953, -0, 0.974759161, 0.223259792, 0.902314305, -0.0962425992, 0.420198083),
			Estate = nil
		},
		Manor = {
			Manor = CFrame.new(-1.2250061, 11.5949078, -14.0488281, -0.769827127, -0.210378796, 0.602583647, 0, 0.944114923, 0.329616845, -0.638252556, 0.253748, -0.726805151)
		},
		Cabin = {
			Cabin = CFrame.new(-113.417358, 29.8087597, -51.8033447, -0.879538655, 0.136357948, -0.455870926, -7.4505806e-9, 0.958059311, 0.286570132, 0.475827485, 0.252049506, -0.842650175)
		}
	}
	v20 = workspace.CurrentCamera
	v21 = false
	workspace.Main.StartUpgradeCutscene.OnClientEvent:connect(function(p1_2, p2_2, p3_2) --[[ Line: 311 | Upvalues: v3 (copy), v5 (copy), v19 (copy), v21 (ref), GuiManager (copy), v20 (copy), v6 (copy), v4 (copy), v1 (copy), LocalPlayer (copy), Dialog (copy) ]]
		local v12 = v3.HouseInfo[p2_2][p1_2.Name]
		local v2 = v5:GetSoundObject("HouseUpgrade")
		local v32 = p3_2 and p1_2.Marker or p1_2.Doors.FrontDoorMain.DoorTouch
		local v52 = v32.CFrame:toWorldSpace(v19[p2_2][if p3_2 then "Garage" else p1_2.Name])
		local CurrentCorrection = game.Lighting.CurrentCorrection.Value
		local Brightness = CurrentCorrection.Brightness
		local Contrast = CurrentCorrection.Contrast
		local Index = v12.Index
		delay(1, function() --[[ Line: 323 | Upvalues: v21 (ref) ]]
			v21 = false
		end)
		local v62
		if p3_2 then
			local v7 = GuiManager:GetWindowDataByName("Catalog")
			if v7 then
				v7:SetVisible(false)
			end
		end
		workspace.Main.FadeMusic.FadeMusic:Invoke("Out", true)
		v62 = v2:Clone()
		v62.Parent = v2.Parent
		v62:Play()
		v20.CameraType = "Scriptable"
		v6:InterpolateCameraType2(v20, v52.p, v32, 2, function() --[[ Line: 347 | Upvalues: v20 (ref), v52 (copy) ]]
			v20.CFrame = v52
		end)
		task.spawn(function() --[[ Line: 352 | Upvalues: v62 (copy), CurrentCorrection (copy), p3_2 (copy), v4 (ref), v1 (ref), Brightness (copy), Contrast (copy), v20 (ref), LocalPlayer (ref), Index (copy), v3 (ref), Dialog (ref) ]]
			while v62.TimePosition < 3.3 do
				task.wait()
			end
			delay(3, function() --[[ Line: 355 | Upvalues: v62 (ref) ]]
				v62:Destroy()
			end)
			CurrentCorrection.Brightness = 1
			CurrentCorrection.Contrast = -1
			if p3_2 or not v4:SendData("UpgradeHouse", "HouseChannel", 2) then
				v4:SendData("GarageUpgrade", "HouseChannel", 2)
			end
			v1(CurrentCorrection, "Brightness", "Number", 1, Brightness, 2, "Linear", "Out")
			v1(CurrentCorrection, "Contrast", "Number", -1, Contrast, 2, "Linear", "Out")
			wait(5)
			v20.CameraType = "Custom"
			workspace.Main.UpgradeSequenceComplete:FireServer()
			workspace.Main.FadeMusic.FadeMusic:Invoke("In", true)
			LocalPlayer:SetAttribute("CurrentHouseUpgradeIndex", Index + 1)
			task.delay(3, function() --[[ Line: 377 | Upvalues: v3 (ref), Index (ref), Dialog (ref) ]]
				for k2, v in pairs(v3.EditToolUnlockIndex) do
					if Index + 1 == v then
						if k2 == "Configure" then
							Dialog:ShowMessage("Configure Tool Unlocked!", "You can use this tool to do things like play music from the boombox or change the image of a poster")
							continue
						end
						if k2 == "RotateMode" then
							Dialog:ShowMessage("Rotate Tool Unlocked!", "You can now rotate furniture to any angle you want")
							continue
						end
						if k2 == "Patterns" then
							Dialog:ShowMessage("Wallpaper Tool Unlocked!", "You can now change the pattern of your house walls, floors, and ceilings")
						end
					end
				end
			end)
		end)
	end)
	v22 = PlayerGui:WaitForChild("MainGui"):WaitForChild("Menu"):WaitForChild("Menu"):WaitForChild("Upgrade"):WaitForChild("ArrowAnimation")
	_ = function(p1_2, p2_2) --[[ AnimateHelpArrow | Line: 403 ]]
		p1_2.Visible = true
		local Position = p1_2.Position
		task.spawn(function() --[[ Line: 410 | Upvalues: p1_2 (copy), Position (copy), p2_2 (copy) ]]
			while p1_2 and p1_2.Parent do
				p1_2:TweenPosition(UDim2.new(Position.X.Scale, Position.X.Offset, Position.Y.Scale, Position.Y.Offset + p2_2), "Out", "Sine", 0.5, true)
				wait(0.5)
				if not (p1_2 and p1_2.Parent) then
					continue
				end
				p1_2:TweenPosition(UDim2.new(Position.X.Scale, Position.X.Offset, Position.Y.Scale, Position.Y.Offset), "Out", "Sine", 0.5, true)
				wait(0.5)
			end
		end)
	end
	task.spawn(function() --[[ Line: 424 | Upvalues: LocalPlayer (copy), v13 (ref), v14 (ref), v12 (ref), UIEvents (copy), v22 (copy), v4 (copy) ]]
		local v1 = nil
		v1 = LocalPlayer:WaitForChild("Moneyz"):GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 426 | Upvalues: v13 (ref), v14 (ref), LocalPlayer (ref), v12 (ref), v1 (ref), UIEvents (ref), v22 (ref), v4 (ref) ]]
			if not v13 or (not v14 or (v14 ~= "Shack" or (not (LocalPlayer.Moneyz.Value >= 100) or v12 ~= "Brick"))) then
				return
			end
			v1:Disconnect()
			local v15 = nil
			v15 = UIEvents.TopbarButtonPressed.Event:connect(function(p1_2) --[[ Line: 430 | Upvalues: v22 (ref), v15 (ref), v14 (ref), v13 (ref), v4 (ref) ]]
				if p1_2 ~= v22.Parent then
					return
				end
				v15:disconnect()
				v22:Destroy()
				if v14 ~= "Shack" then
					return
				end
				local v1 = true
				local v2 = nil
				v2 = v13.MouseButton1Click:connect(function() --[[ Line: 438 | Upvalues: v2 (ref), v1 (ref) ]]
					v2:disconnect()
					v1 = true
				end)
				local BackgroundColor3 = v13.Foreground.BackgroundColor3
				local v3 = Color3.new(BackgroundColor3.R + 0.1, BackgroundColor3.G + 0.1, BackgroundColor3.B + 0.1)
				while v1 and (v13 and v13.Parent) do
					v13.Foreground.BackgroundColor3 = BackgroundColor3
					v4:QuickTween(v13.Foreground, 0.1, {
						BackgroundColor3 = v3
					})
					wait(0.3)
				end
				if v13 and v13.Parent then
					v13.Foreground.BackgroundColor3 = BackgroundColor3
				else
					return
				end
			end)
			local v2 = v22
			v2.Visible = true
			local Position = v2.Position
			local v3 = -10
			task.spawn(function() --[[ Line: 410 | Upvalues: v2 (copy), Position (copy), v3 (copy) ]]
				while v2 and v2.Parent do
					v2:TweenPosition(UDim2.new(Position.X.Scale, Position.X.Offset, Position.Y.Scale, Position.Y.Offset + v3), "Out", "Sine", 0.5, true)
					wait(0.5)
					if not (v2 and v2.Parent) then
						continue
					end
					v2:TweenPosition(UDim2.new(Position.X.Scale, Position.X.Offset, Position.Y.Scale, Position.Y.Offset), "Out", "Sine", 0.5, true)
					wait(0.5)
				end
			end)
		end)
	end)
	return
end
v18:Wait()
v18 = nil
LoadHouse.MouseButton1Click:Connect(function() --[[ Line: 89 | Upvalues: LoadHouse (copy), v2 (copy), v4 (copy), v17 (ref) ]]
	LoadHouse.Visible = false
	v2.LoadingScreen.Visible = true
	local v1 = v4:SendData("SetHouseType", "HouseChannel", 10, v17)
	wait(1)
	v2.LoadingScreen.Visible = false
	if v1 then
		return
	end
	LoadHouse.Visible = true
end)
function Refresh() --[[ Refresh | Line: 102 | Upvalues: v17 (ref), v11 (ref), Tabs (copy), v3 (copy), ScrollingFrame (copy), LoadHouse (copy), v12 (ref), t (copy), v15 (ref), Template (copy), v16 (ref), LocalPlayer (copy), v8 (copy), v9 (copy), v13 (ref) ]]
	local count_2 = 0
	for k2, v in pairs(v11) do
		count_2 = count_2 + 1
	end
	for i2, v in ipairs(Tabs.TabButtons:GetChildren()) do
		if v:IsA("TextButton") then
			local v2 = v3.HouseInfo[v.Name][v11[v.Name] and v11[v.Name].Upgrade or v3.HouseTypeInfo[v.Name].FirstUpgrade]
			if v2.ModelId then
				local ModelId = v2.ModelId
				v.UpgradeImage.Image = "http://www.roblox.com/thumbs/asset.ashx?x=100&y=100&format=png&assetid=" .. ModelId
				v.UpgradeShadow.Image = "http://www.roblox.com/thumbs/asset.ashx?x=100&y=100&format=png&assetid=" .. ModelId
				continue
			end
			if v2.ImageId then
				local ImageId = v2.ImageId
				v.UpgradeImage.Image = "rbxassetid://" .. ImageId
				v.UpgradeShadow.Image = "rbxassetid://" .. ImageId
			end
		end
	end
	ScrollingFrame.CanvasPosition = Vector2.new(0, 0)
	for i2, v in ipairs(ScrollingFrame:GetChildren()) do
		if v:IsA("Frame") then
			v:Destroy()
		end
	end
	local v32 = v11[v17] == nil
	LoadHouse.Visible = if v12 == v17 then false else v11[v17]
	for i2, v in ipairs(t[v17]) do
		local v6
		local IsBundle = v.IsBundle
		v6 = if v15 + 1 < v.Index and v.GamepassId ~= nil then true elseif v.GamepassId == "Cabin" then true else false
		local v7 = Template:Clone()
		v7.Selectable = if v.Index <= v15 then true else false
		v7.LayoutOrder = i2
		v7.UpgradeName.Text = v.Name
		v7.Price.Visible = if v15 < v.Index then not IsBundle else false
		v7.Price.PriceText.Text = v.Id == v16 and v3.FormatNumber("Number", v.Price, v7.Price.PriceText) or (if v15 + 1 < v.Index then "???" elseif v32 then "???" else "")
		v7.Icon.Image = v.ModelId and "http://www.roblox.com/thumbs/asset.ashx?x=100&y=100&format=png&assetid=" .. v.ModelId or (v.ImageId and "rbxassetid://" .. v.ImageId or "")
		v7.Buy.Visible = if v15 < v.Index then true else v6
		v7.Locked.Visible = if v15 + 1 < v.Index then true else v32
		v7.Locked.EstateRequired.Visible = if v32 then if v.Index == 1 then not IsBundle and not v6 else false else v32
		v7.BackgroundBottom.Checkmark.Visible = if v.Index <= v15 then true else false
		if v.Id == v16 or (v6 or IsBundle) then
			v7.Buy.MouseButton1Click:Connect(function() --[[ Line: 167 | Upvalues: v6 (copy), v (copy), v16 (ref), IsBundle (copy), v3 (ref), LocalPlayer (ref), v8 (ref), v17 (ref), v9 (ref) ]]
				if v6 and v.Id ~= v16 or IsBundle then
					if IsBundle then
						workspace.Main.ShowGamePassPrompt:Fire(v.GamepassId)
					else
						game:GetService("MarketplaceService"):PromptGamePassPurchase(LocalPlayer, v3.GamePasses[v.GamepassId].ProductId)
					end
				else
					if not v8:InvokeServer("BuyHouseUpgradeWithCoins", v.Id, v17) then
						return
					end
					v9:SetVisible(false)
				end
			end)
		end
		if v.Id == v16 then
			v13 = v7.Buy
		end
		if v6 and v.Id ~= v16 or IsBundle then
			v7.Buy.Foreground.TextLabel.Text = "Buy Now"
			v7.Buy.Parent = v7.Locked
		end
		v7.Parent = ScrollingFrame
		if i2 == 1 then
			v9.FirstSelectedObject = v7
		end
	end
end
function TabChanged(p1_2, p2_2, p3_2) --[[ TabChanged | Line: 198 | Upvalues: v2 (copy), v17 (ref), v14 (ref), v11 (ref), v15 (ref), v3 (copy), v16 (ref) ]]
	if p1_2 ~= v2 then
		return
	end
	v17 = p2_2.Name
	v14 = v11[v17] and v11[v17].Upgrade or nil
	v15 = v11[v17] and v3.HouseInfo[v17][v14].Index or 0
	v16 = v14 and v3.HouseInfo[v17][v14].NextUpgrade or nil
	if p3_2 and p3_2 ~= p2_2 then
		p3_2.ZIndex = p3_2.ZIndex - 2
		p3_2.BackgroundColor3 = Color3.fromRGB(221, 208, 185)
	end
	p2_2.BackgroundColor3 = Color3.fromRGB(254, 239, 212)
	if p2_2 ~= p3_2 then
		p2_2.ZIndex = p2_2.ZIndex + 2
	end
	Refresh()
	if not _G.GamepadEnabled then
		return
	end
	game:GetService("GuiService").SelectedObject = p2_2
end
UIEvents.TabChanged.Event:connect(TabChanged)
v10:SelectTab(Tabs.TabButtons:FindFirstChild(v12))
UIEvents.WindowVisibilityChanged.Event:connect(function(p1_2, p2_2) --[[ Line: 224 | Upvalues: v2 (copy), v10 (copy), Tabs (copy), v12 (ref) ]]
	if p1_2 ~= v2 or not p2_2 then
		return
	end
	wait()
	v10:SelectTab(Tabs.TabButtons:FindFirstChild(v12))
end)
v19 = {
	Brick = {
		Shack = CFrame.new(-20.1513672, 12.4086637, 25.2020264, 0.689010382, 0.219818145, -0.690611899, 1.49011612e-8, 0.952894807, 0.303301424, 0.724751472, -0.208977848, 0.656554341),
		Tiny = CFrame.new(-22.2919617, 11.6489248, 21.9883728, 0.633162737, 0.238986582, -0.736200094, 1.49011594e-8, 0.951139927, 0.308760732, 0.774018764, -0.195495799, 0.602226257),
		Small = CFrame.new(-21.5307007, 12.4938002, 23.1558838, 0.605746388, 0.281004161, -0.744384348, -0, 0.935558438, 0.353172094, 0.795657873, -0.213932723, 0.566711068),
		Medium = CFrame.new(-26.8104553, 11.8914042, 25.7923279, 0.600266755, 0.266761184, -0.754001558, 1.4901163e-8, 0.942737818, 0.333534867, 0.799799979, -0.200209901, 0.565894067),
		Large = CFrame.new(-36.4672852, 24.937645, 34.3004456, 0.611608565, 0.306388646, -0.729425073, -1.4901163e-8, 0.921968579, 0.387264848, 0.791160524, -0.236854479, 0.563883841),
		TwoStory = CFrame.new(-41.9396973, 39.4231453, 39.1841125, 0.611189425, 0.306478411, -0.729738772, 1.49011594e-8, 0.921987653, 0.387219757, 0.791484416, -0.236664638, 0.563508987),
		ThreeStory = CFrame.new(93.791275, 29.1934509, -38.5803223, -0.748807847, -0.352124304, 0.561511636, 1.4901163e-8, 0.847197533, 0.531278074, -0.662787199, 0.397825181, -0.634388089),
		Backyard = CFrame.new(-4.2641449, -15.1953869, -15.4087524, -0.508251667, 0.209720671, -0.835282862, 0, 0.969896078, 0.243519023, 0.861208558, 0.123768948, -0.492951334),
		Basement = CFrame.new(-71.084671, 46.3775482, 52.3440857, 0.411318123, 0.27691412, -0.868410051, -7.45058149e-9, 0.952734947, 0.303803146, 0.91149199, -0.12495973, 0.391877055),
		Garage = CFrame.new(30.5450745, 12.9179039, -21.4428864, -0.484797299, -0.3407529, 0.805517912, 1.49011612e-8, 0.920985103, 0.389598131, -0.874626637, 0.188876137, -0.446491003),
		Mansion = CFrame.new(-88.4641495, 52.9547958, 61.9632874, 0.43107897, 0.201450497, -0.879538953, -0, 0.974759161, 0.223259792, 0.902314305, -0.0962425992, 0.420198083),
		Estate = nil
	},
	Brick2 = {
		Shack = CFrame.new(-20.1513672, 12.4086637, 25.2020264, 0.689010382, 0.219818145, -0.690611899, 1.49011612e-8, 0.952894807, 0.303301424, 0.724751472, -0.208977848, 0.656554341),
		Tiny = CFrame.new(-22.2919617, 11.6489248, 21.9883728, 0.633162737, 0.238986582, -0.736200094, 1.49011594e-8, 0.951139927, 0.308760732, 0.774018764, -0.195495799, 0.602226257),
		Small = CFrame.new(-21.5307007, 12.4938002, 23.1558838, 0.605746388, 0.281004161, -0.744384348, -0, 0.935558438, 0.353172094, 0.795657873, -0.213932723, 0.566711068),
		Medium = CFrame.new(-26.8104553, 11.8914042, 25.7923279, 0.600266755, 0.266761184, -0.754001558, 1.4901163e-8, 0.942737818, 0.333534867, 0.799799979, -0.200209901, 0.565894067),
		Large = CFrame.new(-36.4672852, 24.937645, 34.3004456, 0.611608565, 0.306388646, -0.729425073, -1.4901163e-8, 0.921968579, 0.387264848, 0.791160524, -0.236854479, 0.563883841),
		TwoStory = CFrame.new(-41.9396973, 39.4231453, 39.1841125, 0.611189425, 0.306478411, -0.729738772, 1.49011594e-8, 0.921987653, 0.387219757, 0.791484416, -0.236664638, 0.563508987),
		ThreeStory = CFrame.new(93.791275, 29.1934509, -38.5803223, -0.748807847, -0.352124304, 0.561511636, 1.4901163e-8, 0.847197533, 0.531278074, -0.662787199, 0.397825181, -0.634388089),
		Backyard = CFrame.new(-4.2641449, -15.1953869, -15.4087524, -0.508251667, 0.209720671, -0.835282862, 0, 0.969896078, 0.243519023, 0.861208558, 0.123768948, -0.492951334),
		Basement = CFrame.new(-71.084671, 46.3775482, 52.3440857, 0.411318123, 0.27691412, -0.868410051, -7.45058149e-9, 0.952734947, 0.303803146, 0.91149199, -0.12495973, 0.391877055),
		Garage = CFrame.new(30.5450745, 12.9179039, -21.4428864, -0.484797299, -0.3407529, 0.805517912, 1.49011612e-8, 0.920985103, 0.389598131, -0.874626637, 0.188876137, -0.446491003),
		Mansion = CFrame.new(-88.4641495, 52.9547958, 61.9632874, 0.43107897, 0.201450497, -0.879538953, -0, 0.974759161, 0.223259792, 0.902314305, -0.0962425992, 0.420198083),
		Estate = nil
	},
	Modern = {
		Tiny = CFrame.new(-22.2919617, 11.6489248, 21.9883728, 0.633162737, 0.238986582, -0.736200094, 1.49011594e-8, 0.951139927, 0.308760732, 0.774018764, -0.195495799, 0.602226257),
		Small = CFrame.new(-21.5307007, 12.4938002, 23.1558838, 0.605746388, 0.281004161, -0.744384348, -0, 0.935558438, 0.353172094, 0.795657873, -0.213932723, 0.566711068),
		Medium = CFrame.new(-26.8104553, 11.8914042, 25.7923279, 0.600266755, 0.266761184, -0.754001558, 1.4901163e-8, 0.942737818, 0.333534867, 0.799799979, -0.200209901, 0.565894067),
		Large = CFrame.new(-36.4672852, 24.937645, 34.3004456, 0.611608565, 0.306388646, -0.729425073, -1.4901163e-8, 0.921968579, 0.387264848, 0.791160524, -0.236854479, 0.563883841),
		TwoStory = CFrame.new(-41.9396973, 39.4231453, 39.1841125, 0.611189425, 0.306478411, -0.729738772, 1.49011594e-8, 0.921987653, 0.387219757, 0.791484416, -0.236664638, 0.563508987),
		ThreeStory = CFrame.new(93.791275, 29.1934509, -38.5803223, -0.748807847, -0.352124304, 0.561511636, 1.4901163e-8, 0.847197533, 0.531278074, -0.662787199, 0.397825181, -0.634388089),
		Backyard = CFrame.new(-4.2641449, -15.1953869, -15.4087524, -0.508251667, 0.209720671, -0.835282862, 0, 0.969896078, 0.243519023, 0.861208558, 0.123768948, -0.492951334),
		Basement = CFrame.new(-71.084671, 46.3775482, 52.3440857, 0.411318123, 0.27691412, -0.868410051, -7.45058149e-9, 0.952734947, 0.303803146, 0.91149199, -0.12495973, 0.391877055),
		Garage = CFrame.new(30.5450745, 12.9179039, -21.4428864, -0.484797299, -0.3407529, 0.805517912, 1.49011612e-8, 0.920985103, 0.389598131, -0.874626637, 0.188876137, -0.446491003),
		Mansion = CFrame.new(-88.4641495, 52.9547958, 61.9632874, 0.43107897, 0.201450497, -0.879538953, -0, 0.974759161, 0.223259792, 0.902314305, -0.0962425992, 0.420198083),
		Estate = nil
	},
	Manor = {
		Manor = CFrame.new(-1.2250061, 11.5949078, -14.0488281, -0.769827127, -0.210378796, 0.602583647, 0, 0.944114923, 0.329616845, -0.638252556, 0.253748, -0.726805151)
	},
	Cabin = {
		Cabin = CFrame.new(-113.417358, 29.8087597, -51.8033447, -0.879538655, 0.136357948, -0.455870926, -7.4505806e-9, 0.958059311, 0.286570132, 0.475827485, 0.252049506, -0.842650175)
	}
}
v20 = workspace.CurrentCamera
v21 = false
workspace.Main.StartUpgradeCutscene.OnClientEvent:connect(function(p1_2, p2_2, p3_2) --[[ Line: 311 | Upvalues: v3 (copy), v5 (copy), v19 (copy), v21 (ref), GuiManager (copy), v20 (copy), v6 (copy), v4 (copy), v1 (copy), LocalPlayer (copy), Dialog (copy) ]]
	local v12 = v3.HouseInfo[p2_2][p1_2.Name]
	local v2 = v5:GetSoundObject("HouseUpgrade")
	local v32 = p3_2 and p1_2.Marker or p1_2.Doors.FrontDoorMain.DoorTouch
	local v52 = v32.CFrame:toWorldSpace(v19[p2_2][if p3_2 then "Garage" else p1_2.Name])
	local CurrentCorrection = game.Lighting.CurrentCorrection.Value
	local Brightness = CurrentCorrection.Brightness
	local Contrast = CurrentCorrection.Contrast
	local Index = v12.Index
	delay(1, function() --[[ Line: 323 | Upvalues: v21 (ref) ]]
		v21 = false
	end)
	local v62
	if p3_2 then
		local v7 = GuiManager:GetWindowDataByName("Catalog")
		if v7 then
			v7:SetVisible(false)
		end
	end
	workspace.Main.FadeMusic.FadeMusic:Invoke("Out", true)
	v62 = v2:Clone()
	v62.Parent = v2.Parent
	v62:Play()
	v20.CameraType = "Scriptable"
	v6:InterpolateCameraType2(v20, v52.p, v32, 2, function() --[[ Line: 347 | Upvalues: v20 (ref), v52 (copy) ]]
		v20.CFrame = v52
	end)
	task.spawn(function() --[[ Line: 352 | Upvalues: v62 (copy), CurrentCorrection (copy), p3_2 (copy), v4 (ref), v1 (ref), Brightness (copy), Contrast (copy), v20 (ref), LocalPlayer (ref), Index (copy), v3 (ref), Dialog (ref) ]]
		while v62.TimePosition < 3.3 do
			task.wait()
		end
		delay(3, function() --[[ Line: 355 | Upvalues: v62 (ref) ]]
			v62:Destroy()
		end)
		CurrentCorrection.Brightness = 1
		CurrentCorrection.Contrast = -1
		if p3_2 or not v4:SendData("UpgradeHouse", "HouseChannel", 2) then
			v4:SendData("GarageUpgrade", "HouseChannel", 2)
		end
		v1(CurrentCorrection, "Brightness", "Number", 1, Brightness, 2, "Linear", "Out")
		v1(CurrentCorrection, "Contrast", "Number", -1, Contrast, 2, "Linear", "Out")
		wait(5)
		v20.CameraType = "Custom"
		workspace.Main.UpgradeSequenceComplete:FireServer()
		workspace.Main.FadeMusic.FadeMusic:Invoke("In", true)
		LocalPlayer:SetAttribute("CurrentHouseUpgradeIndex", Index + 1)
		task.delay(3, function() --[[ Line: 377 | Upvalues: v3 (ref), Index (ref), Dialog (ref) ]]
			for k2, v in pairs(v3.EditToolUnlockIndex) do
				if Index + 1 == v then
					if k2 == "Configure" then
						Dialog:ShowMessage("Configure Tool Unlocked!", "You can use this tool to do things like play music from the boombox or change the image of a poster")
						continue
					end
					if k2 == "RotateMode" then
						Dialog:ShowMessage("Rotate Tool Unlocked!", "You can now rotate furniture to any angle you want")
						continue
					end
					if k2 == "Patterns" then
						Dialog:ShowMessage("Wallpaper Tool Unlocked!", "You can now change the pattern of your house walls, floors, and ceilings")
					end
				end
			end
		end)
	end)
end)
v22 = PlayerGui:WaitForChild("MainGui"):WaitForChild("Menu"):WaitForChild("Menu"):WaitForChild("Upgrade"):WaitForChild("ArrowAnimation")
_ = function(p1_2, p2_2) --[[ AnimateHelpArrow | Line: 403 ]]
	p1_2.Visible = true
	local Position = p1_2.Position
	task.spawn(function() --[[ Line: 410 | Upvalues: p1_2 (copy), Position (copy), p2_2 (copy) ]]
		while p1_2 and p1_2.Parent do
			p1_2:TweenPosition(UDim2.new(Position.X.Scale, Position.X.Offset, Position.Y.Scale, Position.Y.Offset + p2_2), "Out", "Sine", 0.5, true)
			wait(0.5)
			if not (p1_2 and p1_2.Parent) then
				continue
			end
			p1_2:TweenPosition(UDim2.new(Position.X.Scale, Position.X.Offset, Position.Y.Scale, Position.Y.Offset), "Out", "Sine", 0.5, true)
			wait(0.5)
		end
	end)
end
task.spawn(function() --[[ Line: 424 | Upvalues: LocalPlayer (copy), v13 (ref), v14 (ref), v12 (ref), UIEvents (copy), v22 (copy), v4 (copy) ]]
	local v1 = nil
	v1 = LocalPlayer:WaitForChild("Moneyz"):GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 426 | Upvalues: v13 (ref), v14 (ref), LocalPlayer (ref), v12 (ref), v1 (ref), UIEvents (ref), v22 (ref), v4 (ref) ]]
		if not v13 or (not v14 or (v14 ~= "Shack" or (not (LocalPlayer.Moneyz.Value >= 100) or v12 ~= "Brick"))) then
			return
		end
		v1:Disconnect()
		local v15 = nil
		v15 = UIEvents.TopbarButtonPressed.Event:connect(function(p1_2) --[[ Line: 430 | Upvalues: v22 (ref), v15 (ref), v14 (ref), v13 (ref), v4 (ref) ]]
			if p1_2 ~= v22.Parent then
				return
			end
			v15:disconnect()
			v22:Destroy()
			if v14 ~= "Shack" then
				return
			end
			local v1 = true
			local v2 = nil
			v2 = v13.MouseButton1Click:connect(function() --[[ Line: 438 | Upvalues: v2 (ref), v1 (ref) ]]
				v2:disconnect()
				v1 = true
			end)
			local BackgroundColor3 = v13.Foreground.BackgroundColor3
			local v3 = Color3.new(BackgroundColor3.R + 0.1, BackgroundColor3.G + 0.1, BackgroundColor3.B + 0.1)
			while v1 and (v13 and v13.Parent) do
				v13.Foreground.BackgroundColor3 = BackgroundColor3
				v4:QuickTween(v13.Foreground, 0.1, {
					BackgroundColor3 = v3
				})
				wait(0.3)
			end
			if v13 and v13.Parent then
				v13.Foreground.BackgroundColor3 = BackgroundColor3
			else
				return
			end
		end)
		local v2 = v22
		v2.Visible = true
		local Position = v2.Position
		local v3 = -10
		task.spawn(function() --[[ Line: 410 | Upvalues: v2 (copy), Position (copy), v3 (copy) ]]
			while v2 and v2.Parent do
				v2:TweenPosition(UDim2.new(Position.X.Scale, Position.X.Offset, Position.Y.Scale, Position.Y.Offset + v3), "Out", "Sine", 0.5, true)
				wait(0.5)
				if not (v2 and v2.Parent) then
					continue
				end
				v2:TweenPosition(UDim2.new(Position.X.Scale, Position.X.Offset, Position.Y.Scale, Position.Y.Offset), "Out", "Sine", 0.5, true)
				wait(0.5)
			end
		end)
	end)
end)