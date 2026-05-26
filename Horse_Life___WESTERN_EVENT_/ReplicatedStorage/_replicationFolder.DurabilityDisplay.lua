-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("Maid")
local v3 = Sonar("EventUtils")
local v4 = Sonar("safeDestroy")
local t = {}
t.__index = t
local v5 = ColorSequence.new(Color3.fromRGB(222, 102, 102), Color3.fromRGB(159, 191, 94))
function t.new(p1) --[[ new | Line: 77 | Upvalues: t (copy), v2 (copy), v1 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.Config = v1.GetComponentConfig(p1, "Durability")
	v22.Instance = p1.Instance
	if not v22.Instance then
		warn("\226\154\160\239\184\143 DurabilityDisplay, Instance is required for durability display", p1)
		return v22
	end
	v22.DurabilityLabel = p1.DurabilityLabel or v1.FindElement(v22.Instance, "DurabilityLabel")
	if not v22.DurabilityLabel then
		return v22
	end
	v22.ItemDataProvider = p1.ItemDataProvider
	v22.Item = if v22.ItemDataProvider then v22.ItemDataProvider:GetValue("Data") else nil
	v22:_init()
	return v22
end
function t._init(p1) --[[ _init | Line: 101 | Upvalues: v5 (copy), v1 (copy), v3 (copy) ]]
	p1.DurabilityLabel.Visible = true
	local v12 = if p1.Config.Color == false then nil else p1.Config.Color or v5
	local t = {
		Instance = p1.DurabilityLabel,
		Get = function() --[[ Get | Line: 109 | Upvalues: p1 (copy) ]]
			local v1, v2
			if p1.Config.Get then
				local v3, v4 = p1.Config.Get(p1)
				v1 = v3
				v2 = v4
			else
				v1 = nil
				v2 = nil
			end
			if p1.ItemDataProvider then
				if not v1 then
					v1 = p1.ItemDataProvider:GetValue("Durability")
				end
				if not v2 then
					v2 = p1.Item.Durability
				end
			end
			return v1, v2
		end,
		Changed = function() --[[ Changed | Line: 129 | Upvalues: v3 (ref), p1 (copy) ]]
			local v1 = v3.getConnectionEvents(p1.Config.Changed)
			if p1.ItemDataProvider then
				table.insert(v1, p1.ItemDataProvider:GetValueChangedSignal("Durability"))
			end
			return v1
		end
	}
	t.OnChanged = p1.Config.OnChanged and (function(p12, p2) --[[ Line: 136 | Upvalues: p1 (copy) ]]
		p1.Config.OnChanged(p1, p2)
	end)
	t.Color = v12
	t.AmountLabel = p1.Config.AmountLabel
	t.Format = p1.Config.Format
	p1.Maid:GiveTask(v1.AddComponent("AnimatedBar", t))
end
function t.Destroy(p1) --[[ Destroy | Line: 145 | Upvalues: v4 (copy) ]]
	v4(p1)
end
return t