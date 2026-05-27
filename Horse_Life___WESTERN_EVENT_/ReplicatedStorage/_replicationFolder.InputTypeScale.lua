-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("InputTypeService")
local INPUT_TYPES = v3.INPUT_TYPES
function t.new(p1, p2) --[[ new | Line: 54 | Upvalues: t (copy), v1 (copy), INPUT_TYPES (copy), v3 (copy) ]]
	assert(p1, "\226\154\160\239\184\143 InputTypeScale, Object is required")
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Configuration = p1
	v2.Config = if p2 then p2 else {}
	v2.Object = if p1:IsA("GuiObject") and p1 then p1 else p1.Parent
	local v5 = false
	for v6, v7 in INPUT_TYPES do
		if v2.Configuration:GetAttribute(v6) or v2.Config[v6] then
			if INPUT_TYPES[v6] then
				v5 = true
				break
			end
			warn("\226\154\160\239\184\143 InputTypeScale, Invalid device type attribute:", v6)
		end
	end
	if not v5 then
		warn("\226\154\160\239\184\143 InputTypeScale, No scale attributes found for any device type on:", p1:GetFullName())
	end
	v2.OriginalSize = v2.Configuration:GetAttribute("OriginalSize") or v2.Object.Size
	v2.Maid:GiveTask(v3.InputTypeChanged:Connect(function() --[[ Line: 84 | Upvalues: v2 (copy) ]]
		v2:_updateScale()
	end))
	v2:_updateScale()
	return v2
end
function t._updateScale(p1) --[[ _updateScale | Line: 97 | Upvalues: v3 (copy) ]]
	local v1 = v3.GetInputTypeName()
	if not v1 then
		return
	end
	local v2 = p1.Config[v1] or (p1.Configuration:GetAttribute(v1) or 1)
	if p1.Object:IsA("UIScale") then
		p1.Object.Scale = v2
		return
	end
	if not p1.Object:IsA("GuiObject") then
		return
	end
	p1.Object.Size = UDim2.new(p1.OriginalSize.X.Scale * v2, p1.OriginalSize.X.Offset * v2, p1.OriginalSize.Y.Scale * v2, p1.OriginalSize.Y.Offset * v2)
end
function t.Destroy(p1) --[[ Destroy | Line: 117 | Upvalues: v2 (copy) ]]
	v2(p1)
end
return t