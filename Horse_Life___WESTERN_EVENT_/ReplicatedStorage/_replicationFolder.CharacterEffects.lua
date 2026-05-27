-- https://lua.expert/
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local CurrentCamera = workspace.CurrentCamera
local Sonar = require(game.ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local LocalPlayer = game.Players.LocalPlayer
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("MathUtils")
local v4 = Sonar("InputTypeDetector")
local v5 = Sonar("spr")
local v6 = Sonar("CharacterSprintService")
local v7 = Sonar("PlayerLocatorOverhead")
local v8 = Sonar("Constants")
local v9 = Sonar("Animal")
local v10 = Sonar("Octree")
local v11 = LocalPlayer:GetMouse()
local t = {}
t.__index = t
local t2 = {}
local v12 = v10.new("LocalCharacter", 2, 512)
local v13 = v2.GetClient()
local v14 = v4.IsMobileInputType()
local CharacterRenderBin = Instance.new("Folder", game.ReplicatedStorage)
CharacterRenderBin.Name = "CharacterRenderBin"
local v15 = v13:GetStatValue("Tames")
local v16 = v15.Value
v15:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 33 | Upvalues: v16 (ref), v15 (copy) ]]
	v16 = v15.Value
end)
local v17 = nil
local v18 = workspace.CurrentCamera.CFrame
local function isNeck(p1) --[[ isNeck | Line: 41 ]]
	local v1 = p1:lower()
	local v2 = v1:sub(0, 1) == "n"
	local v3 = if v1 == "neck" then true else false
	return if v3 then v3 elseif v2 then tonumber(v1:sub(2)) else v2
end
local function isWaist(p1) --[[ isWaist | Line: 48 ]]
	return p1:lower() == "waist"
end
local function getCanTouch(p1) --[[ getCanTouch | Line: 54 ]]
	return p1.Name == "HumanoidRootPart"
end
local t3 = {
	LeftLowerArm = true,
	RightLowerArm = true,
	LeftLowerLeg = true,
	RightLowerLeg = true
}
local function getCanQuery(p1) --[[ getCanQuery | Line: 64 | Upvalues: t3 (copy) ]]
	return t3[p1.Name]
end
local function isHorseSeat(p1) --[[ isHorseSeat | Line: 68 ]]
	return if p1 then p1.Parent and p1.Parent:HasTag("Animal") else p1
end
local function addSecondaryJoints(p1) --[[ addSecondaryJoints | Line: 72 | Upvalues: t3 (copy) ]]
	p1.Neck = {}
	p1.Body = {}
	p1.MiddleBody = {}
	p1.LowerBody = {}
	p1.Waist = {}
	local function addNeck(p12) --[[ addNeck | Line: 79 | Upvalues: p1 (copy) ]]
		if not p12:IsA("Motor6D") then
			return
		end
		local v1 = p12.Name
		local v2 = v1:lower()
		local v3 = v2:sub(0, 1) == "n"
		local v5 = (if v2 == "neck" then true else false) or v3 and tonumber(v2:sub(2))
		if not v5 and (v1:sub(0, 2) == "LN" or v1:sub(0, 2) == "RN") then
			local v7 = tonumber(v1:sub(3))
			p1.ExtraNecks = true
			v5 = v7
		end
		if not v5 then
			return
		end
		p1.Neck[#p1.Neck + 1] = { p12, p12.Transform }
	end
	local function addBody(p12) --[[ addBody | Line: 94 | Upvalues: p1 (copy) ]]
		if not p12:IsA("Motor6D") then
			return
		end
		local v1 = p12.Name
		if v1 == "UpperBody" or v1 == "Root" then
			p1.Body[#p1.Body + 1] = { p12, p12.Transform }
			return
		end
		if v1 == "MiddleBody" then
			p1.MiddleBody[#p1.MiddleBody + 1] = { p12, p12.Transform }
			return
		end
		if v1 == "LowerBody" then
			p1.LowerBody[#p1.LowerBody + 1] = { p12, p12.Transform }
			return
		end
		if not (v1:lower() == "waist") then
			return
		end
		p1.Waist[#p1.Waist + 1] = { p12, p12.Transform }
	end
	local function killLayerClothing(p1) --[[ killLayerClothing | Line: 108 ]]
		if not p1:IsA("WrapLayer") then
			return
		end
		p1.Parent.Parent:Destroy()
	end
	p1.Model.DescendantAdded:Connect(function(p12) --[[ Line: 114 | Upvalues: p1 (copy), addNeck (copy), addBody (copy), t3 (ref) ]]
		if p12:IsDescendantOf(p1.Model.Animals) then
			return
		end
		addNeck(p12)
		addBody(p12)
		if not p1.IsLocal and p12:IsA("WrapLayer") then
			p12.Parent.Parent:Destroy()
		end
		if not p12:IsA("BasePart") then
			return
		end
		if p12:GetAttribute("CanTouch") then
			p12.CanTouch = true
		else
			p12.CanTouch = p1.IsLocal and p12.Name == "HumanoidRootPart" or false
		end
		p12.CanCollide = p1.IsLocal and p12.Name == "HumanoidRootPart" and true or false
		p12.CanQuery = p1.IsLocal and t3[p12.Name] or false
		p12.CastShadow = false
		if p1.IsLocal then
			return
		end
		p12.CollisionGroup = "FullyStatic"
	end)
	for k, v in pairs(p1.Model:GetDescendants()) do
		local v1, v2
		if not v:IsDescendantOf(p1.Model.Animals) then
			if not p1.IsLocal and v:IsA("WrapLayer") then
				v.Parent.Parent:Destroy()
			end
			addNeck(v)
			addBody(v)
			if v:IsA("BasePart") then
				if v:GetAttribute("CanTouch") then
					v.CanTouch = true
				else
					v1 = p1.IsLocal and v.Name == "HumanoidRootPart" or false
					v.CanTouch = v1
				end
				v2 = p1.IsLocal and v.Name == "HumanoidRootPart" and true or false
				v.CanCollide = v2
				v.CanQuery = p1.IsLocal and t3[v.Name] or false
				v.CastShadow = false
				if not p1.IsLocal then
					v.CollisionGroup = "FullyStatic"
				end
			end
		end
	end
end
function t._updateParent(p1, p2) --[[ _updateParent | Line: 167 | Upvalues: v14 (copy), CharacterRenderBin (copy) ]]
	if p1._destroyed then
		return
	end
	if not p2 and tick() < (p1._nextParentUpdate or 0) then
		return
	end
	if _G.HidePlayersAndAnimals and not p2 then
		return
	end
	p1._nextParentUpdate = tick() + 0.25
	local v1 = p1.Model.Parent
	local Characters = workspace.Characters
	p1._isRendered = true
	local _ = not p1.IsLocal
	if not p1.IsLocal then
		local SeatPart = p1.Humanoid.SeatPart
		local v2
		if SeatPart then
			v2 = SeatPart.Parent
			if v2 then
				v2 = SeatPart.Parent:HasTag("Animal")
			end
		else
			v2 = SeatPart
		end
		if not v2 and (if v14 then 350 else 650) < p1._lastDistance then
			p1._isRendered = false
			Characters = CharacterRenderBin
		end
	end
	if p2 then
		Characters = workspace.Characters
	end
	if not ((if p2 then 0 else 1.5) < tick() - (p1._lastReparent or 0)) or v1 == Characters then
		return
	end
	p1._lastReparent = tick()
	if Characters ~= CharacterRenderBin then
		p1.Model:PivotTo(CFrame.new(p1._lastPosition))
	end
	p1.Model.Parent = Characters
end
function t._updateOctree(p1) --[[ _updateOctree | Line: 216 | Upvalues: v18 (ref), v12 (copy), v16 (ref) ]]
	if tick() < (p1.NextOctreeUpdate or 0) then
		return
	end
	p1._lastPosition = p1._isRendered and p1.Root.Position or p1.Model:GetAttribute("P")
	p1._lastDistance = (v18.p - p1._lastPosition).Magnitude
	p1.NextOctreeUpdate = p1._lastDistance < 700 and tick() + 1.5 or tick() + 3
	v12:UpdateFor(p1, p1._lastPosition)
	if p1.IsLocal or not (v16 > 0) then
		return
	end
	p1:_updateParent()
end
function t.new(p1) --[[ new | Line: 233 | Upvalues: t (copy), Players (copy), v2 (copy), v1 (copy), v13 (copy), LocalPlayer (copy), v17 (ref), v9 (copy), t2 (copy), v5 (copy), addSecondaryJoints (copy), RunService (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Model = p1
	v22.Player = Players:FindFirstChild(p1.Name)
	v22.Wrapper = v2.getWrapperFromPlayer(v22.Player)
	v22.Root = p1:WaitForChild("HumanoidRootPart")
	v22.PrimaryPart = v22.Model.PrimaryPart
	v22.Humanoid = v22.Model:WaitForChild("Humanoid")
	v22._lastDistance = 0
	v22._isRendered = true
	v22.Maid = v1.new()
	local function getHorseSeat() --[[ getHorseSeat | Line: 249 | Upvalues: p1 (copy), v22 (copy) ]]
		local SeatPart = p1.Humanoid.SeatPart
		local v1 = if SeatPart then SeatPart.Parent and SeatPart.Parent:HasTag("Animal") else SeatPart
		if v1 and SeatPart:IsDescendantOf(p1) then
			return SeatPart
		end
		if not SeatPart or v22.IsLocal then
			return nil
		end
		v22:_updateParent(true)
		return nil
	end
	local SeatPart = p1.Humanoid.SeatPart
	local v3 = if SeatPart then SeatPart.Parent and SeatPart.Parent:HasTag("Animal") else SeatPart
	local v4
	if v3 and SeatPart:IsDescendantOf(p1) then
		v4 = SeatPart
	else
		if SeatPart and not v22.IsLocal then
			v22:_updateParent(true)
		end
		v4 = nil
	end
	v22.IsRiding = v4
	v22.Maid:GiveTask(p1.Humanoid:GetPropertyChangedSignal("SeatPart"):Connect(function() --[[ Line: 259 | Upvalues: p1 (copy), v22 (copy), v13 (ref) ]]
		local SeatPart = p1.Humanoid.SeatPart
		local v1 = if SeatPart then SeatPart.Parent and SeatPart.Parent:HasTag("Animal") else SeatPart
		local v2
		if v1 and SeatPart:IsDescendantOf(p1) then
			v2 = SeatPart
		else
			if SeatPart and not v22.IsLocal then
				v22:_updateParent(true)
			end
			v2 = nil
		end
		v22.IsRiding = v2
		v22.BaseC1 = if v2 then v2:WaitForChild("SeatWeld").C1 else v2
		if not v22.IsLocal or p1.Humanoid.SeatPart then
			return
		end
		v13:StopPose("Sit")
	end))
	v22.IsLocal = v22.Player == LocalPlayer
	local v52 = nil
	local function updateSeat() --[[ updateSeat | Line: 271 | Upvalues: v22 (copy), v17 (ref), v9 (ref), t2 (ref), v52 (ref), v5 (ref) ]]
		if v22.IsLocal then
			local SeatPart = v22.Humanoid.SeatPart
			v17 = if (if SeatPart then SeatPart.Parent and SeatPart.Parent:HasTag("Animal") else SeatPart) and SeatPart then SeatPart else nil
			local v3 = v17 and v17:IsDescendantOf(v22.Model)
			if v17 and not v3 then
				v9:SetCoride(true)
			elseif v17 and v3 then
				for v4, v53 in v22.Model:GetChildren() do
					if v53:IsA("BasePart") then
						v53.CollisionGroup = "FullyStatic"
					end
				end
			else
				v9:SetCoride(false)
				task.defer(function() --[[ Line: 288 | Upvalues: v22 (ref), t2 (ref) ]]
					for v1, v2 in v22.Model:GetChildren() do
						if v2:IsA("BasePart") then
							v2.CollisionGroup = "Characters"
						end
					end
					for v3, v4 in t2 do
						if v4.LIK and v4.RIK then
							v4.LIK.Enabled = false
							v4.RIK.Enabled = false
						end
					end
				end)
			end
		end
		if v22.LIK and v22.RIK then
			v22.LIK.Enabled = false
			v22.RIK.Enabled = false
			v22.SeatPart = nil
			v22.NeedsIK = nil
		end
		if v17 and (v22.NeedsIK or v22.IsLocal) or not v52 then
			return
		end
		local SeatWeld = v52:FindFirstChild("SeatWeld")
		if SeatWeld then
			v5.stop(SeatWeld)
		end
		v52 = nil
	end
	v22.Maid:GiveTask(v22.Humanoid:GetPropertyChangedSignal("SeatPart"):Connect(updateSeat))
	updateSeat()
	v22.BodyVelocity = Instance.new("BodyVelocity", v22.Root)
	v22.BodyVelocity.MaxForce = Vector3.new(0, 0, 0)
	addSecondaryJoints(v22)
	v22.NeckVector = Instance.new("Vector3Value")
	v22.Maid:GiveTask(v22.NeckVector)
	v22.VelocityVector = Instance.new("Vector3Value")
	v22.Maid:GiveTask(v22.VelocityVector)
	v22._nextRemoteOctreeUpdate = tick()
	v22.Maid:GiveTask(RunService.Heartbeat:Connect(function(p1) --[[ Line: 336 | Upvalues: v22 (copy), v17 (ref), v13 (ref), LocalPlayer (ref), v52 (ref), v5 (ref) ]]
		if not (v22.IsLocal or v17) then
			return
		end
		if not (v22.LIK and v22.RIK) then
			return
		end
		local SeatPart = v22.Humanoid.SeatPart
		local v1
		if SeatPart then
			v1 = SeatPart.Parent
			if v1 then
				v1 = SeatPart.Parent:HasTag("Animal")
			end
		else
			v1 = SeatPart
		end
		local v3 = if v1 and SeatPart then SeatPart else nil
		local SeatPart_2 = v13.SeatPart
		local v4
		if SeatPart_2 then
			v4 = SeatPart_2.Parent
			if v4 then
				v4 = SeatPart_2.Parent:HasTag("Animal")
			end
		else
			v4 = SeatPart_2
		end
		local v6 = if v4 and SeatPart_2 then SeatPart_2 else nil
		local v8 = v22.IsLocal and v22.IsRiding and true or false
		if v22.IsLocal and (v3 and v3.Name == "RiderSeat") then
			v8 = true
		end
		if v3 and v3:IsDescendantOf(LocalPlayer.Character) then
			v8 = true
		end
		if v6 and (v3 and v6.Parent == v3.Parent) then
			v8 = true
			v52 = v3
		end
		if v8 or v22.IsLocal then
			v22.NeedsIK = v8
			v22.SeatPart = v3
			v22:Step(p1)
			return
		end
		v22.LIK.Enabled = false
		v22.RIK.Enabled = false
		v22.NeedsIK = nil
		v22.SeatPart = nil
		if not v52 then
			return
		end
		local SeatWeld = v52:FindFirstChild("SeatWeld")
		if not SeatWeld then
			return
		end
		v5.stop(SeatWeld)
	end))
	v22.Maid:GiveTask(RunService.Stepped:Connect(function(p1) --[[ Line: 386 | Upvalues: v22 (copy), v17 (ref) ]]
		if not (v22.IsLocal or v17) then
			return
		end
		if not (v22.LIK and v22.RIK) then
			return
		end
		if v22.NeedsIK or v22.IsLocal then
			v22:UpdateSecondaryMotors()
		end
	end))
	v22.RootSize = v22.Root.Size
	v22.LAttachment = Instance.new("Attachment", v22.Root)
	v22.LAttachment.Position = Vector3.new(-3, 0, 0)
	v22.LAttachment.Name = "L"
	v22.RAttachment = Instance.new("Attachment", v22.Root)
	v22.RAttachment.Position = Vector3.new(3, 0, 0)
	v22.RAttachment.Name = "R"
	v22.LIK = Instance.new("IKControl", v22.Model:WaitForChild("LeftHand"))
	v22.LIK.ChainRoot = v22.Model:WaitForChild("LeftUpperArm")
	v22.LIK.EndEffector = v22.Model.LeftHand
	v22.LIK.Enabled = false
	v22.LIK.Weight = 1
	v22.LIK.SmoothTime = 0
	v22.LIK.Type = Enum.IKControlType.Transform
	v22.LIK.Pole = v22.LAttachment
	v22.LIK.Offset = CFrame.Angles(0, 0, -1.5707963267948966)
	v22.RIK = Instance.new("IKControl", v22.Model:WaitForChild("RightHand"))
	v22.RIK.ChainRoot = v22.Model:WaitForChild("RightUpperArm")
	v22.RIK.EndEffector = v22.Model.RightHand
	v22.RIK.Enabled = false
	v22.RIK.Weight = 1
	v22.RIK.Type = Enum.IKControlType.Transform
	v22.RIK.SmoothTime = 0
	v22.RIK.Pole = v22.RAttachment
	v22.RIK.Offset = CFrame.Angles(0, 0, 1.5707963267948966)
	v22.Maid:GiveTask(v22.Model:GetAttributeChangedSignal("WildMode"):Connect(function() --[[ Line: 429 | Upvalues: v22 (copy) ]]
		v22:_toggleInvisibility()
	end))
	v22:_toggleInvisibility()
	if v22.IsLocal then
		v22.Maid:GiveTask(v22.Model:GetAttributeChangedSignal("HeadLock"):Connect(function() --[[ Line: 435 | Upvalues: v22 (copy) ]]
			v22.HeadLocked = v22.Model:GetAttribute("HeadLock")
		end))
		v22.HeadLocked = v22.Model:GetAttribute("HeadLock")
	end
	t2[p1] = v22
	return v22
end
local function IsNAN(p1) --[[ IsNAN | Line: 446 ]]
	return p1 ~= p1
end
function t._mapInvisiblePart(p1, p2) --[[ _mapInvisiblePart | Line: 450 ]]
	if not p2 then
		return
	end
	if p2:IsA("BasePart") or p2:IsA("Decal") then
		p1.ObjectTransparencies[p2] = p2.Transparency
		local Transparency = p2.Transparency
	elseif p2:IsA("ParticleEmitter") or p2:IsA("Beam") then
		p1.ObjectTransparencies[p2] = p2.Transparency
		local Transparency = p2.Transparency
	else
		if not (p2:IsA("Fire") or p2:IsA("Sparkles")) then
			return nil
		end
		p1.ObjectTransparencies[p2] = p2.Enabled
	end
	return nil
end
function t._mapInvisibleParts(p1) --[[ _mapInvisibleParts | Line: 468 ]]
	if not p1._loadedInvisibleParts then
		p1._loadedInvisibleParts = true
		p1.ObjectTransparencies = {}
		local function v1(p12, p2) --[[ map | Line: 474 | Upvalues: p1 (copy), v1 (copy) ]]
			for v2, v3 in p2 and p12:GetDescendants() or p12:GetChildren() do
				p1:_mapInvisiblePart(v3)
				if v3:IsA("Accoutrement") then
					v1(v3, true)
				end
			end
		end
		v1(p1.Model)
	end
end
function t._toggleInvisibility(p1) --[[ _toggleInvisibility | Line: 486 | Upvalues: TweenService (copy) ]]
	local v1 = p1.Model:GetAttribute("WildMode")
	if not (v1 or p1._loadedInvisibleParts) then
		return
	end
	if v1 and not p1._loadedInvisibleParts then
		p1:_mapInvisibleParts()
		p1:_mapInvisiblePart(p1.Model:WaitForChild("Head"):FindFirstChild("face"))
	end
	p1.IsInvisible = v1
	local v2 = NumberSequence.new(1)
	local function set(p1, p2, p3) --[[ set | Line: 497 | Upvalues: v1 (copy), TweenService (ref), v2 (copy) ]]
		if p2 == 1 then
			return
		end
		local v12 = if p3 then p3 else v1
		local v22 = p1:IsA("ParticleEmitter") or p1:IsA("Beam")
		local v3 = typeof(p2)
		if v22 or v3 == "boolean" then
			if v3 == "boolean" then
				p1.Enabled = if v12 or not p2 then false else p2
			else
				p1.Transparency = v12 and v2 or p2
			end
		else
			local v7 = TweenInfo.new(0.25)
			local t = {}
			t.Transparency = if v12 then 1 else p2
			TweenService:Create(p1, v7, t):Play()
		end
	end
	for k, v in pairs(p1.ObjectTransparencies) do
		set(k, v)
	end
	if p1._descendantCheck then
		return
	end
	local function v3(p12) --[[ connect | Line: 516 | Upvalues: p1 (copy), set (copy), v3 (copy) ]]
		p1.Maid:GiveTask(p12.ChildAdded:Connect(function(p12_2) --[[ Line: 517 | Upvalues: p1 (ref), set (ref), v3 (ref) ]]
			if p12_2:IsA("Tool") then
				return
			end
			local v1 = p1:_mapInvisiblePart(p12_2)
			if v1 then
				set(p12_2, v1, p1.IsInvisible)
			end
			if not p12_2:IsA("Accoutrement") then
				return
			end
			v3(p12_2)
		end))
	end
	p1.Maid:GiveTask(p1.Model.ChildAdded:Connect(function(p12_2) --[[ Line: 517 | Upvalues: p1 (copy), set (copy), v3 (copy) ]]
		if p12_2:IsA("Tool") then
			return
		end
		local v1 = p1:_mapInvisiblePart(p12_2)
		if v1 then
			set(p12_2, v1, p1.IsInvisible)
		end
		if not p12_2:IsA("Accoutrement") then
			return
		end
		v3(p12_2)
	end))
	p1._descendantCheck = true
end
function t.Step(p1, p2) --[[ Step | Line: 535 | Upvalues: v13 (copy), v18 (ref), t2 (copy), v12 (copy), v7 (copy), v5 (copy), v6 (copy), v8 (copy) ]]
	if p1._destroyed then
		return
	end
	local SeatPart = p1.SeatPart
	local v1
	if p1.NeedsIK then
		local v2 = SeatPart.Parent
		local v3 = v2:IsDescendantOf(p1.Model)
		local v4 = if v3 and v2 then v2 else v2.Parent.Parent
		p1.LIK.Weight = if v3 then 1 else 0.2
		p1.RIK.Weight = if v3 then 1 else 0.2
		p1.LIK.Target = v4:FindFirstChild(if v3 then "N1" else "LeftCollarAttachment", true)
		p1.RIK.Target = v4:FindFirstChild(if v3 then "N1" else "RightCollarAttachment", true)
		p1.LIK.Pole.WorldCFrame = p1.Model.UpperTorso.CFrame * CFrame.new(-2, 0, -1)
		p1.RIK.Pole.WorldCFrame = p1.Model.UpperTorso.CFrame * CFrame.new(2, 0, -1)
		v1 = true
	else
		v1 = false
	end
	p1.LIK.Enabled = v1
	p1.RIK.Enabled = if v1 then not p1.Model:FindFirstChildOfClass("Tool") else v1
	if p1.IsLocal then
		if p1.Root.Position.Y < -2500 and not p1._poisonedPosition then
			p1._poisonedPosition = true
			p1.Root.Anchored = true
			local v10 = p1.Model:GetDescendants()
			for v11, v122 in v10 do
				if v122:IsA("BasePart") then
					v122.Velocity = Vector3.new(0, 0, 0)
				end
			end
			if v13.CurrentHorse then
				v13.CurrentHorse:SetMoveState("Idle")
			end
			p1.Model:MoveTo(p1._lastSanePosition + Vector3.new(0, 3, 0))
			for v132, v14 in v10 do
				if v14:IsA("BasePart") then
					v14.Velocity = Vector3.new(0, 0, 0)
				end
			end
			task.delay(0.5, function() --[[ Line: 586 | Upvalues: p1 (copy) ]]
				p1.Root.Anchored = false
			end)
		elseif math.abs(p1.Root.Velocity.Y) < 3 and p1.Root.Velocity.Magnitude < 5 then
			p1._poisonedPosition = nil
			p1._lastSanePosition = p1.Root.Position
		end
		if tick() >= p1._nextRemoteOctreeUpdate then
			v18 = workspace.CurrentCamera.CFrame
			p1._nextRemoteOctreeUpdate = tick() + 2
			for v15, v16 in t2 do
				v16.LocatorEnabled = false
				v16:_updateOctree()
			end
			for v17, v182 in v12:RadiusSearch(p1.Root.Position, 650) do
				local v19 = v7.getOverheadFromPlayer(v182.Player)
				if v19 then
					v182.LocatorEnabled = v182._lastDistance > 200
					v19:SetEnabled(v182.LocatorEnabled)
				end
			end
			for v21, v22 in t2 do
				if not v22.LocatorEnabled then
					local v23 = v7.getOverheadFromPlayer(v22.Player)
					if v23 then
						v23:SetEnabled(false)
					end
				end
			end
		end
	end
	p1.LocalVelocity = p1.LocalVelocity or Vector3.new(0, 0, 0)
	p1.LerpLocalVelocity = p1.LerpLocalVelocity or Vector3.new(0, 0, 0)
	local AssemblyAngularVelocity = p1.Root.AssemblyAngularVelocity
	local v26 = p1.Root.CFrame:VectorToObjectSpace((Vector3.new(AssemblyAngularVelocity.X, math.clamp(AssemblyAngularVelocity.Y, -3, 3), AssemblyAngularVelocity.Z)))
	p1.LerpLocalVelocity = p1.LerpLocalVelocity:lerp(v26, 0.05)
	if p1.IsLocal then
		v5.target(p1.VelocityVector, if p1.IsRiding then 0.65 else 0.8, if p1.IsRiding then 1.55 else 1.5, {
			Value = v26
		})
		p1.LocalVelocity = p1.VelocityVector.Value
	else
		p1.LocalVelocity = p1.LerpLocalVelocity
	end
	if not p1.IsLocal then
		return
	end
	local v29 = p1.Humanoid:GetState()
	local v30 = v6:IsSprinting() and v8.SPRINT_SPEED or (v6:IsCrouching() and v8.CROUCH_SPEED or v8.WALK_SPEED)
	if v29 == Enum.HumanoidStateType.Freefall or v29 == Enum.HumanoidStateType.Jumping then
		if p1.BodyVelocity then
			p1.BodyVelocity.MaxForce = Vector3.new(1, 0.01, 1) * p1.Root.AssemblyMass * workspace.Gravity * 10.5
			p1.BodyVelocity.Velocity = p1.Humanoid.MoveDirection * v30
		end
	else
		if p1.BodyVelocity and p1.BodyVelocity.MaxForce.Magnitude > 0 then
			p1.BodyVelocity.MaxForce = Vector3.new(0, 0, 0)
			p1.Humanoid.WalkSpeed = v30
			return
		end
		if p1.Humanoid.MoveDirection.Magnitude >= 0.1 then
			p1.Humanoid.WalkSpeed = v30
			return
		end
	end
	p1.Humanoid.WalkSpeed = 1
end
local function rotateGlobal(p1, p2, p3) --[[ rotateGlobal | Line: 666 ]]
	return p1 * CFrame.fromAxisAngle(p1:VectorToObjectSpace(p3), p2)
end
function t.SetHeadTarget(p1, p2) --[[ SetHeadTarget | Line: 671 ]] end
function t._rotateJaw(p1, p2) --[[ _rotateJaw | Line: 675 ]] end
local function updateNeck(p1, p2) --[[ updateNeck | Line: 679 | Upvalues: v6 (copy), CurrentCamera (copy), v11 (copy), v3 (copy), v5 (copy) ]]
	if v6:IsCrouching() then
		return
	end
	if not p2 then
		return
	end
	debug.profilebegin("Update Neck")
	local v1 = p1.HeadLocked and p1.Root.CFrame:PointToObjectSpace(p1.HeadLocked).Unit or p1.Root.CFrame:PointToObjectSpace((CurrentCamera.CFrame * CFrame.new(0, 0, -750)).p).Unit
	local v2 = #p1.Neck
	local v32, sum
	if v1 then
		v32 = -math.atan2(v1.x, -v1.z)
		sum = math.asin(v1.y)
	else
		v32 = p1.Model.LookDirectionX.Value / 127
		sum = p1.Model.LookDirectionY.Value / 127
	end
	if p2 and (math.abs(v32) > 2.2 and not p1.HeadLocked) then
		local ViewportSize = workspace.CurrentCamera.ViewportSize
		local X = ViewportSize.X
		local Y = ViewportSize.Y
		local p = (CurrentCamera.CFrame * CFrame.new((v11.X - X / 2) / X * 100, -(v11.Y - Y / 2) / Y * 100, 0)).p
		p1._lastMouseFollowPosition = p
		local Unit = p1.Root.CFrame:PointToObjectSpace(p).Unit
		local v8 = math.asin(Unit.y)
		v32 = -math.atan2(Unit.x, -Unit.z)
		sum = v8
	elseif not p1.IsRiding then
		sum = sum + 0.17453292519943295
	end
	local Magnitude = p1.Root.Velocity.Magnitude
	local v10, v112, v12, v13
	if p1.IsRiding then
		v10 = if p1.IsRiding then -35 else 0
		v112 = if p1.IsRiding then 25 else 32.5
		v12 = v3.map(Magnitude, 0, 30, v112, v10)
		v13 = math.clamp(v12, v10, v112)
		sum = sum + math.rad(v13)
	else
		local SeatPart = p1.Humanoid.SeatPart
		local v14
		if SeatPart then
			v14 = SeatPart.Parent
			if v14 then
				v14 = SeatPart.Parent:HasTag("Animal")
			end
		else
			v14 = SeatPart
		end
		if v14 then
			v10 = if p1.IsRiding then -35 else 0
			v112 = if p1.IsRiding then 25 else 32.5
			v12 = v3.map(Magnitude, 0, 30, v112, v10)
			v13 = math.clamp(v12, v10, v112)
			sum = sum + math.rad(v13)
		end
	end
	p1._lastHorizontal = p1._lastHorizontal or 0
	p1._lastVertical = p1._lastVertical or 0
	v5.target(p1.NeckVector, if p1.IsRiding then 0.5 else 0.8, 1.15, {
		Value = Vector3.new(sum / v2, v32 / v2, 0)
	})
	p1._lastHorizontal = p2 and p1.NeckVector.Value.Y or v3.lerp(p1._lastHorizontal, v32 / v2, 0.05)
	p1._lastVertical = p2 and p1.NeckVector.Value.X or v3.lerp(p1._lastVertical, sum / v2, 0.05)
	if p1._lastHorizontal == 0 and p1._lastVertical == 0 then
		return
	end
	local function iterateThrough(p12, p2, p3, p4) --[[ iterateThrough | Line: 745 | Upvalues: p1 (copy), v3 (ref), Magnitude (copy) ]]
		for k, v in pairs(p12) do
			local v1, v2
			local v32 = v[1].Parent
			p2 = p2 or 1
			local v4 = Vector3.new(0, 1, 0)
			local UpVector = p1.Root.CFrame.UpVector
			local UpVector_2 = v32.CFrame.UpVector
			local v5 = if UpVector_2:Dot(v4) >= UpVector:Dot(v4) then UpVector_2 else UpVector
			if p3 then
				local v6 = v32.CFrame * v[2]
				local v8 = v6:VectorToObjectSpace(v5)
				v1 = v6 * CFrame.fromAxisAngle(v8, p1._lastHorizontal * p2) or v32.CFrame * CFrame.Angles(0, p1._lastHorizontal * p2, 0)
			else
				v1 = v32.CFrame * CFrame.Angles(0, p1._lastHorizontal * p2, 0)
			end
			local v9 = v32.CFrame:Inverse() * v1 * CFrame.Angles(p1._lastVertical * p2, 0, 0)
			local Angles = CFrame.Angles
			v2 = p1.IsRiding and p4 and math.rad((math.min(v3.map(Magnitude / 30, 0, 30, 0, 90), 90))) or 0
			local v12 = v9 * Angles(v2, 0, 0)
			if not (if v12 == v12 then false else true) then
				local v14 = v[1]
				v14.Transform = v14.Transform * v12
			end
		end
	end
	iterateThrough(p1.Neck, 0.55, false, true)
	local v19, v20
	if p1.IsRiding then
		v19 = math.clamp(v3.map(Magnitude, 0, 30, 0.3, 0.5), 0.3, 0.5)
		if v19 then
			v20 = iterateThrough
		else
			v20 = iterateThrough
			v19 = 0.3
		end
	else
		v20 = iterateThrough
		v19 = 0.3
	end
	v20(p1.Waist, v19, false)
	debug.profileend()
end
function t.UpdateSecondaryMotors(p1) --[[ UpdateSecondaryMotors | Line: 781 | Upvalues: v6 (copy), v13 (copy), v5 (copy), updateNeck (copy) ]]
	if p1.IsLocal and v6:IsCrouching() then
		return
	end
	if not p1.LocalVelocity then
		return
	end
	local IsLocal = p1.IsLocal
	local v1 = if p1.NeedsIK then 1.25 else 1
	local v2 = IsLocal and p1.VelocityVector.Value or p1.LerpLocalVelocity
	for k, v in pairs(p1.Body) do
		local v3 = v[1]
		v3.Transform = v3.Transform * CFrame.Angles(math.rad(v2.X) * 20 * 0.25, math.rad(v2.Y * 4.5) * v1, math.rad(v2.Y * 3) * v1)
	end
	for k, v in pairs(p1.MiddleBody) do
		local v8 = v[1]
		v8.Transform = v8.Transform * CFrame.Angles(math.rad(v2.X) * 10 * 0.25, math.rad(v2.Y * -6.5) * v1, math.rad(v2.Y * 0) * v1)
	end
	for k, v in pairs(p1.LowerBody) do
		local v132 = v[1]
		v132.Transform = v132.Transform * CFrame.Angles(math.rad(v2.X) * 10 * 0.25, math.rad(v2.Y * -5.5) * v1, math.rad(v2.Y * 1) * v1)
	end
	if not (p1.NeedsIK and (p1.SeatPart and p1.SeatPart:FindFirstChild("SeatWeld"))) then
		return
	end
	local v18 = v13.CurrentHorse and v13.CurrentHorse.SpeedPercent or 0.5
	if p1.Root.Velocity.Magnitude < 1 then
		if not p1.IsLocal then
			return
		end
		v18 = 0
	end
	if v18 <= 0.05 and not v13.CurrentHorse then
		return
	end
	local v19 = p1.SeatPart.CFrame:VectorToObjectSpace(p1.SeatPart.Velocity.Unit)
	if v19.Magnitude <= 0.1 and not v13.CurrentHorse then
		return
	end
	local v20 = p1.IsLocal and math.sin or math.cos
	v5.target(p1.SeatPart.SeatWeld, 0.3, 2.8, {
		C1 = p1.BaseC1 + v19 * (Vector3.new(0.8, 0.8, 0.45) + Vector3.new(0, v20(tick() * 15 * v18) * 0.3, 0)) * v18
	})
	if v18 > 0.35 then
		local v24 = CFrame.Angles(math.sin(tick() * 12) * v18 * 0.045, 0, v20(tick() * 15) * v18 * 0.035)
		local v26 = CFrame.Angles(math.sin(tick() * 12 + 10) * v18 * 0.045, 0, v20(tick() * 15) * v18 * 0.035)
		local LeftHip = p1.Model.LeftUpperLeg.LeftHip
		LeftHip.Transform = LeftHip.Transform * v24
		local LeftKnee = p1.Model.LeftLowerLeg.LeftKnee
		LeftKnee.Transform = LeftKnee.Transform * v24
		local RightHip = p1.Model.RightUpperLeg.RightHip
		RightHip.Transform = RightHip.Transform * v26
		local RightKnee = p1.Model.RightLowerLeg.RightKnee
		RightKnee.Transform = RightKnee.Transform * v26
	end
	updateNeck(p1, IsLocal)
end
function t.Destroy(p1) --[[ Destroy | Line: 856 | Upvalues: t2 (copy), v12 (copy) ]]
	t2[p1.Model] = nil
	v12:Remove(p1)
	p1._destroyed = true
	p1.Maid:Destroy()
	p1.Model = nil
	p1.Root = nil
	p1.Player = nil
	setmetatable(p1, nil)
end
function t.GetClassFromModel(p1) --[[ GetClassFromModel | Line: 867 | Upvalues: t2 (copy) ]]
	return t2[p1]
end
function t.UpdateVisibility(p1) --[[ UpdateVisibility | Line: 871 | Upvalues: t2 (copy), v13 (copy) ]]
	_G.HidePlayersAndAnimals = p1
	for k, v in pairs(t2) do
		local v1
		if v.IsLocal then
			if type(p1) ~= "table" or not p1.ExcludeLocalPlayer then
				local v2 = pairs
				for v4, v5 in v2(v13.CharacterDescendants or {}) do
					if v5:IsA("BasePart") and not (v5:IsDescendantOf(v13.Character.Animals) or v5:FindFirstAncestorWhichIsA("Tool")) then
						v5.LocalTransparencyModifier = if p1 then 1 else 0
					end
				end
				local face = v13.Character.Head:FindFirstChild("face")
				if face then
					face.Transparency = if p1 then 1 else 0
				end
			end
			continue
		end
		if v.Model.PrimaryPart and v.Model:FindFirstChild("Animals") then
			local SeatPart = v.Humanoid.SeatPart
			if SeatPart then
				v1 = SeatPart.Parent
				if v1 then
					v1 = SeatPart.Parent:HasTag("Animal")
				end
			else
				v1 = SeatPart
			end
			if not (v1 and v.Humanoid.SeatPart:IsDescendantOf(v13.Character)) then
				if p1 then
					v.Model.PrimaryPart.Anchored = true
					for v9, v10 in v.Model.Animals:GetChildren() do
						if v10.PrimaryPart then
							v10.PrimaryPart.Anchored = true
						end
					end
					local p = v.Model:GetPivot().p
					v._lastCustomisePivot = p
					v.Model:PivotTo(CFrame.new(p.X, p.Y + 250, p.Z))
					continue
				end
				v.Model.PrimaryPart.Anchored = false
				for v11, v12 in v.Model.Animals:GetChildren() do
					if v12.PrimaryPart then
						v12.PrimaryPart.Anchored = false
					end
				end
				if v._lastCustomisePivot and (v._lastCustomisePivot - v.Model:GetAttribute("P")).Magnitude < 5 then
					v.Model:PivotTo(CFrame.new(v._lastCustomisePivot))
				end
			end
		end
	end
end
Sonar("Binder").new(v8.CharacterTag, t):Init()
return t