-- https://lua.expert/
local t = {}
t.__index = t
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("Signal")
local v3 = Sonar("EventUtils")
local v4 = Sonar("PlayerWrapper")
local v5 = Sonar("RemoteUtils")
local v6 = v4.GetClient()
local t2 = {}
local v7 = nil
local v8 = 0
local v9 = v5.GetRemoteEvent("InteractZoneTimeReport")
local function reportZoneTime(p1) --[[ reportZoneTime | Line: 29 | Upvalues: v9 (copy) ]]
	if p1 then
		v9:FireServer(p1)
	end
end
local InteractZones = workspace.InteractZones
local v10 = RaycastParams.new()
v10.IncludeInstances = { InteractZones }
v10.IgnoreWater = true
local v11 = v2.new()
local function canCheckZones() --[[ canCheckZones | Line: 42 | Upvalues: v6 (copy) ]]
	if not v6.PrimaryPart then
		return
	end
	if v6.PrimaryPart.Parent then
		return true
	end
end
local function getZone() --[[ getZone | Line: 50 | Upvalues: v6 (copy), v10 (copy), InteractZones (copy), t2 (copy) ]]
	local v2 = workspace:Raycast(Vector3.new(v6.PrimaryPart.Position.X, -299, v6.PrimaryPart.Position.Z), Vector3.new(0, -2, 0), v10)
	if not (v2 and v2.Instance) then
		return
	end
	local v3 = v2.Instance
	while v3 and v3 ~= InteractZones do
		for v4, v5 in t2 do
			if v5.ZoneFolder == v3 then
				return v5
			end
		end
		v3 = v3.Parent
	end
end
local function runLoop() --[[ runLoop | Line: 72 | Upvalues: v6 (copy), getZone (copy), v7 (ref), v8 (ref), v9 (copy) ]]
	local v1 = (if v6.PrimaryPart then if v6.PrimaryPart.Parent then true else nil else nil) and getZone()
	if v1 ~= v7 and v7 then
		v7:_unfocusZone(v1)
	end
	if v1 and v7 ~= v1 then
		v1:_focusZone()
	end
	if not (v7 and (v7.EnterTime and tick() - v8 >= 60)) then
		return
	end
	local Type = v7.Type
	if Type then
		v9:FireServer(Type)
	end
	v8 = tick()
	v7.EnterTime = tick()
end
function t.new(p1) --[[ new | Line: 90 | Upvalues: t (copy), InteractZones (copy), v1 (copy), v2 (copy), t2 (copy) ]]
	local v22 = setmetatable(p1, t)
	v22.ZoneFolder = v22.Zone or InteractZones:WaitForChild(v22.Type)
	v22.Maid = v1.new()
	v22.OnZoneEntered = v2.new()
	v22.Maid:GiveTask(v22.OnZoneEntered)
	if v22.OnEntered then
		v22.OnZoneEntered:Connect(v22.OnEntered)
	end
	v22.OnZoneLeft = v2.new()
	v22.Maid:GiveTask(v22.OnZoneLeft)
	if v22.OnLeave then
		v22.OnZoneLeft:Connect(v22.OnLeave)
	end
	local function update(p1) --[[ update | Line: 108 ]]
		if p1:IsA("BasePart") then
			p1.Position = p1.Position * Vector3.new(1, 0, 1) + Vector3.new(0, -300, 0)
			p1.Size = p1.Size * Vector3.new(1, 0, 1)
		end
	end
	v22.Maid:GiveTask(v22.ZoneFolder.ChildAdded:Connect(update))
	for v4, v5 in v22.ZoneFolder:GetChildren() do
		if v5:IsA("BasePart") then
			v5.Position = v5.Position * Vector3.new(1, 0, 1) + Vector3.new(0, -300, 0)
			v5.Size = v5.Size * Vector3.new(1, 0, 1)
		end
	end
	if v22:_isFocused() then
		v22.OnZoneEntered:Fire()
	else
		v22.OnZoneLeft:Fire()
	end
	t2[v22.Type] = v22
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 129 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t._focusZone(p1, p2) --[[ _focusZone | Line: 135 | Upvalues: v7 (ref), v11 (copy) ]]
	v7 = p1
	p1.EnterTime = tick()
	p1.OnZoneEntered:Fire()
	v11:Fire(p1)
end
function t._unfocusZone(p1, p2) --[[ _unfocusZone | Line: 144 | Upvalues: v9 (copy), v7 (ref), v11 (copy) ]]
	if p1.EnterTime then
		local Type = p1.Type
		if Type then
			v9:FireServer(Type)
		end
		p1.EnterTime = nil
	end
	v7 = nil
	p1.OnZoneLeft:Fire()
	if p2 then
		return
	end
	v11:Fire()
end
function t._isFocused(p1) --[[ _isFocused | Line: 158 | Upvalues: v7 (ref) ]]
	return v7 == p1
end
function t.IsInZone(p1) --[[ IsInZone | Line: 162 | Upvalues: t2 (copy) ]]
	local v1 = t2[p1]
	if v1 then
		return v1:_isFocused()
	end
end
function t.GetZoneFromName(p1) --[[ GetZoneFromName | Line: 169 | Upvalues: t2 (copy) ]]
	return t2[p1]
end
function t.GetOrCreateZone(p1) --[[ GetOrCreateZone | Line: 173 | Upvalues: InteractZones (copy), t2 (copy), t (copy) ]]
	if not (p1.Zone or InteractZones:FindFirstChild(p1.Type)) then
		return
	end
	local v1 = t2[p1.Type]
	if not v1 then
		return t.new(p1)
	end
	if p1.OnEntered then
		v1.OnZoneEntered:Connect(p1.OnEntered)
		if v1:_isFocused() then
			task.spawn(p1.OnEntered)
		end
	end
	if p1.OnLeave then
		v1.OnZoneLeft:Connect(p1.OnLeave)
		if not v1:_isFocused() then
			task.spawn(p1.OnLeave)
		end
	end
	return v1
end
v3.spawnLoop(runLoop, 2)
t.OnZoneChanged = v11
return t