-- https://lua.expert/
local v1 = require(game.ReplicatedStorage:WaitForChild("Sonar"))("Maid")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local t = {}
function t.new(p1) --[[ new | Line: 9 | Upvalues: t (copy), v1 (copy) ]]
	local v12 = setmetatable({}, {
		__index = t
	})
	v12.maid = v1.new()
	v12.frame = p1
	v12.rightIcon = p1.RightHalf.Icon
	v12.leftIcon = p1.LeftHalf.Icon
	v12.rightGradient = v12.rightIcon.UIGradient
	v12.leftGradient = v12.leftIcon.UIGradient
	v12.ogSize = p1.Size
	v12.ogColor = v12.rightIcon.ImageColor3
	p1.Visible = false
	return v12
end
function t.setPercent(p1, p2) --[[ setPercent | Line: 24 ]]
	local v1 = math.clamp(p2, 0, 1) * 360 - 180
	p1.rightGradient.Rotation = math.min(v1, 0)
	p1.leftGradient.Rotation = math.max(0, v1)
	if v1 >= 0 then
		p1.rightGradient.Offset = Vector2.new(-1, 0)
	else
		p1.rightGradient.Offset = Vector2.new()
	end
	if v1 <= 0 then
		p1.leftGradient.Offset = Vector2.new(1, 0)
	else
		p1.leftGradient.Offset = Vector2.new()
	end
end
function t.startTimer(p1, p2) --[[ startTimer | Line: 44 | Upvalues: RunService (copy) ]]
	local v1 = time()
	p1:setPercent(0)
	p1.frame.Visible = true
	p1.maid.timer = RunService.RenderStepped:Connect(function(p12) --[[ Line: 49 | Upvalues: v1 (copy), p1 (copy), p2 (copy) ]]
		local v12 = time() - v1
		p1:setPercent(v12 / p2)
		if not (p2 <= v12) then
			return
		end
		p1.maid.timer = nil
		p1.frame.Visible = false
	end)
end
function t.earlyFlash(p1) --[[ earlyFlash | Line: 60 | Upvalues: TweenService (copy) ]]
	p1.frame.Size = UDim2.new(p1.ogSize.X.Scale * 1.5, p1.ogSize.X.Offset * 1.5, p1.ogSize.Y.Scale * 1.5, p1.ogSize.Y.Offset * 1.5)
	p1.rightIcon.ImageColor3 = Color3.new(255/255, 0/255, 0/255)
	p1.leftIcon.ImageColor3 = Color3.new(255/255, 0/255, 0/255)
	local v1 = TweenInfo.new(0.3, Enum.EasingStyle.Sine)
	TweenService:Create(p1.rightIcon, v1, {
		ImageColor3 = p1.ogColor
	}):Play()
	TweenService:Create(p1.leftIcon, v1, {
		ImageColor3 = p1.ogColor
	}):Play()
	TweenService:Create(p1.frame, v1, {
		Size = p1.ogSize
	}):Play()
end
function t.Destroy(p1) --[[ Destroy | Line: 76 ]]
	p1.maid:Destroy()
end
return t