-- https://lua.expert/
require(game.ReplicatedStorage:WaitForChild("Enums"))
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Utility")
local v2 = Library:Load("SoundFX")
local Misc = require(game.ReplicatedStorage:WaitForChild("Misc"))
local VehicleProperties = require(game.ReplicatedStorage:WaitForChild("VehicleProperties"))
local LocalPlayer = game.Players.LocalPlayer
local CurrentCamera = workspace.CurrentCamera
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local CameraLock = PlayerGui:WaitForChild("WorkTool"):WaitForChild("CameraLock")
if MainGui:WaitForChild("Prompts", 20) == nil then
	error("Prompts folder is gone")
end
local t = {}
local t2 = {}
workspace.GameService.TruckLassoEnabled.OnClientEvent:connect(function(p1, p2, p3, p4) --[[ Line: 50 | Upvalues: t (copy), t2 (copy) ]]
	local Lasso
	if t[p4] == nil then
		Lasso = Instance.new("Part")
		Lasso.Shape = "Cylinder"
		Lasso.Name = "Lasso"
		Lasso.BrickColor = BrickColor.new("Medium stone grey")
		Lasso.Anchored = true
		Lasso.CanCollide = false
		Lasso.Material = "CorrodedMetal"
		t[p4] = Lasso
	else
		Lasso = t[p4]
	end
	local function Cancel() --[[ Cancel | Line: 70 | Upvalues: t2 (ref), p4 (copy), Lasso (ref) ]]
		game:GetService("RunService"):UnbindFromRenderStep("Lasso" .. t2[p4])
		t2[p4] = nil
		Lasso.Parent = game.ReplicatedStorage
	end
	if p1 then
		Lasso.Parent = workspace
		local v1 = tick()
		local v2 = nil
		game:GetService("RunService"):BindToRenderStep("Lasso" .. v1, Enum.RenderPriority.First.Value, function() --[[ Line: 83 | Upvalues: p2 (copy), p3 (copy), t2 (ref), p4 (copy), Lasso (ref), v2 (ref) ]]
			if p2 == nil or (p2.Parent == nil or (p3 == nil or p3.Parent == nil)) then
				game:GetService("RunService"):UnbindFromRenderStep("Lasso" .. t2[p4])
				t2[p4] = nil
				Lasso.Parent = game.ReplicatedStorage
			else
				v2 = p2.Position:lerp(p3.Position, 0.5)
				Lasso.CFrame = CFrame.new(p2.Position, p3.Position) * CFrame.Angles(0, 1.5707963267948966, 0)
				Lasso.Size = Vector3.new((p2.Position - p3.Position).magnitude, 4, 4)
				Lasso.Position = v2
			end
		end)
		t2[p4] = v1
	else
		if not t2[p4] then
			return
		end
		game:GetService("RunService"):UnbindFromRenderStep("Lasso" .. t2[p4])
		t2[p4] = nil
		Lasso.Parent = game.ReplicatedStorage
	end
end)
local v3 = nil
local v4 = false
local v5 = false
local t3 = {}
local v6 = nil
local v7 = false
local v8 = nil
local v9 = nil
local v10 = true
function PlayerSat(p1, p2) --[[ PlayerSat | Line: 118 | Upvalues: v5 (ref), VehicleProperties (copy), v10 (ref), v9 (ref), v7 (ref), v1 (copy), v8 (ref), v2 (copy), v4 (ref), t3 (copy), v6 (ref), Misc (copy), v3 (ref) ]]
	if p1 and (p2 and (p2.Parent and p2.Name == "Driver")) then
		if p2:IsA("VehicleSeat") then
			v5 = true
		end
		local v12 = VehicleProperties[p2.Parent.Name]
		if not v12 then
			spawn(function() --[[ Line: 127 | Upvalues: p2 (copy) ]]
				error(p2.Parent.Name .. " does not have vehicle properties")
			end)
		end
		if p2.Name == "Driver" and p2.Parent:FindFirstChild("Bumper") then
			local v22 = 0
			local Position = p2.Parent.Bumper.Position
			spawn(function() --[[ Line: 136 | Upvalues: v10 (ref), p2 (copy), v22 (ref), Position (ref) ]]
				v10 = true
				while v10 do
					wait(0.1)
					if p2 and (p2.Parent and p2.Parent:FindFirstChild("Bumper")) then
						v22 = (Position - p2.Parent.Bumper.Position).magnitude
						Position = p2.Parent.Bumper.Position
						continue
					end
					v10 = false
				end
			end)
			v9 = p2.Parent.Bumper.Touched:connect(function(p1) --[[ Line: 149 | Upvalues: p2 (copy), v7 (ref), v22 (ref), v1 (ref) ]]
				local VehicleImpactDynamic = p2.Parent.Bumper.VehicleImpactDynamic
				if v7 or (not p1 or (not p1.Parent or (p1.Parent == p2.Parent or not p1.Parent:FindFirstChild("Car") and (not p1.Parent:FindFirstChild("Truck") and (not p1.Anchored or p1.Transparency == 1))))) then
					return
				end
				v7 = true
				delay(1, function() --[[ Line: 154 | Upvalues: v7 (ref) ]]
					v7 = false
				end)
				if not (v22 > 5) then
					return
				end
				VehicleImpactDynamic.Volume = v1:Map(v22, 2, 8, 0, 2)
				VehicleImpactDynamic:Play()
			end)
		end
		if v12.Type == "Truck" then
			Realign(25, 50)
			local v32 = false
			v8 = p2.Parent.TreeKnocker.Touched:connect(function(p1) --[[ Line: 175 | Upvalues: v32 (ref), v2 (ref) ]]
				if v32 or (not p1 or (not p1.Parent or (not p1.Anchored or p1.Transparency == 1))) then
					return
				end
				v32 = true
				delay(0.5, function() --[[ Line: 180 | Upvalues: v32 (ref) ]]
					v32 = false
				end)
				if p1.Name == "Trunk" and (p1.Parent.Name == "Tree" or p1.Parent.Name == "DeadTree") then
					local Part = Instance.new("Part")
					Part.CFrame = p1.CFrame
					Part.CanCollide = false
					Part.Anchored = true
					Part.Transparency = 1
					Part.Parent = workspace
					delay(3, function() --[[ Line: 195 | Upvalues: Part (copy) ]]
						Part:Destroy()
					end)
					v2:PlaySound("TreeHit", Part)
					workspace.Main.UprootTree:FireServer(p1.Parent)
				else
					if not p1.Parent:FindFirstChild("Mailbox") then
						return
					end
					local Part = Instance.new("Part")
					Part.CFrame = p1.CFrame
					Part.CanCollide = false
					Part.Anchored = true
					Part.Transparency = 1
					Part.Parent = workspace
					delay(3, function() --[[ Line: 213 | Upvalues: Part (copy) ]]
						Part:Destroy()
					end)
					p1.Parent:FindFirstChild("LetterExplosion", true):Emit(10)
					v2:PlaySound("VehicleImpact", p1)
					v2:PlaySound("MailboxMailFlutter", Part)
					workspace.Main.KnockMailbox:FireServer(p1.Parent)
				end
			end)
			v4 = true
			game:GetService("RunService"):BindToRenderStep("SupplyBoxes", Enum.RenderPriority.First.Value, function() --[[ Line: 243 | Upvalues: t3 (ref) ]]
				for k, v in pairs(t3) do
					v.CFrame = k.CFrame
				end
			end)
			v6 = workspace.AllSupplyBoxes.ChildRemoved:connect(function(p1) --[[ Line: 250 | Upvalues: t3 (ref) ]]
				if not t3[p1] then
					return
				end
				t3[p1]:Destroy()
				t3[p1] = nil
			end)
			while v4 do
				for i, v in ipairs(Misc:GetBoxesInTruck(p2.Parent) or {}) do
					if not t3[v] then
						local Clone = Instance.new("Part", workspace)
						Clone.Name = "Clone"
						Clone.BrickColor = v.BrickColor
						Clone.FormFactor = "Custom"
						Clone.Size = Vector3.new(0.2, 0.2, 0.2)
						Clone.Anchored = true
						Clone.CanCollide = false
						Clone.TopSurface = "Smooth"
						Clone.BottomSurface = "Smooth"
						Clone.Locked = true
						local BlockMesh = Instance.new("BlockMesh")
						BlockMesh.Scale = Vector3.new(v.Size.X / 0.2, v.Size.Y / 0.2, v.Size.Z / 0.2)
						BlockMesh.Parent = Clone
						t3[v] = Clone
						v.Transparency = 1
					end
				end
				wait(3)
			end
			return
		end
		if v12.Type ~= "Car" then
			return
		end
		Realign(20, 13)
		local v82 = nil
		for i, v in ipairs(p2.Parent:GetChildren()) do
			if v:FindFirstChild("Bumper") then
				v82 = v
				break
			end
		end
		if not v82 then
		end
	else
		if p1 then
			return
		end
		if not v5 then
			return
		end
		v5 = false
		Realign(25, 12)
		if v8 then
			v8:disconnect()
		end
		if v3 then
			v3:disconnect()
			v3 = nil
		end
		if v9 then
			v9:disconnect()
		end
		v10 = false
		if not v4 then
			return
		end
		v4 = false
		game:GetService("RunService"):UnbindFromRenderStep("SupplyBoxes")
		for k, v in pairs(t3) do
			k.Transparency = 0
			v:Destroy()
			t3[k] = nil
		end
		v6:disconnect()
		v6 = nil
	end
end
function Realign(p1, p2, p3) --[[ Realign | Line: 356 | Upvalues: CameraLock (copy), LocalPlayer (copy), CurrentCamera (copy) ]]
	if CameraLock.Value then
		return
	end
	if not (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head")) then
		return
	end
	local v1 = if p2 then p2 else (CurrentCamera.CFrame.p - LocalPlayer.Character.Head.Position).magnitude
	LocalPlayer.CameraMaxZoomDistance = v1
	LocalPlayer.CameraMinZoomDistance = v1
	if LocalPlayer.Character then
		local v3 = v1 * math.cos((math.rad(p1)))
		local v5 = v1 * math.sin((math.rad(p1)))
		local v6 = LocalPlayer.Character.Head.Position + LocalPlayer.Character.Head.CFrame.lookVector * -v3
		CurrentCamera.CameraType = Enum.CameraType.Scriptable
		CurrentCamera.CFrame = CFrame.new(Vector3.new(v6.X, LocalPlayer.Character.Head.Position.Y + v5, v6.Z), LocalPlayer.Character.Head.Position)
		CurrentCamera.CameraType = Enum.CameraType.Custom
		LocalPlayer.CameraMaxZoomDistance = 50
		LocalPlayer.CameraMinZoomDistance = 0.5
	end
end
workspace.Main.RealignCamera.OnClientEvent:connect(Realign)
workspace.Main.RealignCamera.RealignCamera.Event:connect(Realign)
local v11 = nil
local function UpdateConnections(p1) --[[ UpdateConnections | Line: 434 | Upvalues: v11 (ref), LocalPlayer (copy) ]]
	if v11 then
		v11:disconnect()
	end
	local Humanoid = p1:WaitForChild("Humanoid", 5)
	if not Humanoid then
		return
	end
	v11 = Humanoid.Seated:connect(PlayerSat)
	LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
end
LocalPlayer.CharacterAdded:connect(function(p1) --[[ Line: 444 | Upvalues: UpdateConnections (copy) ]]
	UpdateConnections(p1)
end)
if LocalPlayer.Character then
	UpdateConnections(LocalPlayer.Character)
else
	error("NO CAMERA CONNECTIONS")
end