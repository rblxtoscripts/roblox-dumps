-- https://lua.expert/
local t = {}
t.__index = t
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local v3 = nil
local v4 = Sonar("ItemDataService")
local v5 = Sonar("PlayerWrapper")
local v6 = RunService:IsServer()
local v7 = v5.GetClient()
local v8 = nil
local t2 = {}
local t3 = {}
function t.new(p1) --[[ new | Line: 33 | Upvalues: t (ref), v2 (copy), RunService (copy), Players (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Object = p1
	v22.Maid = v2.new()
	if RunService:IsServer() then
		v22:_initServer()
		return v22
	end
	if p1:IsDescendantOf(Players.LocalPlayer) == false and not p1:IsDescendantOf(Players.LocalPlayer.Character) then
		return {
			Destroy = function() --[[ Destroy | Line: 44 ]] end
		}
	else
		v22:_initClient()
		return v22
	end
end
function t._initServer(p1) --[[ _initServer | Line: 53 | Upvalues: v4 (copy), Players (copy) ]]
	p1.ToolData = v4.GetByName(p1.Object.Name)
	p1.ToolType = p1.ToolData.ToolType
	local function check() --[[ check | Line: 66 | Upvalues: p1 (copy), Players (ref) ]]
		if not p1.ServerEquip then
			return
		end
		local v1 = p1.Object.Parent
		if v1 and v1:IsA("Model") then
			p1:ServerEquip()
			p1.Player = Players:GetPlayerFromCharacter(v1)
			return
		end
		if not (v1 and v1:IsA("Backpack")) then
			return
		end
		p1.Player = v1.Parent
		if not p1.ServerUnequip then
			return
		end
		p1:ServerUnequip()
	end
	p1.Maid:GiveTask(p1.Object.AncestryChanged:Connect(function() --[[ Line: 80 | Upvalues: check (copy) ]]
		check()
	end))
	check()
end
function t.ServerEquip(p1) --[[ ServerEquip | Line: 88 | Upvalues: v2 (copy), v5 (copy) ]]
	local v1 = v2.new()
	p1.Maid.serverEquipMaid = v1
	local v22 = p1.Object.Parent
	local RightHand = v22.RightHand
	local BodyAttach = Instance.new("Part")
	BodyAttach.Name = "BodyAttach"
	BodyAttach.Size = Vector3.new(1, 1, 1)
	BodyAttach.CanCollide = false
	BodyAttach.CanQuery = false
	BodyAttach.CanTouch = false
	BodyAttach.Massless = true
	BodyAttach.Transparency = 1
	v1:GiveTask(BodyAttach)
	local Motor6D = Instance.new("Motor6D")
	Motor6D.Part0 = RightHand
	Motor6D.Part1 = BodyAttach
	Motor6D.Parent = v22
	v1:GiveTask(Motor6D)
	BodyAttach.Parent = v22
	local v3 = nil
	for k, v in pairs(RightHand:GetChildren()) do
		if v.Name == "RightGrip" and v:IsA("Weld") then
			v.Part0 = BodyAttach
			v3 = true
			break
		end
	end
	if not v3 then
		local v4 = nil
		v4 = v1:GiveTask(RightHand.ChildAdded:Connect(function(p1) --[[ Line: 122 | Upvalues: BodyAttach (copy), v1 (copy), v4 (ref) ]]
			if p1.Name ~= "RightGrip" or not p1:IsA("Weld") then
				return
			end
			p1.Part0 = BodyAttach
			v1[v4] = nil
		end))
	end
	if p1.ToolClass and p1.ToolClass.Equip then
		p1.ToolClass:Equip()
	end
	v5.getWrapperFromPlayer(p1.Player).EquippedTool = p1
end
function t.ServerUnequip(p1) --[[ ServerUnequip | Line: 138 | Upvalues: v5 (copy) ]]
	local v1 = v5.getWrapperFromPlayer(p1.Player)
	if v1 and v1.EquippedTool == p1 then
		v1.EquippedTool = nil
	end
	if p1.ToolClass and p1.ToolClass.Unequip then
		p1.ToolClass:Unequip()
	end
	p1.Maid.serverEquipMaid = nil
end
function t._initClient(p1) --[[ _initClient | Line: 155 | Upvalues: v4 (copy), Sonar (copy), t3 (copy) ]]
	p1.ToolData = v4.GetByName(p1.Object.Name)
	p1.ToolType = p1.ToolData.ToolType
	local ToolType = p1.ToolType
	local v1 = select(-1, pcall(Sonar, ToolType))
	if typeof(v1) ~= "table" then
		local v2 = script:FindFirstChild(ToolType)
		v1 = if v2 then Sonar(v2) else nil
	end
	if typeof(v1) == "table" then
		p1.ToolClass = p1.Maid:GiveTask(v1.new(p1, t3))
	end
	p1.Maid:GiveTask(p1.Object.AncestryChanged:Connect(function() --[[ Line: 179 | Upvalues: p1 (copy) ]]
		local v1 = p1.Object.Parent
		if v1 and v1:IsA("Model") then
			if p1.Equip then
				p1:Equip()
			end
		else
			if not (v1 and (v1:IsA("Backpack") and p1.Unequip)) then
				return
			end
			p1:Unequip()
		end
	end))
end
function t.Equip(p1) --[[ Equip | Line: 194 | Upvalues: t2 (copy), v7 (copy) ]]
	p1.Equipped = true
	t2[p1] = true
	if p1.ToolClass and p1.ToolClass.Equip then
		p1.ToolClass:Equip()
	end
	v7.EquippedTool = p1
	v7.EquippedToolChangedSignal:Fire()
end
function t.Unequip(p1) --[[ Unequip | Line: 204 | Upvalues: t2 (copy), v7 (copy) ]]
	p1.Equipped = false
	t2[p1] = nil
	if p1.ToolClass and p1.ToolClass.Unequip then
		p1.ToolClass:Unequip()
	end
	if v7.EquippedTool ~= p1 then
		return
	end
	v7.EquippedTool = nil
	v7.EquippedToolChangedSignal:Fire()
end
function t.Destroy(p1) --[[ Destroy | Line: 216 | Upvalues: v7 (copy) ]]
	if p1.Equipped and p1.Unequip then
		p1:Unequip()
	end
	if v7 and v7.EquippedTool == p1 then
		v7.EquippedTool = nil
		v7.EquippedToolChangedSignal:Fire()
	end
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.AddInterfaceHandler(p1, p2, p3, p4) --[[ AddInterfaceHandler | Line: 233 | Upvalues: t3 (copy) ]]
	t3[p2] = t3[p2] or {}
	t3[p2][p3] = t3[p2][p3] or {}
	if not table.find(t3[p2][p3], p4) then
		table.insert(t3[p2][p3], p4)
	end
end
function t.Init(p1) --[[ Init | Line: 244 | Upvalues: v6 (copy), v8 (ref), v1 (copy), t (ref), Players (copy), t2 (copy), v3 (ref), Sonar (copy), UserInputService (copy) ]]
	v8 = if v6 then v1.new("Tool", t) else v1.new("Tool-" .. Players.LocalPlayer.UserId, t)
	v8:Init()
	local v12 = nil
	local function processTools(p1) --[[ processTools | Line: 254 | Upvalues: v12 (ref), t2 (ref) ]]
		local v1 = v12
		for v2, v3 in t2 do
			if v2.ToolClass and v2.ToolClass.OnInput then
				v2.ToolClass:OnInput(p1)
				if v2.ToolClass.RepeatActions then
					task.spawn(function() --[[ Line: 261 | Upvalues: v2 (copy), p1 (copy), v1 (copy), v12 (ref) ]]
						repeat
							task.wait()
							if not (v2.Equipped and (v2.ToolClass and v2.ToolClass.OnInput)) then
								break
							end
							v2.ToolClass:OnInput(p1)
						until v1 ~= v12 or not v2.Equipped
					end)
				end
			end
		end
	end
	local function processToolsDeactivated(p1) --[[ processToolsDeactivated | Line: 274 | Upvalues: t2 (ref) ]]
		for v1 in t2 do
			if v1.ToolClass and v1.ToolClass._triggerInterfaceHandler then
				v1.ToolClass:_triggerInterfaceHandler("Deactivated")
			end
		end
	end
	if not game:GetService("RunService"):IsClient() then
		return
	end
	v3 = Sonar("CharacterControls")
	v3:AddControls("ToolLMB", { Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonX, Enum.UserInputType.Touch }, {
		InputBegan = function(p1, p2, p3) --[[ InputBegan | Line: 294 | Upvalues: v12 (ref), processTools (copy) ]]
			v12 = tick()
			processTools(p2)
		end,
		InputEnded = function(p1) --[[ InputEnded | Line: 298 | Upvalues: processToolsDeactivated (copy), v12 (ref) ]]
			processToolsDeactivated()
			v12 = nil
		end
	}, function() --[[ Line: 302 | Upvalues: t2 (ref) ]]
		return next(t2)
	end)
	UserInputService.InputEnded:Connect(function(p1) --[[ Line: 306 | Upvalues: v12 (ref) ]]
		if p1.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end
		v12 = nil
	end)
	UserInputService.TouchEnded:Connect(function() --[[ Line: 312 | Upvalues: v12 (ref) ]]
		v12 = nil
	end)
end
t:Init()
t.ClassBinder = v8
return t