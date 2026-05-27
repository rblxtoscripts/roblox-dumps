-- https://lua.expert/
local v0 = "The player you\'re trying to duel with does not have a jousting tool equipped."
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local v1 = RunService:IsServer()
local Sonar = require(game.ReplicatedStorage.Sonar)
local v2 = not v1 and Sonar("NotificationsClient")
local v3 = Sonar("Maid")
local v4 = Sonar("InputTypeDetector")
local v5 = Sonar("UINavigator")
local v6 = Sonar("spr")
local v7 = Sonar("RemoteUtils")
local v8 = game.Players.LocalPlayer:GetMouse()
local v9 = Sonar("PlaceTypeService")
local t = {}
t.__index = t
local t2 = { workspace.Terrain }
local t3 = {
	PlayerNotFound = "The player you\'re trying to duel with was not found.",
	AlreadyRequested = "You\'ve already requested a duel with a player.",
	AlreadyDueling = "You\'re already dueling with a player.",
	TargetAlreadyRequested = "The player you\'re trying to duel with has already requested a duel.",
	RecentlyJousted = "You cannot duel with this player right now.",
	NotMounted = "You must be mounted to duel.",
	TargetNotMounted = "The player you\'re trying to duel with is not mounted.",
	NoToolEquipped = "You must have a jousting tool equipped to duel.",
	TargetNoToolEquipped = v0,
	NotEquipped = "You must have a jousting tool equipped to duel.",
	TargetNotEquipped = v0,
	CannotRequestDuel = "This player is not accepting duels right now.",
	InTutorial = "Cannot duel a player in the turorial.",
	NoJoustingTool = "You must have a jousting tool equipped to duel.",
	TargetNoJoustingTool = v0,
	TargetAlreadyDueling = "The player you\'re trying to duel with is already in a duel."
}
function t.new(p1) --[[ new | Line: 47 | Upvalues: t (copy), v3 (copy), RunService (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Tool = p1
	v2.Object = p1.Object
	v2.ToolData = p1.ToolData
	v2.Maid = v3.new()
	if RunService:IsServer() then
		v2:_initServer()
	else
		v2:_initClient()
	end
	return v2
end
function t._initServer(p1) --[[ _initServer | Line: 63 ]]
	p1.LastClientHit = 0
	local _ = p1.Object:FindFirstChild("Handle")
end
function t._getMouseSize(p1) --[[ _getMouseSize | Line: 70 ]]
	local Character = game.Players.LocalPlayer.Character
	if not Character then
		return 2
	end
	local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
	if HumanoidRootPart then
		return math.clamp((HumanoidRootPart.Position - p1.MousePart.Position).Magnitude / 10, 2, 4)
	else
		return 2
	end
end
function t._updateCursorPosition(p1) --[[ _updateCursorPosition | Line: 82 ]]
	local Handle = p1.Object:FindFirstChild("Handle")
	if not Handle then
		return CFrame.new()
	end
	local HumanoidRootPart = Handle.Parent.Parent:FindFirstChild("HumanoidRootPart")
	if HumanoidRootPart then
		local v2 = Handle.Position + HumanoidRootPart.CFrame.LookVector * 25
		local v3 = CFrame.new(v2, v2 + HumanoidRootPart.CFrame.LookVector)
		p1.MousePart.CFrame = v3
		return v3
	else
		return CFrame.new()
	end
end
function t._updateDisplay(p1) --[[ _updateDisplay | Line: 98 | Upvalues: Players (copy) ]]
	if not p1.Equipped then
		p1.LassoPart.Transparency = 1
		p1.MousePart.Transparency = 1
		return
	end
	if not game.Players.LocalPlayer.Character then
		return
	end
	if game.Players.LocalPlayer:GetAttribute("Dueling") then
		p1.LassoPart.Transparency = 1
		p1.MousePart.Transparency = 1
		return
	end
	local Handle = p1.Object:FindFirstChild("Handle")
	if not Handle then
		return
	end
	local HumanoidRootPart = Handle.Parent.Parent:FindFirstChild("HumanoidRootPart")
	if not HumanoidRootPart then
		return
	end
	local v1 = Handle.CFrame
	local v2 = HumanoidRootPart.CFrame.LookVector * 25
	p1.LassoPart.CFrame = CFrame.new(v1.Position + v2 * 0.5, v1.Position + v2)
	p1.LassoPart.Transparency = 0.8
	local v3 = p1:_getMouseSize()
	p1.MousePart.Size = Vector3.new(0.1, v3, v3)
	p1.MousePart.Transparency = 0.5
	local v4 = RaycastParams.new()
	v4.IncludeInstances = { workspace:WaitForChild("Characters") }
	local v5 = workspace:Raycast(v1.Position, v2, v4)
	if not (v5 and v5.Instance) then
		p1.LassoPart.Color = p1.DefaultMouseColor
		p1.MousePart.Color = p1.DefaultMouseColor
		return
	end
	if not (Players:GetPlayerFromCharacter(v5.Instance.Parent) or p1:_isAnimalHit(v5.Instance)) then
		p1.LassoPart.Color = p1.MissColor
		p1.MousePart.Color = p1.MissColor
		return
	end
	p1.LassoPart.Color = p1.HitColor
	p1.MousePart.Color = p1.HitColor
end
function t._isAnimalHit(p1, p2) --[[ _isAnimalHit | Line: 157 ]]
	local v1 = p2
	while v1 and v1 ~= workspace do
		if v1.Name == "Hitbox" then
			local v2 = v1.Parent
			if v2 and (v2.Parent and v2.Parent.Name == "Animals") then
				return true
			end
		end
		v1 = v1.Parent
	end
	return false
end
function t._initClient(p1) --[[ _initClient | Line: 171 ]]
	p1.NextUse = 0
	p1.Data = p1.ToolData
	p1:_setControls()
end
function t._setControls(p1) --[[ _setControls | Line: 184 | Upvalues: v4 (copy) ]]
	if not p1.ToolUI then
		return
	end
	p1.ToolUI.ControlsFrame.Visible = p1:_isOnHorse()
	p1.ToolUI.ControlsFrame.Position = v4.IsMobileInputType() and UDim2.new(0.05, 0, 0.8, 0) or UDim2.new(0.05, 0, 0.7, 0)
end
function t._startMinigame(p1) --[[ _startMinigame | Line: 191 | Upvalues: v3 (copy), v4 (copy), v5 (copy), v8 (copy), RunService (copy), t2 (copy), v6 (copy) ]]
	local v1 = v3.new()
	p1.Maid.MinigameMaid = v1
	local LassoDisplay = game.ReplicatedStorage.Storage.Assets.LassoDisplay
	p1.LassoPart = LassoDisplay.LassoRangePart:Clone()
	p1.LassoPart.Name = "LassoRange"
	p1.LassoPartSize = Vector3.new(0.1, 200, 200)
	p1.LassoPart.Size = p1.LassoPartSize
	p1.LassoPart.Transparency = 1
	p1.MousePart = LassoDisplay.LassoCursorPart:Clone()
	p1.MousePartSize = Vector3.new(0.9, 25, 25)
	p1.MousePart.Size = p1.MousePartSize
	p1.DefaultMouseColor = Color3.new(0.94902, 1, 0)
	p1.HitColor = Color3.new(0/255, 255/255, 0/255)
	p1.MissColor = Color3.new(1, 0.478431, 0.384314)
	p1.LassoSurfaceGui = p1.LassoPart.LassoSurfaceGui
	p1.MouseSurfaceGui = p1.MousePart.LassoSurfaceGui
	p1.MouseSurfaceGui.Enabled = not v4.IsMobileInputType()
	v1:GiveTask(p1.LassoPart)
	v1:GiveTask(p1.MousePart)
	local v2 = Instance.new("NumberValue")
	v2.Value = v2.Value - 1
	v1:GiveTask(v2.Changed:Connect(function(p12) --[[ Line: 220 | Upvalues: p1 (copy) ]]
		local v1 = Color3.new(255/255, 255/255, 255/255):Lerp(Color3.new(0/255, 255/255, 0/255), p12)
		p1.MouseSurfaceGui.Frame.UIStroke.Color = v1
		p1.MouseSurfaceGui.Frame.Crosshair1.BackgroundColor3 = v1
		p1.MouseSurfaceGui.Frame.Crosshair2.BackgroundColor3 = v1
		p1.MouseSurfaceGui.Frame.Crosshair3.BackgroundColor3 = v1
		p1.MouseSurfaceGui.Frame.Crosshair4.BackgroundColor3 = v1
		p1.MouseSurfaceGui.Frame.Rotation = p12 * 135
	end))
	v2.Value = 0
	v1:GiveTask(v2)
	local function getHit() --[[ getHit | Line: 234 | Upvalues: v4 (ref), v5 (ref), v8 (ref) ]]
		local _ = v4.IsMobileInputType() or v5.InGamepadSelection()
		return v8.Hit.p
	end
	local function updateCursorTransparency() --[[ updateCursorTransparency | Line: 242 | Upvalues: p1 (copy) ]]
		if game.Players.LocalPlayer:GetAttribute("Dueling") then
			p1.MouseSurfaceGui.Frame.UIStroke.Transparency = 1
			p1.MouseSurfaceGui.Frame.Crosshair1.BackgroundTransparency = 1
			p1.MouseSurfaceGui.Frame.Crosshair2.BackgroundTransparency = 1
			p1.MouseSurfaceGui.Frame.Crosshair3.BackgroundTransparency = 1
			p1.MouseSurfaceGui.Frame.Crosshair4.BackgroundTransparency = 1
			return
		end
		if tick() >= p1.NextUse then
			p1.MouseSurfaceGui.Frame.UIStroke.Transparency = 0
			p1.MouseSurfaceGui.Frame.Crosshair1.BackgroundTransparency = 0
			p1.MouseSurfaceGui.Frame.Crosshair2.BackgroundTransparency = 0
			p1.MouseSurfaceGui.Frame.Crosshair3.BackgroundTransparency = 0
			p1.MouseSurfaceGui.Frame.Crosshair4.BackgroundTransparency = 0
		else
			p1.MouseSurfaceGui.Frame.UIStroke.Transparency = 0.8
			p1.MouseSurfaceGui.Frame.Crosshair1.BackgroundTransparency = 0.8
			p1.MouseSurfaceGui.Frame.Crosshair2.BackgroundTransparency = 0.8
			p1.MouseSurfaceGui.Frame.Crosshair3.BackgroundTransparency = 0.8
			p1.MouseSurfaceGui.Frame.Crosshair4.BackgroundTransparency = 0.8
		end
	end
	local function updateCursorPosition() --[[ updateCursorPosition | Line: 267 | Upvalues: v4 (ref), v5 (ref), v8 (ref), p1 (copy), v2 (copy) ]]
		local Position = game.Players.LocalPlayer.Character.PrimaryPart.Position
		local v22 = (if v4.IsMobileInputType() or v5.InGamepadSelection() then v8.Hit.p else v8.Hit.p) - Position
		local v3 = math.min(v22.magnitude, 87.5)
		local v42 = CFrame.new(Position + v22.unit * v3) * CFrame.Angles(0, 0, 1.5707963267948966)
		if v4.IsMobileInputType() then
			p1.LassoSurfaceGui.Frame.UIStroke.Transparency = 0
		elseif game.Players.LocalPlayer:GetAttribute("Dueling") then
			p1.LassoSurfaceGui.Frame.UIStroke.Transparency = 1
		else
			p1.LassoSurfaceGui.Frame.UIStroke.Transparency = math.clamp((87.5 - v3) / 25, 0, 1)
		end
		p1.MousePart.Position = v42.Position:Lerp(p1.LastTargetPos or v42.Position, v2.Value)
		return v42
	end
	v1:GiveTask(RunService.RenderStepped:Connect(function() --[[ Line: 305 | Upvalues: p1 (copy), t2 (ref), updateCursorPosition (copy), v6 (ref), v2 (copy), updateCursorTransparency (copy) ]]
		if not p1.Equipped then
			return
		end
		local Position = game.Players.LocalPlayer.Character.PrimaryPart.Position
		p1.Origin = Position
		local _, v22 = workspace:FindPartOnRayWithWhitelist(Ray.new(Position, Vector3.new(0, -100, 0)), t2)
		p1.LassoPart.CFrame = CFrame.new(Position) * CFrame.new(0, -(Position - v22).Y - 3, 0) * CFrame.Angles(0, 0, 1.5707963267948966)
		local v4 = updateCursorPosition()
		local v5 = p1:_getMouseSize()
		local v62, v7 = p1:_checkTarget(v4.Position)
		p1.MousePartSize = Vector3.new(0.9, v5, v5)
		if v62 or v7 then
			local v8
			if v62 then
				local Position_2 = v62:GetPivot().Position
				p1.LastTargetPos = Position_2 - Vector3.new(0, v62.Hitbox.Size.Y / 2, 0)
				v8 = Vector3.new(0.9, v62.Hitbox.Size.Z * 3, v62.Hitbox.Size.Z * 3)
			else
				local Position_2 = v7:GetPivot().Position
				p1.LastTargetPos = Position_2 - Vector3.new(0, v7:GetPivot().Size.Y / 2, 0)
				v8 = Vector3.new(0.9, v7:GetPivot().Size.Z * 3, v7:GetPivot().Size.Z * 3)
			end
			v6.target(v2, 1, 3, {
				Value = 1
			})
			v6.target(p1.MousePart, 1, 3, {
				Size = v8
			})
		else
			p1.LastTargetPos = p1.LastTargetPos or v4.Position
			v6.target(v2, 1, 3, {
				Value = 0
			})
			v6.target(p1.MousePart, 0.5, 3, {
				Size = p1.MousePartSize
			})
		end
		updateCursorTransparency()
	end))
	v1:GiveTask(function() --[[ Line: 348 ]] end)
	v1:GiveTask(game:GetService("UserInputService").TouchTapInWorld:Connect(function(p12, p2) --[[ Line: 358 | Upvalues: p1 (copy), updateCursorPosition (copy) ]]
		if p2 then
			return
		end
		p1.CursorLocation = p12 / workspace.CurrentCamera.ViewportSize
		updateCursorPosition()
		p1:OnInput()
	end))
	p1.LassoPart.Parent = workspace.CurrentCamera
	p1.MousePart.Parent = workspace.CurrentCamera
	p1.LassoPart.Size = Vector3.new(0, 0, 0)
	p1.MousePart.Size = Vector3.new(0, 0, 0)
	p1.MousePart.Position = v8.Hit.Position
	v6.target(p1.LassoPart, 0.5, 3.5, {
		Size = p1.LassoPartSize
	})
	v6.target(p1.MousePart, 0.5, 5, {
		Size = p1.MousePartSize
	})
end
function t.OnInput(p1, p2) --[[ OnInput | Line: 375 | Upvalues: v7 (copy), v2 (copy), t3 (copy) ]]
	if p2 and (p2.UserInputType ~= Enum.UserInputType.MouseButton1 and p2.KeyCode ~= Enum.KeyCode.ButtonX) then
		return
	end
	if not p1.MousePart then
		return
	end
	local v1 = p1:_checkTarget(p1.MousePart.Position)
	if not v1 or game.Players.LocalPlayer:GetAttribute("Dueling") then
		return
	end
	local v22 = v7.GetRemoteFunction("DuelAction"):InvokeServer(v1.Parent.Parent.Name, "InitiateDuel")
	if v22 ~= true then
		v2.Notify({
			Preset = "Red",
			Message = t3[v22] or "An unknown error occurred."
		})
		return
	end
	game.ReplicatedStorage.Storage.SFX.UpgradeMutation:Play()
	v2.Notify({
		Message = "Request sent!",
		Preset = "Green"
	})
end
function t._endMinigame(p1) --[[ _endMinigame | Line: 408 ]]
	p1.Maid.MinigameMaid = nil
end
function t._checkTarget(p1, p2) --[[ _checkTarget | Line: 412 | Upvalues: Players (copy) ]]
	local LocalPlayer = game.Players.LocalPlayer
	local v1 = (1 / 0)
	local v2 = nil
	for v3, v4 in Players:GetPlayers() do
		if v4 ~= LocalPlayer then
			local Character = v4.Character
			if Character then
				local Humanoid = Character:FindFirstChild("Humanoid")
				if Humanoid then
					local SeatPart = Humanoid.SeatPart
					if SeatPart and SeatPart:IsDescendantOf(Character.Animals) then
						local v5 = SeatPart.Parent
						if v5 then
							local HumanoidRootPart = v5:FindFirstChild("HumanoidRootPart")
							if HumanoidRootPart then
								local Magnitude = (HumanoidRootPart.Position - p2).Magnitude
								if Magnitude <= 25 and Magnitude < v1 then
									v1 = Magnitude
									v2 = v5
								end
							end
						end
					end
				end
			end
		end
	end
	return v2
end
function t.Equip(p1) --[[ Equip | Line: 452 | Upvalues: v9 (copy), v2 (copy) ]]
	p1.Equipped = true
	p1:_setControls()
	local Character = game.Players.LocalPlayer.Character
	if not Character then
		return
	end
	local Humanoid = Character:FindFirstChildOfClass("Humanoid")
	if not Humanoid then
		return
	end
	if v9.IsMarketWorld() then
		v2.Notify({
			Message = "You cannot duel in the Market Realm!",
			Preset = "Red"
		})
		return
	end
	p1.Character = Character
	if p1:_isOnHorse() then
		p1:_startMinigame()
	end
	if not p1.JoustingIdleTrack then
		local Animation = Instance.new("Animation")
		Animation.AnimationId = "rbxassetid://84250167336276"
		p1.JoustingIdleTrack = p1.Object.Parent.Humanoid:LoadAnimation(Animation)
		Animation:Destroy()
		p1.JoustingIdleTrack.Priority = Enum.AnimationPriority.Action4
		p1.JoustingIdleTrack.Looped = true
	end
	p1.JoustingIdleTrack:Play()
	p1.Maid._checkSeatedTask = Humanoid:GetPropertyChangedSignal("SeatPart"):Connect(function() --[[ Line: 490 | Upvalues: p1 (copy) ]]
		if p1:_isOnHorse() then
			p1:_startMinigame()
		else
			p1:_endMinigame()
		end
	end)
end
function t.Unequip(p1) --[[ Unequip | Line: 499 ]]
	p1.Equipped = false
	p1:_setControls()
	p1.Maid._checkSeatedTask = nil
	p1.JoustingIdleTrack:Stop()
	p1:_endMinigame()
end
function t.Destroy(p1) --[[ Destroy | Line: 511 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t._isOnHorse(p1) --[[ _isOnHorse | Line: 516 ]]
	local Character = game.Players.LocalPlayer.Character
	if not Character then
		return false
	end
	local Humanoid = Character:FindFirstChildOfClass("Humanoid")
	if not Humanoid then
		return false
	end
	local SeatPart = Humanoid.SeatPart
	if SeatPart and SeatPart:IsDescendantOf(Character.Animals) then
		return true
	else
		return false
	end
end
return t