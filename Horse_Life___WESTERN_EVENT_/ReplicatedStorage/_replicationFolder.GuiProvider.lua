-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("CollectionService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("Maid")
local v3 = Sonar("safeDestroy")
local GuiProviderScreens = Sonar("StorageUtils").GetConfig("GuiFramework")().GuiProviderScreens
local v4 = game:GetService("RunService"):IsStudio()
local t2 = {}
function t.new(p1) --[[ new | Line: 24 | Upvalues: t2 (copy), t (copy), v2 (copy) ]]
	if not p1.Name then
		warn("\226\154\160\239\184\143 GuiProvider, No name provided for gui:", p1)
		return
	end
	if t2[p1.Name] then
		warn("\226\154\160\239\184\143 GuiProvider, Gui already exists:", p1.Name)
		return
	end
	local v22 = setmetatable({}, t)
	v22.Config = p1
	v22.GuiName = p1.Name
	t2[v22.GuiName] = v22
	v22.Screens = p1.Screens
	v22.Preset = p1.Preset
	v22.Maid = v2.new()
	v22.Instances = {}
	v22.GuiScreens = {}
	for v3, v4 in v22.Screens do
		if v4.Tag then
			v22:_setupScreen(v3, v4)
			continue
		end
		warn("\226\154\160\239\184\143 GuiProvider, No tag provided for screen:", v4)
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 61 | Upvalues: v3 (copy) ]]
	v3(p1)
end
function t.GetScreen(p1, p2) --[[ GetScreen | Line: 65 ]]
	return p1.GuiScreens[p2]
end
function t._initGui(p1, p2) --[[ _initGui | Line: 69 | Upvalues: Sonar (copy), v4 (copy) ]]
	if p1.Initialising then
		return
	end
	p1.Initialising = true
	local v1 = p1.Gui or p1.Preset and Sonar(p1.Preset)
	if not v1 then
		p1.Initialised = true
		return
	end
	if not v1.new then
		error("\226\154\160\239\184\143 GuiProvider, Gui does not have a constructor function:", p1.Preset)
	end
	if not v1._getSelf then
		function v1._getSelf(p12) --[[ _getSelf | Line: 86 | Upvalues: v1 (copy), p1 (copy) ]]
			if p12 ~= v1 then
				return p12
			end
			if v1.self then
				return v1.self
			else
				warn(string.format("\226\154\160\239\184\143 %s, System not yet created", p1.GuiName))
				return nil
			end
		end
	end
	p1.StartTime = tick()
	local v2 = false
	task.spawn(function() --[[ Line: 100 | Upvalues: v2 (ref), p1 (copy) ]]
		task.wait(5)
		if v2 then
			return
		end
		warn("\226\154\160\239\184\143 GuiProvider, Infinite yield on gui system being created:", p1.GuiName)
	end)
	local v3, v42 = pcall(function() --[[ Line: 107 | Upvalues: v1 (copy), p1 (copy) ]]
		return v1.new(p1)
	end)
	v2 = true
	if not v3 then
		warn("\226\154\160\239\184\143 GuiProvider, Error creating gui:", p1.GuiName, v42, debug.traceback())
		return
	end
	p1.Gui = v42
	if not v1.self then
		v1.self = p1.Gui
	end
	if p1.Gui.Destroy then
		p1.Maid:GiveTask(p1.Gui)
	end
	p1.Initialised = true
	print("\226\156\133 GuiProvider, Initialized gui for:", p1.GuiName)
end
function t._setupScreen(p1, p2, p3) --[[ _setupScreen | Line: 133 | Upvalues: v1 (copy) ]]
	p3.Name = p2
	function p3.InstanceAdded(p12, p22) --[[ Line: 137 | Upvalues: p1 (copy), p2 (copy) ]]
		for v1, v2 in p1.GuiScreens do
			v2:_replicateScreen()
		end
		if not p1.Maid._initThread then
			p1.Maid._initThread = task.spawn(function() --[[ Line: 145 | Upvalues: p1 (ref), p2 (ref) ]]
				p1:_yieldForTaggedScreens()
				p1:_initGui(p2)
			end)
		end
		p1:_yieldForGuiScreenInit(p2)
		p1.Instances[p2] = p22
	end
	local Init = p3.Init
	function p3.Init(p12) --[[ Line: 160 | Upvalues: p1 (copy), Init (copy) ]]
		p1:_yieldForGuiInit()
		if not Init then
			return
		end
		Init(p12)
	end
	if not (p3.Instance or p3.Tag) then
		warn("\226\154\160\239\184\143 GuiProvider, No tag provided for screen:", p3)
		return
	end
	p1.GuiScreens[p2] = v1.AddComponent("GuiScreen", p3)
end
function t._hasAllInstances(p1) --[[ _hasAllInstances | Line: 181 ]]
	for v1, v2 in p1.Screens do
		if not p1.Instances[v1] then
			return false
		end
	end
	return true
end
function t._yieldForGuiScreenInit(p1, p2) --[[ _yieldForGuiScreenInit | Line: 190 ]]
	while not p1.GuiScreens[p2] do
		task.wait()
	end
end
function t._yieldForGuiInit(p1) --[[ _yieldForGuiInit | Line: 196 ]]
	while not (p1.Gui or p1.Initialised) do
		task.wait()
	end
end
function t._yieldForTaggedScreens(p1) --[[ _yieldForTaggedScreens | Line: 202 ]]
	while not p1:_hasAllInstances() do
		task.wait()
	end
end
function t.GetGui(p1) --[[ GetGui | Line: 209 | Upvalues: t2 (copy) ]]
	return t2[p1]
end
function t.BindScreen(p1, p2) --[[ BindScreen | Line: 213 | Upvalues: t2 (copy), v1 (copy) ]]
	if t2[p1] then
		warn("\226\154\160\239\184\143 GuiProvider, Gui already exists:", p1)
		return
	end
	p2.Name = p1
	if p2.CanInit ~= nil then
		if not p2.CanInit then
			return
		end
		if type(p2.CanInit) == "function" then
			if not p2.CanInit() then
				return
			end
		elseif not p2.CanInit then
			return
		end
	end
	return v1.AddComponent("GuiProvider", p2)
end
function t.WaitForScreen(p1) --[[ WaitForScreen | Line: 240 | Upvalues: t2 (copy) ]]
	local v1 = nil
	while not v1 do
		for v2, v3 in t2 do
			local v4 = v3:GetScreen(p1)
			v1 = v4
			if v4 then
				break
			end
		end
		task.wait()
	end
	return v1
end
function t.Init(p1) --[[ Init | Line: 254 | Upvalues: GuiProviderScreens (copy), t (copy) ]]
	for v1, v2 in GuiProviderScreens do
		t.BindScreen(v1, v2)
	end
end
return t