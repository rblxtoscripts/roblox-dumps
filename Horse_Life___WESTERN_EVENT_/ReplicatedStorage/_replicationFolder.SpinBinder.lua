-- https://lua.expert/
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local t = {}
t.__index = t
local t2 = {}
local function getBossFromSpinner(p1) --[[ getBossFromSpinner | Line: 14 | Upvalues: Sonar (copy) ]]
	local v1 = p1:GetAttribute("BossModel")
	if v1 and v1.Parent then
		return v1
	end
	for v2, v3 in Sonar("Mob").GetAll() do
		if v3.IsBoss and (v2:HasTag("Boss") and (p1:GetPivot().Position - v2.Position).Magnitude < 100) then
			return v2
		end
	end
	return nil
end
local function canSpawnSpinner(p1) --[[ canSpawnSpinner | Line: 33 | Upvalues: getBossFromSpinner (copy), Sonar (copy) ]]
	local v1 = getBossFromSpinner(p1)
	if not v1 then
		return true
	end
	local v2 = v1:GetAttribute("Attacking")
	if not v2 then
		return true
	end
	local v3 = Sonar("Mob")
	if v3._canSpawnSpinnerStatic then
		return v3._canSpawnSpinnerStatic(v1, v2)
	else
		return true
	end
end
function t.new(p1) --[[ new | Line: 52 | Upvalues: getBossFromSpinner (copy), Sonar (copy), t (copy), v2 (copy), t2 (copy) ]]
	local v1 = getBossFromSpinner(p1)
	local v22
	if v1 then
		local v3 = v1:GetAttribute("Attacking")
		if v3 then
			local v4 = Sonar("Mob")
			v22 = if v4._canSpawnSpinnerStatic then v4._canSpawnSpinnerStatic(v1, v3) else true
		else
			v22 = true
		end
	else
		v22 = true
	end
	if not v22 then
		p1:Destroy()
		return nil
	end
	local v7 = setmetatable({}, t)
	v7.Object = p1
	v7.Maid = v2.new()
	v7.SpinSpeed = p1:GetAttribute("SpinSpeed") or 0.4
	v7.InitialCFrame = p1:GetPivot()
	v7.CurrentRotation = 0
	t2[p1] = v7
	local v8 = getBossFromSpinner(p1)
	if not v8 then
		return v7
	end
	local v9 = Sonar("Mob")
	if not v9._registerSpinnerStatic then
		return v7
	end
	v9._registerSpinnerStatic(v8, p1)
	return v7
end
function t.Destroy(p1) --[[ Destroy | Line: 84 | Upvalues: t2 (copy) ]]
	t2[p1.Object] = nil
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
function t.Init() --[[ Init | Line: 92 | Upvalues: v1 (copy), t (copy) ]]
	v1.new("Spin", t):Init()
end
RunService.Heartbeat:Connect(function() --[[ Line: 98 | Upvalues: t2 (copy) ]]
	for v1, v2 in t2 do
		if v1 and v1.Parent then
			v2.CurrentRotation = v2.CurrentRotation + math.rad(v2.SpinSpeed)
			v1:PivotTo(v2.InitialCFrame * CFrame.Angles(0, v2.CurrentRotation, 0))
		end
	end
end)
t.Init()
return t