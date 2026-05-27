-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("FormatNumber")
local v3 = Sonar("MathUtils")
local t2 = {
	Up = function(p1, p2) --[[ Up | Line: 15 ]]
		local v1 = math.clamp(p1 / p2, 0, 1)
		return v1, UDim2.new(0.5, 0, 1 - v1 + 1, 0), UDim2.new(0.5, 0, -(1 - v1), 0)
	end,
	LeftToRight = function(p1, p2, p3) --[[ LeftToRight | Line: 20 | Upvalues: v3 (copy) ]]
		local v1 = math.clamp(p1 / p2, 0, 1)
		if v3.IsNAN(v1) then
			v1 = 0
		end
		if p3 then
			return v1, UDim2.new(-(1 - v1), 0, 0.5, 0), UDim2.new(1 - v1, 0, 0.5, 0)
		else
			return v1, UDim2.new(v1, 0, 1, 0), UDim2.new(v1, 0, 1, 0)
		end
	end,
	Down = function(p1, p2) --[[ Down | Line: 31 ]]
		local v1 = math.clamp(p1 / p2, 0, 1)
		return v1, UDim2.new(0.5, 0, 1 - v1 + 1, 0), UDim2.new(0.5, 0, v1, 0)
	end
}
function t.new(p1) --[[ new | Line: 39 | Upvalues: t (copy), v1 (copy) ]]
	local v2 = setmetatable(p1, t)
	v2.Maid = v1.new()
	v2.Direction = v2.Direction or "LeftToRight"
	v2.AmountLabel = v2.AmountLabel or v2.Frame:FindFirstChild("AmountLabel")
	v2.ClipFrame = v2.Clipped and v2.Frame:FindFirstChild("ClipFrame")
	local FillLabel = v2.FillLabel
	if not FillLabel then
		FillLabel = v2.Clipped and (v2.ClipFrame:FindFirstChild("MoverLabel") or v2.ClipFrame:FindFirstChild("Fill")) or v2.Frame
	end
	v2.BarLabel = FillLabel
	v2.FlashLabel = v2.Frame:FindFirstChild("FlashLabel")
	v2.TweenTime = v2.TweenTime or 0.45
	v2.FlashTweenTime = v2.FlashTweenTime or 0.2
	if v2.TweenAmount then
		v2.NumberValue = Instance.new("IntValue")
		v2.NumberValue.Value = -1
		v2.Maid:GiveTask(v2.NumberValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 58 | Upvalues: v2 (copy) ]]
			v2:SetAmountLabel(v2.NumberValue.Value)
		end))
	end
	if v2.Rotate then
		v2.Rotate.Frame = v2.Rotate.Frame or v2.Frame
	end
	for k, v in pairs(v2.Changed) do
		v2.Maid:GiveTask(v:Connect(function() --[[ Line: 68 | Upvalues: v2 (copy) ]]
			if not v2.ParentFrame or v2.ParentFrame.Visible then
				v2:SetBar(true)
			end
		end))
	end
	if v2.ParentFrame then
		v2.Maid:GiveTask(v2.ParentFrame:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 75 | Upvalues: v2 (copy) ]]
			if not v2.ParentFrame or v2.ParentFrame.Visible then
				v2:SetBar(true)
			end
		end))
	end
	v2:SetBar()
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 86 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t._canPlayEffect(p1, p2) --[[ _canPlayEffect | Line: 91 ]]
	if p1.PlayEffectsOnIncrease then
		return p2
	else
		return not p2
	end
end
function t.SetBar(p1, p2) --[[ SetBar | Line: 99 | Upvalues: t2 (copy), TweenService (copy) ]]
	local v1 = p1.Get()
	local v2 = p1.GetMax()
	local v3 = p1.Stat and (if p1.Stat < v1 then true else false)
	p1.Stat = v1
	p1.Max = v2
	local _, v4, v5 = t2[p1.Direction](p1.Stat, p1.Max, p1.Clipped)
	if p2 then
		if p1.ClipFrame then
			local v7 = TweenInfo.new(p1.TweenTime)
			local t = {}
			t[if p1.Clipped then "Position" else "Size"] = v4
			TweenService:Create(p1.ClipFrame, v7, t):Play()
		end
		local v10 = TweenInfo.new(p1.TweenTime)
		local t = {}
		t[if p1.Clipped then "Position" else "Size"] = v5
		TweenService:Create(p1.BarLabel, v10, t):Play()
		if p1:_canPlayEffect(v3) then
			p1:TweenFlash()
			p1:TweenRotate()
		end
	else
		if p1.ClipFrame then
			local v13 = TweenInfo.new(0)
			local t = {}
			t[if p1.Clipped then "Position" else "Size"] = v4
			TweenService:Create(p1.ClipFrame, v13, t):Play()
		end
		local v16 = TweenInfo.new(0)
		local t = {}
		t[if p1.Clipped then "Position" else "Size"] = v5
		TweenService:Create(p1.BarLabel, v16, t):Play()
	end
	if p1.TweenAmount then
		if p2 then
			TweenService:Create(p1.NumberValue, TweenInfo.new(p1.TweenTime), {
				Value = p1.Stat
			}):Play()
		else
			p1.NumberValue.Value = p1.Stat
			TweenService:Create(p1.NumberValue, TweenInfo.new(0), {
				Value = p1.Stat
			}):Play()
		end
	else
		p1:SetAmountLabel(p1.Stat, p1.Max)
	end
	if not p1.OnChanged then
		return
	end
	p1.OnChanged(p1.Stat, p1.Max, p1)
end
function t.SetAmountLabel(p1, p2) --[[ SetAmountLabel | Line: 142 | Upvalues: v2 (copy) ]]
	if not p1.AmountLabel then
		return
	end
	p1.AmountLabel.Text = p1.GetText and p1.GetText(p2, p1.Max) or v2.suffix(p2) .. "/" .. v2.suffix(p1.Max) .. (p1.Append or "")
end
function t.TweenFlash(p1) --[[ TweenFlash | Line: 147 | Upvalues: TweenService (copy) ]]
	if not (p1.Flash and p1.FlashLabel) then
		return
	end
	local v1 = if p1.FlashLabel:IsA("Frame") then "BackgroundTransparency" else "ImageTransparency"
	local v2 = TweenService:Create(p1.FlashLabel, TweenInfo.new(p1.FlashTweenTime, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
		[v1] = 0
	})
	v2.Completed:Connect(function() --[[ Line: 151 | Upvalues: TweenService (ref), p1 (copy), v1 (copy) ]]
		TweenService:Create(p1.FlashLabel, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
			[v1] = 1
		}):Play()
	end)
	v2:Play()
end
function t.TweenRotate(p1) --[[ TweenRotate | Line: 158 | Upvalues: TweenService (copy) ]]
	if not p1.Rotate then
		return
	end
	task.spawn(function() --[[ Line: 160 | Upvalues: TweenService (ref), p1 (copy) ]]
		local v1 = TweenService:Create(p1.Rotate.Frame, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
			Rotation = p1.Rotate.Angle
		})
		v1:Play()
		v1.Completed:Wait()
		local v2 = TweenService:Create(p1.Rotate.Frame, TweenInfo.new(0.1, Enum.EasingStyle.Linear), {
			Rotation = -p1.Rotate.Angle
		})
		v2:Play()
		v2.Completed:Wait()
		local v3 = TweenService:Create(p1.Rotate.Frame, TweenInfo.new(0.05, Enum.EasingStyle.Linear), {
			Rotation = 0
		})
		v3:Play()
		v3.Completed:Wait()
	end)
end
return t