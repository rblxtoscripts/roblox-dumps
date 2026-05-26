-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local v3 = Sonar("Octree")
local t = {}
t.__index = t
local Butterflies = Instance.new("Folder", workspace)
Butterflies.Name = "Butterflies"
local t2 = {}
local v4 = v3.new("ButterflyNode", 2, 256)
local v5 = TweenInfo.new(10)
local t3 = {
	{ Color3.fromRGB(255, 96, 194), Color3.fromRGB(255, 162, 164) },
	{ Color3.fromRGB(103, 169, 255), Color3.fromRGB(151, 232, 255) },
	{ Color3.fromRGB(255, 126, 62), Color3.fromRGB(255, 207, 84) },
	{ Color3.fromRGB(116, 118, 255), Color3.fromRGB(172, 157, 255) },
	{ Color3.fromRGB(255, 255, 255), Color3.fromRGB(255, 240, 222) }
}
function t.new(p1) --[[ new | Line: 45 | Upvalues: t (copy), v2 (copy), v4 (copy), t3 (copy), Butterflies (copy), t2 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Root = p1
	v22.Maid = v2.new()
	v4:Add(v22, p1.Position)
	v22.Size = p1.Size
	v22.Position = p1.Position
	v22._lastUpdate = tick()
	v22.Flies = {}
	for i = 1, math.random(2, 4) do
		local v3 = game.ReplicatedStorage.Storage.Assets.Butterfly:Clone()
		v3.CollisionGroup = "FullyStatic"
		v3.Position = v22:_getRandomPosition() + v3.Size * Vector3.new(0, 0.5, 0)
		local v42 = t3[math.random(#t3)]
		v3.ButterflyL.Color = ColorSequence.new(v42[1])
		v3.ButterflyR.Color = ColorSequence.new(v42[2])
		v3.Parent = Butterflies
		v22.Maid:GiveTask(v3)
		table.insert(v22.Flies, v3)
	end
	v22:Enable()
	t2[p1] = v22
	return v22
end
function t._setEnabled(p1, p2) --[[ _setEnabled | Line: 82 | Upvalues: Butterflies (copy) ]]
	for k, v in pairs(p1.Flies) do
		for k2, v2 in pairs(v:GetChildren()) do
			v2.Enabled = p2
		end
		v.Parent = p2 and Butterflies or nil
	end
end
function t.Enable(p1) --[[ Enable | Line: 91 ]]
	p1._enabled = true
	p1:_setEnabled(p1._enabled)
end
function t.Disable(p1) --[[ Disable | Line: 96 ]]
	p1._enabled = false
	p1:_setEnabled(p1._enabled)
end
function t._getRandomPosition(p1) --[[ _getRandomPosition | Line: 101 ]]
	local v1 = p1.Size * 0.5
	return p1.Position + Vector3.new(math.random(-v1.X, v1.X), v1.Y / 2, math.random(-v1.Z, v1.Z))
end
function t.Update(p1) --[[ Update | Line: 111 | Upvalues: TweenService (copy), v5 (copy) ]]
	if not p1._enabled then
		return
	end
	if tick() - p1._lastUpdate < 10 then
		return
	end
	p1._lastUpdate = tick()
	local v1 = p1:_getRandomPosition()
	for k, v in pairs(p1.Flies) do
		local v2 = math.random(-1, 1)
		TweenService:Create(v, v5, {
			Position = v1 + v.Size * Vector3.new(v2, 0.5, math.random(-1, 1))
		}):Play()
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 126 | Upvalues: v4 (copy), t2 (copy) ]]
	v4:Remove(p1)
	t2[p1.Root] = nil
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
if UserInputService.TouchEnabled then
	return {}
else
	local v6 = tick()
	local t4 = {}
	game:GetService("RunService").Heartbeat:Connect(function(p1) --[[ Line: 138 | Upvalues: v6 (ref), t4 (ref), v4 (copy) ]]
		if v6 <= tick() then
			t4 = v4:RadiusSearch(workspace.CurrentCamera.CFrame.p, 300)
			v6 = tick() + 5
		end
		for k, v in pairs(t4) do
			if v.Update then
				v:Update()
			end
		end
	end)
	v1.new("ButterflyNode", t):Init()
	return t
end