-- https://lua.expert/
local LocalPlayer = game.Players.LocalPlayer
LocalPlayer.PlayerGui:WaitForChild("uiStyle")
local v1 = game.ReplicatedStorage.data:WaitForChild(LocalPlayer.UserId)
local v2 = script.Parent.Parent.Parent.Parent.Parent
local UserInputService = game:GetService("UserInputService")
local function setTheme(p1) --[[ setTheme | Line: 7 | Upvalues: v1 (copy) ]]
	local Theme = v1.settings.Theme
	for k, v in pairs(p1:WaitForChild("uiStyle"):GetChildren()) do
		local v12 = Theme:FindFirstChild(v.Name)
		if v12 then
			v12.Value = v.Value
			v12.set:FireServer(v.Value)
		end
	end
end
for k, v in pairs(script.Parent.themes:GetChildren()) do
	if v:IsA("GuiButton") then
		v.InputBegan:Connect(function(p1) --[[ Line: 20 | Upvalues: setTheme (copy), v (copy) ]]
			if p1.UserInputType ~= Enum.UserInputType.MouseButton1 then
				return
			end
			setTheme(v)
		end)
		v.TouchTap:Connect(function() --[[ Line: 25 | Upvalues: setTheme (copy), v (copy) ]]
			setTheme(v)
		end)
	end
end
function updateOpen() --[[ updateOpen | Line: 31 | Upvalues: v2 (copy) ]]
	local v1 = if script.Parent.Parent.selected.Value == script.Parent then script.Parent.Parent.open.Value else false
	for k, v in pairs(script.Parent.themes:GetChildren()) do
		if v:FindFirstChild("xbox") then
			v.xbox.Visible = false
		end
	end
	script.Parent.selected.Value.xbox.Visible = if v1 then v2.controller.Value else v1
end
script.Parent.Parent.selected.Changed:Connect(updateOpen)
script.Parent.Parent.open.Changed:Connect(updateOpen)
v2.controller.Changed:Connect(updateOpen)
UserInputService.InputBegan:Connect(function(p1) --[[ Line: 45 | Upvalues: setTheme (copy) ]]
	if script.Parent.Parent.selected.Value ~= script.Parent or not script.Parent.Parent.open.Value then
		return
	end
	local VRService = game:GetService("VRService")
	if VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
		return
	end
	if not (p1.UserInputType.Value >= 12 and p1.UserInputType.Value <= 19) then
		return
	end
	if p1.KeyCode == Enum.KeyCode.ButtonX then
		setTheme(script.Parent.selected.Value)
		return
	end
	if p1.KeyCode == Enum.KeyCode.DPadLeft then
		script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionLeft or script.Parent.selected.Value
	else
		if p1.KeyCode ~= Enum.KeyCode.DPadRight then
			return
		end
		script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionRight or script.Parent.selected.Value
	end
	updateOpen()
end)
local v3 = false
UserInputService.InputChanged:Connect(function(p1) --[[ Line: 63 | Upvalues: v3 (ref) ]]
	if p1.KeyCode ~= Enum.KeyCode.Thumbstick1 or (script.Parent.Parent.selected.Value ~= script.Parent or not script.Parent.Parent.open.Value) then
		return
	end
	local VRService = game:GetService("VRService")
	if VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
		return
	end
	if not (math.abs(p1.Position.Y) < 0.4) then
		return
	end
	if p1.Position.X < -0.8 then
		if v3 then
			return
		end
		script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionLeft or script.Parent.selected.Value
		updateOpen()
		v3 = true
		return
	end
	if p1.Position.X > 0.8 then
		if v3 then
			return
		end
		script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionRight or script.Parent.selected.Value
		updateOpen()
		v3 = true
		return
	end
	v3 = false
end)