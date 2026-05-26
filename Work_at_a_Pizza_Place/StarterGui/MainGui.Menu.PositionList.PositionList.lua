-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
Library:Load("Utility")
local v1 = Library:Load("Network")
local v2 = script.Parent
local ExploitList = script.Parent.Parent.ExploitList
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
PlayerGui:WaitForChild("UIEvents")
require(game.ReplicatedStorage:WaitForChild("Enums"))
local Row = v2.ScrollingFrame.Row
local Title = v2.Title
Row.Visible = false
Row.Parent = v2
local v3 = GuiManager:RegisterWindow(v2, "Left", "Right")
local v4 = GuiManager:RegisterWindow(ExploitList, "Left", "Right")
v1:Listen({
	OpenTeleportHistory = function(p1, p2) --[[ OpenTeleportHistory | Line: 26 | Upvalues: v2 (copy), Title (copy), Row (copy), LocalPlayer (copy) ]]
		for i, v in ipairs(v2.ScrollingFrame:GetChildren()) do
			if v.Name == "Row" then
				v:Destroy(0)
			end
		end
		Title.Text = "Teleport History for " .. p2
		for i, v in ipairs(p1) do
			local v1 = Row:Clone()
			v1.Number.Text = i
			v1.DateTime.Text = os.date("%I:%M:%S %p", v.Time)
			v1.Zone.Text = v.Zone
			v1.Teleport.MouseButton1Click:Connect(function() --[[ Line: 41 | Upvalues: v (copy), LocalPlayer (ref) ]]
				LocalPlayer.Character:PivotTo((CFrame.new(table.unpack(v.CFrame))))
			end)
			v1.Visible = true
			v1.Parent = v2.ScrollingFrame
		end
	end
})
v2.ReturnButton.MouseButton1Click:Connect(function() --[[ Line: 52 | Upvalues: v3 (copy), v4 (copy) ]]
	v3:SetVisible(false)
	v4:SetVisible(true)
end)