-- https://lua.expert/
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("Signal")
local t = {}
t.__index = t
t.ClassName = "AnimationPlayer"
function t.new(p1) --[[ new | Line: 14 | Upvalues: t (copy), v1 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Humanoid = if p1 then p1 else error("No Humanoid")
	v2.Tracks = {}
	v2.FadeTime = 0.1
	v2.TrackPlayed = v1.new()
	return v2
end
function t.ClearAllTracks(p1) --[[ ClearAllTracks | Line: 31 ]]
	for k, v in pairs(p1.Tracks) do
		p1.Tracks[k] = nil
	end
	return p1
end
function t.RemoveTrack(p1, p2) --[[ RemoveTrack | Line: 38 ]]
	if p1.Tracks[p2] ~= nil then
		p1.Tracks[p2]:Destroy()
	end
	p1.Tracks[p2] = nil
	return p1
end
function t.WithAnimation(p1, p2) --[[ WithAnimation | Line: 47 ]]
	p1.Tracks[p2.Name] = p1.Humanoid:LoadAnimation(p2)
	return p1
end
function t.AddAnimation(p1, p2, p3) --[[ AddAnimation | Line: 54 ]]
	local Animation = Instance.new("Animation")
	if tonumber(p3) then
		Animation.AnimationId = "http://www.roblox.com/Asset?ID=" .. tonumber(p3) or error("No AnimationId")
	else
		Animation.AnimationId = p3
	end
	Animation.Name = if p2 then p2 else error("No name")
	return p1:WithAnimation(Animation)
end
function t.GetTrack(p1, p2) --[[ GetTrack | Line: 69 ]]
	return p1.Tracks[p2]
end
function t.PlayTrack(p1, p2, p3, p4, p5, p6, p7) --[[ PlayTrack | Line: 84 ]]
	local v1 = if p3 then p3 else p1.FadeTime
	local v2 = p1:GetTrack(p2)
	if not v2 then
		return
	end
	local v3 = p7 or 0.2
	if not v2.IsPlaying then
		p1.TrackPlayed:Fire(p2, v1, p5, p6, v3)
		if p4 then
			p1:StopAllTracks(v3 or v1)
		end
		v2:Play(v1, p5, p6)
	end
	return v2
end
function t.StopTrack(p1, p2, p3) --[[ StopTrack | Line: 107 ]]
	local v1 = if p3 then p3 else p1.FadeTime
	local v2 = p1:GetTrack(p2)
	if v2 then
		v2:Stop(v1)
		return v2
	end
end
function t.StopAllTracks(p1, p2) --[[ StopAllTracks | Line: 119 ]]
	for k, v in pairs(p1.Tracks) do
		p1:StopTrack(k, p2)
	end
end
function t.GetTracks(p1) --[[ GetTracks | Line: 125 ]]
	return p1.Tracks
end
function t.Destroy(p1) --[[ Destroy | Line: 129 ]]
	p1:StopAllTracks()
	if p1.TrackPlayed then
		p1.TrackPlayed:Destroy()
		p1.TrackPlayed = nil
	end
	setmetatable(p1, nil)
end
return t