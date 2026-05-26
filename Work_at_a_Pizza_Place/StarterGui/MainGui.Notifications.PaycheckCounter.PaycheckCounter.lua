-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
Library:Load("Utility")
Library:Load("Events")
local v1 = Library:Load("SoundFX")
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
require(PlayerGui:WaitForChild("GuiManager"))
local LocalPlayer = game.Players.LocalPlayer
local PaycheckAmount = script.Parent:WaitForChild("PaycheckAmount")
local AmountTemplate = script.Parent:WaitForChild("AmountTemplate")
local Line = script.Parent:WaitForChild("Line")
local t = {}
local v2 = script.Parent
local v3 = false
local v4 = if MainGui.AbsoluteSize.Y > 400 then 1.4 else 1
local v5 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local v6 = 0
PaycheckAmount.Size = UDim2.new(0, PaycheckAmount.AbsoluteSize.X * v4, 0, PaycheckAmount.AbsoluteSize.Y * v4)
PaycheckAmount.Position = UDim2.new(1, PaycheckAmount.AbsoluteSize.X, 1, 0)
PaycheckAmount.Visible = true
AmountTemplate.Size = UDim2.new(0, AmountTemplate.AbsoluteSize.X * v4, 0, AmountTemplate.AbsoluteSize.Y * v4)
function RefreshLine() --[[ RefreshLine | Line: 31 | Upvalues: PaycheckAmount (copy), t (copy), Line (copy) ]]
	local X = PaycheckAmount.AbsoluteSize.X
	for i, v in ipairs(t) do
		if v.AbsoluteSize.X < X then
			X = v.AbsoluteSize.X
		end
	end
	Line.Visible = true
	Line.Position = UDim2.new(1, 0, 1, -PaycheckAmount.AbsoluteSize.Y)
	Line.Size = UDim2.new(0, X, 0, 1)
end
function ShowAmount(p1, p2, p3, p4) --[[ ShowAmount | Line: 45 | Upvalues: LocalPlayer (copy), AmountTemplate (copy), v5 (copy), v2 (copy), v1 (copy), v4 (copy), PaycheckAmount (copy), t (copy), v3 (ref), v6 (ref), Line (copy) ]]
	if LocalPlayer:GetAttribute("TimesDidJob") == 0 then
		return
	end
	local v12 = 0.2
	local v22 = AmountTemplate:clone()
	v22.Visible = true
	v22.Text = v5.FormatNumber("Plus", p2, v22)
	v22.Parent = v2
	local function PlaySound(p1) --[[ PlaySound | Line: 53 | Upvalues: v1 (ref), p4 (copy), LocalPlayer (ref) ]]
		local v12 = v1:GetSoundObject(p1):clone()
		v12.Pitch = 1 + p4 * 0.0594
		v12.Parent = LocalPlayer.SoundFolder
		v12.Ended:connect(function() --[[ Line: 57 | Upvalues: v12 (copy) ]]
			v12:Destroy()
		end)
		v12:Play()
	end
	if p3 == 2 then
		PlaySound("DeliveredX2")
		v22.TextColor3 = Color3.fromRGB(255, 211, 35)
		v22.Size = UDim2.new(0, 80 * v4, 0, 60 * v4)
		v22.TextStrokeTransparency = 0
		v22.TextStrokeColor3 = Color3.fromRGB(255, 245, 130)
		v12 = 0.7
	elseif p3 == 10 then
		PlaySound("DeliveredX10")
		v22.TextColor3 = Color3.fromRGB(255, 211, 35)
		v22.Size = UDim2.new(0, 120 * v4, 0, 80 * v4)
		v22.TextStrokeTransparency = 0
		spawn(function() --[[ Line: 77 | Upvalues: v22 (copy) ]]
			local sum = Random.new(tick()):NextInteger(1, 359)
			while v22 and v22.Parent do
				v22.TextColor3 = Color3.fromHSV(sum / 359, 1, 1)
				v22.TextStrokeColor3 = Color3.fromHSV((359 - sum) / 359, 1, 1)
				if sum > 359 then
					sum = 0
				end
				wait()
				sum = sum + 3
			end
		end)
		v12 = 1.5
	else
		PlaySound("Delivered")
	end
	local Y = PaycheckAmount.AbsolutePosition.Y
	for i, v in ipairs(t) do
		if v.AbsolutePosition.Y < Y then
			Y = v.AbsolutePosition.Y
		end
	end
	v22.Position = UDim2.new(1, v22.AbsoluteSize.X, 0, Y)
	local v32 = t
	table.insert(v32, v22)
	v3 = false
	v22:TweenPosition(UDim2.new(1, -5, 0, Y), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, v12, true, function() --[[ Line: 113 | Upvalues: t (ref), v6 (ref), p1 (copy), PaycheckAmount (ref), v5 (ref), p2 (copy), v22 (copy), Line (ref), v3 (ref) ]]
		wait(0.5)
		if #t == 1 then
			v6 = p1
			PaycheckAmount.Text = v5.FormatNumber("Int", p1, PaycheckAmount)
			PaycheckAmount:TweenPosition(UDim2.new(1, -5, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.5, true, function() --[[ Line: 119 ]]
				RefreshLine()
			end)
		end
		wait(0.8)
		local count = p2
		while count > 0 do
			count = count - 1
			v22.Text = v5.FormatNumber("Plus", count, v22)
			v6 = v6 + 1
			PaycheckAmount.Text = v5.FormatNumber("Number", v6, PaycheckAmount)
			wait(0.05)
		end
		table.remove(t, 1)
		v22:Destroy()
		while #t ~= 0 do
			wait(0.1)
		end
		Line.Visible = false
		wait(1.5)
		if v3 then
			return
		end
		v3 = true
		PaycheckAmount:TweenPosition(UDim2.new(1, PaycheckAmount.AbsoluteSize.X, 1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.5, false)
		delay(0.5, function() --[[ Line: 160 | Upvalues: v3 (ref) ]]
			v3 = false
		end)
	end)
end
workspace.Main.PizzaDelivered.OnClientEvent:connect(ShowAmount)