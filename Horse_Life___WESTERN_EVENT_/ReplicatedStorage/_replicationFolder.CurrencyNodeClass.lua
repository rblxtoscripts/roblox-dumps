-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local v3 = Sonar("MathUtils")
local v4 = Sonar("RemoteUtils")
local v5 = Sonar("Octree")
local v6 = Sonar("EventUtils")
local v7 = Sonar("InputTypeDetector")
local v8 = Sonar("CurrencyNodeClient")
local v9 = Sonar("Constants")
local v10 = if v7.IsMobileInputType() then 75 else 175
local v11 = Sonar("PlayerWrapper").GetClient()
local t2 = {}
local SpawnedFolder = v8.SpawnedFolder
local v12 = v4.GetRemoteEvent("GetCurrencyNodeRemote")
local v13 = v5.new("Drops", 4, 512)
local t3 = {
	Experience = {
		Stack = 0,
		LastTime = 0
	}
}
local function createDownwardTween(p1, p2, p3) --[[ createDownwardTween | Line: 40 | Upvalues: TweenService (copy) ]]
	local v1 = TweenInfo.new(p3, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0)
	local CFrameValue = Instance.new("CFrameValue")
	CFrameValue.Value = p1:GetPivot()
	CFrameValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 45 | Upvalues: p1 (copy), CFrameValue (copy) ]]
		p1:PivotTo(CFrameValue.Value)
	end)
	local v2 = TweenService:Create(CFrameValue, v1, {
		Value = CFrame.new(p2)
	})
	v2.Completed:Connect(function() --[[ Line: 50 | Upvalues: CFrameValue (copy) ]]
		CFrameValue:Destroy()
	end)
	return v2
end
local function handleBounce(p1, p2, p3, p4) --[[ handleBounce | Line: 57 | Upvalues: TweenService (copy) ]]
	p1.FinishedAnimatingBounce = false
	local v1 = TweenInfo.new(p4 / 2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, false, 0)
	local v2 = TweenInfo.new(p4 / 2, Enum.EasingStyle.Quad, Enum.EasingDirection.In, 0, false, 0)
	local Position = p2:GetPivot().Position
	local CFrameValue = Instance.new("CFrameValue")
	CFrameValue.Value = CFrame.new(Position)
	CFrameValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 66 | Upvalues: p2 (copy), CFrameValue (copy) ]]
		p2:PivotTo(CFrameValue.Value)
	end)
	local v3 = TweenService:Create(CFrameValue, v1, {
		Value = CFrame.new(Position + Vector3.new(0, p3, 0))
	})
	local v4 = TweenService:Create(CFrameValue, v2, {
		Value = CFrame.new(Position)
	})
	v3.Completed:Connect(function() --[[ Line: 77 | Upvalues: v4 (copy), CFrameValue (copy), p1 (copy) ]]
		v4:Play()
		v4.Completed:Connect(function() --[[ Line: 79 | Upvalues: CFrameValue (ref), p1 (ref) ]]
			CFrameValue:Destroy()
			p1.FinishedAnimatingBounce = true
		end)
	end)
	v3:Play()
end
local function playSound(p1) --[[ playSound | Line: 88 | Upvalues: ReplicatedStorage (copy), v9 (copy), t3 (copy) ]]
	local v1 = ReplicatedStorage.Storage.SFX.Currency:FindFirstChild(p1 .. "Sound") or ReplicatedStorage.Storage.SFX.Currency.CoinsSound
	if not v1 then
		return
	end
	local v2 = v1:Clone()
	local v3 = tick()
	local v4 = if v9.CurrencyNodes[p1] then v9.CurrencyNodes[p1].Currency or "" else ""
	local v5
	if t3[v4] then
		local v6 = 1 + t3[v4].Stack * 0.115
		v5 = math.clamp(v6, 1, 2.35)
		local v7 = t3[v4]
		v7.Stack = v7.Stack + 1
		t3[v4].LastTime = v3
		task.delay(2, function() --[[ Line: 108 | Upvalues: t3 (ref), v4 (copy), v3 (copy) ]]
			if t3[v4].LastTime == v3 then
				t3[v4].Stack = 0
			end
		end)
	else
		v5 = 1
	end
	v2.PlaybackSpeed = v5
	v2.Parent = script
	local v8 = nil
	v8 = v2.Ended:Connect(function() --[[ Line: 121 | Upvalues: v8 (ref), v2 (ref) ]]
		v8:Disconnect()
		v8 = nil
		v2:Destroy()
	end)
	v2:Play()
end
local function setPVInstanceCanTouch(p1, p2) --[[ setPVInstanceCanTouch | Line: 130 ]]
	if p1:IsA("BasePart") then
		p1.CanTouch = p2
		return
	end
	for v1, v2 in p1:GetDescendants() do
		if v2:IsA("BasePart") then
			v2.CanTouch = p2
		end
	end
end
local function tweenPVInstanceTransparency(p1, p2, p3) --[[ tweenPVInstanceTransparency | Line: 142 | Upvalues: TweenService (copy) ]]
	if p1:IsA("BasePart") then
		TweenService:Create(p1, p2, {
			Transparency = p3
		}):Play()
		return
	end
	for v1, v2 in p1:GetDescendants() do
		if v2:IsA("BasePart") then
			TweenService:Create(v2, p2, {
				Transparency = p3
			}):Play()
		end
	end
end
function t.new(p1) --[[ new | Line: 154 | Upvalues: t (copy), v2 (copy), ReplicatedStorage (copy), SpawnedFolder (copy), v11 (copy), v8 (copy), v9 (copy), playSound (copy), v12 (copy), v13 (copy), t2 (copy) ]]
	local v1 = t
	local v22 = setmetatable({}, v1)
	v22.Maid = v2.new()
	v22.CoinName = p1.Name
	if v22.CoinName == "CloverCoin" then
		v22.CoinName = "GuildCoin"
	end
	local v3 = ReplicatedStorage.Storage.Assets.CurrencyNodes:FindFirstChild(v22.CoinName)
	if not v3 then
		return v22
	end
	v22.Part = p1
	v22.Type = p1.Name
	v22.AnimateIn = tick() - p1:GetAttribute("SpawnTick") < 1
	v22.Particles = {}
	v22.Model = v3:Clone()
	for v5, v6 in v22.Model:GetDescendants() do
		if v6:IsA("ParticleEmitter") then
			table.insert(v22.Particles, v6)
		end
	end
	if v22.Model:IsA("BasePart") then
		v22.Size = v22.Model.Size
	else
		v22.Size = v22.Model:GetExtentsSize()
	end
	local Position = v22.Part:GetPivot().Position
	v22.targetPosition = Position + Vector3.new(0, v22.Size.Y / 2 - 1, 0)
	local v82 = v22.Size.Y * 2
	v22.Hitbox = Instance.new("Part")
	v22.Hitbox.Size = Vector3.new(v82, v82, v82)
	v22.Hitbox.Shape = "Ball"
	v22.Hitbox.Anchored = true
	v22.Hitbox.Transparency = 1
	v22.Hitbox.CanCollide = false
	v22.Hitbox.CanTouch = false
	v22.Hitbox.CanQuery = false
	v22.Hitbox.Position = v22.targetPosition
	v22.Hitbox.Parent = SpawnedFolder
	v22.Maid:GiveTask(v22.Hitbox)
	v22.Maid:GiveTask(v22.Model)
	v22.LastTouch = tick()
	v22.Maid:GiveTask(v22.Hitbox.Touched:Connect(function(p1) --[[ Line: 204 | Upvalues: v11 (ref), v22 (copy), v8 (ref), v9 (ref), t (ref), playSound (ref), v12 (ref) ]]
		if not (v11:IsLocalPlayerFromTouched(p1) or v11.CurrentHorse and p1:IsDescendantOf(v11.CurrentHorse.Model)) then
			return
		end
		if not v22.AnimatedIn then
			return
		end
		if tick() - v22.LastTouch < 1 then
			return
		end
		v22.LastTouch = tick()
		local v2 = v8.getSpawnNode(v22.Part)
		if not v2 then
			return
		end
		if not v2:_canClaim() then
			return
		end
		if not v9.CurrencyNodes[v22.Part.Name] or v9.CurrencyNodes[v22.Part.Name].Currency ~= "Coins" then
			playSound(v22.CoinName)
			v2:_claimed()
			v12:FireServer(v22.Part)
			return
		end
		t.LastCoinPickUp = tick()
		playSound(v22.CoinName)
		v2:_claimed()
		v12:FireServer(v22.Part)
	end))
	v22.t = 0
	v22.RotateFactor = if math.random() > 0.5 then -1 else 1
	v13:Add(v22, v22.targetPosition)
	v22.Maid:GiveTask(function() --[[ Line: 244 | Upvalues: v13 (ref), v22 (copy) ]]
		v13:Remove(v22)
	end)
	t2[v22.Model] = v22
	if v22.AnimateIn then
		v22:SpawnIn()
	else
		v22.AnimatedIn = true
		v22.Model:PivotTo(CFrame.new(v22.targetPosition))
		v22.Model.Parent = SpawnedFolder
	end
	v22.FinishedAnimatingBounce = true
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 264 | Upvalues: t2 (copy) ]]
	p1:DropClaimed()
	t2[p1.Model] = nil
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.SpawnIn(p1) --[[ SpawnIn | Line: 272 | Upvalues: SpawnedFolder (copy), createDownwardTween (copy), handleBounce (copy) ]]
	p1.Model:PivotTo(CFrame.new(p1.Part:GetPivot().Position - Vector3.new(0, 20, 0)))
	p1.Model.Parent = SpawnedFolder
	local Model = p1.Model
	local v1 = createDownwardTween(Model, p1.targetPosition, 0.5)
	v1.Completed:Connect(function() --[[ Line: 283 | Upvalues: handleBounce (ref), p1 (copy), Model (copy) ]]
		handleBounce(p1, Model, 10, 0.5)
		p1.AnimatedIn = true
	end)
	v1:Play()
end
local t4 = {}
local t5 = {}
local t6 = {}
local t7 = {}
function t.Rotate(p1, p2) --[[ Rotate | Line: 296 | Upvalues: t4 (ref), t5 (ref), t6 (ref), t7 (ref) ]]
	if p1.Claimed then
		return
	end
	if not p1.AnimatedIn then
		return
	end
	if not p1.FinishedAnimatingBounce then
		return
	end
	p1.t = p1.t + p2 * p1.RotateFactor
	local t = p1.t
	local v1 = CFrame.new(p1.targetPosition) * CFrame.Angles(0, t, 0) * CFrame.Angles(0.39269908169872414 * math.sin(t), 0, 0)
	if p1.Model:IsA("BasePart") then
		local v2 = #t4 + 1
		t4[v2] = p1.Model
		t5[v2] = v1
	else
		local v3 = #t6 + 1
		t6[v3] = p1.Model
		t7[v3] = v1
	end
end
function t.DropClaimed(p1) --[[ DropClaimed | Line: 324 | Upvalues: v11 (copy), v10 (copy), RunService (copy), v3 (copy), tweenPVInstanceTransparency (copy), TweenService (copy) ]]
	if p1.Claimed then
		return
	end
	p1.Claimed = true
	if v10 * 1.5 < (v11.PrimaryPart.Position - p1.Model:GetPivot().Position).Magnitude then
		p1:Destroy()
	else
		p1.Model:PivotTo(CFrame.new(p1.Model:GetPivot().Position))
		task.spawn(function() --[[ Line: 336 | Upvalues: p1 (copy), RunService (ref) ]]
			while p1.Model.Parent do
				RunService.Heartbeat:Wait()
				local v1 = p1.Model:GetPivot()
				local v2, v3, v4 = v1:ToEulerAnglesYXZ()
				p1.Model:PivotTo(CFrame.new(v1.Position) * CFrame.fromEulerAnglesYXZ(v2, v3 + 0.8726646259971648, v4))
			end
		end)
		local Model = p1.Model
		local function getRandomEndPosition(p1, p2) --[[ getRandomEndPosition | Line: 348 | Upvalues: Model (copy) ]]
			local v1 = math.random() * p2 - p2 / 2
			local v2 = math.random() * p2 - p2 / 2
			local Position = Model:GetPivot().Position
			return Vector3.new(Position.X + v1, Position.Y - p1, Position.Z + v2)
		end
		local v1 = math.random() * 5 - 2.5
		local v2 = math.random() * 5 - 2.5
		local Position = Model:GetPivot().Position
		local v6 = Vector3.new(Position.X + v1, Position.Y - 15, Position.Z + v2)
		local Position_2 = Model:GetPivot().Position
		local v7 = Position_2.Y + 25
		local v8 = (v6.Y - v7) / 0.25
		local v9 = 0
		local v102 = nil
		local function setPosition(p1) --[[ setPosition | Line: 368 | Upvalues: v9 (ref), v8 (copy), v7 (copy), Position_2 (copy), v6 (copy), Model (copy), v102 (ref) ]]
			if v9 < 1.2 then
				v9 = v9 + p1
				local v1 = v9 / 1.2
				Model:PivotTo(CFrame.new((Vector3.new((1 - v1) * Position_2.X + v1 * v6.X, v8 * (v1 - 0.5) ^ 2 + v7, (1 - v1) * Position_2.Z + v1 * v6.Z))))
			else
				v102:Disconnect()
			end
		end
		v102 = game:GetService("RunService").Heartbeat:Connect(setPosition)
		p1.Maid:GiveTask(v102)
		setPosition(0)
		local Transparency = p1.Model.Attachment.Glow.Transparency
		local v112 = v3.normalizeToConstant(p1.Model.Attachment.Glow.Transparency, 1)
		local v12 = Instance.new("NumberValue")
		v12.Value = 0
		p1.Maid:GiveTask(v12)
		p1.Maid:GiveTask(v12:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 398 | Upvalues: p1 (copy), v3 (ref), Transparency (copy), v112 (copy), v12 (copy) ]]
			for k, v in pairs(p1.Model:GetDescendants()) do
				if v:IsA("ParticleEmitter") then
					v.Transparency = v3.interpolateNumberSequences(Transparency, v112, v12.Value)
				end
			end
		end))
		task.delay(0.5, function() --[[ Line: 405 | Upvalues: tweenPVInstanceTransparency (ref), p1 (copy), TweenService (ref), v12 (copy) ]]
			tweenPVInstanceTransparency(p1.Model, TweenInfo.new(1.2), 1)
			TweenService:Create(v12, TweenInfo.new(0.5), {
				Value = 1
			}):Play()
		end)
		task.wait(3)
		p1:Destroy()
	end
end
function t.Init(p1) --[[ Init | Line: 415 | Upvalues: RunService (copy), t4 (ref), t5 (ref), t6 (ref), t7 (ref), v6 (copy), v11 (copy), v13 (copy), v10 (copy), setPVInstanceCanTouch (copy), t2 (copy), v1 (copy), t (copy) ]]
	local v12 = nil
	RunService.Heartbeat:Connect(function(p1) --[[ Line: 417 | Upvalues: v12 (ref), t4 (ref), t5 (ref), t6 (ref), t7 (ref) ]]
		if not v12 then
			return
		end
		for k, v in pairs(v12) do
			if v.Rotate then
				v:Rotate(p1)
			end
		end
		workspace:BulkMoveTo(t4, t5, Enum.BulkMoveMode.FireCFrameChanged)
		for v1, v2 in t6 do
			v2:PivotTo(t7[v1])
		end
		t4 = {}
		t5 = {}
		t6 = {}
		t7 = {}
	end)
	v6.spawnLoopWithoutYielding(function() --[[ Line: 441 | Upvalues: v11 (ref), v12 (ref), v13 (ref), v10 (ref), setPVInstanceCanTouch (ref), t2 (ref) ]]
		v12 = v13:RadiusSearch(v11.PrimaryPart and v11.PrimaryPart.Position or workspace.CurrentCamera.CFrame.Position, v10)
		local t = {}
		for v2, v3 in v12 do
			t[v3.Model] = true
			v3.Hitbox.CanTouch = true
			setPVInstanceCanTouch(v3.Model, true)
			for v4, v5 in v3.Particles do
				if not v3.Claimed then
					v5.Enabled = true
				end
			end
		end
		for v6, v7 in t2 do
			if not t[v7.Model] then
				v7.Hitbox.CanTouch = false
				setPVInstanceCanTouch(v7.Model, false)
				for v8, v9 in v7.Particles do
					v9.Enabled = false
				end
			end
		end
	end, 0.5)
	v1.new("SpawnedCurrencyDrop", t):Init()
end
t.LastCoinPickUp = 0
t:Init()
return t