-- https://lua.expert/
local t = {}
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("InputTypeDetector")
local v3 = Sonar("Button")
local v4 = Sonar("spr")
local LocalPlayer = game.Players.LocalPlayer
function t.new(p1, p2, p3, p4, p5, p6) --[[ new | Line: 15 | Upvalues: t (copy) ]]
	local v1 = setmetatable({}, {
		__index = t
	})
	v1:_init(p1, p2, p3, p4, p5, p6)
	return v1
end
function t._init(p1, p2, p3, p4, p5, p6, p7) --[[ _init | Line: 21 | Upvalues: v1 (copy), LocalPlayer (copy), UserInputService (copy), v2 (copy), v3 (copy), RunService (copy) ]]
	p1.Maid = v1.new()
	p1.gui = p2
	p1.needleStartAngle = 90
	p1.smallSegmentChance = 0.5
	p1.reverseNeedleChance = 0.2
	p1.needleSpeedOnLastHeart = 1.5
	p1.startNeedleSpeed = 180
	p1:setNeedleSpeed()
	p1.needleT0 = time()
	p1:randomizeGoalAngle()
	p1.OnSuccess = p3
	p1.OnFail = p4
	p1.CanTame = p5
	p1.OnHit = p7
	p1.RequiredWins = p6 or 1
	p1.CurrentWins = 0
	if p1.gui.InnerFrame.ContainerFrame:FindFirstChild("ProgressFrame") then
		p1.ProgressLabel = p1.gui.InnerFrame.ContainerFrame.ProgressFrame.ProgressLabel
		p1:updateProgress()
	end
	p2.Enabled = true
	p2.Parent = LocalPlayer.PlayerGui.WorkspaceGui
	p1.Maid:GiveTask(p2)
	p1.Maid:GiveTask(UserInputService.InputBegan:Connect(function(p12, p2) --[[ Line: 53 | Upvalues: p1 (copy) ]]
		if p12.UserInputType ~= Enum.UserInputType.MouseButton1 and p12.KeyCode ~= Enum.KeyCode.ButtonR2 then
			return
		end
		if not p2 then
			p1:Input()
		end
	end))
	p1.Maid:GiveTask(UserInputService.TouchTapInWorld:Connect(function(p12, p2) --[[ Line: 65 | Upvalues: p1 (copy) ]]
		if not p2 then
			p1:Input()
		end
	end))
	p1.Maid:GiveTask(v2.InputTypeChanged:Connect(function() --[[ Line: 73 | Upvalues: p1 (copy) ]]
		p1:updateInputType()
	end))
	p1:updateInputType()
	p1.Maid:GiveTask(v3.new(p1.gui.InnerFrame.ContainerFrame, {
		Active = true,
		Click = function() --[[ Click | Line: 80 | Upvalues: p1 (copy) ]]
			p1:Input()
		end
	}))
	p1.Maid:GiveTask(RunService.RenderStepped:Connect(function(p12) --[[ Line: 85 | Upvalues: p1 (copy), p2 (copy) ]]
		p2.InnerFrame.ContainerFrame.CircleFrame.LineFrame.Rotation = p1:getNeedleAngle()
	end))
	p1.Maid:GiveTask(LocalPlayer.CharacterRemoving:Connect(function() --[[ Line: 90 | Upvalues: p1 (copy) ]]
		p1:Destroy()
	end))
end
function t.updateProgress(p1) --[[ updateProgress | Line: 95 ]]
	if not p1.ProgressLabel then
		return
	end
	p1.ProgressLabel.Text = string.format("%d/%d", p1.CurrentWins, p1.RequiredWins)
end
function t.Input(p1) --[[ Input | Line: 101 ]]
	if not p1.CanInput then
		return
	end
	if p1.ShowingResult then
		return
	end
	if not p1.CanTame() then
		return
	end
	if not p1:checkSuccess() then
		p1.OnFail(p1)
		p1:showResult(false)
		p1:newRound()
		return
	end
	p1.CurrentWins = p1.CurrentWins + 1
	p1:updateProgress()
	p1.OnHit(p1)
	if p1.CurrentWins >= p1.RequiredWins then
		p1.OnSuccess(p1)
		p1:Destroy()
	else
		p1:showResult(true)
		p1:newRound()
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 129 ]]
	p1.Maid:Destroy()
end
function t.getNeedleAngle(p1) --[[ getNeedleAngle | Line: 133 ]]
	return (p1.needleStartAngle + p1.needleSpeed * (if p1.reversed then -1 else 1) * (time() - p1.needleT0)) % 360
end
function t.checkSuccess(p1) --[[ checkSuccess | Line: 141 ]]
	local v3 = math.abs(p1.goalAngle - p1:getNeedleAngle())
	if (if p1.ActiveSegmentSize == "Small" then 60 else 140) < v3 then
		v3 = math.abs(v3 - 360)
	end
	return v3 <= (if p1.ActiveSegmentSize == "Small" then 30 else 70) + 10
end
function t.setNeedleSpeed(p1, p2) --[[ setNeedleSpeed | Line: 154 ]]
	if not p2 and math.random() <= p1.reverseNeedleChance then
		p1.reversed = not p1.reversed
	end
	p1.needleSpeed = p1.startNeedleSpeed
end
function t.newRound(p1) --[[ newRound | Line: 164 ]]
	if p1.gui:FindFirstChild("InnerFrame") then
		p1.CanInput = false
		p1.needleStartAngle = p1:getNeedleAngle()
		p1:setNeedleSpeed()
		p1.needleT0 = time()
		p1:randomizeGoalAngle()
	end
end
function t.randomizeGoalAngle(p1) --[[ randomizeGoalAngle | Line: 176 | Upvalues: v4 (copy) ]]
	p1.goalAngle = (p1.needleStartAngle + 180 + math.random(-90, 90)) % 360
	local v1 = if math.random() <= p1.smallSegmentChance then "Small" else "Large"
	local v2 = p1.gui.InnerFrame.ContainerFrame.CircleFrame.Segments[v1]
	for k, v in pairs(p1.gui.InnerFrame.ContainerFrame.CircleFrame.Segments:GetChildren()) do
		if p1.ActiveSegmentFrame then
			v.Rotation = p1.ActiveSegmentFrame.Rotation
		else
			v.ImageTransparency = 1
		end
		local t = {}
		t.ImageTransparency = if v2 == v then 0 else 1
		v4.target(v, 0.5, 2, t)
	end
	p1.ActiveSegmentSize = v1
	p1.ActiveSegmentFrame = v2
	game.ReplicatedStorage.Storage.SFX.Poof:Play()
	v4.target(v2, 0.5, 2, {
		Rotation = p1.goalAngle
	})
	task.delay(0.5, function() --[[ Line: 198 | Upvalues: p1 (copy) ]]
		p1.CanInput = true
	end)
end
function t.showResult(p1, p2) --[[ showResult | Line: 203 ]]
	p1.ShowingResult = true
	if not p1.gui:FindFirstChild("InnerFrame") then
		return
	end
	p1.gui.InnerFrame.ContainerFrame.CircleFrame.LassoIcon.Visible = false
	local v2 = p1.gui.InnerFrame.ResultFrame:FindFirstChild((if p2 then "Correct" else "Incorrect") .. "Label")
	v2.UIScale.Scale = 0
	v2.Visible = true
	local v3 = game.TweenService:Create(v2.UIScale, TweenInfo.new(0.375, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
		Scale = 1
	})
	v3:Play()
	v3.Completed:Wait()
	task.wait(0.5)
	if p1.gui:FindFirstChild("InnerFrame") then
		game.TweenService:Create(v2.UIScale, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
			Scale = 0
		}):Play()
		task.delay(0.075, function() --[[ Line: 225 | Upvalues: p1 (copy) ]]
			p1.ShowingResult = false
			p1.gui.InnerFrame.ContainerFrame.CircleFrame.LassoIcon.Visible = true
		end)
	end
end
function t.updateInputType(p1) --[[ updateInputType | Line: 231 | Upvalues: v2 (copy) ]]
	local v1 = v2.GetInputType()
	for v22, v3 in p1.gui.InnerFrame.ContainerFrame.CircleFrame.ControlLabel:GetChildren() do
		v3.Visible = tonumber(v3.Name) == v1
	end
end
return t