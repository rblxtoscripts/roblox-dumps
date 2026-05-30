-- https://lua.expert/
local LocalPlayer = game.Players.LocalPlayer
local PowerMode = game.ReplicatedStorage.Remotes.Main.PowerMode
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local ViewCameras = script.Parent.Parent.ViewCameras
local v1 = script.Parent
local Top = v1.Parent.Parent:WaitForChild("Top")
local Power = script.Parent.Parent.Parent:WaitForChild("Top"):WaitForChild("Power")
local v2 = nil
function updateMap(p1, p2, p3) --[[ updateMap | Line: 14 | Upvalues: v2 (ref), v1 (copy) ]]
	v2 = p1
	for k, v in pairs(v1["Night" .. p1]:GetChildren()) do
		local v12
		if string.find(v.Name, "Path") then
			if p2 and table.find(p2, string.gsub(v.Name, "Path", "")) then
				v.Visible = true
				v.Image = "rbxassetid://91791557756528"
				v12 = true
			else
				v12 = false
			end
			if p3 and table.find(p3, string.gsub(v.Name, "Path", "")) then
				v.Visible = true
				v.Image = "rbxassetid://17687130000"
				v12 = true
			end
			if not v12 then
				v.Visible = false
			end
		end
	end
end
function updatePosition() --[[ updatePosition | Line: 39 | Upvalues: v2 (ref), LocalPlayer (copy), v1 (copy) ]]
	v2 = game.ReplicatedStorage.Remotes.Main.GetNight:InvokeServer()
	local InRoom = LocalPlayer.InRoom.Value
	for k, v in pairs(v1["Night" .. v2]:GetChildren()) do
		if string.find(v.Name, "Room") then
			if v.Name == "Room" .. InRoom then
				v.Visible = true
				continue
			end
			v.Visible = false
		end
	end
end
function updatePower() --[[ updatePower | Line: 53 | Upvalues: Top (copy) ]]
	Top.Power.Text = ("Power Left: %*%%"):format(math.round(game.ReplicatedStorage.Values.Power.Value * 10) / 10)
end
function updatePerSecond(p1) --[[ updatePerSecond | Line: 57 | Upvalues: Top (copy) ]]
	local v1 = if p1 >= 1.2 then {} elseif p1 >= 0.8 then { "4" } elseif p1 >= 0.4 then { "3", "4" } elseif p1 >= 0.2 then { "2", "3", "4" } else { "1", "2", "3", "4" }
	for k, v in pairs(Top.Power.UsageFrame:GetChildren()) do
		if v:IsA("Frame") then
			if table.find(v1, v.Name) then
				v.Visible = false
				continue
			end
			v.Visible = true
		end
	end
end
function buttonVisibility() --[[ buttonVisibility | Line: 82 | Upvalues: v1 (copy), ViewCameras (copy), Power (copy) ]]
	v1.Visible = false
	if game.ReplicatedStorage.Values.PowerMode.Value then
		ViewCameras.Visible = true
		Power.Visible = true
		script.Parent.Parent.Parent:WaitForChild("Top"):WaitForChild("Money").Visible = false
	else
		ViewCameras.Visible = false
		Power.Visible = false
		script.Parent.Parent.Parent:WaitForChild("Top"):WaitForChild("Money").Visible = true
	end
end
PowerMode.OnClientEvent:Connect(function(p1, ...) --[[ Line: 95 ]]
	if p1 == "UpdateMap" then
		updateMap(...)
		return
	end
	if p1 ~= "PerSecond" then
		return
	end
	updatePerSecond(...)
end)
buttonVisibility()
game.ReplicatedStorage.Values.PowerMode.Changed:Connect(function() --[[ Line: 104 ]]
	buttonVisibility()
end)
ViewCameras.MouseButton1Click:Connect(function() --[[ Line: 108 | Upvalues: v1 (copy) ]]
	v1.Visible = not v1.Visible
end)
Tween:AddButton(ViewCameras)
updatePower()
game.ReplicatedStorage.Values.Power.Changed:Connect(updatePower)
repeat
	task.wait(0.1)
until LocalPlayer:FindFirstChild("InRoom")
task.spawn(updatePosition)
LocalPlayer.InRoom.Changed:Connect(updatePosition)