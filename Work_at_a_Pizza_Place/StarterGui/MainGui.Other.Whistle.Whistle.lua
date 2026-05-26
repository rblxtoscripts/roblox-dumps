-- https://lua.expert/
local v1 = require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local v2 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
require(game.ReplicatedStorage:WaitForChild("Dialog"))
local v3 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local LocalPlayer = game.Players.LocalPlayer
local Notes = v2:WaitForChild("Notes")
local v4 = GuiManager:RegisterWindow(v2, "Bottom", "Bottom")
v4.IsGamepadNavigateable = false
v4.CanBeFocused = false
local Template = v2:WaitForChild("Template")
local t = {
	Enum.KeyCode.Backquote,
	Enum.KeyCode.One,
	Enum.KeyCode.Two,
	Enum.KeyCode.Three,
	Enum.KeyCode.Four,
	Enum.KeyCode.Five,
	Enum.KeyCode.Six,
	Enum.KeyCode.Seven,
	Enum.KeyCode.Eight,
	Enum.KeyCode.Nine,
	Enum.KeyCode.Zero,
	Enum.KeyCode.Minus,
	Enum.KeyCode.Equals,
	Enum.KeyCode.Backspace
}
local noteIds = v3.noteIds
local v5 = if UserInputService.KeyboardEnabled then {
	"`",
	"1",
	"2",
	"3",
	"4",
	"5",
	"6",
	"7",
	"8",
	"9",
	"0",
	"-",
	"+",
	"Bksp"
} or {
	"D",
	"E",
	"F",
	"G",
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"G",
	"A",
	"B",
	"C"
} else {
	"D",
	"E",
	"F",
	"G",
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"G",
	"A",
	"B",
	"C"
}
local t2 = {}
local t3 = {}
local t4 = {}
local v6 = false
local v7 = tick()
local v8 = nil
function HighlightNote(p1) --[[ HighlightNote | Line: 40 | Upvalues: v8 (ref), t2 (copy) ]]
	if v8 then
		v8.Style = "RobloxRoundButton"
	end
	local v1 = t2[p1]
	v1.Style = "RobloxRoundDefaultButton"
	v8 = v1
	if _G.GamepadEnabled then
		return
	end
	delay(0.15, function() --[[ Line: 49 | Upvalues: v1 (copy), v8 (ref) ]]
		if v1.Style ~= "RobloxRoundDefaultButton" then
			return
		end
		v8 = nil
		v1.Style = "RobloxRoundButton"
	end)
end
local function PlayNote(p1) --[[ PlayNote | Line: 58 | Upvalues: v6 (ref), v7 (ref), LocalPlayer (copy), noteIds (copy), t3 (ref), t4 (ref) ]]
	if v6 then
		return
	end
	v6 = true
	HighlightNote(p1)
	local v1 = if tick() - v7 >= 0.45 then 0 else tick() - v7
	v7 = tick()
	workspace.Main.WhistleNotePlayed:FireServer(v1, LocalPlayer.Character.Head, noteIds[p1])
	if t3[p1].IsPlaying then
		if t4[p1].IsPlaying then
			t3[p1]:Play()
		else
			t4[p1]:Play()
		end
	else
		t3[p1]:Play()
	end
	wait(0.15)
	v6 = false
end
local function CreateSounds(p1) --[[ CreateSounds | Line: 96 | Upvalues: t3 (ref), t4 (ref), noteIds (copy) ]]
	t3 = {}
	t4 = {}
	for i, v in ipairs({ t3, t4 }) do
		for i2, v2 in ipairs(noteIds) do
			local Sound = Instance.new("Sound")
			Sound.SoundId = "rbxassetid://" .. v2
			Sound.Volume = 2
			Sound.Parent = p1
			table.insert(v, Sound)
		end
	end
end
CreateSounds(LocalPlayer.Character:WaitForChild("Head"))
wait(1)
LocalPlayer.CharacterAdded:connect(function(p1) --[[ Line: 115 | Upvalues: CreateSounds (copy) ]]
	CreateSounds(p1:WaitForChild("Head"))
end)
for i, v in ipairs(v5) do
	local v9 = Template:clone()
	v9.Visible = true
	spawn(function() --[[ Line: 123 | Upvalues: v3 (copy), v9 (copy), v (copy) ]]
		if v3.IsEnglish() then
			v9.Text = v
		else
			v9.Text = ""
		end
	end)
	v9.Parent = Notes
	v9.MouseButton1Click:connect(function() --[[ Line: 131 | Upvalues: PlayNote (copy), i (copy) ]]
		PlayNote(i)
	end)
	table.insert(t2, v9)
end
local t5 = {}
local v10 = 1
local v11 = false
function HookEvents() --[[ HookEvents | Line: 146 | Upvalues: UserInputService (copy), t (copy), ContextActionService (copy), PlayNote (copy), t5 (copy), v10 (ref), v1 (copy), v4 (copy), v11 (ref), LocalPlayer (copy), v7 (ref) ]]
	if UserInputService.KeyboardEnabled and not _G.GamepadEnabled then
		for i, v in ipairs(t) do
			ContextActionService:BindAction("NoteButton" .. tostring(i), function(p1, p2, p3) --[[ Line: 149 | Upvalues: PlayNote (ref), i (copy) ]]
				if p2 ~= Enum.UserInputState.Begin then
					return
				end
				PlayNote(i)
			end, false, v)
			table.insert(t5, "NoteButton" .. tostring(i))
		end
	else
		if not _G.GamepadEnabled then
			spawn(function() --[[ Line: 193 | Upvalues: v11 (ref), LocalPlayer (ref), v7 (ref) ]]
				while v11 do
					local Whistle = LocalPlayer.Character:FindFirstChild("Whistle")
					if Whistle and (tick() - v7 > 1 and Whistle.Whistle.Enabled) then
						Whistle.Whistle.Enabled = false
					elseif Whistle and (tick() - v7 <= 1 and not Whistle.Whistle.Enabled) then
						Whistle.Whistle.Enabled = true
					end
					wait(0.1)
				end
			end)
			return
		end
		v10 = 1
		local v3 = 1
		HighlightNote(v10)
		ContextActionService:BindAction("NoteHighlighter", function(p1, p2, p3) --[[ Line: 164 | Upvalues: v10 (ref), v1 (ref), v3 (ref) ]]
			v10 = math.floor((v1:Map(p3.Position.X, -1, 1, 1, 14)))
			print(v10)
			if v10 == v3 then
				return
			end
			HighlightNote(v10)
			v3 = v10
		end, false, Enum.KeyCode.Thumbstick1)
		ContextActionService:BindAction("CloseWindow", function(p1, p2, p3) --[[ Line: 173 | Upvalues: v4 (ref) ]]
			if p2 ~= Enum.UserInputState.Begin then
				return
			end
			v4:SetVisible(false)
		end, false, Enum.KeyCode.ButtonB)
		ContextActionService:BindAction("PlayNote", function(p1, p2, p3) --[[ Line: 180 | Upvalues: PlayNote (ref), v10 (ref) ]]
			if p2 ~= Enum.UserInputState.Begin then
				return
			end
			PlayNote(v10)
		end, false, Enum.KeyCode.ButtonA)
		table.insert(t5, "PlayNote")
		table.insert(t5, "CloseWindow")
		table.insert(t5, "NoteHighlighter")
	end
	spawn(function() --[[ Line: 193 | Upvalues: v11 (ref), LocalPlayer (ref), v7 (ref) ]]
		while v11 do
			local Whistle = LocalPlayer.Character:FindFirstChild("Whistle")
			if Whistle and (tick() - v7 > 1 and Whistle.Whistle.Enabled) then
				Whistle.Whistle.Enabled = false
			elseif Whistle and (tick() - v7 <= 1 and not Whistle.Whistle.Enabled) then
				Whistle.Whistle.Enabled = true
			end
			wait(0.1)
		end
	end)
end
local t6 = {}
local t7 = {}
local LocalPlayer_2 = game.Players.LocalPlayer
local t8 = {
	[869111684] = true,
	[869112058] = true,
	[868964990] = true,
	[868965072] = true,
	[868965201] = true,
	[868965292] = true,
	[868965388] = true,
	[868965458] = true,
	[868965559] = true,
	[868965711] = true,
	[868965797] = true,
	[868965936] = true,
	[869111262] = true,
	[869111431] = true
}
workspace.Main.WhistleNotePlayed.OnClientEvent:connect(function(p1, p2, p3, p4) --[[ Line: 232 | Upvalues: LocalPlayer_2 (copy), t8 (copy), t6 (copy), t7 (copy) ]]
	if not p1 or (not p1.Character or (not p3 or (not p3.Parent or (LocalPlayer_2 == p1 or not (LocalPlayer_2:DistanceFromCharacter(p3.Position) < 200))))) then
		return
	end
	if not t8[p4] then
		return
	end
	local Sound = Instance.new("Sound")
	Sound.SoundId = "rbxassetid://" .. p4
	Sound.Volume = 2
	Sound.Parent = p3
	t6[p1] = t6[p1] or {}
	table.insert(t6[p1], {
		Delay = p2,
		Sound = Sound
	})
	if t7[p1] then
		return
	end
	t7[p1] = true
	wait(0.45)
	while #t6[p1] > 0 do
		local Sound_2 = t6[p1][1].Sound
		wait(t6[p1][1].Delay)
		if Sound_2 and Sound_2.Parent then
			Sound_2:Play()
		end
		delay(2, function() --[[ Line: 269 | Upvalues: Sound_2 (copy), Sound (copy) ]]
			if not (Sound_2 and Sound_2.Parent) then
				return
			end
			Sound:Destroy()
		end)
		table.remove(t6[p1], 1)
	end
	t7[p1] = false
end)
workspace.Animation.AnimationStarted.AnimationStarted.Event:connect(function(p1) --[[ Line: 286 | Upvalues: v4 (copy) ]]
	if p1 ~= "Whistle" then
		return
	end
	v4:SetVisible(true)
end)
local v12 = false
workspace.Animation.AnimationStopped.AnimationStopped.Event:connect(function(p1) --[[ Line: 293 | Upvalues: v12 (ref), v4 (copy) ]]
	if p1 ~= "Whistle" then
		return
	end
	v12 = true
	v4:SetVisible(false)
end)
local v13 = nil
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 304 | Upvalues: v2 (copy), v11 (ref), v13 (ref), v1 (copy), noteIds (copy), v12 (ref), t5 (copy), ContextActionService (copy) ]]
	if p1 ~= v2 then
		return
	end
	v11 = p2
	if _G.GamepadEnabled then
		game:GetService("GuiService").GuiNavigationEnabled = not p2
		if p2 then
			v13 = game:GetService("GuiService").SelectedObject
			game:GetService("GuiService").SelectedObject = nil
		else
			game:GetService("GuiService").SelectedObject = v13
			v13 = nil
		end
	end
	if p2 then
		game:GetService("GuiService").SelectedObject = nil
		HookEvents()
		workspace.Main.FadeMusic.FadeMusic:Invoke("Out", false)
		v1:PreloadId(noteIds)
		return
	end
	if not v12 then
		workspace.Animation.StopAnimation.StopAnimation:Fire("Whistle", 0.1)
		v12 = false
	end
	for i, v in ipairs(t5) do
		ContextActionService:UnbindAction(v)
	end
	workspace.Main.FadeMusic.FadeMusic:Invoke("In", false)
end)