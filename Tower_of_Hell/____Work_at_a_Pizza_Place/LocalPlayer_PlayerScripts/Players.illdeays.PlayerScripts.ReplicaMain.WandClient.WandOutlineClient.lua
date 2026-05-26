-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CreateOutlinePartClient = require(script.CreateOutlinePartClient)
require(ReplicatedStorage._v6FiRE_Additions.Manager.Wand.WandShared)
local IsHoldingWand = ReplicatedStorage._v6FiRE_Additions.Manager.Wand.Client.IsHoldingWand
local t = {}
t.__index = t
function t.new(p1) --[[ new | Line: 11 | Upvalues: t (copy), IsHoldingWand (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Replica = p1
	v2.TargetPart = p1.Tags.Target
	v2.OutlinePart = nil
	v2.Connections = {}
	local v3, v4
	if v2.TargetPart then
		v3 = IsHoldingWand.Event:Connect(function(p1_2) --[[ Line: 24 | Upvalues: v2 (copy) ]]
			if p1_2 then
				v2:Show()
			else
				v2:Hide()
			end
		end)
		v4 = v2.Connections
		table.insert(v4, v3)
		p1:AddCleanupTask(function() --[[ Line: 33 | Upvalues: v2 (copy) ]]
			v2:Destroy()
		end)
		return v2
	end
	warn("WandOutline created for a replica with no TargetPart tag")
	v3 = IsHoldingWand.Event:Connect(function(p1_2) --[[ Line: 24 | Upvalues: v2 (copy) ]]
		if p1_2 then
			v2:Show()
		else
			v2:Hide()
		end
	end)
	v4 = v2.Connections
	table.insert(v4, v3)
	p1:AddCleanupTask(function() --[[ Line: 33 | Upvalues: v2 (copy) ]]
		v2:Destroy()
	end)
	return v2
end
function t.Show(p1) --[[ Show | Line: 41 | Upvalues: CreateOutlinePartClient (copy) ]]
	p1:Hide()
	if not p1.TargetPart then
		return
	end
	p1.OutlinePart = CreateOutlinePartClient.CreateOutlinePart(p1.Replica)
end
function t.Hide(p1) --[[ Hide | Line: 51 ]]
	if not p1.OutlinePart then
		return
	end
	p1.OutlinePart:Destroy()
	p1.OutlinePart = nil
end
function t.Destroy(p1) --[[ Destroy | Line: 59 ]]
	p1:Hide()
	for i, v in ipairs(p1.Connections) do
		v:Disconnect()
	end
	table.clear(p1.Connections)
	p1.Replica = nil
	p1.TargetPart = nil
end
return t