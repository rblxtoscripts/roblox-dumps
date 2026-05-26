-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("Binder")
local v3 = Sonar("Maid")
local v4 = Sonar("spr")
local v5 = Sonar("Effects")
local v6 = Sonar("PlayerWrapper").GetClient()
function t.new(p1) --[[ new | Line: 16 | Upvalues: t (copy), v3 (copy), ReplicatedStorage (copy), v6 (copy), v5 (copy), v4 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v3.new()
	v2.Index = tonumber(p1.Name)
	v2.CanDestroy = true
	v2.Model = ReplicatedStorage.WorldStorage.TouchNodeEvent.NodeModel:Clone()
	v2.Model:PivotTo(p1.CFrame * CFrame.Angles(0, math.rad((math.random(1, 360))), 0) + Vector3.new(0, -2, 0))
	v2.PrimaryPart = v2.Model:WaitForChild("TouchPart")
	v2.PrimaryPart.CollisionGroup = "Boosts"
	v2.PrimaryPart.CanTouch = true
	v2.Maid:GiveTask(v2.PrimaryPart.Touched:Connect(function(p1) --[[ Line: 29 | Upvalues: v6 (ref), v2 (copy) ]]
		if not v6:GetCurrentAnimal() then
			return
		end
		if v6:IsLocalPlayerFromTouched(p1) then
			v2:Touched()
		end
	end))
	v2.Model.Parent = workspace.Events.TouchNodes.SpawnedNodes
	v2.Maid:GiveTask(v2.Model)
	v2.Maid:GiveTask(p1:GetAttributeChangedSignal("D"):Connect(function() --[[ Line: 39 | Upvalues: v2 (copy), v5 (ref), v4 (ref) ]]
		v2.CanDestroy = false
		v5.emitEffectAt("TouchNodeDestroyed", workspace.Terrain, v2.Model.PrimaryPart.CFrame)
		v4.target(v2.Model, 1, 1, {
			Scale = 0.01
		})
		task.wait(2)
		v2.CanDestroy = true
	end))
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 54 ]]
	if not p1.CanDestroy then
		repeat
			task.wait()
		until p1.CanDestroy
	end
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.Touched(p1) --[[ Touched | Line: 63 | Upvalues: v1 (copy) ]]
	v1.GetRemoteFunction("HitTouchNodeRemote"):InvokeServer(p1.Index)
end
function t.Init(p1) --[[ Init | Line: 67 | Upvalues: v2 (copy), t (copy) ]]
	v2.new("TouchNode", t):Init()
end
t:Init()
return t