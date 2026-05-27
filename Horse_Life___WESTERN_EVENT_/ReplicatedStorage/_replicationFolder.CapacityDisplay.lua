-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("safeDestroy")
local v2 = Sonar("Maid")
local v3 = Sonar("GuiFrameworkService")
local v4 = Sonar("EventUtils")
function t.new(p1) --[[ new | Line: 16 | Upvalues: t (copy), v2 (copy), v3 (copy), v4 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.Config = p1
	v22.Instance = p1.Instance
	if not v22.Instance then
		warn("\226\154\160\239\184\143 CapacityDisplay, Instance is required", p1)
		return v22
	end
	if v22.Instance:IsA("TextButton") or v22.Instance:IsA("ImageButton") then
		v22.Maid:GiveTask(v3.AddComponent("Button", {
			Instance = v22.Instance,
			OnClick = function() --[[ OnClick | Line: 31 | Upvalues: v22 (copy) ]]
				v22:_openGui()
			end
		}))
	end
	v22.Button = v3.FindElement(v22.Instance, "Button")
	if v22.Button then
		v22.Maid:GiveTask(v3.AddComponent("Button", {
			Instance = v22.Button,
			OnClick = function() --[[ OnClick | Line: 41 | Upvalues: v22 (copy) ]]
				v22:_openGui()
			end
		}))
	end
	if v22.Config.ButtonVisibility then
		v22.ButtonVisibilityChanged = v4.getConnectionEvents(v22.Config.ButtonVisibilityChanged or {})
		for v42, v5 in v22.ButtonVisibilityChanged do
			v22.Maid:GiveTask(v5:Connect(function() --[[ Line: 49 | Upvalues: v22 (copy) ]]
				v22:_setButtonVisibility()
			end))
		end
	end
	v22:_setButtonVisibility()
	if v22.Config.OnChanged then
		if type(v22.Config.OnChanged) == "function" then
			v22.Config.OnChanged = { v22.Config.OnChanged }
		end
	else
		v22.Config.OnChanged = {}
	end
	v22.AnimatedValueDisplay = v3.AddComponent("AnimatedValueDisplay", v22.Config)
	v22.Maid:GiveTask(v22.AnimatedValueDisplay)
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 70 | Upvalues: v1 (copy) ]]
	v1(p1)
end
function t._setButtonVisibility(p1) --[[ _setButtonVisibility | Line: 74 ]]
	if not p1.Button then
		return
	end
	p1.Button.Visible = if p1.Config.ButtonVisibility then p1.Config.ButtonVisibility(p1) else true
end
function t.Update(p1) --[[ Update | Line: 87 ]]
	p1.AnimatedValueDisplay:Update()
end
function t._openGui(p1) --[[ _openGui | Line: 93 ]]
	if not p1.Config.OnClick then
		return
	end
	p1.Config.OnClick()
end
return t