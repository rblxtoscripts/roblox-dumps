-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Utility")
local v2 = Library:Load("Events")
local v3 = Library:Load("SoundFX")
local v4 = Library:Load("Date")
local v5 = Library:Load("Queue")
local v6 = script.Parent
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local GuiTop = PlayerGui:WaitForChild("GuiTop")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local v7 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local Dialog = require(game.ReplicatedStorage:WaitForChild("Dialog"))
local v8 = GuiManager:RegisterWindow(v6, "Left", "Right", 0.6)
v8.IsGamepadNavigateable = false
v8.CanBeCanceled = false
local v9 = GuiManager:GetWindowDataByName("Menu")
local CashOut = v6:WaitForChild("CashOut")
local AButton = v6:WaitForChild("AButton")
local Title = v6:WaitForChild("Title")
local Check = v6:WaitForChild("Check")
local Amount = Check:WaitForChild("Amount"):WaitForChild("Box"):WaitForChild("Amount")
local VIP = Amount.Parent:WaitForChild("VIP")
local OriginalAmount = VIP.Parent:WaitForChild("OriginalAmount")
local Date = Check:WaitForChild("Date"):WaitForChild("Date")
local For = Check:WaitForChild("For"):WaitForChild("For")
local PlayerName = Check:WaitForChild("To"):WaitForChild("PlayerName")
v4.date()
local t = {
	["Daily Check"] = {
		For = "joining the game today",
		BackgroundColor = Color3.new(255/255, 185/255, 185/255)
	},
	Paycheck = {
		For = "working",
		BackgroundColor = Color3.new(255/255, 255/255, 255/255)
	},
	["Uncashed Paycheck"] = {
		For = "coins you didn\'t claim from last play session",
		BackgroundColor = Color3.new(238/255, 192/255, 255/255)
	},
	["Bonus Check from Manager"] = {
		For = "being a good worker",
		BackgroundColor = Color3.new(169/255, 230/255, 255/255)
	},
	["Starter Check"] = {
		For = "playing for the first time",
		BackgroundColor = Color3.new(255/255, 255/255, 255/255)
	},
	["Moneyz Purchase Check"] = {
		For = "buying coins",
		BackgroundColor = Color3.new(140/255, 255/255, 114/255)
	},
	["Bundle Check"] = {
		For = "coins from bundle purchase",
		BackgroundColor = Color3.new(140/255, 255/255, 114/255)
	},
	["Coin Chest Bonus"] = {
		For = "someone bought coins from your chest",
		BackgroundColor = Color3.new(145/255, 91/255, 46/255)
	},
	["Watching Ad Reward"] = {
		For = "watching a video ad",
		BackgroundColor = Color3.fromRGB(170, 155, 255)
	}
}
_G.CoinSounds = {}
local v10 = v3:GetSoundObject("Coin")
for i = 1, 10 do
	local v11 = v10:clone()
	v11.Parent = v6
	table.insert(_G.CoinSounds, v11)
end
local v12 = _G.GamepadEnabled and MainGui.Menu:WaitForChild("GamepadMoneyz"):WaitForChild("Icon") or MainGui.Menu:WaitForChild("CoinCounter"):WaitForChild("Moneyz"):WaitForChild("Icon")
local v13 = 1
local v14 = false
function _G.CoinAnimation(p1, p2, p3) --[[ Line: 83 | Upvalues: v13 (ref), LocalPlayer (copy), v1 (copy), GuiTop (copy), v12 (copy) ]]
	local v14 = Instance.new("BindableEvent")
	v14.Parent = workspace
	delay(0.01, function() --[[ Line: 90 | Upvalues: v13 (ref), p1 (copy), LocalPlayer (ref), v14 (copy), p2 (copy), p3 (copy), v1 (ref), GuiTop (ref), v12 (ref) ]]
		v13 = 1
		local sum = p1
		local v15 = LocalPlayer.Moneyz.Value + p1
		local sum_2 = 3
		local count = 1
		local v2 = 0.1
		while sum > 0 do
			local v3 = sum < sum_2 and sum or sum_2
			local v4 = sum
			v14:Fire("CoinSpawned", sum)
			local sum_3 = p2
			if p3 then
				sum_3 = sum_3 + Vector2.new(math.random(0, p3.X), math.random(0, p3.Y))
			end
			v1:TweenAbsolutePosition(GuiTop, v12, sum_3, v12.AbsolutePosition, Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.5, function() --[[ Line: 117 | Upvalues: v13 (ref), v2 (ref), LocalPlayer (ref), v3 (copy), v4 (copy), sum_2 (ref), v15 (copy) ]]
				if v13 > 10 then
					v13 = 1
				end
				_G.CoinSounds[v13].Pitch = 1.005 - v2 / 20
				_G.CoinSounds[v13]:Play()
				v13 = v13 + 1
				LocalPlayer.Moneyz.Value = LocalPlayer.Moneyz.Value + v3
				v2 = v2 - 0.005
				if not (v4 < sum_2) then
					return
				end
				LocalPlayer.Moneyz.Value = v15
			end)
			if math.floor(count / 20) == count / 20 then
				sum_2 = sum_2 + count
			end
			if sum <= sum_2 then
				v14:Fire("Finished")
				break
			end
			sum = sum - sum_2
			wait(v2)
			count = count + 1
		end
	end)
	return v14
end
local v15 = v5.new()
function ShowCheck(p1, p2, p3) --[[ ShowCheck | Line: 172 | Upvalues: v2 (copy), LocalPlayer (copy), OriginalAmount (copy), VIP (copy), Amount (copy), v7 (copy), v15 (copy), v3 (copy), Check (copy), t (copy), For (copy), PlayerName (copy), Date (copy), Title (copy), v8 (copy), CashOut (copy), v14 (ref), AButton (copy), v9 (copy), Dialog (copy) ]]
	if p1 == nil and p2 == nil then
		_G.DailyCheckCashed = true
		v2:Fire("DailyCheckCashed")
		return
	end
	if LocalPlayer:FindFirstChild("VIP") and (p2 == "Daily Check" or p2 == "Paycheck") then
		OriginalAmount.Visible = true
		VIP.Visible = true
		Amount.TextColor3 = Color3.fromRGB(255, 223, 61)
		Amount.TextStrokeTransparency = 0
		Amount.TextStrokeColor3 = Color3.fromRGB(134, 97, 12)
		if p2 == "Daily Check" then
			OriginalAmount.Text = v7.FormatNumber("NumberWithDecimal", p1 / 2, OriginalAmount)
		elseif p2 == "Paycheck" or p2 == "Uncashed Paycheck" then
			OriginalAmount.Text = v7.FormatNumber("NumberWithDecimal", p1 - p1 / 3, OriginalAmount)
		end
	else
		OriginalAmount.Visible = false
		VIP.Visible = false
		Amount.TextStrokeTransparency = 1
		Amount.TextColor3 = Color3.fromRGB(0, 0, 0)
	end
	if not _G.StartedPlaying then
		v2:Wait("StartedPlaying")
	end
	v15:Wait()
	local v1, v22 = pcall(function() --[[ Line: 209 | Upvalues: v3 (ref), Check (ref), t (ref), p2 (copy), For (ref), Amount (ref), v7 (ref), p1 (copy), PlayerName (ref), LocalPlayer (ref), Date (ref), Title (ref), v8 (ref), CashOut (ref), v14 (ref), AButton (ref), v9 (ref), p3 (copy), v2 (ref) ]]
		workspace.Main.FadeMusic.FadeMusic:Invoke("Out", true)
		v3:PlaySound("Paycheck")
		Check.BackgroundColor3 = t[p2].BackgroundColor
		For.Text = t[p2].For
		Amount.Text = v7.FormatNumber("NumberWithDecimal", p1, Amount)
		PlayerName.Text = LocalPlayer.DisplayName
		Date.Text = v7.FormatNumber("Date", tick(), Date)
		Title.Text = if p2 == "Moneyz Purchase Check" then "Coin Purchase" else p2
		v8:SetVisible(true)
		if v7.GamepadEnabled then
			v14 = false
			CashOut.Visible = false
			AButton.Visible = true
			while not v14 do
				wait(0.1)
			end
		else
			CashOut.MouseButton1Click:wait()
		end
		if p2 == "Starter Check" then
			v9:SetVisible(true)
		end
		local v32 = false
		local v4 = _G.CoinAnimation(p1, Amount.AbsolutePosition, Vector2.new(Amount.AbsoluteSize.X, 0))
		v4.Event:connect(function(p1, p2) --[[ Line: 242 | Upvalues: Amount (ref), v7 (ref), v32 (ref), v4 (copy) ]]
			if p1 == "CoinSpawned" then
				Amount.Text = v7.FormatNumber("NumberWithDecimal", p2, Amount)
				return
			end
			if p1 ~= "Finished" then
				return
			end
			Amount.Text = v7.FormatNumber("NumberWithDecimal", 0, Amount)
			v32 = true
			v4:Destroy()
		end)
		while not v32 do
			wait(0.5)
		end
		wait(1)
		v8:SetVisible(false)
		workspace.Main.GivePaycheck:FireServer(p2, p3)
		workspace.Main.CheckGiven:Fire(p2)
		workspace.Main.FadeMusic.FadeMusic:Invoke("In", true)
		delay(1, function() --[[ Line: 267 | Upvalues: v2 (ref) ]]
			_G.DailyCheckCashed = true
			v2:Fire("DailyCheckCashed")
		end)
	end)
	if v1 then
		v15:Next()
		return
	end
	Dialog:ShowMessage("Error 5910", "There was an error. Please rejoin")
	spawn(function() --[[ Line: 275 | Upvalues: v22 (copy) ]]
		error(v22)
	end)
	v15:Next()
end
workspace.Main.GivePaycheck.OnClientEvent:connect(ShowCheck)
workspace.Main.GivePaycheck.GivePaycheck.Event:connect(ShowCheck)
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 290 | Upvalues: v6 (copy) ]] end)
v8:RegisterGamepadAction(Enum.KeyCode.ButtonA, function(p1, p2, p3) --[[ Line: 303 | Upvalues: v14 (ref), AButton (copy) ]]
	if p2 ~= Enum.UserInputState.Begin then
		return
	end
	v14 = true
	AButton.Visible = false
end)