-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("Binder")
local v3 = Sonar("ItemGridButton")
local v4 = Sonar("PlushMachine")
local v5 = Sonar("ButtonTest")
local v6 = Sonar("ItemDataService")
local v7 = Sonar("PlushMachineService")
local v8 = Sonar("GridSort")
local v9 = Sonar("Button")
local v10 = Sonar("GuiUtils")
local v11 = Sonar("PlayerWrapper").GetClient()
local t2 = {}
local t3 = {}
function t.new(p1) --[[ new | Line: 26 | Upvalues: t (copy), v1 (copy), v10 (copy), v8 (copy), v7 (copy), Sonar (copy), v5 (copy), v4 (copy), t2 (copy), t3 (copy), v3 (copy), v6 (copy), v9 (copy), v11 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Gui = p1
	v10.ParentToWorkspaceGui(p1)
	v2.LayoutSort = v8.new({
		Filters = {
			All = true
		},
		Sorts = {
			Alphabet = {
				DisplayName = "Name",
				Reversable = true,
				Run = function(p1, p2, p3) --[[ Run | Line: 42 ]]
					local v1 = p1.NameLabel.Text:lower()
					local v2 = p2.NameLabel.Text:lower()
					if p3 then
						return v2 < v1
					else
						return v1 < v2
					end
				end,
				Changed = function(p1) --[[ Changed | Line: 53 ]]
					return p1.NameLabel:GetPropertyChangedSignal("Text")
				end
			}
		},
		EmptyString = {
			Text = "You do not have any horses!",
			Label = v2.Gui:WaitForChild("Frame").ContainerFrame:WaitForChild("Menu"):WaitForChild("Items"):WaitForChild("EmptyLabel")
		}
	})
	v2.Maid:GiveTask(v2.LayoutSort)
	for k, v in pairs(v7.AllSlots) do
		v2.LayoutSort:AddFilter(v, {
			EmptyString = "You have no materials of this type!",
			Run = function(p1) --[[ Run | Line: 68 | Upvalues: v (copy) ]]
				return v == p1.Item.MaterialType
			end
		})
	end
	v2.LayoutSort:Sort("Alphabet")
	v2.Slots = {}
	for k, v in pairs(v7.AllSlots) do
		local v32 = v2.Gui:WaitForChild("Frame").ContainerFrame:WaitForChild("Menu"):WaitForChild("Content"):WaitForChild("Default"):Clone()
		v2.Gui:WaitForChild("Frame").ContainerFrame:WaitForChild("Menu"):WaitForChild("Content"):WaitForChild("Default").Visible = false
		v32.Empty.Content.SlotLabel.Text = Sonar("FormatString").separateWordsInString(v) .. " Slot"
		v32.Content.Content.SlotLabel.Text = Sonar("FormatString").separateWordsInString(v) .. " Slot"
		v2.Maid:GiveTask(v5.new(v32.Empty.Content.AddButton, {
			Click = function() --[[ Click | Line: 84 | Upvalues: v2 (copy), v (copy) ]]
				v2.Gui.Frame.ContainerFrame.Menu.Content.Visible = false
				v2.Gui.Frame.ContainerFrame.Menu.Items.Visible = true
				v2.LayoutSort:Filter(v)
			end
		}))
		v2.Maid:GiveTask(v5.new(v32.Content.Content.RemoveButton, {
			Click = function() --[[ Click | Line: 92 | Upvalues: v4 (ref), v2 (copy), v (copy) ]]
				v4.RemoveMaterial(v2.Slots[v].Material)
			end
		}))
		v32.Name = v
		v32.Visible = true
		v32.Parent = v2.Gui:WaitForChild("Frame").ContainerFrame:WaitForChild("Menu"):WaitForChild("Content")
		v2.Maid:GiveTask(v32)
		v2.Slots[v] = {
			Frame = v32,
			Maid = v1.new()
		}
	end
	v2.Maid:GiveTask(v5.new(v2.Gui.Frame.ContainerFrame.Menu.Items.EmptyLabel.BackButton, {
		Click = function() --[[ Click | Line: 109 | Upvalues: v2 (copy) ]]
			v2.Gui.Frame.ContainerFrame.Menu.Content.Visible = true
			v2.Gui.Frame.ContainerFrame.Menu.Items.Visible = false
		end
	}))
	v2.Gui.Frame.ContainerFrame.Menu.Content.Visible = true
	v2.Gui.Frame.ContainerFrame.Menu.Items.Visible = false
	v2.CreatedMaterials = {}
	v2.Maid:GiveTask(v4.MaterialsChangedSignal:Connect(function() --[[ Line: 119 | Upvalues: v2 (copy) ]]
		v2:Update()
	end))
	v2:Update()
	local function createItem(p1, p2) --[[ createItem | Line: 125 | Upvalues: t2 (ref), t3 (ref), v3 (ref), v6 (ref), v2 (copy), v9 (ref), v4 (ref) ]]
		if t2[p1] then
			return
		end
		if t3[p1] then
			return
		end
		t3[p1] = true
		local v1
		if not p2 then
			task.wait()
		end
		v1 = v3.new({
			Item = v6.GetByName(p1.Name),
			DataValue = p1,
			ParentFrame = v2.Gui:WaitForChild("Frame").ContainerFrame:WaitForChild("Menu"):WaitForChild("Items")
		})
		v1:GiveTask(v9.new(v1.Frame, {
			Click = function() --[[ Click | Line: 141 | Upvalues: v2 (ref), v4 (ref), p1 (copy) ]]
				v2.Gui.Frame.ContainerFrame.Menu.Content.Visible = true
				v2.Gui.Frame.ContainerFrame.Menu.Items.Visible = false
				v4.AddMaterial(p1.Name)
			end
		}))
		t2[p1] = v1
		t3[p1] = nil
		v2.LayoutSort:Add(v1, p2)
	end
	local function removeItem(p1) --[[ removeItem | Line: 154 | Upvalues: t2 (ref), v4 (ref), v2 (copy) ]]
		if t2[p1] then
			v4.RemoveMaterial(p1.Name)
			v2.LayoutSort:Remove(t2[p1])
			t2[p1]:Destroy()
			t2[p1] = nil
		end
	end
	for k, v in pairs(v6.GetType("Resources")) do
		if v7.GetMaterialType(k) then
			local v42 = v11:GetItemValue(k, "Resources")
			if v42 then
				v2.Maid:GiveTask(v42:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 173 | Upvalues: v42 (copy), createItem (copy), t2 (ref), v4 (ref), v2 (copy) ]]
					if v42.Value > 0 then
						createItem(v42)
						return
					end
					local v1 = v42
					if t2[v1] then
						v4.RemoveMaterial(v1.Name)
						v2.LayoutSort:Remove(t2[v1])
						t2[v1]:Destroy()
						t2[v1] = nil
					end
				end))
				if v42.Value > 0 then
					createItem(v42, true)
				end
				continue
			end
			warn("No item value found for", k, "Resources")
		end
	end
	v2.LayoutSort:Filter("All")
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 190 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.Update(p1) --[[ Update | Line: 195 | Upvalues: v4 (copy), v3 (copy), v6 (copy) ]]
	local v1 = v4.GetSubmittedMaterials()
	for k, v in pairs(p1.Slots) do
		if v1[k] then
			if v.Material ~= v1[k] then
				v.Material = v1[k]
				v.Maid:GiveTask(v3.new({
					ForceVisible = true,
					DoNotClone = true,
					Item = v6.GetByName(v.Material),
					GuiObject = v.Frame.Content.Content,
					ParentFrame = v.Frame,
					GetAmount = function() --[[ GetAmount | Line: 209 ]]
						return 1
					end
				}))
				v.Frame.Content.Visible = true
				v.Frame.Empty.Visible = false
			end
			continue
		end
		v.Maid:Destroy()
		v.Material = nil
		v.Frame.Content.Visible = false
		v.Frame.Empty.Visible = true
	end
end
function t.Init(p1) --[[ Init | Line: 226 | Upvalues: v2 (copy), t (copy) ]]
	v2.new("PlushMachineBoard", t):Init()
end
t:Init()
return t