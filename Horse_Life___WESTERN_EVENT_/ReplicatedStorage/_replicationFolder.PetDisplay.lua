-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("safeDestroy")
local v2 = Sonar("Maid")
local v3 = Sonar("GuiFrameworkService")
local v4 = Sonar("ItemDataService")
local v5 = Sonar("FormatString")
local v6 = Sonar("PetService")
local v7 = Sonar("TableUtils")
function t.new(p1) --[[ new | Line: 17 | Upvalues: t (copy), v2 (copy), v3 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.Context = p1
	v22.Config = v3.GetComponentConfig(p1, "PetDisplay")
	v22.Instance = p1.Instance
	if not v22.Instance then
		warn("\226\154\160\239\184\143 PetDisplay, Instance is required", p1)
		return v22
	end
	v22.ItemDisplay = v22.Maid:GiveTask(v3.AddComponent("ItemDisplay", v22))
	v22.ItemDataProvider = v22.ItemDisplay.ItemDataProvider
	v22.DataValue = v22.ItemDataProvider:GetValue("DataValue")
	v22.VariantLabel = v3.FindElement(v22.Instance, "VariantLabel")
	v22.Maid:GiveTask(v22.ItemDataProvider:GetValueChangedSignal("Variant"):Connect(function() --[[ Line: 38 | Upvalues: v22 (copy) ]]
		v22:_setVariant()
	end))
	v22:_setVariant()
	v22.GrowthFrame = v3.FindElement(v22.Instance, "GrowthFrame")
	v22.AgeLabel = v3.FindElement(v22.GrowthFrame, "AgeLabel")
	if v22.GrowthFrame then
		v22.Maid:GiveTask(v3.AddComponent("AnimatedBar", {
			Direction = "LeftToRight",
			Instance = v22.GrowthFrame,
			Get = function() --[[ Get | Line: 49 | Upvalues: v22 (copy) ]]
				return v22.ItemDataProvider:GetValue("Age")
			end,
			GetMax = function() --[[ GetMax | Line: 52 ]]
				return 200
			end,
			Changed = { v22.ItemDataProvider:GetValueChangedSignal("Age") },
			OnChanged = function() --[[ OnChanged | Line: 58 | Upvalues: v22 (copy) ]]
				v22:_setAge()
			end
		}))
	else
		v22.Maid:GiveTask(v22.ItemDataProvider:GetValueChangedSignal("Age"):Connect(function() --[[ Line: 64 | Upvalues: v22 (copy) ]]
			v22:_setAge()
		end))
		v22:_setAge()
	end
	v22.TraitsFrame = v3.FindElement(v22.Instance, "TraitsFrame")
	v22.TraitsLabel = v3.FindElement(v22.TraitsFrame, "TraitsLabel")
	v22.TraitsDataFolder = v22.DataValue and v22.DataValue:FindFirstChild("Traits")
	if v22.TraitsDataFolder then
		v22.Maid:GiveTask(v22.TraitsDataFolder.ChildRemoved:Connect(function(p1) --[[ Line: 75 | Upvalues: v22 (copy) ]]
			v22:_setTraits()
		end))
		v22.Maid:GiveTask(v22.TraitsDataFolder.ChildAdded:Connect(function(p1) --[[ Line: 78 | Upvalues: v22 (copy) ]]
			v22:_setTraits()
		end))
		v22:_setTraits()
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 87 | Upvalues: v1 (copy) ]]
	v1(p1)
end
function t._setAge(p1) --[[ _setAge | Line: 91 | Upvalues: v6 (copy) ]]
	local v1 = p1.ItemDataProvider:GetValue("Age")
	if not p1.AgeLabel then
		return
	end
	p1.AgeLabel.Text = v6.GetGrowthStageFromAge(v1) .. " (" .. (if v1 >= 200 then "MAX" else v1) .. ")"
end
function t._getVariant(p1) --[[ _getVariant | Line: 99 | Upvalues: v4 (copy) ]]
	return v4.GetByName((p1.ItemDataProvider:GetValue("Variant")))
end
function t._setVariant(p1) --[[ _setVariant | Line: 106 | Upvalues: v2 (copy), v5 (copy) ]]
	if not p1.VariantLabel then
		return
	end
	if not p1.VariantMaid then
		p1.VariantMaid = v2.new()
		p1.Maid:GiveTask(p1.VariantMaid)
	end
	p1.VariantMaid:DoCleaning()
	local v1 = p1:_getVariant()
	if not v1 or v1 == "" then
		p1.VariantLabel.Text = "None"
		return
	end
	p1.VariantLabel.Text = v5.GetDisplayName(v1)
	if not v1.RefAssets[v1.UIGradient] then
		return
	end
	local UIGradient = p1.VariantLabel:FindFirstChild("UIGradient")
	if UIGradient then
		UIGradient.Color = v1.RefAssets[v1.UIGradient].Color
		return
	end
	local v22 = v1.RefAssets[v1.UIGradient]:Clone()
	v22.Parent = p1.VariantLabel
	p1.VariantMaid:GiveTask(v22)
end
function t._setTraits(p1) --[[ _setTraits | Line: 137 | Upvalues: v2 (copy), v4 (copy), v3 (copy), v7 (copy) ]]
	if not p1.TraitsMaid then
		p1.TraitsMaid = v2.new()
		p1.Maid:GiveTask(p1.TraitsMaid)
	end
	p1.TraitsMaid:DoCleaning()
	if not p1.TraitsDataFolder then
		return
	end
	local t = {}
	if p1.TraitsLabel then
		local t2 = {}
		for v1, v22 in p1.TraitsDataFolder:GetChildren() do
			local v32 = v4.GetByName(v22.Name)
			if v32 then
				table.insert(t2, (v4.GetDisplayName(v32, v22)))
				t[v32.Name] = v32
			end
		end
		p1.TraitsLabel.Text = if #t2 > 0 then table.concat(t2, ", ") or "None" else "None"
	end
	if not next(t) then
		return
	end
	p1.TraitsMaid:GiveTask(v3.AddComponent("ToolTip", {
		Type = "Description",
		Instance = p1.TraitsFrame,
		Text = v7.Concat(t, "\n", function(p1) --[[ Line: 170 ]]
			return p1.Description
		end)
	}))
end
return t