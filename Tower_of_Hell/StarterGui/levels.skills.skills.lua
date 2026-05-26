-- https://lua.expert/
local t = {
	[3] = Color3.fromRGB(197, 255, 62),
	[2] = Color3.fromRGB(156, 255, 249),
	[1] = Color3.fromRGB(156, 255, 249),
	[0] = Color3.new(255/255, 255/255, 255/255),
	[-1] = Color3.new(255/255, 255/255, 255/255)
}
local TweenService = game:GetService("TweenService")
local stringListContains = require(game.ReplicatedStorage.Library.Utility.stringListContains)
local v1 = game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId)
local function v2(p1, p2) --[[ updateSkill | Line: 14 | Upvalues: stringListContains (copy), v1 (copy), t (copy), v2 (copy) ]]
	if not p1:FindFirstChild("unlocks") then
		return
	end
	local v12
	if p2 then
	else
		for k, v in pairs(p1.unlocks:GetChildren()) do
			for k2, v3 in pairs(v:GetChildren()) do
				if stringListContains(v1.activeskills.Value, p1.Parent.Name .. "/" .. v3.Value) then
					v12 = v
				end
			end
		end
	end
	for k, v in pairs(p1.unlocks:GetChildren()) do
		for k2, v3 in pairs(v:GetChildren()) do
			local v22 = stringListContains(v1.activeskills.Value, p1.Parent.Name .. "/" .. v3.Value)
			local v32 = if v22 then v22 else stringListContains(v1.skills.Value, p1.Parent.Name .. "/" .. v3.Value)
			local v4 = if v12 then if v == v12 then false else true else v12
			local sum = 0
			if v22 then
				sum = 3
			else
				if v32 then
					sum = sum + 2
				end
				if v4 then
					sum = sum - 1
				end
			end
			local v5 = p1.Parent:FindFirstChild(v3.Value)
			v5.back.ImageColor3 = t[sum]
			for k3, v6 in pairs(p1.Parent:GetChildren()) do
				if string.find(v6.Name, p1.Name .. "-" .. v3.Value, 0, true) then
					v6.BackgroundColor3 = v4 and Color3.new(0.7, 0.7, 0.7) or Color3.new(255/255, 255/255, 255/255)
				end
			end
			v5.state.Value = sum
			v2(v5, v4)
		end
	end
end
local function update() --[[ update | Line: 65 | Upvalues: v2 (copy) ]]
	for k, v in pairs(script.Parent:GetChildren()) do
		if v:IsA("Frame") and v:FindFirstChild("base") then
			v2(v.base)
		end
	end
end
local function buyactivate(p1) --[[ buyactivate | Line: 75 | Upvalues: stringListContains (copy), v1 (copy) ]]
	local v12 = p1.Parent.Name .. "/" .. p1.Name
	if stringListContains(v1.activeskills.Value, v12) then
		game.ReplicatedStorage.Remotes.Skills.deactivateSkill:InvokeServer(v12)
		return
	end
	if not stringListContains(v1.skills.Value, v12) then
		game.ReplicatedStorage.Remotes.Skills.buySkill:InvokeServer(v12)
	end
	game.ReplicatedStorage.Remotes.Skills.activateSkill:InvokeServer(v12)
end
for k, v in pairs(script.Parent:GetChildren()) do
	if v:IsA("Frame") and v:FindFirstChild("base") then
		for k2, v3 in pairs(v:GetChildren()) do
			if v3:IsA("ImageLabel") and v3.Name ~= "base" then
				local state = Instance.new("IntValue")
				state.Name = "state"
				state.Parent = v3
				v3.InputBegan:Connect(function(p1) --[[ Line: 95 | Upvalues: buyactivate (copy), v3 (copy) ]]
					if p1.UserInputType == Enum.UserInputType.MouseButton1 then
						buyactivate(v3)
						return
					end
					if p1.UserInputType ~= Enum.UserInputType.MouseMovement then
						return
					end
					if v3:FindFirstChild("desc") then
						script.Parent.desc.Text = v3.desc.Value
						return
					end
					script.Parent.desc.Text = ""
				end)
				v3.TouchTap:Connect(function() --[[ Line: 106 | Upvalues: v3 (copy), buyactivate (copy) ]]
					if script.Parent.selected.Value == v3 then
						buyactivate(v3)
					else
						script.Parent.selected.Value = v3
					end
				end)
			end
		end
	end
end
local selected = script.Parent.selected
local v3 = nil
selected.Changed:Connect(function() --[[ Line: 121 | Upvalues: v3 (ref), TweenService (copy), selected (copy) ]]
	if v3 then
		TweenService:Create(v3, TweenInfo.new(0.25), {
			Size = UDim2.new(1, 0, 1, 0)
		}):Play()
	end
	if selected.Value then
		TweenService:Create(selected.Value, TweenInfo.new(0.25), {
			Size = UDim2.new(1.2, 0, 1.2, 0)
		}):Play()
		script.Parent.desc.Text = selected.Value.desc.Value
	else
		script.Parent.desc.Text = ""
	end
	v3 = selected.Value
end)
game:GetService("UserInputService").InputBegan:Connect(function(p1) --[[ Line: 134 | Upvalues: selected (copy), buyactivate (copy) ]]
	if not selected.Value then
		return
	end
	local VRService = game:GetService("VRService")
	if VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
		return
	end
	if p1.KeyCode == Enum.KeyCode.DPadLeft then
		if selected.Value.NextSelectionLeft then
			selected.Value = selected.Value.NextSelectionLeft
		end
	elseif p1.KeyCode == Enum.KeyCode.DPadDown then
		if selected.Value.NextSelectionDown then
			selected.Value = selected.Value.NextSelectionDown
		end
	elseif p1.KeyCode == Enum.KeyCode.DPadRight then
		if selected.Value.NextSelectionRight then
			selected.Value = selected.Value.NextSelectionRight
		end
	elseif p1.KeyCode == Enum.KeyCode.DPadUp then
		if selected.Value.NextSelectionUp then
			selected.Value = selected.Value.NextSelectionUp
		end
	else
		if p1.KeyCode ~= Enum.KeyCode.ButtonX then
			return
		end
		buyactivate(selected.Value)
	end
end)
script.Parent:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 160 | Upvalues: selected (copy), TweenService (copy) ]]
	if script.Parent.Visible then
		return
	end
	if selected.Value then
		TweenService:Create(selected.Value, TweenInfo.new(0.4), {
			Size = UDim2.new(1, 0, 1, 0)
		}):Play()
	end
	script.Parent.desc.Text = ""
	selected.Value = nil
end)
v1:WaitForChild("activeskills").Changed:Connect(update)
v1:WaitForChild("skills").Changed:Connect(update)
update()