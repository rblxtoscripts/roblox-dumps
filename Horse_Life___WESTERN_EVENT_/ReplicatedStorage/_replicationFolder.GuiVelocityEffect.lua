-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("spr")
local v4 = Sonar("MathUtils")
local LocalPlayer = game:GetService("Players").LocalPlayer
local CurrentCamera = workspace.CurrentCamera
local v5 = nil
local t2 = {}
local function getCharacterVelocity() --[[ getCharacterVelocity | Line: 32 | Upvalues: LocalPlayer (copy) ]]
	local Character = LocalPlayer.Character
	if not Character then
		return
	end
	local PrimaryPart = Character.PrimaryPart
	if PrimaryPart then
		return PrimaryPart.AssemblyLinearVelocity
	end
end
function t.new(p1) --[[ new | Line: 42 | Upvalues: t (copy), v1 (copy), t2 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Configuration = p1
	v2.Frame = if p1:IsA("GuiObject") and p1 then p1 else p1.Parent
	v2.DefaultPosition = v2.Configuration:GetAttribute("DefaultPosition") or v2.Frame.Position
	v2.Multiplier = v2.Configuration:GetAttribute("VelocityMultiplier") or 1
	t2[p1] = v2
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 57 | Upvalues: t2 (copy), v2 (copy) ]]
	t2[p1.Frame] = nil
	v2(p1)
end
function t._move(p1, p2) --[[ _move | Line: 62 | Upvalues: v4 (copy), CurrentCamera (copy), v5 (ref), v3 (copy) ]]
	local v2 = CurrentCamera.CFrame:VectorToObjectSpace(p2.Unit * v4.map(p2.Magnitude, 20, 100, 0, 2, true) * p1.Multiplier)
	local v32, v42, v52
	if v5 then
		local v6, v7, v8 = v5(v2)
		v32 = v7
		v42 = v8
		v52 = v6
	else
		v32 = nil
		v42 = nil
		v52 = v2
	end
	v3.target(p1.Frame, 0.3 * (v32 or 1), 1.4 * p1.Multiplier * (v42 or 1), {
		Position = UDim2.new(p1.DefaultPosition.X.Scale + -v52.X / 120, p1.DefaultPosition.X.Offset, p1.DefaultPosition.Y.Scale + v52.Y / 155, p1.DefaultPosition.Y.Offset)
	})
end
function t.SetRandomDeviation(p1) --[[ SetRandomDeviation | Line: 78 | Upvalues: v5 (ref) ]]
	v5 = p1
end
function t.Init(p1) --[[ Init | Line: 82 | Upvalues: RunService (copy), t2 (copy), LocalPlayer (copy) ]]
	RunService.Heartbeat:Connect(function() --[[ Line: 83 | Upvalues: t2 (ref), LocalPlayer (ref) ]]
		if not next(t2) then
			return
		end
		local Character = LocalPlayer.Character
		local v1
		if Character then
			local PrimaryPart = Character.PrimaryPart
			v1 = if PrimaryPart then PrimaryPart.AssemblyLinearVelocity else nil
		else
			v1 = nil
		end
		if not v1 then
			return
		end
		for v2, v3 in t2 do
			v3:_move(v1)
		end
	end)
end
t:Init()
return t