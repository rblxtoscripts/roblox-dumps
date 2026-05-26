-- https://lua.expert/
local tbl = {}
local t = {}
local v1 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
PlayerGui:WaitForChild("UIEvents")
local Debug = require(game.ReplicatedStorage:WaitForChild("Debug"))
local v2 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local BubbleChatLocal = require(game.ReplicatedStorage:WaitForChild("BubbleChatLocal"))
local v3 = Library:Load("SoundFX")
local ResponsePanel = v1:WaitForChild("ResponsePanel")
local v4 = false
local v5 = false
local LocalPlayer = game.Players.LocalPlayer
local CurrentCamera = workspace.CurrentCamera
local v6 = LocalPlayer:GetAttribute("QuickCashier") or 0
local v7 = GuiManager:RegisterWindow(ResponsePanel, "Left", "Left")
v7.FirstSelectedObject = ResponsePanel:WaitForChild("Choice1")
v7.TweenDuration = 0.3 * (1 - v6)
local t2 = {
	[ResponsePanel:WaitForChild("Choice1")] = nil,
	[ResponsePanel:WaitForChild("Choice2")] = nil,
	[ResponsePanel:WaitForChild("Choice3")] = nil,
	[ResponsePanel:WaitForChild("Choice4")] = nil,
	[ResponsePanel:WaitForChild("Choice5")] = nil
}
local v8 = nil
function EnableBubbles(p1) --[[ EnableBubbles | Line: 44 | Upvalues: PlayerGui (copy) ]]
	for i, v in ipairs(PlayerGui.CustomerBubbles:GetChildren()) do
		if v.Name == "BillboardTemplate" and (v.Adornee and (v.Adornee:FindFirstChild("InUse") and not v.Adornee.InUse.Value)) then
			v.Enabled = p1
		end
	end
end
function StartConversation(p1) --[[ StartConversation | Line: 53 | Upvalues: tbl (copy), v8 (ref), v5 (ref), LocalPlayer (copy) ]]
	if not tbl[p1].Enabled then
		return
	end
	workspace.Dialog:FireServer("ClickedBubble", p1)
	v8 = p1
	EnableBubbles(false)
	v5 = true
	workspace.TutorialService.PlayerAction:FireServer("ClickedBubble", true)
	if p1.Parent:FindFirstChild("IsOnPhone") then
		return
	end
	repeat
		if not v5 then
			return
		end
		wait(0.1)
	until LocalPlayer:DistanceFromCharacter(p1.Position) > 20
	workspace.Dialog:FireServer("EndConversation", p1)
	workspace.MessageService.ShowHint.ShowHint:Fire("Chat ended because you walked away.", 3)
end
function AddClickableBubble(p1) --[[ AddClickableBubble | Line: 78 | Upvalues: PlayerGui (copy), v5 (ref), tbl (copy), t (copy), LocalPlayer (copy), v3 (copy), v2 (copy), v8 (ref), v7 (copy) ]]
	local v1 = script.Parent.BillboardTemplate:clone()
	v1.Parent = PlayerGui:WaitForChild("CustomerBubbles")
	v1.Adornee = p1
	v1.Enabled = not v5
	tbl[p1] = v1
	t[p1] = v1.ClickableBubble.MouseButton1Click:connect(function() --[[ Line: 89 | Upvalues: LocalPlayer (ref), p1 (copy) ]]
		if LocalPlayer:DistanceFromCharacter(p1.Position) < 20 then
			StartConversation(p1)
		else
			workspace.MessageService.ShowHint.ShowHint:Fire("You are too far away to chat.", 2)
		end
	end)
	if p1:FindFirstChild("X10") then
		v1.Glow.Visible = true
		spawn(function() --[[ Line: 106 | Upvalues: v1 (copy) ]]
			local sum = Random.new(tick()):NextInteger(1, 359)
			while v1 and (v1.Parent and (v1:FindFirstChild("ClickableBubble") and v1.ClickableBubble.Visible == true)) do
				v1.ClickableBubble.ImageColor3 = Color3.fromHSV(sum / 359, 0.5882352941176471, 1)
				v1.Glow.ImageColor3 = Color3.fromHSV(sum / 359, 0.5882352941176471, 1)
				if sum > 359 then
					sum = 0
				end
				wait(0.06)
				sum = sum + 5
			end
		end)
		v3:Preload("CorrectX10", "DeliveredX10")
	elseif p1:FindFirstChild("X2") then
		v1.Glow.Visible = true
		v1.ClickableBubble.ImageColor3 = Color3.fromRGB(255, 232, 117)
		v1.Glow.ImageColor3 = Color3.fromRGB(255, 232, 117)
	elseif v2.DarkThemeDialog then
		tbl[p1].ClickableBubble.ImageColor3 = Color3.fromRGB(31, 31, 31)
		tbl[p1].ClickableBubble.ImageTransparency = 0.3
		tbl[p1].Key.Image = "rbxassetid://2134726128"
		tbl[p1].Key.ImageColor3 = Color3.fromRGB(255, 119, 0)
		tbl[p1].Talk.TextColor3 = Color3.fromRGB(255, 119, 0)
	end
	p1.ChildRemoved:connect(function(p12) --[[ Line: 136 | Upvalues: t (ref), p1 (copy), tbl (ref), v8 (ref), v7 (ref), v5 (ref) ]]
		if p12.Name ~= "Dialog" then
			return
		end
		t[p1]:disconnect()
		t[p1] = nil
		tbl[p1]:Destroy()
		if v8 ~= p1 then
			return
		end
		v7:SetVisible(false)
		v5 = false
		v8 = nil
	end)
end
workspace.Main.StartConversation.Event:Connect(StartConversation)
game.ReplicatedStorage.GlobalData.DoubleTime.Changed:connect(function() --[[ Line: 154 | Upvalues: tbl (copy) ]]
	local DoubleTime = game.ReplicatedStorage.GlobalData.DoubleTime.Value
	for k, v in pairs(tbl) do
		if k and (k.Parent and (k.Parent.Parent == workspace.Customers and v:FindFirstChild("ClickableBubble"))) then
			if v.ClickableBubble.ImageColor3 == Color3.new(255/255, 255/255, 255/255) and DoubleTime then
				v.ClickableBubble.ImageColor3 = Color3.fromRGB(255, 232, 117)
				v.Glow.Visible = true
				continue
			end
			if v.ClickableBubble.ImageColor3 == Color3.fromRGB(255, 232, 117) and not DoubleTime then
				v.ClickableBubble.ImageColor3 = Color3.new(255/255, 255/255, 255/255)
				v.Glow.Visible = false
			end
		end
	end
end)
game.ReplicatedStorage.GlobalData.NeonTime.Changed:connect(function() --[[ Line: 175 | Upvalues: tbl (copy), v3 (copy) ]]
	local NeonTime = game.ReplicatedStorage.GlobalData.NeonTime.Value
	for k, v in pairs(tbl) do
		if k and (k.Parent and (k.Parent.Parent == workspace.Customers and v:FindFirstChild("ClickableBubble"))) then
			if NeonTime then
				v.ClickableBubble.ImageColor3 = Color3.fromRGB(255, 232, 117)
				v.Glow.Visible = true
				spawn(function() --[[ Line: 186 | Upvalues: v (copy) ]]
					local sum = Random.new(tick()):NextInteger(1, 359)
					while v and (v.Parent and (v:FindFirstChild("ClickableBubble") and (v.ClickableBubble.Visible == true and game.ReplicatedStorage.GlobalData.NeonTime.Value))) do
						v.ClickableBubble.ImageColor3 = Color3.fromHSV(sum / 359, 0.5882352941176471, 1)
						v.Glow.ImageColor3 = Color3.fromHSV(sum / 359, 0.5882352941176471, 1)
						if sum > 359 then
							sum = 0
						end
						wait(0.06)
						sum = sum + 5
					end
				end)
				v3:Preload("CorrectX10", "DeliveredX10")
				continue
			end
			v.ClickableBubble.ImageColor3 = Color3.fromRGB(255, 255, 255)
			v.Glow.Visible = false
		end
	end
end)
function ChildAdded(p1, p2) --[[ ChildAdded | Line: 209 ]]
	wait()
	delay(p2 or 0, function() --[[ Line: 211 | Upvalues: p1 (copy) ]]
		local Head = p1:WaitForChild("Head", 5)
		if not Head then
			return
		end
		p1.Name = p1.Name
		AddClickableBubble(Head)
	end)
end
workspace.Customers.ChildAdded:connect(ChildAdded)
workspace.Customers.ChildRemoved:connect(function(p1) --[[ Line: 221 | Upvalues: tbl (copy) ]]
	if not (p1:FindFirstChild("Head") and tbl[p1.Head]) then
		return
	end
	tbl[p1.Head]:Destroy()
end)
for i, v in ipairs(workspace.Customers:GetChildren()) do
	if v:FindFirstChild("Head") and v.Head:FindFirstChild("Dialog") then
		ChildAdded(v, true)
	end
end
for i, v in ipairs({ game.ReplicatedStorage, game.Workspace }) do
	for i2, v9 in ipairs(v:GetDescendants()) do
		if v9.Name == "NPC" and v9:IsA("IntValue") then
			ChildAdded(v9.Parent)
		end
	end
end
function BubbleClicked(p1) --[[ BubbleClicked | Line: 252 | Upvalues: tbl (copy) ]]
	if not (p1 and (p1.Parent and tbl[p1])) then
		return
	end
	tbl[p1].Enabled = false
end
function ConversationFinished(p1) --[[ ConversationFinished | Line: 259 | Upvalues: v8 (ref), v7 (copy), v5 (ref), Debug (copy), v6 (ref) ]]
	if p1 == v8 then
		v7:SetVisible(false)
		v5 = false
		v8 = nil
	end
	if Debug.Enabled and Debug.FastCustomerSpawn then
		wait()
	else
		wait(6 * (1 - v6))
	end
	EnableBubbles(true)
end
function AlreadyInConversation() --[[ AlreadyInConversation | Line: 276 | Upvalues: v8 (ref), v5 (ref) ]]
	EnableBubbles(true)
	v8 = nil
	v5 = false
end
local v9 = 3
function ShowResponseOptions(p1, p2) --[[ ShowResponseOptions | Line: 286 | Upvalues: v8 (ref), v5 (ref), t2 (copy), ResponsePanel (copy), v2 (copy), v9 (ref), v7 (copy), v4 (ref) ]]
	if not (v8 and v5) then
		return
	end
	for i, v in ipairs(t2) do
		t2[i] = nil
	end
	for i, v in ipairs(p1) do
		local TextLabel = ResponsePanel["Choice" .. i].TextLabel
		TextLabel.TextScaled = false
		local v1, _ = v.UserDialog:gsub("/(%a+)", "")
		TextLabel.Font = v2.Localization:GetLanguageId() == "ru" and Enum.Font.Arial or Enum.Font.Cartoon
		TextLabel.Text = v1
		t2[ResponsePanel["Choice" .. i]] = v
		spawn(function() --[[ Line: 306 | Upvalues: TextLabel (copy) ]]
			wait()
			if TextLabel.TextFits then
				return
			end
			TextLabel.TextScaled = true
		end)
	end
	v9 = #p1 + 1
	ResponsePanel["Choice" .. v9].TextLabel.Text = "Goodbye!"
	t2[ResponsePanel["Choice" .. v9]] = nil
	v7:SetVisible(true)
	v4 = false
	local count = 0
	while not v4 do
		wait(0.1)
		if count == 150 and v8 then
			workspace.MessageService.ShowHint.ShowHint:Fire("", 4)
			workspace.Dialog:FireServer("EndConversation", v8)
			return
		end
		count = count + 1
	end
end
workspace.Dialog.OnClientEvent:connect(function(p1, ...) --[[ Line: 350 | Upvalues: MainGui (copy), BubbleChatLocal (copy), LocalPlayer (copy) ]]
	local t = { ... }
	if p1 == "BubbleClicked" then
		BubbleClicked(t[1])
		return
	end
	if p1 == "ConversationFinished" then
		ConversationFinished(t[1])
		return
	end
	if p1 == "AlreadyInConveration" then
		AlreadyInConversation()
		return
	end
	if p1 == "ShowResponseOptions" then
		ShowResponseOptions(t[1], t[2])
		return
	end
	if p1 ~= "Chat" or not (MainGui.AbsoluteSize.Y > 400) then
		return
	end
	BubbleChatLocal:ShowChatBubbleLocal(LocalPlayer.Character.Head, t[1], {
		DoTranslation = true,
		PlayPopSound = true
	})
end)
function ResponseSelected(p1) --[[ ResponseSelected | Line: 397 | Upvalues: v7 (copy), ResponsePanel (copy), t2 (copy), v8 (ref), v4 (ref) ]]
	v7.LastSelection = ResponsePanel.Choice1
	v7:SetVisible(false)
	workspace.Dialog:FireServer("ResponseSelected", t2[p1], v8)
	v4 = true
end
for i, v in ipairs(ResponsePanel:GetChildren()) do
	if v:IsA("TextButton") then
		v.MouseButton1Click:connect(function() --[[ Line: 406 | Upvalues: v (copy) ]]
			ResponseSelected(v)
		end)
	end
end
function changeTextSize(p1) --[[ changeTextSize | Line: 419 | Upvalues: ResponsePanel (copy) ]]
	for i, v in ipairs(ResponsePanel:GetChildren()) do
		if v:IsA("TextButton") then
			v.FontSize = p1
		end
	end
end
function ScaleChoices(p1) --[[ ScaleChoices | Line: 427 | Upvalues: ResponsePanel (copy) ]]
	for i, v in ipairs(ResponsePanel:GetChildren()) do
		if v:IsA("TextButton") then
			ResponsePanel["Choice" .. i].Size = UDim2.new(1, -7, 0, p1)
			ResponsePanel["Choice" .. i].Position = UDim2.new(0, 7, 0, (i - 1) * p1)
		end
	end
end
function handleResize() --[[ handleResize | Line: 437 | Upvalues: ResponsePanel (copy), v9 (ref) ]]
	if workspace.CurrentCamera.ViewportSize.Y < 600 then
		ResponsePanel.Size = UDim2.new(0, 330, 0, v9 * 70)
		ResponsePanel.Position = UDim2.new(0.03, -20, 1, -v9 * 70)
		changeTextSize(Enum.FontSize.Size24)
		ScaleChoices(70)
	else
		ResponsePanel.Size = UDim2.new(0, 350, 0, v9 * 72)
		ResponsePanel.Position = UDim2.new(0.03, 0, 0.95, -v9 * 72)
		ScaleChoices(72)
		changeTextSize(Enum.FontSize.Size24)
	end
end
v1.Changed:connect(function(p1) --[[ Line: 451 ]]
	if p1 ~= "AbsoluteSize" then
		return
	end
	handleResize()
end)
handleResize()
local v10 = Vector2.new(MainGui.AbsoluteSize.X / 2, MainGui.AbsoluteSize.Y / 2)
local v11 = MainGui.AbsoluteSize.X / 3
local v12 = nil
local function ShowHideIcons(p1, p2) --[[ ShowHideIcons | Line: 467 | Upvalues: v12 (ref), v2 (copy) ]]
	if _G.GamepadEnabled then
		v12.XButton.Visible = p2
		v12.Talk.Visible = p2
		return
	end
	if v2.IsMobile then
		v12.TouchButton.Visible = p2
	else
		v12.Key.Visible = p2
		v12.Talk.Visible = p2
	end
end
workspace.Main.BuffsChanged.OnClientEvent:Connect(function() --[[ Line: 484 | Upvalues: v6 (ref), LocalPlayer (copy), v7 (copy) ]]
	v6 = LocalPlayer:GetAttribute("QuickCashier") or 0
	v7.TweenDuration = 0.3 * (1 - v6)
end)
_G.BindedWithDialog = false
local v13 = false
while true do
	wait(1)
	local v14 = v11
	for k, v in pairs(tbl) do
		if v.Enabled and v:FindFirstChild("XButton") then
			local v15 = k:FindFirstChild("ConversationDistance") ~= nil and k.ConversationDistance.Value or 20
			if LocalPlayer:DistanceFromCharacter(k.Position) < v15 then
				local v16 = CurrentCamera:WorldToScreenPoint(k.Position)
				local v18 = math.pow(v16.X - v10.X, 2)
				local v21 = math.sqrt(v18 + math.pow(v16.Y - v10.Y, 2))
				if v21 < v14 then
					if v12 and v12.Parent then
						if _G.GamepadEnabled then
							v12.XButton.Visible = false
							v12.Talk.Visible = false
						elseif v2.IsMobile then
							v12.TouchButton.Visible = false
						else
							v12.Key.Visible = false
							v12.Talk.Visible = false
						end
					end
					v12 = v
					if _G.GamepadEnabled then
						v.XButton.Visible = true
						v.Talk.Visible = true
					elseif v2.IsMobile then
						v.TouchButton.Visible = true
					else
						v.Key.Visible = true
						v.Talk.Visible = true
					end
					v14 = v21
				end
				if v11 < v21 and (v == v12 and v12.Parent) then
					if _G.GamepadEnabled then
						v12.XButton.Visible = false
						v12.Talk.Visible = false
					elseif v2.IsMobile then
						v12.TouchButton.Visible = false
					else
						v12.Key.Visible = false
						v12.Talk.Visible = false
					end
					v12 = nil
				end
				continue
			end
			if v == v12 and v12.Parent then
				if _G.GamepadEnabled then
					v12.XButton.Visible = false
					v12.Talk.Visible = false
				elseif v2.IsMobile then
					v12.TouchButton.Visible = false
				else
					v12.Key.Visible = false
					v12.Talk.Visible = false
				end
				v12 = nil
			end
		end
	end
	if v14 == v11 and v13 then
		game:GetService("ContextActionService"):UnbindAction("TalkToCustomer")
		_G.BindedWithDialog = false
		v13 = false
	else
		if v14 ~= v11 and not v13 then
			_G.BindedWithDialog = true
			game:GetService("ContextActionService"):BindAction("TalkToCustomer", function(p1, p2, p3) --[[ Line: 533 | Upvalues: v12 (ref) ]]
				if p2 ~= Enum.UserInputState.Begin then
					return
				end
				StartConversation(v12.Adornee)
			end, false, Enum.KeyCode.ButtonX, Enum.KeyCode.E)
			v13 = true
		end
		continue
	end
end