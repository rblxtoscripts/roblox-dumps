-- https://lua.expert/
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("MathUtils")
local v2 = Sonar("LightingService")
local v3 = Sonar("Ocean")
local v4 = Sonar("PlayerWrapper").GetClient()
local Ambience = game:GetService("SoundService").Ambience
local DawnDusk = Ambience:WaitForChild("DawnDusk")
local Day = Ambience.Day
local Night = Ambience.Night
local Ocean = Ambience.Ocean
local t = {
	[Day] = Day.Volume,
	[Night] = Night.Volume,
	[DawnDusk] = DawnDusk.Volume,
	[Ocean] = Ocean.Volume
}
Day.Volume = 0
Night.Volume = 0
DawnDusk.Volume = 0
Ocean.Volume = 0
local t2 = {
	Summer = 1.125,
	Spring = 1.1,
	Fall = 1,
	Winter = 0.9,
	Famine = 0.8,
	Drought = 0.85,
	Sakura = 1
}
local t3 = {
	Rain = 0.8,
	Snow = 0.9,
	Sunny = 1
}
local t4 = {
	Day = Day,
	Night = Night,
	Dusk = DawnDusk,
	Morning = DawnDusk
}
local t5 = {
	[Ocean] = function() --[[ Line: 60 | Upvalues: v3 (copy), v1 (copy) ]]
		local Y = workspace.CurrentCamera.CFrame.p.Y
		local v12 = v3:GetOceanHeightWithFloodFactor()
		if Y < v12 then
			return 0.25
		end
		local count = 250
		if v12 == count then
			count = count + 1
		end
		return v1.map(Y, v12, count, 1.25, 0)
	end
}
local v5 = TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 1)
local function UpdateSounds() --[[ UpdateSounds | Line: 78 | Upvalues: v4 (copy), Lighting (copy), v2 (copy), t4 (copy), t3 (copy), t2 (copy), t (copy), TweenService (copy), v5 (copy), t5 (copy) ]]
	local v1 = if v4:GetCurrentCharacter() then 1 else 0
	local v22 = Lighting:GetAttribute("Weather")
	local v3 = Lighting:GetAttribute("Season")
	local v42 = t4[v2:GetCycleStage()]
	local v7 = t[v42] * (t3[v22] or 1) * (t2[v3] or 1) * v1
	if v42.Volume ~= v7 then
		TweenService:Create(v42, v5, {
			Volume = v7
		}):Play()
	end
	for k, v in pairs(t) do
		if not k.Playing then
			k:Play()
		end
		if not t5[k] and k ~= v42 then
			TweenService:Create(k, v5, {
				Volume = 0
			}):Play()
		end
	end
end
local function UpdateConstantSounds() --[[ UpdateConstantSounds | Line: 117 | Upvalues: v4 (copy), t5 (copy), v1 (copy) ]]
	local v12 = if v4:GetCurrentCharacter() then 1 else 0
	for k, v in pairs(t5) do
		if not k.IsPlaying then
			k:Play()
		end
		k.Volume = v1.lerp(k.Volume, v() * v12, 0.01)
	end
end
Lighting:GetAttributeChangedSignal("Time"):Connect(UpdateSounds)
Lighting:GetAttributeChangedSignal("Weather"):Connect(UpdateSounds)
Lighting:GetAttributeChangedSignal("Season"):Connect(UpdateSounds)
v4.Player:GetPropertyChangedSignal("Character"):Connect(UpdateSounds)
RunService.Heartbeat:Connect(UpdateConstantSounds)
return {}