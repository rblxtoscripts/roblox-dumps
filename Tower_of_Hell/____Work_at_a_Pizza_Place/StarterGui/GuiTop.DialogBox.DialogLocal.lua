-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
Library:Load("Utility")
local v1 = Library:Load("Queue")
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
PlayerGui:WaitForChild("UIEvents")
local v2 = script.Parent
local Body = v2:WaitForChild("Body")
local Yes = Body:WaitForChild("Yes")
local No = Body:WaitForChild("No")
local Title = v2:WaitForChild("Title")
local Message = Body:WaitForChild("Message")
local AButton = Body:WaitForChild("AButton")
local BButton = Body:WaitForChild("BButton")
local Cancel = v2:WaitForChild("Cancel")
local MoneyzAmount = Body:WaitForChild("MoneyzAmount")
local Amount = MoneyzAmount:WaitForChild("Amount")
local v3 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local v4 = GuiManager:RegisterWindow(v2, "Left", "Right")
v4.IsGamepadNavigateable = false
local v5 = v1.new()
local v6 = nil
local Position = Yes.Position
function ShowDialog(p1, p2, p3, p4, p5, p6) --[[ ShowDialog | Line: 41 | Upvalues: v5 (copy), v6 (ref), Title (copy), v4 (copy), No (copy), v3 (copy), Message (copy), MoneyzAmount (copy), Amount (copy), Yes (copy), Cancel (copy), AButton (copy), BButton (copy) ]]
	v5:Wait()
	v6 = nil
	Title.Text = p1
	v4:SetVisible(true)
	No.MoneyzIcon.Visible = false
	if p4 and p4 == "GET" and _G.GamepadEnabled then
		p4 = "Get Coins"
	elseif p4 and p4 == "GET" and v3.IsEnglish() then
		No.MoneyzIcon.Visible = true
		p4 = "Get     "
	elseif p4 and p4 == "GET" then
		No.MoneyzIcon.Visible = true
		No.MoneyzIcon.AnchorPoint = Vector2.new(0.5, 0.5)
		No.MoneyzIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
		p4 = "i"
	end
	if string.match(p2, "%d+") == p2 then
		Message.Visible = false
		MoneyzAmount.Visible = true
		Amount.Text = v3.FormatNumber("Number", tonumber(p2), Amount) or p2
		Amount.Size = UDim2.new(0, 500, Amount.Size.Y.Offset)
		local X = game:GetService("TextService"):GetTextSize(Amount.Text, Amount.TextSize, Amount.Font, Vector2.new(Amount.AbsoluteSize.X, Amount.AbsoluteSize.Y)).X
		Amount.Size = UDim2.new(Amount.Size.X.Scale, X + 1, Amount.Size.Y.Scale, Amount.Size.Y.Offset)
	else
		Message.Text = p2
		Message.Visible = true
		MoneyzAmount.Visible = false
	end
	Yes.Foreground.TextLabel.Text = p3 or ""
	No.Foreground.TextLabel.Text = p4 or ""
	local v1 = false
	local v2 = Yes.MouseButton1Click:connect(function() --[[ Line: 95 | Upvalues: p3 (copy), v1 (ref), p2 (copy), MoneyzAmount (ref), v3 (ref), v6 (ref) ]]
		if p3 ~= "Claim" or v1 then
			v6 = true
			return
		end
		v1 = true
		local v12 = false
		local v32 = _G.CoinAnimation(tonumber(p2), MoneyzAmount.MoneyzIcon.AbsolutePosition)
		v32.Event:connect(function(p1, p2) --[[ Line: 102 | Upvalues: MoneyzAmount (ref), v3 (ref), v12 (ref), v32 (copy) ]]
			if p1 == "CoinSpawned" then
				MoneyzAmount.Amount.Text = v3.FormatNumber("Int", p2, MoneyzAmount.Amount)
				return
			end
			if p1 ~= "Finished" then
				return
			end
			MoneyzAmount.Amount.Text = v3.FormatNumber("Int", 0, MoneyzAmount.Amount)
			v12 = true
			v32:Destroy()
		end)
		while not v12 do
			wait(0.5)
		end
		wait(1)
		v6 = true
	end)
	local v32 = No.MouseButton1Click:connect(function() --[[ Line: 123 | Upvalues: v6 (ref) ]]
		v6 = false
	end)
	local v42 = Cancel.MouseButton1Click:connect(function() --[[ Line: 127 | Upvalues: v6 (ref) ]]
		v6 = false
	end)
	Cancel.Visible = if p3 == "Claim" then false else true
	if p4 == "" or p4 == nil then
		No.Visible = false
		Yes.AnchorPoint = Vector2.new(0.5, 1)
	else
		No.Visible = true
		Yes.AnchorPoint = Vector2.new(1, 1)
	end
	local v7, v8, v9 = v2, v32, v42
	local v10 = p4 or ""
	AButton.TextLabel.Text = p3
	BButton.TextLabel.Text = v10
	local X = AButton.Icon.AbsoluteSize.X
	AButton.Size = UDim2.new(0, AButton.TextLabel.TextBounds.X + X, 0, X)
	BButton.Size = UDim2.new(0, BButton.TextLabel.TextBounds.X + X, 0, X)
	if v3.GamepadEnabled then
		Message.Size = UDim2.new(1, 0, 0.905, 0)
		Yes.Visible = false
		No.Visible = false
		AButton.Visible = true
		if v10 == "" then
			BButton.Visible = false
			AButton.Position = UDim2.new(0.5, 0, 1, 20)
		else
			BButton.Visible = true
			AButton.Position = UDim2.new(0.25, 0, 1, 20)
		end
	end
	while v6 == nil do
		wait()
	end
	v7:disconnect()
	v8:disconnect()
	v9:disconnect()
	if not p5 then
		v4:SetVisible(false)
		wait(v4.TweenDuration)
		v5:Next()
		return
	end
	if p6 then
		workspace.MessageService.DialogButtonPressed.DialogButtonPressed:Fire(v6)
	else
		workspace.MessageService.DialogButtonPressed:FireServer(v6)
	end
	v4:SetVisible(false)
	wait(v4.TweenDuration)
	v5:Next()
end
if not v3.GamepadEnabled then
	workspace.MessageService.Dialog.Dialog.Event:connect(ShowDialog)
	workspace.MessageService.Dialog.OnClientEvent:connect(ShowDialog)
	return
end
v4:RegisterGamepadAction(Enum.KeyCode.ButtonA, function(p1, p2, p3) --[[ Line: 205 | Upvalues: v6 (ref) ]]
	if p2 ~= Enum.UserInputState.Begin then
		return
	end
	v6 = true
end)
v4:RegisterGamepadAction(Enum.KeyCode.ButtonB, function(p1, p2, p3) --[[ Line: 211 | Upvalues: v6 (ref) ]]
	if p2 ~= Enum.UserInputState.Begin then
		return
	end
	v6 = false
end)
workspace.MessageService.Dialog.Dialog.Event:connect(ShowDialog)
workspace.MessageService.Dialog.OnClientEvent:connect(ShowDialog)