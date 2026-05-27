-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("FormatNumber")
local v2 = Sonar("Maid")
local v3 = Sonar("DisplayUtils")
local v4 = Sonar("StatBar")
local v5 = Sonar("Mob")
local MobAnimationInfo = Sonar("Constants").MobAnimationInfo
local t2 = {
	Default = {
		BackgroundColor = Color3.fromRGB(102, 22, 22),
		UIGradient = ReplicatedStorage.Storage.Assets.MobGradient
	},
	Roleplay = {
		BackgroundColor = Color3.fromRGB(56, 93, 145),
		UIGradient = ReplicatedStorage.Storage.Assets.RoleplayGradient
	}
}
local DefaultMobGui = ReplicatedStorage.Storage.Assets.DefaultMobGui
local t3 = {}
local t4 = {}
local function getCachedOffset(p1) --[[ getCachedOffset | Line: 37 | Upvalues: t4 (copy) ]]
	local PrimaryPart = p1.PrimaryPart
	local v1 = t4[PrimaryPart]
	if v1 then
		return v1
	else
		local v3 = math.abs(p1:GetExtentsSize().Y - p1.PrimaryPart.Size.Y) * Vector3.new(0, 1, 0)
		t4[PrimaryPart] = v3
		return v3
	end
end
function t.new(p1) --[[ new | Line: 53 | Upvalues: t (copy), v2 (copy), MobAnimationInfo (copy), v5 (copy), t2 (copy), DefaultMobGui (copy), t4 (copy), v4 (copy), t3 (copy) ]]
	local v22 = setmetatable(p1, t)
	v22.Maid = v2.new()
	v22.MobSequences = MobAnimationInfo[v22.Data.Name].AttackSequences or {}
	v22.Level = v22.Model:GetAttribute("Level")
	v22.RoleplayMob = v22.Model:GetAttribute("RP")
	v22.MaxHealth = v5:GetHealth(v22.Data.Name, v22.Level)
	v22.SpawnData = v22.RoleplayMob and t2.Roleplay or t2.Default
	v22.DisplayGui = DefaultMobGui:Clone()
	v22.DisplayGui.AlwaysOnTop = false
	v22.DisplayGui.Adornee = v22.CosmeticModel.PrimaryPart
	local Reference = p1.Reference
	local PrimaryPart = Reference.PrimaryPart
	local v52 = t4[PrimaryPart]
	local v6
	if v52 then
		v6 = v52
	else
		local v8 = math.abs(Reference:GetExtentsSize().Y - Reference.PrimaryPart.Size.Y) * Vector3.new(0, 1, 0)
		t4[PrimaryPart] = v8
		v6 = v8
	end
	v22.DisplayGui.StudsOffset = v6
	v22.DisplayGui.Parent = v22.Model
	v22.Maid:GiveTask(v22.DisplayGui)
	v22.ContainerFrame = v22.DisplayGui.ContainerFrame
	v22.ExtraInfoFrame = v22.ContainerFrame.ExtraInfoFrame
	v22.HealthBarLabel = v22.ContainerFrame.HealthBarLabel.InnerFrame
	v22.HealthBarLabel.ClipFrame.MoverLabel.UIGradient.Color = v22.SpawnData.UIGradient.Color
	v22.HealthBarLabel.BackgroundColor3 = v22.SpawnData.BackgroundColor
	v22.ExclamationPoint = v22.ContainerFrame.ExclamationPoint
	v22.ExtraInfoFrame.LevelLabel.Visible = not v22.RoleplayMob
	v22.ExtraInfoFrame.RoleplayLabel.Visible = v22.RoleplayMob
	v22.Maid:GiveTask(v22.CosmeticModel:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 86 | Upvalues: v22 (copy) ]]
		v22:SetBillboard()
	end))
	v22:SetBillboard()
	v22.Maid:GiveTask(v22.Model:GetAttributeChangedSignal("Warning"):Connect(function() --[[ Line: 91 | Upvalues: v22 (copy) ]]
		v22:Warn()
	end))
	v22:SetName()
	v22:SetLevel()
	v22.Maid:GiveTask(v4.new({
		Append = " HP",
		TweenAmount = true,
		Frame = v22.HealthBarLabel,
		Rotate = {
			Angle = 7,
			Frame = v22.HealthBarLabel.AmountLabel
		},
		Get = function() --[[ Get | Line: 108 | Upvalues: v22 (copy) ]]
			return v22.Model:GetAttribute("Health")
		end,
		GetMax = function() --[[ GetMax | Line: 111 | Upvalues: v22 (copy) ]]
			return v22.MaxHealth
		end,
		Changed = { v22.Model:GetAttributeChangedSignal("Health") }
	}))
	t3[v22.Model] = v22
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 124 | Upvalues: t3 (copy) ]]
	t3[p1.Model] = nil
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.SetBillboard(p1) --[[ SetBillboard | Line: 131 ]]
	p1.DisplayGui.Enabled = p1.CosmeticModel.Parent and true
end
function t.SetLevel(p1) --[[ SetLevel | Line: 135 | Upvalues: v1 (copy) ]]
	p1.ExtraInfoFrame.LevelLabel.LevelLabel.Text = v1.suffix(p1.Level)
end
function t.SetName(p1) --[[ SetName | Line: 139 | Upvalues: v3 (copy) ]]
	p1.ContainerFrame.NameLabel.Text = v3.GetDisplayName(p1.Data.Name, p1.Data)
end
function t.Warn(p1) --[[ Warn | Line: 143 | Upvalues: TweenService (copy) ]]
	local v1 = p1.Model:GetAttribute("Warning")
	if not v1 then
		p1.ExclamationPoint.Visible = false
		p1.ExclamationPoint.UIScale.Scale = 0
		return
	end
	if not p1.DisplayGui.Enabled then
		return
	end
	local v2 = p1.MobSequences[v1]
	Color3.new(0/255, 0/255, 0/255)
	local v4, v5
	if v2.Hitbox then
		v4, v5 = Color3.new(1, 0.368627, 0), 1
	else
		v4, v5 = Color3.new(255/255, 0/255, 0/255), 1.35
	end
	p1.ExclamationPoint.TextColor3 = v4
	TweenService:Create(p1.ExclamationPoint.UIScale, TweenInfo.new((v2.WarningLength or 0.1) * 0.8, Enum.EasingStyle.Elastic), {
		Scale = v5
	}):Play()
	p1.ExclamationPoint.Visible = true
end
function t.Init(p1) --[[ Init | Line: 180 ]] end
t:Init()
return t