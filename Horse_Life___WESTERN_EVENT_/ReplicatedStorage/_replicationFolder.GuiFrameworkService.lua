-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local CollectionService = game:GetService("CollectionService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("TableUtils")
local v2 = Sonar("Binder")
local v3 = Sonar("StorageUtils").GetConfig("GuiFramework")()
local t2 = { "ScrollLayoutScale", "StrokeScale", "KeyCodeLabel" }
local t3 = {
	"GuiScreenService",
	"GuiTransition",
	"GuiInsets",
	"GuiAnimations",
	"NotificationsService",
	"GuiProvider",
	"GuiAnimationSequences",
	"SprUtils",
	"FormatTime",
	"FormatString"
}
local t4 = { "ToolTip", "NotificationsClient" }
local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local function isExcluded(p1, p2) --[[ isExcluded | Line: 48 ]]
	for v1, v2 in p2 do
		if p1 == v2 or p1:IsDescendantOf(v2) then
			return true
		end
	end
	return false
end
local function v4(p1, p2, p3) --[[ findFirstChildWithNameOrTag | Line: 61 | Upvalues: v4 (copy) ]]
	local v1 = if p3 then p3 else {}
	if p1 then
		local t = {}
		if (p1.Name == p2 or p1:HasTag(p2)) and not v1.IgnoreParent then
			if not v1.GetAllDescendants then
				return p1
			end
			table.insert(t, p1)
		end
		local v2 = v1
		local v3 = p1:GetChildren()
		for v42, v5 in v3 do
			if v5.Name == p2 or v5:HasTag(p2) then
				if not v2.GetAllDescendants then
					return v5
				end
				table.insert(t, v5)
			end
		end
		for v6, v7 in v3 do
			local v8 = v4(v7, p2, {
				IgnoreParent = true,
				GetAllDescendants = v2.GetAllDescendants
			})
			if v2.GetAllDescendants then
				if v8 and #v8 > 0 then
					for v9, v10 in v8 do
						table.insert(t, v10)
					end
				end
				continue
			end
			if v8 then
				return v8
			end
		end
		return if v2.GetAllDescendants and t then t else nil
	else
		return if v1.GetAllDescendants then {} or nil else nil
	end
end
function t.FindElement(p1, p2, p3) --[[ FindElement | Line: 116 | Upvalues: CollectionService (copy), StarterGui (copy), v4 (copy) ]]
	local v1 = if p3 then p3 else {}
	if p1 then
		if type(p1) == "string" then
			local v2 = p2 or p1
			t = {}
			v3 = v1
			for v42, v5 in CollectionService:GetTagged(v2) do
				if not v5:IsDescendantOf(StarterGui) then
					table.insert(t, v5)
				end
			end
			if v3.GetAllDescendants then
				return t
			end
			if not (#t > 1) then
				return t[1]
			end
			warn("\226\154\160\239\184\143 GuiFrameworkService: Multiple instances found with tag:", v2)
			return t[1]
		else
			local v6 = v4(p1, p2, v1)
			if v6 then
				return v6
			end
			return if v1.GetAllDescendants then {} or nil else nil
		end
	else
		return if v1.GetAllDescendants then {} or nil else nil
	end
end
function t.AddComponent(p1, ...) --[[ AddComponent | Line: 156 | Upvalues: Sonar (copy) ]]
	local v1 = Sonar(p1)
	if not v1.new then
		warn("\226\154\160\239\184\143 GuiFrameworkService: Component does not have a constructor function:", p1)
		return nil
	end
	if not v1._initialisedMetaIndex then
		v1._initialisedMetaIndex = true
		function v1.__index(p1, p2) --[[ Line: 166 | Upvalues: v1 (copy) ]]
			local v12 = rawget(p1, p2)
			if v12 ~= nil then
				return v12
			end
			local v3 = rawget(v1, p2)
			if v3 ~= nil then
				return v3
			end
			local v5 = rawget(v1, "SubContexts")
			for v7, v8 in if v5 then v5 else {} do
				local v9 = rawget(p1, v8)
				if v9 and v9 ~= nil then
					local v10 = v9[p2]
					if v10 ~= nil and type(v10) == "function" then
						return function(p1, ...) --[[ Line: 183 | Upvalues: v10 (ref), v9 (ref) ]]
							return v10(v9, ...)
						end
					elseif v10 ~= nil then
						return v10
					end
				end
			end
			local v11 = rawget(p1, "AddOnComponents")
			for v13, v14 in if v11 then v11 else {} do
				local v15 = v14[p2]
				if v15 ~= nil and type(v15) == "function" then
					return function(p1, ...) --[[ Line: 197 | Upvalues: v15 (ref), v14 (copy) ]]
						return v15(v14, ...)
					end
				elseif v15 ~= nil then
					return v15
				end
			end
			return nil
		end
	end
	return v1.new(...)
end
function t.BindComponent(p1, p2, ...) --[[ BindComponent | Line: 217 | Upvalues: v1 (copy), t (copy), CollectionService (copy) ]]
	local v2 = p2 or {}
	if not v2.Tag then
		warn("\226\154\160\239\184\143 GuiFrameworkService, No tag provided for bind component:", p1, v2)
		return nil
	end
	local function addComponent(p12, ...) --[[ addComponent | Line: 224 | Upvalues: v2 (ref), v1 (ref), t (ref), p1 (copy) ]]
		v2 = v1.DeepCopy(v2)
		v2.Instance = p12
		t.AddComponent(p1, v2, ...)
	end
	CollectionService:GetInstanceAddedSignal(v2.Tag):Connect(addComponent)
	for v3, v4 in CollectionService:GetTagged(v2.Tag) do
		addComponent(v4, ...)
	end
	return addComponent
end
function t.BindComponentLite(p1, p2, ...) --[[ BindComponentLite | Line: 238 | Upvalues: v1 (copy), t (copy), CollectionService (copy) ]]
	local v2 = p2 or {}
	if not v2.Tag then
		warn("\226\154\160\239\184\143 GuiFrameworkService, No tag provided for bind component lite:", p1, v2)
		return nil
	end
	local t2 = { ... }
	local t3 = {}
	local function addComponent(p12) --[[ addComponent | Line: 248 | Upvalues: t3 (copy), v1 (ref), v2 (ref), t (ref), p1 (copy), t2 (copy) ]]
		if not t3[p12] then
			local v12 = v1.DeepCopy(v2)
			v12.Instance = p12
			t3[p12] = t.AddComponent(p1, v12, table.unpack(t2))
		end
	end
	local function removeComponent(p1) --[[ removeComponent | Line: 257 | Upvalues: t3 (copy) ]]
		local v1 = t3[p1]
		if not v1 then
			return
		end
		t3[p1] = nil
		if not v1.Destroy then
			return
		end
		v1:Destroy()
	end
	CollectionService:GetInstanceAddedSignal(v2.Tag):Connect(addComponent)
	CollectionService:GetInstanceRemovedSignal(v2.Tag):Connect(removeComponent)
	for v3, v4 in CollectionService:GetTagged(v2.Tag) do
		if not t3[v4] then
			local v5 = v1.DeepCopy(v2)
			v5.Instance = v4
			t3[v4] = t.AddComponent(p1, v5, table.unpack(t2))
		end
	end
	return addComponent
end
function t.BindToTag(p1, p2, ...) --[[ BindToTag | Line: 281 | Upvalues: v2 (copy) ]]
	local t = { ... }
	local v1 = v2.new(p1, function(p1) --[[ Line: 283 | Upvalues: p2 (copy), t (copy) ]]
		local v2 = p2(p1, table.unpack(t))
		if not v2 then
			v2 = {
				Destroy = function() --[[ Destroy | Line: 286 ]] end
			}
		end
		return v2
	end)
	v1:Init()
	return v1
end
function t.WaitForPlayerGui(p1, ...) --[[ WaitForPlayerGui | Line: 297 | Upvalues: PlayerGui (copy) ]]
	local v1
	if type(p1) == "table" then
		v1 = p1
	else
		v1 = { p1 }
		for i, v in ipairs({ ... }) do
			table.insert(v1, v)
		end
	end
	for i, v in ipairs(v1) do
		PlayerGui:WaitForChild(v)
	end
	return PlayerGui
end
function t.CloneTemplate(p1) --[[ CloneTemplate | Line: 320 ]]
	local v1 = p1:Clone()
	v1:RemoveTag("DefaultTemplate")
	return v1
end
function t.GetPlayerGui(p1, ...) --[[ GetPlayerGui | Line: 329 | Upvalues: t (copy) ]]
	return t.WaitForPlayerGui(p1, ...):WaitForChild(p1)
end
function t.FindPlayerGui(p1) --[[ FindPlayerGui | Line: 337 | Upvalues: PlayerGui (copy) ]]
	return PlayerGui:FindFirstChild(p1)
end
function t.SetCoreGui(p1) --[[ SetCoreGui | Line: 343 | Upvalues: StarterGui (copy) ]]
	while not pcall(function() --[[ Line: 345 | Upvalues: p1 (copy), StarterGui (ref) ]]
		for k, v in pairs(p1) do
			if k == "ResetButtonCallback" then
				StarterGui:SetCore("ResetButtonCallback", v)
				continue
			end
			StarterGui:SetCoreGuiEnabled(k, v)
		end
	end) do
		task.wait()
	end
end
function t.IsVisibleOnScreen(p1) --[[ IsVisibleOnScreen | Line: 362 ]]
	if p1:IsA("LayerCollector") and not p1.Enabled then
		return false
	end
	local v1 = p1:FindFirstAncestorWhichIsA("ScreenGui")
	if not (v1 and v1.Enabled) then
		return false
	end
	while p1 and p1 ~= v1 do
		if p1:IsA("GuiObject") and not p1.Visible then
			return false
		end
		p1 = p1.Parent
	end
	return true
end
function t.GetPropertiesOfDescendants(p1, p2) --[[ GetPropertiesOfDescendants | Line: 386 ]]
	local Exclude = p2.Exclude
	local v1 = p1:GetDescendants()
	table.insert(v1, p1)
	local t = {}
	for v2, v3 in v1 do
		local v4
		if Exclude then
			local v5 = false
			for v6, v7 in Exclude do
				if v3 == v7 or v3:IsDescendantOf(v7) then
					v5 = true
					break
				end
			end
			if not v5 then
				v4 = p2[v3] or (p2[v3.Name] or p2[v3.ClassName])
				if v4 then
					t[v3] = {}
					for v8, v9 in v4 do
						t[v3][v9] = v3[v9]
					end
				end
			end
		else
			v4 = p2[v3] or (p2[v3.Name] or p2[v3.ClassName])
			if v4 then
				t[v3] = {}
				for v8, v9 in v4 do
					t[v3][v9] = v3[v9]
				end
			end
		end
	end
	return t
end
function t.SetPropertiesOfDescendants(p1, p2) --[[ SetPropertiesOfDescendants | Line: 412 ]]
	local Exclude = p2.Exclude
	local v1 = p1:GetDescendants()
	table.insert(v1, p1)
	local t = {}
	for v2, v3 in v1 do
		local v4
		if Exclude then
			local v5 = false
			for v6, v7 in Exclude do
				if v3 == v7 or v3:IsDescendantOf(v7) then
					v5 = true
					break
				end
			end
			if not v5 then
				v4 = p2[v3] or (p2[v3.Name] or p2[v3.ClassName])
				if v4 then
					t[v3] = {}
					for v8, v9 in v4 do
						t[v3][v8] = v9
						v3[v8] = v9
					end
				end
			end
		else
			v4 = p2[v3] or (p2[v3.Name] or p2[v3.ClassName])
			if v4 then
				t[v3] = {}
				for v8, v9 in v4 do
					t[v3][v8] = v9
					v3[v8] = v9
				end
			end
		end
	end
	return t
end
function t.CreateDescendantPropertyMap(p1, p2) --[[ CreateDescendantPropertyMap | Line: 436 ]]
	local v1 = p1:GetDescendants()
	table.insert(v1, p1)
	local t = {}
	for v2, v3 in v1 do
		local v4 = p2[v3] or (p2[v3.Name] or p2[v3.ClassName])
		if v4 then
			t[v3] = v4
		end
	end
	return t
end
t.CreatePropertyMap = t.CreateDescendantPropertyMap
function t.StudsToPixels(p1, p2) --[[ StudsToPixels | Line: 455 ]]
	if p2 then
		local CurrentCamera = workspace.CurrentCamera
		return p1 * (CurrentCamera.ViewportSize.Y / (math.tan(math.rad(CurrentCamera.FieldOfView) / 2) * 2 * (CurrentCamera.CFrame.Position - p2.Position).Magnitude))
	end
end
function t.AddOnComponents(p1, p2) --[[ AddOnComponents | Line: 472 | Upvalues: v3 (copy), t (copy) ]]
	local t2 = {}
	for v2, v32 in v3.AddOnComponents[p1] or {} do
		if v32(p2) then
			local v4 = t.AddComponent(v2, p2)
			p2.Maid:GiveTask(v4)
			t2[v2] = v4
		end
	end
	return t2
end
function t.GetComponentConfig(p1, p2) --[[ GetComponentConfig | Line: 490 | Upvalues: v1 (copy) ]]
	local v12 = rawget(p1, "Config")
	if v12 then
		p1 = v1.Merge(p1, v12)
	end
	local v3 = if p2 then rawget(p1, p2) else p2
	if v3 and type(v3) == "table" then
		p1 = v1.Merge(p1, v3)
	end
	return p1
end
function t.GetComponentBehaviour(p1) --[[ GetComponentBehaviour | Line: 509 | Upvalues: v3 (copy) ]]
	return v3.ComponentBehaviour[p1] or {}
end
function t.__index(p1, p2) --[[ __index | Line: 516 | Upvalues: t (copy), t3 (copy) ]]
	local v1 = t
	local v2 = rawget(v1, p2)
	if v2 ~= nil then
		return v2
	end
	if not t._initialized then
		return function(...) --[[ Line: 525 | Upvalues: t (ref), t3 (ref), p2 (copy) ]]
			while not t._initialized do
				task.wait()
			end
			for v1, v2 in t3 do
				if v2 and v2[p2] then
					local v3 = v2[p2]
					if type(v3) == "function" then
						return v3(...)
					else
						return v3
					end
				end
			end
			local v6 = rawget(t, p2)
			if v6 == nil then
				return nil
			end
			if type(v6) == "function" then
				return v6(...)
			else
				return v6
			end
		end
	end
	for v3, v4 in t3 do
		if v4 and v4[p2] then
			return v4[p2]
		end
	end
	return nil
end
function t.Init(p1) --[[ Init | Line: 567 | Upvalues: v3 (copy), t (copy), t3 (copy), t2 (copy), Sonar (copy), t4 (copy) ]]
	for v1, v2 in v3.SetInvisibleOnInitTags do
		t.BindToTag(v1, function(p1) --[[ Line: 569 ]]
			if p1:IsA("GuiObject") then
				if p1.Visible then
					p1.Visible = false
					p1:SetAttribute("InvisibleOnInit", true)
				end
			else
				if not p1:IsA("UIStroke") then
					return
				end
				p1.Enabled = false
				p1:SetAttribute("InvisibleOnInit", true)
			end
		end)
	end
	if p1._initializing then
		return
	end
	p1._initializing = true
	local v32 = table.clone(t3)
	task.defer(function() --[[ Line: 587 | Upvalues: t2 (ref), t (ref), v32 (copy), t3 (ref), Sonar (ref), p1 (copy), t4 (ref) ]]
		for v1, v2 in t2 do
			t.BindComponent(v2, {
				Tag = v2
			})
		end
		for v3, v4 in v32 do
			if type(v4) == "string" then
				t3[v3] = Sonar(v4)
			end
		end
		p1._initialized = true
		for v5, v6 in t4 do
			Sonar(v6):Init()
		end
		Sonar("GuiProvider"):Init()
	end)
end
t:Init()
return setmetatable({}, t)