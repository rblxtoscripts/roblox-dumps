-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("EventUtils")
local v4 = Sonar("Global")
local t2 = {}
v4.WorldspaceGuiEnabled = true
function t.new(p1) --[[ new | Line: 65 | Upvalues: t (copy), v1 (copy), v3 (copy), t2 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Config = p1
	v2.Instance = p1.Instance
	if not v2.Instance then
		warn("\226\154\160\239\184\143 WorldspaceGui, Instance is required for worldspace gui", p1)
		return v2
	end
	if v2.Config.Visible then
		v2.Changed = v3.getConnectionEvents(v2.Config.Changed)
		for k, v in pairs(v2.Changed) do
			if v then
				v2.Maid:GiveTask(v:Connect(function() --[[ Line: 80 | Upvalues: v2 (copy) ]]
					v2:_updateVisibility()
				end))
			end
		end
	end
	v2:_updateVisibility()
	t2[v2.Instance] = v2
	return v2
end
function t._updateVisibility(p1) --[[ _updateVisibility | Line: 97 | Upvalues: v4 (copy) ]]
	if not p1.Instance then
		return
	end
	local WorldspaceGuiEnabled = v4.WorldspaceGuiEnabled
	if WorldspaceGuiEnabled then
		WorldspaceGuiEnabled = p1.Config.Visible()
	end
	p1.Instance.Enabled = WorldspaceGuiEnabled
end
function t.SetVisibility(p1) --[[ SetVisibility | Line: 114 | Upvalues: v4 (copy), t2 (copy) ]]
	v4.WorldspaceGuiEnabled = p1
	for k, v in pairs(t2) do
		v:_updateVisibility()
	end
end
function t.IsEnabled() --[[ IsEnabled | Line: 125 | Upvalues: v4 (copy) ]]
	return v4.WorldspaceGuiEnabled
end
function t.Destroy(p1) --[[ Destroy | Line: 132 | Upvalues: t2 (copy), v2 (copy) ]]
	t2[p1.Instance] = nil
	v2(p1)
end
return t