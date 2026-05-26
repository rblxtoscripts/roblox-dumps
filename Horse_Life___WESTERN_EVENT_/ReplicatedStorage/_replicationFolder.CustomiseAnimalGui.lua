-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CurrentCamera = workspace.CurrentCamera
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiManager")
local v2 = Sonar("ViewportModel")
local v3 = Sonar("Maid")
local v4 = Sonar("MathUtils")
local v5 = Sonar("ButtonTest")
local v6 = Sonar("RemoteUtils")
local v7 = Sonar("WorldspaceGuiUtils")
local v8 = Sonar("LightingService")
local v9 = Sonar("CharacterEffects")
local v10 = Sonar("ItemGridButton")
local v11 = Sonar("ItemDataService")
local v12 = Sonar("Button")
local v13 = Sonar("Signal")
local v14 = Sonar("EquipmentService")
local v15 = Sonar("IssueResponseClient")
local v16 = Sonar("UINavigator")
local v17 = Sonar("spr")
local v18 = Sonar("DisplayUtils")
local v19 = Sonar("NotificationsClient")
local v20 = Sonar("SliderClass")
local v21 = Sonar("State")
local v22 = Sonar("VirtualizedList")
local v23 = Sonar("ItemDisplayCreator")
local v24 = Sonar("GuiUtils")
Sonar("Constants")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v25 = Sonar("PlayerWrapper").GetClient()
local ContainerFrame = LocalPlayer.PlayerGui:WaitForChild("CustomiseGui").ContainerFrame
local v26 = v6.GetRemoteFunction("SetCustomiseModeRemote")
local v27 = LocalPlayer:GetMouse()
local v28 = nil
local v29 = nil
local v30 = nil
local v31 = nil
local v32 = v21.new()
local v33 = v3.new()
local v34 = v13.new()
local v35 = 0
local v36 = 0
local v37 = 0
local v38 = 0
local v39 = 0
local v40 = 1
local v41 = false
local v42 = false
local v43 = false
local v44 = 0
local t2 = {}
local t3 = {}
local t4 = {}
local v45 = v3.new()
local v46 = v25:GetItemFolder("Equipment")
local v47 = v3.new()
local v48 = nil
local v49 = v21.new(1)
local v50 = v21.new("Hat")
local t5 = {}
local v51 = false
local v52 = v21.new("XAxis")
local t6 = {}
_G.EditedColors = t6
local v53 = v13.new()
_G.EditedColorsChangedSignal = v53
local function getFocusCFrame(p1) --[[ getFocusCFrame | Line: 102 | Upvalues: v30 (ref), v2 (copy), CurrentCamera (copy), v36 (ref), v39 (ref) ]]
	local _, v1 = v30:ToOrientation()
	local v22 = math.deg(v1)
	local _2, v4, v5 = v2(p1.Hitbox, CurrentCamera, math.deg(0 - v36), v22)
	return CFrame.new(v5), CFrame.new(0, 0, v4 * 1.5 * (1 - v39 / 2))
end
local function getCameraCFrame(p1) --[[ getCameraCFrame | Line: 110 | Upvalues: getFocusCFrame (copy), v4 (copy), v39 (ref), CurrentCamera (copy), ContainerFrame (copy), v36 (ref) ]]
	local v1, v2 = getFocusCFrame(p1)
	local v3 = v4.map(v39, 0, 1, 1, 0.5)
	local v8 = CFrame.new(2 * ((v1 * v2).Position - p1.PrimaryPart.Position).Magnitude * math.tan(math.rad(CurrentCamera.FieldOfView) / 2) * (CurrentCamera.ViewportSize.X / CurrentCamera.ViewportSize.Y) * (ContainerFrame.Accessories.Menu.AbsoluteSize.X / CurrentCamera.ViewportSize.X) * 0.35 * v3, 0, 0)
	local v9 = CFrame.fromEulerAnglesYXZ(0 - v36, 0, 0)
	return v1 * v8 * v9 * v2, v2, v9, v8
end
local function doUpdate(p1, p2, p3) --[[ doUpdate | Line: 142 | Upvalues: v27 (copy), v42 (ref), v35 (ref), v36 (ref), UserInputService (copy), v41 (ref), v38 (ref), v37 (ref), v39 (ref), v40 (ref) ]]
	local v1 = if p1.UserInputType == Enum.UserInputType.Gamepad1 then if p1.KeyCode == Enum.KeyCode.Thumbstick2 then true else false else false
	local v2 = if p2 and p2 then p2 else v27
	if not v42 and v1 then
		v35 = p1.Position.X * 0.015
		v36 = math.clamp(v36 - p1.Position.Y * 0.005, -1.5, 1.5)
	elseif not v42 and (p1.UserInputType == Enum.UserInputType.MouseMovement and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) or (v1 or v41)) then
		local Position = p1.Position
		local v4 = v1 and Vector2.new(Position.X, Position.Y) or Vector2.new(v2.X, v2.Y)
		local v6 = math.abs(v4.Y - v38)
		if math.abs(v4.X - v37) / 3.5 < v6 then
			local v8, v9
			if p3 then
				v8 = math.clamp(v36 + p3.Y * 0.002, -1.5, 1.5)
				if not v8 then
					v9 = v36 + (v4.Y - v38) * 0.003
					v8 = math.clamp(v9, -1.5, 1.5)
				end
			else
				v9 = v36 + (v4.Y - v38) * 0.003
				v8 = math.clamp(v9, -1.5, 1.5)
			end
			v36 = v8
			if p3 then
				v35 = if p3 then p3.X * 0.03 else p3
			end
		else
			v35 = p3 and p3.X * 0.015 or (v4.X - v37) * 0.0035
		end
	end
	if p1.UserInputType == Enum.UserInputType.MouseWheel then
		v39 = math.clamp(v39 + 0.2 * p1.Position.Z, 0, 1)
	end
	if v42 and (v42 == Enum.UserInputState.Change or v42 == Enum.UserInputState.End) then
		v39 = v40
		if v42 == Enum.UserInputState.End then
			v42 = nil
		end
	end
	v37 = v2.X
	v38 = v2.Y
end
local function isVariantEquipped(p1) --[[ isVariantEquipped | Line: 186 | Upvalues: v25 (copy) ]]
	local v1 = false
	for v2, v3 in v25:GetItemFolder("Animals"):GetChildren() do
		local EquippedEquipment = v3:FindFirstChild("EquippedEquipment")
		if EquippedEquipment then
			for v4, v5 in EquippedEquipment:GetChildren() do
				local Theme = v5:FindFirstChild("Theme")
				v1 = if (if Theme and Theme.Value ~= "" then Theme.Value else "Default") == p1.Theme then true else false
				if v1 then
					break
				end
			end
			if v1 then
				break
			end
		end
	end
	return v1
end
local function removeItem(p1) --[[ removeItem | Line: 220 | Upvalues: t2 (ref) ]]
	if t2[p1] then
		t2[p1]:Destroy()
		t2[p1] = nil
	end
end
local function setApplyButton() --[[ setApplyButton | Line: 227 | Upvalues: ContainerFrame (copy), t6 (ref) ]]
	ContainerFrame.RecolorMenu.Menu.Content.ApplyButton.Visible = next(t6)
	ContainerFrame.RecolorMenu.Menu.Content.EditPrompt.Visible = not ContainerFrame.RecolorMenu.Menu.Content.ApplyButton.Visible
end
local v54 = nil
local t7 = {}
local v55 = nil
local function getEquipped(p1) --[[ getEquipped | Line: 236 | Upvalues: v25 (copy) ]]
	local v1 = v25:GetItemFolder("Animals"):GetChildren()
	local t = {}
	for v2, v3 in p1 do
		if v3.Parent then
			local v4 = false
			for v5, v6 in v1 do
				v4 = v6.EquippedEquipment:FindFirstChild(v3.Name) and true or false
				if v4 then
					break
				end
			end
			if v4 then
				table.insert(t, v3)
			end
		end
	end
	return t
end
local function getUnequipped(p1) --[[ getUnequipped | Line: 266 | Upvalues: v25 (copy) ]]
	local v1 = v25:GetItemFolder("Animals"):GetChildren()
	for v3, v4 in p1 do
		if v4.Parent then
			local v5 = false
			for v6, v7 in v1 do
				v5 = v7.EquippedEquipment:FindFirstChild(v4.Name) and true or false
				if v5 then
					break
				end
			end
			if not v5 then
				return v4.Name
			end
		end
	end
	return nil
end
local function clearCircularVariantsBuffer(p1) --[[ clearCircularVariantsBuffer | Line: 298 | Upvalues: v55 (ref), t7 (copy) ]]
	if v55 ~= p1.Theme then
		table.clear(t7)
		return
	end
	for i = #t7, 1, -1 do
		local v1 = t7[i]
		local v2 = nil
		for v3, v4 in p1.Values do
			if v4.Parent and v1 == v4.Name then
				v2 = v4
				break
			end
		end
		if not v2 then
			table.remove(t7, i)
		end
	end
end
local function v56(p1) --[[ selectEquipped | Line: 329 | Upvalues: v54 (ref), v48 (ref), v47 (copy), t6 (ref), v53 (copy), v11 (copy), v56 (copy), ContainerFrame (copy), v25 (copy), v13 (copy), v3 (copy), clearCircularVariantsBuffer (copy), v55 (ref), getUnequipped (copy), v19 (copy), v6 (copy), v32 (copy), isVariantEquipped (copy), v14 (copy), v12 (copy), v49 (copy), v50 (copy), t5 (copy), v52 (copy), v31 (ref) ]]
	v54 = v48
	v47:DoCleaning()
	v48 = p1
	t6 = {}
	_G.EditedColors = t6
	_G.EditedEquipment = if p1 then p1.Name else p1
	v53:Fire()
	if p1 then
		local v33 = v11.GetByName(p1.Value)
		v47:GiveTask(p1:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 343 | Upvalues: v56 (ref) ]]
			v56()
		end))
		if v33.ItemType == "Equipment" then
			local Default = ContainerFrame.RecolorMenu.StackFrame.Content.ScrollingFrame.Default
			local t = {}
			local v4 = false
			local t2 = {}
			for v5, v62 in v25.PlayerData.Equipment:GetChildren() do
				if v62:IsA("ValueBase") and v62.Value == v33.Name then
					table.insert(t, v62)
					if v62:FindFirstChild("LimitedSerial") then
						local LimitedSerial = v62.LimitedSerial.Value
						if LimitedSerial and (LimitedSerial ~= 0 and not tostring(LimitedSerial):find(":")) then
							v4 = true
						end
					end
				end
			end
			if v4 then
				for v10, v112 in t do
					local v7, v8, v9
					local Theme = v112.Theme.Value
					v7 = if Theme == "" or (Theme == "Random" or not Theme) then "Default" else Theme
					if v112:FindFirstChild("LimitedSerial") then
						v8 = v112.LimitedSerial.Value
						if v8 then
							v9 = v7
						else
							v8 = nil
							v9 = v7
						end
					else
						v8 = nil
						v9 = v7
					end
					table.insert(t2, {
						Amount = 1,
						Theme = if v8 then ("%* #%*"):format(v9, v8) else v9,
						Values = { v112 }
					})
				end
			else
				for v132, v142 in t do
					local Theme = v142.Theme.Value
					local v16, v17, v18 = if Theme == "" or (Theme == "Random" or not Theme) then "Default" else Theme, nil, nil
					for v192, v20 in t2 do
						if v16 == v20.Theme then
							v17 = v192
							v18 = v20
							break
						end
					end
					local v23 = v18 or {}
					v23.Theme = v23.Theme or v16
					v23.Values = v23.Values or {}
					table.insert(v23.Values, v142)
					v23.Amount = #v23.Values
					t2[v17 or #t2 + 1] = v23
				end
			end
			table.sort(t2, function(p1, p2) --[[ Line: 418 ]]
				if p1.Theme == "Default" then
					if p2.Theme == "Default" then
						return false
					end
					if p2.Theme ~= "Default" then
						return true
					end
				else
					if p1.Theme == "Default" then
						return false
					end
					if p2.Theme == "Default" then
						return false
					end
					if p2.Theme == "Default" then
						return false
					end
					if p1.Theme == p2.Theme then
						return false
					end
					if p1.Theme == p2.Theme then
						return false
					end
					return p1.Theme < p2.Theme
				end
				return false
			end)
			local v252 = v25:GetItemFolder("Animals")
			local v26 = v47:GiveTask(v13.new())
			local v27 = 0
			for v28, v29 in t2 do
				local v30 = v3.new()
				table.sort(v29.Values, function(p1, p2) --[[ Line: 448 ]]
					local v2 = tonumber(p1.Name)
					local v4 = tonumber(p2.Name)
					if v2 then
						if v4 then
							return v2 < v4
						elseif not v4 then
							return true
						end
					else
						if v2 then
							return false
						end
						if v4 then
							return false
						end
						if not v4 then
							return false
						end
					end
					return false
				end)
				local v312 = nil
				for v322, v332 in v29.Values do
					v30[v332] = v332:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 469 | Upvalues: v332 (copy), v29 (copy), v30 (copy), v312 (ref), v47 (ref) ]]
						if v332.Parent then
							return
						end
						local v1 = false
						local v2 = 0
						for v3, v4 in v29.Values do
							local v5 = if v1 then v1 elseif v4.Parent == nil then false else true
							v1, v2 = v5, v2 + (if v4.Parent then 1 else 0)
						end
						if not v332.Parent then
							v30[v332] = nil
						end
						v312.OwnedLabel.Text = ("x%*"):format(v2)
						if v1 then
							return
						end
						v47[v29.Theme] = nil
					end)
				end
				local v34 = v30:GiveTask(Default:Clone())
				v30:GiveTask(v34.Activated:Connect(function() --[[ Line: 495 | Upvalues: clearCircularVariantsBuffer (ref), v29 (copy), v55 (ref), getUnequipped (ref), v19 (ref), v6 (ref), v32 (ref) ]]
					clearCircularVariantsBuffer(v29)
					v55 = v29.Theme
					local v1 = getUnequipped(v29.Values)
					if v1 then
						v6.GetRemoteFunction("EquipEquipmentRemote"):InvokeServer(v32:get().Name, v1)
					else
						v19.Notify({
							Message = "All variants are equipped! Unequip one from a horse first.",
							Preset = "Red"
						})
					end
				end))
				v30:GiveTask(v26:Connect(function() --[[ Line: 513 | Upvalues: v34 (ref), isVariantEquipped (ref), v29 (copy) ]]
					v34.Theme.EquippedLabel.Visible = isVariantEquipped(v29)
				end))
				local v36 = v14.GetThemeFromValue((table.unpack(v29.Values)))
				if v36 then
					if v36.Texture then
						v34.Theme.ImageLabel.Image = v36.Texture
						v34.Theme.ImageLabel.UIGradient.Enabled = false
					elseif v36.ColorSequence then
						v34.Theme.ImageLabel.UIGradient.Color = v36.ColorSequence
						v34.Theme.ImageLabel.UIGradient.Enabled = true
					end
				else
					v34.Theme.ImageLabel.UIGradient.Color = ColorSequence.new(Color3.new(255/255, 255/255, 255/255))
				end
				v34.Name = v29.Theme
				v34.NameLabel.Text = v29.Theme
				v34.OwnedLabel.Text = ("x%*"):format(#v29.Values)
				v34.Visible = true
				v34.Theme.EquippedLabel.Visible = isVariantEquipped(v29)
				v34.Parent = Default.Parent
				v47[v29.Theme] = v30
			end
			local function onAnimalAdded(p1) --[[ onAnimalAdded | Line: 543 | Upvalues: v3 (ref), v26 (copy), v27 (ref), v47 (ref) ]]
				local EquippedEquipment = p1:FindFirstChild("EquippedEquipment")
				local v1 = v3.new()
				v1:GiveTask(EquippedEquipment.ChildAdded:Connect(function() --[[ Line: 547 | Upvalues: v1 (copy), v26 (ref) ]]
					v1._update = task.defer(function() --[[ Line: 548 | Upvalues: v26 (ref) ]]
						v26:Fire()
					end)
				end))
				v27 = v27 + #EquippedEquipment:GetChildren()
				v1:GiveTask(p1:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 556 | Upvalues: p1 (copy), v47 (ref) ]]
					if not p1.Parent then
						v47[p1] = nil
					end
				end))
				v47[p1] = v1
			end
			v47:GiveTask(v252.ChildAdded:Connect(onAnimalAdded))
			for v37, v38 in v252:GetChildren() do
				onAnimalAdded(v38)
			end
			if v27 > 0 then
				v26:Fire()
			end
			for k, v in pairs(v33.ColorableRegions) do
				local v39 = p1:WaitForChild(k)
				local v40 = ContainerFrame.RecolorMenu.Menu.Content.Regions.Default:Clone()
				ContainerFrame.RecolorMenu.Menu.Content.Regions.Default.Visible = false
				v40.Name = k
				v40.Title.Text = k
				v47:GiveTask(v12.new(v40, {
					Click = function() --[[ Click | Line: 586 | Upvalues: v49 (ref), k (copy) ]]
						v49:set(k)
					end
				}))
				v47:GiveTask(v50:subscribe(function(p1) --[[ Line: 591 | Upvalues: v40 (copy), k (copy) ]]
					v40.BackgroundColor3 = p1 == k and Color3.fromRGB(106, 248, 128) or Color3.fromRGB(222, 191, 172)
				end))
				local function updateColor() --[[ updateColor | Line: 595 | Upvalues: t6 (ref), k (copy), v39 (copy), v40 (copy) ]]
					local v2 = t6[tostring(k)]
					if (v2 or not (#v39.Value > 0)) and not (v2 and #v2 > 0) then
						v40.RemoveButton.Visible = false
						v40.EmptyLabel.Visible = true
						v40.ColorContainer.Visible = false
						return
					end
					if v2 then
						v40.ColorContainer.ColorLabel.BackgroundColor3 = Color3.fromHex(v2)
					else
						v40.ColorContainer.ColorLabel.BackgroundColor3 = Color3.fromHex(v39.Value)
					end
					v40.RemoveButton.Visible = true
					v40.EmptyLabel.Visible = false
					v40.ColorContainer.Visible = true
				end
				v47:GiveTask(v39:GetPropertyChangedSignal("Value"):Connect(updateColor))
				v47:GiveTask(v53:Connect(updateColor))
				updateColor()
				v47:GiveTask(v12.new(v40.RemoveButton, {
					Click = function() --[[ Click | Line: 617 | Upvalues: t6 (ref), k (copy), v53 (ref) ]]
						t6[tostring(k)] = ""
						v53:Fire()
					end
				}))
				v40.Visible = true
				v40.Parent = ContainerFrame.RecolorMenu.Menu.Content.Regions
				v47:GiveTask(v40)
			end
			for v41, v42 in t5 do
				v42.DefaultValues = v42.DefaultValues or {}
				local v44 = if v41 == "Rotation" then "Rotation" else "Position"
				for v45, v46 in { "XAxis", "YAxis", "ZAxis" } do
					local v472 = if p1 then p1:FindFirstChild(v46) else p1
					if v472 then
						local v482 = v472:FindFirstChild(v44)
						if v482 and v42.DefaultValues[v46] == nil then
							v42.DefaultValues[v46] = v482.Value
						end
					end
				end
				local v502 = if p1 then p1:FindFirstChild((v52:get())) else p1
				if v502 then
					local v51 = v502:FindFirstChild(v44)
					if v51 then
						v42.UpdateVisual(v51.Value)
					end
				end
			end
			v47:GiveTask(function() --[[ Line: 656 | Upvalues: t5 (ref), v52 (ref), v54 (ref), v31 (ref) ]]
				for v1, v2 in t5 do
					local v3 = v52:get()
					local v4 = v54 and v54:FindFirstChild(v3)
					local v5 = if v1 == "Rotation" then "Rotation" else "Position"
					if v4 then
						local v6 = v4:FindFirstChild(v5)
						if v6 and (v2.DefaultValues and v2.DefaultValues[v3] ~= nil) then
							local v7 = v2.DefaultValues[v3]
							v2.UpdateVisual(v7)
							v6.Value = v7
							local SlotInfo = v31:FindFirstChild("SlotInfo")
							if v31 and (SlotInfo and SlotInfo:FindFirstChild("EquippedEquipment")) then
								local v8 = v31.SlotInfo.EquippedEquipment:FindFirstChild(v54.Name)
								if v8 then
									local v9 = v8:FindFirstChild(v3)
									if v9 then
										local v10 = v9:FindFirstChild(v5)
										if v10 then
											v10.Value = v7
										end
									end
								end
							end
							v2.DefaultValues[v3] = nil
						end
					end
				end
			end)
			local v522 = v11.GetByName(p1.Value)
			ContainerFrame.RecolorMenu.Menu.UnableOverlay.Visible = v14.GetThemeFromValue(p1) or v522.CannotColor
			local v542 = not table.find({ "Leg", "Saddle", "Head" }, v522.BodyPart) and not string.find(v522.Name, "Bridle")
			ContainerFrame.PositionMenu.Menu.UnableOverlay.Visible = not v542
			ContainerFrame.PositionMenu.Menu.Content.Visible = v542
			local ToyEvent = v522.ToyEvent
			ContainerFrame.RecolorMenu.Visible = not ToyEvent
			ContainerFrame.PositionMenu.Visible = not ToyEvent
		elseif v33.ItemType == "Flairs" then
			ContainerFrame.RecolorMenu.Visible = false
			ContainerFrame.PositionMenu.Visible = false
		end
	else
		ContainerFrame.RecolorMenu.Visible = false
		ContainerFrame.PositionMenu.Visible = false
	end
end
local function createPalette(p1, p2) --[[ createPalette | Line: 720 | Upvalues: t3 (copy), t4 (copy), v3 (copy), v11 (copy), ContainerFrame (copy), v18 (copy), v12 (copy), t6 (ref), v49 (copy), v53 (copy) ]]
	if t3[p1] then
		return
	end
	if t4[p1] then
		return
	end
	t4[p1] = true
	if not p2 then
		task.wait()
	end
	local v1 = v3.new()
	local v2 = v11.GetByName(p1.Name)
	local v32 = ContainerFrame.RecolorMenu.Menu.Content.Palettes.Default:Clone()
	ContainerFrame.RecolorMenu.Menu.Content.Palettes.Default.Visible = false
	v32.Name = p1.Name
	v32.Title.Text = v18.GetDisplayName(v2.Name, v2)
	for k, v in pairs(v2.Colors) do
		local v4 = v32.Colors.Default:Clone()
		v32.Colors.Default.Visible = false
		v4.Name = k
		v4.ColorLabel.BackgroundColor3 = v.Color
		v1:GiveTask(v12.new(v4, {
			Click = function() --[[ Click | Line: 745 | Upvalues: t6 (ref), v49 (ref), v (copy), v53 (ref) ]]
				t6[tostring(v49:get())] = v.HexColor
				v53:Fire()
			end
		}))
		v4.Visible = true
		v4.Parent = v32.Colors
		v1:GiveTask(v4)
	end
	v32.Visible = true
	v32.Parent = ContainerFrame.RecolorMenu.Menu.Content.Palettes
	v1:GiveTask(v32)
	t3[p1] = v1
	t4[p1] = nil
end
local function removePalette(p1) --[[ removePalette | Line: 764 | Upvalues: t3 (copy) ]]
	if t3[p1] then
		t3[p1]:Destroy()
		t3[p1] = nil
	end
end
local function setupPositionMenu() --[[ setupPositionMenu | Line: 770 | Upvalues: ContainerFrame (copy), v5 (copy), v52 (copy), v24 (copy), v48 (ref), v31 (ref), t5 (copy), v20 (copy), v51 (ref), v32 (copy), v6 (copy), v19 (copy) ]]
	for v1, v2 in ContainerFrame.PositionMenu.Menu.ButtonContainer:GetChildren() do
		if v2:IsA("ImageButton") then
			v5.new(v2, {
				Click = function() --[[ Click | Line: 776 | Upvalues: v52 (ref), v2 (copy) ]]
					v52:set(v2.Name)
				end
			})
			local v53 = if v2.Name == v52:get() then "Green" else "Blue"
			v24.SetButtonColor(ContainerFrame.PositionMenu.Menu.ButtonContainer[v2.Name], "Diagonal", v53)
		end
	end
	local function writeAxisValue(p1, p2, p3) --[[ writeAxisValue | Line: 784 | Upvalues: v48 (ref), v31 (ref) ]]
		if v48 then
			local v1 = v48:FindFirstChild(p1)
			if v1 then
				local v2 = v1:FindFirstChild(p2)
				if v2 then
					v2.Value = p3
				end
			end
		end
		if not (v31 and v31.SlotInfo:FindFirstChild("EquippedEquipment")) then
			return
		end
		local v4 = v31.SlotInfo.EquippedEquipment:FindFirstChild(v48 and v48.Name)
		if not v4 then
			return
		end
		local v5 = v4:FindFirstChild(p1)
		if not v5 then
			return
		end
		local v6 = v5:FindFirstChild(p2)
		if not v6 then
			return
		end
		v6.Value = p3
	end
	v52:subscribe(function(p1) --[[ Line: 809 | Upvalues: v48 (ref), t5 (ref), ContainerFrame (ref), v24 (ref), v52 (ref) ]]
		if not v48 then
			return
		end
		for v1, v2 in t5 do
			local v4 = v48:FindFirstChild(p1)
			local v5 = if v4 then v4:FindFirstChild(if v1 == "Rotation" then "Rotation" else "Position") else v4
			v2.UpdateVisual(v5 and v5.Value or 0)
		end
		for v7, v8 in ContainerFrame.PositionMenu.Menu.ButtonContainer:GetChildren() do
			if v8:IsA("ImageButton") then
				v24.SetButtonColor(ContainerFrame.PositionMenu.Menu.ButtonContainer[v8.Name], "Diagonal", if v8.Name == v52:get() then "Green" else "Blue")
			end
		end
	end)
	for v62, v7 in ContainerFrame.PositionMenu.Menu.Content.Sliders:GetChildren() do
		if v7:IsA("Frame") then
			local function f9(p1) --[[ Line: 827 | Upvalues: v7 (copy), v48 (ref), v51 (ref), v52 (ref), writeAxisValue (copy) ]]
				if v7.Name == "Rotation" then
					v7.SliderFrame.Fill.Mover.Size = UDim2.new((p1 + 180) / 360, 0, 1, 0)
					if v48 and not v51 then
						writeAxisValue(v52:get(), "Rotation", p1)
					end
				else
					v7.SliderFrame.Fill.Mover.Size = UDim2.new((p1 + 200) / 400, 0, 1, 0)
					if not v48 or v51 then
						return
					end
					writeAxisValue(v52:get(), "Position", p1 / 100)
				end
			end
			local v12 = v20.new(v7.SliderFrame.Fill, f9, if v7.Name == "Rotation" then -180 else -200, if v7.Name == "Rotation" then 180 else 200, false)
			v12:Set(0)
			v12.canMove = true
			v7.SliderFrame.Fill.Mover.Size = UDim2.new(0.5, 0, 1, 0)
			local function updateVisualPosition(p1) --[[ updateVisualPosition | Line: 852 | Upvalues: v51 (ref), v7 (copy), v12 (copy) ]]
				v51 = true
				if v7.Name == "Rotation" then
					v7.SliderFrame.Fill.Mover.Size = UDim2.new((p1 + 180) / 360, 0, 1, 0)
					v12:Set(p1)
				else
					v7.SliderFrame.Fill.Mover.Size = UDim2.new((p1 * 100 + 200) / 400, 0, 1, 0)
					v12:Set(p1 * 100)
				end
				v51 = false
			end
			t5[v7.Name] = {
				SliderClass = v12,
				SliderFrame = v7,
				UpdateVisual = updateVisualPosition
			}
			local ResetButton = v7:FindFirstChild("ResetButton")
			if ResetButton then
				v5.new(ResetButton, {
					Click = function() --[[ Click | Line: 871 | Upvalues: v48 (ref), v52 (ref), v7 (copy), writeAxisValue (copy), t5 (ref) ]]
						if not v48 then
							return
						end
						local v1 = v52:get()
						writeAxisValue(v1, if v7.Name == "Rotation" then "Rotation" else "Position", 0)
						t5[v7.Name].UpdateVisual(0)
					end
				})
			end
		end
	end
	v5.new(ContainerFrame.PositionMenu.Menu.Content.ApplyButton, {
		Click = function() --[[ Click | Line: 884 | Upvalues: v48 (ref), v32 (ref), v6 (ref), t5 (ref), v19 (ref) ]]
			if not v48 then
				return
			end
			local t = { "XAxis", "YAxis", "ZAxis" }
			local t2 = {}
			for v1, v2 in t do
				local v3 = v48:FindFirstChild(v2)
				if v3 then
					local t3 = {}
					local Rotation = v3:FindFirstChild("Rotation")
					local Position = v3:FindFirstChild("Position")
					if Rotation then
						t3.Rotation = Rotation.Value
					end
					if Position then
						t3.Position = Position.Value
					end
					if next(t3) ~= nil then
						t2[v2] = t3
					end
				end
			end
			if next(t2) == nil then
				return
			end
			local v4 = v32:get()
			if not v6.GetRemoteFunction("ApplyEquipmentPositionsRemote"):InvokeServer({
				Slot = v4.Name,
				Item = v48.Name,
				Positions = {
					AllAxes = t2
				}
			}) then
				return
			end
			for v5, v62 in t do
				local v7 = v48:FindFirstChild(v62)
				if v7 then
					for v8, v9 in t5 do
						local v11 = v7:FindFirstChild(if v8 == "Rotation" then "Rotation" else "Position")
						if v11 then
							v9.DefaultValues = v9.DefaultValues or {}
							v9.DefaultValues[v62] = v11.Value
						end
					end
				end
			end
			v19.Notify({
				Message = "Applied position changes!",
				Preset = "Green"
			})
		end
	})
	v5.new(ContainerFrame.PositionMenu.Menu.Content.CancelButton, {
		Click = function() --[[ Click | Line: 940 | Upvalues: v48 (ref), t5 (ref), v52 (ref), v31 (ref) ]]
			if not v48 then
				return
			end
			for v1, v2 in { "XAxis", "YAxis", "ZAxis" } do
				for v3, v4 in t5 do
					local v5 = if v3 == "Rotation" then "Rotation" else "Position"
					local v6 = v4.DefaultValues and v4.DefaultValues[v2]
					if v6 ~= nil then
						local v7 = v48:FindFirstChild(v2)
						if v7 then
							local v8 = v7:FindFirstChild(v5)
							if v8 then
								v8.Value = v6
								if v2 == v52:get() then
									v4.UpdateVisual(v6)
								end
								if v31 and v31.SlotInfo:FindFirstChild("EquippedEquipment") then
									local v9 = v31.SlotInfo.EquippedEquipment:FindFirstChild(v48.Name)
									if v9 then
										local v10 = v9:FindFirstChild(v2)
										if v10 then
											local v11 = v10:FindFirstChild(v5)
											if v11 then
												v11.Value = v6
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	})
end
function t.EnterMode(p1, p2) --[[ EnterMode | Line: 979 | Upvalues: v25 (copy), v44 (ref), v33 (copy), v31 (ref), v32 (copy), LocalPlayer (copy), v34 (copy), v7 (copy), CurrentCamera (copy), v56 (copy), v30 (ref), v29 (ref), v28 (ref), getCameraCFrame (copy), TweenService (copy), v8 (copy), RunService (copy), v17 (copy), v35 (ref), v4 (copy), v36 (ref), UserInputService (copy), v42 (ref), v40 (ref), v41 (ref), doUpdate (copy), v39 (ref), v16 (copy), v1 (copy), ContainerFrame (copy), v26 (copy), v9 (copy) ]]
	if v25:IsInAction("CustomiseMode") and tick() - v44 < 0.5 then
		return
	end
	v44 = tick()
	v25:SetActionState("CustomiseMode", p2.Name)
	v33:DoCleaning()
	v31 = p2
	v32:set(v25:GetAnimalSlot(p2.Name))
	LocalPlayer.Character.Humanoid:UnequipTools()
	if v25:GetCurrentAnimal() then
		v25.Character.Humanoid.JumpPower = game.StarterPlayer.CharacterJumpPower
		v25.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
	task.wait()
	local v12 = v32:get()
	for k, v in pairs({ "ChildAdded", "ChildRemoved" }) do
		v33:GiveTask(v12.EquippedEquipment[v]:Connect(function(p1) --[[ Line: 1003 | Upvalues: v34 (ref), v (copy) ]]
			v34:Fire(if v == "ChildAdded" then p1 else false)
		end))
	end
	v34:Fire()
	v7.SetWorldspaceGuiVisibility(false)
	CurrentCamera.CameraType = Enum.CameraType.Scriptable
	v56()
	v30 = p2:GetPrimaryPartCFrame()
	v29 = CurrentCamera.CFrame
	local v2, v3, v43, v5 = getCameraCFrame(p2)
	v28 = v2
	_ = v43
	local v6, _2, v72 = v2:ToOrientation()
	local _3, v82 = (CFrame.new((p2:GetPivot() * CFrame.new(0, 0, -10)).p, p2:GetPivot().p) * CFrame.Angles(0, 0.6108652381980153, 0)):ToOrientation()
	local v92 = v6 - 0.2617993877991494
	v28 = CFrame.new(p2:GetPivot().p) * CFrame.fromEulerAnglesYXZ(v92, v82, v72) * v3 * v5
	LastTween = TweenService:Create(CurrentCamera, TweenInfo.new(0.75), {
		CFrame = v28
	})
	v8.setLightingMode("CustomiseAnimal", true)
	LastTween:Play()
	v33:GiveTask(RunService.Heartbeat:Connect(function(p1) --[[ Line: 1039 | Upvalues: getCameraCFrame (ref), p2 (copy), v17 (ref), CurrentCamera (ref), v92 (ref), v82 (copy), v72 (copy), v35 (ref), v4 (ref) ]]
		if LastTween.PlaybackState ~= Enum.PlaybackState.Playing then
			local _, v1, v2, v3 = getCameraCFrame(p2)
			v17.target(CurrentCamera, 1, 1.275, {
				CFrame = CFrame.new(p2:GetPivot().p) * CFrame.fromEulerAnglesYXZ(v92, v82, v72) * v2 * v1 * v3
			})
			local BodyGyro = p2.PrimaryPart.BodyGyro
			BodyGyro.CFrame = BodyGyro.CFrame * CFrame.Angles(0, v35, 0)
			v35 = v4.lerp(v35, 0, 0.1)
		end
	end))
	v33:GiveTask(function() --[[ Line: 1052 | Upvalues: v17 (ref), CurrentCamera (ref), v35 (ref), v36 (ref) ]]
		v17.stop(CurrentCamera)
		v35 = 0
		v36 = 0
	end)
	v33:GiveTask(UserInputService.TouchPinch:Connect(function(p1, p2, p3, p4, p5) --[[ Line: 1059 | Upvalues: v42 (ref), v40 (ref), v4 (ref) ]]
		v42 = p4
		v40 = v4.lerp(v40, math.clamp(v40 * p2, 0, 1), 0.35)
	end))
	v33:GiveTask(UserInputService.TouchMoved:Connect(function(p1, p2) --[[ Line: 1064 | Upvalues: v41 (ref), doUpdate (ref), UserInputService (ref) ]]
		if not p2 then
			v41 = true
			doUpdate({
				UserInputType = Enum.UserInputType.MouseMovement
			}, p1.Position, p1.Delta)
			UserInputService.TouchEnded:Wait()
			v41 = false
		end
	end))
	local v10 = false
	v33:GiveTask(UserInputService.InputChanged:Connect(function(p1, p2) --[[ Line: 1073 | Upvalues: v10 (ref), doUpdate (ref) ]]
		if v10 then
			return
		end
		if p2 then
			return
		end
		local v1 = if p1.UserInputType == Enum.UserInputType.Gamepad1 then if p1.KeyCode == Enum.KeyCode.Thumbstick2 then true else false else false
		if v1 then
			v10 = true
			while task.wait() do
				local v2, v3
				if v10 == false then
					break
				end
				v3 = p1
				v2 = v1 and p1.Delta
				doUpdate(p1, nil, v2)
				p1 = v3
			end
		else
			doUpdate(p1, nil, if v1 then p1.Delta else v1)
		end
	end))
	v33:GiveTask(UserInputService.InputBegan:Connect(function(p1, p2) --[[ Line: 1087 | Upvalues: v39 (ref) ]]
		if p2 then
			return
		end
		if p1.KeyCode ~= Enum.KeyCode.ButtonR3 then
			return
		end
		if v39 < 0.3 then
			v39 = 0.3
			return
		end
		if v39 < 0.6 then
			v39 = 0.6
			return
		end
		if v39 >= 0.6 and v39 < 1 then
			v39 = 1
			return
		end
		if not (v39 >= 1) then
			return
		end
		v39 = 0
	end))
	v33:GiveTask(UserInputService.InputEnded:Connect(function(p1, p2) --[[ Line: 1101 | Upvalues: v10 (ref) ]]
		if not p2 then
			v10 = false
		end
	end))
	v16.ResetGamepadSelection()
	v1.OpenMainFrame(ContainerFrame, {
		Blur = false,
		DisableControls = true,
		CloseAll = true
	})
	v26:InvokeServer(p2.Name)
	v9.UpdateVisibility({
		ExcludeAnimal = p2.Name
	})
end
function t.ExitMode(p1) --[[ ExitMode | Line: 1127 | Upvalues: v25 (copy), v33 (copy), CurrentCamera (copy), v56 (copy), TweenService (copy), v29 (ref), v8 (copy), v1 (copy), v7 (copy), v16 (copy), v26 (copy), v9 (copy) ]]
	if not v25:IsInAction("CustomiseMode") then
		return
	end
	v25:SetActionState("CustomiseMode", "")
	_G.HidePlayersAndAnimals = nil
	v33:DoCleaning()
	local v12
	if not LastTween then
		CurrentCamera.CameraType = Enum.CameraType.Custom
		v56()
		v12 = TweenService:Create(CurrentCamera, TweenInfo.new(0.75), {
			FieldOfView = 70,
			CFrame = v29
		})
		v8.setLightingMode("CustomiseAnimal", false, nil, true)
		v12:Play()
		task.delay(0.76, function() --[[ Line: 1151 | Upvalues: v1 (ref) ]]
			v1.OpenInteractMenu()
		end)
		v7.SetWorldspaceGuiVisibility(true)
		v16.ResetSelectionToTargetFrame()
		v16.OverwriteUISelect()
		v1.OpenHUD({
			ExcludeInteractMenu = true
		})
		v26:InvokeServer(false)
		v9.UpdateVisibility()
		return
	end
	LastTween:Cancel()
	CurrentCamera.CameraType = Enum.CameraType.Custom
	v56()
	v12 = TweenService:Create(CurrentCamera, TweenInfo.new(0.75), {
		FieldOfView = 70,
		CFrame = v29
	})
	v8.setLightingMode("CustomiseAnimal", false, nil, true)
	v12:Play()
	task.delay(0.76, function() --[[ Line: 1151 | Upvalues: v1 (ref) ]]
		v1.OpenInteractMenu()
	end)
	v7.SetWorldspaceGuiVisibility(true)
	v16.ResetSelectionToTargetFrame()
	v16.OverwriteUISelect()
	v1.OpenHUD({
		ExcludeInteractMenu = true
	})
	v26:InvokeServer(false)
	v9.UpdateVisibility()
end
function t.OnOpen(p1) --[[ OnOpen | Line: 1168 | Upvalues: v1 (copy), ContainerFrame (copy), v49 (copy), v12 (copy), v32 (copy), v14 (copy), v56 (copy), v50 (copy), v6 (copy), v3 (copy), v10 (copy), v11 (copy), v34 (copy), v5 (copy), t6 (ref), v15 (copy), v25 (copy), v48 (ref), v19 (copy), v53 (copy), setApplyButton (copy), createPalette (copy), v45 (copy), t3 (copy), getUnequipped (copy), v43 (ref), v23 (copy), v21 (copy), getEquipped (copy), v18 (copy), v22 (copy), v46 (copy) ]]
	local v13 = v1.getFrameFromInstance(ContainerFrame)
	if not v13.Opened then
		v13.Opened = true
		for k, v in pairs(ContainerFrame.Accessories.SortButtons:GetChildren()) do
			if v:IsA("ImageButton") then
				v49:subscribe(function(p1) --[[ Line: 1177 | Upvalues: v (copy) ]]
					v.UIScale.Scale = if v.Name == p1 then 1.18 else 1
				end)
				v12.new(v, {
					Click = function() --[[ Click | Line: 1182 | Upvalues: v32 (ref), v14 (ref), v (copy), v56 (ref), v50 (ref) ]]
						local v1 = v14:GetAllEquippedOnBodyPart(v32:get(), v.Name)
						if v1[1] then
							v56(v1[1])
						end
						v50:set(v.Name)
					end
				})
				local EditButton = v:FindFirstChild("EditButton")
				if EditButton then
					v12.new(v.EditButton, {
						Click = function() --[[ Click | Line: 1196 | Upvalues: v32 (ref), v14 (ref), v (copy), v56 (ref), v50 (ref) ]]
							local v1 = v14:GetAllEquippedOnBodyPart(v32:get(), v.Name)
							if v1[1] then
								v56(v1[1])
							end
							v50:set(v.Name)
						end
					})
				end
				v12.new(v.RemoveButton, {
					Click = function() --[[ Click | Line: 1208 | Upvalues: v32 (ref), v14 (ref), v (copy), v6 (ref) ]]
						local v1 = v32:get()
						local v2 = if v1 then v14:GetAllEquippedOnBodyPart(v1, v.Name) else v1
						if not v2[1] then
							return
						end
						v6.GetRemoteFunction("UnequipEquipmentRemote"):InvokeServer(v1.Name, v2[1].Name)
					end
				})
				local v2 = v3.new()
				local function setEquippedItem(p1) --[[ setEquippedItem | Line: 1218 | Upvalues: v2 (copy), v32 (ref), v14 (ref), v (copy), v10 (ref), v11 (ref), v56 (ref), EditButton (copy) ]]
					v2:DoCleaning()
					local v1 = v32:get()
					local v22 = if v1 then v14:GetAllEquippedOnBodyPart(v1, v.Name) else v1
					if v22[1] then
						if p1 then
							task.wait()
						end
						v2:GiveTask(v10.new({
							DoNotClone = true,
							Item = v11.GetByName(v22[1].Value),
							DataValue = v22[1],
							GuiObject = v.AccessoryContainer
						}))
						if p1 == v22[1] then
							task.wait()
							v56(v22[1])
						end
						v.AccessoryContainer.Visible = true
						v.ImageLabel.Visible = false
						if not EditButton then
							v.RemoveButton.Visible = true
							return
						end
						EditButton.Visible = true
						v.RemoveButton.Visible = true
					else
						v.AccessoryContainer.Visible = false
						v.ImageLabel.Visible = true
						if not EditButton then
							v.RemoveButton.Visible = false
							return
						end
						EditButton.Visible = false
						v.RemoveButton.Visible = false
					end
				end
				v34:Connect(setEquippedItem)
				setEquippedItem(true)
			end
		end
		v50:subscribe(function(p1) --[[ Line: 1260 | Upvalues: ContainerFrame (ref) ]]
			ContainerFrame.Accessories.Menu.Content.Title.Text = if p1 then p1 .. "s" or "Accessories" else "Accessories"
		end)
		v5.new(ContainerFrame.RecolorMenu.Menu.Content.ApplyButton, {
			Click = function() --[[ Click | Line: 1265 | Upvalues: t6 (ref), v15 (ref), v14 (ref), v25 (ref), v48 (ref), v32 (ref), v6 (ref), v19 (ref), v53 (ref) ]]
				if not next(t6) then
					v15.NotifyIssue("NoEditedColors")
					return
				end
				local v1 = v14.CanItemBeEdited(v25, v48)
				if v1 ~= true then
					v15.NotifyIssue(v1)
					return
				end
				local v2 = v32:get()
				if not v6.GetRemoteFunction("ColorEquipmentRemote"):InvokeServer({
					Slot = v2.Name,
					Item = v48.Name,
					Regions = t6
				}) then
					return
				end
				v19.Notify({
					Message = "Applied edits to colors!",
					Preset = "Green"
				})
				task.wait()
				t6 = {}
				_G.EditedColors = t6
				v53:Fire()
			end
		})
		v53:Connect(setApplyButton)
		ContainerFrame.RecolorMenu.Menu.Content.ApplyButton.Visible = next(t6)
		ContainerFrame.RecolorMenu.Menu.Content.EditPrompt.Visible = not ContainerFrame.RecolorMenu.Menu.Content.ApplyButton.Visible
		for k, v in pairs(v11.GetType("EquipmentPalettes")) do
			local v33 = v25:GetItemValue(k)
			if v33 then
				if v.Default then
					createPalette(v33, true)
					continue
				end
				v45:GiveTask(v33:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 1308 | Upvalues: v33 (copy), createPalette (ref), t3 (ref) ]]
					if v33.Value > 0 then
						createPalette(v33)
						return
					end
					local v1 = v33
					if t3[v1] then
						t3[v1]:Destroy()
						t3[v1] = nil
					end
				end))
				if v33.Value > 0 then
					createPalette(v33, true)
				end
				continue
			end
			warn("No item value found for", k)
		end
	end
	if v13.ContentsLoaded then
		return
	end
	v13.ContentsLoaded = true
	local t = {}
	local v4 = v45:GiveTask(v3.new())
	local v52 = ContainerFrame.Accessories.Menu.Content.Catalog.Content
	local function reify(p1, p2, p3, p4) --[[ reify | Line: 1336 | Upvalues: v12 (ref), getUnequipped (ref), v19 (ref), v14 (ref), v25 (ref), v32 (ref), v15 (ref), v43 (ref), v6 (ref), v23 (ref), v21 (ref), getEquipped (ref), v18 (ref) ]]
		p2.Maid:DoCleaning()
		if not p4 then
			return
		end
		p1.Name = p2.ItemData.Name
		p2.Maid:GiveTask(v12.new(p1, {
			Click = function() --[[ Click | Line: 1346 | Upvalues: getUnequipped (ref), p2 (copy), v19 (ref), v14 (ref), v25 (ref), v32 (ref), v15 (ref), v43 (ref), v6 (ref) ]]
				local v1 = getUnequipped(p2.Values)
				if not v1 then
					v19.Notify({
						Message = "All variants are equipped! Unequip one from a horse first.",
						Preset = "Red"
					})
					return
				end
				local v2 = v14:CanEquipItem(v25, v32:get(), v1)
				if v2 ~= true then
					v15.NotifyIssue(v2)
					return
				end
				if not v43 then
					v43 = true
					task.delay(1.5, function() --[[ Line: 1372 | Upvalues: v43 (ref) ]]
						v43 = false
					end)
					v6.GetRemoteFunction("EquipEquipmentRemote"):InvokeServer(v32:get().Name, v1)
				end
			end
		}))
		p2.Maid:GiveTask(v23:Create({
			Viewport = p1.Content.Viewport,
			Item = p2.ItemData
		}))
		local v1 = v25:GetItemFolder("Animals")
		local v3 = #getEquipped(p2.Values) > 0
		local v4 = v21.new(v3)
		for v5, v62 in v1:GetChildren() do
			local EquippedEquipment = v62:FindFirstChild("EquippedEquipment")
			if EquippedEquipment then
				for v7, v8 in { EquippedEquipment.ChildAdded, EquippedEquipment.ChildRemoved } do
					p2.Maid:GiveTask(v8:Connect(function() --[[ Line: 1396 | Upvalues: p2 (copy), v4 (copy), getEquipped (ref) ]]
						p2.Maid._equipped = task.defer(function() --[[ Line: 1397 | Upvalues: v4 (ref), getEquipped (ref), p2 (ref) ]]
							v4:set(#getEquipped(p2.Values) > 0)
						end)
					end))
				end
			end
		end
		p2.Maid:GiveTask(v4:subscribe(function(p12) --[[ Line: 1404 | Upvalues: p1 (copy) ]]
			p1.EquippedOnSlot.Visible = p12
		end))
		p1.Content.NameLabel.Text = v18.GetDisplayName(p2.ItemData.Name, p2.ItemData)
	end
	local v62 = v45:GiveTask(v22.new({
		ItemsPerRow = 3,
		ItemSpacing = 12,
		UpdateThrottle = 0.3,
		ScrollingFrame = v52,
		TemplateFrame = v52.Default,
		GetItemHeight = function(p1, p2) --[[ GetItemHeight | Line: 1419 | Upvalues: v52 (copy) ]]
			return (v52.AbsoluteSize.Y - 48) / 5
		end,
		GetItemWidth = function(p1, p2) --[[ GetItemWidth | Line: 1429 | Upvalues: v52 (copy) ]]
			return (v52.AbsoluteSize.X - 24) / 3 - v52.ScrollBarThickness
		end,
		OnItemHidden = reify,
		OnItemVisible = function(p1, p2, p3) --[[ OnItemVisible | Line: 1442 | Upvalues: reify (copy) ]]
			reify(p1, p2, p3, true)
		end,
		UpdateContent = function(p1, p2, p3) --[[ UpdateContent | Line: 1446 | Upvalues: reify (copy) ]]
			reify(p1, p2, p3, true)
		end
	}))
	local function update() --[[ update | Line: 1451 | Upvalues: t (copy), v3 (ref), v50 (ref), v32 (ref), ContainerFrame (ref), v62 (copy) ]]
		table.sort(t, function(p1, p2) --[[ Line: 1452 ]]
			local ItemData = p1.ItemData
			local ItemData_2 = p2.ItemData
			local Index = ItemData.Rarity.Index
			local Index_2 = ItemData_2.Rarity.Index
			if Index_2 < Index then
				return true
			end
			if Index < Index_2 then
				return false
			end
			if ItemData.Name < ItemData_2.Name then
				return true
			end
			return false
		end)
		for v1, v2 in t do
			v2.Maid = v2.Maid or v3.new()
			v2.Maid:DoCleaning()
		end
		local v4 = v50:get()
		local Species = v32:get().Species.Value
		local v5 = table.clone(t)
		for i = #v5, 1, -1 do
			local ItemData = v5[i].ItemData
			local v6 = if ItemData.BodyPart == nil then true else false
			local v7 = if v6 then v6 elseif ItemData.BodyPart == v4 then true else false
			local v8 = if ItemData.Species == nil then true else false
			if not (v7 and (if v8 then v8 elseif Species == ItemData.Species then true else false)) then
				table.remove(v5, i)
			end
		end
		local v10 = ContainerFrame.Accessories.Menu.Content.SearchBar.Content.TextBox.ContentText:lower():gsub(" ", "")
		local v11
		if string.len(v10) > 0 then
			v11 = v10
			for j = #v5, 1, -1 do
				local v12 = v5[j]
				if not string.find(v12.ItemData.Name:lower():gsub(" ", ""), v10) then
					local v14 = false
					for v15, v16 in v12.Values do
						local Theme = v16:FindFirstChild("Theme")
						local v17 = if Theme and Theme.Value ~= "" then Theme.Value else ""
						if v17 ~= "" then
							v14 = string.find(v17:lower():gsub(" ", ""), v10) and true or false
							if v14 then
								break
							end
						end
					end
					if not v14 then
						table.remove(v5, j)
					end
				end
			end
		else
			v11 = v10
		end
		ContainerFrame.Accessories.Menu.Content.Catalog.EmptyLabel.Visible = if #v5 == 0 then true else false
		if #v5 == 0 then
			local v20 = ("You do not have any %* accessories!"):format(v4)
			ContainerFrame.Accessories.Menu.Content.Catalog.EmptyLabel.Text = if string.len(v11) > 0 then ("No %* accessories found with this search..."):format(v4) else v20
		end
		if not v62.SetData then
			return
		end
		v62:SetData(v5)
	end
	v21.fromProperty(ContainerFrame.Accessories.Menu.Content.SearchBar.Content.TextBox, "ContentText"):subscribe(function() --[[ Line: 1587 | Upvalues: v4 (copy), update (copy) ]]
		v4._thread = task.defer(update)
	end)
	v32:subscribe(function() --[[ Line: 1591 | Upvalues: v4 (copy), update (copy) ]]
		v4._thread = task.defer(update)
	end)
	local function onChildChanged(p1, p2, p3) --[[ onChildChanged | Line: 1595 | Upvalues: v11 (ref), t (copy), v4 (copy), update (copy) ]]
		if not p1:IsA("ValueBase") then
			return
		end
		local v2 = v11.GetByName(p1.Value)
		if not v2 then
			return
		end
		local v3 = nil
		for v42, v5 in t do
			if v2.Name == v5.ItemData.Name then
				v3 = v5
				break
			end
		end
		local v6 = if v3 then v3 else {}
		v6.ItemData = v6.ItemData or v2
		v6.Values = v6.Values or {}
		if p2 == "Added" then
			table.insert(v6.Values, p1)
			if not table.find(t, v6) then
				table.insert(t, v6)
			end
		elseif p2 == "Removed" then
			local v9 = table.find(v6.Values, p1)
			if v9 then
				table.remove(v6.Values, v9)
			end
			local v10 = v6
			local count = 0
			for v112, v12 in v10.Values do
				count = count + 1
			end
			if count == 0 then
				local v13 = table.find(t, v10)
				if v13 then
					table.remove(t, v13)
				end
			end
		end
		if not p3 then
			return
		end
		v4._thread = task.defer(update)
	end
	v45:GiveTask(v46.ChildAdded:Connect(function(p1) --[[ Line: 1656 | Upvalues: onChildChanged (copy) ]]
		onChildChanged(p1, "Added", true)
	end))
	v45:GiveTask(v46.ChildRemoved:Connect(function(p1) --[[ Line: 1660 | Upvalues: onChildChanged (copy) ]]
		onChildChanged(p1, "Removed", true)
	end))
	for k, v in pairs(v46:GetChildren()) do
		onChildChanged(v, "Added")
	end
	v45:GiveTask(v50:subscribe(function() --[[ Line: 1668 | Upvalues: v4 (copy), update (copy) ]]
		v4._thread = task.defer(update)
	end))
	v4._thread = task.defer(update)
end
function t.Cleanup(p1) --[[ Cleanup | Line: 1676 | Upvalues: v45 (copy), t2 (ref), v1 (copy), ContainerFrame (copy) ]]
	v45:DoCleaning()
	for k, v in pairs(t2) do
		if t2[k] then
			t2[k]:Destroy()
			t2[k] = nil
		end
	end
	t2 = {}
	v1.CleanContents(ContainerFrame)
end
function t.Init(p1) --[[ Init | Line: 1686 | Upvalues: v1 (copy), ContainerFrame (copy), t (copy), v5 (copy), setupPositionMenu (copy) ]]
	v1.AddFrame(ContainerFrame, {
		KeepPosition = true,
		ShortcutToClose = true,
		ExcludeInteractMenu = true,
		OpenPosition = ContainerFrame.Position,
		SelectOnOpen = ContainerFrame.Accessories.SortButtons.Hat
	})
	v1.AddStateCallback(ContainerFrame, "OnOpen", function() --[[ Line: 1695 | Upvalues: t (ref) ]]
		t:OnOpen()
	end)
	v1.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 1698 | Upvalues: t (ref) ]]
		t:ExitMode()
	end)
	v1.AddStateCallback(ContainerFrame, "OnCleanup", function() --[[ Line: 1701 | Upvalues: t (ref) ]]
		t:Cleanup()
	end)
	v5.new(ContainerFrame.Accessories.CloseButton, {
		Click = function() --[[ Click | Line: 1706 | Upvalues: t (ref) ]]
			t:ExitMode()
		end
	})
	setupPositionMenu()
end
t:Init()
return t