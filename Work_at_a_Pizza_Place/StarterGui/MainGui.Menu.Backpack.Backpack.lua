-- https://lua.expert/
local v1 = require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local v2 = script.Parent
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("UIEvents")
local v3 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local Debug = require(game.ReplicatedStorage:WaitForChild("Debug"))
local ContextActionService = game:GetService("ContextActionService")
local Right = v2:WaitForChild("Right")
local Left = v2:WaitForChild("Left")
local Expand = v2:WaitForChild("Expand")
local v4 = 5
local v5 = 60
local BButton = Right:WaitForChild("BButton")
local v6 = 1
local v7 = 3
local t = {}
local UIGridLayout = v2:WaitForChild("Tools"):WaitForChild("UIGridLayout")
local ToolTemplate = v2:WaitForChild("Tools"):WaitForChild("ToolTemplate")
ToolTemplate.Visible = false
ToolTemplate.Parent = v2
GuiManager:GetWindowDataByName("Inventory")
local v8 = GuiManager:RegisterWindow(v2)
v8.IsCoreGuiWindow = true
function v8.EquipToolByName(p1, p2) --[[ EquipToolByName | Line: 39 | Upvalues: t (copy) ]]
	for i, v in ipairs(t) do
		if v.Tool.Name == p2 then
			EquipTool(v)
		end
	end
end
function EquipNewestGear() --[[ EquipNewestGear | Line: 47 | Upvalues: t (copy) ]]
	local v1 = nil
	local v2 = nil
	for i, v in ipairs(t) do
		if v.Tool:FindFirstChild("LastEquipTick") then
			local LastEquipTick = v.Tool.LastEquipTick.Value
			if v1 == nil or v1 < LastEquipTick then
				v1 = LastEquipTick
				v2 = v
			end
		end
	end
	if not v2 then
		return
	end
	EquipTool(v2)
end
local v9 = false
function RefreshLayout() --[[ RefreshLayout | Line: 64 | Upvalues: MainGui (copy), v5 (ref), v4 (ref), t (copy), v3 (copy), UIGridLayout (copy), v1 (copy), Expand (copy), v9 (ref), v2 (copy), v7 (ref) ]]
	if MainGui.AbsoluteSize.Y <= 500 then
		v5 = 45
		v4 = v5 / 10
		if #t == 1 then
			v5 = 60
		end
	elseif v3.GamepadEnabled then
		v5 = 80
		v4 = v5 / 10
	else
		v5 = 60
		v4 = v5 / 10
		if #t == 1 then
			v5 = 90
		end
	end
	UIGridLayout.CellSize = UDim2.new(0, v5, 0, v5)
	UIGridLayout.CellPadding = UDim2.new(0, v4, 0, v4)
	local v22 = v1:RoundDown(MainGui.AbsoluteSize.X / 2, v5 + v4) - v4
	local v32 = v22 / (v5 + v4) * 2
	if v32 < #t then
		Expand.Visible = true
	else
		Expand.Visible = false
		if v9 then
			v9 = false
		end
	end
	Expand.Icon.Rotation = if v9 then 180 else 0
	if v9 then
		UIGridLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
		v2.Size = UDim2.new(0, v22, 1, 0)
	elseif MainGui.AbsoluteSize.X / 2 < (v5 + v4) * #t then
		UIGridLayout.VerticalAlignment = Enum.VerticalAlignment.Top
		v2.Size = UDim2.new(0, v22, 0, v5 * 2 + v4)
	else
		UIGridLayout.VerticalAlignment = Enum.VerticalAlignment.Top
		v2.Size = UDim2.new(0, (v5 + v4 + 2) * #t - v4, 0, v5)
	end
	v7 = v1:Clamp(v1:RoundUp(v32 / 3, 1), 2, 9)
end
function GetToolData(p1) --[[ GetToolData | Line: 144 | Upvalues: t (copy) ]]
	for i, v in ipairs(t) do
		if type(p1) == "string" and v.Tool.Name == p1 then
			return v, i
		end
		if type(p1) == "userdata" then
			if p1:IsA("TextButton") and v.Button == p1 then
				return v, i
			end
			if p1:IsA("Tool") and v.Tool == p1 then
				return v, i
			end
		end
	end
end
local v10 = nil
function SetSelection(p1) --[[ SetSelection | Line: 160 | Upvalues: v10 (ref), v3 (copy), BButton (copy) ]]
	if v10 then
		v10.Highlight.Visible = false
	end
	if p1 and (p1.Parent and p1:FindFirstChild("Highlight")) then
		p1.Highlight.Visible = true
		v10 = p1
		if v3.GamepadEnabled then
			BButton.Visible = true
		end
	else
		v10 = nil
		if not v3.GamepadEnabled then
			return
		end
		BButton.Visible = false
	end
end
local v11 = nil
local v12 = nil
function EquipTool(p1) --[[ EquipTool | Line: 184 | Upvalues: LocalPlayer (copy), v11 (ref), v12 (ref), BButton (copy) ]]
	wait()
	if p1 == nil then
		return
	end
	local Button = p1.Button
	local Tool = p1.Tool
	if not Tool or (not Tool.Parent or Tool.Parent ~= LocalPlayer.Character and Tool.Parent ~= LocalPlayer.Backpack) then
		return
	end
	if Tool == v11 and (Tool.Name ~= "Shortcut" or _G.GamepadEnabled) then
		SetSelection(nil)
		if Tool and Tool.Parent then
			Tool.Parent = LocalPlayer.Backpack
		end
		v11 = nil
		BButton.Visible = false
	else
		v12 = p1
		if Tool.Name == "Shortcut" and not _G.GamepadEnabled then
			SetSelection(nil)
		else
			SetSelection(Button)
		end
		if v11 and v11.Parent then
			v11.Parent = LocalPlayer.Backpack
		end
		if Tool and (Tool.Parent and Tool.Parent ~= LocalPlayer.Character) then
			Tool.Parent = LocalPlayer.Character
		end
		v11 = Tool
		if Tool:FindFirstChild("LastEquipTick") and not _G.GamepadEnabled then
			Tool.LastEquipTick.Value = tick()
		end
	end
end
local v13 = 0
function RemoveTool(p1) --[[ RemoveTool | Line: 240 ]]
	GetToolData(p1)
end
function AddTool(p1, p2) --[[ AddTool | Line: 248 | Upvalues: ToolTemplate (copy), v2 (copy), v13 (ref), v10 (ref), v11 (ref), v12 (ref), t (copy), LocalPlayer (copy), v7 (ref), v1 (copy), v6 (ref) ]]
	if p1:IsA("Tool") and not p1:FindFirstChild("NotVisibleInBackpack") then
		local v14, _ = GetToolData(p1)
		if v14 then
			return
		end
		if p1.Name == "GravityHammer" or p1.Name == "TeapotTurret" then
			p1:Destroy()
		else
			local v22 = ToolTemplate:clone()
			v22.Parent = v2.Tools
			v22.Name = p1.Name
			v22.Visible = true
			v22.Visible = true
			if p1.Name == "Shortcut" then
				v22.LayoutOrder = 0
			elseif p1:FindFirstChild("Gear") then
				v22.LayoutOrder = 50 - v13 % 50
			elseif p1:FindFirstChild("PresentType") then
				v22.LayoutOrder = 100 - v13 % 50
			elseif p1:FindFirstChild("PlayerCustomer") then
				v22.LayoutOrder = 200 - v13 % 50
			else
				v22.LayoutOrder = 150 - v13 % 50
			end
			v13 = v13 + 1
			local v3 = false
			local BackgroundColor3 = v22.BackgroundColor3
			local function AddEffect() --[[ AddEffect | Line: 293 | Upvalues: p1 (copy), v3 (ref), v22 (copy), BackgroundColor3 (copy) ]]
				if p1:FindFirstChild("Handle") then
					if p1.Handle:FindFirstChild("X10") and not v3 then
						spawn(function() --[[ Line: 297 | Upvalues: v3 (ref), v22 (ref), p1 (ref) ]]
							v3 = true
							local sum = Random.new(tick()):NextInteger(1, 359)
							while v22 and (v22.Parent and p1.Handle:FindFirstChild("X10")) do
								v22.BackgroundColor3 = Color3.fromHSV(sum / 359, 1, 1)
								if sum > 359 then
									sum = 0
								end
								task.wait(0.1)
								sum = sum + 3
							end
							v22.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
							v3 = false
						end)
						return
					end
					if p1.Handle:FindFirstChild("X2") then
						v22.BackgroundColor3 = Color3.fromRGB(248, 165, 82)
						return
					end
					if v22.BackgroundColor3 == Color3.fromRGB(248, 165, 82) and p1.Handle:FindFirstChild("X2") == nil then
						v22.BackgroundColor3 = BackgroundColor3
					end
				else
					if not p1:FindFirstChild("Type") then
						return
					end
					local Type = p1.Type.Value
					local v1 = Color3.fromRGB(255, 255, 255)
					local BackgroundColor3_2 = v22.BackgroundColor3
					local v2 = 0
					spawn(function() --[[ Line: 327 | Upvalues: v22 (ref), BackgroundColor3_2 (copy), v1 (copy), v2 (ref) ]]
						while true do
							v22.BackgroundColor3 = BackgroundColor3_2:lerp(v1, (math.sin(v2)))
							v2 = v2 + 0.1
							wait()
						end
					end)
				end
			end
			AddEffect()
			local v4 = game.ReplicatedStorage.GlobalData.DoubleTime.Changed:connect(function() --[[ Line: 339 | Upvalues: AddEffect (copy) ]]
				wait(0.1)
				AddEffect()
			end)
			if p1.TextureId == "" then
				v22.Text = p1.Name
				if p1:FindFirstChild("Order") and p1:FindFirstChild("PlayerCustomer") then
					v22.TextScaled = true
				end
			else
				v22.Image.Visible = true
				v22.Image.Image = p1.TextureId
			end
			local function Delete(p1) --[[ Delete | Line: 375 | Upvalues: v10 (ref), v22 (copy), v11 (ref), v12 (ref), v4 (copy), t (ref) ]]
				if v10 == v22 then
					v10 = nil
					SetSelection(nil)
				end
				if v11 == p1.Tool then
					v11 = nil
				end
				if v12 == p1 then
					v12 = nil
				end
				v4:disconnect()
				v22:Destroy()
				if p1.AncestryEvent then
					p1.AncestryEvent:Disconnect()
				end
				for i, v in ipairs(t) do
					if v == p1 then
						table.remove(t, i)
					end
				end
				RefreshLayout()
			end
			local t2 = {
				Button = v22,
				Tool = p1,
				GetBaseColor = function() --[[ Line: 415 | Upvalues: p1 (copy) ]]
					if p1:FindFirstChild("Handle") and p1.Handle:FindFirstChild("X2") then
						return Color3.fromRGB(248, 165, 82)
					else
						return Color3.fromRGB(31, 31, 31)
					end
				end
			}
			t2.AncestryEvent = p1.AncestryChanged:Connect(function(p12, p2) --[[ Line: 423 | Upvalues: p1 (copy), LocalPlayer (ref), Delete (copy), t2 (copy) ]]
				if p1:IsDescendantOf(LocalPlayer.Character) or p1:IsDescendantOf(LocalPlayer.Backpack) then
					return
				end
				Delete(t2)
			end)
			v22.MouseButton1Click:connect(function() --[[ Line: 450 | Upvalues: t2 (copy) ]]
				EquipTool(t2)
			end)
			local v5 = tick()
			local count = 1
			local v62 = nil
			local v72 = nil
			for i, v in ipairs(t) do
				if v.Tool and (v.Tool.Parent and v.Tool:FindFirstChild("LastEquipTick")) then
					if v.Tool.Name == p1.Name and p1 ~= v.Tool then
						v72 = v.Tool
						v62 = true
						break
					end
					if v.Tool.LastEquipTick.Value < v5 then
						v72 = v.Tool
						v5 = v.Tool.LastEquipTick.Value
					end
					count = count + 1
				end
			end
			if v62 or v7 < count and v72 then
				v1:SendData("RemoveGear", "PlayerChannel", nil, v72)
			end
			local v8 = t
			table.insert(v8, t2)
			table.sort(t, function(p1, p2) --[[ Line: 507 ]]
				return p1.Button.LayoutOrder < p2.Button.LayoutOrder
			end)
			if _G.GamepadEnabled then
				local _2, v9 = GetToolData(p1)
				v6 = v9
			end
			if p2 then
				spawn(function() --[[ Line: 524 | Upvalues: t2 (copy) ]]
					EquipTool(t2)
				end)
			else
				local BackgroundColor3_2 = v22.BackgroundColor3
				game:GetService("TweenService"):Create(v22, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
					BackgroundColor3 = Color3.new(255/255, 255/255, 255/255)
				}):Play()
				delay(0.3, function() --[[ Line: 531 | Upvalues: v22 (copy), BackgroundColor3_2 (copy) ]]
					if not (v22 and v22.Parent) then
						return
					end
					game:GetService("TweenService"):Create(v22, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
						BackgroundColor3 = BackgroundColor3_2
					}):Play()
				end)
			end
			RefreshLayout()
		end
		return
	end
	print("CANCELING, ALREADY IN BACKPACK")
end
MainGui.Changed:connect(function(p1) --[[ Line: 554 ]]
	if p1 ~= "AbsoluteSize" then
		return
	end
	RefreshLayout()
end)
RefreshLayout()
local function Unequip() --[[ Unequip | Line: 562 | Upvalues: v12 (ref), v11 (ref), BButton (copy) ]]
	if v12 then
		v11 = v12.Tool
		EquipTool(v12)
	end
	BButton.Visible = false
end
local function UpdateConnections() --[[ UpdateConnections | Line: 572 | Upvalues: LocalPlayer (copy) ]]
	local v1 = LocalPlayer:WaitForChild("Backpack", 10) or LocalPlayer:WaitForChild("Backpack", 10)
	v1.ChildAdded:connect(function(p1) --[[ Line: 576 | Upvalues: LocalPlayer (ref), v1 (copy) ]]
		wait()
		if not p1 or p1.Parent ~= LocalPlayer.Character and p1.Parent ~= v1 then
			return
		end
		if p1:FindFirstChild("DontAutoEquip") then
			AddTool(p1, false)
			return
		end
		AddTool(p1, true)
	end)
	while not (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")) do
		wait(0.1)
	end
	LocalPlayer.Character.ChildAdded:connect(function(p1) --[[ Line: 600 ]]
		if not (p1 and (p1.Parent and p1:IsA("Tool"))) then
			return
		end
		AddTool(p1, true)
	end)
	for i, v in ipairs(v1:GetChildren()) do
		AddTool(v, false)
	end
end
Expand.MouseButton1Click:Connect(function() --[[ Line: 619 | Upvalues: v9 (ref) ]]
	v9 = not v9
	RefreshLayout()
end)
workspace.Main.UnequipTools.Event:connect(function() --[[ Line: 625 | Upvalues: v12 (ref), v11 (ref), BButton (copy) ]]
	if v12 then
		v11 = v12.Tool
		EquipTool(v12)
	end
	BButton.Visible = false
end)
LocalPlayer.ChildRemoved:connect(function(p1) --[[ Line: 629 | Upvalues: UpdateConnections (copy) ]]
	if p1.Name ~= "Backpack" then
		return
	end
	wait()
	UpdateConnections()
end)
UpdateConnections()
local v14 = false
if v3.GamepadEnabled then
	local function BumperPressed(p1) --[[ BumperPressed | Line: 647 | Upvalues: v14 (ref), t (copy), v6 (ref) ]]
		if not v14 then
			EquipTool(t[v6])
			return
		end
		if t[v6 + p1] then
			EquipTool(t[v6 + p1])
			v6 = v6 + p1
			return
		end
		if v6 + p1 <= 0 then
			EquipTool(t[#t])
			v6 = #t
			return
		end
		if not (#t < v6 + p1) then
			return
		end
		EquipTool(t[1])
		v6 = 1
	end
	local function SetBackpackActive() --[[ SetBackpackActive | Line: 668 | Upvalues: v14 (ref), ContextActionService (copy), v12 (ref), v11 (ref), BButton (copy) ]]
		if v14 then
			return
		end
		v14 = true
		ContextActionService:BindAction("Unequip", function(p1_2_2, p2_2_2, p3_2_2) --[[ Line: 671 | Upvalues: v14 (ref), ContextActionService (ref), v12 (ref), v11 (ref), BButton (ref) ]]
			if p2_2_2 ~= Enum.UserInputState.Begin then
				return
			end
			v14 = false
			ContextActionService:UnbindAction("Unequip")
			if v12 then
				v11 = v12.Tool
				EquipTool(v12)
			end
			BButton.Visible = false
		end, false, Enum.KeyCode.ButtonB)
		BButton.Visible = true
	end
	v8:RegisterGamepadAction(Enum.KeyCode.ButtonL1, function(p1, p2, p3) --[[ Line: 696 | Upvalues: v2 (copy), BumperPressed (copy), v14 (ref), ContextActionService (copy), v12 (ref), v11 (ref), BButton (copy) ]]
		if p2 ~= Enum.UserInputState.Begin or not v2.Visible then
			return
		end
		BumperPressed(-1)
		if v14 then
			return
		end
		v14 = true
		ContextActionService:BindAction("Unequip", function(p1_2_2, p2_2_2, p3_2_2) --[[ Line: 671 | Upvalues: v14 (ref), ContextActionService (ref), v12 (ref), v11 (ref), BButton (ref) ]]
			if p2_2_2 ~= Enum.UserInputState.Begin then
				return
			end
			v14 = false
			ContextActionService:UnbindAction("Unequip")
			if v12 then
				v11 = v12.Tool
				EquipTool(v12)
			end
			BButton.Visible = false
		end, false, Enum.KeyCode.ButtonB)
		BButton.Visible = true
	end)
	v8:RegisterGamepadAction(Enum.KeyCode.ButtonR1, function(p1, p2, p3) --[[ Line: 706 | Upvalues: v2 (copy), BumperPressed (copy), v14 (ref), ContextActionService (copy), v12 (ref), v11 (ref), BButton (copy) ]]
		if p2 ~= Enum.UserInputState.Begin or not v2.Visible then
			return
		end
		BumperPressed(1)
		if v14 then
			return
		end
		v14 = true
		ContextActionService:BindAction("Unequip", function(p1_2_2, p2_2_2, p3_2_2) --[[ Line: 671 | Upvalues: v14 (ref), ContextActionService (ref), v12 (ref), v11 (ref), BButton (ref) ]]
			if p2_2_2 ~= Enum.UserInputState.Begin then
				return
			end
			v14 = false
			ContextActionService:UnbindAction("Unequip")
			if v12 then
				v11 = v12.Tool
				EquipTool(v12)
			end
			BButton.Visible = false
		end, false, Enum.KeyCode.ButtonB)
		BButton.Visible = true
	end)
	v8:GamepadActionsEnabled(true)
else
	for i, v in ipairs({
		Enum.KeyCode.One,
		Enum.KeyCode.Two,
		Enum.KeyCode.Three,
		Enum.KeyCode.Four,
		Enum.KeyCode.Five,
		Enum.KeyCode.Six,
		Enum.KeyCode.Seven,
		Enum.KeyCode.Eight,
		Enum.KeyCode.Nine,
		Enum.KeyCode.Zero
	}) do
		ContextActionService:BindAction("ToolButton" .. tostring(i), function(p1, p2, p3) --[[ Line: 724 | Upvalues: t (copy), i (copy), v2 (copy) ]]
			if p2 ~= Enum.UserInputState.Begin or not (t[i] and v2.Visible) then
				return
			end
			EquipTool(t[i])
		end, false, v)
	end
end
local v15 = false
workspace.Main.HighlightPizzaByHouse.OnClientEvent:connect(function(p1) --[[ Line: 737 | Upvalues: t (copy), v15 (ref) ]]
	for i, v in ipairs(t) do
		if v.Tool:FindFirstChild("House") and v.Tool.House.Value then
			if p1 == nil then
				v.Button.BackgroundTransparency = 0.1
				v.Button.BackgroundColor3 = v.GetBaseColor()
				v15 = false
				continue
			end
			if v.Tool.House.Value == p1 then
				v.Button.BackgroundTransparency = 0
				v.Button.BackgroundColor3 = Color3.fromRGB(81, 255, 0)
				v15 = true
				local v1 = true
				spawn(function() --[[ Line: 749 | Upvalues: v15 (ref), v (copy), v1 (ref) ]]
					while v15 and (v.Tool and v.Tool.Parent) do
						v1 = not v1
						v.Button.BackgroundColor3 = v1 and Color3.fromRGB(81, 255, 0) or v.GetBaseColor()
						wait(0.5)
					end
					if not (v.Button and v.Button.Parent) then
						return
					end
					v.Button.BackgroundColor3 = v.GetBaseColor()
				end)
			end
		end
	end
end)
GuiManager.OnGlobalClientEvent(function(p1, ...) --[[ Line: 767 ]]
	if p1 ~= "EquipNewestGear" then
		return
	end
	EquipNewestGear()
end)
local Position = v2.Position
local AnchorPoint = v2.AnchorPoint
wait(1)
if Debug.Enabled and not Debug.IntroEnabled then
	v8:SetVisible(false)
	v8:SetVisible(true)
end
if v3.IsPartyServer then
	v8:SetVisible(true)
end
if not v3.IntroSequenceEnabled or v3.PlaceSettings.SkipIntro then
	v8:SetVisible(false)
	v8:SetVisible(true)
end
if not v3.GamepadEnabled then
	return
end
Right.Visible = true
Left.Visible = true