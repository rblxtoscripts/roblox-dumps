-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local v1 = game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId)
local coins = v1:WaitForChild("coins")
local v2 = false
function update() --[[ update | Line: 5 | Upvalues: v2 (ref), TweenService (copy) ]]
	if v2 then
		return
	end
	v2 = true
	wait(0.1)
	local oldyxles = script.Parent.Frame.yxles
	if oldyxles.Text == "loading" then
		oldyxles.Text = require(game.ReplicatedStorage.Library.Modules.getRealCoins)(game.Players.LocalPlayer)
	else
		local v1 = require(game.ReplicatedStorage.Library.Modules.getRealCoins)(game.Players.LocalPlayer)
		local v22 = oldyxles.Text - v1
		if v22 ~= 0 then
			local v3 = oldyxles:Clone()
			v3.Parent = oldyxles.Parent
			v3.Text = v1
			oldyxles.Name = "oldyxles"
			v3.Position = UDim2.new(0, 0, 0.5 - math.sign(v22) * 1, 0)
			TweenService:Create(oldyxles, TweenInfo.new(0.5), {
				Position = UDim2.new(0, 0, math.sign(v22) * 1 + 0.5, 0)
			}):Play()
			TweenService:Create(v3, TweenInfo.new(0.5), {
				Position = UDim2.new(0, 0, 0.5, 0)
			}):Play()
			game:GetService("Debris"):AddItem(oldyxles, 0.5)
		end
	end
	v2 = false
end
coins.Changed:Connect(update)
v1:WaitForChild("highestSection").Changed:connect(update)
update()