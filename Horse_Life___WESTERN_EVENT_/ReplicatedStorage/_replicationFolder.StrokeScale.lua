-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("Cancelable")
local CurrentCamera = workspace.CurrentCamera
local t2 = {}
function t.new(p1) --[[ new | Line: 22 | Upvalues: t (copy), v1 (copy), t2 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Instance = p1.Instance
	v2.Config = p1
	v2.UIStroke = v2.Instance:IsA("UIStroke") and v2.Instance or v2.Instance:FindFirstChildOfClass("UIStroke")
	if v2.UIStroke then
		v2.Updating = false
		v2.Maid:GiveTask(v2.UIStroke:GetPropertyChangedSignal("Thickness"):Connect(function() --[[ Line: 36 | Upvalues: v2 (copy) ]]
			v2:_setOriginalThickness()
		end))
		v2:_setOriginalThickness()
		v2:UpdateThickness()
		t2[v2.Instance] = v2
	else
		warn("\226\154\160\239\184\143 StrokeScale, No UIStroke found in the instance")
	end
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 49 | Upvalues: t2 (copy), v2 (copy) ]]
	t2[p1.Instance] = nil
	v2(p1)
end
function t._setOriginalThickness(p1) --[[ _setOriginalThickness | Line: 54 ]]
	local Updating = p1.Updating
	p1.Updating = false
	if not Updating then
		p1.OriginalThickness = p1.UIStroke.Thickness
		p1.ThicknessScale = p1.OriginalThickness / 1804
	end
end
function t.UpdateThickness(p1) --[[ UpdateThickness | Line: 67 | Upvalues: CurrentCamera (copy) ]]
	p1.Updating = true
	p1.UIStroke.Thickness = math.max(0.1, CurrentCamera.ViewportSize.X * p1.ThicknessScale)
	p1.UIStroke.Thickness = math.min(p1.UIStroke.Thickness, p1.OriginalThickness)
end
function t.Init(p1) --[[ Init | Line: 73 | Upvalues: v3 (copy), t2 (copy), CurrentCamera (copy) ]]
	local v1 = v3.new(function() --[[ Line: 74 | Upvalues: t2 (ref) ]]
		task.wait(0.25)
		for v1, v2 in t2 do
			v2:UpdateThickness()
		end
	end)
	CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(v1)
end
t:Init()
return t