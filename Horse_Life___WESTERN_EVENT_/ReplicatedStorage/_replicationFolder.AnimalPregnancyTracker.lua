-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("Binder")
local v4 = Sonar("TimeUtils")
local v5 = Sonar("AnimalDataService")
local v6 = Sonar("Signal")
local v7 = Sonar("WorldspaceGuiUtils")
local v8 = Sonar("Constants")
local t2 = {
	TextLabel = {
		TextTransparency = 1,
		TextStrokeTransparency = 1
	},
	ImageLabel = {
		BackgroundTransparency = 1,
		ImageTransparency = 1
	},
	ImageButton = {
		BackgroundTransparency = 1,
		ImageTransparency = 1
	},
	UIStroke = {
		Transparency = 1
	}
}
local v9 = Sonar("PlayerWrapper").GetClient()
local function IsHoldingFood() --[[ IsHoldingFood | Line: 42 | Upvalues: v9 (copy) ]]
	local EquippedTool = v9.EquippedTool
	if not EquippedTool then
		return false
	end
	return EquippedTool.ToolData.ItemType == "Food"
end
function t.new(p1) --[[ new | Line: 48 | Upvalues: t (copy), v1 (copy), Players (copy), v9 (copy), v2 (copy), v6 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v1.new()
	v22.CurrentMaid = v1.new()
	v22.Maid:GiveTask(v22.CurrentMaid)
	v22.Model = p1
	v22.Player = Players:FindFirstChild(p1.Parent.Parent.Name)
	v22.IsLocal = v22.Player == v9.Player
	v22.Wrapper = v2.getWrapperFromPlayer(v22.Player)
	if not v22.Wrapper then
		return v22
	end
	v22.SlotValue = v22.Wrapper:GetItemValue(v22.Model.Name, "Animals")
	if v22.SlotValue then
		v22.DisplayChangedSignal = v6.new()
		v22.Maid:GiveTask(v22.DisplayChangedSignal)
		v22.Maid:GiveTask(v22.SlotValue:WaitForChild("Child"):GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 71 | Upvalues: v22 (copy) ]]
			v22:CreateOrDestroyGui()
		end))
		v22:CreateOrDestroyGui()
		v22.Maid:GiveTask(v9.CurrentAnimalChangedSignal:Connect(function() --[[ Line: 76 | Upvalues: v22 (copy) ]]
			v22:SetEnabled()
		end))
		v22.Maid:GiveTask(v9.EquippedToolChangedSignal:Connect(function() --[[ Line: 80 | Upvalues: v22 (copy) ]]
			v22:SetEnabled()
		end))
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 87 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.CreateOrDestroyGui(p1) --[[ CreateOrDestroyGui | Line: 92 | Upvalues: ReplicatedStorage (copy), v7 (copy), v9 (copy), v5 (copy), v4 (copy) ]]
	p1.CurrentMaid:DoCleaning()
	if not p1:HasChild() then
		p1.AnimateTick = nil
		p1:SetEnabled()
		return
	end
	if not p1.DisplayGui then
		p1.DisplayGui = ReplicatedStorage.Storage.Assets.AnimalPregnancyGui:Clone()
		p1.DisplayGui.Adornee = p1.Model:WaitForChild("RootPart"):WaitForChild("MiddleBody"):WaitForChild("UpperBody")
		p1.DisplayGui.Parent = p1.Model
		p1.Maid:GiveTask(v7.AddWorldspaceGui(p1.DisplayGui, {
			Check = function() --[[ Check | Line: 101 | Upvalues: p1 (copy), v9 (ref) ]]
				if not p1:HasChild() then
					return false
				end
				if p1.IsLocal then
					local v1 = v9:GetCurrentAnimal()
					return (not v1 or p1.SlotValue ~= v1.SlotValue) and true or false
				end
				local EquippedTool = v9.EquippedTool
				if not EquippedTool then
					return false
				end
				return EquippedTool.ToolData.ItemType == "Food"
			end,
			Changed = p1.DisplayChangedSignal
		}))
		p1.AnimateUIScale = p1.DisplayGui.HeartLabel.UIScale
	end
	p1.LastBreed = p1.SlotValue.LastBreed.Value
	p1.Maid:GiveTask(p1.SlotValue.LastBreed:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 123 | Upvalues: p1 (copy), v5 (ref) ]]
		local v1 = p1.LastBreed - p1.SlotValue.LastBreed.Value
		p1.LastBreed = p1.SlotValue.LastBreed.Value
		if not (v1 > 0 and (p1.SlotValue.LastBreed.Value > 0 and (p1.DisplayGui.Enabled and v5.GetBirthTimeLeft(p1.Wrapper, p1.SlotValue) > 0))) then
			return
		end
		p1:AnimateGestationReduction(v1)
	end))
	for v1, v2 in { v4.OnTimeChanged, p1.SlotValue.LastBreed:GetPropertyChangedSignal("Value") } do
		p1.CurrentMaid:GiveTask(v2:Connect(function() --[[ Line: 132 | Upvalues: p1 (copy) ]]
			p1:SetProgress()
		end))
	end
	p1:SetProgress()
	p1:SetEnabled()
end
function t.SetEnabled(p1) --[[ SetEnabled | Line: 144 ]]
	if p1.DisplayGui then
		p1.DisplayChangedSignal:Fire()
	end
end
function t.HasChild(p1) --[[ HasChild | Line: 150 ]]
	return #p1.SlotValue.Child.Value > 0
end
function t.SetProgress(p1) --[[ SetProgress | Line: 154 | Upvalues: v5 (copy) ]]
	local v1 = v5.GetBreedCooldown(p1.Wrapper, p1.SlotValue)
	local v2 = v5.GetBirthTimeLeft(p1.Wrapper, p1.SlotValue)
	p1.DisplayGui.HeartLabel.UIGradient.Offset = Vector2.new(0, math.clamp(v2 / v1, 0, 1) - 0.5)
	if v2 <= 0 then
		p1:AnimateHeartbeat()
	else
		p1.AnimateTick = nil
	end
end
function t.AnimateHeartbeat(p1) --[[ AnimateHeartbeat | Line: 168 | Upvalues: TweenService (copy) ]]
	if not p1.AnimateTick then
		local v1 = tick()
		p1.AnimateTick = v1
		task.spawn(function() --[[ Line: 172 | Upvalues: p1 (copy), v1 (copy), TweenService (ref) ]]
			while p1.AnimateTick == v1 do
				for i = 1, 2 do
					local v12 = TweenService:Create(p1.AnimateUIScale, TweenInfo.new(0.125, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
						Scale = 1.25
					})
					v12:Play()
					v12.Completed:Wait()
					local v2 = TweenService:Create(p1.AnimateUIScale, TweenInfo.new(0.125, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
						Scale = 1
					})
					v2:Play()
					v2.Completed:Wait()
				end
				task.wait(0.75)
			end
		end)
	end
end
function t.AnimateGestationReduction(p1, p2) --[[ AnimateGestationReduction | Line: 187 | Upvalues: v4 (copy), t2 (copy), TweenService (copy) ]]
	if not p1.Model:FindFirstChild("HumanoidRootPart") then
		return
	end
	local v1 = p1.DisplayGui.TimeOff:Clone()
	v1.Name = tick()
	v1.TextLabel.Text = "-" .. v4.FormatString(p2)
	local t = {}
	for v2, v3 in v1:GetDescendants() do
		local v42 = t2[v3.ClassName]
		if v42 then
			t[v3] = {}
			for v5, v6 in v42 do
				t[v3][v5] = v3[v5]
				v3[v5] = v6
			end
		end
	end
	v1.UIScale.Scale = 0
	v1.Visible = true
	v1.Position = UDim2.new(0.5, 0, 0.85, 0)
	v1.Parent = p1.DisplayGui
	TweenService:Create(v1, TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out), {
		Position = UDim2.new(0.5, 0, 0.65, 0)
	}):Play()
	TweenService:Create(v1.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		Scale = 1
	}):Play()
	for v7, v8 in t do
		TweenService:Create(v7, TweenInfo.new(0.5), v8):Play()
	end
	task.wait(0.75)
	local v9 = nil
	for v10, v11 in t do
		if t2[v10.ClassName] then
			local v12 = TweenService:Create(v10, TweenInfo.new(0.2), t2[v10.ClassName])
			v12:Play()
			v9 = v12
		end
	end
	v9.Completed:Wait()
	v1:Destroy()
end
function t.Init(p1) --[[ Init | Line: 230 | Upvalues: v3 (copy), v8 (copy), t (copy) ]]
	v3.new(v8.AnimalTag, t):Init()
end
t:Init()
return t