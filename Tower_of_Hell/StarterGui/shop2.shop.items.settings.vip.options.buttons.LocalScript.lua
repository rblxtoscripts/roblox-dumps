-- https://lua.expert/
local UserInputService = game:GetService("UserInputService")
local v1 = script.Parent.Parent.Parent.Parent.Parent.Parent.Parent
local function skip() --[[ skip | Line: 4 ]]
	game.ReplicatedStorage.Remotes.Moderation.executeCommand:InvokeServer("/skip")
end
local v2 = false
script.Parent.skip.InputBegan:Connect(function(p1) --[[ Line: 9 | Upvalues: v2 (ref) ]]
	if p1.UserInputType ~= Enum.UserInputType.MouseButton1 then
		return
	end
	if v2 then
		return
	end
	v2 = true
	game.ReplicatedStorage.Remotes.Moderation.executeCommand:InvokeServer("/skip")
	wait(5)
	v2 = false
end)
script.Parent.skip.TouchTap:Connect(function() --[[ Line: 18 | Upvalues: v2 (ref) ]]
	if not v2 then
		v2 = true
		game.ReplicatedStorage.Remotes.Moderation.executeCommand:InvokeServer("/skip")
		wait(5)
		v2 = false
	end
end)
local function lock() --[[ lock | Line: 26 ]]
	if script.Parent.lock.TextLabel.Text == "Lock Shop" then
		script.Parent.lock.TextLabel.Text = "Unlock Shop"
		game.ReplicatedStorage.Remotes.Moderation.executeCommand:InvokeServer("/lockshop")
	else
		script.Parent.lock.TextLabel.Text = "Lock Shop"
		game.ReplicatedStorage.Remotes.Moderation.executeCommand:InvokeServer("/unlockShop")
	end
end
script.Parent.lock.InputBegan:Connect(function(p1) --[[ Line: 36 | Upvalues: lock (copy) ]]
	if p1.UserInputType ~= Enum.UserInputType.MouseButton1 then
		return
	end
	lock()
end)
script.Parent.lock.TouchTap:Connect(function() --[[ Line: 41 | Upvalues: lock (copy) ]]
	lock()
end)
script.Parent.lock.TextLabel.Text = if game.ReplicatedStorage.Configuration.shopLocked.Value then "Unlock Shop" else "Lock Shop"
function updateOpen() --[[ updateOpen | Line: 46 | Upvalues: v1 (copy) ]]
	local v12 = if script.Parent.Parent.Parent.Parent.selected.Value == script.Parent then script.Parent.Parent.Parent.Parent.open.Value else false
	for k, v in pairs(script.Parent:GetChildren()) do
		if v:FindFirstChild("xbox") then
			v.xbox.Visible = false
		end
	end
	script.Parent.selected.Value.xbox.Visible = if v12 then v1.controller.Value else v12
end
script.Parent.Parent.Parent.Parent.selected.Changed:Connect(updateOpen)
script.Parent.Parent.Parent.Parent.open.Changed:Connect(updateOpen)
v1.controller.Changed:Connect(updateOpen)
UserInputService.InputBegan:Connect(function(p1) --[[ Line: 60 | Upvalues: lock (copy) ]]
	if script.Parent.Parent.Parent.Parent.selected.Value ~= script.Parent or not script.Parent.Parent.Parent.Parent.open.Value then
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
		if script.Parent.selected.Value == script.Parent.lock then
			lock()
		else
			game.ReplicatedStorage.Remotes.Moderation.executeCommand:InvokeServer("/skip")
		end
	else
		if p1.KeyCode == Enum.KeyCode.DPadLeft then
			script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionLeft or script.Parent.selected.Value
		else
			if p1.KeyCode ~= Enum.KeyCode.DPadRight then
				return
			end
			script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionRight or script.Parent.selected.Value
		end
		updateOpen()
	end
end)
local v4 = false
UserInputService.InputChanged:Connect(function(p1) --[[ Line: 84 | Upvalues: v4 (ref) ]]
	if p1.KeyCode ~= Enum.KeyCode.Thumbstick1 or (script.Parent.Parent.Parent.Parent.selected.Value ~= script.Parent or not script.Parent.Parent.Parent.Parent.open.Value) then
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
		if v4 then
			return
		end
		script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionLeft or script.Parent.selected.Value
		updateOpen()
		v4 = true
		return
	end
	if p1.Position.X > 0.8 then
		if v4 then
			return
		end
		script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionRight or script.Parent.selected.Value
		updateOpen()
		v4 = true
		return
	end
	v4 = false
end)