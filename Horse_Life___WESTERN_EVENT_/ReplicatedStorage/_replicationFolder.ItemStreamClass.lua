-- https://lua.expert/
local t = {}
t.__index = t
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("FormatNumber")
local v3 = Sonar("DisplayUtils")
local v4 = Sonar("ItemDataService")
local v5 = Sonar("ItemDisplayCreator")
local t2 = {
	Max = 0.5,
	Massive = 0.15
}
local t3 = {
	In = {
		TextLabel = {
			TextTransparency = 0,
			TextStrokeTransparency = 0
		},
		ViewportFrame = {
			ImageTransparency = 0
		},
		ImageLabel = {
			ImageTransparency = 0
		},
		UIStroke = {
			Transparency = 0
		},
		Frame = {
			BackgroundTransparency = 0.5
		}
	},
	Out = {
		TextLabel = {
			TextTransparency = 1,
			TextStrokeTransparency = 1
		},
		ViewportFrame = {
			ImageTransparency = 1
		},
		ImageLabel = {
			ImageTransparency = 1,
			BackgroundTransparency = 1
		},
		UIStroke = {
			Transparency = 1
		},
		Frame = {
			BackgroundTransparency = 1
		}
	}
}
local v6 = TweenInfo.new(0.6)
local v7 = TweenInfo.new(0.7)
local v8 = TweenInfo.new(0.5)
local t4 = {}
function t.new(p1) --[[ new | Line: 71 | Upvalues: t (copy), v1 (copy), v4 (copy), t3 (copy), v3 (copy), v5 (copy), v2 (copy), t4 (copy) ]]
	local v22 = setmetatable(p1, t)
	v22.Maid = v1.new()
	v22.ItemId = v22.Item.ItemType .. "_" .. v22.Item.Name
	v22.Rarity = v22.Item.Rarity
	if v22.Item.ItemType == "Equipment" and (v22.DataValue and v22.DataValue.Theme) then
		local v32 = v4.GetByName(v22.DataValue.Theme.Value)
		if v32 then
			v22.Theme = v32
		end
	end
	v22.Frame = v22.Parent.Default:Clone()
	v22.Frame.Name = v22.ItemId
	v22.ContainerFrame = v22.Frame.ContainerFrame
	v22.ContainerFrame.UIScale.Scale = 1
	for k, v in pairs(v22.ContainerFrame:GetDescendants()) do
		if t3.Out[v.ClassName] then
			for k2, v6 in pairs(t3.Out[v.ClassName]) do
				v[k2] = v6
			end
		end
	end
	v22.ContainerFrame.NameLabel.Text = v3.GetDisplayName(v22.Item.Name, v22.Item)
	v22.Maid:GiveTask(v5:Create({
		Viewport = v22.ContainerFrame.Icon,
		Item = v22.Item
	}))
	v22.ContainerFrame.Icon.Theme.Visible = v22.Theme
	if v22.Theme then
		if v22.Theme.Texture then
			v22.ContainerFrame.Icon.Theme.ImageLabel.Image = v22.Theme.Texture
			v22.ContainerFrame.Icon.Theme.ImageLabel.UIGradient.Enabled = false
		else
			v22.ContainerFrame.Icon.Theme.ImageLabel.Image = ""
			v22.ContainerFrame.Icon.Theme.ImageLabel.UIGradient.Color = v22.Theme.ColorSequence
			v22.ContainerFrame.Icon.Theme.ImageLabel.UIGradient.Enabled = true
		end
	end
	v22.ContainerFrame.Background.BackgroundColor3 = v22.Rarity.ItemStream.BackgroundColor
	v22.ContainerFrame.Rarity.Text = v22.Theme and v3.GetDisplayName(v22.Theme.Name, v22.Theme) .. " Theme" or v22.Rarity.Name
	v22.ContainerFrame.Rarity.TextColor3 = v22.Rarity.ItemStream.TextColor
	v22.ContainerFrame.Rarity.Visible = v22.Item.ItemType ~= "Currency"
	v22.AmountValue = Instance.new("IntValue")
	v22.Maid:GiveTask(v22.AmountValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 130 | Upvalues: v22 (copy), v2 (ref) ]]
		v22.ContainerFrame.Amount.Text = "x" .. v2.splice(v22.AmountValue.Value)
	end))
	v22.AmountValue.Value = v22.Amount
	v22.TweenOutValue = Instance.new("BoolValue")
	v22.Maid:GiveTask(v22.TweenOutValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 136 | Upvalues: v22 (copy) ]]
		v22:_tweenOut()
	end))
	v22.Frame.Visible = false
	v22.Frame.Parent = v22.Parent
	v22.Maid:GiveTask(v22.Frame)
	if not v22.DataValue then
		t4[v22.ItemId] = v22
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 151 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t._delayTweenOut(p1, p2) --[[ _delayTweenOut | Line: 156 | Upvalues: t2 (copy) ]]
	local v1 = task.delay
	v1(p2 and t2[p2] or 2, function() --[[ Line: 157 | Upvalues: p1 (copy) ]]
		if not p1._tweenOut then
			return
		end
		if not p1.RecentlyAdjusted then
			p1:_tweenOut()
			return
		end
		while p1.RecentlyAdjusted and p1._tweenOut do
			task.wait(0.05)
		end
		if p1._tweenOut then
			p1:_tweenOut()
		end
	end)
end
function t._waitForTweenOut(p1) --[[ _waitForTweenOut | Line: 175 | Upvalues: RunService (copy) ]]
	p1:_waitForTweenedIn()
	if p1.TweeningOut then
		return
	end
	repeat
		RunService.Heartbeat:Wait()
	until p1.TweeningOut
end
function t._waitForTweenedIn(p1) --[[ _waitForTweenedIn | Line: 185 | Upvalues: RunService (copy) ]]
	if p1.TweenedIn then
		return
	end
	repeat
		RunService.Heartbeat:Wait()
	until p1.TweenedIn
end
function t._tweenIn(p1, p2, p3) --[[ _tweenIn | Line: 193 | Upvalues: TweenService (copy), v6 (copy), t3 (copy) ]]
	if p1.TweeningIn then
		return
	end
	p1.TweeningIn = true
	p1.Frame.Visible = true
	p1.Frame.Size = UDim2.new(p1.Frame.Size.X.Scale, 0, 0.18, 0)
	TweenService:Create(p1.Frame, v6, {
		Size = UDim2.new(p1.Frame.Size.X.Scale, 0, 0.16, 0)
	}):Play()
	if p3 then
		game.SoundService:PlayLocalSound(p1.Item.Rarity.ItemStream.Sound)
		game.SoundService:PlayLocalSound(game.ReplicatedStorage.Storage.SFX.Pop)
	end
	for k, v in pairs(p1.ContainerFrame:GetDescendants()) do
		if t3.In[v.ClassName] or t3.In[v.Name] then
			TweenService:Create(v, v6, t3.In[v.Name] or t3.In[v.ClassName]):Play()
		end
	end
	task.delay(v6.Time, function() --[[ Line: 218 | Upvalues: p1 (copy) ]]
		p1.TweenedIn = true
	end)
end
function t._adjust(p1, p2) --[[ _adjust | Line: 223 | Upvalues: TweenService (copy) ]]
	if p1.Amount then
		p1.Amount = p1.Amount + p2
		game.SoundService:PlayLocalSound(game.ReplicatedStorage.Storage.SFX.Pop)
		TweenService:Create(p1.AmountValue, TweenInfo.new(0.45, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
			Value = p1.Amount
		}):Play()
		local v1 = TweenService:Create(p1.ContainerFrame.UIScale, TweenInfo.new(0.225, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
			Scale = 1.1
		})
		v1.Completed:Connect(function() --[[ Line: 230 | Upvalues: TweenService (ref), p1 (copy) ]]
			TweenService:Create(p1.ContainerFrame.UIScale, TweenInfo.new(0.225, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
				Scale = 1
			}):Play()
		end)
		v1:Play()
		local v2 = os.clock()
		p1.LastAdjustTime = v2
		p1.RecentlyAdjusted = true
		task.delay(2, function() --[[ Line: 237 | Upvalues: p1 (copy), v2 (copy) ]]
			if p1.LastAdjustTime ~= v2 then
				return
			end
			if p1._tweenOut then
				p1.RecentlyAdjusted = nil
			end
		end)
		return true
	end
end
function t._tweenOut(p1) --[[ _tweenOut | Line: 245 | Upvalues: t4 (copy), t3 (copy), TweenService (copy), v7 (copy), v8 (copy) ]]
	if p1.TweeningOut then
		return
	end
	p1.TweeningOut = true
	t4[p1.ItemId] = nil
	if p1.TweenOutCallback then
		p1.TweenOutCallback()
	end
	for k, v in pairs(p1.ContainerFrame:GetDescendants()) do
		if t3.Out[v.ClassName] then
			TweenService:Create(v, v7, t3.Out[v.ClassName]):Play()
		end
	end
	task.delay(v7.Time * 0.9, function() --[[ Line: 263 | Upvalues: p1 (copy), TweenService (ref), v8 (ref) ]]
		p1.ContainerFrame.UIAspectRatioConstraint:Destroy()
		TweenService:Create(p1.Frame, v8, {
			Size = UDim2.new(p1.Frame.Size.X.Scale, 0, 0, 0)
		}):Play()
		task.delay(v8.Time, function() --[[ Line: 267 | Upvalues: p1 (ref) ]]
			p1:Destroy()
		end)
	end)
end
function t.Adjust(p1, p2, p3) --[[ Adjust | Line: 273 | Upvalues: t4 (copy) ]]
	local v1 = t4[p2.ItemType .. "_" .. p2.Name]
	if v1 then
		return v1:_adjust(p3)
	end
end
return t