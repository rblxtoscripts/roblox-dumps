-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
function t.GetRootNode(p1) --[[ GetRootNode | Line: 10 ]]
	for v1, v2 in p1:GetChildren() do
		if v2:GetAttribute("Type") == "DialogueRoot" then
			return v2
		end
	end
	return nil
end
function t.GetNodeFromValue(p1) --[[ GetNodeFromValue | Line: 21 ]]
	return p1:FindFirstAncestorWhichIsA("Configuration")
end
function t.GetAllInputNodes(p1, p2) --[[ GetAllInputNodes | Line: 26 | Upvalues: t (copy) ]]
	local t2 = {}
	for v1, v2 in t.GetAllInputValues(p1) do
		local v3 = t.GetNodeFromValue(v2.Value)
		if not table.find(t2, v3) then
			table.insert(t2, v3)
		end
	end
	if p2 then
		table.sort(t2, function(p1, p2) --[[ Line: 38 | Upvalues: t (ref) ]]
			return t.GetNodePriority(p1) < t.GetNodePriority(p2)
		end)
	end
	return t2
end
function t.GetAllOutputNodes(p1) --[[ GetAllOutputNodes | Line: 47 | Upvalues: t (copy) ]]
	local t2 = {}
	for v1, v2 in t.GetAllOutputValues(p1) do
		local v3 = t.GetNodeFromValue(v2.Value)
		if not table.find(t2, v3) then
			table.insert(t2, v3)
		end
	end
	return t2
end
function t.GetAllInputValues(p1) --[[ GetAllInputValues | Line: 62 ]]
	local t = {}
	for v1, v2 in p1:GetDescendants() do
		if v2.Parent.Name == "Inputs" and v2.Value ~= nil then
			table.insert(t, v2)
		end
	end
	return t
end
function t.GetAllOutputValues(p1) --[[ GetAllOutputValues | Line: 75 ]]
	local t = {}
	for v1, v2 in p1:GetDescendants() do
		if v2.Parent.Name == "Outputs" and v2.Value ~= nil then
			table.insert(t, v2)
		end
	end
	return t
end
function t.GetProperty(p1, p2) --[[ GetProperty | Line: 90 ]]
	local v1 = p1:FindFirstChild(p2)
	if v1 then
		return v1.Value
	else
		return nil
	end
end
function t.HasInputValues(p1) --[[ HasInputValues | Line: 99 | Upvalues: t (copy) ]]
	return #t.GetAllInputValues(p1) > 0
end
function t.GetHighestPriorityNode(p1) --[[ GetHighestPriorityNode | Line: 104 ]]
	local v1 = 0
	local v2 = nil
	for v3, v4 in p1 do
		if v1 < v4:GetAttribute("Priority") then
			v1, v2 = v4:GetAttribute("Priority"), v4
		end
	end
	return v2
end
function t.FindNodeWithPriority(p1, p2) --[[ FindNodeWithPriority | Line: 119 ]]
	for v1, v2 in p1 do
		if v2:GetAttribute("Priority") == p2 then
			return v2
		end
	end
	return nil
end
function t.GetLowestPriorityNode(p1) --[[ GetLowestPriorityNode | Line: 130 ]]
	local v1 = (1 / 0)
	local v2 = nil
	for v3, v4 in p1 do
		if v4:GetAttribute("Priority") < v1 then
			v1, v2 = v4:GetAttribute("Priority"), v4
		end
	end
	return v2
end
function t.GetNodePriority(p1) --[[ GetNodePriority | Line: 145 ]]
	return p1:GetAttribute("Priority") or 0
end
function t.GetNodeWeight(p1) --[[ GetNodeWeight | Line: 150 ]]
	local Weight = p1:FindFirstChild("Weight")
	local Chance = p1:FindFirstChild("Chance")
	local P = p1:FindFirstChild("P")
	local Probability = p1:FindFirstChild("Probability")
	return Weight and Weight.Value or (Chance and Chance.Value or (P and P.Value or (if Probability then Probability.Value or 1 else 1)))
end
function t.FindNodeType(p1, p2) --[[ FindNodeType | Line: 160 ]]
	for v1, v2 in p1 do
		if v2:GetAttribute("Type") == p2 then
			return v2
		end
	end
	return nil
end
function t.GetNodeTypes(p1) --[[ GetNodeTypes | Line: 171 ]]
	return p1:GetAttribute("Type")
end
function t.FindNodeByName(p1, p2) --[[ FindNodeByName | Line: 176 ]]
	for v1, v2 in p1 do
		if v2.Name == p2 then
			return v2
		end
	end
	return nil
end
function t.FireEvents(p1) --[[ FireEvents | Line: 187 ]]
	for v1, v2 in p1:GetChildren() do
		if v2:IsA("RemoteEvent") then
			v2:FireServer(p1)
			continue
		end
		if v2:IsA("BindableEvent") then
			v2:Fire(p1)
		end
	end
end
function t.RunCommands(p1, ...) --[[ RunCommands | Line: 198 | Upvalues: t (copy), Sonar (copy) ]]
	for v1, v2 in t.GetAllInputNodes(p1, true) do
		if v2:GetAttribute("Type") == "Command" and (v2:FindFirstChildWhichIsA("ModuleScript") and not t.HasInputValues(v2)) then
			local v3 = Sonar(v2:FindFirstChildWhichIsA("ModuleScript"))
			if v3.Run then
				v3.Run(...)
			end
		end
	end
end
function t.CheckForCondition(p1, ...) --[[ CheckForCondition | Line: 220 | Upvalues: t (copy), Sonar (copy) ]]
	for v1, v2 in t.GetAllInputNodes(p1) do
		if v2:GetAttribute("Type") == "Condition" and v2:FindFirstChildWhichIsA("ModuleScript") then
			local v3 = Sonar(v2:FindFirstChildWhichIsA("ModuleScript"))
			if v3.Run then
				local v4, v5 = v3.Run(...)
				if v4 ~= p1:GetAttribute("Priority") then
					return true, v5
				end
			end
		end
	end
	return false
end
function t.ToggleLock(p1) --[[ ToggleLock | Line: 243 | Upvalues: t (copy) ]]
	for v1, v2 in t.GetAllInputValues(p1) do
		if v2.Value.Name == "Toggle" then
			v2.Value.Value = not v2.Value.Value
		end
	end
end
function t.IsLocked(p1) --[[ IsLocked | Line: 252 | Upvalues: t (copy) ]]
	local v2 = t.FindNodeType(t.GetAllInputNodes(p1), "Lock")
	if not v2 or v2.Toggle.Value ~= true then
		return false
	end
	for v3, v4 in t.GetAllInputValues(p1) do
		if v4.Value.Name == "MainPathway" and v4.Value.Parent == v2 then
			return true
		end
	end
	return false
end
function t.RunInternalCommands(p1, ...) --[[ RunInternalCommands | Line: 268 | Upvalues: Sonar (copy) ]]
	if not p1:FindFirstChildWhichIsA("ModuleScript") then
		return
	end
	local v1 = Sonar(p1:FindFirstChildWhichIsA("ModuleScript"))
	if v1.Run then
		v1.Run(...)
		return
	end
	error("Module found inside a node does not have a .Run function!")
end
function t.NodeReached(p1, ...) --[[ NodeReached | Line: 279 | Upvalues: t (copy) ]]
	t.RunCommands(p1, ...)
	t.ToggleLock(p1)
	t.FireEvents(p1)
	t.RunInternalCommands(p1, ...)
end
function t.CleanupTree(p1) --[[ CleanupTree | Line: 287 ]]
	for v1, v2 in p1:GetChildren() do
		if v2:GetAttribute("Type") == "Condition" then
			v2:SetAttribute("ReturnedValue", nil)
		end
	end
end
function t.Start(p1) --[[ Start | Line: 296 | Upvalues: t (copy) ]]
	t.CleanupTree(p1)
end
return t