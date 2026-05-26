-- https://lua.expert/
local t = {
	Died = 0,
	Running = 1,
	Swimming = 2,
	Climbing = 3,
	Jumping = 4,
	GettingUp = 5,
	FreeFalling = 6,
	FallingDown = 7,
	Landing = 8,
	Splash = 9,
	Seated = 10
}
local t2 = {}
local v1 = script.Parent.Parent
local Head = v1:WaitForChild("Head")
local Humanoid = v1:WaitForChild("Humanoid")
t2[t.Died] = Head:WaitForChild("Died")
t2[t.Running] = Head:WaitForChild("Running")
t2[t.Swimming] = Head:WaitForChild("Swimming")
t2[t.Climbing] = Head:WaitForChild("Climbing")
t2[t.Jumping] = Head:WaitForChild("Jumping")
t2[t.GettingUp] = Head:WaitForChild("GettingUp")
t2[t.FreeFalling] = Head:WaitForChild("FreeFalling")
t2[t.Landing] = Head:WaitForChild("Landing")
t2[t.Splash] = Head:WaitForChild("Splash")
t2[t.Seated] = Head:WaitForChild("Seated")
local v2 = nil
v2 = {
	YForLineGivenXAndTwoPts = function(p1, p2, p3, p4, p5) --[[ YForLineGivenXAndTwoPts | Line: 54 ]]
		local v1 = (p3 - p5) / (p2 - p4)
		return v1 * p1 + (p3 - v1 * p2)
	end,
	Clamp = function(p1, p2, p3) --[[ Clamp | Line: 63 ]]
		return math.min(p3, (math.max(p2, p1)))
	end,
	HorizontalVelocityMagnitude = function(p1) --[[ HorizontalVelocityMagnitude | Line: 68 ]]
		return (p1.Velocity + Vector3.new(0, -p1.Velocity.Y, 0)).magnitude
	end,
	VerticalVelocityMagnitude = function(p1) --[[ VerticalVelocityMagnitude | Line: 74 ]]
		return math.abs(p1.Velocity.Y)
	end,
	SoundIsV2 = function(p1) --[[ SoundIsV2 | Line: 79 ]]
		return p1.IsLoaded
	end,
	Play = function(p1) --[[ Play | Line: 85 | Upvalues: v2 (ref) ]]
		if v2.SoundIsV2(p1) then
			if p1.TimePosition ~= 0 then
				p1.TimePosition = 0
			end
			if not p1.IsPlaying then
				p1.Playing = true
			end
		else
			p1:Play()
		end
	end,
	Pause = function(p1) --[[ Pause | Line: 98 | Upvalues: v2 (ref) ]]
		if v2.SoundIsV2(p1) then
			if p1.IsPlaying then
				p1.Playing = false
			end
		else
			p1:Pause()
		end
	end,
	Resume = function(p1) --[[ Resume | Line: 107 | Upvalues: v2 (ref) ]]
		if v2.SoundIsV2(p1) then
			if not p1.IsPlaying then
				p1.Playing = true
			end
		else
			p1:Resume()
		end
	end,
	Stop = function(p1) --[[ Stop | Line: 116 | Upvalues: v2 (ref) ]]
		if v2.SoundIsV2(p1) then
			if p1.IsPlaying then
				p1.Playing = false
			end
			if p1.TimePosition ~= 0 then
				p1.TimePosition = 0
			end
		else
			p1:Stop()
		end
	end
}
local t3 = {}
local v3 = nil
function verifyAndSetLoopedForSound(p1, p2) --[[ verifyAndSetLoopedForSound | Line: 138 ]]
	if p1.Looped == p2 then
		return
	end
	p1.Looped = p2
end
function setSoundInActiveLooped(p1) --[[ setSoundInActiveLooped | Line: 145 | Upvalues: t3 (copy) ]]
	for i = 1, #t3 do
		if t3[i] == p1 then
			return
		end
	end
	table.insert(t3, p1)
end
function stopActiveLoopedSoundsExcept(p1) --[[ stopActiveLoopedSoundsExcept | Line: 155 | Upvalues: t3 (copy), v2 (ref) ]]
	for i = #t3, 1, -1 do
		if t3[i] ~= p1 then
			v2.Pause(t3[i])
			table.remove(t3, i)
		end
	end
end
local t4 = {
	[Enum.HumanoidStateType.Dead] = function() --[[ Line: 166 | Upvalues: t2 (copy), t (copy), v2 (ref) ]]
		stopActiveLoopedSoundsExcept()
		local v1 = t2[t.Died]
		verifyAndSetLoopedForSound(v1, false)
		v2.Play(v1)
	end,
	[Enum.HumanoidStateType.RunningNoPhysics] = function() --[[ Line: 173 ]]
		stateUpdated(Enum.HumanoidStateType.Running)
	end,
	[Enum.HumanoidStateType.Seated] = function() --[[ Line: 177 | Upvalues: v2 (ref), t2 (copy), t (copy) ]]
		v2.Play(t2[t.Seated])
		stopActiveLoopedSoundsExcept()
	end,
	[Enum.HumanoidStateType.Running] = function() --[[ Line: 182 | Upvalues: t2 (copy), t (copy), v2 (ref), Head (ref) ]]
		local v1 = t2[t.Running]
		verifyAndSetLoopedForSound(v1, true)
		stopActiveLoopedSoundsExcept(v1)
		if not (v2.HorizontalVelocityMagnitude(Head) > 0.5) then
			stopActiveLoopedSoundsExcept()
			return
		end
		if not v1.IsPlaying then
			v2.Resume(v1)
		end
		setSoundInActiveLooped(v1)
	end,
	[Enum.HumanoidStateType.Swimming] = function() --[[ Line: 197 | Upvalues: v3 (ref), v2 (ref), Head (ref), t2 (copy), t (copy) ]]
		if v3 ~= Enum.HumanoidStateType.Swimming and v2.VerticalVelocityMagnitude(Head) > 0.1 then
			local v1 = t2[t.Splash]
			v1.Volume = v2.Clamp(v2.YForLineGivenXAndTwoPts(v2.VerticalVelocityMagnitude(Head), 100, 0.28, 350, 1), 0, 1)
			v2.Play(v1)
		end
		local v22 = t2[t.Swimming]
		verifyAndSetLoopedForSound(v22, true)
		stopActiveLoopedSoundsExcept(v22)
		if not v22.IsPlaying then
			v2.Resume(v22)
		end
		setSoundInActiveLooped(v22)
	end,
	[Enum.HumanoidStateType.Climbing] = function() --[[ Line: 220 | Upvalues: t2 (copy), t (copy), v2 (ref), Head (ref) ]]
		local v1 = t2[t.Climbing]
		verifyAndSetLoopedForSound(v1, true)
		if v2.VerticalVelocityMagnitude(Head) > 0.1 then
			if not v1.IsPlaying then
				v2.Resume(v1)
			end
			stopActiveLoopedSoundsExcept(v1)
		else
			stopActiveLoopedSoundsExcept()
		end
		setSoundInActiveLooped(v1)
	end,
	[Enum.HumanoidStateType.Jumping] = function() --[[ Line: 234 | Upvalues: v3 (ref), t2 (copy), t (copy), v2 (ref) ]]
		if v3 ~= Enum.HumanoidStateType.Jumping then
			stopActiveLoopedSoundsExcept()
			local v1 = t2[t.Jumping]
			verifyAndSetLoopedForSound(v1, false)
			v2.Play(v1)
		end
	end,
	[Enum.HumanoidStateType.GettingUp] = function() --[[ Line: 244 | Upvalues: t2 (copy), t (copy), v2 (ref) ]]
		stopActiveLoopedSoundsExcept()
		local v1 = t2[t.GettingUp]
		verifyAndSetLoopedForSound(v1, false)
		v2.Play(v1)
	end,
	[Enum.HumanoidStateType.Freefall] = function() --[[ Line: 251 | Upvalues: v3 (ref), t2 (copy), t (copy) ]]
		if v3 == Enum.HumanoidStateType.Freefall then
			return
		end
		local v1 = t2[t.FreeFalling]
		if v1.Volume ~= 0 then
			v1.Volume = 0
		end
		stopActiveLoopedSoundsExcept()
	end,
	[Enum.HumanoidStateType.FallingDown] = function() --[[ Line: 262 ]]
		stopActiveLoopedSoundsExcept()
	end,
	[Enum.HumanoidStateType.Landed] = function() --[[ Line: 266 | Upvalues: v2 (ref), Head (ref), t2 (copy), t (copy) ]]
		stopActiveLoopedSoundsExcept()
		if not (v2.VerticalVelocityMagnitude(Head) > 75) then
			return
		end
		local v1 = t2[t.Landing]
		v1.Volume = v2.Clamp(v2.YForLineGivenXAndTwoPts(v2.VerticalVelocityMagnitude(Head), 50, 0, 100, 1), 0, 1)
		v2.Play(v1)
	end
}
function stateUpdated(p1) --[[ stateUpdated | Line: 282 | Upvalues: t4 (copy), v3 (ref) ]]
	if t4[p1] ~= nil then
		t4[p1]()
	end
	v3 = p1
end
function onHeartbeat(p1) --[[ onHeartbeat | Line: 290 | Upvalues: t2 (copy), t (copy), v3 (ref), Head (ref), v2 (ref) ]]
	local v1 = p1 / 1 / 60
	local v22 = t2[t.FreeFalling]
	if v3 == Enum.HumanoidStateType.Freefall then
		if Head.Velocity.Y < 0 and v2.VerticalVelocityMagnitude(Head) > 75 then
			if not v22.IsPlaying then
				v2.Resume(v22)
			end
			if v22.Volume < 1 then
				v22.Volume = v2.Clamp(v22.Volume + 0.01 * v1, 0, 1)
			end
		elseif v22.Volume ~= 0 then
			v22.Volume = 0
		end
	elseif v22.IsPlaying then
		v2.Pause(v22)
	end
	local v32 = t2[t.Running]
	if v3 ~= Enum.HumanoidStateType.Running or not (v32.IsPlaying and v2.HorizontalVelocityMagnitude(Head) < 0.5) then
		return
	end
	v2.Pause(v32)
end
Humanoid.Died:connect(function() --[[ Line: 326 ]]
	stateUpdated(Enum.HumanoidStateType.Dead)
end)
Humanoid.Running:connect(function() --[[ Line: 327 ]]
	stateUpdated(Enum.HumanoidStateType.Running)
end)
Humanoid.Swimming:connect(function() --[[ Line: 328 ]]
	stateUpdated(Enum.HumanoidStateType.Swimming)
end)
Humanoid.Climbing:connect(function() --[[ Line: 329 ]]
	stateUpdated(Enum.HumanoidStateType.Climbing)
end)
Humanoid.Jumping:connect(function() --[[ Line: 330 ]]
	stateUpdated(Enum.HumanoidStateType.Jumping)
end)
Humanoid.GettingUp:connect(function() --[[ Line: 331 ]]
	stateUpdated(Enum.HumanoidStateType.GettingUp)
end)
Humanoid.FreeFalling:connect(function() --[[ Line: 332 ]]
	stateUpdated(Enum.HumanoidStateType.Freefall)
end)
Humanoid.FallingDown:connect(function() --[[ Line: 333 ]]
	stateUpdated(Enum.HumanoidStateType.FallingDown)
end)
Humanoid.StateChanged:connect(function(p1, p2) --[[ Line: 336 ]]
	stateUpdated(p2)
end)
local v4 = false
local v5 = script.Parent.Parent
if game.ReplicatedStorage:WaitForChild("GlobalData").Season.Value ~= "Winter" then
	return
end
local v6 = t2[t.Running]
local SoundId = v6.SoundId
local Pitch = v6.Pitch
local v7 = nil
local v8 = nil
v5:WaitForChild("Humanoid"):GetPropertyChangedSignal("FloorMaterial"):connect(function() --[[ Line: 359 | Upvalues: v8 (ref), v5 (copy), v4 (ref), v6 (copy), v7 (ref), SoundId (copy), Pitch (copy) ]]
	v8 = v5.Humanoid.FloorMaterial
	if not v8 then
		return
	end
	if v8 == Enum.Material.Sand and not v4 then
		v4 = true
		v6.SoundId = "http://www.roblox.com/asset/?id=190037257"
		v6.Pitch = 1.2
		v7 = v6.DidLoop:connect(function() --[[ Line: 366 | Upvalues: v6 (ref) ]]
			v6.Pitch = math.random(1000, 1400) / 1000
		end)
		return
	end
	if v8 == Enum.Material.Sand or not v4 then
		return
	end
	if v7 then
		v7:disconnect()
	end
	v4 = false
	v6.SoundId = SoundId
	v6.Pitch = Pitch
end)