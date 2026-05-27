-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("Maid")
local v3 = Sonar("safeDestroy")
local v4 = Sonar("PlayerWrapper")
Sonar("safePrint")
local v5 = v4.GetClient()
local function resolveDiscoveryEntry(p1) --[[ resolveDiscoveryEntry | Line: 17 | Upvalues: v5 (copy) ]]
	if not p1 then
		return nil
	end
	if type(p1) == "string" then
		return v5:GetDiscoveryEntry({
			Name = p1
		})
	end
	if type(p1) ~= "table" then
		return nil
	end
	if p1.EntryName and p1.CategoryName and type(p1.GetChangedSignal) == "function" then
		return p1
	end
	if p1.Name then
		return v5:GetDiscoveryEntry({
			Name = p1.Name,
			Category = p1.Category
		})
	else
		return nil
	end
end
function t.new(p1) --[[ new | Line: 39 | Upvalues: t (copy), v2 (copy), resolveDiscoveryEntry (copy), v1 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.Config = p1
	v22.Instance = p1.Instance
	v22.DiscoveryEntry = resolveDiscoveryEntry(p1.Entry)
	if not v22.DiscoveryEntry then
		warn("\226\154\160\239\184\143 DiscoveryDisplay, Entry could not be resolved", v22.Instance, v22.Config)
		return v22
	end
	v22.Entry = v22.DiscoveryEntry.EntryData or {}
	v22.ItemDisplay = v22.Maid:GiveTask(v1.AddComponent("ItemDisplay", {
		DoNotShowToolTip = true,
		Instance = v22.Instance,
		Item = v22.Entry,
		FormatName = v22.Config.FormatName,
		DoNotSetViewport = v22.Config.DoNotSetViewport
	}))
	v22.DescriptionLabel = v22.DescriptionLabel or v1.FindElement(v22.Instance, "DescriptionLabel")
	v22.ProgressBar = v22.ProgressBar or v1.FindElement(v22.Instance, "ProgressBar")
	v22.ProgressLabels = v1.FindElement(v22.Instance, "ProgressLabel", {
		GetAllDescendants = true
	}) or {}
	v22.CompletedLabels = v1.FindElement(v22.Instance, "CompletedLabel", {
		GetAllDescendants = true
	}) or {}
	v22.Maid:GiveTask(v22.DiscoveryEntry:GetChangedSignal():Connect(function() --[[ Line: 71 | Upvalues: v22 (copy) ]]
		v22:_setDescription()
		v22:_setState()
	end))
	v22:_setDescription()
	v22:_setupProgress()
	v22:_setState()
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 83 | Upvalues: v3 (copy) ]]
	v3(p1)
end
function t._setDescription(p1) --[[ _setDescription | Line: 87 ]]
	if p1.DescriptionLabel then
		p1.DescriptionLabel.Text = p1.Entry.Description or ""
	end
end
function t._formatProgress(p1, p2, p3) --[[ _formatProgress | Line: 95 ]]
	if p1.Config.ProgressFormat then
		return p1.Config.ProgressFormat(p2, p3)
	else
		return string.format("%d%% Discovered", p2)
	end
end
function t._setupProgress(p1) --[[ _setupProgress | Line: 102 | Upvalues: v1 (copy) ]]
	if p1.ProgressBar then
		if not p1.DiscoveryEntry.IsIndexType then
			p1.Maid:GiveTask(v1.AddComponent("AnimatedBar", {
				Direction = "LeftToRight",
				Instance = p1.ProgressBar,
				AmountLabel = p1.ProgressLabels,
				TweenToInitialValue = p1.Config.TweenToInitialValue,
				Get = function() --[[ Get | Line: 132 | Upvalues: p1 (copy) ]]
					return p1.DiscoveryEntry:GetValue()
				end,
				GetMax = function() --[[ GetMax | Line: 135 ]]
					return 100
				end,
				Changed = { p1.DiscoveryEntry:GetValueChangedSignal() },
				Format = function(p12, p2) --[[ Format | Line: 141 | Upvalues: p1 (copy) ]]
					return p1:_formatProgress(p12, p2)
				end
			}))
			return
		end
		p1.ProgressBar.Visible = false
		for v12, v2 in p1.ProgressLabels do
			v2.Visible = false
		end
	else
		if not p1.DiscoveryEntry.IsIndexType then
			p1.Maid:GiveTask(p1.DiscoveryEntry:GetValueChangedSignal():Connect(function() --[[ Line: 111 | Upvalues: p1 (copy) ]]
				p1:_setProgress()
			end))
			p1:_setProgress()
			return
		end
		for v3, v4 in p1.ProgressLabels do
			v4.Visible = false
		end
	end
end
function t._setProgress(p1) --[[ _setProgress | Line: 148 ]]
	if p1.ProgressBar then
		return
	end
	if p1.DiscoveryEntry.IsIndexType then
		return
	end
	local v1 = p1.DiscoveryEntry:GetValue()
	for v2, v3 in p1.ProgressLabels do
		v3.Text = p1:_formatProgress(v1, 100)
	end
end
function t._setState(p1) --[[ _setState | Line: 163 ]]
	local v1 = p1.DiscoveryEntry:IsCompleted()
	for v2, v3 in p1.CompletedLabels do
		v3.Visible = v1
	end
	if p1.ProgressBar and not p1.DiscoveryEntry.IsIndexType then
		p1.ProgressBar.Visible = not v1
	end
	if p1.DiscoveryEntry.IsIndexType then
		return
	end
	for v4, v5 in p1.ProgressLabels do
		v5.Visible = not v1
	end
end
return t