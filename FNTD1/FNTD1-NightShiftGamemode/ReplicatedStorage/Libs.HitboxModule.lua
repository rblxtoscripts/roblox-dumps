-- https://lua.expert/
local GoodSignal = require(script.GoodSignal)
local RunService = game:GetService("RunService")
local t = {}
t.__index = t
local t2 = {}
local v1 = OverlapParams.new()
v1.CollisionGroup = "Path"
function t.FindHitbox(p1, p2) --[[ FindHitbox | Line: 161 | Upvalues: t2 (copy) ]]
	if t2[p2] then
		return t2[p2]
	end
end
function t.Visualize(p1) --[[ Visualize | Line: 167 ]]
	if not p1.Visualizer then
		return
	end
	local v1 = p1.CFrame
	if typeof(v1) == "Instance" then
		v1 = v1.CFrame
	end
	if p1.Shape == Enum.PartType.Ball then
		p1.Box = Instance.new("SphereHandleAdornment")
		p1.Box.Radius = p1.Size
	elseif p1.Shape == Enum.PartType.Block then
		p1.Box = Instance.new("BoxHandleAdornment")
		p1.Box.Size = p1.Size
	end
	p1.Box.Name = "Visualizer"
	p1.Box.CFrame = v1 * p1.Offset
	p1.Box.Adornee = workspace.Terrain
	p1.Box.Color3 = Color3.fromRGB(255, 0, 0)
	p1.Box.Transparency = 0.8
	p1.Box.Parent = workspace
end
function t.UpdateVisualizer(p1) --[[ UpdateVisualizer | Line: 191 ]]
	if not p1.Visualizer then
		return
	end
	local v1 = p1.CFrame
	if typeof(v1) == "Instance" then
		v1 = v1.CFrame
	end
	p1.Box.CFrame = v1 * p1.Offset
end
function t.Cast(p1) --[[ Cast | Line: 203 ]]
	local v1 = nil
	local DetectionMode = p1.DetectionMode
	local v2 = p1.CFrame
	if typeof(v2) == "Instance" then
		v2 = v2.CFrame
	end
	if p1.Shape == Enum.PartType.Block then
		v1 = workspace:GetPartBoundsInBox(v2 * p1.Offset, p1.Size, p1.OverlapParams)
	elseif p1.Shape == Enum.PartType.Ball then
		v1 = workspace:GetPartBoundsInRadius(v2.p + p1.Offset.p, p1.Size, p1.OverlapParams)
	end
	for k, v in pairs(v1) do
		local v5 = v:FindFirstAncestorOfClass("Model") or v.Parent
		local Humanoid = v5:FindFirstChildOfClass("Humanoid")
		if DetectionMode == "Default" then
			if v5 and (Humanoid and not p1.HitList[table.find(p1.HitList, Humanoid)]) then
				table.insert(p1.HitList, Humanoid)
				p1.Touched:Fire(v, Humanoid)
			end
			continue
		end
		if DetectionMode == "ConstantDetection" then
			if v5 and Humanoid then
				p1.Touched:Fire(v, Humanoid)
			end
			continue
		end
		if DetectionMode == "HitOnce" then
			if v5 and Humanoid then
				p1.Touched:Fire(v, Humanoid)
				p1:Stop()
				return
			end
			continue
		end
		if DetectionMode == "HitParts" then
			p1.Touched:Fire(v)
		end
	end
end
function t.CreateHitbox() --[[ CreateHitbox | Line: 244 | Upvalues: GoodSignal (copy), v1 (copy), t (copy) ]]
	return setmetatable({
		Box = nil,
		Key = nil,
		Size = Vector3.new(0, 0, 0),
		Visualizer = true,
		Connection = nil,
		DetectionMode = "Default",
		CFrame = CFrame.new(0, 0, 0),
		Offset = CFrame.new(0, 0, 0),
		Touched = GoodSignal.new(),
		OverlapParams = v1,
		HitList = {},
		Shape = Enum.PartType.Block
	}, t)
end
function t.Start(p1) --[[ Start | Line: 261 | Upvalues: t2 (copy), RunService (copy) ]]
	if t2[p1.Key] then
		warn("A hitbox with this Key has already been started. Change the key if you want to start this hitbox.")
		return
	end
	if p1.Key then
		t2[p1.Key] = p1
	end
	p1:Visualize()
	if p1.OverlapParams and p1.OverlapParams.FilterType == Enum.RaycastFilterType.Exclude then
		local t = {}
		t[1] = table.unpack(p1.OverlapParams.FilterDescendantsInstances)
		t[2] = p1.Box
		p1.OverlapParams.FilterDescendantsInstances = t
	elseif not p1.OverlapParams then
		p1.OverlapParams.FilterType = Enum.RaycastFilterType.Exclude
		p1.OverlapParams.FilterDescendantsInstances = { p1.Box }
	end
	p1.Connection = RunService.Heartbeat:Connect(function() --[[ Line: 281 | Upvalues: p1 (copy) ]]
		p1:Cast()
		p1:UpdateVisualizer()
	end)
end
function t.Stop(p1) --[[ Stop | Line: 287 | Upvalues: t2 (copy) ]]
	p1.HitList = {}
	p1.Touched:DisconnectAll()
	if p1.Key then
		t2[p1.Key] = nil
	end
	if p1.Connection then
		p1.Connection:Disconnect()
	end
	if not p1.Box then
		return
	end
	p1.Box:Destroy()
end
function t.Destroy(p1) --[[ Destroy | Line: 304 ]]
	p1:Stop()
	table.clear(p1)
	setmetatable(p1, nil)
end
return t