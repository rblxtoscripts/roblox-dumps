-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("StatBar")
local v3 = Sonar("Table")
local BottomFrame = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("HUDGui"):WaitForChild("BottomFrame")
function t.new(p1) --[[ new | Line: 21 | Upvalues: t (copy), v1 (copy), BottomFrame (copy), v3 (copy), v2 (copy) ]]
	local v22 = setmetatable(p1, t)
	v22.Maid = v1.new()
	v22.BarsFrames = {}
	for k, v in pairs(BottomFrame:GetChildren()) do
		local v32 = v3.Copy(p1)
		local v4 = v.BarsFrame.Default:Clone()
		v4.Name = v22.Name
		v32.Frame = v4:FindFirstChild("ClipFrame", true).Parent
		v32.ParentFrame = v
		v22.Maid:GiveTask(v2.new(v32))
		v22.BarsFrames[v4] = true
		v4.Parent = v.BarsFrame
		v22.Maid:GiveTask(v4)
	end
	for k, v in pairs(v22.VisibleChanged) do
		v22.Maid:GiveTask(v:Connect(function() --[[ Line: 43 | Upvalues: v22 (copy) ]]
			v22:UpdateBar()
		end))
	end
	v22:UpdateBar()
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 52 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.UpdateBar(p1, p2) --[[ UpdateBar | Line: 57 ]]
	for k, v in pairs(p1.BarsFrames) do
		k.Visible = p1.Visible()
	end
end
function t.SetVisible(p1, p2) --[[ SetVisible | Line: 63 ]]
	for k, v in pairs(p1.BarsFrames) do
		k.Visible = p2
	end
end
return t