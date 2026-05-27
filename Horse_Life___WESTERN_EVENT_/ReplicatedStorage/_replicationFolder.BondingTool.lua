-- https://lua.expert/
local t = {}
t.__index = t
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("NotificationsClient")
local v2 = Sonar("WorldspaceGuiUtils")
local v3 = Sonar("InputTypeDetector")
local v4 = Sonar("ItemDataService")
local v5 = Sonar("SoundPlayer")
local v6 = Sonar("Animal")
local v7 = Sonar("Maid")
local v8 = Sonar("spr")
local v9 = Sonar("BondService")
local v10 = Sonar("TimeUtils")
local v11 = nil
local v12 = Sonar("FormatNumber")
local t2 = { workspace.Terrain }
local LocalPlayer = game.Players.LocalPlayer
local v13 = Sonar("PlayerWrapper").GetClient()
local v14 = LocalPlayer:GetMouse()
local SFX = ReplicatedStorage.Storage.SFX
function t.new(p1) --[[ new | Line: 29 | Upvalues: t (copy), v7 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Tool = p1
	v2.Object = p1.Object
	v2.Maid = v7.new()
	v2.Enabled = false
	v2.Last = tick()
	v2.Points = 0
	v2:_initClient()
	return v2
end
function t._initClient(p1) --[[ _initClient | Line: 46 | Upvalues: v4 (copy), ReplicatedStorage (copy), v2 (copy), Sonar (copy) ]]
	p1.NextUse = 0
	p1.Data = v4.GetByName(p1.Object.Name)
	p1.MaxDistance = p1.Data.Distance
	p1.MaxHitDistance = p1.Data.Hit
	local v1 = ReplicatedStorage.Storage.Assets.BondingToolBillboard:Clone()
	v1.ControlsFrame.Lasso.TextLabel.Text = "- Start"
	v2.AddWorldspaceGui(v1)
	v1.Parent = p1.Object:WaitForChild("Handle")
	p1.ToolUI = v1
	p1.Maid:GiveTask(v1)
	local v22 = Sonar("DebounceMeter").new(v1.DebounceMeter)
	p1.Maid:GiveTask(v22)
	p1.debounceMeter = v22
	p1:_setExperience()
	p1.DefaultColor = Color3.fromRGB(117, 225, 255)
	p1.AutoAimDivision = 3
end
function t._setExperience(p1, p2) --[[ _setExperience | Line: 76 | Upvalues: v12 (copy), v9 (copy), v10 (copy) ]]
	local v1 = "+" .. v12.splice(p1.Data.Experience) .. " XP"
	if not p2 then
		p1.ToolUI.ControlsFrame.Experience.TextLabel.Text = v1
		return
	end
	local v2 = p2.SlotValue.LastBond.Value + v9.TimeBetweenBond - v10.Get()
	p1.ToolUI.ControlsFrame.Experience.TextLabel.Text = if v2 > 0 then "+0 XP (" .. v10.FormatString(v2) .. ")" or v1 else v1
end
function t._checkTarget(p1, p2) --[[ _checkTarget | Line: 86 | Upvalues: v6 (copy) ]]
	local v1 = p1.MaxHitDistance / p1.AutoAimDivision
	local v2 = nil
	local v3 = nil
	for v4, v5 in v6.GetAllAnimals() do
		if v5.Model then
			local Magnitude = (v5.Model.PrimaryPart.Position - v5.Extents * Vector3.new(0, 0.5, 0) - p2).Magnitude
			if Magnitude <= v1 then
				v3 = v5.Model
				v1 = Magnitude
				v2 = v5
			end
		end
	end
	return v2, v3
end
function t._startMinigame(p1) --[[ _startMinigame | Line: 107 | Upvalues: v7 (copy), v3 (copy), v14 (copy), RunService (copy), t2 (copy), v8 (copy) ]]
	local v1 = v7.new()
	p1.Maid.MinigameMaid = v1
	p1.RodPart = game.ReplicatedStorage.Storage.Assets.LassoDisplay.LassoRangePart:Clone()
	p1.RodPart.Name = "CleaningRange"
	p1.RodPartSize = Vector3.new(0.1, p1.MaxDistance, p1.MaxDistance)
	p1.RodPart.Size = p1.RodPartSize
	p1.RodPart.Transparency = 1
	p1.MousePart = game.ReplicatedStorage.Storage.Assets.BondingCursorPart:Clone()
	p1.MousePartSize = Vector3.new(0.9, p1.MaxHitDistance, p1.MaxHitDistance)
	p1.MousePart.Size = p1.MousePartSize
	p1.DefaultMouseColor = Color3.fromRGB(185, 73, 255)
	p1.DefaultCooldownColor = Color3.fromRGB(88, 19, 144)
	p1.HitColor = Color3.new(0.960784, 0.513725, 1)
	p1.MissColor = Color3.new(1, 0.478431, 0.384314)
	p1.LassoSurfaceGui = p1.RodPart.LassoSurfaceGui
	p1.MouseSurfaceGui = p1.MousePart.LassoSurfaceGui
	p1.MouseSurfaceGui.Enabled = not v3.IsMobileInputType()
	if p1.Data.CustomImage then
		p1.MouseSurfaceGui.Frame.ImageLabel.Image = "rbxassetid://" .. p1.Data.Image
	end
	v1:GiveTask(p1.RodPart)
	v1:GiveTask(p1.MousePart)
	local v2 = Instance.new("NumberValue")
	v2.Value = v2.Value - 1
	local function updateCursorTransparency() --[[ updateCursorTransparency | Line: 142 | Upvalues: p1 (copy) ]]
		if tick() >= p1.NextUse then
			if not (p1.MouseSurfaceGui and p1.MouseSurfaceGui.Frame) then
				return
			end
			p1.MouseSurfaceGui.Frame.UIStroke.Transparency = 0
			p1.MouseSurfaceGui.Frame.Crosshair1.BackgroundTransparency = 1
			p1.MouseSurfaceGui.Frame.Crosshair2.BackgroundTransparency = 1
			p1.MouseSurfaceGui.Frame.Crosshair3.BackgroundTransparency = 1
			p1.MouseSurfaceGui.Frame.Crosshair4.BackgroundTransparency = 1
			p1.MouseSurfaceGui.Frame.ImageLabel.ImageTransparency = if p1.FoundTarget then 0.8 else 0
			p1.MouseSurfaceGui.Frame.UIStroke.Color = p1.DefaultMouseColor
			p1.MouseSurfaceGui.Frame.Crosshair1.BackgroundColor3 = p1.DefaultMouseColor
			p1.MouseSurfaceGui.Frame.Crosshair2.BackgroundColor3 = p1.DefaultMouseColor
			p1.MouseSurfaceGui.Frame.Crosshair3.BackgroundColor3 = p1.DefaultMouseColor
			p1.MouseSurfaceGui.Frame.Crosshair4.BackgroundColor3 = p1.DefaultMouseColor
			return
		end
		if not (p1.MouseSurfaceGui and p1.MouseSurfaceGui.Frame) then
			return
		end
		p1.MouseSurfaceGui.Frame.UIStroke.Transparency = 0.8
		p1.MouseSurfaceGui.Frame.Crosshair1.BackgroundTransparency = 1
		p1.MouseSurfaceGui.Frame.Crosshair2.BackgroundTransparency = 1
		p1.MouseSurfaceGui.Frame.Crosshair3.BackgroundTransparency = 1
		p1.MouseSurfaceGui.Frame.Crosshair4.BackgroundTransparency = 1
		p1.MouseSurfaceGui.Frame.ImageLabel.ImageTransparency = 0.8
		p1.MouseSurfaceGui.Frame.UIStroke.Color = p1.DefaultCooldownColor
		p1.MouseSurfaceGui.Frame.Crosshair1.BackgroundColor3 = p1.DefaultCooldownColor
		p1.MouseSurfaceGui.Frame.Crosshair2.BackgroundColor3 = p1.DefaultCooldownColor
		p1.MouseSurfaceGui.Frame.Crosshair3.BackgroundColor3 = p1.DefaultCooldownColor
		p1.MouseSurfaceGui.Frame.Crosshair4.BackgroundColor3 = p1.DefaultCooldownColor
	end
	v1:GiveTask(v2.Changed:Connect(function(p12) --[[ Line: 174 | Upvalues: p1 (copy) ]]
		local v1 = Color3.new(255/255, 255/255, 255/255):Lerp(Color3.new(0/255, 255/255, 0/255), p12)
		p1.MouseSurfaceGui.Frame.UIStroke.Color = v1
		p1.MouseSurfaceGui.Frame.Crosshair1.BackgroundColor3 = v1
		p1.MouseSurfaceGui.Frame.Crosshair2.BackgroundColor3 = v1
		p1.MouseSurfaceGui.Frame.Crosshair3.BackgroundColor3 = v1
		p1.MouseSurfaceGui.Frame.Crosshair4.BackgroundColor3 = v1
		p1.MouseSurfaceGui.Frame.Rotation = p12 * 135
		p1.MouseSurfaceGui.Frame.ImageLabel.ImageTransparency = p12
	end))
	v2.Value = 0
	v1:GiveTask(v2)
	local function updateCursorPosition() --[[ updateCursorPosition | Line: 190 | Upvalues: p1 (copy), v14 (ref), v3 (ref), v2 (copy) ]]
		local Position = game.Players.LocalPlayer.Character.PrimaryPart.Position
		local v1 = p1.MaxDistance / 2 - p1.MaxHitDistance / 2
		local v22 = v14.Hit.p - Position
		local v32 = math.min(v22.magnitude, v1)
		local v4 = CFrame.new(Position + v22.unit * v32) * CFrame.Angles(0, 0, 1.5707963267948966)
		if v3.IsMobileInputType() then
			p1.LassoSurfaceGui.Frame.UIStroke.Transparency = 0
		else
			p1.LassoSurfaceGui.Frame.UIStroke.Transparency = math.clamp((v1 - v32) / p1.MaxHitDistance, 0, 1)
		end
		p1.MousePart.Position = v4.Position:Lerp(p1.LastTargetPos or v4.Position, v2.Value)
		return v4
	end
	v1:GiveTask(RunService.RenderStepped:Connect(function() --[[ Line: 225 | Upvalues: p1 (copy), t2 (ref), updateCursorPosition (copy), v8 (ref), v2 (copy), updateCursorTransparency (copy) ]]
		if not p1.Equipped then
			return
		end
		local Position = game.Players.LocalPlayer.Character.PrimaryPart.Position
		p1.Origin = Position
		local _, v22 = workspace:FindPartOnRayWithWhitelist(Ray.new(Position, Vector3.new(0, -100, 0)), t2)
		p1.RodPart.CFrame = CFrame.new(Position) * CFrame.new(0, -(Position - v22).Y - 3, 0) * CFrame.Angles(0, 0, 1.5707963267948966)
		local v4 = updateCursorPosition()
		local MaxHitDistance = p1.MaxHitDistance
		local v5, v6 = p1:_checkTarget(v4.Position)
		p1.MousePartSize = Vector3.new(0.9, MaxHitDistance, MaxHitDistance)
		if v5 then
			local Extents = v5.Extents
			p1.LastTargetPos = v5.Model.PrimaryPart.Position - Vector3.new(0, Extents.Y / 2, 0)
			local v11 = Vector3.new(0.9, Extents.Z * 1.5, Extents.Z * 1.5)
			v8.target(v2, 1, 3, {
				Value = 1
			})
			v8.target(p1.MousePart, 1, 3, {
				Size = v11
			})
			if p1.FoundTarget ~= v5 then
				p1.FoundTarget = v5
			end
		else
			if v6 then
				local Position_2 = p1.MousePart.Position
				p1.MousePart.Position = Vector3.new(Position_2.X, v6.PrimaryPart.Position.Y, Position_2.Z)
			end
			if p1.FoundTarget ~= nil then
				p1.FoundTarget = nil
			end
			p1.LastTargetPos = p1.LastTargetPos or v4.Position
			v8.target(v2, 1, 3, {
				Value = 0
			})
			v8.target(p1.MousePart, 0.5, 3, {
				Size = p1.MousePartSize
			})
		end
		p1:_setExperience(v5)
		updateCursorTransparency()
	end))
	v1:GiveTask(game:GetService("UserInputService").TouchTapInWorld:Connect(function(p12, p2) --[[ Line: 297 | Upvalues: updateCursorPosition (copy), p1 (copy) ]]
		if p2 then
			return
		end
		updateCursorPosition()
		p1:OnInput()
	end))
	p1.RodPart.Parent = workspace.CurrentCamera
	p1.MousePart.Parent = workspace.CurrentCamera
	p1.RodPart.Size = Vector3.new(0, 0, 0)
	p1.MousePart.Size = Vector3.new(0, 0, 0)
	p1.MousePart.Position = v14.Hit.Position
	v8.target(p1.RodPart, 0.5, 3.5, {
		Size = p1.RodPartSize
	})
	v8.target(p1.MousePart, 0.5, 5, {
		Size = p1.MousePartSize
	})
end
function t.Equip(p1) --[[ Equip | Line: 314 ]]
	p1:_startMinigame()
	p1.Equipped = true
end
function t.Unequip(p1) --[[ Unequip | Line: 319 ]]
	if not p1.Equipped then
		return
	end
	p1.Equipped = false
	p1.Maid.MinigameMaid = nil
end
function t._hit(p1, p2) --[[ _hit | Line: 326 | Upvalues: v9 (copy), v13 (copy), v1 (copy), v10 (copy), v11 (ref), Sonar (copy) ]]
	local v12, _, v2 = v9:CanDoCleaningMinigame(v13, p2.SlotValue.Name, p1.Data.Name)
	if v12 ~= true and (v2 and v2 > 0) then
		v1.Notify({
			Type = "PetAnimal",
			Message = string.format("Bond action on cooldown for %s, you won\'t get any experience!", v10.FormatString(v2))
		})
	end
	if v11 then
		v11:EnterMode({
			Horse = p2,
			Type = p1.Data.InteractType,
			Tool = p1.Data.Name,
			CustomModel = p1.Data.CustomModel
		})
		return
	end
	v11 = Sonar("AnimalBondingClient")
	v11:EnterMode({
		Horse = p2,
		Type = p1.Data.InteractType,
		Tool = p1.Data.Name,
		CustomModel = p1.Data.CustomModel
	})
end
function t.OnInput(p1, p2) --[[ OnInput | Line: 370 | Upvalues: v13 (copy), v1 (copy), v5 (copy), SFX (copy) ]]
	if not p1.Equipped then
		return
	end
	if p2 and (p2.UserInputType ~= Enum.UserInputType.MouseButton1 and p2.KeyCode ~= Enum.KeyCode.ButtonX) then
		return
	end
	if tick() < p1.NextUse then
		p1.debounceMeter:earlyFlash()
		return
	end
	if v13:IsInAction("Race") or _G.WaitingForRaceRewards then
		return
	end
	local v12 = v13:GetCurrentAnimal()
	if v12 and v12.Flying then
		v1.Notify({
			Message = "You can\'t use this tool while flying!",
			Type = "Red"
		})
		return
	end
	local v2 = p1.Data.Cooldown or 2
	p1.NextUse = tick() + v2
	p1.debounceMeter:startTimer(v2)
	v5:PlayLocalSound(SFX.ClickSound)
	if p1.FoundTarget then
		p1:_hit(p1.FoundTarget)
	else
		v1.Notify({
			Message = "Click on one of your horses to bond with it!",
			Type = "BondNoTarget"
		})
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 428 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
return t