-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ButtonTest")
local v2 = Sonar("GuiManager")
local v3 = Sonar("Maid")
local v4 = Sonar("PlushMachineService")
local v5 = Sonar("ItemGridButton")
local v6 = Sonar("ItemDataService")
local v7 = Sonar("GridSort")
local v8 = Sonar("PlushMachine")
local v9 = Sonar("Button")
local Frame = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("PlushMachineGui"):WaitForChild("Frame")
local v10 = Sonar("PlayerWrapper").GetClient()
local v11 = v3.new()
local v12 = v7.new({
	Filters = {
		All = true
	},
	Sorts = {
		Alphabet = {
			DisplayName = "Name",
			Reversable = true,
			Run = function(p1, p2, p3) --[[ Run | Line: 43 ]]
				local v1 = p1.NameLabel.Text:lower()
				local v2 = p2.NameLabel.Text:lower()
				if p3 then
					return v2 < v1
				else
					return v1 < v2
				end
			end,
			Changed = function(p1) --[[ Changed | Line: 54 ]]
				return p1.NameLabel:GetPropertyChangedSignal("Text")
			end
		}
	},
	EmptyString = {
		Text = "You do not have any horses!",
		Label = Frame.ContainerFrame:WaitForChild("Menu"):WaitForChild("Items"):WaitForChild("EmptyLabel")
	}
})
local t = {}
local t2 = {}
local v13 = false
for k, v in pairs(v4.AllSlots) do
	v12:AddFilter(v, {
		EmptyString = "You have no materials of this type!",
		Run = function(p1) --[[ Run | Line: 68 | Upvalues: v (copy) ]]
			return v == p1.Item.MaterialType
		end
	})
end
local t3 = {}
local t4 = {}
local function updateMaterials() --[[ updateMaterials | Line: 77 | Upvalues: v8 (copy), t2 (copy), v5 (copy), v6 (copy) ]]
	local v1 = v8.GetSubmittedMaterials()
	for k, v in pairs(t2) do
		if v1[k] then
			if v.Material ~= v1[k] then
				v.Material = v1[k]
				v.Maid:GiveTask(v5.new({
					ForceVisible = true,
					DoNotClone = true,
					Item = v6.GetByName(v.Material),
					GuiObject = v.Frame.Content.Content,
					ParentFrame = v.Frame,
					GetAmount = function() --[[ GetAmount | Line: 91 ]]
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
local function createItem(p1, p2) --[[ createItem | Line: 108 | Upvalues: t3 (ref), t4 (copy), v5 (copy), v6 (copy), Frame (copy), v9 (copy), v8 (copy), v12 (copy) ]]
	if t3[p1] then
		return
	end
	if t4[p1] then
		return
	end
	t4[p1] = true
	local v1
	if p2 then
		v1 = v5.new({
			Item = v6.GetByName(p1.Name),
			DataValue = p1,
			ParentFrame = Frame.ContainerFrame:WaitForChild("Menu"):WaitForChild("Items")
		})
		v1:GiveTask(v9.new(v1.Frame, {
			Click = function() --[[ Click | Line: 124 | Upvalues: Frame (ref), v8 (ref), p1 (copy) ]]
				Frame.ContainerFrame.Menu.Content.Visible = true
				Frame.ContainerFrame.Menu.Items.Visible = false
				v8.AddMaterial(p1.Name)
			end
		}))
		t3[p1] = v1
		t4[p1] = nil
		v12:Add(v1, p2)
		return
	end
	task.wait()
	v1 = v5.new({
		Item = v6.GetByName(p1.Name),
		DataValue = p1,
		ParentFrame = Frame.ContainerFrame:WaitForChild("Menu"):WaitForChild("Items")
	})
	v1:GiveTask(v9.new(v1.Frame, {
		Click = function() --[[ Click | Line: 124 | Upvalues: Frame (ref), v8 (ref), p1 (copy) ]]
			Frame.ContainerFrame.Menu.Content.Visible = true
			Frame.ContainerFrame.Menu.Items.Visible = false
			v8.AddMaterial(p1.Name)
		end
	}))
	t3[p1] = v1
	t4[p1] = nil
	v12:Add(v1, p2)
end
local function removeItem(p1, p2) --[[ removeItem | Line: 137 | Upvalues: t3 (ref), v8 (copy), v12 (copy) ]]
	if not t3[p1] then
		return
	end
	if p2 then
		v8.RemoveMaterial(p1.Name)
	end
	v12:Remove(t3[p1])
	t3[p1]:Destroy()
	t3[p1] = nil
end
function t.Open(p1) --[[ Open | Line: 151 | Upvalues: v13 (ref), v2 (copy), Frame (copy) ]]
	v13 = true
	v2.OpenFrame(Frame)
end
function t.Close() --[[ Close | Line: 157 | Upvalues: v2 (copy), Frame (copy) ]]
	v2.CloseFrame(Frame)
end
function t.OnOpen(p1) --[[ OnOpen | Line: 161 | Upvalues: v2 (copy), Frame (copy), v4 (copy), Sonar (copy), v1 (copy), v12 (copy), v8 (copy), t2 (copy), v3 (copy), v6 (copy), v10 (copy), v11 (copy), createItem (copy), t3 (ref), updateMaterials (copy) ]]
	local v13 = v2.getFrameFromInstance(Frame)
	if not v13.Opened then
		v13.Opened = true
		for k, v in pairs(v4.AllSlots) do
			local v22 = Frame.ContainerFrame:WaitForChild("Menu"):WaitForChild("Content"):WaitForChild("Default"):Clone()
			Frame.ContainerFrame:WaitForChild("Menu"):WaitForChild("Content"):WaitForChild("Default").Visible = false
			v22.Empty.Content.SlotLabel.Text = Sonar("FormatString").separateWordsInString(v) .. " Slot"
			v22.Content.Content.SlotLabel.Text = Sonar("FormatString").separateWordsInString(v) .. " Slot"
			v1.new(v22.Empty.Content.AddButton, {
				Click = function() --[[ Click | Line: 174 | Upvalues: Frame (ref), v12 (ref), v (copy) ]]
					Frame.ContainerFrame.Menu.Content.Visible = false
					Frame.ContainerFrame.Menu.Items.Visible = true
					v12:Filter(v)
				end
			})
			v1.new(v22.Content.Content.RemoveButton, {
				Click = function() --[[ Click | Line: 182 | Upvalues: v8 (ref), t2 (ref), v (copy) ]]
					v8.RemoveMaterial(t2[v].Material)
				end
			})
			v22.Name = v
			v22.Visible = true
			v22.Parent = Frame.ContainerFrame:WaitForChild("Menu"):WaitForChild("Content")
			t2[v] = {
				Frame = v22,
				Maid = v3.new()
			}
		end
		v1.new(Frame.ContainerFrame.Menu.Items.EmptyLabel.BackButton, {
			Click = function() --[[ Click | Line: 198 | Upvalues: Frame (ref) ]]
				Frame.ContainerFrame.Menu.Content.Visible = true
				Frame.ContainerFrame.Menu.Items.Visible = false
			end
		})
	end
	if not v13.ContentsLoaded then
		v13.ContentsLoaded = true
		v12:Sort("Alphabet")
		for k, v in pairs(v6.GetType("Resources")) do
			if v4.GetMaterialType(k) then
				local v32 = v10:GetItemValue(k, "Resources")
				if v32 then
					v11:GiveTask(v32:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 218 | Upvalues: v32 (copy), createItem (ref), t3 (ref), v8 (ref), v12 (ref) ]]
						if v32.Value > 0 then
							createItem(v32)
							return
						end
						local v1 = v32
						if t3[v1] then
							v8.RemoveMaterial(v1.Name)
							v12:Remove(t3[v1])
							t3[v1]:Destroy()
							t3[v1] = nil
						end
					end))
					if v32.Value > 0 then
						createItem(v32, true)
					end
					continue
				end
				warn("No item value found for", k, "Resources")
			end
		end
		v11:GiveTask(v8.MaterialsChangedSignal:Connect(updateMaterials))
		updateMaterials()
	end
	Frame.ContainerFrame.Menu.Content.Visible = true
	Frame.ContainerFrame.Menu.Items.Visible = false
end
function t.Cleanup(p1) --[[ Cleanup | Line: 238 | Upvalues: v11 (copy), t3 (ref), v12 (copy) ]]
	v11:DoCleaning()
	for k, v in pairs(t3) do
		if t3[k] then
			v12:Remove(t3[k])
			t3[k]:Destroy()
			t3[k] = nil
		end
	end
	t3 = {}
end
function t.Init(p1) --[[ Init | Line: 247 | Upvalues: v1 (copy), Frame (copy), t (copy), v2 (copy), v13 (ref) ]]
	v1.new(Frame.ContainerFrame.Menu.CloseButton, {
		Click = t.Close
	})
	v2.AddFrame(Frame, {
		TweenAnimation = "Open",
		ShortcutToClose = true,
		Overlay = true,
		CheckVisibility = function(p1) --[[ CheckVisibility | Line: 253 | Upvalues: v13 (ref) ]]
			v13 = false
			return not p1 and v13
		end,
		OpenPosition = Frame.Position,
		ClosePosition = Frame.Position + UDim2.new(0, 0, 0.15, 0),
		SelectOnOpen = function() --[[ SelectOnOpen | Line: 261 | Upvalues: Frame (ref) ]]
			return Frame.ContainerFrame.Menu.Content
		end
	})
	v2.AddStateCallback(Frame, "OnOpen", function() --[[ Line: 267 | Upvalues: t (ref) ]]
		t:OnOpen()
	end)
	v2.AddStateCallback(Frame, "OnClose", function() --[[ Line: 270 | Upvalues: v13 (ref) ]]
		v13 = false
	end)
end
t:Init()
return t