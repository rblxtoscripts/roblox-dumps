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
local v4 = Sonar("Constants")
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
	},
	Frame = {
		BackgroundTransparency = 1
	}
}
local v5 = Sonar("PlayerWrapper").GetClient()
function t.new(p1) --[[ new | Line: 42 | Upvalues: t (copy), v1 (copy), Players (copy), v5 (copy), v2 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v1.new()
	v22.Model = p1
	v22.Player = Players:FindFirstChild(p1.Parent.Parent.Name)
	if v22.Player ~= v5.Player then
		return v22
	end
	v22.Wrapper = v2.getWrapperFromPlayer(v22.Player)
	v22.SlotValue = v22.Wrapper:GetItemValue(v22.Model.Name, "Animals")
	for k, v in pairs(v22.SlotValue:WaitForChild("Upgrades"):GetChildren()) do
		local v3 = v:WaitForChild("Experience").Value
		v22.Maid:GiveTask(v.Experience:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 57 | Upvalues: v (copy), v3 (ref), v22 (copy) ]]
			local v1 = v.Experience.Value - v3
			v3 = v.Experience.Value
			if not (v1 > 0) then
				return
			end
			v22:AnimateExperience(v.Name, v1)
		end))
		local v4 = v.Value
		v22.Maid:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 66 | Upvalues: v (copy), v4 (ref), v22 (copy) ]]
			local v1 = v4 < v.Value
			v4 = v.Value
			if not v1 then
				return
			end
			v22:AnimateLevel(v.Name, v.Value)
		end))
	end
	v22.Maid:GiveTask(v5.CurrentAnimalChangedSignal:Connect(function() --[[ Line: 75 | Upvalues: v22 (copy) ]]
		v22:SetOffset()
	end))
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 82 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.SetOffset(p1) --[[ SetOffset | Line: 87 | Upvalues: v5 (copy) ]]
	if not p1.ExperienceGui then
		return
	end
	local v1 = v5:GetCurrentAnimal()
	p1.ExperienceGui.ExtentsOffset = if v1 and v1.SlotValue == p1.SlotValue then Vector3.new(0, 0, 0) else Vector3.new(0, 1.5, 0)
	p1.ExperienceGui.ExtentsOffsetWorldSpace = if v1 and v1.SlotValue == p1.SlotValue then Vector3.new(5, 0, 0) else Vector3.new(0, 0, 0)
end
function t.AnimateLevel(p1, p2, p3) --[[ AnimateLevel | Line: 96 | Upvalues: v5 (copy), ReplicatedStorage (copy), t2 (copy), TweenService (copy) ]]
	if v5.WildCutsceneMode then
		return
	end
	if v5:IsInAction("CameraMode") then
		return
	end
	local HumanoidRootPart = p1.Model:FindFirstChild("HumanoidRootPart")
	if not HumanoidRootPart then
		return
	end
	if not p1.LevelGui then
		p1.LevelGui = ReplicatedStorage.Storage.Assets.AnimalLevelGui:Clone()
		p1.LevelGui.Adornee = HumanoidRootPart
		p1.LevelGui.Enabled = true
		p1.LevelGui.Parent = p1.Model
	end
	local v1 = p1.LevelGui.ContainerFrame[p2]:Clone()
	local v2 = ReplicatedStorage.Storage.Assets.Particles[p2 .. "LevelUp"]
	local v3 = p1[p2 .. "LevelUpEffects"]
	if not v3 then
		v3 = {}
		for k, v in pairs(v2:GetChildren()) do
			local v4 = v:Clone()
			v4.Name = p2 .. "LevelUpUpEffect"
			v4.Parent = HumanoidRootPart:WaitForChild("GeneralAttachmentPoint")
			v3[v4] = true
		end
		local v52 = ReplicatedStorage.Storage.SFX.LevelUp2:Clone()
		v52.Parent = HumanoidRootPart:WaitForChild("GeneralAttachmentPoint")
		p1.LevelSound = v52
		p1[p2 .. "LevelUpEffects"] = v3
	end
	v1.Name = tick()
	v1.LevelLabel.Text = p3
	local tbl = {}
	for k, v in pairs(v1:GetDescendants()) do
		local v6 = t2[v.ClassName]
		if v6 then
			tbl[v] = {}
			for k2, v4 in pairs(v6) do
				tbl[v][k2] = v[k2]
				v[k2] = v4
			end
		end
	end
	v1.UIScale.Scale = 0
	v1.Visible = true
	v1.Position = UDim2.new(0.5, 0, 1, 0)
	v1.Parent = p1.LevelGui.ContainerFrame
	TweenService:Create(v1, TweenInfo.new(2, Enum.EasingStyle.Circular, Enum.EasingDirection.Out), {
		Position = UDim2.new(0.5, 0, 0.45, 0)
	}):Play()
	TweenService:Create(v1.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
		Scale = 1
	}):Play()
	for k, v in pairs(tbl) do
		TweenService:Create(k, TweenInfo.new(0.5), v):Play()
	end
	task.delay(0.1, function() --[[ Line: 157 | Upvalues: p1 (copy), v3 (ref) ]]
		p1.LevelSound:Play()
		for k, v in pairs(v3) do
			k:Emit(k:GetAttribute("EmitCount"))
		end
	end)
	task.wait(1.75)
	local v7 = nil
	for k, v in pairs(tbl) do
		if t2[k.ClassName] then
			local v8 = TweenService:Create(k, TweenInfo.new(0.2), t2[k.ClassName])
			v8:Play()
			v7 = v8
		end
	end
	v7.Completed:Wait()
	v1:Destroy()
end
function t.AnimateExperience(p1, p2, p3) --[[ AnimateExperience | Line: 176 | Upvalues: v5 (copy), ReplicatedStorage (copy), t2 (copy), TweenService (copy) ]]
	if v5.WildCutsceneMode then
		return
	end
	if v5:IsInAction("CameraMode") then
		return
	end
	local HumanoidRootPart = p1.Model:FindFirstChild("HumanoidRootPart")
	if not HumanoidRootPart then
		return
	end
	if not p1.ExperienceGui then
		p1.ExperienceGui = ReplicatedStorage.Storage.Assets.AnimalExperienceGui:Clone()
		p1.ExperienceGui.Adornee = HumanoidRootPart
		p1.ExperienceGui.Enabled = true
		p1:SetOffset()
		p1.ExperienceGui.Parent = p1.Model
	end
	local v1 = p1.ExperienceGui.ContainerFrame[p2]:Clone()
	v1.Name = tick()
	v1.TextLabel.Text = "+" .. p3 .. " XP"
	local tbl = {}
	for k, v in pairs(v1:GetDescendants()) do
		local v2 = t2[v.ClassName]
		if v2 then
			tbl[v] = {}
			for k2, v3 in pairs(v2) do
				tbl[v][k2] = v[k2]
				v[k2] = v3
			end
		end
	end
	v1.UIScale.Scale = 0
	v1.Visible = true
	v1.Position = UDim2.new(0.5, 0, 1, 0)
	v1.Parent = p1.ExperienceGui.ContainerFrame
	TweenService:Create(v1, TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out), {
		Position = UDim2.new(0.5, 0, 0.25, 0)
	}):Play()
	TweenService:Create(v1.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		Scale = 1
	}):Play()
	for k, v in pairs(tbl) do
		TweenService:Create(k, TweenInfo.new(0.5), v):Play()
	end
	task.wait(0.75)
	local v3 = nil
	for k, v in pairs(tbl) do
		if t2[k.ClassName] then
			local v4 = TweenService:Create(k, TweenInfo.new(0.2), t2[k.ClassName])
			v4:Play()
			v3 = v4
		end
	end
	v3.Completed:Wait()
	v1:Destroy()
end
function t.Init(p1) --[[ Init | Line: 232 | Upvalues: v3 (copy), v4 (copy), t (copy) ]]
	v3.new(v4.AnimalTag, t):Init()
end
t:Init()
return t