-- https://lua.expert/
local LocalPlayer = game.Players.LocalPlayer
local v1 = script.Parent
local MainFrame = script.Parent:WaitForChild("MainFrame")
local PromptFrame = v1:FindFirstChild("PromptFrame", true)
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local DialogueRemote = game:GetService("ReplicatedStorage"):FindFirstChild("DialogueRemote", true)
local DialogueBindable = game:GetService("ReplicatedStorage"):FindFirstChild("DialogueBindable", true)
local v2 = nil
local v3 = nil
local v4 = false
local v5 = false
local Scale = PromptFrame.UIPadding.PaddingBottom.Scale
local Scale_2 = PromptFrame.UIPadding.PaddingTop.Scale
local v6 = GuiManager:RegisterWindow(MainFrame, "Bottom", "Bottom")
function GetRootNode(p1) --[[ GetRootNode | Line: 33 ]]
	for k, v in pairs(p1:GetChildren()) do
		if v:GetAttribute("Type") == "DialogueRoot" then
			return v
		end
	end
end
function GetNodeFromValue(p1) --[[ GetNodeFromValue | Line: 41 ]]
	return p1:FindFirstAncestorWhichIsA("Configuration")
end
function GetOutputNodes(p1) --[[ GetOutputNodes | Line: 45 ]]
	local t = {}
	for k, v in pairs(p1:GetDescendants()) do
		if v.Parent.Name == "Outputs" and v.Value ~= nil then
			local v1 = GetNodeFromValue(v.Value)
			if not table.find(t, v1) then
				table.insert(t, v1)
			end
		end
	end
	return t
end
function GetInputNodes(p1) --[[ GetInputNodes | Line: 60 ]]
	local t = {}
	for k, v in pairs(p1:GetDescendants()) do
		if v.Parent.Name == "Inputs" and v.Value ~= nil then
			local v1 = GetNodeFromValue(v.Value)
			if not table.find(t, v1) then
				table.insert(t, v1)
			end
		end
	end
	return t
end
function GetInputs(p1) --[[ GetInputs | Line: 75 ]]
	local t = {}
	for k, v in pairs(p1:GetDescendants()) do
		if v.Parent.Name == "Inputs" and v.Value ~= nil then
			table.insert(t, v)
		end
	end
	return t
end
function GetHighestPriorityNode(p1) --[[ GetHighestPriorityNode | Line: 87 ]]
	local v1 = 0
	local v2 = nil
	for k, v in pairs(p1) do
		if v1 < v:GetAttribute("Priority") then
			v1, v2 = v:GetAttribute("Priority"), v
		end
	end
	return v2
end
function FindNodeWithPriority(p1, p2) --[[ FindNodeWithPriority | Line: 101 ]]
	for k, v in pairs(p1) do
		if v:GetAttribute("Priority") == p2 then
			return v
		end
	end
end
function GetLowestPriorityNode(p1) --[[ GetLowestPriorityNode | Line: 109 ]]
	local v1 = (1 / 0)
	local v2 = nil
	for k, v in pairs(p1) do
		if v:GetAttribute("Priority") < v1 then
			v1, v2 = v:GetAttribute("Priority"), v
		end
	end
	return v2
end
function ClearResponses() --[[ ClearResponses | Line: 123 | Upvalues: v1 (copy) ]]
	for k, v in pairs(v1:FindFirstChild("ResponseFrame", true):GetChildren()) do
		if v:IsA("TextButton") and v.Visible then
			v:Destroy()
		end
	end
end
function FindNodeType(p1, p2) --[[ FindNodeType | Line: 131 ]]
	for k, v in pairs(p1) do
		if v:GetAttribute("Type") == p2 then
			return v
		end
	end
end
function FindInput(p1, p2) --[[ FindInput | Line: 139 ]]
	for k, v in pairs(p1) do
		if v.Value.Name == p2 then
			return v.Value
		end
	end
end
function FireEvents(p1) --[[ FireEvents | Line: 147 ]]
	for k, v in pairs(p1:GetChildren()) do
		if v:IsA("RemoteEvent") then
			v:FireServer(p1)
			continue
		end
		if v:IsA("BindableEvent") then
			v:Fire(p1)
		end
	end
end
function RunCommands(p1) --[[ RunCommands | Line: 157 ]]
	for k, v in pairs(GetInputNodes(p1)) do
		if v:GetAttribute("Type") ~= "Condition" and (v:FindFirstChildWhichIsA("ModuleScript") and #GetInputs(v) <= 0) then
			local v1 = require(v:FindFirstChildWhichIsA("ModuleScript"))
			if v1.Run then
				v1.Run()
			end
		end
	end
end
function CheckForCondition(p1) --[[ CheckForCondition | Line: 170 ]]
	for k, v in pairs(GetInputNodes(p1)) do
		if v:GetAttribute("Type") == "Condition" and (v:FindFirstChildWhichIsA("ModuleScript") and #GetInputs(v) <= 0) then
			local v1 = require(v:FindFirstChildWhichIsA("ModuleScript"))
			if v1.Run and v1.Run() ~= p1:GetAttribute("Priority") then
				return true
			end
		end
	end
end
function ToggleLock(p1) --[[ ToggleLock | Line: 185 ]]
	for k, v in pairs(GetInputs(p1)) do
		if v.Value.Name == "Toggle" then
			v.Value.Value = not v.Value.Value
		end
	end
end
function IsLocked(p1) --[[ IsLocked | Line: 193 ]]
	local v1 = FindNodeType(GetInputNodes(p1), "Lock")
	if not v1 or v1.Toggle.Value ~= true then
		return false
	end
	local v2 = false
	for k, v in pairs(GetInputs(p1)) do
		if v.Value.Name == "MainPathway" and v.Value.Parent == v1 then
			v2 = true
		end
	end
	return v2
end
function RunInternalCommands(p1) --[[ RunInternalCommands | Line: 211 ]]
	if not p1:FindFirstChildWhichIsA("ModuleScript") then
		return
	end
	local v1 = require(p1:FindFirstChildWhichIsA("ModuleScript"))
	if v1.Run then
		v1.Run()
		return
	end
	error("Module found inside a node does not have a .Run function!")
end
function CommonNodeFunctions(p1) --[[ CommonNodeFunctions | Line: 222 ]]
	RunCommands(p1)
	ToggleLock(p1)
	FireEvents(p1)
	RunInternalCommands(p1)
end
function convert_string_to_number(p1) --[[ convert_string_to_number | Line: 229 ]]
	local sum = 0
	for i = 1, #p1 do
		sum = sum + string.byte((p1:sub(i, i)))
	end
	return sum
end
function LoadNode(p1) --[[ LoadNode | Line: 238 | Upvalues: MainFrame (copy), v1 (copy), v3 (ref), PromptFrame (copy), v4 (ref), v5 (ref) ]]
	local v12 = p1:GetAttribute("Type")
	if IsLocked(p1) or not MainFrame.Visible then
		return
	end
	if CheckForCondition(p1) then
		return
	end
	if v12 == "Response" then
		local Response = v1:FindFirstChild("SampleResponse", true):Clone()
		Response.Parent = v1:FindFirstChild("ResponseFrame", true)
		Response.Visible = true
		Response.TextLabel.Text = p1.Text.Value
		Response.Name = "Response"
		Response.LayoutOrder = p1:GetAttribute("Priority")
		if _G.GamepadEnabled then
			game:GetService("GuiService").SelectedObject = Response
		end
		Response.Activated:Connect(function() --[[ Line: 263 | Upvalues: p1 (copy) ]]
			CommonNodeFunctions(p1)
			LoadNodes(GetOutputNodes(p1))
		end)
	else
		if v12 == "Prompt" then
			CommonNodeFunctions(p1)
			v1:FindFirstChild("Speaker", true).Text = v3.Speaker or "?"
			PromptFrame.Text = p1.Text.Value
			PromptFrame.MaxVisibleGraphemes = 0
			v4 = false
			v5 = p1.Skippable.Value
			spawn(function() --[[ Line: 282 | Upvalues: PromptFrame (ref), MainFrame (ref), v4 (ref), v5 (ref), p1 (copy) ]]
				local v1 = true
				PromptFrame.MaxVisibleGraphemes = 0
				spawn(function() --[[ Line: 287 | Upvalues: PromptFrame (ref), v1 (ref) ]]
					local v12 = Random.new(convert_string_to_number(PromptFrame.Text))
					while v1 do
						local v2 = script.Parent:FindFirstChild("Speak" .. v12:NextInteger(1, 6))
						v2:Play()
						v2.Ended:Wait()
					end
				end)
				for i = 1, #PromptFrame.Text do
					if (not MainFrame.Visible or v4) and v5 then
						break
					end
					local v2 = PromptFrame
					v2.MaxVisibleGraphemes = v2.MaxVisibleGraphemes + 1
					task.wait(0.02)
				end
				v1 = false
				PromptFrame.MaxVisibleGraphemes = -1
				if v4 and v5 then
					v4 = false
					LoadNodes(GetOutputNodes(p1))
					return
				end
				task.wait(1)
				v4 = false
				LoadNodes(GetOutputNodes(p1))
			end)
			return
		end
		if not p1:FindFirstChildWhichIsA("ModuleScript") then
			return
		end
		CommonNodeFunctions(p1)
		FireEvents(p1)
		LoadNodes(GetOutputNodes(p1))
	end
end
function Close() --[[ Close | Line: 330 | Upvalues: v6 (copy), v3 (ref), v2 (ref) ]]
	v6:SetVisible(false)
	v3 = nil
	if not v2 then
		return
	end
	v2.Enabled = true
	v2 = nil
end
function LoadNodes(p1) --[[ LoadNodes | Line: 339 ]]
	if #p1 <= 0 then
		Close()
		return
	end
	ClearResponses()
	for k, v in pairs(p1) do
		LoadNode(v)
	end
end
function OnEvent(p1, p2, p3) --[[ OnEvent | Line: 350 | Upvalues: MainFrame (copy), v6 (copy), PromptFrame (copy), Scale (copy), v3 (ref), v2 (ref) ]]
	if MainFrame.Visible then
		return
	end
	local v1 = GetRootNode(p1)
	v6:SetVisible(true)
	PromptFrame.TextSize = (PromptFrame.AbsoluteSize.Y - PromptFrame.AbsoluteSize.Y * (Scale + Scale)) / 4
	v3 = if p2 then p2 else {}
	v2 = p3
	for k, v in pairs(p1:GetChildren()) do
		if v:GetAttribute("Type") == "Condition" then
			v:SetAttribute("ReturnedValue", nil)
		end
	end
	if p3 then
		p3.Enabled = false
	end
	LoadNodes(GetOutputNodes(v1))
end
DialogueRemote.OnClientEvent:Connect(OnEvent)
DialogueBindable.Event:Connect(OnEvent)
PromptFrame.Activated:Connect(function() --[[ Line: 380 | Upvalues: v4 (ref) ]]
	v4 = true
end)
while wait(1) do
	if v3 and (v3.Range and (v3.Position and LocalPlayer:DistanceFromCharacter(v3.Position) > v3.Range)) then
		Close()
	end
end
local DialogueSystem = workspace:FindFirstChild("DialogueSystem", true)
if not game.ServerStorage:FindFirstChild("NodePresets", true) then
	DialogueSystem.DialogueEvents.Parent = game.ReplicatedStorage
	DialogueSystem.NodePresets.Parent = game.ServerStorage
	DialogueSystem.DialogueUI.Parent = game.StarterGui
	DialogueSystem.TestDialogue.Parent = workspace
	DialogueSystem:Destroy()
	return
end
game.ServerStorage:FindFirstChild("NodePresets", true):Destroy()
DialogueSystem.DialogueEvents.Parent = game.ReplicatedStorage
DialogueSystem.NodePresets.Parent = game.ServerStorage
DialogueSystem.DialogueUI.Parent = game.StarterGui
DialogueSystem.TestDialogue.Parent = workspace
DialogueSystem:Destroy()