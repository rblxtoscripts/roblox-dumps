-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local v3 = Sonar("Constants")
local LocalPlayer = game.Players.LocalPlayer
local CornModel = v3[v3.EventName].MinigameData.CornModel
local t = {}
local t2 = {}
t.__index = t
function t.Init() --[[ Init | Line: 18 | Upvalues: v1 (copy), t (copy) ]]
	v1.new("Corn", t):Init()
end
function t.GetAllCorn() --[[ GetAllCorn | Line: 23 | Upvalues: t2 (copy) ]]
	return t2
end
function t.new(p1) --[[ new | Line: 27 | Upvalues: t (copy), v2 (copy), LocalPlayer (copy), CornModel (copy), t2 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Object = p1
	v22.ParentName = p1.Parent.Name
	v22.Maid = v2.new()
	v22.Owner = p1:WaitForChild("Data").Owner.Value
	if p1:WaitForChild("Data").Owner.Value == LocalPlayer.Name then
		v22.Object.Point.Flare:Emit(1)
		v22.Model = CornModel:Clone()
		v22.Model:PivotTo(p1.CFrame)
		v22.Model.Parent = workspace
		v22.Maid:GiveTask(v22.Model)
		v22.IsAlive = p1:WaitForChild("Data").IsAlive.Value
		v22.IsTargeted = false
		v22.Int = Instance.new("NumberValue")
		v22.Int.Value = 0
		game:GetService("TweenService"):Create(v22.Int, TweenInfo.new(5, Enum.EasingStyle.Circular), {
			Value = 1.2
		}):Play()
		v22.Maid:GiveTask(v22.Int:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 50 | Upvalues: v22 (copy) ]]
			v22.Model:ScaleTo(v22.Int.Value)
			if not (v22.Int.Value >= 1.2) then
				return
			end
			v22.Int:Destroy()
		end))
		v22.Maid:GiveTask(p1:WaitForChild("Data").IsAlive:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 58 | Upvalues: v22 (copy), p1 (copy) ]]
			v22.IsAlive = p1:WaitForChild("Data").IsAlive.Value
			if v22.IsAlive then
				return
			end
			for v1, v2 in v22.Model:GetChildren() do
				v2.Transparency = 1
			end
		end))
	end
	v22.Maid:GiveTask(function() --[[ Line: 69 | Upvalues: t2 (ref), v22 (copy) ]]
		table.remove(t2, table.find(t2, v22))
	end)
	local v3 = t2
	table.insert(v3, v22)
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 78 ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
t.Init()
return t