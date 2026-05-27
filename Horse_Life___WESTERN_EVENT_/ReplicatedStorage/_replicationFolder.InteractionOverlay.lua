-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("GuiFrameworkService")
local v4 = Sonar("EventUtils")
local v5 = Sonar("Signal")
local v6 = Sonar("TableUtils")
local v7 = Sonar("StorageUtils")
local v8 = Sonar("safePrint")
local InteractionPresets = v7.GetConfig("InteractionOverlay")().InteractionPresets
local t2 = { "OnDown", "OnUp", "OnClick" }
function t.new(p1) --[[ new | Line: 110 | Upvalues: t (copy), v1 (copy), v3 (copy), InteractionPresets (copy), v6 (copy), v5 (copy), v4 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Identifier = tick()
	v2.Context = p1.Context or p1
	v2.Config = v3.GetComponentConfig(p1, "InteractionOverlay")
	v2.Instance = p1.Instance
	v2.OverlayLabel = v2.OverlayLabel or v3.FindElement(v2.Instance, "InteractionOverlay")
	if not v2.OverlayLabel then
		return v2
	end
	v2.Preset = v2.Config.Preset and InteractionPresets[v2.Config.Preset]
	if not v2.Preset then
		if v2.Config.Preset then
			warn("\226\154\160\239\184\143 InteractionOverlay, No preset found for", v2.Config.Preset, v2.Config)
		end
		v2.Preset = {}
	end
	v2.Instance = p1.Instance
	v2.Config = v6.MergeOriginal(v2.Config, v2.Preset, true)
	v2.Responses = v6.MergeOriginal(v2.Config.Responses or {}, v2.Preset.Response or {})
	v2.OverlayChangedSignal = v2.Maid:GiveTask(v5.new())
	v2.TextLabel = v3.FindElement(v2.OverlayLabel, "TextLabel")
	v2.ImageLabel = v3.FindElement(v2.OverlayLabel, "Viewport")
	v2.Changed = v4.getConnectionEvents(function() --[[ Line: 147 | Upvalues: v2 (copy), v4 (ref) ]]
		local v1 = if v2.Config.Changed then v4.getConnectionEvents(v2.Config.Changed, v2.Context) or {} else {}
		if v2.Preset and v2.Preset.Changed then
			for v22, v3 in v4.getConnectionEvents(v2.Preset.Changed) do
				table.insert(v1, v3)
			end
		end
		return v1
	end, v2.Context)
	for v7, v8 in v2.Changed do
		v2.Maid:GiveTask(v8:Connect(function() --[[ Line: 159 | Upvalues: v2 (copy) ]]
			v2:_setOverlay()
		end))
	end
	v2.Maid:GiveTask(task.defer(function() --[[ Line: 164 | Upvalues: v2 (copy) ]]
		v2:_setOverlay()
	end))
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 171 | Upvalues: v2 (copy) ]]
	v2(p1)
end
function t.ShouldBlockAction(p1, p2) --[[ ShouldBlockAction | Line: 175 | Upvalues: t2 (copy) ]]
	if not table.find(t2, p2.Action) then
		return false
	end
	if p2.Notify then
		p1:ShowNotification()
	end
	if p1:IsActive() then
		return true
	else
		return false
	end
end
function t.ShowNotification(p1) --[[ ShowNotification | Line: 189 | Upvalues: v3 (copy) ]]
	if not p1.CurrentVisible then
		return false
	end
	if not (p1.CurrentResponse and p1.CurrentResponse.Notification) then
		return true
	end
	v3.Notify(type(p1.CurrentResponse.Notification) == "table" and p1.CurrentResponse.Notification or {
		Preset = "Response",
		Type = p1.CurrentResponse.Type .. "_" .. p1.Identifier,
		Message = p1.CurrentResponse.Notification
	})
	return true
end
function t._getVisibility(p1) --[[ _getVisibility | Line: 206 | Upvalues: v8 (copy) ]]
	local v1 = p1.Config.Visible(p1.Context)
	if type(v1) ~= "string" then
		return v1 == true
	end
	local v2 = p1.Responses[v1]
	if not v2 then
		warn("\226\154\160\239\184\143 InteractionOverlay, Invalid response for", v1, v8(p1.Config))
	end
	local v3 = if type(v2) == "table" and v2 then v2 else type(v2) == "function" and v2(p1.Context) or (if type(v2) == "string" then {
	Notification = v2
} else false)
	if type(v3) == "table" then
		v3.Type = v1
		return true, v3
	else
		warn("\226\154\160\239\184\143 InteractionOverlay, Invalid response info for", v1, v8(p1.Config))
		return false
	end
end
function t._setOverlay(p1) --[[ _setOverlay | Line: 238 ]]
	if not p1.OverlayLabel then
		return
	end
	local v1, v2 = p1:_getVisibility()
	local isNotCurrentResponse = v2 ~= p1.CurrentResponse
	p1.CurrentResponse = v2
	p1.CurrentVisible = v1
	if v1 then
		if p1.TextLabel then
			if v2.Text then
				p1.TextLabel.Text = v2.Text
				p1.TextLabel.Visible = true
			else
				p1.TextLabel.Visible = false
			end
		end
		if p1.ImageLabel then
			if v2.Image then
				p1.ImageLabel.Image = v2.Image
				p1.ImageLabel.Visible = true
			else
				p1.ImageLabel.Visible = false
			end
		end
		p1.OverlayLabel.Visible = true
	else
		p1.OverlayLabel.Visible = false
	end
	if not isNotCurrentResponse then
		return
	end
	p1.OverlayChangedSignal:Fire(v2)
end
function t.IsOverlayChangingLayoutOrder(p1) --[[ IsOverlayChangingLayoutOrder | Line: 278 ]]
	if p1.CurrentResponse then
		return not p1.CurrentResponse.IgnoreLayoutSort
	else
		return false
	end
end
function t.GetOverlayChangedSignal(p1) --[[ GetOverlayChangedSignal | Line: 290 ]]
	return p1.OverlayChangedSignal
end
function t.IsActive(p1) --[[ IsActive | Line: 294 ]]
	return p1.CurrentVisible
end
function t.Reset(p1) --[[ Reset | Line: 298 ]]
	if p1.OverlayLabel then
		p1.OverlayLabel.Visible = false
	end
end
function t.Update(p1) --[[ Update | Line: 306 ]]
	p1:_setOverlay()
end
return t