-- https://lua.expert/
local t = {}
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Utility")
local v2 = Library:Load("Maid")
local v3 = Library:Load("Network")
local v4 = Library:Load("SoundFX")
local v5 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
require(game.ReplicatedStorage:WaitForChild("Dialog"))
local v6 = GuiManager:RegisterWindow(v5, "Bottom", "Bottom")
local LocalPlayer = game.Players.LocalPlayer
local v7 = LocalPlayer:GetMouse()
GuiManager:RegisterWindow(v5, "Bottom", "Bottom", nil, nil, true)
local v8 = v2.new()
local v9 = nil
local v10 = false
local v11 = nil
local function Place() --[[ Place | Line: 32 | Upvalues: v10 (ref), v3 (copy), v9 (ref), v11 (ref), t (copy), v4 (copy) ]]
	if v10 then
		v3:InvokeServer("SpawnVehicle", v9.AssetId, v9.Name, v11:GetPivot())
		t:CancelPlacement()
		v4:PlaySound("Impact")
	else
		v4:PlaySound("Invalid")
	end
end
function t.StartPlacement(p1, p2) --[[ StartPlacement | Line: 43 | Upvalues: v9 (ref), v8 (copy), v6 (copy), v11 (ref), v3 (copy), v1 (copy), LocalPlayer (copy), v10 (ref), v7 (copy), t (copy), v4 (copy) ]]
	v9 = p2
	v8:DoCleaning()
	if not _G.GamepadEnabled then
		v6:SetVisible(true)
	end
	v11 = v3:InvokeServer("CreateVehicleModel", v9.AssetId)
	local SelectionBox = Instance.new("SelectionBox")
	SelectionBox.Adornee = v11
	SelectionBox.Parent = v11
	v1:SetDescendantProperties(v11, "BasePart", {
		Disabled = true,
		Transparency = 0.5,
		Anchored = true,
		CanCollide = false,
		CanTouch = false,
		CanQuery = false
	})
	v11.Parent = workspace
	v8:GiveTask(v11)
	v8:GiveTask(SelectionBox)
	local t2 = { v11, game.Players.LocalPlayer.Character }
	if workspace:FindFirstChild("Winter") then
		table.insert(t2, workspace.Winter)
	end
	local v12 = OverlapParams.new()
	v12.FilterDescendantsInstances = t2
	local _, v2 = v11:GetBoundingBox()
	v8.Heartbeat = game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 77 | Upvalues: LocalPlayer (ref), v2 (copy), v11 (ref), v12 (copy), SelectionBox (copy), v10 (ref) ]]
		local v3 = LocalPlayer.Character.HumanoidRootPart.Position + LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * v2.X + Vector3.new(0, v2.Y / 2 - LocalPlayer.Character.Humanoid.HipHeight, 0)
		local v4, v5, v6 = (LocalPlayer.Character:GetPivot() * CFrame.Angles(0, -1.5707963267948966, 0)):ToEulerAnglesYXZ()
		v11:PivotTo(CFrame.new(v3) * CFrame.Angles(v4, v5, v6))
		if #workspace:GetPartBoundsInBox(v11:GetPivot() + Vector3.new(0, 42.5, 0), v11:GetExtentsSize() + Vector3.new(0, 85, 0), v12) == 0 then
			SelectionBox.Color3 = Color3.fromRGB(6, 255, 255)
			v10 = true
		else
			SelectionBox.Color3 = Color3.fromRGB(255, 0, 0)
			v10 = false
		end
	end)
	if game:GetService("UserInputService").TouchEnabled then
		v8.Place = script.Parent.Place.MouseButton1Click:Connect(function() --[[ Line: 98 | Upvalues: v10 (ref), v3 (ref), v9 (ref), v11 (ref), t (ref), v4 (ref) ]]
			if v10 then
				v3:InvokeServer("SpawnVehicle", v9.AssetId, v9.Name, v11:GetPivot())
				t:CancelPlacement()
				v4:PlaySound("Impact")
			else
				v4:PlaySound("Invalid")
			end
		end)
		v8.Cancel = script.Parent.Cancel.MouseButton1Click:Connect(function() --[[ Line: 102 | Upvalues: t (ref) ]]
			t:CancelPlacement()
		end)
		return
	end
	v8.Click = v7.Button1Down:Connect(function() --[[ Line: 93 | Upvalues: v10 (ref), v3 (ref), v9 (ref), v11 (ref), t (ref), v4 (ref) ]]
		if v10 then
			v3:InvokeServer("SpawnVehicle", v9.AssetId, v9.Name, v11:GetPivot())
			t:CancelPlacement()
			v4:PlaySound("Impact")
		else
			v4:PlaySound("Invalid")
		end
	end)
	v8.Place = script.Parent.Place.MouseButton1Click:Connect(function() --[[ Line: 98 | Upvalues: v10 (ref), v3 (ref), v9 (ref), v11 (ref), t (ref), v4 (ref) ]]
		if v10 then
			v3:InvokeServer("SpawnVehicle", v9.AssetId, v9.Name, v11:GetPivot())
			t:CancelPlacement()
			v4:PlaySound("Impact")
		else
			v4:PlaySound("Invalid")
		end
	end)
	v8.Cancel = script.Parent.Cancel.MouseButton1Click:Connect(function() --[[ Line: 102 | Upvalues: t (ref) ]]
		t:CancelPlacement()
	end)
end
function t.CancelPlacement(p1) --[[ CancelPlacement | Line: 110 | Upvalues: v8 (copy), v6 (copy) ]]
	v8:DoCleaning()
	if not v6.Object.Visible then
		return
	end
	v6:SetVisible(false)
end
LocalPlayer.CharacterAdded:Connect(function() --[[ Line: 117 | Upvalues: t (copy) ]]
	t:CancelPlacement()
end)
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 122 | Upvalues: v5 (copy), t (copy) ]]
	if p1 ~= v5 or p2 then
		return
	end
	t:CancelPlacement()
end)
v6:RegisterGamepadAction(Enum.KeyCode.ButtonR2, function(p1, p2, p3) --[[ Line: 129 | Upvalues: v5 (copy), v10 (ref), v3 (copy), v9 (ref), v11 (ref), t (copy), v4 (copy) ]]
	if p2 ~= Enum.UserInputState.Begin or not v5.Visible then
		return
	end
	if v10 then
		v3:InvokeServer("SpawnVehicle", v9.AssetId, v9.Name, v11:GetPivot())
		t:CancelPlacement()
		v4:PlaySound("Impact")
		return
	end
	v4:PlaySound("Invalid")
end)
v6:RegisterGamepadAction(Enum.KeyCode.ButtonB, function(p1, p2, p3) --[[ Line: 135 | Upvalues: v5 (copy), t (copy) ]]
	if p2 ~= Enum.UserInputState.Begin or not v5.Visible then
		return
	end
	t:CancelPlacement()
end)
return t