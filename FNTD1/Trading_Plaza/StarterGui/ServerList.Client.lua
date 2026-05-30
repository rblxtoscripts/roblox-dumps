-- https://lua.expert/
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = game.Players.LocalPlayer
local ServerList = game.ReplicatedStorage.Remotes.Misc.ServerList
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local MainFrame = script.Parent.MainFrame
local ServerList_2 = script.Parent.Parent:WaitForChild("SideDock"):WaitForChild("Container"):WaitForChild("ServerList")
local v1 = false
function update() --[[ update | Line: 13 | Upvalues: ServerList (copy), v1 (ref), MainFrame (copy), Tween (copy), LocalPlayer (copy) ]]
	local v12 = ServerList:InvokeServer(v1)
	for k, v in pairs(MainFrame.ScrollingFrame:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "Example" then
			v:Destroy()
		end
	end
	task.wait(0.2)
	for k, v in pairs(v12) do
		local value = v.value
		local v2 = MainFrame.ScrollingFrame.Example:Clone()
		v2.Name = value.JobId
		v2.Location.Text = value.Region .. ", " .. value.Country
		v2.Players.Text = value.Players .. "/30"
		v2.Parent = MainFrame.ScrollingFrame
		v2.Visible = true
		v2.LayoutOrder = k
		Tween:AddButton(v2.Join, nil, "ButtonClick")
		v2.Join.MouseButton1Click:Connect(function() --[[ Line: 36 | Upvalues: value (copy), LocalPlayer (ref) ]]
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, value.JobId, LocalPlayer)
		end)
	end
end
task.spawn(update)
local v2 = nil
MainFrame.Refresh.MouseButton1Click:Connect(function() --[[ Line: 46 | Upvalues: v2 (ref) ]]
	if not v2 then
		v2 = true
		delay(1, function() --[[ Line: 50 | Upvalues: v2 (ref) ]]
			v2 = nil
		end)
		update()
	end
end)
local v3 = nil
MainFrame.Order.MouseButton1Click:Connect(function() --[[ Line: 61 | Upvalues: v3 (ref), v1 (ref) ]]
	if not v3 then
		v3 = true
		delay(1, function() --[[ Line: 65 | Upvalues: v3 (ref) ]]
			v3 = nil
		end)
		v1 = not v1
		update()
	end
end)
MainFrame:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 76 | Upvalues: MainFrame (copy), UserInputService (copy) ]]
	if not MainFrame.Visible then
		return
	end
	if not UserInputService.GamepadEnabled then
		return
	end
	task.wait(0.15)
end)
MainFrame.Pro.MouseButton1Click:Connect(function() --[[ Line: 84 ]]
	game.ReplicatedStorage.Remotes.Misc.JoinPro:FireServer()
end)
function updatePro() --[[ updatePro | Line: 88 | Upvalues: MainFrame (copy) ]]
	if game.PlaceId == 18500285704 or game.PlaceId == 18512922127 then
		MainFrame.Pro.TextLabel.Text = "PRO SERVERS"
	else
		MainFrame.Pro.TextLabel.Text = "NORMAL SERVERS"
	end
end
updatePro()
Tween:AddButton(MainFrame.Exit, MainFrame, "ButtonClick")
Tween:AddButton(ServerList_2, MainFrame, "ButtonClick")
Tween:AddButton(MainFrame.Refresh, nil, "ButtonClick")
Tween:AddButton(MainFrame.Order, nil, "ButtonClick")
Tween:AddButton(MainFrame.Pro, nil, "ButtonClick")