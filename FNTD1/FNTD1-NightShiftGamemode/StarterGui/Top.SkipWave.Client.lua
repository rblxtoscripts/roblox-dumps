-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local LocalPlayer = game.Players.LocalPlayer
local SkipWave = game.ReplicatedStorage.Remotes.Main.SkipWave
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local ClientState = require(game.ReplicatedStorage.PlayerData.ClientState)
local v1 = script.Parent
local Size = v1.Size
local v2 = 0
SkipWave.OnClientEvent:Connect(function(p1, p2, p3) --[[ Line: 13 | Upvalues: ClientState (copy), v2 (ref), v1 (copy), TweenService (copy), Size (copy) ]]
	if ClientState.GetData().Settings.AutoSkipPopup then
		return
	end
	if p1 == "Prompt" then
		v2 = p3
		v1.Yes.Visible = true
		v1.No.Visible = true
		v1.Message.Size = UDim2.new(0.801, 0, 0.285, 0)
		v1.Size = UDim2.new(0, 0, 0, 0)
		v1.Visible = true
		v1.Message.Text = "Skip Wave? " .. p2
		TweenService:Create(v1, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
			Size = Size
		}):Play()
		return
	end
	if p1 == "Update" then
		v1.Message.Text = "Skip Wave? " .. p2
		return
	end
	if p1 == "Voted" then
		v1.Yes.Visible = false
		v1.No.Visible = false
		v1.Message.Size = UDim2.new(0.801, 0, 0.566, 0)
		return
	end
	if p1 ~= "Close" then
		return
	end
	if p3 ~= v2 and p3 ~= true then
		return
	end
	TweenService:Create(v1, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, 0, 0, 0)
	}):Play()
	task.wait(0.2)
	v1.Visible = false
end)
v1.Yes.MouseButton1Click:Connect(function() --[[ Line: 43 | Upvalues: SkipWave (copy), v2 (ref) ]]
	SkipWave:FireServer(true, v2)
end)
v1.No.MouseButton1Click:Connect(function() --[[ Line: 47 | Upvalues: SkipWave (copy), v2 (ref) ]]
	SkipWave:FireServer(false, v2)
end)
Tween:AddButton(v1.Yes, nil, "ButtonClick")
Tween:AddButton(v1.No, nil, "ButtonClick")