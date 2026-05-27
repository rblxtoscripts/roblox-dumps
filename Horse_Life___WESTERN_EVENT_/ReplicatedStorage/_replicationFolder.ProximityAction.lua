-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Binder")
local v2 = Sonar("StorageUtils")
local v3 = Sonar("Maid")
local v4 = Sonar("safeDestroy")
local v5 = Sonar("GuiFrameworkService")
local v6 = Sonar("SprUtils")
local v7 = Sonar("PlayerWrapper").GetClient()
local v8 = v2.GetFromPath("ReplicatedStorage/Storage/Assets/ProximityPrompts")()
function t.new(p1) --[[ new | Line: 23 | Upvalues: t (copy), v3 (copy), v8 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v3.new()
	v2.AnimationMaid = v2.Maid:GiveTask(v3.new())
	v2.Config = p1
	v2.ProximityPrompt = p1.ProximityPrompt
	v2.Instance = p1.Instance or v2.ProximityPrompt and v2.ProximityPrompt.Parent
	if not v2.ProximityPrompt then
		local ProximityPrompt = v8.ProximityActionPrompt:Clone()
		ProximityPrompt.Name = "ProximityPrompt"
		ProximityPrompt.Parent = v2.Instance
		v2.ProximityPrompt = ProximityPrompt
	end
	if v2.Config.Properties then
		for v4, v5 in v2.Config.Properties do
			v2.ProximityPrompt[v4] = v5
		end
	end
	v2.ProximityPrompt.Enabled = true
	v2.ProximityPrompt:SetAttribute("Action", true)
	for v6, v7 in { "OnFocus", "OnFocusLost", "OnInteract" } do
		v2[v7] = {}
		for v82, v9 in p1 do
			if v2[v82] and type(v2[v82]) == "table" then
				if type(v9) == "table" then
					for v11, v12 in v9 do
						v2:AddCallback(v82, v12)
					end
					continue
				end
				v2:AddCallback(v82, v9)
			end
		end
	end
	v2.Maid:GiveTask(v2.ProximityPrompt.Triggered:Connect(function() --[[ Line: 66 | Upvalues: v2 (copy) ]]
		v2:Interact()
	end))
	v2.Maid:GiveTask(v2.ProximityPrompt.PromptShown:Connect(function() --[[ Line: 70 | Upvalues: v2 (copy) ]]
		v2:Open()
	end))
	v2.Maid:GiveTask(v2.ProximityPrompt.PromptHidden:Connect(function() --[[ Line: 74 | Upvalues: v2 (copy) ]]
		v2:Close()
	end))
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 81 | Upvalues: v4 (copy) ]]
	v4(p1)
end
function t._runCallbacks(p1, p2, p3) --[[ _runCallbacks | Line: 85 ]]
	local v2 = if p3 then p3 else {}
	for v3, v4 in p1[p2] do
		v4(p1, v2)
	end
end
function t._createGui(p1) --[[ _createGui | Line: 94 | Upvalues: v8 (copy), v7 (copy), v5 (copy) ]]
	local v1 = v8.ProximityActionGui:Clone()
	v1.Name = p1.Instance.Name .. "_ProximityAction"
	v1.Enabled = false
	v1.Adornee = p1.ProximityPrompt.Parent
	v1.Parent = v7.PlayerGui.GuiDump
	local v2 = v5.FindElement(v1, "ShadowLabel")
	if v2 then
		v5.AddComponent("AutomaticFrameSize", {
			Padding = 0.3,
			Instance = v2,
			BoundingInstance = v2.Parent,
			CanResize = function(p12, p2) --[[ CanResize | Line: 109 | Upvalues: p1 (copy) ]]
				return p1.Opened
			end
		})
	end
	v5.AddComponent("KeyCodeLabel", {
		Instance = v1,
		Inputs = {
			Keyboard = p1.ProximityPrompt.KeyboardKeyCode.Name,
			Gamepad = p1.ProximityPrompt.GamepadKeyCode.Name
		}
	})
	v5.AddComponent("Button", {
		Instance = v5.FindElement(v1, "Button"),
		OnClick = function() --[[ OnClick | Line: 125 | Upvalues: p1 (copy) ]]
			p1:Interact()
		end
	})
	for v3, v4 in { "ActionText", "ObjectText" } do
		local v52 = v5.FindElement(v1, v4)
		if v52 then
			v52.Text = #p1.ProximityPrompt[v4] > 0 and p1.ProximityPrompt[v4] or ""
		end
	end
	p1.UIScale = v5.FindElement(v1, "UIScale")
	p1.BillboardGui = v1
end
function t.Open(p1) --[[ Open | Line: 141 | Upvalues: v6 (copy) ]]
	if p1.Opened then
		return
	end
	p1.Opened = true
	if not p1.BillboardGui then
		p1:_createGui()
	end
	p1.AnimationMaid:DoCleaning()
	p1.BillboardGui.Enabled = true
	p1.UIScale.Scale = 0
	v6.spring(p1.UIScale, 0.6, 4, {
		Scale = 1
	})
	p1:_runCallbacks("OnFocus", {
		Instance = p1.Instance
	})
end
function t.Close(p1) --[[ Close | Line: 163 | Upvalues: TweenService (copy) ]]
	if not p1.Opened then
		return
	end
	p1.Opened = false
	if p1.BillboardGui then
		p1.TweenOut = TweenService:Create(p1.UIScale, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
			Scale = 0
		})
		p1.AnimationMaid:GiveTask(p1.TweenOut)
		p1.TweenOut.Completed:Connect(function() --[[ Line: 173 | Upvalues: p1 (copy) ]]
			p1.BillboardGui.Enabled = false
		end)
		p1.TweenOut:Play()
	end
	p1:_runCallbacks("OnFocusLost", {
		Instance = p1.Instance
	})
end
function t.Interact(p1) --[[ Interact | Line: 184 ]]
	p1:_runCallbacks("OnInteract", {
		Instance = p1.Instance
	})
end
function t.AddCallback(p1, p2, p3) --[[ AddCallback | Line: 190 ]]
	if not p1[p2] then
		p1[p2] = {}
	end
	table.insert(p1[p2], p3)
end
function t.Init(p1) --[[ Init | Line: 197 | Upvalues: v1 (copy), t (copy) ]]
	v1.new("ProximityAction", function(p1) --[[ Line: 198 | Upvalues: t (ref) ]]
		return t.new({
			ProximityPrompt = p1
		})
	end):Init()
end
t:Init()
return t