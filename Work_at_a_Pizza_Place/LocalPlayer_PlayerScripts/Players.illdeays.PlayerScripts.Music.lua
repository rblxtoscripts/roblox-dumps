-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Utility")
local v2 = Library:Load("Tween")
local v3 = Library:Load("SoundFX")
local v4 = Library:Load("Queue")
local v5 = Library:Load("Events")
game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("UIEvents")
local Debug = require(game.ReplicatedStorage:WaitForChild("Debug"))
require(game.ReplicatedStorage:WaitForChild("Dialog"))
local v6 = require(game.ReplicatedStorage:WaitForChild("Enums"))
MAX_VOLUME = 0.8
local Song = script:WaitForChild("Song")
local LocalPlayer = game.Players.LocalPlayer
local v7 = "Outside"
local GlobalData = game.ReplicatedStorage:WaitForChild("GlobalData")
local v8 = GlobalData:WaitForChild("Season").Value
local v9 = GlobalData:WaitForChild("TimeOfDay").Value
local v10 = GlobalData:WaitForChild("Holiday").Value
local _ = GlobalData:WaitForChild("SeasonVariant").Value
if not LocalPlayer:GetAttribute("AttributesCreated") then
	LocalPlayer:GetAttributeChangedSignal("AttributesCreated"):Wait()
end
local v11 = LocalPlayer:GetAttribute("MusicVersion")
local v12 = tonumber(LocalPlayer:GetAttribute("Music"))
local v13 = nil
local v14 = nil
function GetVolume() --[[ GetVolume | Line: 39 | Upvalues: v1 (copy), v12 (ref) ]]
	return v1:Map(v12, 0, 1, 0, MAX_VOLUME)
end
if Debug.Enabled and not Debug.MusicEnabled then
	v12 = 0
end
Song.Volume = GetVolume()
function GetTimeOfDaySoundTrack() --[[ GetTimeOfDaySoundTrack | Line: 51 | Upvalues: LocalPlayer (copy), v11 (ref), v9 (ref), v10 (copy), v8 (copy) ]]
	if not _G.StartedPlaying and (game.ReplicatedStorage.GlobalData.Holiday.Value ~= "Halloween" and game.ReplicatedStorage.GlobalData.Holiday.Value ~= "Christmas") then
		return 15009452324
	end
	if game.ReplicatedStorage.GlobalData.DoubleTime.Value then
		return 2131060746
	end
	if game.ReplicatedStorage.GlobalData.NeonTime.Value then
		if LocalPlayer:FindFirstChild("NeonTimeToken") then
			return 10296045177
		end
		if v11 == "Oldest Music" then
			return 173607633
		end
		if v11 == "Old Music" then
			return 11236881313
		else
			return 14368531255
		end
	else
		if game.ReplicatedStorage.GlobalData.Rain.Value then
			return 11503772368
		end
		if v9 == "Night" and v10 == "Christmas" then
			return 2645288271
		end
		if v9 == "Night" and v10 == "Halloween" then
			return 2514882365
		end
		if v9 == "Midday" and (v8 == "Winter" and game.ReplicatedStorage.GlobalData.IsSnowing.Value) then
			return 326828757
		end
		if v9 == "Midday" and v10 == "Easter" then
			return 1568825673
		end
		if v9 == "Night" then
			if v11 == "Oldest Music" then
				return 173607581
			end
			if v11 == "Old Music" then
				return 11236880640
			else
				return 14368529723
			end
		elseif v9 == "Morning" then
			if v11 == "Oldest Music" then
				return 11236940954
			end
			if v11 == "Old Music" then
				return 11236879373
			else
				return 15009458940
			end
		elseif v9 == "Midday" then
			if v11 == "Oldest Music" then
				return 173607633
			end
			if v11 == "Old Music" then
				return 11236881313
			else
				return 15009457324
			end
		elseif v9 == "Afternoon" then
			if v11 == "Oldest Music" then
				return 173607522
			end
			if v11 == "Old Music" then
				return 11236806055
			else
				return 15009453916
			end
		else
			if v11 == "Oldest Music" then
				return 173607581
			end
			if v11 == "Old Music" then
				return 11236880640
			else
				return 14368529723
			end
		end
	end
end
local v15 = 0
local v16 = 0
function SetSong(p1, p2, p3) --[[ SetSong | Line: 95 | Upvalues: v15 (ref), v12 (ref), Song (copy), v16 (ref) ]]
	if v15 == p1 then
		return
	end
	v15 = p1
	if not (v12 > 0) then
		return
	end
	if not (if Song.Volume == 0 then true else FadeMusic("Out", true)) then
		return
	end
	if not p2 then
		v16 = Song.TimePosition
	end
	Song:Stop()
	Song.SoundId = p1 and "http://www.roblox.com/asset/?id=" .. p1 or Song.SoundId
	Song:Play()
	if p2 then
		Song.TimePosition = v16
		v16 = 0
	end
	if Song.Volume ~= 0 then
		return
	end
	FadeMusic("In", false)
end
v5.Event("StartedPlaying", function() --[[ Line: 133 ]]
	SetSong(GetTimeOfDaySoundTrack(), true)
end)
LocalPlayer:GetAttributeChangedSignal("Music"):Connect(function() --[[ Line: 137 | Upvalues: v12 (ref), LocalPlayer (copy), Song (copy), v15 (ref) ]]
	v12 = tonumber(LocalPlayer:GetAttribute("Music"))
	Song.Volume = GetVolume()
	if v12 > 0 then
		Song.Looped = true
		if not Song.IsPlaying then
			Song.SoundId = "http://www.roblox.com/asset/?id=" .. v15
			Song:Play()
		end
	else
		Song.Looped = false
	end
end)
LocalPlayer:GetAttributeChangedSignal("MusicVersion"):Connect(function() --[[ Line: 161 | Upvalues: v11 (ref), LocalPlayer (copy) ]]
	v11 = LocalPlayer:GetAttribute("MusicVersion")
	SetSong(GetTimeOfDaySoundTrack(), true)
end)
local function GetZonesByName(p1, p2) --[[ GetZonesByName | Line: 168 ]]
	local t = {}
	for i, v in ipairs(p2.CurrentUpgrade.Value.Rooms:GetChildren()) do
		if v.Name == p1 then
			table.insert(t, v.Value)
		end
	end
	return t
end
spawn(function() --[[ Line: 182 | Upvalues: v1 (copy), v3 (copy), LocalPlayer (copy) ]]
	local v12 = workspace:FindFirstChild("DJ Set")
	if not v12 then
		return
	end
	local v2 = false
	while true do
		wait(5)
		local v32 = v1.IsPointInsideBox(v3:GetSoundZone("Cashier"), LocalPlayer.Character.HumanoidRootPart.Position)
		if v32 and v12.Config.Value ~= 0 then
			SetSong(v12.Config.Value)
			v2 = true
		elseif not v32 and v2 then
			SetSong(GetTimeOfDaySoundTrack(), true)
			v2 = false
		end
	end
end)
workspace.Main.LocationChanged.OnClientEvent:connect(function(p1, p2, p3) --[[ Line: 201 | Upvalues: v12 (ref), LocalPlayer (copy), v1 (copy), v13 (ref), v7 (ref), GetZonesByName (copy), v14 (ref) ]]
	wait()
	print("location changed", p1)
	if p1 == nil and v12 > 0 then
		game.SoundService.CarRadios.Volume = LocalPlayer:GetAttribute("CarRadio")
	else
		game.SoundService.CarRadios.Volume = 0
	end
	if p1 and p2 then
		if p1 == "Porch" and p1 == "Walkway" then
			return
		end
		if LocalPlayer.TeamColor ~= BrickColor.new("Medium stone grey") then
			v1:SendData("ChangeJob", "PlayerChannel", nil, "On Break")
		end
		if v13 then
			v13:disconnect()
			v13 = nil
		end
		v7 = p1
		for i, v in ipairs((GetZonesByName(p1, p2))) do
			for i2, v2 in ipairs(p2.Furniture:GetChildren()) do
				if v2:FindFirstChild("MusicPlayer") and v1.IsPointInsideBox(v, v2.MusicMarker.Position) then
					SetSong(v2.Config.Value)
					v14 = v2
					v13 = v2.Config.Changed:connect(function() --[[ Line: 229 | Upvalues: v2 (copy) ]]
						SetSong(v2.Config.Value)
					end)
					return
				end
			end
		end
		SetSong(GetTimeOfDaySoundTrack(), true)
		v14 = nil
	elseif p1 and (game.ReplicatedStorage.Zones:FindFirstChild(p1) and game.ReplicatedStorage.Zones[p1]:FindFirstChild("SongId")) then
		v7 = p1
		SetSong(game.ReplicatedStorage.Zones[p1].SongId.Value)
	else
		v7 = "Outside"
		SetSong(GetTimeOfDaySoundTrack(), true)
		v14 = nil
	end
end)
workspace.Main.FurnitureAdded.OnClientEvent:connect(function(p1, p2, p3, p4, p5) --[[ Line: 255 | Upvalues: v13 (ref), v14 (ref) ]]
	if p1 ~= _G.CurrentHouse or (p2 ~= _G.CurrentRoomName or (v13 ~= nil or not p3:FindFirstChild("MusicPlayer"))) then
		return
	end
	v13 = p3.Config.Changed:connect(function() --[[ Line: 259 | Upvalues: v14 (ref), p3 (copy) ]]
		v14 = p3
		SetSong(p3.Config.Value)
	end)
end)
FADE_DURATION = 2
local v17 = v4.new()
function FadeMusic(p1, p2) --[[ FadeMusic | Line: 275 | Upvalues: v17 (copy), v2 (copy), Song (copy) ]]
	local v1 = false
	local v22 = false
	v17:Wait(FADE_DURATION * 5)
	if p1 == "Out" then
		v2(Song, "Volume", "Number", Song.Volume, 0, FADE_DURATION, "Linear", "Out"):connect(function(p1, p2, p3) --[[ Line: 280 | Upvalues: v22 (ref), v1 (ref), Song (ref), v17 (ref) ]]
			v22 = p1
			v1 = true
			Song.Volume = 0
			v17:Next()
		end)
	elseif p1 == "In" then
		v2(Song, "Volume", "Number", 0, GetVolume(), FADE_DURATION, "Linear", "Out"):connect(function(p1, p2, p3) --[[ Line: 288 | Upvalues: v22 (ref), v1 (ref), Song (ref), v17 (ref) ]]
			v22 = p1
			v1 = true
			Song.Volume = GetVolume()
			v17:Next()
		end)
	end
	while p2 and not v1 do
		wait()
	end
	return v22
end
workspace.Main.FadeMusic.OnClientEvent:connect(function(p1) --[[ Line: 304 ]]
	FadeMusic(p1)
end)
local function OnInvoke(p1, p2) --[[ OnInvoke | Line: 305 ]]
	FadeMusic(p1, p2)
end
workspace.Main.FadeMusic.FadeMusic.OnInvoke = OnInvoke
local t = {}
local v18 = false
local v19 = 0
workspace.Main.SetRadioEnabled.OnClientEvent:connect(function(p1, p2) --[[ Line: 316 | Upvalues: t (copy), v19 (ref), v18 (ref), v12 (ref), v7 (ref), LocalPlayer (copy), Song (copy), v2 (copy) ]]
	if p1 and not t[p2] then
		t[p2] = true
		v19 = v19 + 1
		if v18 then
			return
		end
		v18 = true
		while v19 > 0 do
			if v12 > 0 and v7 == "Outside" then
				local v1 = false
				for k, v in pairs(t) do
					if k and (k.Parent and (k.Parent.Occupant ~= nil and (k.SoundId ~= "" and LocalPlayer:DistanceFromCharacter(k.Parent.Position) < k.MaxDistance - 13))) then
						v1 = true
					end
				end
				if v1 and Song.Volume ~= 0 then
					v2(Song, "Volume", "Number", Song.Volume, 0, 0.45, "Linear", "Out")
				elseif not v1 and (Song.Volume == 0 and v12 ~= 0) then
					v2(Song, "Volume", "Number", Song.Volume, GetVolume(), 0.45, "Linear", "Out")
				end
			end
			wait(0.5)
		end
		v2(Song, "Volume", "Number", Song.Volume, GetVolume(), 0.45, "Linear", "Out")
		v18 = false
		return
	end
	if p1 or not t[p2] then
		return
	end
	t[p2] = nil
	v19 = v19 - 1
end)
workspace.Main.TimeOfDayChanged.OnClientEvent:connect(function(p1) --[[ Line: 462 | Upvalues: v9 (ref), v16 (ref), v14 (ref), v7 (ref) ]]
	v9 = p1
	v16 = 0
	if v14 ~= nil or v7 ~= nil and game.ReplicatedStorage.Zones:FindFirstChild(v7) then
		return
	end
	SetSong(GetTimeOfDaySoundTrack(), true)
end)
game.ReplicatedStorage.GlobalData.DoubleTime.Changed:connect(function() --[[ Line: 470 | Upvalues: v14 (ref) ]]
	if v14 ~= nil then
		return
	end
	SetSong(GetTimeOfDaySoundTrack(), true)
end)
game.ReplicatedStorage.GlobalData.NeonTime.Changed:connect(function() --[[ Line: 476 | Upvalues: LocalPlayer (copy), v14 (ref) ]]
	if game.ReplicatedStorage.GlobalData.NeonTime.Value == true and LocalPlayer:FindFirstChild("NeonTimeToken") then
		MAX_VOLUME = 2
		if v14 == nil then
			SetSong(GetTimeOfDaySoundTrack(), true)
		end
	else
		if game.ReplicatedStorage.GlobalData.NeonTime.Value ~= false then
			return
		end
		MAX_VOLUME = 0.8
	end
end)
function game.ReplicatedStorage._v6FiRE_Additions.ClassicPt2Event.startChallengeMusic.OnInvoke(p1) --[[ Line: 491 | Upvalues: v12 (ref), LocalPlayer (copy) ]]
	v12 = tonumber(LocalPlayer:GetAttribute("Music"))
	SetSong(({
		Easy = "75896421538306",
		Medium = "130839948814530",
		Hard = "91523090663943",
		Experimental = "102976112274736"
	})[p1], true)
	function SetSong() --[[ Line: 505 ]] end
end
function game.ReplicatedStorage._v6FiRE_Additions.ClassicPt2Event.MuteMusic.OnInvoke() --[[ Line: 508 | Upvalues: v12 (ref) ]]
	v12 = 0
end
game.ReplicatedStorage._v6FiRE_Additions.ClassicPt2Event.UnmuteMusic.Event:Connect(function() --[[ Line: 512 | Upvalues: v12 (ref), LocalPlayer (copy) ]]
	v12 = tonumber(LocalPlayer:GetAttribute("Music"))
end)
if v6.PlaceSettings.DisableAdvantageousFeatures then
	return
end
SetSong(GetTimeOfDaySoundTrack(), true)