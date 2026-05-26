-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Utility")
Library:Load("Events")
local v2 = Library:Load("SoundFX")
local v3 = Library:Load("CameraUtil")
local v4 = Library:Load("Network")
local v5 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = game.Players.LocalPlayer
local v6 = LocalPlayer:GetMouse()
local HapticEffect = Instance.new("HapticEffect")
HapticEffect.Position = Vector3.new(0, 0, 0)
HapticEffect.Radius = 1
HapticEffect.Type = Enum.HapticEffectType.UIHover
HapticEffect.Parent = workspace
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local MainGui = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui")
local GameService = workspace.GameService
local v7 = nil
local v8 = nil
local v9 = false
local v10 = nil
local v11 = nil
local v12 = nil
local v13 = nil
local v14 = v1:SendData("GetJobsCompleted", "PlayerChannel", 10) or v1:SendData("GetJobsCompleted", "PlayerChannel", 10) or {
	Cook = 0,
	Cashier = 0,
	["Pizza Boxer"] = 0,
	Delivery = 0,
	Supplier = 0
}
workspace.Main.RefreshJobsCompleted.OnClientEvent:connect(function(p1) --[[ Line: 83 | Upvalues: v14 (ref) ]]
	v14 = p1
end)
local v15 = false
workspace.TutorialService.TutorialEnabled.OnClientEvent:connect(function(p1) --[[ Line: 91 | Upvalues: v15 (ref) ]]
	_G.TutorialEnabled = p1
	v15 = p1
end)
while LocalPlayer.Character == nil or LocalPlayer.Character:FindFirstChild("Humanoid") == nil do
	wait(0.1)
end
local t = {
	Cook = 5,
	["Pizza Boxer"] = 5,
	Delivery = 5,
	Supplier = 10
}
GameService.RecivedCustomerOrder.OnClientEvent:connect(function(p1, p2) --[[ Line: 114 | Upvalues: v10 (ref), v11 (ref) ]]
	v10 = p1
	v11 = p2
end)
GameService.NofityFoodOrderComplete.OnClientEvent:connect(function(p1, p2) --[[ Line: 119 ]]
	if p2 ~= nil then
		flashRegisterButton(p2, p1)
	end
end)
function flashRegisterButton(p1, p2) --[[ flashRegisterButton | Line: 124 ]]
	if not p1:FindFirstChild("SG") then
		return
	end
	local Frame = p1.SG.Frame
	if p2 then
		Frame.Check.Image = "http://www.roblox.com/asset/?id=168397389"
	else
		Frame.Check.Image = "http://www.roblox.com/asset/?id=168401336"
		p1.Sparkles.Enabled = true
	end
	delay(1.5, function() --[[ Line: 134 | Upvalues: p1 (copy), Frame (copy) ]]
		p1.Sparkles.Enabled = false
		Frame.Check.Image = ""
	end)
end
function changeJob(p1) --[[ changeJob | Line: 137 | Upvalues: LocalPlayer (copy), v1 (copy) ]]
	local v12 = LocalPlayer.Team.Name
	if not v12 or (v12 == p1 or v12 == "Manager") then
		return
	end
	v1:SendData("ChangeJob", "PlayerChannel", nil, p1)
end
LocalPlayer.Changed:connect(function(p1) --[[ Line: 147 | Upvalues: MainGui (copy), LocalPlayer (copy), v5 (copy) ]]
	if p1 ~= "TeamColor" then
		return
	end
	local JobChange = MainGui.Notifications.JobChange
	JobChange.JobName.TextColor3 = LocalPlayer.TeamColor.Color
	JobChange.JobName.Text = v5.BrickColorToTeamName[LocalPlayer.TeamColor.Number]
	JobChange:TweenPosition(UDim2.new(1, 0, 0.8, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 1, true)
	delay(3, function() --[[ Line: 155 | Upvalues: JobChange (copy) ]]
		JobChange:TweenPosition(UDim2.new(1, JobChange.AbsoluteSize.X + 1, 0.8, 0), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 1, true)
		wait(1)
	end)
end)
local SelectionBox = Instance.new("SelectionBox")
SelectionBox.Parent = script
local FloorWire = Instance.new("FloorWire")
FloorWire.Transparency = 0.5
FloorWire.WireRadius = 0
FloorWire.TextureSize = Vector2.new(2, 2)
FloorWire.Texture = "http://www.roblox.com/asset/?id=168194931"
FloorWire.Parent = script
local_parts = workspace.Spots
local_parts.Parent = game.ReplicatedStorage
local v16 = nil
local v17 = nil
local v18 = Vector3.new(0, 0, 0)
local v19 = 0
local v20 = 0
local Dragger = Instance.new("Dragger")
local function SetDoughIngredientSquish(p1) --[[ SetDoughIngredientSquish | Line: 208 ]] end
function displayGuideArrows(p1) --[[ displayGuideArrows | Line: 229 | Upvalues: FloorWire (copy) ]]
	FloorWire.To = p1
	if p1.Name ~= "Bottom" and script:FindFirstChild(p1.Name) then
		script[p1.Name].Enabled = true
	end
	script.ArrowBillboardGui.Enabled = true
	script.ArrowBillboardGui.Adornee = p1
end
local v21 = game:GetService("UserInputService").TouchEnabled and not game:GetService("UserInputService").MouseEnabled and not game:GetService("UserInputService").KeyboardEnabled
local UserInputService_2 = game:GetService("UserInputService")
local function OnClientInvoke() --[[ OnClientInvoke | Line: 242 | Upvalues: v21 (copy) ]]
	return v21
end
workspace.TutorialService.IsTouchEnabled.OnClientInvoke = OnClientInvoke
local CurrentCamera = workspace.CurrentCamera
local v22 = nil
local X = MainGui.AbsoluteSize.X
local Y = MainGui.AbsoluteSize.Y
local v23 = nil
game:GetService("RunService")
function cameraLock(p1) --[[ cameraLock | Line: 256 | Upvalues: v21 (copy), CurrentCamera (copy), LocalPlayer (copy), v22 (ref), v3 (copy), UserInputService_2 (copy), X (copy) ]]
	if not (v21 and _G.StartedPlaying) then
		return
	end
	if p1 then
		script.CameraLock.Value = true
		CurrentCamera.CameraType = "Scriptable"
		LocalPlayer.Character.Humanoid.WalkSpeed = 0
		if v22 then
			v22:disconnect()
			v3:EndTweenPan()
			v22 = nil
		end
		v22 = UserInputService_2.InputChanged:connect(function(p1, p2) --[[ Line: 271 | Upvalues: X (ref), v3 (ref), LocalPlayer (ref) ]]
			if p1.UserInputType ~= Enum.UserInputType.Touch then
				return
			end
			local Position = p1.Position
			if Position.X < X / 8 then
				v3:TweenPan(LocalPlayer, -1.5)
				return
			end
			if X - X / 8 < Position.X then
				v3:TweenPan(LocalPlayer, 1.5)
				return
			end
			v3:EndTweenPan()
		end)
	else
		script.CameraLock.Value = false
		CurrentCamera.CameraType = "Custom"
		if v22 then
			v22:disconnect()
			v3:EndTweenPan()
			v22 = nil
		end
		LocalPlayer.Character.Humanoid.WalkSpeed = if game.ReplicatedStorage.GlobalData.DoubleTime.Value or game.ReplicatedStorage.GlobalData.NeonTime.Value then 23 else game.StarterPlayer.CharacterWalkSpeed
	end
end
function SurfaceGuisEnabled(p1, p2) --[[ SurfaceGuisEnabled | Line: 306 ]]
	for i, v in ipairs(p1:GetChildren()) do
		if v:IsA("SurfaceGui") then
			v.Enabled = p2
		end
	end
end
local v24 = nil
function copyLocal(p1) --[[ copyLocal | Line: 316 | Upvalues: v8 (ref), v24 (ref) ]]
	v8 = p1:clone()
	v8.Parent = p1.Parent
	v8.CFrame = p1.CFrame
	v8.Name = "LocalCopy"
	v8.CanCollide = false
	v8.Anchored = true
	v24 = p1
	p1.Parent = game.ReplicatedStorage
end
local function WaitForServerCopy(p1, p2) --[[ WaitForServerCopy | Line: 339 ]]
	local v1 = p2 and p2:GetAttribute("InstanceId") or math.random(1, 50000)
	task.spawn(function() --[[ Line: 341 | Upvalues: p1 (copy), v1 (copy) ]]
		p1.Name = "PlaceHolder"
		local v12
		if p1:IsA("BasePart") then
			p1.CanCollide = false
			p1.Anchored = true
		end
		v12 = nil
		v12 = game:GetService("CollectionService"):GetInstanceAddedSignal("MakesLocalCopies"):Connect(function(p12_2_2) --[[ Line: 351 | Upvalues: v1 (ref), v12 (ref), p1 (ref) ]]
			if p12_2_2:GetAttribute("InstanceId") ~= v1 then
				return
			end
			v12:Disconnect()
			p1:Destroy()
		end)
	end)
	return v1
end
local v25 = nil
local v26 = false
function onUp() --[[ onUp | Line: 403 | Upvalues: v6 (copy), v8 (ref), v17 (ref), v13 (ref), v16 (ref), v4 (copy), FloorWire (copy), v2 (copy), v9 (ref), v15 (ref), v7 (ref), v23 (ref), WaitForServerCopy (copy), v5 (copy), Dragger (copy), v12 (ref), v26 (ref) ]]
	if script.CameraLock.Value then
		cameraLock(false)
	end
	local Target = v6.Target
	local v1 = if v8 then v8.Position else nil
	if v17 and Target.Parent.Name ~= "Ingredients" then
		if Target.Name == "Dough" and not v13.SG.Frame:FindFirstChild("ImageLabel") then
			if v16.Parent ~= Target.SG.Frame then
				v16.Parent = Target.SG.Frame
			end
			v13:Destroy()
			local v22 = v16
			v16 = nil
			task.spawn(function() --[[ Line: 435 | Upvalues: Target (copy), v22 (copy) ]]
				Target.SG.Frame.ChildAdded:Wait()
				if not (v22 and v22.Parent) then
					return
				end
				v22:Destroy()
			end)
			v4:FireServer("AddIngredientToPizza", Target, v17)
		else
			local v3 = v13
			spawn(function() --[[ Line: 449 | Upvalues: v3 (copy) ]]
				wait(10)
				if not (v3 and v3.Parent) then
					return
				end
				v3:Destroy()
			end)
		end
		FloorWire.To = nil
		FloorWire.From = nil
		v6.TargetFilter = nil
		v2:PlaySound("Drop", v13)
		v6.Icon = ""
		v17 = nil
		v13 = nil
		v16 = nil
	else
		if v17 and Target.Parent.Name == "Ingredients" then
			v2:PlaySound("Drop", Target)
			v13:Destroy()
			v13 = nil
			v16 = nil
			v17 = nil
			v6.Icon = ""
			return
		end
		if not v9 then
			return
		end
		cameraLock(false)
		local v42 = true
		if v15 and (v7 and v7.Parent) then
			if v7.Name == "Dough" and (v7.Position - workspace.CookTable.Position).magnitude < 10 then
				workspace.TutorialService.PlayerAction:FireServer("DraggedToTable", true)
			elseif v7.Name == "Dough" and (v7.Position - workspace.DoughLock.Position).magnitude < 3 then
				workspace.TutorialService.PlayerAction:FireServer("DraggedToConvayer", true)
			elseif v7.Name == "Dough" and Target.Parent.Name == "Oven" then
				workspace.TutorialService.PlayerAction:FireServer("DraggedToOven", Target.Parent)
			elseif v7.Name == "BoxClosed" and (v7.Position - local_parts.BoxSpot.Position).magnitude < 18 then
				local v52 = v7
				spawn(function() --[[ Line: 510 | Upvalues: v52 (copy) ]]
					wait(0.5)
					if not (math.abs(v52.Position.Y - 5) < 1) then
						return
					end
					workspace.TutorialService.PlayerAction:FireServer("DraggedToDelivery", true)
				end)
			elseif v7.Name == "SupplyBox" then
				if (v7.Position - workspace.SupplyBelt.Position).magnitude < 18 and v7.Position.Z > -13 then
					workspace.TutorialService.PlayerAction:FireServer("DraggedToSupplyBelt", true)
				else
					for i, v in ipairs(workspace.Trucks:GetChildren()) do
						if v and (v:FindFirstChild("Bottom") and (v.Bottom.Position - v7.Position).magnitude < 13) then
							workspace.TutorialService.PlayerAction:FireServer("DraggedToTruck", true)
						end
					end
				end
			end
			v23 = v7
		end
		if v7.Name == "Dough" and v7.Size.Y == 1 then
			changeJob("Cook")
			v42 = false
			local v62 = v8
			local v72 = v8:clone()
			local v92 = v62.Position - Vector3.new(0, v62.Size.Y / 2 - 0.1, 0)
			v72.Size = Vector3.new(5, 0.2, 5)
			v72.Mesh:Destroy()
			Instance.new("CylinderMesh").Parent = v72
			v72.Position = v92
			v72.Parent = workspace.AllDough
			v2:PlaySound("DoughPlop")
			v8.Parent = nil
			WaitForServerCopy(v72, v7)
			if v5.IsStudio then
				wait()
			end
			v4:FireServer("SquishDough", v7)
			v7.Parent = nil
		else
			v2:PlaySound("Drop", v7)
		end
		if v7.Name == "Dough" and (Target.Parent.Name == "Trash" and v7:FindFirstChild("Fire") == nil) then
			v2:PlaySound("Trash", v7)
			v7.CanCollide = false
		end
		if v7.Name == "BoxClosed" and (v7:FindFirstChild("Logo") and not (v7.HasPizzaInside.Value or v7:GetAttribute("WasClosed"))) then
			changeJob("Pizza Boxer")
			v42 = false
			local v10 = game.ReplicatedStorage.Supplies.BoxOpen:clone()
			v10.CFrame = v8.CFrame + Vector3.new(0, 1.874, 0)
			v10.Parent = workspace.AllBox
			v2:PlaySound("BoxOpen", workspace.BoxingTable)
			v8.Parent = nil
			WaitForServerCopy(v10, v7)
			if v5.IsStudio then
				wait()
			end
			v4:FireServer("OpenBox", v7)
			v7.Parent = nil
			if v15 then
				workspace.TutorialService.PlayerAction:FireServer("BoxOpened", true)
			end
		end
		if v15 and (v7 and (v7.Name == "Pizza" and (Target.Name == "BoxOpen" and Target.Pizza.Value == v7))) then
			workspace.TutorialService.PlayerAction:FireServer("PizzaPlacedInsideBox", Target)
		end
		v6.Icon = ""
		v6.TargetFilter = nil
		v9 = false
		Dragger:MouseUp()
		FloorWire.To = nil
		FloorWire.From = nil
		script.TableSpot.Enabled = false
		script.OvenSpot.Enabled = false
		script.DewSpot.Enabled = false
		script.DewSpot2.Enabled = false
		script.SupplyBoxSpot.Enabled = false
		script.BoxSpot.Enabled = false
		script.ArrowBillboardGui.Enabled = false
		local v11 = v7
		local v122 = v8
		v7 = nil
		if v42 then
			if v122.Parent ~= game.ReplicatedStorage then
				local count = 30
				while (v1 - v11.Position).magnitude > 0.0005 and count > 0 do
					wait()
					count = count - 1
				end
			end
			if v11.Name ~= "Pizza" or Target.Name ~= "BoxOpen" then
				v4:FireServer("UpdateProperty", v11, "Anchored", false)
			end
			v122:Destroy()
			if v11.Parent == game.ReplicatedStorage then
				v11.Parent = v12
			end
		end
		v26 = false
	end
end
local v27 = not v5.IsPartyServer and workspace.Drawer["Pizza Slicer"].Center.ArrowBillboardGui
function AnimateSlicerArrow() --[[ AnimateSlicerArrow | Line: 672 | Upvalues: v27 (copy) ]]
	if not v27 then
		return
	end
	if not v27.Enabled then
		v27.Enabled = true
		task.spawn(function() --[[ Line: 676 | Upvalues: v27 (ref) ]]
			while v27.Enabled do
				game:GetService("TweenService"):Create(v27, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
					StudsOffset = Vector3.new(0, 2, 0)
				}):Play()
				task.wait(0.5)
				game:GetService("TweenService"):Create(v27, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
					StudsOffset = Vector3.new(0, 1.5, 0)
				}):Play()
				task.wait(0.5)
			end
		end)
		task.delay(2, function() --[[ Line: 684 | Upvalues: v27 (ref) ]]
			v27.Enabled = false
		end)
	end
end
function onDown(p1) --[[ onDown | Line: 695 | Upvalues: v6 (copy), CurrentCamera (copy), LocalPlayer (copy), v25 (ref), v14 (ref), v2 (copy), v18 (ref), v19 (ref), v9 (ref), v17 (ref), v21 (copy), v20 (ref), SelectionBox (copy), HapticEffect (copy), v10 (ref), v11 (ref), v4 (copy), v15 (ref), v13 (ref), v16 (ref), v5 (copy), v26 (ref), v23 (ref), FloorWire (copy), v8 (ref), v1 (copy), WaitForServerCopy (copy), v12 (ref), v7 (ref), Dragger (copy), t (copy), MainGui (copy), GuiManager (copy) ]]
	local v110 = _G.GamepadEnabled and Vector2.new(v6.X, v6.Y) or Vector2.new(p1.Position.X, p1.Position.Y)
	local v22 = CurrentCamera:ScreenPointToRay(v110.X, v110.Y)
	local v3 = Ray.new(v22.Origin, v22.Direction * 60)
	local v42 = workspace
	local t2 = {}
	local CollectionService = game.CollectionService
	t2[1] = LocalPlayer.Character
	t2[2] = v6.TargetFilter
	t2[3] = table.unpack(CollectionService:GetTagged("RaycastBlacklist"))
	local v52, v62, _ = v42:FindPartOnRayWithIgnoreList(v3, t2)
	if not (v52 and v52.Parent) then
		return
	end
	if LocalPlayer.Character:FindFirstChild("FireExtinguisher") then
		return
	end
	if script.CameraLock.Value then
		cameraLock(false)
	end
	if v52 == nil or v52.Parent == nil then
		return
	end
	v25 = nil
	if v52.Name == "PlaceHolder" then
		print("LOCAL PLACEHOLDER")
		return
	end
	if v14 == nil then
		print("ERROR jobcomplted null")
		return
	end
	if v52:FindFirstChild("Tutorial") and (v52.Tutorial.Value ~= nil and v52.Tutorial.Value ~= game.Players.LocalPlayer) then
		v2:PlaySound("Invalid")
		print("NOT ALLOWED")
		return
	end
	if LocalPlayer:DistanceFromCharacter(v62) > 120 then
		return
	end
	v18 = tick()
	v19 = v62
	if v9 or v17 then
		if not v21 then
			onUp()
			return
		end
		onMove()
		onUp()
	else
		v20 = 0
		local v72, v82, v92, v102, v112, v122, v132, v142, v152, v162, v172, v182, v192, v202, v212, v222, v232
		if (v52.Parent.Name == "Register1" or (v52.Parent.Name == "Register2" or v52.Parent.Name == "Register3")) and v52:FindFirstChild("Pressed") then
			SelectionBox.Adornee = nil
			changeJob("Cashier")
			if not v52.Pressed.Value then
				HapticEffect:Play()
				v2:PlaySound("RegisterButtonDown", v52)
				local v24 = v52.CFrame
				v52.CFrame = v52.CFrame + v52.CFrame.upVector / -5.3
				v52.Pressed.Value = true
				delay(0.1, function() --[[ Line: 754 | Upvalues: v52 (copy), v24 (copy), v2 (ref) ]]
					v52.CFrame = v24
					v52.Pressed.Value = false
					v2:PlaySound("RegisterButtonUp", v52)
				end)
			end
			local v262 = string.sub(v52.Name, 7)
			if v10 == nil or v11 == nil then
				workspace.GameService.RegisterButtonPressedNoCustomer:FireServer(v262, v52)
				if v52.Name == "BoxOpen" and (LocalPlayer.Character:FindFirstChild("Pizza Slicer") and (v52.Pizza.Value and v52.IsSliced.Value == false)) then
					v2:PlaySound("CutPizza")
					v2:PlaySound("CutObject")
					workspace.Animation.PlayAnimation.PlayAnimation:Fire("PizzaSlice")
					v52.IsSliced.Value = true
					v72 = game.ReplicatedStorage.SliceSeams:Clone()
					v72:PivotTo(v52.Pizza.Value.CFrame)
					v72.Parent = v52
					v1:Weld(v52.Pizza.Value, v72.Base)
					v82 = math.random(1, 50000)
					task.spawn(function() --[[ Line: 341 | Upvalues: v72 (copy), v82 (copy) ]]
						v72.Name = "PlaceHolder"
						local v12
						if v72:IsA("BasePart") then
							v72.CanCollide = false
							v72.Anchored = true
						end
						v12 = nil
						v12 = game:GetService("CollectionService"):GetInstanceAddedSignal("MakesLocalCopies"):Connect(function(p12_2_2) --[[ Line: 351 | Upvalues: v82 (ref), v12 (ref), v72 (ref) ]]
							if p12_2_2:GetAttribute("InstanceId") ~= v1 then
								return
							end
							v12:Disconnect()
							p1:Destroy()
						end)
					end)
					if v5.IsStudio then
						wait()
					end
					v4:FireServer("SlicePizza", v52, v82)
					v92 = game.ReplicatedStorage.SliceSplat:Clone()
					v92.Enabled = false
					v92.Parent = v52.Pizza.Value
					v92:Emit(10)
					if not LocalPlayer.Character:FindFirstChild("Pizza Slicer"):GetAttribute("IsGolden") then
						return
					end
					v102 = game.ReplicatedStorage.PlusTenPercent:Clone()
					v102.Parent = v52
					game:GetService("Debris"):AddItem(v102, 1)
				elseif v52.Name == "BoxOpen" and (not LocalPlayer.Character:FindFirstChild("Pizza Slicer") and (v52.Pizza.Value and v52.IsSliced.Value == false)) then
					v2:PlaySound("Invalid")
					if v52:FindFirstChild("NeedSlicer") then
						v52.NeedSlicer:Destroy()
					end
					v112 = game.ReplicatedStorage.NeedSlicer:Clone()
					v112.Parent = v52
					game:GetService("Debris"):AddItem(v112, 1)
					AnimateSlicerArrow()
					v4:FireServer("OpenDrawer")
				elseif v52.Name == "BoxOpen" and (v52.Pizza.Value ~= nil or not LocalPlayer.Character:FindFirstChild("Pizza Slicer")) then
					changeJob("Pizza Boxer")
					if v52.Pizza.Value then
						v52.Pizza.Value.Parent = nil
					end
					v122 = game.ReplicatedStorage.Supplies.BoxClosed:clone()
					v122.CFrame = v52.CFrame - Vector3.new(0, 2, 0)
					v122.Parent = workspace.AllBox
					v2:PlaySound("BoxClose", workspace.BoxingTable)
					WaitForServerCopy(v122, v52)
					if v5.IsStudio then
						wait()
					end
					v4:FireServer("CloseBox", v52)
					v52:Destroy()
					if not v15 then
						return
					end
					workspace.TutorialService.PlayerAction:FireServer("ClosedBox", true)
				else
					if not v52.Locked and (v52.Name == "Handle" and v52.Parent:IsA("Tool")) then
						if v15 and v52.Parent.Name == "PizzaTool" then
							workspace.TutorialService.PlayerAction:FireServer("GrabbedPizza", true)
						end
						v4:FireServer("AddPizzaToBackpack", v52.Parent)
					end
					if v5.Cutables[v52.Name] and (LocalPlayer.Character:FindFirstChild("Pizza Slicer") and (v1:ProxyCheck(LocalPlayer, v52.Position, 25) and LocalPlayer.Character["Pizza Slicer"]:GetAttribute("IsGolden"))) then
						v2:PlaySound("CutObject")
						v4:FireServer("SliceObject", v52)
						workspace.Animation.PlayAnimation.PlayAnimation:Fire("PizzaSlice")
						return
					end
					if v5.Dragables[v52.Name] then
						v132 = v52.CurrentDragger.Value
						if v132 and (v132 ~= LocalPlayer and v132.Parent ~= nil) then
							v2:PlaySound("Invalid")
							print("Another player already dragging")
							return
						end
						v2:PlaySound("PickUp", v52)
						v12 = v52.Parent
						v52.Transparency = 0
						copyLocal(v52)
						v7 = v52
						workspace.GameService.DraggingStarted:FireServer(v52)
						if v9 then
							Dragger:MouseUp()
						end
						cameraLock(true)
						v26 = true
						v6.Icon = "http://www.roblox.com/asset/?id=168756505"
						v9 = true
						v142 = Dragger
						v152 = v8
						v162 = -v52.Size.Y / 2
						v172 = { v8 }
						Dragger:MouseDown(v8, Vector3.new(0, v162, 0), v172)
						v4:FireServer("UpdateProperty", v52, "Anchored", true)
						v8.Rotation = Vector3.new(0, 0, 0)
						FloorWire.To = nil
						FloorWire.From = v8
						SelectionBox.Adornee = v8
						SelectionBox.Color = LocalPlayer.TeamColor
						if v52.Name == "MountainDew" then
							changeJob("Cook")
							if v14.Cook < t.Cook then
								displayGuideArrows(local_parts.DewSpot)
							end
						elseif v52.Name == "Dough" then
							if v15 and not v52:FindFirstChild("Tutorial") then
								workspace.TutorialService.NewDough:FireServer(v52)
							end
							changeJob("Cook")
							if v14.Cook < t.Cook then
								if (v52.HasBugs.Value or (v52.IsBurned.Value or v52.Cold.Value)) and v52:FindFirstChild("Fire") == nil then
									displayGuideArrows(workspace.Trash.Flap)
								elseif v52.SG.Frame:FindFirstChild("TomatoSauce") and v52.SG.Frame:FindFirstChild("Cheese") then
									v182 = 100
									v192 = nil
									for i2, v in ipairs(workspace.Ovens:GetChildren()) do
										if v and (v.IsOpen.Value and LocalPlayer:DistanceFromCharacter(v.Bottom.Position) < v182) then
											v182 = LocalPlayer:DistanceFromCharacter(v.Bottom.Position)
											v192 = v
										end
									end
									if v192 then
										displayGuideArrows(v192.Bottom)
									else
										for i2, v in ipairs(workspace.Ovens:GetChildren()) do
											if v and not v.IsCooking.Value then
												displayGuideArrows(v.Bottom)
												break
											end
										end
									end
								elseif v52.SG.Frame:FindFirstChild("TomatoSauce") and v52.SG.Frame:FindFirstChild("MeltedCheese") then
									displayGuideArrows(local_parts.PizzaEndSpot)
								else
									v202 = v52.Size.X
									if math.floor(v202) == 3 then
										displayGuideArrows(local_parts.TableSpot)
									end
								end
							end
						elseif v52.Name == "BoxClosed" then
							changeJob("Pizza Boxer")
							if v14["Pizza Boxer"] < t["Pizza Boxer"] and v52:FindFirstChild("Logo") then
								if v52.HasPizzaInside.Value then
									displayGuideArrows(workspace.BoxingRoomBelts.BoxBelt)
								else
									displayGuideArrows(local_parts.BoxSpot)
								end
							end
						elseif v52.Name == "Pizza" then
							if v15 then
								for i2, v in ipairs(MainGui:GetChildren()) do
									if v:IsA("BillboardGui") and v.Adornee == v52 then
										v:Destroy()
									end
								end
								workspace.TutorialService.NewPizza:FireServer(v52)
							end
							changeJob("Pizza Boxer")
							if v14["Pizza Boxer"] < t["Pizza Boxer"] then
								FloorWire.To = workspace.AllBox:FindFirstChild("BoxOpen")
							end
						elseif v52.Name == "Dew" then
							changeJob("Pizza Boxer")
							if v14["Pizza Boxer"] < t["Pizza Boxer"] then
								displayGuideArrows(workspace.BoxingRoomBelts.DewBelt)
							end
						elseif v52.Name == "SupplyBox" then
							changeJob("Supplier")
							if v14.Supplier < t.Supplier then
								v212 = workspace.Trucks:GetChildren()
								v222 = if v15 and (v212[1]:FindFirstChild("Driver") and (v212[1].Driver:FindFirstChild("TutorialPlayerOnly") and v212[1].Driver.TutorialPlayerOnly.Player.Value == game.Players.LocalPlayer)) then v212[1].Bottom elseif v15 and (#v212 == 2 and (v212[2]:FindFirstChild("Driver") and (v212[2].Driver:FindFirstChild("TutorialPlayerOnly") and v212[2].Driver.TutorialPlayerOnly.Player.Value == game.Players.LocalPlayer))) or #v212 == 2 and LocalPlayer:DistanceFromCharacter(v212[1].Bottom.Position) > LocalPlayer:DistanceFromCharacter(v212[2].Bottom.Position) then v212[2].Bottom elseif #v212 == 0 then workspace.Border else v212[1].Bottom
								displayGuideArrows(v222)
							end
						end
						v6.TargetFilter = v8
					end
					if not v52.Parent:FindFirstChild("Humanoid") or (game.Players:GetPlayerFromCharacter(v52.Parent) == nil or LocalPlayer.TeamColor ~= BrickColor.new(37)) then
						return
					end
					v232 = game.Players:GetPlayerFromCharacter(v52.Parent)
					if v232 == LocalPlayer then
						return
					end
					game.Players.LocalPlayer.PlayerGui.Gui.ManagerPowers.Current_Player.Value = v232
					GuiManager:GetWindowDataByName("ManagerPowers"):SetVisible(true)
				end
			else
				if v262 == v10 then
					flashRegisterButton(v52, false)
				else
					flashRegisterButton(v52, true)
				end
				v4:FireServer("OrderComplete", v11, v262, v52.Parent)
				v10 = nil
				v11 = nil
			end
			return
		end
		if v52.Parent.Name == "Ingredients" and (not v17 and (v52.Transparency == 0 or v52:FindFirstChild("Dragger"))) then
			if v15 and v52.Name == "Sausage" then
				return
			end
			if not ({
				Cheese = true,
				Pepperoni = true,
				Sausage = true,
				TomatoSauce = true
			})[v52.Name] then
				return
			end
			if v52:FindFirstChild("CurrentDragger") then
				local CurrentDragger = v52.CurrentDragger.Value
				if CurrentDragger and (CurrentDragger ~= LocalPlayer and CurrentDragger.Parent ~= nil) then
					print("Another player already dragging")
					v2:PlaySound("Invalid")
					return
				end
			end
			v2:PlaySound("PickUp", v52)
			changeJob("Cook")
			v6.Icon = "http://www.roblox.com/asset/?id=168756505"
			v13 = game.ReplicatedStorage.Supplies.Dragger:clone()
			v13.Name = v52.Name
			v13.Locked = false
			v13.LastDragger.Value = LocalPlayer
			v13.CurrentDragger.Value = LocalPlayer
			v13.LastDrag.Value = game.Workspace.DistributedGameTime
			v16 = v13.SG.Frame.ImageLabel
			v16.Image = v5.IngredientImages[v52.Name]
			v16.ZIndex = ({
				Cheese = 2,
				Pepperoni = 3,
				Sausage = 3,
				TomatoSauce = 1
			})[v52.Name]
			if v52:FindFirstChild("Dragger") then
				v52:Destroy()
			end
			v26 = true
			cameraLock(true)
			v13.Parent = workspace.Ingredients
			v6.TargetFilter = v13
			v17 = v13.Name
			if not v15 then
				return
			end
			workspace.TutorialService.PlayerAction:FireServer(v52.Name, true)
			if not v23 then
				return
			end
			FloorWire.To = v23
			FloorWire.From = v8
		elseif v52.Name == "BoxOpen" and (LocalPlayer.Character:FindFirstChild("Pizza Slicer") and (v52.Pizza.Value and v52.IsSliced.Value == false)) then
			v2:PlaySound("CutPizza")
			v2:PlaySound("CutObject")
			workspace.Animation.PlayAnimation.PlayAnimation:Fire("PizzaSlice")
			v52.IsSliced.Value = true
			v72 = game.ReplicatedStorage.SliceSeams:Clone()
			v72:PivotTo(v52.Pizza.Value.CFrame)
			v72.Parent = v52
			v1:Weld(v52.Pizza.Value, v72.Base)
			v82 = math.random(1, 50000)
			task.spawn(function() --[[ Line: 341 | Upvalues: v72 (copy), v82 (copy) ]]
				v72.Name = "PlaceHolder"
				local v12
				if v72:IsA("BasePart") then
					v72.CanCollide = false
					v72.Anchored = true
				end
				v12 = nil
				v12 = game:GetService("CollectionService"):GetInstanceAddedSignal("MakesLocalCopies"):Connect(function(p12_2_2) --[[ Line: 351 | Upvalues: v82 (ref), v12 (ref), v72 (ref) ]]
					if p12_2_2:GetAttribute("InstanceId") ~= v1 then
						return
					end
					v12:Disconnect()
					p1:Destroy()
				end)
			end)
			if v5.IsStudio then
				wait()
			end
			v4:FireServer("SlicePizza", v52, v82)
			v92 = game.ReplicatedStorage.SliceSplat:Clone()
			v92.Enabled = false
			v92.Parent = v52.Pizza.Value
			v92:Emit(10)
			if not LocalPlayer.Character:FindFirstChild("Pizza Slicer"):GetAttribute("IsGolden") then
				return
			end
			v102 = game.ReplicatedStorage.PlusTenPercent:Clone()
			v102.Parent = v52
			game:GetService("Debris"):AddItem(v102, 1)
		elseif v52.Name == "BoxOpen" and (not LocalPlayer.Character:FindFirstChild("Pizza Slicer") and (v52.Pizza.Value and v52.IsSliced.Value == false)) then
			v2:PlaySound("Invalid")
			if v52:FindFirstChild("NeedSlicer") then
				v52.NeedSlicer:Destroy()
			end
			v112 = game.ReplicatedStorage.NeedSlicer:Clone()
			v112.Parent = v52
			game:GetService("Debris"):AddItem(v112, 1)
			AnimateSlicerArrow()
			v4:FireServer("OpenDrawer")
		elseif v52.Name == "BoxOpen" and (v52.Pizza.Value ~= nil or not LocalPlayer.Character:FindFirstChild("Pizza Slicer")) then
			changeJob("Pizza Boxer")
			if v52.Pizza.Value then
				v52.Pizza.Value.Parent = nil
			end
			v122 = game.ReplicatedStorage.Supplies.BoxClosed:clone()
			v122.CFrame = v52.CFrame - Vector3.new(0, 2, 0)
			v122.Parent = workspace.AllBox
			v2:PlaySound("BoxClose", workspace.BoxingTable)
			WaitForServerCopy(v122, v52)
			if v5.IsStudio then
				wait()
			end
			v4:FireServer("CloseBox", v52)
			v52:Destroy()
			if not v15 then
				return
			end
			workspace.TutorialService.PlayerAction:FireServer("ClosedBox", true)
		else
			if not v52.Locked and (v52.Name == "Handle" and v52.Parent:IsA("Tool")) then
				if v15 and v52.Parent.Name == "PizzaTool" then
					workspace.TutorialService.PlayerAction:FireServer("GrabbedPizza", true)
				end
				v4:FireServer("AddPizzaToBackpack", v52.Parent)
			end
			if v5.Cutables[v52.Name] and (LocalPlayer.Character:FindFirstChild("Pizza Slicer") and (v1:ProxyCheck(LocalPlayer, v52.Position, 25) and LocalPlayer.Character["Pizza Slicer"]:GetAttribute("IsGolden"))) then
				v2:PlaySound("CutObject")
				v4:FireServer("SliceObject", v52)
				workspace.Animation.PlayAnimation.PlayAnimation:Fire("PizzaSlice")
				return
			end
			if v5.Dragables[v52.Name] then
				v132 = v52.CurrentDragger.Value
				if v132 and (v132 ~= LocalPlayer and v132.Parent ~= nil) then
					v2:PlaySound("Invalid")
					print("Another player already dragging")
					return
				end
				v2:PlaySound("PickUp", v52)
				v12 = v52.Parent
				v52.Transparency = 0
				copyLocal(v52)
				v7 = v52
				workspace.GameService.DraggingStarted:FireServer(v52)
				if v9 then
					Dragger:MouseUp()
				end
				cameraLock(true)
				v26 = true
				v6.Icon = "http://www.roblox.com/asset/?id=168756505"
				v9 = true
				v142 = Dragger
				v152 = v8
				v162 = -v52.Size.Y / 2
				v172 = { v8 }
				Dragger:MouseDown(v8, Vector3.new(0, v162, 0), v172)
				v4:FireServer("UpdateProperty", v52, "Anchored", true)
				v8.Rotation = Vector3.new(0, 0, 0)
				FloorWire.To = nil
				FloorWire.From = v8
				SelectionBox.Adornee = v8
				SelectionBox.Color = LocalPlayer.TeamColor
				if v52.Name == "MountainDew" then
					changeJob("Cook")
					if v14.Cook < t.Cook then
						displayGuideArrows(local_parts.DewSpot)
					end
				elseif v52.Name == "Dough" then
					if v15 and not v52:FindFirstChild("Tutorial") then
						workspace.TutorialService.NewDough:FireServer(v52)
					end
					changeJob("Cook")
					if v14.Cook < t.Cook then
						if (v52.HasBugs.Value or (v52.IsBurned.Value or v52.Cold.Value)) and v52:FindFirstChild("Fire") == nil then
							displayGuideArrows(workspace.Trash.Flap)
						elseif v52.SG.Frame:FindFirstChild("TomatoSauce") and v52.SG.Frame:FindFirstChild("Cheese") then
							v182 = 100
							v192 = nil
							for i2, v in ipairs(workspace.Ovens:GetChildren()) do
								if v and (v.IsOpen.Value and LocalPlayer:DistanceFromCharacter(v.Bottom.Position) < v182) then
									v182 = LocalPlayer:DistanceFromCharacter(v.Bottom.Position)
									v192 = v
								end
							end
							if v192 then
								displayGuideArrows(v192.Bottom)
							else
								for i2, v in ipairs(workspace.Ovens:GetChildren()) do
									if v and not v.IsCooking.Value then
										displayGuideArrows(v.Bottom)
										break
									end
								end
							end
						elseif v52.SG.Frame:FindFirstChild("TomatoSauce") and v52.SG.Frame:FindFirstChild("MeltedCheese") then
							displayGuideArrows(local_parts.PizzaEndSpot)
						else
							v202 = v52.Size.X
							if math.floor(v202) == 3 then
								displayGuideArrows(local_parts.TableSpot)
							end
						end
					end
				elseif v52.Name == "BoxClosed" then
					changeJob("Pizza Boxer")
					if v14["Pizza Boxer"] < t["Pizza Boxer"] and v52:FindFirstChild("Logo") then
						if v52.HasPizzaInside.Value then
							displayGuideArrows(workspace.BoxingRoomBelts.BoxBelt)
						else
							displayGuideArrows(local_parts.BoxSpot)
						end
					end
				elseif v52.Name == "Pizza" then
					if v15 then
						for i2, v in ipairs(MainGui:GetChildren()) do
							if v:IsA("BillboardGui") and v.Adornee == v52 then
								v:Destroy()
							end
						end
						workspace.TutorialService.NewPizza:FireServer(v52)
					end
					changeJob("Pizza Boxer")
					if v14["Pizza Boxer"] < t["Pizza Boxer"] then
						FloorWire.To = workspace.AllBox:FindFirstChild("BoxOpen")
					end
				elseif v52.Name == "Dew" then
					changeJob("Pizza Boxer")
					if v14["Pizza Boxer"] < t["Pizza Boxer"] then
						displayGuideArrows(workspace.BoxingRoomBelts.DewBelt)
					end
				elseif v52.Name == "SupplyBox" then
					changeJob("Supplier")
					if v14.Supplier < t.Supplier then
						v212 = workspace.Trucks:GetChildren()
						v222 = if v15 and (v212[1]:FindFirstChild("Driver") and (v212[1].Driver:FindFirstChild("TutorialPlayerOnly") and v212[1].Driver.TutorialPlayerOnly.Player.Value == game.Players.LocalPlayer)) then v212[1].Bottom elseif v15 and (#v212 == 2 and (v212[2]:FindFirstChild("Driver") and (v212[2].Driver:FindFirstChild("TutorialPlayerOnly") and v212[2].Driver.TutorialPlayerOnly.Player.Value == game.Players.LocalPlayer))) or #v212 == 2 and LocalPlayer:DistanceFromCharacter(v212[1].Bottom.Position) > LocalPlayer:DistanceFromCharacter(v212[2].Bottom.Position) then v212[2].Bottom elseif #v212 == 0 then workspace.Border else v212[1].Bottom
						displayGuideArrows(v222)
					end
				end
				v6.TargetFilter = v8
			end
			if not v52.Parent:FindFirstChild("Humanoid") or (game.Players:GetPlayerFromCharacter(v52.Parent) == nil or LocalPlayer.TeamColor ~= BrickColor.new(37)) then
				return
			end
			v232 = game.Players:GetPlayerFromCharacter(v52.Parent)
			if v232 == LocalPlayer then
				return
			end
			game.Players.LocalPlayer.PlayerGui.Gui.ManagerPowers.Current_Player.Value = v232
			GuiManager:GetWindowDataByName("ManagerPowers"):SetVisible(true)
		end
	end
end
local v28 = nil
if v5.PlaceSettings.CustomCodeIndex == "ChallengeEvent" then
	local Difficulty = game.ReplicatedStorage._v6FiRE_Additions.ClassicPt2Event.Difficulty
	if Difficulty.Value == "" then
		Difficulty.Changed:Wait()
	end
	if Difficulty.Value == "Medium" then
		v28 = workspace:WaitForChild("SpaceModels", 999)
	end
end
function onButton1Up() --[[ onButton1Up | Line: 1126 | Upvalues: v28 (ref), v20 (ref), v26 (ref) ]]
	if v28 then
		v28.Parent = workspace
	end
	if v20 > 5 then
		onUp(true)
		return
	end
	if not v26 then
		return
	end
	cameraLock(false)
end
function Weld(p1, p2) --[[ Weld | Line: 1151 ]]
	local PizzaWeld = Instance.new("Weld")
	PizzaWeld.Name = "PizzaWeld"
	PizzaWeld.Part0 = p1
	PizzaWeld.Part1 = p2
	local v1 = CFrame.new(p1.Position)
	local v2 = p1.CFrame:inverse() * v1
	local v3 = p2.CFrame:inverse() * v1
	PizzaWeld.C0 = v2
	PizzaWeld.C1 = v3
	PizzaWeld.Parent = p1
end
local CurrentCamera_2 = workspace.CurrentCamera
local v29 = nil
local v30 = nil
local v31 = Vector3.new(0, 0, 0)
local v32 = nil
function onMove() --[[ onMove | Line: 1177 | Upvalues: v6 (copy), v9 (ref), v17 (ref), v20 (ref), v29 (ref), v28 (ref), LocalPlayer (copy), v25 (ref), v8 (ref), v4 (copy), v7 (ref), v2 (copy), HapticEffect (copy), Dragger (copy), v31 (ref), v30 (ref), CurrentCamera_2 (copy), SelectionBox (copy), v32 (ref), v16 (ref), v13 (ref) ]]
	if not (v6 and (v6.Target and v6.Target.Parent)) then
		return
	end
	if v6.Target.Name == "PlaceHolder" then
		return
	end
	if v9 or v17 then
		v20 = v20 + 1
	end
	v29 = v6.Target
	if v29 == nil then
		return
	end
	if v9 then
		if v28 then
			v28.Parent = nil
		end
		if LocalPlayer:DistanceFromCharacter(v6.Hit.p) > 120 then
			return
		end
		if v25 == v29 or v25 == v29.Parent then
			if v25 == v29 or v25 == v29.Parent then
				return
			end
		else
			if v29.Parent.Name == "Spots" and script[v29.Name].Enabled then
				v25 = v29
				v8.Position = v29.Position
				v4:FireServer("UpdateProperty", v7, "CFrame", v8.CFrame)
				v2:PlaySound("Pop2", v7)
				HapticEffect:Play()
				return
			end
			if v29.Name == "DewBelt" and (v7.Name == "Dew" or v7.Name == "MountainDew") then
				v25 = v29
				v8.CFrame = v29.CFrame + Vector3.new(0, (v29.Size.Y + v7.Size.Y) / 2, 0)
				v4:FireServer("UpdateProperty", v7, "CFrame", v8.CFrame)
				v2:PlaySound("Pop2", v7)
				HapticEffect:Play()
				return
			end
			if v29.Name == "BoxBelt" and v7.Name == "BoxClosed" then
				v25 = v29
				v8.CFrame = v29.CFrame + Vector3.new(0, (v29.Size.Y + v7.Size.Y) / 2, 0)
				v4:FireServer("UpdateProperty", v7, "CFrame", v8.CFrame)
				v2:PlaySound("Pop2", v7)
				HapticEffect:Play()
				return
			end
			if v29.Parent.Name == "Oven" and (v29.Parent.IsOpen.Value and v7.Name == "Dough") then
				v25 = v29.Parent
				v8.CFrame = v29.Parent.Bottom.CFrame + Vector3.new(0, (v29.Parent.Bottom.Size.Y + v7.Size.Y) / 2, 0)
				v4:FireServer("UpdateProperty", v7, "CFrame", v8.CFrame)
				v2:PlaySound("Pop2", v7)
				HapticEffect:Play()
				return
			end
			if v29.Name == "DoughLock" and v7.Name == "Dough" then
				v25 = v29
				v8.CFrame = v29.CFrame + Vector3.new(0, (v29.Size.Y + v7.Size.Y) / 2, 0)
				v4:FireServer("UpdateProperty", v7, "CFrame", v8.CFrame)
				v2:PlaySound("Pop2", v7)
				HapticEffect:Play()
				return
			end
			if v29.Parent.Name == "Trash" and (v7.Name == "Dough" and (v7:FindFirstChild("Fire") == nil and (v7.HasBugs.Value or (v7.IsBurned.Value or v7.Cold.Value)))) then
				v25 = v29.Parent
				v8.CFrame = workspace.Trash.DoughCFrameLock.CFrame
				v4:FireServer("UpdateProperty", v7, "CFrame", v8.CFrame)
				v2:PlaySound("Pop2", v7)
				HapticEffect:Play()
				return
			end
			if v29.Name == "BoxOpen" and (v7.Name == "Pizza" and (v29:FindFirstChild("Tutorial") == nil or v29.Tutorial.Value == LocalPlayer)) and (v29.Pizza.Value == nil or v29.Pizza.Value == v7) then
				if v25 == nil or v29.Name ~= "BoxOpen" then
					HapticEffect:Play()
					v25 = v29
					v29.Anchored = true
					v29.Pizza.Value = v7
					v8.CFrame = v29.CFrame:toWorldSpace(CFrame.new(Vector3.new(0, -2, 0)))
					v4:FireServer("UpdateProperty", v7, "CFrame", v8.CFrame)
					v4:FireServer("UpdateProperty", v29, "Anchored", true)
					v4:FireServer("AssignPizzaToBox", v29, v7)
					v2:PlaySound("Pop2", v7)
					return
				end
				v25.Anchored = false
				v4:FireServer("UpdateProperty", v25, "Anchored", false)
				v25.Pizza.Value = nil
				v4:FireServer("AssignPizzaToBox", v25, nil)
				HapticEffect:Play()
				v25 = v29
				v29.Anchored = true
				v29.Pizza.Value = v7
				v8.CFrame = v29.CFrame:toWorldSpace(CFrame.new(Vector3.new(0, -2, 0)))
				v4:FireServer("UpdateProperty", v7, "CFrame", v8.CFrame)
				v4:FireServer("UpdateProperty", v29, "Anchored", true)
				v4:FireServer("AssignPizzaToBox", v29, v7)
				v2:PlaySound("Pop2", v7)
				return
			end
		end
		if v25 and (v25.Name == "BoxOpen" and v7.Name == "Pizza") then
			v25.Anchored = false
			v4:FireServer("UpdateProperty", v25, "Anchored", false)
			if v25:FindFirstChild("Pizza") then
				v25.Pizza.Value = nil
			end
			v4:FireServer("AssignPizzaToBox", v25, nil)
		end
		v25 = nil
		Dragger:MouseMove(v6.UnitRay)
		if v31 ~= v8.Position then
			v4:FireServer("UpdateProperty", v7, "CFrame", v8.CFrame)
			v31 = v8.Position
		end
	end
	v30 = nil
	if not v9 then
		local v132 = v29:FindFirstChild("ClickDetector") or (v29:FindFirstChild("Hand") or (v29.Parent:FindFirstChild("ClickDetector") or v29.Parent.Parent:FindFirstChild("ClickDetector")))
		if v132 and LocalPlayer:DistanceFromCharacter(v6.Hit.p) <= v132.Value then
			v6.Icon = "rbxassetid://2102101333"
		elseif v29.Name ~= "Body" then
			v6.Icon = _G.MouseIcon
		end
	end
	if v29 == nil or (v29.Locked or (v9 or (v17 ~= nil or (not CurrentCamera_2 or CurrentCamera_2.CameraType == Enum.CameraType.Scriptable)))) then
		if v29.Parent:FindFirstChild("Register") and (v29.BrickColor == BrickColor.new("Medium stone grey") and v29 ~= v32) then
			if v32 then
				v32.BrickColor = BrickColor.new("Medium stone grey")
			end
			v29.BrickColor = BrickColor.new("Lily white")
			v32 = v29
		elseif LocalPlayer.TeamColor == BrickColor.new(37) and (v29.Parent:FindFirstChild("Humanoid") and game.Players:GetPlayerFromCharacter(v29.Parent)) then
			SelectionBox.Adornee = v29.Parent
			SelectionBox.Color = LocalPlayer.TeamColor
		else
			SelectionBox.Adornee = nil
			if v32 and v29 ~= v32 then
				v32.BrickColor = BrickColor.new("Medium stone grey")
				v32 = nil
			end
		end
	else
		SelectionBox.Adornee = v29
		SelectionBox.Color = LocalPlayer.TeamColor
	end
	if v17 == nil then
		return
	end
	if v29:FindFirstChild("Tutorial") and (v29.Tutorial.Value ~= nil and v29.Tutorial.Value ~= game.Players.LocalPlayer) then
		return
	end
	if v29.Name == "Dough" and (v29.SG.Frame:FindFirstChild(v17) == nil and (v29.Size.Y ~= 1 and (v17 ~= "Sausage" or not v29.SG.Frame:FindFirstChild("Pepperoni")))) and (v17 ~= "Pepperoni" or not v29.SG.Frame:FindFirstChild("Sausage")) then
		if v16.Parent ~= v29.SG.Frame then
			v2:PlaySound("IngredientSplat", v29)
			HapticEffect:Play()
			v16.Parent = v29.SG.Frame
		end
	else
		if not v13 then
			return
		end
		if v16.Parent ~= v13.SG.Frame then
			v16.Parent = v13.SG.Frame
		end
		if not (v13 and v13.Parent) then
			return
		end
		v13.CFrame = CFrame.new(v6.Hit.p)
	end
end
UserInputService.InputBegan:connect(function(p1, p2) --[[ Line: 1419 ]]
	if p2 or p1.UserInputType ~= Enum.UserInputType.MouseButton1 and (p1.UserInputType ~= Enum.UserInputType.Touch and (p1.UserInputType ~= Enum.UserInputType.Gamepad1 or (p1.KeyCode ~= Enum.KeyCode.ButtonR2 or game:GetService("VRService").VREnabled))) then
		return
	end
	onDown(p1)
end)
v6.Button1Up:connect(onButton1Up)
v6.Move:connect(onMove)
local v33 = false
if not _G.GamepadEnabled then
	return
end
UserInputService_2.InputBegan:connect(function(p1, p2) --[[ Line: 1432 | Upvalues: v33 (ref) ]]
	if p2 or (v33 or (p1.UserInputState ~= Enum.UserInputState.Begin or p1.KeyCode ~= Enum.KeyCode.ButtonR2)) then
		return
	end
	game:GetService("RunService"):BindToRenderStep("CameraMovement", Enum.RenderPriority.Camera.Value, function() --[[ Line: 1435 ]]
		onMove()
	end)
	v33 = true
end)
UserInputService_2.InputEnded:connect(function(p1, p2) --[[ Line: 1444 | Upvalues: v33 (ref) ]]
	if p2 or (not v33 or (p1.UserInputState ~= Enum.UserInputState.End or p1.KeyCode ~= Enum.KeyCode.ButtonR2)) then
		return
	end
	game:GetService("RunService"):UnbindFromRenderStep("CameraMovement")
	v33 = false
end)