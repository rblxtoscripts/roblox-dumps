-- https://lua.expert/
local t = {}
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProximityPromptService = game:GetService("ProximityPromptService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("Constants")
local t2 = {}
local v3 = true
local function variableGuiRemoved(p1) --[[ variableGuiRemoved | Line: 20 | Upvalues: t2 (copy) ]]
	t2[p1] = nil
end
local function getGuiVisibility(p1) --[[ getGuiVisibility | Line: 25 | Upvalues: v3 (ref) ]]
	if not v3 then
		return
	end
	if p1 and not p1() then
	else
		return true
	end
end
local function setGuiVisibility(p1) --[[ setGuiVisibility | Line: 33 | Upvalues: t2 (copy), v3 (ref) ]]
	local v1 = t2[p1]
	p1.Enabled = if v3 then if v1 and not v1() then nil else true else nil
end
function t.AddWorldspaceGui(p1, p2) --[[ AddWorldspaceGui | Line: 38 | Upvalues: v1 (copy), t2 (copy), v3 (ref), CollectionService (copy), v2 (copy) ]]
	if p2 and p2.Check then
		local v12 = v1.new()
		p2.Changed = type(p2.Changed) == "table" and p2.Changed.ClassName ~= "Signal" and p2.Changed or { p2.Changed }
		for k, v in pairs(p2.Changed) do
			if v then
				v12:GiveTask(v:Connect(function() --[[ Line: 46 | Upvalues: p1 (copy), t2 (ref), v3 (ref) ]]
					local v1 = p1
					local v2 = t2[v1]
					v1.Enabled = if v3 then if v2 and not v2() then nil else true else nil
				end))
			end
		end
		t2[p1] = p2.Check
		CollectionService:AddTag(p1, v2.VariableWorldspaceGuiTag)
		return v12
	else
		CollectionService:AddTag(p1, v2.WorldspaceGuiTag)
	end
end
function t.SetWorldspaceGuiVisibility(p1) --[[ SetWorldspaceGuiVisibility | Line: 62 | Upvalues: v3 (ref), ProximityPromptService (copy), t2 (copy), CollectionService (copy), v2 (copy) ]]
	v3 = p1
	ProximityPromptService.Enabled = p1
	for k, v in pairs(t2) do
		local v1 = t2[k]
		k.Enabled = if p1 then if v1 and not v1() then nil else true else nil
	end
	for k, v in pairs(CollectionService:GetTagged(v2.WorldspaceGuiTag)) do
		local v32 = t2[v]
		v.Enabled = if p1 then if v32 and not v32() then nil else true else nil
	end
end
CollectionService:GetInstanceRemovedSignal(v2.VariableWorldspaceGuiTag):Connect(variableGuiRemoved)
CollectionService:GetInstanceAddedSignal(v2.VariableWorldspaceGuiTag):Connect(setGuiVisibility)
CollectionService:GetInstanceAddedSignal(v2.WorldspaceGuiTag):Connect(setGuiVisibility)
return t