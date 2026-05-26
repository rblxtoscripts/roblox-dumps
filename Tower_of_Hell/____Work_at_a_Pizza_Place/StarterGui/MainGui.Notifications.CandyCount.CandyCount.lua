-- https://lua.expert/
task.wait(3)
if game.ReplicatedStorage.GlobalData.Holiday.Value ~= "Halloween" then
	return
end
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Utility")
Library:Load("Events")
local v2 = Library:Load("SoundFX")
Library:Load("Tween")
local v3 = script.Parent
local LocalPlayer = game.Players.LocalPlayer
local v4 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local List = v3:WaitForChild("List")
local Template = v3:WaitForChild("Template")
local t = {}
local v5 = v1:SendData("GetCandyCounts", "PlayerChannel", 10) or v1:SendData("GetCandyCounts", "PlayerChannel", 10)
if v5 then
	for i, v in ipairs(v4.CandyTypes) do
		local v6 = Template:clone()
		v6.Quantity.Text = v5[v.Name]
		v6.Candy.Image = "rbxassetid://" .. v.ImageId
		v6.Parent = List
		v6.Visible = true
		t[v.Name] = v6
	end
end
function Refresh() --[[ Refresh | Line: 33 | Upvalues: v5 (ref), t (copy) ]]
	for k, v in pairs(v5) do
		t[k].Quantity.Text = tostring(v)
	end
end
local v7 = 0
local v8 = nil
workspace.Main.CandyGiven.OnClientEvent:Connect(function(p1, p2) --[[ Line: 43 | Upvalues: t (copy), v8 (ref), v7 (ref), v2 (copy), v5 (ref) ]]
	local v1 = t[p1]
	v7 = if v8 and tick() - v8 < 2 then v7 + 1 else 0
	v8 = tick()
	v2:PlaySound("GotCandy")
	v5[p1] = p2
	local v22 = game:GetService("TweenService"):Create(v1.Quantity, TweenInfo.new(0.3), {
		Rotation = 360
	})
	v22.Completed:connect(function() --[[ Line: 63 | Upvalues: v1 (copy) ]]
		v1.Quantity.Rotation = 0
		Refresh()
	end)
	v22:Play()
end)
workspace.Main.RefreshCandyCounters.OnClientEvent:Connect(function(p1) --[[ Line: 72 | Upvalues: v5 (ref) ]]
	v5 = p1
	Refresh()
end)