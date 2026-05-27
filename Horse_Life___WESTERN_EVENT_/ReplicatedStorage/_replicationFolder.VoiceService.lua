-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VoiceChatService = game:GetService("VoiceChatService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("InstanceUtils")
local v2 = Sonar("PlayerWrapper")
local v3 = NumberRange.new(0.01, 0.07)
local function setupPlayer(p1, p2) --[[ setupPlayer | Line: 16 | Upvalues: v1 (copy), VoiceChatService (copy) ]]
	p2:GiveTask((task.spawn(function() --[[ Line: 17 | Upvalues: p1 (copy), v1 (ref), VoiceChatService (ref), p2 (copy) ]]
		local AudioDeviceInput = p1:WaitForChild("AudioDeviceInput", 10)
		if AudioDeviceInput and p1.Parent then
			AudioDeviceInput.Volume = 1
			local v12 = v1.Create("AudioAnalyzer", {
				SpectrumEnabled = false,
				Name = p1.Name .. "_VoiceAnalyzer",
				Parent = VoiceChatService
			})
			v1.Create("Wire", {
				Parent = v12,
				SourceInstance = AudioDeviceInput,
				TargetInstance = v12
			})
			p2:GiveTask(v12)
			p2.VoiceAnalyzer = v12
			p2.VoiceInput = AudioDeviceInput
		end
	end)))
end
function t.GetVoiceLevel(p1) --[[ GetVoiceLevel | Line: 65 | Upvalues: v2 (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	if v1 and v1.VoiceAnalyzer then
		return v1.VoiceAnalyzer.RmsLevel, v1.VoiceAnalyzer.PeakLevel
	else
		return 0, 0
	end
end
function t.GetVoiceAmount(p1) --[[ GetVoiceAmount | Line: 74 | Upvalues: v2 (copy), v3 (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	if not (v1 and (v1.VoiceAnalyzer and v1.VoiceInput)) then
		return false, 0
	end
	local v22 = v1.VoiceInput.Active and not v1.VoiceInput.Muted
	local RmsLevel = v1.VoiceAnalyzer.RmsLevel
	local v32 = if v22 then if v3.Min < RmsLevel then true else false else v22
	return v32, if v32 then math.clamp((RmsLevel - v3.Min) / (v3.Max - v3.Min), 0, 1) else 0
end
function t.IsPlayerTalking(p1) --[[ IsPlayerTalking | Line: 93 | Upvalues: t (copy) ]]
	return t.GetVoiceAmount(p1)
end
function t.Init(p1) --[[ Init | Line: 98 | Upvalues: v2 (copy), setupPlayer (copy) ]]
	v2.bindToPlayers({
		OnAdded = setupPlayer
	})
end
task.defer(t.Init)
return t