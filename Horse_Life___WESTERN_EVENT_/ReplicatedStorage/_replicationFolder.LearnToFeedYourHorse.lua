-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Animal")
local v2 = Sonar("ContextualUtils")
local v3 = Sonar("DisplayItemClient")
local v4 = Sonar("GuiManager")
local v5 = Sonar("GuiUtils")
local v6 = Sonar("InventoryGui")
local v7 = Sonar("Maid")
local v8 = Sonar("PlayerWrapper")
local v9 = Sonar("QuickFeedGui")
local v10 = Sonar("Signal")
local v11 = Sonar("State")
local v12 = Sonar("TapToContinue")
local v13 = Sonar("ToolTipClient")
Sonar("PlaceTypeService")
local v14 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local t2 = {
	{
		Name = "Hazel",
		Image = "rbxassetid://140072971978239",
		Dialog = "Give your Horse an Apple!"
	},
	{
		Name = "Hazel",
		Image = "rbxassetid://140072971978239",
		Dialog = "Great job!",
		Response = "Continue"
	}
}
local v15 = v8.GetClient()
local PlayerGui = Players.LocalPlayer.PlayerGui
local Container = PlayerGui:WaitForChild("NewTutorialGui").Container
local Container_2 = Container.Container
local DialogBox = Container_2.DialogBox
local Instruction = DialogBox.Instruction
local Assets = ReplicatedStorage:WaitForChild("Storage").Tutorial.Assets
local function yieldForInventoryGridButton(p1) --[[ yieldForInventoryGridButton | Line: 62 | Upvalues: PlayerGui (copy), RunService (copy) ]]
	local v1
	repeat
		v1 = PlayerGui.InventoryGui.ContainerFrame.Menu.Content.Items:FindFirstChild(p1, true)
		RunService.Heartbeat:Wait()
	until v1
	return v1
end
function t.Run(p1) --[[ Run | Line: 72 | Upvalues: v15 (copy), v5 (copy), v7 (copy), v11 (copy), v10 (copy), Instruction (copy), v2 (copy), Assets (copy), v1 (copy), t2 (copy), Container_2 (copy), DialogBox (copy), TweenService (copy), v14 (copy), Container (copy), PlayerGui (copy), v4 (copy), yieldForInventoryGridButton (copy), v6 (copy), RunService (copy), v9 (copy), v13 (copy), v12 (copy), v3 (copy) ]]
	local v16 = v15.PlayerCohorts.TrimmedTutorial:get()
	if v15.SkipTutorial then
		return
	end
	v5.SetGameElements({
		Currency = false,
		Inventory = true,
		ItemStream = false,
		Map = false,
		Menu = false,
		Promo = false,
		Quests = false,
		SideFrame = true,
		Stables = false
	}, true)
	local v22 = v7.new()
	local v32 = v22:GiveTask(v11.new(0))
	local v42 = v22:GiveTask(v10.new())
	local Text = Instruction.Text
	Instruction.Visible = false
	local v52 = v2.FromPlayer(Assets.FeedPart)
	v22:GiveTask(function() --[[ Line: 101 | Upvalues: v52 (ref), v2 (ref) ]]
		if not v52 then
			return
		end
		v2.Destroy(v52)
		v52 = nil
	end)
	select(-1, next(v1.GetAllAnimals())):SetMoveState("Idle")
	local v62 = false
	v15.LearnToFeedYourHorse = true
	v22:GiveTask(v32:subscribe(function(p1) --[[ Line: 115 | Upvalues: t2 (ref), v42 (copy), Container_2 (ref), DialogBox (ref), Instruction (ref), Text (copy), v22 (copy), TweenService (ref), v14 (ref) ]]
		if #t2 < p1 then
			v42:Fire()
			return
		end
		local v1 = t2[p1]
		if not v1 then
			return
		end
		local xAxis = Vector2.xAxis
		local v4 = UDim2.fromScale(0.006, 0.006)
		Container_2.AnchorPoint = xAxis
		Container_2.Position = v4
		Container_2.ImageLabel.Image = v1.Image
		DialogBox.Description.Text = v1.Dialog
		if v1.Response then
			Instruction.Text = v1.Response
		else
			Instruction.Text = Text
		end
		v22._tween = if v22._tween then v22._tween:Pause() else nil
		v22._tween = TweenService:Create(Container_2, v14, {
			AnchorPoint = Vector2.zero,
			Position = UDim2.fromScale(0.006, 0.006)
		})
		v22._tween:Play()
		v22._tween.Completed:Wait()
	end))
	v32:set(1)
	Container.Interactable = false
	Instruction.Visible = false
	v22._inventoryPointMobile = v2.SetGuiPointTo({
		Direction = "Right",
		Offset = -3,
		GuiElement = PlayerGui.HUDGui.MobileRightFrame.Core.Buttons.Inventory,
		NextElement = PlayerGui.InventoryGui.ContainerFrame
	})
	v22._inventoryPointDesktop = v2.SetGuiPointTo({
		Direction = "Right",
		Offset = -3,
		GuiElement = PlayerGui.HUDGui.RightFrame.Other.ButtonsFrame.RightFrame.Inventory,
		NextElement = PlayerGui.InventoryGui.ContainerFrame
	})
	local ContainerFrame = PlayerGui.InventoryGui.ContainerFrame
	local t = {}
	v4.AddStateCallback(ContainerFrame, "OnOpen", function() --[[ Line: 168 | Upvalues: v62 (ref), v22 (copy), yieldForInventoryGridButton (ref), t (ref), v2 (ref), v6 (ref), RunService (ref), ContainerFrame (copy), PlayerGui (ref), v4 (ref), v7 (ref), v9 (ref), v13 (ref) ]]
		if v62 then
			return
		end
		if v22._inventoryPointMobile then
			v22._inventoryPointMobile()
			v22._inventoryPointMobile = nil
		end
		if not v22._inventoryPointDesktop then
			task.spawn(function() --[[ Line: 182 | Upvalues: yieldForInventoryGridButton (ref), v62 (ref), t (ref), v2 (ref), v6 (ref), RunService (ref), ContainerFrame (ref), PlayerGui (ref), v4 (ref), v22 (ref), v7 (ref), v9 (ref), v13 (ref) ]]
				local v1 = yieldForInventoryGridButton("Apple")
				if not v1 or v62 then
					return
				end
				t[#t + 1] = v2.SetGuiPointTo({
					Direction = "Right",
					Offset = -3,
					GuiElement = v1,
					NextElement = function() --[[ NextElement | Line: 190 | Upvalues: v6 (ref) ]]
						local v1 = v6.GetSelectedItem()
						if not v1 then
							return true
						end
						return v1.Name ~= "Apple"
					end
				})
				repeat
					RunService.Heartbeat:Wait()
					if v62 then
						break
					end
					local v23 = v6.GetSelectedItem()
				until v23 and v23.Name == "Apple"
				if v62 then
					return
				end
				local Feed = ContainerFrame.Menu.Content.Info.Content.Buttons:FindFirstChild("Feed")
				if not Feed then
					return
				end
				t[#t + 1] = v2.SetGuiPointTo({
					Direction = "Right",
					Offset = -3,
					GuiElement = Feed,
					NextElement = PlayerGui.QuickFeedGui.ContainerFrame
				})
				repeat
					RunService.Heartbeat:Wait()
				until v62 or v4.IsFrameOpen(PlayerGui.QuickFeedGui.ContainerFrame)
				if v62 then
					return
				end
				for v3, v42 in t do
					v42()
				end
				t = {}
				local Horses = PlayerGui.QuickFeedGui.ContainerFrame.Menu.Content.HorseSelect.Horses
				local v5 = v22:GiveTask(v7.new())
				for v63, v72 in Horses:GetDescendants() do
					if v72.Parent.Parent == Horses and v72:IsA("GuiButton") then
						local Unable = v72:FindFirstChild("Unable")
						if Unable and tonumber(v72.Name) then
							local function onVisibilityChanged() --[[ onVisibilityChanged | Line: 252 | Upvalues: Unable (copy), v72 (copy), v5 (copy), v2 (ref), v9 (ref), v22 (ref), v13 (ref) ]]
								if not Unable.Visible then
									local v1 = v72.Parent
									v5:DoCleaning()
									v5:GiveTask(v2.SetGuiPointTo({
										Direction = "Up",
										Offset = -3,
										GuiElement = v72,
										NextElement = function() --[[ NextElement | Line: 263 | Upvalues: v9 (ref), v1 (copy) ]]
											local v12 = v9.GetSelectedSlot()
											if not v12 then
												return true
											end
											return v12.Name ~= v1.Name
										end
									}))
									v22:GiveTask(v2.SetGuiPointTo({
										Direction = "Up",
										Offset = -3,
										GuiElement = function() --[[ GuiElement | Line: 271 | Upvalues: v9 (ref), v5 (ref), v13 (ref) ]]
											if v9.GetSelectedSlot() then
												v5:DoCleaning()
												return v13:GetTip().TipFrame.Menu.Content.Buttons:FindFirstChild("Feed"):FindFirstChild("1")
											end
										end,
										NextElement = function() --[[ NextElement | Line: 286 ]]
											return true
										end
									}))
								end
							end
							v22:GiveTask(Unable:GetPropertyChangedSignal("Visible"):Connect(onVisibilityChanged))
							onVisibilityChanged()
						end
					end
				end
			end)
			return
		end
		v22._inventoryPointDesktop()
		v22._inventoryPointDesktop = nil
		task.spawn(function() --[[ Line: 182 | Upvalues: yieldForInventoryGridButton (ref), v62 (ref), t (ref), v2 (ref), v6 (ref), RunService (ref), ContainerFrame (ref), PlayerGui (ref), v4 (ref), v22 (ref), v7 (ref), v9 (ref), v13 (ref) ]]
			local v1 = yieldForInventoryGridButton("Apple")
			if not v1 or v62 then
				return
			end
			t[#t + 1] = v2.SetGuiPointTo({
				Direction = "Right",
				Offset = -3,
				GuiElement = v1,
				NextElement = function() --[[ NextElement | Line: 190 | Upvalues: v6 (ref) ]]
					local v1 = v6.GetSelectedItem()
					if not v1 then
						return true
					end
					return v1.Name ~= "Apple"
				end
			})
			repeat
				RunService.Heartbeat:Wait()
				if v62 then
					break
				end
				local v23 = v6.GetSelectedItem()
			until v23 and v23.Name == "Apple"
			if v62 then
				return
			end
			local Feed = ContainerFrame.Menu.Content.Info.Content.Buttons:FindFirstChild("Feed")
			if not Feed then
				return
			end
			t[#t + 1] = v2.SetGuiPointTo({
				Direction = "Right",
				Offset = -3,
				GuiElement = Feed,
				NextElement = PlayerGui.QuickFeedGui.ContainerFrame
			})
			repeat
				RunService.Heartbeat:Wait()
			until v62 or v4.IsFrameOpen(PlayerGui.QuickFeedGui.ContainerFrame)
			if v62 then
				return
			end
			for v3, v42 in t do
				v42()
			end
			t = {}
			local Horses = PlayerGui.QuickFeedGui.ContainerFrame.Menu.Content.HorseSelect.Horses
			local v5 = v22:GiveTask(v7.new())
			for v63, v72 in Horses:GetDescendants() do
				if v72.Parent.Parent == Horses and v72:IsA("GuiButton") then
					local Unable = v72:FindFirstChild("Unable")
					if Unable and tonumber(v72.Name) then
						local function onVisibilityChanged() --[[ onVisibilityChanged | Line: 252 | Upvalues: Unable (copy), v72 (copy), v5 (copy), v2 (ref), v9 (ref), v22 (ref), v13 (ref) ]]
							if not Unable.Visible then
								local v1 = v72.Parent
								v5:DoCleaning()
								v5:GiveTask(v2.SetGuiPointTo({
									Direction = "Up",
									Offset = -3,
									GuiElement = v72,
									NextElement = function() --[[ NextElement | Line: 263 | Upvalues: v9 (ref), v1 (copy) ]]
										local v12 = v9.GetSelectedSlot()
										if not v12 then
											return true
										end
										return v12.Name ~= v1.Name
									end
								}))
								v22:GiveTask(v2.SetGuiPointTo({
									Direction = "Up",
									Offset = -3,
									GuiElement = function() --[[ GuiElement | Line: 271 | Upvalues: v9 (ref), v5 (ref), v13 (ref) ]]
										if v9.GetSelectedSlot() then
											v5:DoCleaning()
											return v13:GetTip().TipFrame.Menu.Content.Buttons:FindFirstChild("Feed"):FindFirstChild("1")
										end
									end,
									NextElement = function() --[[ NextElement | Line: 286 ]]
										return true
									end
								}))
							end
						end
						v22:GiveTask(Unable:GetPropertyChangedSignal("Visible"):Connect(onVisibilityChanged))
						onVisibilityChanged()
					end
				end
			end
		end)
	end)
	local v72 = v15:GetItemValue("Apple")
	local v8 = v72.Value
	v22._connection = v72:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 303 | Upvalues: v72 (copy), v8 (ref), v9 (ref), v6 (ref), v22 (copy), v32 (copy), Instruction (ref), v16 (copy), v12 (ref), v42 (copy) ]]
		local v1 = v72.Value
		if v8 <= v1 then
			v8 = v1
			return
		end
		v9.Close()
		v6.Close()
		v22._connection = nil
		v32:set(2)
		Instruction.Visible = true
		if v16 then
			task.wait(1)
		else
			v22._activated2 = v12.Once(function() --[[ Line: 322 | Upvalues: v42 (ref) ]]
				v42:Fire()
			end)
			v42:Wait()
		end
	end)
	v22:DoCleaning()
	Instruction.Visible = true
	if v16 then
		v62 = true
		v15.LearnToFeedYourHorse = nil
		return
	end
	v3:DisplayItem({
		Amount = 5,
		Description = "You received 5 Apples!",
		DoAnimatedIntro = true,
		ItemName = "Apple"
	})
	v3.YieldForNoDisplay()
	v3:DisplayItem({
		Amount = 5,
		Description = "You received 5 Woven Lassos!",
		DoAnimatedIntro = true,
		ItemName = "WovenLasso"
	})
	v3.YieldForNoDisplay()
	v62 = true
	v15.LearnToFeedYourHorse = nil
end
return t