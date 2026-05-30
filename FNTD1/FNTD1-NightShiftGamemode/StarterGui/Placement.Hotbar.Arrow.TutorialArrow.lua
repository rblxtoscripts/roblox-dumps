-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local LocalPlayer = game.Players.LocalPlayer
local v1 = script.Parent
local Position = v1.Position
local v2 = false
function doArrow() --[[ doArrow | Line: 9 | Upvalues: v2 (ref), v1 (copy), TweenService (copy), Position (copy), LocalPlayer (copy) ]]
	if v2 then
		return
	end
	v2 = true
	repeat
		task.wait(0.1)
	until game.ReplicatedStorage.Values.Wave.Value >= 1
	v1.Visible = true
	local v12 = TweenService:Create(v1, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In), {
		Position = Position + UDim2.new(0, 0, -0.3, 0)
	})
	local v22 = TweenService:Create(v1, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
		Position = Position
	})
	repeat
		if LocalPlayer:FindFirstChild("PlacedTower") then
			break
		end
		v12:Play()
		v12.Completed:Wait()
		if LocalPlayer:FindFirstChild("PlacedTower") then
			break
		end
		v22:Play()
		v22.Completed:Wait()
	until LocalPlayer:FindFirstChild("PlacedTower")
	v1.Visible = false
end
if not game.ReplicatedStorage.Values.Tutorial.Value then
	game.ReplicatedStorage.Values.Tutorial.Changed:Connect(function() --[[ Line: 36 ]]
		if not game.ReplicatedStorage.Values.Tutorial.Value then
			return
		end
		task.spawn(doArrow)
	end)
	return
end
task.spawn(doArrow)
game.ReplicatedStorage.Values.Tutorial.Changed:Connect(function() --[[ Line: 36 ]]
	if not game.ReplicatedStorage.Values.Tutorial.Value then
		return
	end
	task.spawn(doArrow)
end)