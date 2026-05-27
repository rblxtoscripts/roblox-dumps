-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local CreateGui = require(script.Parent.CreateGui)
return function(p1) --[[ Line: 6 | Upvalues: ReplicatedStorage (copy), StarterGui (copy), CreateGui (copy) ]]
	local v1 = nil
	local function Create(p1, p2, p3) --[[ Create | Line: 9 | Upvalues: v1 (ref) ]]
		local v12 = Instance.new(p1)
		v12.Name = p2
		v12.Parent = if p3 then p3 else v1
		return v12
	end
	v1 = script.Parent.CmdrClient
	if ReplicatedStorage:FindFirstChild("Resources") and ReplicatedStorage.Resources:FindFirstChild("Libraries") then
		v1.Parent = ReplicatedStorage.Resources.Libraries
	else
		v1.Parent = ReplicatedStorage
	end
	local CmdrFunction = Instance.new("RemoteFunction")
	CmdrFunction.Name = "CmdrFunction"
	CmdrFunction.Parent = v1
	local CmdrEvent = Instance.new("RemoteEvent")
	CmdrEvent.Name = "CmdrEvent"
	CmdrEvent.Parent = v1
	local Commands = Instance.new("Folder")
	Commands.Name = "Commands"
	Commands.Parent = v1
	local Types = Instance.new("Folder")
	Types.Name = "Types"
	Types.Parent = v1
	script.Parent.Shared.Parent = v1
	p1.ReplicatedRoot = v1
	p1.RemoteFunction = CmdrFunction
	p1.RemoteEvent = CmdrEvent
	p1:RegisterTypesIn(script.Parent.BuiltInTypes)
	p1:RegisterTypesIn(script.Parent.GameTypes)
	script.Parent.GameTypes:Destroy()
	script.Parent.BuiltInTypes:Destroy()
	script.Parent.BuiltInCommands.Name = "Server commands"
	if StarterGui:FindFirstChild("Cmdr") == nil then
		CreateGui()
	end
end