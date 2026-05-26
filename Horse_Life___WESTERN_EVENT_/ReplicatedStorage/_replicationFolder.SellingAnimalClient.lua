-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("FormatNumber")
local v3 = Sonar("AnimalDataService")
local v4 = Sonar("ItemReplicationService")
local v5 = Sonar("ViewportModel")
local v6 = Sonar("AnimalCosmetics")
local v7 = Sonar("RemoteUtils")
local v8 = Sonar("Button")
local v9 = Sonar("UINavigator")
local v10 = Sonar("CharacterControls")
local v11 = Sonar("NotificationsClient")
local t2 = {
	TextLabel = {
		TextTransparency = 1,
		TextStrokeTransparency = 1
	},
	ImageLabel = {
		BackgroundTransparency = 1,
		ImageTransparency = 1
	},
	ImageButton = {
		BackgroundTransparency = 1,
		ImageTransparency = 1
	},
	UIStroke = {
		Transparency = 1
	},
	ViewportFrame = {
		ImageTransparency = 1
	},
	Frame = {
		BackgroundTransparency = 1
	}
}
local v12 = Sonar("PlayerWrapper").GetClient()
local SellingAnimalGui = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("SellingAnimalGui")
local ContainerFrame = SellingAnimalGui.ContainerFrame
local UIPageLayout = ContainerFrame.HorsesFrame.UIPageLayout
local v13 = v1.new()
local v14 = false
local t3 = {}
local v15 = Instance.new("IntValue")
local v16 = 1
local t4 = {}
local v17 = 0
local t5 = {}
local v18 = false
local v19 = false
local SellingSounds = ReplicatedStorage.Storage.SFX.SellingSounds
local function getProperties(p1) --[[ getProperties | Line: 74 | Upvalues: t2 (copy) ]]
	local t = {}
	for k, v in pairs(p1:GetDescendants()) do
		local v1 = t2[v.ClassName]
		if v1 then
			t[v] = {}
			for k2, v2 in pairs(v1) do
				t[v][k2] = v[k2]
			end
		end
	end
	return t
end
local function setTweenProperties(p1) --[[ setTweenProperties | Line: 88 | Upvalues: t2 (copy) ]]
	for k, v in pairs(p1) do
		local v1 = t2[k.ClassName]
		if v1 then
			for k2, v2 in pairs(v1) do
				k[k2] = v2
			end
		end
	end
	return p1
end
local function tweenOut(p1, p2) --[[ tweenOut | Line: 99 | Upvalues: t2 (copy), TweenService (copy) ]]
	local v1 = nil
	for k, v in pairs(p1:GetDescendants()) do
		if t2[v.ClassName] then
			local v2 = TweenService:Create(v, TweenInfo.new(0.65), t2[v.ClassName])
			v2:Play()
			v1 = v2
		end
	end
	if not p2 then
		return
	end
	v1.Completed:Wait()
end
local function createDisplaySequence(p1) --[[ createDisplaySequence | Line: 111 | Upvalues: v3 (copy), ContainerFrame (copy), v4 (copy), v13 (copy), v5 (copy), v6 (copy), t4 (ref) ]]
	for k, v in pairs(p1) do
		local v1 = v3.IsFoal(v)
		local v2 = v3.IsFoal(v) and v3.GetByName("Foal") or v3.GetByName(v.Species.Value)
		local v32 = ContainerFrame.HorsesFrame.Default:Clone()
		v32.Viewport.IndexLabel.Text = k
		v32.Viewport.IndexLabel.Visible = if #p1 > 1 then true else false
		v32.Visible = true
		local Viewport = v32.Viewport.Viewport
		local v52 = v4.Get(v2):Clone()
		v52.Parent = Viewport
		v13:GiveTask(v52)
		local Eyelid = v52:FindFirstChild("Eyelid")
		if Eyelid then
			Eyelid:Destroy()
		end
		local Camera = Instance.new("Camera")
		Camera.Parent = Viewport
		Viewport.CurrentCamera = Camera
		v13:GiveTask(Camera)
		Camera.FieldOfView = 1
		Camera.CFrame = v5(v52, Viewport, -130, -8)
		Viewport.LightDirection = Camera.CFrame.LookVector
		v13:GiveTask(v6.new(v52, {
			InViewport = true,
			SlotValue = v,
			IsYoung = v1
		}))
		v32.LayoutOrder = k
		v32.UIScale.Scale = 0
		v32.Parent = ContainerFrame.HorsesFrame
		v13:GiveTask(v32)
		t4[k] = {
			Frame = v32,
			Slot = v
		}
	end
end
local function createAttributes(p1) --[[ createAttributes | Line: 160 | Upvalues: v3 (copy), v17 (ref), ContainerFrame (copy), setTweenProperties (copy), getProperties (copy), t5 (ref), v13 (copy), TweenService (copy), v15 (copy), v19 (ref), SellingSounds (copy) ]]
	local _, v1 = v3.GetPriceForSlot(p1)
	for k, v in pairs(v1) do
		local v2
		v2 = if type(v) == "table" and v then v else { v }
		for k2, v6 in pairs(v2) do
			local v32, v4, v5
			v17 = v17 + v6
			local v62 = ContainerFrame.ContentsFrame.Default:Clone()
			local v7 = setTweenProperties((getProperties(v62)))
			v62.Name = tick()
			v62.LayoutOrder = -#t5
			v62.Visible = true
			v62.UIScale.Scale = 0
			if k == "Skills" then
				v32 = p1.Upgrades[k2]
				if v32 then
					v4 = k
					v5 = k2
				elseif k == "Mutations" then
					v32 = p1.Mutations[k2]
					v4 = k
					v5 = k2
				else
					v4 = k
					v32 = false
					v5 = k2
				end
			elseif k == "Mutations" then
				v32 = p1.Mutations[k2]
				v4 = k
				v5 = k2
			else
				v4 = k
				v32 = false
				v5 = k2
			end
			v62.Frame.Title.Text = v3.FormatPriceAttribute(v5, v4, v32)
			v62.Frame.Price.Text = (if v6 < 0 then "-$" else "+$") .. math.abs(v6)
			v62.Parent = ContainerFrame.ContentsFrame
			v13:GiveTask(v62)
			table.insert(t5, v62)
			for k3, v10 in pairs(v7) do
				TweenService:Create(k3, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), v10):Play()
			end
			TweenService:Create(v62.UIScale, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
				Scale = 1
			}):Play()
			TweenService:Create(v15, TweenInfo.new(0.15, Enum.EasingStyle.Linear), {
				Value = v17
			}):Play()
			local v10 = TweenService:Create(ContainerFrame.ValueFrame.UIScale, TweenInfo.new(0.075, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
				Scale = 1.1
			})
			v10.Completed:Connect(function() --[[ Line: 192 | Upvalues: TweenService (ref), ContainerFrame (ref) ]]
				TweenService:Create(ContainerFrame.ValueFrame.UIScale, TweenInfo.new(0.075, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
					Scale = 1
				}):Play()
			end)
			v10:Play()
			if not v19 then
				game.SoundService:PlayLocalSound(SellingSounds.Pop)
				task.wait(0.15)
			end
		end
	end
end
local function cloneSlots(p1) --[[ cloneSlots | Line: 205 | Upvalues: v12 (copy) ]]
	local t = {}
	for k, v in pairs(p1) do
		t[k] = v12:GetItemValue(v, "Animals"):Clone()
		t[k].EquippedEquipment:ClearAllChildren()
	end
	return t
end
local t6 = {
	CantSellFavorited = "Cannot sell a favorited horse!",
	CantSellLastHorse = "Cannot sell your last horse!",
	CantSellInAuction = "Cannot sell a horse that is in auction!"
}
function t.SellSlots(p1, p2, p3) --[[ SellSlots | Line: 220 | Upvalues: t (copy), v14 (ref), cloneSlots (copy), v7 (copy), t6 (copy), v11 (copy) ]]
	if not t:CanRun() then
		return
	end
	v14 = true
	local v1 = cloneSlots(p2)
	local v2, v3 = v7.GetRemoteFunction("SellSlotsRemote"):InvokeServer(p2)
	if v2 and not p3 then
		t:Start(v1)
		return
	end
	v14 = false
	if not (v3 and #v3 > 0) then
		return
	end
	local v4 = v3[1]
	v11.Notify({
		Preset = "Red",
		Message = t6[v4] or "Cannot sell horse: " .. tostring(v4)
	})
	warn("[SellingClient] Failed to sell - Reasons:", table.concat(v3, ", "))
end
function t.Start(p1, p2) --[[ Start | Line: 244 | Upvalues: v13 (copy), t3 (copy), ContainerFrame (copy), getProperties (copy), createDisplaySequence (copy), v15 (copy), v2 (copy), UIPageLayout (copy), t4 (ref), TweenService (copy), v16 (ref), SellingAnimalGui (copy), setTweenProperties (copy), v9 (copy), v11 (copy), v18 (ref), v19 (ref), SellingSounds (copy), createAttributes (copy), t (copy) ]]
	v13:DoCleaning()
	local v1, v22
	if next(t3) then
		createDisplaySequence(p2)
		v15.Value = -1
		v13:GiveTask(v15:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 254 | Upvalues: ContainerFrame (ref), v2 (ref), v15 (ref) ]]
			ContainerFrame.ValueFrame.TextLabel.Text = "$" .. v2.splice(v15.Value)
		end))
		v15.Value = 0
		v1 = UIPageLayout.CurrentPage
		v13:GiveTask(UIPageLayout:GetPropertyChangedSignal("CurrentPage"):Connect(function() --[[ Line: 260 | Upvalues: t4 (ref), v1 (ref), TweenService (ref), UIPageLayout (ref) ]]
			for k2, v in pairs(t4) do
				if v.Frame == v1 then
					TweenService:Create(v.Frame.UIScale, TweenInfo.new(0.3), {
						Scale = 0.75
					}):Play()
					continue
				end
				if v.Frame == UIPageLayout.CurrentPage then
					TweenService:Create(v.Frame.UIScale, TweenInfo.new(0.3), {
						Scale = 1
					}):Play()
					continue
				end
				TweenService:Create(v.Frame.UIScale, TweenInfo.new(0.1), {
					Scale = 0.75
				}):Play()
			end
			v1 = UIPageLayout.CurrentPage
		end))
		UIPageLayout:JumpTo(t4[v16].Frame)
		ContainerFrame.BackgroundFrame.BackgroundFrame.BackgroundTransparency = 1
		ContainerFrame.BackgroundFrame.ShadowFrame.ImageTransparency = 1
		ContainerFrame.BackgroundFrame.BackgroundLabel.ImageTransparency = 1
		ContainerFrame.Visible = true
		ContainerFrame.DismissFrame.Visible = false
		SellingAnimalGui.Enabled = true
		v22 = setTweenProperties(t3[ContainerFrame.ValueFrame])
		TweenService:Create(ContainerFrame.BackgroundFrame.BackgroundFrame, TweenInfo.new(0.35), {
			BackgroundTransparency = 0.1
		}):Play()
		TweenService:Create(ContainerFrame.BackgroundFrame.ShadowFrame, TweenInfo.new(0.35), {
			ImageTransparency = 0
		}):Play()
		TweenService:Create(ContainerFrame.BackgroundFrame.BackgroundLabel, TweenInfo.new(0.35), {
			ImageTransparency = 0.8
		}):Play()
		v9.SetHUDNavigationEnabled(false)
		v9.ResetGamepadSelection()
		v11.ClearNotifications()
		task.delay(0.15, function() --[[ Line: 290 | Upvalues: ContainerFrame (ref), v22 (copy), TweenService (ref), t4 (ref), setTweenProperties (ref), getProperties (ref), p2 (copy), v18 (ref), v19 (ref), SellingSounds (ref), v16 (ref), UIPageLayout (ref), createAttributes (ref), t (ref) ]]
			ContainerFrame.HorsesFrame.Visible = true
			for k2, v in pairs(v22) do
				TweenService:Create(k2, TweenInfo.new(0.3), v):Play()
			end
			for k2, v in pairs(t4) do
				local v1 = setTweenProperties((getProperties(v.Frame)))
				v.Frame.UIScale.Scale = 0.4
				for k2_2, v3 in pairs(v1) do
					TweenService:Create(k2_2, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), v3):Play()
				end
				local v3 = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
				local t2 = {}
				t2.Scale = if k2 == 1 then 1 else 0.75
				TweenService:Create(v.Frame.UIScale, v3, t2):Play()
			end
			if not (#p2 > 1) then
				task.delay(0.25, function() --[[ Line: 311 | Upvalues: p2 (ref), v19 (ref), SellingSounds (ref), v16 (ref), UIPageLayout (ref), t4 (ref), createAttributes (ref), ContainerFrame (ref), TweenService (ref), t (ref) ]]
					for k2, v in pairs(p2) do
						if not v19 then
							SellingSounds.ItemPickup.Pitch = v16 * 0.1 + 0.85
							game.SoundService:PlayLocalSound(SellingSounds.Bloop)
							game.SoundService:PlayLocalSound(SellingSounds.ItemPickup)
							SellingSounds.QuestIncrement.Pitch = v16 * 0.05 + 0.65
							game.SoundService:PlayLocalSound(SellingSounds.QuestIncrement)
						end
						UIPageLayout:JumpTo(t4[v16].Frame)
						createAttributes(t4[v16].Slot)
						if k2 ~= #p2 and not v19 then
							task.wait(0.25)
						end
						v16 = v16 + 1
					end
					ContainerFrame.DismissFrame.Visible = false
					game.SoundService:PlayLocalSound(SellingSounds.TrapCompleted)
					TweenService:Create(ContainerFrame.BackgroundFrame.FlashFrame, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true), {
						BackgroundTransparency = 0.25
					}):Play()
					task.wait(2)
					t:Stop()
				end)
				return
			end
			task.delay(0.6, function() --[[ Line: 305 | Upvalues: v18 (ref), ContainerFrame (ref) ]]
				v18 = true
				ContainerFrame.DismissFrame.Visible = true
			end)
			task.delay(0.25, function() --[[ Line: 311 | Upvalues: p2 (ref), v19 (ref), SellingSounds (ref), v16 (ref), UIPageLayout (ref), t4 (ref), createAttributes (ref), ContainerFrame (ref), TweenService (ref), t (ref) ]]
				for k2, v in pairs(p2) do
					if not v19 then
						SellingSounds.ItemPickup.Pitch = v16 * 0.1 + 0.85
						game.SoundService:PlayLocalSound(SellingSounds.Bloop)
						game.SoundService:PlayLocalSound(SellingSounds.ItemPickup)
						SellingSounds.QuestIncrement.Pitch = v16 * 0.05 + 0.65
						game.SoundService:PlayLocalSound(SellingSounds.QuestIncrement)
					end
					UIPageLayout:JumpTo(t4[v16].Frame)
					createAttributes(t4[v16].Slot)
					if k2 ~= #p2 and not v19 then
						task.wait(0.25)
					end
					v16 = v16 + 1
				end
				ContainerFrame.DismissFrame.Visible = false
				game.SoundService:PlayLocalSound(SellingSounds.TrapCompleted)
				TweenService:Create(ContainerFrame.BackgroundFrame.FlashFrame, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true), {
					BackgroundTransparency = 0.25
				}):Play()
				task.wait(2)
				t:Stop()
			end)
		end)
		return
	end
	t3[ContainerFrame.ValueFrame] = getProperties(ContainerFrame.ValueFrame)
	createDisplaySequence(p2)
	v15.Value = -1
	v13:GiveTask(v15:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 254 | Upvalues: ContainerFrame (ref), v2 (ref), v15 (ref) ]]
		ContainerFrame.ValueFrame.TextLabel.Text = "$" .. v2.splice(v15.Value)
	end))
	v15.Value = 0
	v1 = UIPageLayout.CurrentPage
	v13:GiveTask(UIPageLayout:GetPropertyChangedSignal("CurrentPage"):Connect(function() --[[ Line: 260 | Upvalues: t4 (ref), v1 (ref), TweenService (ref), UIPageLayout (ref) ]]
		for k2, v in pairs(t4) do
			if v.Frame == v1 then
				TweenService:Create(v.Frame.UIScale, TweenInfo.new(0.3), {
					Scale = 0.75
				}):Play()
				continue
			end
			if v.Frame == UIPageLayout.CurrentPage then
				TweenService:Create(v.Frame.UIScale, TweenInfo.new(0.3), {
					Scale = 1
				}):Play()
				continue
			end
			TweenService:Create(v.Frame.UIScale, TweenInfo.new(0.1), {
				Scale = 0.75
			}):Play()
		end
		v1 = UIPageLayout.CurrentPage
	end))
	UIPageLayout:JumpTo(t4[v16].Frame)
	ContainerFrame.BackgroundFrame.BackgroundFrame.BackgroundTransparency = 1
	ContainerFrame.BackgroundFrame.ShadowFrame.ImageTransparency = 1
	ContainerFrame.BackgroundFrame.BackgroundLabel.ImageTransparency = 1
	ContainerFrame.Visible = true
	ContainerFrame.DismissFrame.Visible = false
	SellingAnimalGui.Enabled = true
	v22 = setTweenProperties(t3[ContainerFrame.ValueFrame])
	TweenService:Create(ContainerFrame.BackgroundFrame.BackgroundFrame, TweenInfo.new(0.35), {
		BackgroundTransparency = 0.1
	}):Play()
	TweenService:Create(ContainerFrame.BackgroundFrame.ShadowFrame, TweenInfo.new(0.35), {
		ImageTransparency = 0
	}):Play()
	TweenService:Create(ContainerFrame.BackgroundFrame.BackgroundLabel, TweenInfo.new(0.35), {
		ImageTransparency = 0.8
	}):Play()
	v9.SetHUDNavigationEnabled(false)
	v9.ResetGamepadSelection()
	v11.ClearNotifications()
	task.delay(0.15, function() --[[ Line: 290 | Upvalues: ContainerFrame (ref), v22 (copy), TweenService (ref), t4 (ref), setTweenProperties (ref), getProperties (ref), p2 (copy), v18 (ref), v19 (ref), SellingSounds (ref), v16 (ref), UIPageLayout (ref), createAttributes (ref), t (ref) ]]
		ContainerFrame.HorsesFrame.Visible = true
		for k2, v in pairs(v22) do
			TweenService:Create(k2, TweenInfo.new(0.3), v):Play()
		end
		for k2, v in pairs(t4) do
			local v1 = setTweenProperties((getProperties(v.Frame)))
			v.Frame.UIScale.Scale = 0.4
			for k2_2, v3 in pairs(v1) do
				TweenService:Create(k2_2, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), v3):Play()
			end
			local v3 = TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
			local t2 = {}
			t2.Scale = if k2 == 1 then 1 else 0.75
			TweenService:Create(v.Frame.UIScale, v3, t2):Play()
		end
		if not (#p2 > 1) then
			task.delay(0.25, function() --[[ Line: 311 | Upvalues: p2 (ref), v19 (ref), SellingSounds (ref), v16 (ref), UIPageLayout (ref), t4 (ref), createAttributes (ref), ContainerFrame (ref), TweenService (ref), t (ref) ]]
				for k2, v in pairs(p2) do
					if not v19 then
						SellingSounds.ItemPickup.Pitch = v16 * 0.1 + 0.85
						game.SoundService:PlayLocalSound(SellingSounds.Bloop)
						game.SoundService:PlayLocalSound(SellingSounds.ItemPickup)
						SellingSounds.QuestIncrement.Pitch = v16 * 0.05 + 0.65
						game.SoundService:PlayLocalSound(SellingSounds.QuestIncrement)
					end
					UIPageLayout:JumpTo(t4[v16].Frame)
					createAttributes(t4[v16].Slot)
					if k2 ~= #p2 and not v19 then
						task.wait(0.25)
					end
					v16 = v16 + 1
				end
				ContainerFrame.DismissFrame.Visible = false
				game.SoundService:PlayLocalSound(SellingSounds.TrapCompleted)
				TweenService:Create(ContainerFrame.BackgroundFrame.FlashFrame, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true), {
					BackgroundTransparency = 0.25
				}):Play()
				task.wait(2)
				t:Stop()
			end)
			return
		end
		task.delay(0.6, function() --[[ Line: 305 | Upvalues: v18 (ref), ContainerFrame (ref) ]]
			v18 = true
			ContainerFrame.DismissFrame.Visible = true
		end)
		task.delay(0.25, function() --[[ Line: 311 | Upvalues: p2 (ref), v19 (ref), SellingSounds (ref), v16 (ref), UIPageLayout (ref), t4 (ref), createAttributes (ref), ContainerFrame (ref), TweenService (ref), t (ref) ]]
			for k2, v in pairs(p2) do
				if not v19 then
					SellingSounds.ItemPickup.Pitch = v16 * 0.1 + 0.85
					game.SoundService:PlayLocalSound(SellingSounds.Bloop)
					game.SoundService:PlayLocalSound(SellingSounds.ItemPickup)
					SellingSounds.QuestIncrement.Pitch = v16 * 0.05 + 0.65
					game.SoundService:PlayLocalSound(SellingSounds.QuestIncrement)
				end
				UIPageLayout:JumpTo(t4[v16].Frame)
				createAttributes(t4[v16].Slot)
				if k2 ~= #p2 and not v19 then
					task.wait(0.25)
				end
				v16 = v16 + 1
			end
			ContainerFrame.DismissFrame.Visible = false
			game.SoundService:PlayLocalSound(SellingSounds.TrapCompleted)
			TweenService:Create(ContainerFrame.BackgroundFrame.FlashFrame, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true), {
				BackgroundTransparency = 0.25
			}):Play()
			task.wait(2)
			t:Stop()
		end)
	end)
end
function t.Stop(p1) --[[ Stop | Line: 347 | Upvalues: TweenService (copy), ContainerFrame (copy), t5 (ref), tweenOut (copy), t4 (ref), v9 (copy), SellingAnimalGui (copy), v13 (copy), v16 (ref), v17 (ref), v18 (ref), v19 (ref), v14 (ref) ]]
	TweenService:Create(ContainerFrame.BackgroundFrame.BackgroundFrame, TweenInfo.new(1), {
		BackgroundTransparency = 1
	}):Play()
	TweenService:Create(ContainerFrame.BackgroundFrame.ShadowFrame, TweenInfo.new(1), {
		ImageTransparency = 1
	}):Play()
	local v1 = TweenService:Create(ContainerFrame.BackgroundFrame.BackgroundLabel, TweenInfo.new(1), {
		ImageTransparency = 1
	})
	v1:Play()
	for k, v in pairs(t5) do
		tweenOut(v)
	end
	for k, v in pairs(t4) do
		tweenOut(v.Frame)
	end
	tweenOut(ContainerFrame.ValueFrame)
	v9.ResetGamepadSelection()
	v9.SetHUDNavigationEnabled(true)
	v1.Completed:Wait()
	SellingAnimalGui.Enabled = false
	v13:DoCleaning()
	v16 = 1
	t4 = {}
	t5 = {}
	v17 = 0
	v18 = false
	v19 = false
	v14 = false
end
function t.CanRun(p1) --[[ CanRun | Line: 380 | Upvalues: v14 (ref), v12 (copy), v11 (copy) ]]
	if v14 then
		return
	end
	if v12:IsInAction("Race") then
		v11.Notify({
			Message = "You cannot sell horses during a race!",
			Preset = "Red"
		})
	else
		return true
	end
end
function t.IsRunning(p1) --[[ IsRunning | Line: 391 | Upvalues: v14 (ref) ]]
	return v14
end
function t.Skip() --[[ Skip | Line: 394 | Upvalues: v18 (ref), v19 (ref) ]]
	if v18 then
		v19 = true
	end
end
function t.Init(p1) --[[ Init | Line: 399 | Upvalues: v8 (copy), ContainerFrame (copy), t (copy), v10 (copy), v18 (ref), v14 (ref) ]]
	v8.new(ContainerFrame, {
		Click = t.Skip
	})
	v10:AddControls("GamepadSkipSell", { Enum.KeyCode.ButtonB }, {
		InputBegan = t.Skip
	}, function() --[[ Line: 408 | Upvalues: v18 (ref), v14 (ref) ]]
		return v18 and v14
	end, nil, true)
end
t:Init()
return t