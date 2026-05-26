-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Utility")
Library:Load("Events")
local v2 = Library:Load("SoundFX")
local v3 = Library:Load("Queue")
Library:Load("Network")
local v4 = script.Parent
local LocalPlayer = game.Players.LocalPlayer
local CurrentCamera = workspace.CurrentCamera
local v5 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local Humanoid = v4:WaitForChild("Humanoid")
local Head = v4:WaitForChild("Head")
local v6 = if Humanoid.RigType == Enum.HumanoidRigType.R15 then "R15" else "R6"
local v7 = nil
local v8 = v3.new()
v3.new()
local t = {}
local v9 = v4:GetAttribute("CharacterType") or ""
local v10 = v4:GetAttribute("WalkCycleScale") or 16
local t2 = {
	Swim = "Swim",
	SwimIdle = "SwimIdle",
	Climb = "Climb",
	ToolHold = "ToolHold",
	Idle = v9 .. "Idle",
	Jump = v9 .. "Jump",
	Walk = v9 .. "Walk",
	Run = v9 .. "Run",
	Fall = v9 .. "Fall",
	SitSeat = v9 .. "SitSeat"
}
_G.OriginalFogEnd = game.Lighting.FogEnd
_G.OriginalBrightness = game.Lighting.Brightness
_G.OriginalOutdoorAmbient = game.Lighting.OutdoorAmbient
local AnimationInfo = require(game.ReplicatedStorage.AnimationInfo)
local function PreloadAnimations(p1) --[[ PreloadAnimations | Line: 48 | Upvalues: v8 (copy), AnimationInfo (copy) ]]
	v8:Wait(3)
	local t = {}
	if typeof(p1) == "table" then
		for k, v in pairs(p1) do
			if AnimationInfo.Data[k] and AnimationInfo.Data[k].Object then
				table.insert(t, AnimationInfo.Data[k].Object)
			end
		end
		spawn(function() --[[ Line: 57 | Upvalues: t (copy) ]]
			game:GetService("ContentProvider"):PreloadAsync(t)
		end)
	elseif typeof(p1) == "string" then
		spawn(function() --[[ Line: 63 | Upvalues: AnimationInfo (ref), p1 (copy) ]]
			local ContentProvider = game:GetService("ContentProvider")
			local t = {}
			t[1] = AnimationInfo.Data[p1] and AnimationInfo.Data[p1].Object
			ContentProvider:PreloadAsync(t)
		end)
	end
	v8:Next()
end
local function RegisterAnimations(p1, p2) --[[ RegisterAnimations | Line: 73 | Upvalues: v5 (copy), AnimationInfo (copy), v6 (copy), t (copy), PreloadAnimations (copy) ]]
	if p1.Hi and not v5.IsEnglish() then
		AnimationInfo.Data.Hi.SoundId = nil
	end
	for k, v in pairs(p1) do
		spawn(function() --[[ Line: 85 | Upvalues: v (copy), v6 (ref), k (copy), AnimationInfo (ref), t (ref) ]]
			local v2, v4
			if v[v6] == nil or not script:FindFirstChild(v6) then
				local v1, v3
				AnimationInfo.Data[k] = v
				v1 = t
				v2 = v[v6]
				t[tostring(v2)] = v
				v3 = t
				v4 = v[v6]
				t[tostring(v4)].Name = k
				return
			end
			v.Object = script[v6]:WaitForChild(k)
			AnimationInfo.Data[k] = v
			v2 = v[v6]
			t[tostring(v2)] = v
			v4 = v[v6]
			t[tostring(v4)].Name = k
		end)
	end
	if not p2 then
		return
	end
	delay(3, function() --[[ Line: 110 | Upvalues: PreloadAnimations (ref), p1 (copy) ]]
		PreloadAnimations(p1)
	end)
end
RegisterAnimations(AnimationInfo.Data)
local function TopperVisible(p1, p2) --[[ TopperVisible | Line: 132 | Upvalues: v1 (copy) ]]
	if not p1:FindFirstChild("Topper") then
		return
	end
	v1:SetModelVisible(p1.Topper, p2)
end
local function MarkerReached(p1, p2, p3) --[[ MarkerReached | Line: 142 | Upvalues: v1 (copy), LocalPlayer (copy), v2 (copy), CurrentCamera (copy) ]]
	spawn(function() --[[ Line: 144 | Upvalues: p1 (copy), p2 (copy), p3 (copy), v1 (ref), LocalPlayer (ref), v2 (ref), CurrentCamera (ref) ]]
		local Tool = p1:FindFirstChildOfClass("Tool")
		if not Tool then
			return
		end
		if p2 == "DropFromSky" then
			if p3 ~= "Started" or not Tool:FindFirstChild("Lid") then
				return
			end
			Tool.Lid.Ribbon.Transparency = 1
			Tool.Lid.Handle2.Transparency = 1
			local Lid = Tool.Lid
			if Lid:FindFirstChild("Topper") then
				v1:SetModelVisible(Lid.Topper, false)
			end
			Tool.Present.Top.Transparency = 0
			Tool.Present.RibbonTop.Transparency = 0
			local Present = Tool.Present
			if Present:FindFirstChild("Topper") then
				v1:SetModelVisible(Present.Topper, true)
			end
		elseif p2 == "PogoIdle" then
			if p3 == "1" then
				Tool["Pogo Stick"].Handle.Bounce.PlaybackSpeed = 1
				Tool["Pogo Stick"].Handle.Bounce:Play()
			end
		elseif p2 == "PogoJump" then
			if p3 == "Started" then
				Tool["Pogo Stick"].Handle.Bounce.PlaybackSpeed = 0.5
				Tool["Pogo Stick"].Handle.Bounce:Play()
			end
		elseif p2 == "BaseballAction" or (p2 == "TennisAction" or (p2 == "FootballAction" or p2 == "FrisbeeAction")) then
			local v12 = Tool.Ball:FindFirstChild("Ball") or Tool.Ball:FindFirstChild("Handle")
			if p3 == "1" then
				v12.Transparency = 1
				local v22_2 = v12:clone()
				v22_2.Transparency = 0
				v22_2.CanCollide = true
				v22_2.Velocity = p1.HumanoidRootPart.CFrame.lookVector * 200 * v22_2.Speed.Value + Vector3.new(0, 100 * v22_2.UpwardForce.Value, 0)
				for i = 1, 100 do
					local Weld = v22_2:FindFirstChildOfClass("Weld")
					if not Weld then
						break
					end
					Weld:Destroy()
				end
				v22_2.Parent = workspace
				v22_2.CFrame = v12.CFrame
				wait(6)
				if v22_2 and v22_2.Parent then
					v22_2:Destroy()
				end
			else
				if p3 == "Ended" then
					v12.Transparency = 0
					return
				end
				if p3 == "Started" then
					v12.Transparency = 0
				end
			end
		else
			if p2 ~= "OpenPresent" then
				return
			end
			local PresentType = Tool.PresentType.Value
			if p3 == "Started" then
				Tool.Lid.Ribbon.Transparency = 1
				Tool.Lid.Handle2.Transparency = 1
				local Lid = Tool.Lid
				if Lid:FindFirstChild("Topper") then
					v1:SetModelVisible(Lid.Topper, false)
				end
				Tool.Present.Top.Transparency = 0
				Tool.Present.RibbonTop.Transparency = 0
				local Present = Tool.Present
				if Present:FindFirstChild("Topper") then
					v1:SetModelVisible(Present.Topper, true)
				end
			elseif p3 == "1" then
				Tool.Lid.Ribbon.Transparency = 0
				Tool.Lid.Handle2.Transparency = 0
				local Lid = Tool.Lid
				if Lid:FindFirstChild("Topper") then
					v1:SetModelVisible(Lid.Topper, true)
				end
				Tool.Present.Top.Transparency = 1
				Tool.Present.RibbonTop.Transparency = 1
				local Present = Tool.Present
				if Present:FindFirstChild("Topper") then
					v1:SetModelVisible(Present.Topper, false)
				end
				if p1 == LocalPlayer.Character then
					Tool.Present.Neon.ParticleEmitter:Emit(10)
					Tool.Present.Neon.ParticleEmitter.Speed = NumberRange.new(1, 1)
					Tool.Present.Neon.ParticleEmitter.Lifetime = NumberRange.new(3, 3)
					v2:PlaySound("Swish")
				end
			elseif p3 == "2" then
				Tool.Lid.Ribbon.Transparency = 1
				Tool.Lid.Handle2.Transparency = 1
				local Lid = Tool.Lid
				if Lid:FindFirstChild("Topper") then
					v1:SetModelVisible(Lid.Topper, false)
				end
			else
				if p3 == "4" or p3 == "3" then
					if p1 ~= LocalPlayer.Character then
						return
					end
					workspace.Main.StartPresentViewpportRotation:Fire(Tool.Lid.Handle2, PresentType)
					v2:PlaySound("Pop7")
					if Tool.Rarity.Value == "Legendary" then
						v2:PlaySound("CapsuleLegendaryOpened")
						return
					end
					if Tool.Rarity.Value == "Rare" then
						v2:PlaySound("CapsuleRareOpened")
						return
					end
					if Tool.Rarity.Value == "Common" or Tool.Rarity.Value == "Uncommon" then
						v2:PlaySound("CapsuleCommonOpened")
					else
						v2:PlaySound("PresentChimes")
					end
					return
				end
				if p3 ~= "Ended" or p1 ~= LocalPlayer.Character then
					return
				end
				local Humanoid = p1.Humanoid
				local HumanoidRootPart = p1.HumanoidRootPart
				local Handle2 = Tool.Lid.Handle2
				local v5 = game:GetService("TweenService"):Create(CurrentCamera, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
					CFrame = CFrame.new(CurrentCamera.CFrame.p + (Handle2.CFrame.p - CurrentCamera.CFrame.p).unit * 2, Handle2.Position)
				})
				v5.Completed:connect(function() --[[ Line: 321 ]]
					workspace.Main.ShowSellButton:Fire()
				end)
				v5:Play()
				Tool.Present.Neon.ParticleEmitter.Enabled = false
			end
		end
	end)
end
local v11 = false
local v12 = nil
local t3 = {}
local t4 = {}
local v13 = nil
local v14 = nil
spawn(function() --[[ Line: 403 | Upvalues: Head (copy), v7 (ref) ]]
	local face = Head:WaitForChild("face", 10)
	if not face then
		return
	end
	v7 = face.Texture
end)
local function ResetFaceAndSound() --[[ ResetFaceAndSound | Line: 410 | Upvalues: v13 (ref), v14 (ref), v7 (ref), Head (copy) ]]
	if v13 then
		v13:Stop()
	end
	if v14 then
		v14:disconnect()
	end
	if not (v7 and Head:FindFirstChild("face")) then
		return
	end
	workspace.Main.ChangeFace:FireServer(Head.face, v7)
end
Head.ChildAdded:connect(function(p1) --[[ Line: 424 | Upvalues: v7 (ref) ]]
	if p1.Name ~= "face" then
		return
	end
	v7 = p1.Texture
end)
local t5 = {}
local function f15(p1, p2, p3) --[[ Line: 446 | Upvalues: AnimationInfo (copy), t4 (copy), t3 (copy), v13 (ref), v14 (ref), v7 (ref), Head (copy), v11 (ref), v12 (ref), t5 (copy), Humanoid (copy), v4 (copy) ]]
	local v1 = AnimationInfo.Data[p1]
	if v1 == nil then
		warn("Tried to play unregistered animation:" .. p1)
		return
	end
	local Object = v1.Object
	local Priority = v1.Priority
	local Looped = v1.Looped
	local v2 = t4[Priority]
	if not Object or Object == t3[Priority] and t4[Priority].IsPlaying ~= false then
		return
	end
	if Priority == Enum.AnimationPriority.Action then
		if v13 then
			v13:Stop()
		end
		if v14 then
			v14:disconnect()
		end
		if v7 and Head:FindFirstChild("face") then
			workspace.Main.ChangeFace:FireServer(Head.face, v7)
		end
		if v1.MovementCancel then
			v11 = true
			v12 = p1
		else
			v11 = false
			v12 = nil
		end
		if v2 then
			workspace.Animation.AnimationStopped:FireServer(v2.Name)
			workspace.Animation.AnimationStopped.AnimationStopped:Fire(v2.Name)
		end
		workspace.Animation.AnimationStarted:FireServer(p1)
		workspace.Animation.AnimationStarted.AnimationStarted:Fire(p1)
	end
	if v2 then
		v2:Stop(p2)
	end
	local v3 = t5[Object.AnimationId] or Humanoid.Animator:LoadAnimation(Object)
	v3.Priority = Priority
	v3.Name = p1
	v3:Play(p2, v1.Weight)
	v3:AdjustSpeed(v1.Speed or 1)
	t5[Object.AnimationId] = v3
	t4[Priority] = v3
	t3[Priority] = Object
	if v1.FaceId and Head:FindFirstChild("face") then
		local ChangeFace = workspace.Main.ChangeFace
		local face = Head.face
		ChangeFace:FireServer(face, "rbxassetid://" .. tostring(v1.FaceId))
		v14 = v3.Stopped:connect(function() --[[ Line: 518 | Upvalues: v13 (ref), v14 (ref), v7 (ref), Head (ref) ]]
			if v13 then
				v13:Stop()
			end
			if v14 then
				v14:disconnect()
			end
			if not (v7 and Head:FindFirstChild("face")) then
				return
			end
			workspace.Main.ChangeFace:FireServer(Head.face, v7)
		end)
	end
	if not (v1.SoundId and (v4:FindFirstChild("Head") and v4.Head:FindFirstChild(p1))) then
		return
	end
	v4.Head[p1]:Play()
	v13 = v4.Head[p1]
end
local function StopAnimation(p1, p2) --[[ StopAnimation | Line: 533 | Upvalues: t4 (copy), t3 (copy), v13 (ref), v14 (ref), v7 (ref), Head (copy) ]]
	for k, v in pairs(t4) do
		if v.Name == p1 then
			v:Stop(p2)
			t4[v.Priority] = nil
			t3[v.Priority] = nil
			if k ~= Enum.AnimationPriority.Action then
				break
			end
			if v13 then
				v13:Stop()
			end
			if v14 then
				v14:disconnect()
			end
			if not (v7 and Head:FindFirstChild("face")) then
				workspace.Animation.AnimationStopped:FireServer(p1)
				workspace.Animation.AnimationStopped.AnimationStopped:Fire(p1)
				return
			end
			workspace.Main.ChangeFace:FireServer(Head.face, v7)
			workspace.Animation.AnimationStopped:FireServer(p1)
			workspace.Animation.AnimationStopped.AnimationStopped:Fire(p1)
			return
		end
	end
end
local function SetAnimationSpeed(p1, p2) --[[ SetAnimationSpeed | Line: 555 | Upvalues: t4 (copy) ]]
	for k, v in pairs(t4) do
		if v.Name == p1 then
			v:AdjustSpeed(p2)
			return
		end
	end
end
local function StopAllAnimations() --[[ StopAllAnimations | Line: 564 | Upvalues: t4 (copy), StopAnimation (copy) ]]
	for k, v in pairs(t4) do
		StopAnimation(v.Name)
	end
end
workspace.Animation.RegisterAnimations.OnClientEvent:connect(function(p1, p2) --[[ Line: 576 | Upvalues: RegisterAnimations (copy) ]]
	RegisterAnimations(p1, p2)
end)
local v16 = Vector3.new(0, 0, 0)
local v17 = v4:GetAttribute("CharacterType")
Humanoid.Running:connect(function(p1) --[[ Line: 582 | Upvalues: v17 (copy), v11 (ref), v4 (copy), StopAnimation (copy), v12 (ref), v16 (ref), f15 (ref), t2 (copy), SetAnimationSpeed (copy), v10 (copy) ]]
	if p1 > 0.02 then
		if v17 then
			if v11 and v4.Humanoid.WalkSpeed / 2 < p1 then
				v11 = false
				StopAnimation(v12, 0)
			end
			local magnitude = (v16 - v4.HumanoidRootPart.Position).magnitude
			v16 = v4.HumanoidRootPart.Position
			if magnitude > 0.02 then
				f15(t2.Run, 0.5)
				SetAnimationSpeed(t2.Run, v10)
			else
				f15(t2.Idle, 0.2)
			end
			return
		end
		if p1 > 17 then
			f15(t2.Run, 0.5)
			SetAnimationSpeed(t2.Run, p1 / (v10 + 10))
		else
			f15(t2.Walk, 0.1)
			SetAnimationSpeed(t2.Walk, p1 / v10)
		end
		if v11 and v4.Humanoid.WalkSpeed / 2 < p1 then
			v11 = false
			StopAnimation(v12, 0)
		end
	else
		f15(t2.Idle, 0.2)
	end
end)
Humanoid.Died:connect(function() --[[ Line: 632 | Upvalues: t4 (copy), StopAnimation (copy) ]]
	for k, v in pairs(t4) do
		StopAnimation(v.Name)
	end
end)
Humanoid.Jumping:connect(function() --[[ Line: 636 | Upvalues: f15 (ref), t2 (copy), v11 (ref), StopAnimation (copy), v12 (ref) ]]
	f15(t2.Jump, 0.1)
	if not v11 then
		return
	end
	v11 = false
	StopAnimation(v12, 0)
end)
local v18 = if v6 == "R15" then 5 else 10
Humanoid.Climbing:connect(function(p1) --[[ Line: 645 | Upvalues: f15 (ref), t2 (copy), SetAnimationSpeed (copy), v18 (copy) ]]
	f15(t2.Climb, 0.1)
	SetAnimationSpeed(t2.Climb, p1 / v18)
end)
Humanoid.GettingUp:connect(function() --[[ Line: 650 | Upvalues: t4 (copy), StopAnimation (copy) ]]
	for k, v in pairs(t4) do
		StopAnimation(v.Name)
	end
end)
Humanoid.FreeFalling:connect(function() --[[ Line: 655 | Upvalues: f15 (ref), t2 (copy) ]]
	f15(t2.Fall, 0.2)
end)
Humanoid.FallingDown:connect(function() --[[ Line: 659 | Upvalues: t4 (copy), StopAnimation (copy) ]]
	for k, v in pairs(t4) do
		StopAnimation(v.Name)
	end
end)
Humanoid.Seated:connect(function(p1, p2) --[[ Line: 664 | Upvalues: f15 (ref), v9 (copy), t2 (copy) ]]
	if not p1 then
		return
	end
	if p2 and p2:FindFirstChild("Animation") then
		f15(v9 .. p2.Animation.Value, 0.1)
		return
	end
	f15(t2.SitSeat, 0.1)
end)
Humanoid.PlatformStanding:connect(function() --[[ Line: 675 | Upvalues: t4 (copy), StopAnimation (copy) ]]
	for k, v in pairs(t4) do
		StopAnimation(v.Name)
	end
end)
Humanoid.Swimming:connect(function(p1) --[[ Line: 679 | Upvalues: f15 (ref), t2 (copy), SetAnimationSpeed (copy) ]]
	if p1 > 1 then
		f15(t2.Swim, 0.4)
		SetAnimationSpeed(t2.Climb, p1 / 10)
	else
		f15(t2.SwimIdle, 0.4)
	end
end)
v4.ChildAdded:connect(function(p1) --[[ Line: 690 | Upvalues: f15 (ref), t2 (copy) ]]
	wait()
	if not (p1:IsA("Tool") and p1:FindFirstChild("Handle")) then
		return
	end
	f15(t2.ToolHold, 0.2)
end)
v4.ChildRemoved:connect(function(p1) --[[ Line: 697 | Upvalues: StopAnimation (copy), t2 (copy) ]]
	if not p1:IsA("Tool") then
		return
	end
	StopAnimation(t2.ToolHold, 0.2)
end)
function OverrideCoreAnimation(p1, p2) --[[ OverrideCoreAnimation | Line: 704 | Upvalues: t2 (copy) ]]
	for i, v in ipairs(p2) do
		t2[v] = p1
	end
end
function ResetCoreAnimations() --[[ ResetCoreAnimations | Line: 710 | Upvalues: v9 (copy), t2 (copy), StopAnimation (copy) ]]
	if v9 ~= "" then
		return
	end
	for k, v in pairs(t2) do
		if k ~= v then
			StopAnimation(v, 0.1)
		end
		t2[k] = k
	end
end
workspace.Animation.PlayAnimation.OnClientEvent:connect(function(p1, p2, p3) --[[ Line: 724 | Upvalues: f15 (ref), v9 (copy) ]]
	f15(v9 .. p1 or "", p2, p3)
end)
workspace.Animation.PlayAnimation.PlayAnimation.Event:connect(function(p1, p2, p3) --[[ Line: 725 | Upvalues: f15 (ref), v9 (copy) ]]
	f15(v9 .. p1 or "", p2, p3)
end)
workspace.Animation.StopAnimation.OnClientEvent:connect(function(p1, p2) --[[ Line: 726 | Upvalues: StopAnimation (copy), v9 (copy) ]]
	StopAnimation(p1 and v9 .. p1 or "", p2)
end)
workspace.Animation.StopAnimation.StopAnimation.Event:connect(function(p1, p2) --[[ Line: 727 | Upvalues: StopAnimation (copy), v9 (copy) ]]
	StopAnimation(v9 .. p1 or "", p2)
end)
workspace.Animation.PreloadAnimations.OnClientEvent:connect(function(...) --[[ Line: 728 | Upvalues: PreloadAnimations (copy) ]]
	PreloadAnimations(...)
end)
workspace.Animation.PreloadAnimations.PreloadAnimations.Event:connect(function(...) --[[ Line: 729 | Upvalues: PreloadAnimations (copy) ]]
	PreloadAnimations(...)
end)
workspace.Animation.OverrideCoreAnimation.OnClientEvent:connect(OverrideCoreAnimation)
workspace.Animation.ResetCoreAnimations.OnClientEvent:connect(ResetCoreAnimations)
local t6 = {
	{
		"Glee",
		{
			"*cheers",
			"woo!",
			"yay",
			"yeah!",
			"woot",
			"omg yes",
			"hooray",
			"hoorah",
			"@glee@",
			"@sweet",
			"thx",
			"thank you"
		}
	},
	{
		"Sad",
		{
			"whaa",
			"waa",
			"*cries",
			"@awww",
			"@cry@",
			"nooo",
			"nuuu",
			"@sad@",
			"@cry@",
			"DX@"
		}
	},
	{
		"Laugh",
		{
			"xd@",
			"lol",
			"rofl",
			"*laughs",
			"haha",
			"lulz",
			"@laugh@",
			"hehe",
			"lele"
		}
	},
	{
		"Angry",
		{
			"grr",
			"omg stop",
			"go away",
			"stop it",
			"shut up",
			"stfu",
			"gtfo",
			"@fu@",
			"nooo",
			"@angry@",
			"@mad@",
			"wtf"
		}
	},
	{
		"Scared",
		{ "ahh", "*screams", "@run away", "gasp", "help!", "@scared@", "@oh no" }
	},
	{
		"Amazed",
		{
			"wow",
			"woah",
			"@amazing",
			"cool!",
			"awesome!",
			"@omg@",
			"@omg!@",
			"@amazed@",
			"holy crap"
		}
	},
	{
		"Hi",
		{ "@hi", "hi ", "@hello", "@hey", "@sup@", "@sup", "@yo " }
	},
	{
		"Bye",
		{ "@bye", "cya", "nice meeting", "so long", "see ya", "@goodbye", "g2g" }
	},
	{
		"Confused",
		{ "huh", "@confused@" }
	},
	{
		"Think",
		{ "hmm", "*thinks", "@um@", "@think@" }
	},
	{
		"Point",
		{ "@look at", "*points", "look!", "@point@", "@no u@" }
	}
}
workspace.Main.Chatted.Chatted.Event:connect(function(p1) --[[ Line: 756 | Upvalues: t6 (copy), f15 (ref) ]]
	local v1 = "@" .. string.lower(p1) .. "@"
	for i = 1, #t6 do
		local v2 = t6[i][1]
		local v3 = t6[i][2]
		for j = 1, #v3 do
			if string.match(v1, v3[j]) then
				f15(v2, 0.1)
			end
		end
	end
end)
delay(1, function() --[[ Line: 771 | Upvalues: f15 (ref), t2 (copy) ]]
	f15(t2.Idle, 0.1)
end)
local t7 = {}
local function ListenForAnimationEffect(p1, p2) --[[ ListenForAnimationEffect | Line: 778 | Upvalues: t7 (copy), t (copy), v1 (copy), LocalPlayer (copy), v2 (copy), CurrentCamera (copy) ]]
	if not p2 or (not p2.Parent or (not p2:FindFirstChild("Humanoid") or t7[p2.Humanoid] ~= nil)) then
		return
	end
	t7[p2.Humanoid] = p2.Humanoid.AnimationPlayed:Connect(function(p1) --[[ Line: 781 | Upvalues: p2 (copy), t (ref), v1 (ref), LocalPlayer (ref), v2 (ref), CurrentCamera (ref) ]]
		if not (p2:FindFirstChild("Humanoid") and (p2:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer:DistanceFromCharacter(p2.HumanoidRootPart.Position) < 100)) then
			return
		end
		local v12 = string.match(p1.Animation.AnimationId, "%d+")
		if not (v12 and (t[v12] and t[v12].HasEffects)) then
			return
		end
		local v22 = p2
		local v3 = t[v12].Name
		local v4 = "Started"
		spawn(function() --[[ Line: 144 | Upvalues: v22 (copy), v3 (copy), v4 (copy), v1 (ref), LocalPlayer (ref), v2 (ref), CurrentCamera (ref) ]]
			local Tool = v22:FindFirstChildOfClass("Tool")
			if not Tool then
				return
			end
			if v3 == "DropFromSky" then
				if v4 ~= "Started" or not Tool:FindFirstChild("Lid") then
					return
				end
				Tool.Lid.Ribbon.Transparency = 1
				Tool.Lid.Handle2.Transparency = 1
				local Lid = Tool.Lid
				if Lid:FindFirstChild("Topper") then
					v1:SetModelVisible(Lid.Topper, false)
				end
				Tool.Present.Top.Transparency = 0
				Tool.Present.RibbonTop.Transparency = 0
				local Present = Tool.Present
				if Present:FindFirstChild("Topper") then
					v1:SetModelVisible(Present.Topper, true)
				end
			elseif v3 == "PogoIdle" then
				if v4 == "1" then
					Tool["Pogo Stick"].Handle.Bounce.PlaybackSpeed = 1
					Tool["Pogo Stick"].Handle.Bounce:Play()
				end
			elseif v3 == "PogoJump" then
				if v4 == "Started" then
					Tool["Pogo Stick"].Handle.Bounce.PlaybackSpeed = 0.5
					Tool["Pogo Stick"].Handle.Bounce:Play()
				end
			elseif v3 == "BaseballAction" or (v3 == "TennisAction" or (v3 == "FootballAction" or v3 == "FrisbeeAction")) then
				local v12 = Tool.Ball:FindFirstChild("Ball") or Tool.Ball:FindFirstChild("Handle")
				if v4 == "1" then
					v12.Transparency = 1
					local v22_2 = v12:clone()
					v22_2.Transparency = 0
					v22_2.CanCollide = true
					v22_2.Velocity = v22.HumanoidRootPart.CFrame.lookVector * 200 * v22_2.Speed.Value + Vector3.new(0, 100 * v22_2.UpwardForce.Value, 0)
					for i = 1, 100 do
						local Weld = v22_2:FindFirstChildOfClass("Weld")
						if not Weld then
							break
						end
						Weld:Destroy()
					end
					v22_2.Parent = workspace
					v22_2.CFrame = v12.CFrame
					wait(6)
					if v22_2 and v22_2.Parent then
						v22_2:Destroy()
					end
				else
					if v4 == "Ended" then
						v12.Transparency = 0
						return
					end
					if v4 == "Started" then
						v12.Transparency = 0
					end
				end
			else
				if v3 ~= "OpenPresent" then
					return
				end
				local PresentType = Tool.PresentType.Value
				if v4 == "Started" then
					Tool.Lid.Ribbon.Transparency = 1
					Tool.Lid.Handle2.Transparency = 1
					local Lid = Tool.Lid
					if Lid:FindFirstChild("Topper") then
						v1:SetModelVisible(Lid.Topper, false)
					end
					Tool.Present.Top.Transparency = 0
					Tool.Present.RibbonTop.Transparency = 0
					local Present = Tool.Present
					if Present:FindFirstChild("Topper") then
						v1:SetModelVisible(Present.Topper, true)
					end
				elseif v4 == "1" then
					Tool.Lid.Ribbon.Transparency = 0
					Tool.Lid.Handle2.Transparency = 0
					local Lid = Tool.Lid
					if Lid:FindFirstChild("Topper") then
						v1:SetModelVisible(Lid.Topper, true)
					end
					Tool.Present.Top.Transparency = 1
					Tool.Present.RibbonTop.Transparency = 1
					local Present = Tool.Present
					if Present:FindFirstChild("Topper") then
						v1:SetModelVisible(Present.Topper, false)
					end
					if v22 == LocalPlayer.Character then
						Tool.Present.Neon.ParticleEmitter:Emit(10)
						Tool.Present.Neon.ParticleEmitter.Speed = NumberRange.new(1, 1)
						Tool.Present.Neon.ParticleEmitter.Lifetime = NumberRange.new(3, 3)
						v2:PlaySound("Swish")
					end
				elseif v4 == "2" then
					Tool.Lid.Ribbon.Transparency = 1
					Tool.Lid.Handle2.Transparency = 1
					local Lid = Tool.Lid
					if Lid:FindFirstChild("Topper") then
						v1:SetModelVisible(Lid.Topper, false)
					end
				else
					if v4 == "4" or v4 == "3" then
						if v22 ~= LocalPlayer.Character then
							return
						end
						workspace.Main.StartPresentViewpportRotation:Fire(Tool.Lid.Handle2, PresentType)
						v2:PlaySound("Pop7")
						if Tool.Rarity.Value == "Legendary" then
							v2:PlaySound("CapsuleLegendaryOpened")
							return
						end
						if Tool.Rarity.Value == "Rare" then
							v2:PlaySound("CapsuleRareOpened")
							return
						end
						if Tool.Rarity.Value == "Common" or Tool.Rarity.Value == "Uncommon" then
							v2:PlaySound("CapsuleCommonOpened")
						else
							v2:PlaySound("PresentChimes")
						end
						return
					end
					if v4 ~= "Ended" or v22 ~= LocalPlayer.Character then
						return
					end
					local Humanoid = v22.Humanoid
					local HumanoidRootPart = v22.HumanoidRootPart
					local Handle2 = Tool.Lid.Handle2
					local v5 = game:GetService("TweenService"):Create(CurrentCamera, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
						CFrame = CFrame.new(CurrentCamera.CFrame.p + (Handle2.CFrame.p - CurrentCamera.CFrame.p).unit * 2, Handle2.Position)
					})
					v5.Completed:connect(function() --[[ Line: 321 ]]
						workspace.Main.ShowSellButton:Fire()
					end)
					v5:Play()
					Tool.Present.Neon.ParticleEmitter.Enabled = false
				end
			end
		end)
		local v5 = p1:GetMarkerReachedSignal("Action"):connect(function(p1) --[[ Line: 792 | Upvalues: p2 (ref), t (ref), v12 (copy), v1 (ref), LocalPlayer (ref), v2 (ref), CurrentCamera (ref) ]]
			local v13 = p2
			local v22 = t[v12].Name
			spawn(function() --[[ Line: 144 | Upvalues: v13 (copy), v22 (copy), p1 (copy), v1 (ref), LocalPlayer (ref), v2 (ref), CurrentCamera (ref) ]]
				local Tool = v13:FindFirstChildOfClass("Tool")
				if not Tool then
					return
				end
				if v22 == "DropFromSky" then
					if p1 ~= "Started" or not Tool:FindFirstChild("Lid") then
						return
					end
					Tool.Lid.Ribbon.Transparency = 1
					Tool.Lid.Handle2.Transparency = 1
					local Lid = Tool.Lid
					if Lid:FindFirstChild("Topper") then
						v1:SetModelVisible(Lid.Topper, false)
					end
					Tool.Present.Top.Transparency = 0
					Tool.Present.RibbonTop.Transparency = 0
					local Present = Tool.Present
					if Present:FindFirstChild("Topper") then
						v1:SetModelVisible(Present.Topper, true)
					end
				elseif v22 == "PogoIdle" then
					if p1 == "1" then
						Tool["Pogo Stick"].Handle.Bounce.PlaybackSpeed = 1
						Tool["Pogo Stick"].Handle.Bounce:Play()
					end
				elseif v22 == "PogoJump" then
					if p1 == "Started" then
						Tool["Pogo Stick"].Handle.Bounce.PlaybackSpeed = 0.5
						Tool["Pogo Stick"].Handle.Bounce:Play()
					end
				elseif v22 == "BaseballAction" or (v22 == "TennisAction" or (v22 == "FootballAction" or v22 == "FrisbeeAction")) then
					local v12 = Tool.Ball:FindFirstChild("Ball") or Tool.Ball:FindFirstChild("Handle")
					if p1 == "1" then
						v12.Transparency = 1
						local v22_2 = v12:clone()
						v22_2.Transparency = 0
						v22_2.CanCollide = true
						v22_2.Velocity = v13.HumanoidRootPart.CFrame.lookVector * 200 * v22_2.Speed.Value + Vector3.new(0, 100 * v22_2.UpwardForce.Value, 0)
						for i = 1, 100 do
							local Weld = v22_2:FindFirstChildOfClass("Weld")
							if not Weld then
								break
							end
							Weld:Destroy()
						end
						v22_2.Parent = workspace
						v22_2.CFrame = v12.CFrame
						wait(6)
						if v22_2 and v22_2.Parent then
							v22_2:Destroy()
						end
					else
						if p1 == "Ended" then
							v12.Transparency = 0
							return
						end
						if p1 == "Started" then
							v12.Transparency = 0
						end
					end
				else
					if v22 ~= "OpenPresent" then
						return
					end
					local PresentType = Tool.PresentType.Value
					if p1 == "Started" then
						Tool.Lid.Ribbon.Transparency = 1
						Tool.Lid.Handle2.Transparency = 1
						local Lid = Tool.Lid
						if Lid:FindFirstChild("Topper") then
							v1:SetModelVisible(Lid.Topper, false)
						end
						Tool.Present.Top.Transparency = 0
						Tool.Present.RibbonTop.Transparency = 0
						local Present = Tool.Present
						if Present:FindFirstChild("Topper") then
							v1:SetModelVisible(Present.Topper, true)
						end
					elseif p1 == "1" then
						Tool.Lid.Ribbon.Transparency = 0
						Tool.Lid.Handle2.Transparency = 0
						local Lid = Tool.Lid
						if Lid:FindFirstChild("Topper") then
							v1:SetModelVisible(Lid.Topper, true)
						end
						Tool.Present.Top.Transparency = 1
						Tool.Present.RibbonTop.Transparency = 1
						local Present = Tool.Present
						if Present:FindFirstChild("Topper") then
							v1:SetModelVisible(Present.Topper, false)
						end
						if v13 == LocalPlayer.Character then
							Tool.Present.Neon.ParticleEmitter:Emit(10)
							Tool.Present.Neon.ParticleEmitter.Speed = NumberRange.new(1, 1)
							Tool.Present.Neon.ParticleEmitter.Lifetime = NumberRange.new(3, 3)
							v2:PlaySound("Swish")
						end
					elseif p1 == "2" then
						Tool.Lid.Ribbon.Transparency = 1
						Tool.Lid.Handle2.Transparency = 1
						local Lid = Tool.Lid
						if Lid:FindFirstChild("Topper") then
							v1:SetModelVisible(Lid.Topper, false)
						end
					else
						if p1 == "4" or p1 == "3" then
							if v13 ~= LocalPlayer.Character then
								return
							end
							workspace.Main.StartPresentViewpportRotation:Fire(Tool.Lid.Handle2, PresentType)
							v2:PlaySound("Pop7")
							if Tool.Rarity.Value == "Legendary" then
								v2:PlaySound("CapsuleLegendaryOpened")
								return
							end
							if Tool.Rarity.Value == "Rare" then
								v2:PlaySound("CapsuleRareOpened")
								return
							end
							if Tool.Rarity.Value == "Common" or Tool.Rarity.Value == "Uncommon" then
								v2:PlaySound("CapsuleCommonOpened")
							else
								v2:PlaySound("PresentChimes")
							end
							return
						end
						if p1 ~= "Ended" or v13 ~= LocalPlayer.Character then
							return
						end
						local Humanoid = v13.Humanoid
						local HumanoidRootPart = v13.HumanoidRootPart
						local Handle2 = Tool.Lid.Handle2
						local v5 = game:GetService("TweenService"):Create(CurrentCamera, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
							CFrame = CFrame.new(CurrentCamera.CFrame.p + (Handle2.CFrame.p - CurrentCamera.CFrame.p).unit * 2, Handle2.Position)
						})
						v5.Completed:connect(function() --[[ Line: 321 ]]
							workspace.Main.ShowSellButton:Fire()
						end)
						v5:Play()
						Tool.Present.Neon.ParticleEmitter.Enabled = false
					end
				end
			end)
		end)
		local v6 = nil
		v6 = p1.Stopped:connect(function() --[[ Line: 797 | Upvalues: v5 (copy), v6 (ref), p2 (ref), t (ref), v12 (copy), v1 (ref), LocalPlayer (ref), v2 (ref), CurrentCamera (ref) ]]
			v5:disconnect()
			v6:disconnect()
			local v13 = p2
			local v22 = t[v12].Name
			local v3 = "Ended"
			spawn(function() --[[ Line: 144 | Upvalues: v13 (copy), v22 (copy), v3 (copy), v1 (ref), LocalPlayer (ref), v2 (ref), CurrentCamera (ref) ]]
				local Tool = v13:FindFirstChildOfClass("Tool")
				if not Tool then
					return
				end
				if v22 == "DropFromSky" then
					if v3 ~= "Started" or not Tool:FindFirstChild("Lid") then
						return
					end
					Tool.Lid.Ribbon.Transparency = 1
					Tool.Lid.Handle2.Transparency = 1
					local Lid = Tool.Lid
					if Lid:FindFirstChild("Topper") then
						v1:SetModelVisible(Lid.Topper, false)
					end
					Tool.Present.Top.Transparency = 0
					Tool.Present.RibbonTop.Transparency = 0
					local Present = Tool.Present
					if Present:FindFirstChild("Topper") then
						v1:SetModelVisible(Present.Topper, true)
					end
				elseif v22 == "PogoIdle" then
					if v3 == "1" then
						Tool["Pogo Stick"].Handle.Bounce.PlaybackSpeed = 1
						Tool["Pogo Stick"].Handle.Bounce:Play()
					end
				elseif v22 == "PogoJump" then
					if v3 == "Started" then
						Tool["Pogo Stick"].Handle.Bounce.PlaybackSpeed = 0.5
						Tool["Pogo Stick"].Handle.Bounce:Play()
					end
				elseif v22 == "BaseballAction" or (v22 == "TennisAction" or (v22 == "FootballAction" or v22 == "FrisbeeAction")) then
					local v12 = Tool.Ball:FindFirstChild("Ball") or Tool.Ball:FindFirstChild("Handle")
					if v3 == "1" then
						v12.Transparency = 1
						local v22_2 = v12:clone()
						v22_2.Transparency = 0
						v22_2.CanCollide = true
						v22_2.Velocity = v13.HumanoidRootPart.CFrame.lookVector * 200 * v22_2.Speed.Value + Vector3.new(0, 100 * v22_2.UpwardForce.Value, 0)
						for i = 1, 100 do
							local Weld = v22_2:FindFirstChildOfClass("Weld")
							if not Weld then
								break
							end
							Weld:Destroy()
						end
						v22_2.Parent = workspace
						v22_2.CFrame = v12.CFrame
						wait(6)
						if v22_2 and v22_2.Parent then
							v22_2:Destroy()
						end
					else
						if v3 == "Ended" then
							v12.Transparency = 0
							return
						end
						if v3 == "Started" then
							v12.Transparency = 0
						end
					end
				else
					if v22 ~= "OpenPresent" then
						return
					end
					local PresentType = Tool.PresentType.Value
					if v3 == "Started" then
						Tool.Lid.Ribbon.Transparency = 1
						Tool.Lid.Handle2.Transparency = 1
						local Lid = Tool.Lid
						if Lid:FindFirstChild("Topper") then
							v1:SetModelVisible(Lid.Topper, false)
						end
						Tool.Present.Top.Transparency = 0
						Tool.Present.RibbonTop.Transparency = 0
						local Present = Tool.Present
						if Present:FindFirstChild("Topper") then
							v1:SetModelVisible(Present.Topper, true)
						end
					elseif v3 == "1" then
						Tool.Lid.Ribbon.Transparency = 0
						Tool.Lid.Handle2.Transparency = 0
						local Lid = Tool.Lid
						if Lid:FindFirstChild("Topper") then
							v1:SetModelVisible(Lid.Topper, true)
						end
						Tool.Present.Top.Transparency = 1
						Tool.Present.RibbonTop.Transparency = 1
						local Present = Tool.Present
						if Present:FindFirstChild("Topper") then
							v1:SetModelVisible(Present.Topper, false)
						end
						if v13 == LocalPlayer.Character then
							Tool.Present.Neon.ParticleEmitter:Emit(10)
							Tool.Present.Neon.ParticleEmitter.Speed = NumberRange.new(1, 1)
							Tool.Present.Neon.ParticleEmitter.Lifetime = NumberRange.new(3, 3)
							v2:PlaySound("Swish")
						end
					elseif v3 == "2" then
						Tool.Lid.Ribbon.Transparency = 1
						Tool.Lid.Handle2.Transparency = 1
						local Lid = Tool.Lid
						if Lid:FindFirstChild("Topper") then
							v1:SetModelVisible(Lid.Topper, false)
						end
					else
						if v3 == "4" or v3 == "3" then
							if v13 ~= LocalPlayer.Character then
								return
							end
							workspace.Main.StartPresentViewpportRotation:Fire(Tool.Lid.Handle2, PresentType)
							v2:PlaySound("Pop7")
							if Tool.Rarity.Value == "Legendary" then
								v2:PlaySound("CapsuleLegendaryOpened")
								return
							end
							if Tool.Rarity.Value == "Rare" then
								v2:PlaySound("CapsuleRareOpened")
								return
							end
							if Tool.Rarity.Value == "Common" or Tool.Rarity.Value == "Uncommon" then
								v2:PlaySound("CapsuleCommonOpened")
							else
								v2:PlaySound("PresentChimes")
							end
							return
						end
						if v3 ~= "Ended" or v13 ~= LocalPlayer.Character then
							return
						end
						local Humanoid = v13.Humanoid
						local HumanoidRootPart = v13.HumanoidRootPart
						local Handle2 = Tool.Lid.Handle2
						local v5 = game:GetService("TweenService"):Create(CurrentCamera, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
							CFrame = CFrame.new(CurrentCamera.CFrame.p + (Handle2.CFrame.p - CurrentCamera.CFrame.p).unit * 2, Handle2.Position)
						})
						v5.Completed:connect(function() --[[ Line: 321 ]]
							workspace.Main.ShowSellButton:Fire()
						end)
						v5:Play()
						Tool.Present.Neon.ParticleEmitter.Enabled = false
					end
				end
			end)
		end)
	end)
end
game.Players.PlayerAdded:connect(function(p1) --[[ Line: 812 | Upvalues: ListenForAnimationEffect (copy) ]]
	p1.CharacterAdded:connect(function(p12) --[[ Line: 813 | Upvalues: p1 (copy), ListenForAnimationEffect (ref) ]]
		wait(3)
		if not (p1 and (p1.Parent and (p12 and (p12.Parent and p12:WaitForChild("HumanoidRootPart", 3))))) then
			return
		end
		ListenForAnimationEffect(p1, p12)
	end)
end)
for i, v in ipairs(game.Players:GetPlayers()) do
	spawn(function() --[[ Line: 824 | Upvalues: v (copy), v5 (copy), ListenForAnimationEffect (copy) ]]
		local count = 10
		while v.Character == nil and count <= 0 do
			wait(1)
			count = count - 1
		end
		if v5.IsOnline then
			wait(3)
		end
		if not (v and (v.Parent and (v.Character and (v.Character.Parent and v.Character:WaitForChild("HumanoidRootPart", 3))))) then
			return
		end
		ListenForAnimationEffect(v, v.Character)
	end)
end
if v6 == "R15" then
	return
end
for k, v in pairs(AnimationInfo.Data) do

end