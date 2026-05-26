-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local CollectionService = game:GetService("CollectionService")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("StorageUtils")
local v2 = Sonar("InstanceUtils")
local v3 = Sonar("SettingsService", {
	Deferred = true
})
local v4 = Sonar("PlayerWrapper")
local v5 = Sonar("GameVersionUtils")
local v6 = game:GetService("RunService"):IsServer()
local Effects = SoundService:FindFirstChild("Effects")
if not Effects then
	Effects = Instance.new("SoundGroup")
	Effects.Name = "Effects"
	Effects.Parent = SoundService
end
local t2 = {}
local function soundGroupAdded(p1) --[[ soundGroupAdded | Line: 76 | Upvalues: v6 (copy), v2 (copy), v3 (copy), CollectionService (copy) ]]
	if not v6 then
		return
	end
	if not p1:IsA("SoundGroup") then
		return
	end
	v2.Create("EqualizerSoundEffect", {
		Name = "Muffle",
		Enabled = false,
		HighGain = -15,
		MidGain = -7,
		LowGain = 10,
		Priority = 0,
		Parent = p1
	}):AddTag("MuffleEQ")
	if v3.GetSettingFromName(p1.Name) then
		p1.Volume = 0
	end
	local function soundAdded(p12) --[[ soundAdded | Line: 100 | Upvalues: p1 (copy) ]]
		if p12:IsA("Sound") then
			p12.SoundGroup = p1
		end
	end
	CollectionService:GetInstanceAddedSignal(p1.Name):Connect(soundAdded)
	for v1, v22 in CollectionService:GetTagged(p1.Name) do
		if v22:IsA("Sound") then
			v22.SoundGroup = p1
		end
	end
end
local function soundAdded(p1) --[[ soundAdded | Line: 113 | Upvalues: SoundService (copy), t2 (copy), Effects (ref) ]]
	if not p1:IsA("Sound") then
		return
	end
	if not p1.SoundGroup then
		local v1 = p1:FindFirstAncestorWhichIsA("SoundGroup")
		if v1 then
			p1.SoundGroup = v1
		end
	end
	for v2, v3 in SoundService:GetChildren() do
		if v3:IsA("SoundGroup") and p1:HasTag(v3.Name) then
			p1.SoundGroup = v3
			break
		end
	end
	if not p1.SoundGroup then
		table.insert(t2, p1)
		p1.SoundGroup = Effects
	end
	if not (#p1.SoundId <= 0) then
		return
	end
	p1.Played:Once(function() --[[ Line: 139 | Upvalues: p1 (copy) ]]
		local v1 = p1:GetAttribute("SoundId")
		if not v1 then
			return
		end
		if not (#p1.SoundId > 0) then
			p1.SoundId = v1
		end
	end)
end
local function applyProperties(p1, p2) --[[ applyProperties | Line: 154 | Upvalues: Effects (ref) ]]
	if p2.Volume ~= nil then
		p1.Volume = p2.Volume
	end
	if p2.Looped ~= nil then
		p1.Looped = p2.Looped
	end
	if p2.PlaybackSpeed ~= nil then
		p1.PlaybackSpeed = p2.PlaybackSpeed
	end
	if p2.RandomizePitch then
		p1.PlaybackSpeed = p1.PlaybackSpeed * Random.new():NextNumber(p2.RandomizePitch.Min, p2.RandomizePitch.Max)
	end
	if p2.Pitch ~= nil then
		p1.Pitch = p2.Pitch
	end
	if p2.RollOffMaxDistance ~= nil then
		p1.RollOffMaxDistance = p2.RollOffMaxDistance
	end
	if p2.RollOffMinDistance ~= nil then
		p1.RollOffMinDistance = p2.RollOffMinDistance
	end
	if p2.RollOffMode ~= nil then
		p1.RollOffMode = p2.RollOffMode
	end
	p1.TimePosition = p2.TimePosition or p1.TimePosition
	p1.SoundGroup = p2.SoundGroup or p1.SoundGroup or Effects
	if p2.Position then
		local Attachment = Instance.new("Attachment")
		Attachment.WorldPosition = p2.Position
		Attachment.Parent = workspace.Terrain
		p1.Parent = Attachment
		return
	end
	p1.Parent = p2.Parent or Effects
end
function t.makeSound(p1, p2) --[[ makeSound | Line: 186 | Upvalues: v1 (copy), applyProperties (copy) ]]
	local v12 = if p2 then p2 else {}
	local v2 = v1.GetAsset(p1, "SFX")()
	local v3 = if v2:IsA("Folder") then v2:GetChildren()[math.random(1, #v2:GetChildren())]:Clone() else v2:Clone()
	local v6 = v3:GetAttribute("SoundId")
	local v7
	if v3:HasTag("LazyLoadSound") and (v12.LazyLoad ~= false and v12.PlayingSoundOnce ~= true) then
		v7 = v12
	else
		v7 = v12
		local v8 = if #v3.SoundId == 0 then true else false
		v3.SoundId = v12.SoundId or (if v6 then v6 else v3.SoundId)
		if v8 then
			task.wait()
		end
	end
	applyProperties(v3, v7)
	return v3
end
function t.playSoundOnce(p1, p2, p3) --[[ playSoundOnce | Line: 221 | Upvalues: t (copy), applyProperties (copy), Effects (ref), TweenService (copy) ]]
	local v2 = p2 or {}
	local v4 = p3 or {}
	v2.PlayingSoundOnce = true
	local v5
	if type(p1) == "string" then
		v5 = t.makeSound(p1, v2)
	else
		v5 = if p1:IsA("Folder") then p1:GetChildren()[math.random(1, #p1:GetChildren())]:Clone() else p1:Clone()
		applyProperties(v5, v2)
	end
	if not v5.Parent then
		v5.Parent = v2.Parent or Effects
	end
	local Volume = v5.Volume
	if v4.FadeIn and v4.FadeIn > 0 then
		v5.Volume = 0
		v5:Play()
		TweenService:Create(v5, TweenInfo.new(v4.FadeIn), {
			Volume = Volume
		}):Play()
	else
		v5:Play()
	end
	v5.Ended:Once(function() --[[ Line: 250 | Upvalues: v5 (ref) ]]
		local v1 = v5.Parent
		v5:Destroy()
		if not (v1 and v1:IsA("Attachment")) then
			return
		end
		v1:Destroy()
	end)
	if v4.FadeOut and (v4.FadeOut > 0 and not v5.Looped) then
		task.spawn(function() --[[ Line: 259 | Upvalues: v5 (ref), v4 (ref), TweenService (ref) ]]
			local v1 = v5.TimeLength - v5.TimePosition - v4.FadeOut
			if v1 > 0 then
				task.wait(v1)
			end
			if not (v5 and v5.Parent) then
				return
			end
			TweenService:Create(v5, TweenInfo.new(v4.FadeOut), {
				Volume = 0
			}):Play()
		end)
	end
	return v5
end
function t.playSound3D(p1, p2) --[[ playSound3D | Line: 285 ]]
	local SoundId = p1.SoundId
	if not SoundId or SoundId == "" then
		SoundId = p1:GetAttribute("SoundId") or ""
	end
	local v2 = if p2 then p2 else {}
	if SoundId == "" then
		return nil
	end
	local AudioPlayer = Instance.new("AudioPlayer")
	AudioPlayer.AssetId = SoundId
	AudioPlayer.Volume = v2.Volume or p1.Volume
	AudioPlayer.PlaybackSpeed = v2.PlaybackSpeed or p1.PlaybackSpeed
	AudioPlayer.Parent = v2.Parent
	local Wire = Instance.new("Wire")
	Wire.SourceInstance = AudioPlayer
	Wire.TargetInstance = v2.Emitter
	Wire.Parent = AudioPlayer
	AudioPlayer:Play()
	AudioPlayer.Ended:Once(function() --[[ Line: 310 | Upvalues: AudioPlayer (copy) ]]
		AudioPlayer:Destroy()
	end)
	return AudioPlayer
end
function t.SetSoundGroup(p1, p2) --[[ SetSoundGroup | Line: 317 | Upvalues: SoundService (copy) ]]
	if p1:IsA("Sound") then
		p1.SoundGroup = SoundService:FindFirstChild(p2)
	end
end
function t.Init(p1) --[[ Init | Line: 323 | Upvalues: SoundService (copy), soundGroupAdded (copy), soundAdded (copy), CollectionService (copy), v5 (copy), v6 (copy), t2 (copy), v4 (copy) ]]
	SoundService.ChildAdded:Connect(soundGroupAdded)
	for k, v in pairs(SoundService:GetChildren()) do
		soundGroupAdded(v)
	end
	SoundService.DescendantAdded:Connect(soundAdded)
	for k, v in pairs(SoundService:GetDescendants()) do
		soundAdded(v)
	end
	CollectionService:GetInstanceAddedSignal("LazyLoadSound"):Connect(soundAdded)
	for v1, v2 in CollectionService:GetTagged("LazyLoadSound") do
		soundAdded(v2)
	end
	v5.OnServerInitialised(function() --[[ Line: 339 | Upvalues: v6 (ref), t2 (ref) ]]
		if not (v6 and next(t2)) then
			return
		end
		warn("\226\154\160\239\184\143 SoundService, Sounds with no sound group, defaulting to Effects:", t2)
	end)
	if v6 then
		return
	end
	v4.bindToLocalPlayer({
		AfterInit = function(p1, p2) --[[ AfterInit | Line: 347 | Upvalues: SoundService (ref) ]]
			if not p2.GetSettingChangedSignal then
				return
			end
			for v1, v2 in SoundService:GetChildren() do
				if v2:IsA("SoundGroup") then
					local function setVolume() --[[ setVolume | Line: 357 | Upvalues: p2 (copy), v2 (copy) ]]
						v2.Volume = (if p2:GetSetting(v2.Name, "Muted") then 0 else p2:GetSetting(v2.Name)) / 100
					end
					p2.Maid:GiveTask(p2:GetSettingChangedSignal(v2.Name):Connect(setVolume))
					v2.Volume = (if p2:GetSetting(v2.Name, "Muted") then 0 else p2:GetSetting(v2.Name)) / 100
				end
			end
		end
	})
end
task.defer(t.Init)
return t