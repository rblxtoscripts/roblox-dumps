-- https://lua.expert/
game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Constants")
local v2 = Sonar("Table")
local v3 = Sonar("SoundEffectsClass")
local v4 = v2.DeepCopy(v1.MusicSettings)
local t = {}
local t2 = {}
local t3 = {}
local Soundtrack = SoundService:FindFirstChild("Soundtrack")
function t._playTrackInternal(p1, p2) --[[ _playTrackInternal | Line: 26 | Upvalues: t3 (copy), Soundtrack (ref), TweenService (copy) ]]
	if t3[p1] then
		return
	end
	if not Soundtrack then
		return
	end
	local v1 = Soundtrack:FindFirstChild(p1) or Instance.new("Sound", Soundtrack)
	v1.SoundId = p2.SoundId
	v1.Volume = 0
	v1.Looped = p2.Looped
	v1.Name = p1
	v1:Play()
	TweenService:Create(v1, TweenInfo.new(p2.FadeTime), {
		Volume = p2.Volume
	}):Play()
	t3[p1] = v1
	v1.Ended:Once(function() --[[ Line: 42 | Upvalues: t3 (ref), p1 (copy) ]]
		t3[p1] = nil
	end)
	v1.Stopped:Once(function() --[[ Line: 45 | Upvalues: t3 (ref), p1 (copy) ]]
		t3[p1] = nil
	end)
end
function t.refreshMusic() --[[ refreshMusic | Line: 51 | Upvalues: t2 (copy), v4 (copy), t3 (copy), t (copy), TweenService (copy) ]]
	local list = {}
	local v1 = nil
	for k, v in pairs(t2) do
		if v then
			local v2 = v4[k]
			table.insert(list, {
				name = k,
				data = v2
			})
			if not v1 or v1 < v2.Priority then
				v1 = v2.Priority
			end
		end
	end
	table.sort(list, function(p1, p2) --[[ Line: 68 ]]
		return p1.data.Priority > p2.data.Priority
	end)
	for i, v in ipairs(list) do
		if v.data.Priority == v1 and not t3[v.name] then
			t._playTrackInternal(v.name, v.data)
		end
	end
	for k, v in pairs(t3) do
		if v4[k].Priority < v1 or not t2[k] then
			TweenService:Create(v, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
				Volume = 0
			}):Play()
			task.delay(0.5, function() --[[ Line: 84 | Upvalues: v (copy), v4 (ref), k (copy), t3 (ref) ]]
				v:Stop()
				v.Volume = v4[k].Volume
				t3[k] = nil
			end)
		end
	end
end
if not Soundtrack then
	SoundService.ChildAdded:Connect(function(p1) --[[ Line: 95 | Upvalues: Soundtrack (ref), t (copy) ]]
		if p1.Name ~= "Soundtrack" or not p1:IsA("SoundGroup") then
			return
		end
		Soundtrack = p1
		t.refreshMusic()
	end)
end
function t.setMusicTrack(p1, p2, p3) --[[ setMusicTrack | Line: 104 | Upvalues: v4 (copy), t2 (copy), t (copy) ]]
	if not v4[p1] then
		warn(p1, "is not a valid music track. Did you define it?")
		return
	end
	local v1 = t2[p1]
	t2[p1] = p2
	if p3 or p2 == v1 then
		return
	end
	t.refreshMusic()
end
function t.stopAllMusic(p1) --[[ stopAllMusic | Line: 119 | Upvalues: t3 (copy) ]]
	for k, v in pairs(t3) do
		if not p1 or k ~= "Default" then
			v:Stop()
			t3[k] = nil
		end
	end
end
local function connectSound(p1) --[[ connectSound | Line: 128 ]]
	if p1:IsA("Sound") then
		p1.Played:Once(function() --[[ Line: 132 | Upvalues: p1 (copy) ]]
			if p1:FindFirstChild("AssetId") then
				p1.SoundId = p1.AssetId.Value
			end
		end)
	end
end
SoundService.DescendantAdded:Connect(connectSound)
for k, v in pairs(SoundService:GetDescendants()) do
	if v:IsA("Sound") then
		v.Played:Once(function() --[[ Line: 132 | Upvalues: v (copy) ]]
			if v:FindFirstChild("AssetId") then
				v.SoundId = v.AssetId.Value
			end
		end)
	end
end
game.CollectionService:GetInstanceAddedSignal("LazySound"):Connect(connectSound)
for v5, v6 in game.CollectionService:GetTagged("LazySound") do
	if v6:IsA("Sound") then
		v6.Played:Once(function() --[[ Line: 132 | Upvalues: v6 (copy) ]]
			if v6:FindFirstChild("AssetId") then
				v6.SoundId = v6.AssetId.Value
			end
		end)
	end
end
if v1.IsEventWorld and v4.EventMusic then
	t.setMusicTrack("EventMusic", true)
else
	t.setMusicTrack("Music", true)
end
local tbl = {
	{
		name = "Effects",
		tag = "EffectsSound"
	},
	{
		name = "Interface",
		tag = "InterfaceSound"
	},
	{
		name = "Ambience",
		tag = "AmbienceSound"
	},
	{
		name = "Soundtrack",
		tag = "Soundtrack"
	},
	{
		name = "HorseSounds",
		tag = "HorseSounds"
	}
}
local t4 = {}
for k, v in pairs(tbl) do
	local v7 = SoundService:FindFirstChild(v.name)
	if v7 then
		t4[v.name] = true
		v3.new(v7, v.tag)
	end
end
SoundService.ChildAdded:Connect(function(p1) --[[ Line: 174 | Upvalues: t4 (copy), tbl (copy), v3 (copy) ]]
	if not p1:IsA("SoundGroup") then
		return
	end
	if t4[p1.Name] then
		return
	end
	for k, v in pairs(tbl) do
		if v.name == p1.Name then
			t4[p1.Name] = true
			v3.new(p1, v.tag)
			return
		end
	end
end)
return t