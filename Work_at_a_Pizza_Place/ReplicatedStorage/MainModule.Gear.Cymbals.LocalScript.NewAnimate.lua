-- https://lua.expert/
function waitForChild(p1, p2) --[[ waitForChild | Line: 1 ]]
	local v1 = p1:findFirstChild(p2)
	if v1 then
		return v1
	end
	local v2
	repeat
		v2 = p1.ChildAdded:wait()
	until v2.Name == p2
	return v2
end
local v1 = script.Parent
local v2 = waitForChild(v1, "Torso")
local v3 = waitForChild(v2, "Right Shoulder")
local v4 = waitForChild(v2, "Left Shoulder")
local v5 = waitForChild(v2, "Right Hip")
local v6 = waitForChild(v2, "Left Hip")
waitForChild(v2, "Neck")
local v7 = waitForChild(v1, "Humanoid")
math.randomseed(tick())
local t = {}
local v8 = "Standing"
local v9 = ""
local t2 = {
	wave = false,
	point = false,
	dance = true,
	laugh = false,
	cheer = false
}
local v10 = nil
local v11 = nil
local v12 = nil
local v13 = 1
for k, v in pairs({
	idle = {
		{
			id = "http://www.roblox.com/asset/?id=125750544",
			weight = 9
		},
		{
			id = "http://www.roblox.com/asset/?id=125750618",
			weight = 1
		}
	},
	walk = {
		{
			id = "http://www.roblox.com/asset/?id=125749145",
			weight = 10
		}
	},
	run = {
		{
			id = "run.xml",
			weight = 10
		}
	},
	jump = {
		{
			id = "http://www.roblox.com/asset/?id=125750702",
			weight = 10
		}
	},
	fall = {
		{
			id = "http://www.roblox.com/asset/?id=125750759",
			weight = 10
		}
	},
	climb = {
		{
			id = "http://www.roblox.com/asset/?id=125750800",
			weight = 10
		}
	},
	toolnone = {
		{
			id = "http://www.roblox.com/asset/?id=125750867",
			weight = 10
		}
	},
	toolslash = {
		{
			id = "http://www.roblox.com/asset/?id=129967390",
			weight = 10
		}
	},
	toollunge = {
		{
			id = "http://www.roblox.com/asset/?id=129967478",
			weight = 10
		}
	},
	wave = {
		{
			id = "http://www.roblox.com/asset/?id=128777973",
			weight = 10
		}
	},
	point = {
		{
			id = "http://www.roblox.com/asset/?id=128853357",
			weight = 10
		}
	},
	dance = {
		{
			id = "http://www.roblox.com/asset/?id=130018893",
			weight = 10
		},
		{
			id = "http://www.roblox.com/asset/?id=132546839",
			weight = 10
		},
		{
			id = "http://www.roblox.com/asset/?id=132546884",
			weight = 10
		}
	},
	laugh = {
		{
			id = "http://www.roblox.com/asset/?id=129423131",
			weight = 10
		}
	},
	cheer = {
		{
			id = "http://www.roblox.com/asset/?id=129423030",
			weight = 10
		}
	}
}) do
	t[k] = {}
	t[k].count = 0
	t[k].totalWeight = 0
	local v14 = script:FindFirstChild(k)
	if v14 ~= nil then
		local count = 1
		for k2, v15 in pairs(v14:GetChildren()) do
			t[k][count] = {}
			t[k][count].anim = v15
			local Weight = v15:FindFirstChild("Weight")
			if Weight == nil then
				t[k][count].weight = 1
			else
				t[k][count].weight = Weight.Value
			end
			t[k].count = t[k].count + 1
			t[k].totalWeight = t[k].totalWeight + t[k][count].weight
			count = count + 1
		end
	end
	if t[k].count <= 0 then
		for k2, v15 in pairs(v) do
			t[k][k2] = {}
			t[k][k2].anim = Instance.new("Animation")
			t[k][k2].anim.Name = k
			t[k][k2].anim.AnimationId = v15.id
			t[k][k2].weight = v15.weight
			t[k].count = t[k].count + 1
			t[k].totalWeight = t[k].totalWeight + v15.weight
		end
	end
end
local v15 = "None"
local v16 = 0
local v17 = 0
function stopAllAnimations() --[[ stopAllAnimations | Line: 137 | Upvalues: v9 (ref), t2 (copy), v10 (ref), v11 (ref), v12 (ref) ]]
	local v1 = v9
	if t2[v1] ~= nil and t2[v1] == false then
		v1 = "idle"
	end
	v9 = ""
	if v10 ~= nil then
		v10:disconnect()
	end
	if v11 ~= nil then
		v11:Stop()
		v11:Destroy()
		v11 = nil
	end
	if v12 == nil then
		return v1
	end
	v12:Stop()
	v12:Destroy()
	v12 = nil
	return v1
end
function setAnimationSpeed(p1) --[[ setAnimationSpeed | Line: 163 | Upvalues: v13 (ref), v12 (ref) ]]
	if p1 == v13 then
		return
	end
	v13 = p1
	v12:AdjustSpeed(p1)
end
function keyFrameReachedFunc(p1) --[[ keyFrameReachedFunc | Line: 170 | Upvalues: v13 (ref), v7 (copy) ]]
	if p1 ~= "End" then
		return
	end
	playAnimation(stopAllAnimations(), 0, v7)
	setAnimationSpeed(v13)
end
function playAnimation(p1, p2, p3) --[[ playAnimation | Line: 181 | Upvalues: v9 (ref), v11 (ref), v13 (ref), t (copy), v12 (ref), v10 (ref) ]]
	if p1 == v9 then
		return
	end
	if v11 ~= nil then
		v11:Stop()
		v11:Destroy()
	end
	v13 = 1
	local sum = math.random(1, t[p1].totalWeight)
	local count = 1
	while t[p1][count].weight < sum do
		sum = sum - t[p1][count].weight
		count = count + 1
	end
	v11 = v12
	v12 = p3:LoadAnimation(t[p1][count].anim)
	v12:Play(p2)
	v9 = p1
	if v10 ~= nil then
		v10:disconnect()
	end
	v10 = v12.KeyframeReached:connect(keyFrameReachedFunc)
end
local v18 = ""
local v19 = nil
local v20 = nil
local v21 = nil
function toolKeyFrameReachedFunc(p1) --[[ toolKeyFrameReachedFunc | Line: 224 | Upvalues: v7 (copy) ]]
	if p1 ~= "End" then
		return
	end
	playToolAnimation(stopToolAnimations(), 0, v7)
end
function playToolAnimation(p1, p2, p3) --[[ playToolAnimation | Line: 233 | Upvalues: v18 (ref), v20 (ref), t (copy), v19 (ref), v21 (ref) ]]
	if p1 == v18 then
		return
	end
	if v20 ~= nil then
		v20:Stop()
		v20:Destroy()
		p2 = 0
	end
	local sum = math.random(1, t[p1].totalWeight)
	local count = 1
	while t[p1][count].weight < sum do
		sum = sum - t[p1][count].weight
		count = count + 1
	end
	v19 = v20
	v20 = p3:LoadAnimation(t[p1][count].anim)
	v20:Play(p2)
	v18 = p1
	v21 = v20.KeyframeReached:connect(toolKeyFrameReachedFunc)
end
function stopToolAnimations() --[[ stopToolAnimations | Line: 264 | Upvalues: v18 (ref), v21 (ref), v20 (ref) ]]
	local v1 = v18
	if v21 ~= nil then
		v21:disconnect()
	end
	v18 = ""
	if v20 == nil then
		return v1
	end
	v20:Stop()
	v20:Destroy()
	v20 = nil
	return v1
end
function onRunning(p1) --[[ onRunning | Line: 286 | Upvalues: v7 (copy), v8 (ref) ]]
	if p1 > 0 then
		playAnimation("walk", 0.1, v7)
		v8 = "Running"
	else
		playAnimation("idle", 0.1, v7)
		v8 = "Standing"
	end
end
function onDied() --[[ onDied | Line: 296 | Upvalues: v8 (ref) ]]
	v8 = "Dead"
end
function onJumping() --[[ onJumping | Line: 300 | Upvalues: v7 (copy), v17 (ref), v8 (ref) ]]
	playAnimation("jump", 0.1, v7)
	v17 = 0.175
	v8 = "Jumping"
end
function onClimbing(p1) --[[ onClimbing | Line: 306 | Upvalues: v7 (copy), v8 (ref) ]]
	playAnimation("climb", 0.1, v7)
	setAnimationSpeed(p1 / 12)
	v8 = "Climbing"
end
function onGettingUp() --[[ onGettingUp | Line: 312 | Upvalues: v8 (ref) ]]
	v8 = "GettingUp"
end
function onFreeFall() --[[ onFreeFall | Line: 316 | Upvalues: v17 (ref), v7 (copy), v8 (ref) ]]
	if v17 <= 0 then
		playAnimation("fall", 0.2, v7)
	end
	v8 = "FreeFall"
end
function onFallingDown() --[[ onFallingDown | Line: 323 | Upvalues: v8 (ref) ]]
	v8 = "FallingDown"
end
function onSeated() --[[ onSeated | Line: 327 | Upvalues: v8 (ref) ]]
	v8 = "Seated"
end
function onPlatformStanding() --[[ onPlatformStanding | Line: 331 | Upvalues: v8 (ref) ]]
	v8 = "PlatformStanding"
end
function onSwimming(p1) --[[ onSwimming | Line: 335 | Upvalues: v8 (ref) ]]
	v8 = if p1 > 0 then "Running" else "Standing"
end
function getTool() --[[ getTool | Line: 343 | Upvalues: v1 (copy) ]]
	for i, v in ipairs(v1:GetChildren()) do
		if v.className == "Tool" then
			return v
		end
	end
	return nil
end
function getToolAnim(p1) --[[ getToolAnim | Line: 350 ]]
	for i, v in ipairs(p1:GetChildren()) do
		if v.Name == "toolanim" and v.className == "StringValue" then
			return v
		end
	end
	return nil
end
function animateTool() --[[ animateTool | Line: 359 | Upvalues: v15 (ref), v7 (copy) ]]
	if v15 == "None" then
		return
	end
	if v15 == "Slash" then
		playToolAnimation("toolslash", 0, v7)
		return
	end
	if v15 == "Lunge" then
		playToolAnimation("toollunge", 0, v7)
	end
end
function moveSit() --[[ moveSit | Line: 377 | Upvalues: v3 (copy), v4 (copy), v5 (copy), v6 (copy) ]]
	v3.MaxVelocity = 0.15
	v4.MaxVelocity = 0.15
	v3:SetDesiredAngle(1.57)
	v4:SetDesiredAngle(-1.57)
	v5:SetDesiredAngle(1.57)
	v6:SetDesiredAngle(-1.57)
end
local v22 = 0
function move(p1) --[[ move | Line: 388 | Upvalues: v22 (ref), v17 (ref), v8 (ref), v7 (copy), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v15 (ref), v16 (ref) ]]
	local v1 = 1
	local v2 = 1
	local v32 = p1 - v22
	v22 = p1
	local v42 = false
	if v17 > 0 then
		v17 = v17 - v32
	end
	if v8 == "FreeFall" and v17 <= 0 then
		playAnimation("fall", 0.2, v7)
	else
		if v8 == "Seated" then
			stopAllAnimations()
			moveSit()
			return
		end
		if v8 == "Running" then
			playAnimation("walk", 0.1, v7)
		elseif v8 == "Dead" or (v8 == "GettingUp" or (v8 == "FallingDown" or (v8 == "Seated" or v8 == "PlatformStanding"))) then
			v42 = true
			v2 = 1
			v1 = 0.1
		end
	end
	if v42 then
		desiredAngle = v1 * math.sin(p1 * v2)
		v3:SetDesiredAngle(desiredAngle + 0)
		v4:SetDesiredAngle(desiredAngle - 0)
		v5:SetDesiredAngle(-desiredAngle)
		v6:SetDesiredAngle(-desiredAngle)
	end
	local v52 = getTool()
	if not v52 then
		stopToolAnimations()
		v15 = "None"
		v16 = 0
		return
	end
	animStringValueObject = getToolAnim(v52)
	if animStringValueObject then
		v15 = animStringValueObject.Value
		animStringValueObject.Parent = nil
		v16 = p1 + 0.3
	end
	if v16 < p1 then
		v16 = 0
		v15 = "None"
	end
	animateTool()
end
v7.Died:connect(onDied)
v7.Running:connect(onRunning)
v7.Jumping:connect(onJumping)
v7.Climbing:connect(onClimbing)
v7.GettingUp:connect(onGettingUp)
v7.FreeFalling:connect(onFreeFall)
v7.FallingDown:connect(onFallingDown)
v7.Seated:connect(onSeated)
v7.PlatformStanding:connect(onPlatformStanding)
v7.Swimming:connect(onSwimming)
Game.Players.LocalPlayer.Chatted:connect(function(p1) --[[ Line: 464 | Upvalues: v8 (ref), t2 (copy), v7 (copy) ]]
	local v1 = ""
	if string.sub(p1, 1, 3) == "/e " then
		v1 = string.sub(p1, 4)
	elseif string.sub(p1, 1, 7) == "/emote " then
		v1 = string.sub(p1, 8)
	end
	if v8 ~= "Standing" or t2[v1] == nil then
		return
	end
	playAnimation(v1, 0.1, v7)
end)
game:service("RunService")
playAnimation("idle", 0.1, v7)
while v1.Parent ~= nil do
	local _2, v23 = wait(0.1)
	move(v23)
end