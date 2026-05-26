-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Utility")
local v2 = Library:Load("Network")
local v3 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
PlayerGui:WaitForChild("UIEvents")
local v4 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local CancelButton = v3:WaitForChild("CancelButton")
local v5 = GuiManager:RegisterWindow(v3, "Left", "Right")
local v6 = false
local Current_Player = v3:WaitForChild("Current_Player")
local ScrollingFrame = v3:WaitForChild("List"):WaitForChild("ScrollingFrame")
v5.FirstSelectedObject = ScrollingFrame:WaitForChild("BackToWork")
local t = {}
function UpdateCounters() --[[ UpdateCounters | Line: 28 | Upvalues: v6 (ref), t (ref), v1 (copy), Current_Player (copy), ScrollingFrame (copy), v4 (copy) ]]
	v6 = true
	t = v1:SendData("GetCounters", "ManagerChannel", 2, Current_Player.Value) or {}
	for k, v in pairs(t) do
		local v2 = ScrollingFrame:FindFirstChild(k)
		if v2 then
			local Button = v2.Button
			local ProgressBackground = v2.ProgressBackground
			local Progress = v2.ProgressBackground.Progress
			Button.Active = false
			spawn(function() --[[ Line: 41 | Upvalues: v6 (ref), t (ref), k (copy), v4 (ref), Progress (copy), ProgressBackground (copy), Button (copy) ]]
				while v6 do
					Progress.Size = UDim2.new(1 - t[k] / (v4.CoolDownTimes[k] * 60), 0, 1, 0)
					ProgressBackground.Visible = if t[k] == 0 then false else true
					Button.Active = if t[k] == v4.CoolDownTimes[k] * 60 then true else false
					if t[k] == 0 then
						Button.Active = true
						return
					end
					t[k] = t[k] - 1
					task.wait(1)
				end
			end)
		end
	end
end
function click(p1) --[[ click | Line: 69 | Upvalues: t (ref), Current_Player (copy), v5 (copy), ScrollingFrame (copy), v2 (copy), v1 (copy) ]]
	if p1 ~= "QuitJob" and (p1 ~= "Fire" and t[p1] ~= 0) then
		return
	end
	if p1 ~= "QuitJob" and (p1 ~= "Fire" and (Current_Player.Value == nil or (t[p1] == nil or t[p1] > 0))) then
		return
	end
	v5:SetVisible(false)
	if p1 == "Fire" then
		ScrollingFrame.Fire.Visible = false
		v2:FireServer("FirePlayer", Current_Player.Value)
	else
		v1:SendData(p1, "ManagerChannel", nil, Current_Player.Value)
	end
	Current_Player.Value = nil
end
local t2 = {}
local v7 = nil
v3.Changed:connect(function(p1) --[[ Line: 92 | Upvalues: Current_Player (copy), v3 (copy), t2 (ref), v7 (ref), ScrollingFrame (copy), v6 (ref) ]]
	if p1 ~= "Visible" or not Current_Player.Value then
		return
	end
	if v3.Visible then
		for i, v in ipairs(t2) do
			v:disconnect()
		end
		t2 = {}
		if v7 then
			v7:disconnect()
		end
		v7 = nil
		v3.Title.Text = Current_Player.Value.DisplayName
		if Current_Player.Value and (Current_Player.Value.Character and (Current_Player.Value.Character:FindFirstChild("HumanoidRootPart") and Current_Player.Value.Character.HumanoidRootPart.StarRating.Enabled)) then
			ScrollingFrame.Fire.Visible = true
		end
		for i, v in ipairs(ScrollingFrame:GetChildren()) do
			if v:IsA("Frame") and (v.Name ~= "CancelGamepadHint" and v.Name ~= "QuitJob") then
				table.insert(t2, v.Button.MouseButton1Click:connect(function() --[[ Line: 115 | Upvalues: v (copy) ]]
					click(v.Name)
				end))
			end
		end
		v7 = ScrollingFrame.QuitJob.Button.MouseButton1Click:connect(function() --[[ Line: 118 ]]
			click("QuitJob")
		end)
		UpdateCounters()
	else
		for i, v in ipairs(t2) do
			v:disconnect()
		end
		t2 = {}
		if v7 then
			v7:disconnect()
		end
		v7 = nil
		v6 = false
	end
end)
CancelButton.MouseButton1Click:connect(function() --[[ Line: 141 | Upvalues: v5 (copy) ]]
	v5:SetVisible(false)
end)