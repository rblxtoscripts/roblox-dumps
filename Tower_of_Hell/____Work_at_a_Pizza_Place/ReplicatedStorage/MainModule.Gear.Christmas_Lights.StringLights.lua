-- https://lua.expert/
local v1 = require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local v2 = require(game.ReplicatedStorage:WaitForChild("Enums"))
require(game.ReplicatedStorage:WaitForChild("Dialog"))
local v3 = game:GetService("UserInputService").TouchEnabled and not game:GetService("UserInputService").MouseEnabled and not game:GetService("UserInputService").KeyboardEnabled
local v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21
if not v3 then
	v4 = game.Players.LocalPlayer
	v5 = script.Parent
	v6 = v5:WaitForChild("Handle")
	v7 = v4:GetMouse()
	v8 = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	v9 = v8:WaitForChild("MainGui")
	v10 = Instance.new("SelectionBox")
	v10.Color = BrickColor.new("Bright red")
	v10.Adornee = nil
	v10.Parent = v8
	v11 = v1:SendData("GetHouseObject", "HouseChannel", 10)
	v12 = script.Parent.ChristmasLightCount
	v13 = nil
	v14 = nil
	v15 = { 1004, 1020, 1019, 1010, 1032, 1017, 1009 }
	function MouseMove() --[[ MouseMove | Line: 35 | Upvalues: v7 (copy), v11 (copy), v10 (copy), v14 (ref) ]]
		if not v7 or v7.Target == nil then
			return
		end
		local v1 = v7.Target:IsDescendantOf(v11)
		if v1 and v7.Target.Name == "CustomLight" then
			v10.Adornee = v7.Target
			if not v14 then
				return
			end
			v14.CFrame = CFrame.new(0, -20, 0)
			v14.XBillboard.Frame.Visible = false
		else
			if v14 and v14.Parent then
				if v1 and (v7.Target.Name == "Window" or (v7.Target.Name == "Wall" or v7.Target.Name == "Roof")) then
					v14.XBillboard.Frame.Visible = false
				else
					v14.XBillboard.Frame.Visible = true
				end
				v14.CFrame = CFrame.new(v7.Hit.p)
			end
			v10.Adornee = nil
		end
	end
	v16 = function() --[[ CreateNewLight | Line: 70 | Upvalues: v13 (ref), v6 (copy), v15 (copy), v14 (ref), v7 (copy) ]]
		if not (v13 > 0) then
			return
		end
		local v2
		repeat
			v2 = BrickColor.new(v15[math.random(1, #v15)])
		until v2 ~= v6.BrickColor
		v6.BrickColor = v2
		local _ = v6.BrickColor
		v14 = v6:clone()
		v14.Name = "CustomLight"
		v14.Position = Vector3.new(0, -20, 0)
		v14.Anchored = true
		v14.BrickColor = v6.BrickColor
		v14.Locked = true
		v14.Parent = workspace
		v7.TargetFilter = v14
		local v3 = game.ReplicatedStorage.XBillboard:clone()
		v3.Parent = v14
		v3.Adornee = v14
		v3.Size = UDim2.new(1, 0, 1, 0)
		v3.Frame.Visible = false
	end
	function IncrementAmount(p1_2) --[[ IncrementAmount | Line: 108 | Upvalues: v13 (ref), v12 (copy) ]]
		v13 = v13 + p1_2
		v12.Amount.Text = v13 .. " Christmas Lights Left"
	end
	function Button1Down() --[[ Button1Down | Line: 117 | Upvalues: v7 (copy), v11 (copy), v14 (ref), v1 (copy), v2 (copy), v16 (copy) ]]
		if not (v7 and v7.Target) then
			return
		end
		local v12 = v7.Target:IsDescendantOf(v11)
		if v7.Target.Name == "CustomLight" and v12 then
			local Target = v7.Target
			IncrementAmount(1)
			local _ = v7.Target.BrickColor
			local v22 = v14
			v1:SendData("RemoveChristmasLight", "HouseChannel", nil, Target)
			if not v2.IsStudio then
				Target:Destroy()
			end
			v16()
			if v22 then
				v22:Destroy()
			end
		else
			if v12 and (v7.Target.Name == "Window" or (v7.Target.Name == "Wall" or v7.Target.Name == "Roof")) then
				if not (v12 and (v14 and v14.Parent)) then
					return
				end
				local v3 = v11.CurrentUpgrade.Value.Marker.CFrame:pointToObjectSpace(v14.Position)
				local t2 = {}
				local v4 = tonumber(("%0.3f"):format(v3.X))
				local v5 = tonumber(("%0.3f"):format(v3.Y))
				t2[1] = v4
				t2[2] = v5
				t2[3] = tonumber(("%0.3f"):format(v3.Z))
				v1:SendData("AddChristmasLight", "HouseChannel", nil, v14.BrickColor.Number, t2)
				v14:Destroy()
				v14 = nil
				v7.TargetFilter = nil
				IncrementAmount(-1)
			else
				local v6 = v14
				workspace.MessageService.ShowHint.ShowHint:Fire("Put christmas lights on your house.", 5)
				delay(2, function() --[[ Line: 144 | Upvalues: v6 (copy) ]]
					if not (v6 and v6.Parent) then
						return
					end
					v6:Destroy()
				end)
			end
			v16()
		end
	end
	v17 = nil
	v18 = nil
	v19 = nil
	v20 = nil
	v21 = nil
	function onEquippedLocal() --[[ onEquippedLocal | Line: 174 | Upvalues: v21 (ref), v20 (ref), v11 (copy), v13 (ref), v1 (copy), v12 (copy), v9 (copy), v16 (copy), v3 (copy), v19 (ref), v17 (ref), v7 (copy), v18 (ref) ]]
		local v14 = script.Parent.Parent
		game.Players:GetPlayerFromCharacter(v14)
		v21 = v14:FindFirstChild("Humanoid")
		if v21 then
			v20 = v21.JumpPower
			v21.JumpPower = 100
		end
		for i2, v in ipairs(v11.CurrentUpgrade.Value:GetChildren()) do
			if v.Name == "Barrier" or v.Name == "DoorTouch" then
				v.Transparency = 0.5
			end
		end
		v13 = v1:SendData("GetChristmasLightsLeft", "HouseChannel", 10)
		v12.Amount.Text = v13 .. " Christmas Lights Left"
		v12.Parent = v9:WaitForChild("Notifications")
		v16()
		if v3 then
			v19 = game:GetService("UserInputService").TouchTap:connect(function() --[[ Line: 208 ]]
				MouseMove()
				Button1Down()
			end)
		else
			v17 = v7.Button1Down:connect(Button1Down)
			v18 = v7.Move:connect(MouseMove)
		end
	end
	function onUnequippedLocal() --[[ onUnequippedLocal | Line: 221 | Upvalues: v14 (ref), v12 (copy), v5 (copy), v21 (ref), v20 (ref), v19 (ref), v17 (ref), v18 (ref), v11 (copy) ]]
		if v14 then
			v14:Destroy()
		end
		v12.Parent = v5
		if v21 then
			v21.JumpPower = v20
		end
		if v19 then
			v19:disconnect()
		end
		if v17 then
			v17:disconnect()
		end
		if v18 then
			v18:disconnect()
		end
		for i2, v in ipairs(v11.CurrentUpgrade.Value:GetChildren()) do
			if v.Name == "Barrier" or v.Name == "DoorTouch" then
				v.Transparency = 1
			end
		end
	end
	v5.Equipped:connect(onEquippedLocal)
	v5.Unequipped:connect(onUnequippedLocal)
	return
end
script.Parent.ToolTip = ""
v4 = game.Players.LocalPlayer
v5 = script.Parent
v6 = v5:WaitForChild("Handle")
v7 = v4:GetMouse()
v8 = game.Players.LocalPlayer:WaitForChild("PlayerGui")
v9 = v8:WaitForChild("MainGui")
v10 = Instance.new("SelectionBox")
v10.Color = BrickColor.new("Bright red")
v10.Adornee = nil
v10.Parent = v8
v11 = v1:SendData("GetHouseObject", "HouseChannel", 10)
v12 = script.Parent.ChristmasLightCount
v13 = nil
v14 = nil
v15 = { 1004, 1020, 1019, 1010, 1032, 1017, 1009 }
function MouseMove() --[[ MouseMove | Line: 35 | Upvalues: v7 (copy), v11 (copy), v10 (copy), v14 (ref) ]]
	if not v7 or v7.Target == nil then
		return
	end
	local v1 = v7.Target:IsDescendantOf(v11)
	if v1 and v7.Target.Name == "CustomLight" then
		v10.Adornee = v7.Target
		if not v14 then
			return
		end
		v14.CFrame = CFrame.new(0, -20, 0)
		v14.XBillboard.Frame.Visible = false
	else
		if v14 and v14.Parent then
			if v1 and (v7.Target.Name == "Window" or (v7.Target.Name == "Wall" or v7.Target.Name == "Roof")) then
				v14.XBillboard.Frame.Visible = false
			else
				v14.XBillboard.Frame.Visible = true
			end
			v14.CFrame = CFrame.new(v7.Hit.p)
		end
		v10.Adornee = nil
	end
end
v16 = function() --[[ CreateNewLight | Line: 70 | Upvalues: v13 (ref), v6 (copy), v15 (copy), v14 (ref), v7 (copy) ]]
	if not (v13 > 0) then
		return
	end
	local v2
	repeat
		v2 = BrickColor.new(v15[math.random(1, #v15)])
	until v2 ~= v6.BrickColor
	v6.BrickColor = v2
	local _ = v6.BrickColor
	v14 = v6:clone()
	v14.Name = "CustomLight"
	v14.Position = Vector3.new(0, -20, 0)
	v14.Anchored = true
	v14.BrickColor = v6.BrickColor
	v14.Locked = true
	v14.Parent = workspace
	v7.TargetFilter = v14
	local v3 = game.ReplicatedStorage.XBillboard:clone()
	v3.Parent = v14
	v3.Adornee = v14
	v3.Size = UDim2.new(1, 0, 1, 0)
	v3.Frame.Visible = false
end
function IncrementAmount(p1_2) --[[ IncrementAmount | Line: 108 | Upvalues: v13 (ref), v12 (copy) ]]
	v13 = v13 + p1_2
	v12.Amount.Text = v13 .. " Christmas Lights Left"
end
function Button1Down() --[[ Button1Down | Line: 117 | Upvalues: v7 (copy), v11 (copy), v14 (ref), v1 (copy), v2 (copy), v16 (copy) ]]
	if not (v7 and v7.Target) then
		return
	end
	local v12 = v7.Target:IsDescendantOf(v11)
	if v7.Target.Name == "CustomLight" and v12 then
		local Target = v7.Target
		IncrementAmount(1)
		local _ = v7.Target.BrickColor
		local v22 = v14
		v1:SendData("RemoveChristmasLight", "HouseChannel", nil, Target)
		if not v2.IsStudio then
			Target:Destroy()
		end
		v16()
		if v22 then
			v22:Destroy()
		end
	else
		if v12 and (v7.Target.Name == "Window" or (v7.Target.Name == "Wall" or v7.Target.Name == "Roof")) then
			if not (v12 and (v14 and v14.Parent)) then
				return
			end
			local v3 = v11.CurrentUpgrade.Value.Marker.CFrame:pointToObjectSpace(v14.Position)
			local t2 = {}
			local v4 = tonumber(("%0.3f"):format(v3.X))
			local v5 = tonumber(("%0.3f"):format(v3.Y))
			t2[1] = v4
			t2[2] = v5
			t2[3] = tonumber(("%0.3f"):format(v3.Z))
			v1:SendData("AddChristmasLight", "HouseChannel", nil, v14.BrickColor.Number, t2)
			v14:Destroy()
			v14 = nil
			v7.TargetFilter = nil
			IncrementAmount(-1)
		else
			local v6 = v14
			workspace.MessageService.ShowHint.ShowHint:Fire("Put christmas lights on your house.", 5)
			delay(2, function() --[[ Line: 144 | Upvalues: v6 (copy) ]]
				if not (v6 and v6.Parent) then
					return
				end
				v6:Destroy()
			end)
		end
		v16()
	end
end
v17 = nil
v18 = nil
v19 = nil
v20 = nil
v21 = nil
function onEquippedLocal() --[[ onEquippedLocal | Line: 174 | Upvalues: v21 (ref), v20 (ref), v11 (copy), v13 (ref), v1 (copy), v12 (copy), v9 (copy), v16 (copy), v3 (copy), v19 (ref), v17 (ref), v7 (copy), v18 (ref) ]]
	local v14 = script.Parent.Parent
	game.Players:GetPlayerFromCharacter(v14)
	v21 = v14:FindFirstChild("Humanoid")
	if v21 then
		v20 = v21.JumpPower
		v21.JumpPower = 100
	end
	for i2, v in ipairs(v11.CurrentUpgrade.Value:GetChildren()) do
		if v.Name == "Barrier" or v.Name == "DoorTouch" then
			v.Transparency = 0.5
		end
	end
	v13 = v1:SendData("GetChristmasLightsLeft", "HouseChannel", 10)
	v12.Amount.Text = v13 .. " Christmas Lights Left"
	v12.Parent = v9:WaitForChild("Notifications")
	v16()
	if v3 then
		v19 = game:GetService("UserInputService").TouchTap:connect(function() --[[ Line: 208 ]]
			MouseMove()
			Button1Down()
		end)
	else
		v17 = v7.Button1Down:connect(Button1Down)
		v18 = v7.Move:connect(MouseMove)
	end
end
function onUnequippedLocal() --[[ onUnequippedLocal | Line: 221 | Upvalues: v14 (ref), v12 (copy), v5 (copy), v21 (ref), v20 (ref), v19 (ref), v17 (ref), v18 (ref), v11 (copy) ]]
	if v14 then
		v14:Destroy()
	end
	v12.Parent = v5
	if v21 then
		v21.JumpPower = v20
	end
	if v19 then
		v19:disconnect()
	end
	if v17 then
		v17:disconnect()
	end
	if v18 then
		v18:disconnect()
	end
	for i2, v in ipairs(v11.CurrentUpgrade.Value:GetChildren()) do
		if v.Name == "Barrier" or v.Name == "DoorTouch" then
			v.Transparency = 1
		end
	end
end
v5.Equipped:connect(onEquippedLocal)
v5.Unequipped:connect(onUnequippedLocal)