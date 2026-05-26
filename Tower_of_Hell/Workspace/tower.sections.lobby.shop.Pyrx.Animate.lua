-- https://lua.expert/
wait(1)
local v1 = script.Parent
local Humanoid = v1:WaitForChild("Humanoid")
local v2 = "Standing"
local v3, v4 = pcall(function() --[[ Line: 7 ]]
	return UserSettings():IsUserFeatureEnabled("UserNoUpdateOnLoop")
end)
local v5 = v3 and v4
local v6, v7 = pcall(function() --[[ Line: 11 ]]
	return UserSettings():IsUserFeatureEnabled("UserEmoteToRunThresholdChange")
end)
local v8 = v6 and v7
local v9, v10 = pcall(function() --[[ Line: 18 ]]
	return UserSettings():IsUserFeatureEnabled("UserPlayEmoteByIdAnimTrackReturn2")
end)
local v11 = v9 and v10
local ScaleDampeningPercent = script:FindFirstChild("ScaleDampeningPercent")
local v12 = ""
local v13 = nil
local v14 = nil
local v15 = nil
local v16 = 1
local v17 = nil
local v18 = nil
local t = {}
local t2 = {}
local tbl = {
	idle = {
		{
			id = "http://www.roblox.com/asset/?id=507766666",
			weight = 1
		},
		{
			id = "http://www.roblox.com/asset/?id=507766951",
			weight = 1
		},
		{
			id = "http://www.roblox.com/asset/?id=507766388",
			weight = 9
		}
	},
	walk = {
		{
			id = "http://www.roblox.com/asset/?id=507777826",
			weight = 10
		}
	},
	run = {
		{
			id = "http://www.roblox.com/asset/?id=507767714",
			weight = 10
		}
	},
	swim = {
		{
			id = "http://www.roblox.com/asset/?id=507784897",
			weight = 10
		}
	},
	swimidle = {
		{
			id = "http://www.roblox.com/asset/?id=507785072",
			weight = 10
		}
	},
	jump = {
		{
			id = "http://www.roblox.com/asset/?id=507765000",
			weight = 10
		}
	},
	fall = {
		{
			id = "http://www.roblox.com/asset/?id=507767968",
			weight = 10
		}
	},
	climb = {
		{
			id = "http://www.roblox.com/asset/?id=507765644",
			weight = 10
		}
	},
	sit = {
		{
			id = "http://www.roblox.com/asset/?id=2506281703",
			weight = 10
		}
	},
	toolnone = {
		{
			id = "http://www.roblox.com/asset/?id=507768375",
			weight = 10
		}
	},
	toolslash = {
		{
			id = "http://www.roblox.com/asset/?id=522635514",
			weight = 10
		}
	},
	toollunge = {
		{
			id = "http://www.roblox.com/asset/?id=522638767",
			weight = 10
		}
	},
	wave = {
		{
			id = "http://www.roblox.com/asset/?id=507770239",
			weight = 10
		}
	},
	point = {
		{
			id = "http://www.roblox.com/asset/?id=507770453",
			weight = 10
		}
	},
	dance = {
		{
			id = "http://www.roblox.com/asset/?id=507771019",
			weight = 10
		},
		{
			id = "http://www.roblox.com/asset/?id=507771955",
			weight = 10
		},
		{
			id = "http://www.roblox.com/asset/?id=507772104",
			weight = 10
		}
	},
	dance2 = {
		{
			id = "http://www.roblox.com/asset/?id=507776043",
			weight = 10
		},
		{
			id = "http://www.roblox.com/asset/?id=507776720",
			weight = 10
		},
		{
			id = "http://www.roblox.com/asset/?id=507776879",
			weight = 10
		}
	},
	dance3 = {
		{
			id = "http://www.roblox.com/asset/?id=507777268",
			weight = 10
		},
		{
			id = "http://www.roblox.com/asset/?id=507777451",
			weight = 10
		},
		{
			id = "http://www.roblox.com/asset/?id=507777623",
			weight = 10
		}
	},
	laugh = {
		{
			id = "http://www.roblox.com/asset/?id=507770818",
			weight = 10
		}
	},
	cheer = {
		{
			id = "http://www.roblox.com/asset/?id=507770677",
			weight = 10
		}
	}
}
local t3 = {
	wave = false,
	point = false,
	dance = true,
	dance2 = true,
	dance3 = true,
	laugh = false,
	cheer = false
}
math.randomseed(tick())
function findExistingAnimationInSet(p1, p2) --[[ findExistingAnimationInSet | Line: 114 ]]
	if p1 == nil or p2 == nil then
		return 0
	end
	for i = 1, p1.count do
		if p1[i].anim.AnimationId == p2.AnimationId then
			return i
		end
	end
	return 0
end
function configureAnimationSet(p1, p2) --[[ configureAnimationSet | Line: 128 | Upvalues: t2 (copy), t (copy), Humanoid (copy) ]]
	if t2[p1] ~= nil then
		for k, v in pairs(t2[p1].connections) do
			v:disconnect()
		end
	end
	t2[p1] = {}
	t2[p1].count = 0
	t2[p1].totalWeight = 0
	t2[p1].connections = {}
	local v1 = true
	local v2, _ = pcall(function() --[[ Line: 141 | Upvalues: v1 (ref) ]]
		v1 = game:GetService("StarterPlayer").AllowCustomAnimations
	end)
	if not v2 then
		v1 = true
	end
	local v3 = script:FindFirstChild(p1)
	if v1 and v3 ~= nil then
		table.insert(t2[p1].connections, v3.ChildAdded:connect(function(p12) --[[ Line: 149 | Upvalues: p1 (copy), p2 (copy) ]]
			configureAnimationSet(p1, p2)
		end))
		table.insert(t2[p1].connections, v3.ChildRemoved:connect(function(p12) --[[ Line: 150 | Upvalues: p1 (copy), p2 (copy) ]]
			configureAnimationSet(p1, p2)
		end))
		for k, v in pairs(v3:GetChildren()) do
			if v:IsA("Animation") then
				local Weight = v:FindFirstChild("Weight")
				local v4 = if Weight == nil then 1 else Weight.Value
				t2[p1].count = t2[p1].count + 1
				local count = t2[p1].count
				t2[p1][count] = {}
				t2[p1][count].anim = v
				t2[p1][count].weight = v4
				t2[p1].totalWeight = t2[p1].totalWeight + t2[p1][count].weight
				table.insert(t2[p1].connections, v.Changed:connect(function(p12) --[[ Line: 166 | Upvalues: p1 (copy), p2 (copy) ]]
					configureAnimationSet(p1, p2)
				end))
				table.insert(t2[p1].connections, v.ChildAdded:connect(function(p12) --[[ Line: 167 | Upvalues: p1 (copy), p2 (copy) ]]
					configureAnimationSet(p1, p2)
				end))
				table.insert(t2[p1].connections, v.ChildRemoved:connect(function(p12) --[[ Line: 168 | Upvalues: p1 (copy), p2 (copy) ]]
					configureAnimationSet(p1, p2)
				end))
			end
		end
	end
	if t2[p1].count <= 0 then
		for k, v in pairs(p2) do
			t2[p1][k] = {}
			t2[p1][k].anim = Instance.new("Animation")
			t2[p1][k].anim.Name = p1
			t2[p1][k].anim.AnimationId = v.id
			t2[p1][k].weight = v.weight
			t2[p1].count = t2[p1].count + 1
			t2[p1].totalWeight = t2[p1].totalWeight + v.weight
		end
	end
	for k, v in pairs(t2) do
		for i = 1, v.count do
			if t[v[i].anim.AnimationId] == nil then
				Humanoid:LoadAnimation(v[i].anim)
				t[v[i].anim.AnimationId] = true
			end
		end
	end
end
function configureAnimationSetOld(p1, p2) --[[ configureAnimationSetOld | Line: 199 | Upvalues: t2 (copy), Humanoid (copy) ]]
	if t2[p1] ~= nil then
		for k, v in pairs(t2[p1].connections) do
			v:disconnect()
		end
	end
	t2[p1] = {}
	t2[p1].count = 0
	t2[p1].totalWeight = 0
	t2[p1].connections = {}
	local v1 = true
	local v2, _ = pcall(function() --[[ Line: 212 | Upvalues: v1 (ref) ]]
		v1 = game:GetService("StarterPlayer").AllowCustomAnimations
	end)
	if not v2 then
		v1 = true
	end
	local v3 = script:FindFirstChild(p1)
	if v1 and v3 ~= nil then
		table.insert(t2[p1].connections, v3.ChildAdded:connect(function(p12) --[[ Line: 220 | Upvalues: p1 (copy), p2 (copy) ]]
			configureAnimationSet(p1, p2)
		end))
		table.insert(t2[p1].connections, v3.ChildRemoved:connect(function(p12) --[[ Line: 221 | Upvalues: p1 (copy), p2 (copy) ]]
			configureAnimationSet(p1, p2)
		end))
		local count = 1
		for k, v in pairs(v3:GetChildren()) do
			if v:IsA("Animation") then
				table.insert(t2[p1].connections, v.Changed:connect(function(p12) --[[ Line: 225 | Upvalues: p1 (copy), p2 (copy) ]]
					configureAnimationSet(p1, p2)
				end))
				t2[p1][count] = {}
				t2[p1][count].anim = v
				local Weight = v:FindFirstChild("Weight")
				if Weight == nil then
					t2[p1][count].weight = 1
				else
					t2[p1][count].weight = Weight.Value
				end
				t2[p1].count = t2[p1].count + 1
				t2[p1].totalWeight = t2[p1].totalWeight + t2[p1][count].weight
				count = count + 1
			end
		end
	end
	if t2[p1].count <= 0 then
		for k, v in pairs(p2) do
			t2[p1][k] = {}
			t2[p1][k].anim = Instance.new("Animation")
			t2[p1][k].anim.Name = p1
			t2[p1][k].anim.AnimationId = v.id
			t2[p1][k].weight = v.weight
			t2[p1].count = t2[p1].count + 1
			t2[p1].totalWeight = t2[p1].totalWeight + v.weight
		end
	end
	for k, v in pairs(t2) do
		for i = 1, v.count do
			Humanoid:LoadAnimation(v[i].anim)
		end
	end
end
function scriptChildModified(p1) --[[ scriptChildModified | Line: 264 | Upvalues: tbl (copy) ]]
	local v1 = tbl[p1.Name]
	if v1 == nil then
		return
	end
	configureAnimationSet(p1.Name, v1)
end
script.ChildAdded:connect(scriptChildModified)
script.ChildRemoved:connect(scriptChildModified)
local v19 = if Humanoid then Humanoid:FindFirstChildOfClass("Animator") else nil
if v19 then
	for i, v in ipairs((v19:GetPlayingAnimationTracks())) do
		v:Stop(0)
		v:Destroy()
	end
end
for k, v in pairs(tbl) do
	configureAnimationSet(k, v)
end
local v21 = "None"
local v22 = 0
local v23 = 0
local v24 = false
function stopAllAnimations() --[[ stopAllAnimations | Line: 305 | Upvalues: v12 (ref), t3 (copy), v24 (ref), v13 (ref), v15 (ref), v14 (ref), v18 (ref), v17 (ref) ]]
	local v1 = v12
	if t3[v1] ~= nil and t3[v1] == false then
		v1 = "idle"
	end
	if v24 then
		v1 = "idle"
		v24 = false
	end
	v12 = ""
	v13 = nil
	if v15 ~= nil then
		v15:disconnect()
	end
	if v14 ~= nil then
		v14:Stop()
		v14:Destroy()
		v14 = nil
	end
	if v18 ~= nil then
		v18:disconnect()
	end
	if v17 == nil then
		return v1
	end
	v17:Stop()
	v17:Destroy()
	v17 = nil
	return v1
end
function getHeightScale() --[[ getHeightScale | Line: 344 | Upvalues: Humanoid (copy), ScaleDampeningPercent (ref) ]]
	if not Humanoid then
		return 1
	end
	if not Humanoid.AutomaticScalingEnabled then
		return 1
	end
	local v1 = Humanoid.HipHeight / 2
	if ScaleDampeningPercent == nil then
		ScaleDampeningPercent = script:FindFirstChild("ScaleDampeningPercent")
	end
	if ScaleDampeningPercent ~= nil then
		v1 = 1 + (Humanoid.HipHeight - 2) * ScaleDampeningPercent.Value / 2
	end
	return v1
end
local function rootMotionCompensation(p1) --[[ rootMotionCompensation | Line: 362 ]]
	return p1 * 1.25 / getHeightScale()
end
local function setRunSpeed(p1) --[[ setRunSpeed | Line: 370 | Upvalues: v14 (ref), v17 (ref) ]]
	local v1 = p1 * 1.25 / getHeightScale()
	local v2 = 0.0001
	local v3 = v1 / 0.5
	local v4 = v1 / 1
	local v5
	if v1 <= 0.5 then
		v2 = 1
		v5 = 0.0001
	elseif v1 < 1 then
		local v6 = (v1 - 0.5) / 0.5
		v2 = 1 - v6
		v5 = v6
		v3 = 1
		v4 = 1
	else
		v5 = 1
	end
	v14:AdjustWeight(v2)
	v17:AdjustWeight(v5)
	v14:AdjustSpeed(v3)
	v17:AdjustSpeed(v4)
end
function setAnimationSpeed(p1) --[[ setAnimationSpeed | Line: 397 | Upvalues: v12 (ref), setRunSpeed (copy), v16 (ref), v14 (ref) ]]
	if v12 == "walk" then
		setRunSpeed(p1)
		return
	end
	if p1 == v16 then
		return
	end
	v16 = p1
	v14:AdjustSpeed(p1)
end
function keyFrameReachedFunc(p1) --[[ keyFrameReachedFunc | Line: 408 | Upvalues: v12 (ref), v5 (copy), v17 (ref), v14 (ref), t3 (copy), v24 (ref), v16 (ref), Humanoid (copy) ]]
	if p1 ~= "End" then
		return
	end
	if v12 == "walk" then
		if v5 ~= true then
			v17.TimePosition = 0
			v14.TimePosition = 0
			return
		end
		if v17.Looped ~= true then
			v17.TimePosition = 0
		end
		if v14.Looped ~= true then
			v14.TimePosition = 0
		end
	else
		local v1 = v12
		if t3[v1] ~= nil and t3[v1] == false then
			v1 = "idle"
		end
		if v24 then
			if v14.Looped then
				return
			end
			v1 = "idle"
			v24 = false
		end
		playAnimation(v1, 0.15, Humanoid)
		setAnimationSpeed(v16)
	end
end
function rollAnimation(p1) --[[ rollAnimation | Line: 446 | Upvalues: t2 (copy) ]]
	local sum = math.random(1, t2[p1].totalWeight)
	local count = 1
	while t2[p1][count].weight < sum do
		sum = sum - t2[p1][count].weight
		count = count + 1
	end
	return count
end
local function switchToAnim(p1, p2, p3, p4) --[[ switchToAnim | Line: 457 | Upvalues: v13 (ref), v14 (ref), v17 (ref), v5 (copy), v16 (ref), v12 (ref), v15 (ref), t2 (copy), v18 (ref) ]]
	if p1 == v13 then
		return
	end
	if v14 ~= nil then
		v14:Stop(p3)
		v14:Destroy()
	end
	if v17 ~= nil then
		v17:Stop(p3)
		v17:Destroy()
		if v5 == true then
			v17 = nil
		end
	end
	v16 = 1
	v14 = p4:LoadAnimation(p1)
	v14.Priority = Enum.AnimationPriority.Core
	v14:Play(p3)
	v12 = p2
	v13 = p1
	if v15 ~= nil then
		v15:disconnect()
	end
	v15 = v14.KeyframeReached:connect(keyFrameReachedFunc)
	if p2 ~= "walk" then
		return
	end
	v17 = p4:LoadAnimation(t2.run[rollAnimation("run")].anim)
	v17.Priority = Enum.AnimationPriority.Core
	v17:Play(p3)
	if v18 ~= nil then
		v18:disconnect()
	end
	v18 = v17.KeyframeReached:connect(keyFrameReachedFunc)
end
function playAnimation(p1, p2, p3) --[[ playAnimation | Line: 508 | Upvalues: t2 (copy), switchToAnim (copy), v24 (ref) ]]
	switchToAnim(t2[p1][rollAnimation(p1)].anim, p1, p2, p3)
	v24 = false
end
function playEmote(p1, p2, p3) --[[ playEmote | Line: 516 | Upvalues: switchToAnim (copy), v24 (ref) ]]
	switchToAnim(p1, p1.Name, p2, p3)
	v24 = true
end
local v25 = ""
local v26 = nil
local v27 = nil
local v28 = nil
function toolKeyFrameReachedFunc(p1) --[[ toolKeyFrameReachedFunc | Line: 529 | Upvalues: v25 (ref), Humanoid (copy) ]]
	if p1 ~= "End" then
		return
	end
	playToolAnimation(v25, 0, Humanoid)
end
function playToolAnimation(p1, p2, p3, p4) --[[ playToolAnimation | Line: 536 | Upvalues: t2 (copy), v27 (ref), v26 (ref), v25 (ref), v28 (ref) ]]
	local anim = t2[p1][rollAnimation(p1)].anim
	if v27 == anim then
		return
	end
	if v26 ~= nil then
		v26:Stop()
		v26:Destroy()
		p2 = 0
	end
	v26 = p3:LoadAnimation(anim)
	if p4 then
		v26.Priority = p4
	end
	v26:Play(p2)
	v25 = p1
	v27 = anim
	v28 = v26.KeyframeReached:connect(toolKeyFrameReachedFunc)
end
function stopToolAnimations() --[[ stopToolAnimations | Line: 563 | Upvalues: v25 (ref), v28 (ref), v27 (ref), v26 (ref) ]]
	local v1 = v25
	if v28 ~= nil then
		v28:disconnect()
	end
	v25 = ""
	v27 = nil
	if v26 == nil then
		return v1
	end
	v26:Stop()
	v26:Destroy()
	v26 = nil
	return v1
end
function onRunning(p1) --[[ onRunning | Line: 585 | Upvalues: v8 (ref), v24 (ref), Humanoid (copy), v2 (ref), t3 (copy), v12 (ref) ]]
	if (v8 and (v24 and Humanoid.MoveDirection == Vector3.new(0, 0, 0)) and Humanoid.WalkSpeed or 0.75) < p1 then
		playAnimation("walk", 0.2, Humanoid)
		setAnimationSpeed(p1 / 16)
		v2 = "Running"
		return
	end
	if t3[v12] ~= nil or v24 then
		return
	end
	playAnimation("idle", 0.2, Humanoid)
	v2 = "Standing"
end
function onDied() --[[ onDied | Line: 602 | Upvalues: v2 (ref) ]]
	v2 = "Dead"
end
function onJumping() --[[ onJumping | Line: 606 | Upvalues: Humanoid (copy), v23 (ref), v2 (ref) ]]
	playAnimation("jump", 0.1, Humanoid)
	v23 = 0.31
	v2 = "Jumping"
end
function onClimbing(p1) --[[ onClimbing | Line: 612 | Upvalues: Humanoid (copy), v2 (ref) ]]
	playAnimation("climb", 0.1, Humanoid)
	setAnimationSpeed(p1 / 5)
	v2 = "Climbing"
end
function onGettingUp() --[[ onGettingUp | Line: 619 | Upvalues: v2 (ref) ]]
	v2 = "GettingUp"
end
function onFreeFall() --[[ onFreeFall | Line: 623 | Upvalues: v23 (ref), Humanoid (copy), v2 (ref) ]]
	if not (v23 <= 0) then
		v2 = "FreeFall"
		return
	end
	playAnimation("fall", 0.2, Humanoid)
	v2 = "FreeFall"
end
function onFallingDown() --[[ onFallingDown | Line: 630 | Upvalues: v2 (ref) ]]
	v2 = "FallingDown"
end
function onSeated() --[[ onSeated | Line: 634 | Upvalues: v2 (ref) ]]
	v2 = "Seated"
end
function onPlatformStanding() --[[ onPlatformStanding | Line: 638 | Upvalues: v2 (ref) ]]
	v2 = "PlatformStanding"
end
function onSwimming(p1) --[[ onSwimming | Line: 645 | Upvalues: Humanoid (copy), v2 (ref) ]]
	if p1 > 1 then
		playAnimation("swim", 0.4, Humanoid)
		setAnimationSpeed(p1 / 10)
		v2 = "Swimming"
	else
		playAnimation("swimidle", 0.4, Humanoid)
		v2 = "Standing"
	end
end
function animateTool() --[[ animateTool | Line: 657 | Upvalues: v21 (ref), Humanoid (copy) ]]
	if v21 == "None" then
		playToolAnimation("toolnone", 0.1, Humanoid, Enum.AnimationPriority.Idle)
		return
	end
	if v21 == "Slash" then
		playToolAnimation("toolslash", 0, Humanoid, Enum.AnimationPriority.Action)
		return
	end
	if v21 == "Lunge" then
		playToolAnimation("toollunge", 0, Humanoid, Enum.AnimationPriority.Action)
	end
end
function getToolAnim(p1) --[[ getToolAnim | Line: 674 ]]
	for i, v in ipairs(p1:GetChildren()) do
		if v.Name == "toolanim" and v.className == "StringValue" then
			return v
		end
	end
	return nil
end
local v29 = 0
function stepAnimate(p1) --[[ stepAnimate | Line: 685 | Upvalues: v29 (ref), v23 (ref), v2 (ref), Humanoid (copy), v1 (copy), v21 (ref), v22 (ref), v27 (ref) ]]
	local v12 = p1 - v29
	v29 = p1
	if v23 > 0 then
		v23 = v23 - v12
	end
	if v2 == "FreeFall" and v23 <= 0 then
		playAnimation("fall", 0.2, Humanoid)
	else
		if v2 == "Seated" then
			playAnimation("sit", 0.5, Humanoid)
			return
		end
		if v2 == "Running" then
			playAnimation("walk", 0.2, Humanoid)
		elseif v2 == "Dead" or (v2 == "GettingUp" or (v2 == "FallingDown" or (v2 == "Seated" or v2 == "PlatformStanding"))) then
			stopAllAnimations()
		end
	end
	local Tool = v1:FindFirstChildOfClass("Tool")
	if not (Tool and Tool:FindFirstChild("Handle")) then
		stopToolAnimations()
		v21 = "None"
		v27 = nil
		v22 = 0
		return
	end
	local v24 = getToolAnim(Tool)
	if v24 then
		v21 = v24.Value
		v24.Parent = nil
		v22 = p1 + 0.3
	end
	if not (v22 < p1) then
		animateTool()
		return
	end
	v22 = 0
	v21 = "None"
	animateTool()
end
Humanoid.Died:connect(onDied)
Humanoid.Running:connect(onRunning)
Humanoid.Jumping:connect(onJumping)
Humanoid.Climbing:connect(onClimbing)
Humanoid.GettingUp:connect(onGettingUp)
Humanoid.FreeFalling:connect(onFreeFall)
Humanoid.FallingDown:connect(onFallingDown)
Humanoid.Seated:connect(onSeated)
Humanoid.PlatformStanding:connect(onPlatformStanding)
Humanoid.Swimming:connect(onSwimming)
script:WaitForChild("PlayEmote").OnInvoke = function(p1) --[[ Line: 765 | Upvalues: v2 (ref), t3 (copy), Humanoid (copy), v11 (ref), v14 (ref) ]]
	if v2 ~= "Standing" then
		return
	end
	if t3[p1] == nil then
		if typeof(p1) ~= "Instance" or not p1:IsA("Animation") then
			return false
		end
		playEmote(p1, 0.1, Humanoid)
	else
		playAnimation(p1, 0.1, Humanoid)
	end
	if v11 then
		return true, v14
	else
		return true
	end
end
if v1.Parent ~= nil then
	playAnimation("idle", 0.1, Humanoid)
end
while v1.Parent ~= nil do
	local _, v30 = wait(0.1)
	stepAnimate(v30)
end