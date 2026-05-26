-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("ItemDataService")
local v3 = Sonar("Constants")
local ItemDrops = ReplicatedStorage.Storage.Assets.ItemDrops
local t2 = {
	Food = {
		Image = "rbxassetid://16190522266",
		DropParticleColor = Color3.fromRGB(56, 255, 89)
	},
	Buildings = {
		Image = "rbxassetid://15490227182",
		DropParticleColor = Color3.fromRGB(67, 108, 255)
	},
	Potions = {
		Image = "rbxassetid://17119517144",
		DropParticleColor = Color3.fromRGB(177, 125, 255)
	},
	Equipment = {
		Image = "rbxassetid://17173012518",
		DropParticleColor = Color3.fromRGB(255, 185, 88)
	},
	EquipmentPalettes = {
		Image = "rbxassetid://17173012518",
		DropParticleColor = Color3.fromRGB(255, 185, 88)
	},
	Flairs = {
		Image = "rbxassetid://16988928496",
		SparklesParticleColor = Color3.fromRGB(255, 178, 126),
		GlowParticleColor = Color3.fromRGB(255, 178, 126)
	}
}
local v4 = Sonar("PlayerWrapper").GetClient()
local v5 = Random.new()
local v6 = tick()
local Part = Instance.new("Part")
Part.Position = Vector3.new(0, -100, 0)
local Attachment = Instance.new("Attachment")
Attachment.Parent = Part
Part.Transparency = 1
Part.Anchored = true
Part.Parent = workspace
function t.new(p1) --[[ new | Line: 61 | Upvalues: t (copy), v1 (copy), v3 (copy), v2 (copy), t2 (copy), ItemDrops (copy), Attachment (copy) ]]
	local v22 = setmetatable(p1, t)
	v22.Type = v22.Type or "Coins"
	v22.Maid = v1.new()
	if type(v22.Type) == "number" then
		v22.Type = v3.IndexedItemDrops[v22.Type]
	end
	v22.ItemData = v2.GetByName(v22.ItemName or v22.Type)
	local v4 = v22.ItemData and t2[v22.ItemData.ItemType] or (t2[v22.Type] or {})
	v22.Model = (v4.Model or (ItemDrops:FindFirstChild(v22.Type) or ItemDrops.Default)):Clone()
	if not v4.DoNotSetColor then
		local v6 = v22.ItemData and v22.ItemData.DropParticleColor or v4.DropParticleColor
		for k, v in pairs(v22.Model.Attachment:GetChildren()) do
			if v:IsA("ParticleEmitter") then
				v.Color = ColorSequence.new(v4[v.Name .. "ParticleColor"] or v6)
			end
		end
	end
	v22.Model.Position = v22.Position
	v22.Model.Parent = workspace.CurrentCamera
	v22.BillboardGui = v22.Model.Attachment.BillboardGui
	if not v4.DoNotSetImage then
		v22.BillboardGui.ImageLabel.Image = v22.ItemData and v22.ItemData.Image or (v4.Image or v22.BillboardGui.ImageLabel.Image)
	end
	v22.BillboardGui.Enabled = true
	v22.Model.AlignOrientation.Attachment1 = Attachment
	v22.Model.AlignOrientation.Enabled = true
	v22.Maid:GiveTask(v22.Model)
	v22:SetCanGiveItem()
	task.spawn(t.Animate, v22)
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 109 ]]
	p1.Destroyed = true
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.Create(...) --[[ Create | Line: 115 | Upvalues: t (copy) ]]
	return t.new(...)
end
function t.SetCanGiveItem(p1) --[[ SetCanGiveItem | Line: 119 | Upvalues: v4 (copy) ]]
	local v1 = p1.ItemData and p1.ItemData.ItemType or p1.Type
	local v2, v3 = v4:CanGiveItem(v1)
	if v3 and not p1.ListeningForItems then
		p1.ListeningForItems = true
		local v42 = v4:GetItemLimit(v1)
		local v5 = pairs
		for v7, v8 in v5(v42.Changed or {}) do
			p1.Maid:GiveTask(v8:Connect(function() --[[ Line: 128 | Upvalues: p1 (copy) ]]
				p1:SetCanGiveItem()
			end))
		end
	end
	p1.CanGive = v2
	if not p1.BillboardGui:FindFirstChild("MaxLabel") then
		return
	end
	p1.BillboardGui.MaxLabel.Visible = not v2
	p1.BillboardGui.ImageLabel.MaxLabel.Visible = not v2
	p1.BillboardGui.ImageLabel.ImageTransparency = if v2 then 0 else 0.1
end
function t.Animate(p1) --[[ Animate | Line: 143 | Upvalues: v5 (copy), TweenService (copy), RunService (copy), v3 (copy) ]]
	task.delay(v5:NextNumber(10, 25) / 100, function() --[[ Line: 145 | Upvalues: p1 (copy), TweenService (ref) ]]
		while p1.Model.Parent do
			TweenService:Create(p1.Model.Attachment, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, true), {
				Position = Vector3.new(0, 2, 0)
			}):Play()
			task.wait(2)
		end
	end)
	local v1 = 5 * v5:NextNumber(30, 40)
	local v32 = math.rad((v5:NextNumber(1, 360)))
	local v4 = math.sin(v32) * v1
	local v52 = math.cos(v32) * v1
	p1.Model.VectorForce.Force = Vector3.new(v4, 23 + (v5:NextNumber() * 3 - 2), v52)
	p1.Model.Anchored = false
	p1.Model.AssemblyLinearVelocity = Vector3.new(0, 80, 0)
	task.delay(3, function() --[[ Line: 168 | Upvalues: p1 (copy) ]]
		if not p1.PickedUp then
			p1:WaitForPickUp()
		end
	end)
	repeat
		RunService.Heartbeat:Wait()
		if p1.Model.Position.Y < v3.MIN_WORLD_Y then
			task.defer(function() --[[ Line: 178 | Upvalues: p1 (copy) ]]
				p1:PickUp()
			end)
			break
		end
	until p1.Model.Velocity.Magnitude <= 1 or p1.LerpingTo
	if not p1.WaitForPickUp then
		return
	end
	p1:WaitForPickUp()
	if not p1.Destroyed then
		p1.Model.CanTouch = false
		p1.Model.CanCollide = false
		p1.CanQuery = false
		p1.Model.AlignOrientation.Enabled = false
		p1.Model.VectorForce.Enabled = false
		p1.Model.Anchored = true
	end
end
function t.WaitForPickUp(p1) --[[ WaitForPickUp | Line: 200 | Upvalues: RunService (copy), v4 (copy) ]]
	if not p1.PickedUp then
		local v1 = nil
		local v2 = nil
		local v3 = nil
		p1.Maid:GiveTask(RunService.RenderStepped:Connect(function(p12) --[[ Line: 207 | Upvalues: v3 (ref), v4 (ref), v2 (ref), p1 (copy), v1 (ref) ]]
			v3 = v4.PrimaryPart.Position
			v2 = p1.Model.Position
			if not p1.CanGive then
				p1.LerpingTo = false
			end
			p1.LerpingTo = p1.CanGive and (p1.LerpingTo or (v3 - v2).Magnitude <= 40)
			if not p1.LerpingTo then
				return
			end
			if not v1 then
				v1 = tick()
			end
			p1.Model.Position = v2:Lerp(v3, (tick() - v1) / 1.8)
			if not ((v3 - v2).Magnitude < 1.8) then
				return
			end
			p1:PickUp()
		end))
	end
end
function t.PickUp(p1) --[[ PickUp | Line: 233 | Upvalues: v6 (ref), v3 (copy) ]]
	if not p1.CanGive then
		return
	end
	if p1.PickedUp then
		return
	end
	p1.PickedUp = true
	local v1 = tick()
	v6 = v1
	v3.PickedUpDrop = true
	task.delay(2, function() --[[ Line: 242 | Upvalues: v1 (copy), v6 (ref), v3 (ref) ]]
		if v1 ~= v6 then
			return
		end
		v3.PickedUpDrop = false
	end)
	if p1.OnPickUp then
		p1.OnPickUp(p1)
	end
	p1:Destroy()
end
return t