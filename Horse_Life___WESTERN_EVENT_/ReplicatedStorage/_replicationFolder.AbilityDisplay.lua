-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("GuiFrameworkService")
local v4 = Sonar("AbilityService")
local v5 = Sonar("FormatTime")
local v6 = Sonar("StorageUtils").GetConfig("Ability")()
local FormatExactSecondsString = v6.FormatExactSecondsString
function t.new(p1) --[[ new | Line: 20 | Upvalues: t (copy), v1 (copy), v3 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Context = p1
	v2.Config = v3.GetComponentConfig(p1)
	v2.Instance = p1.Instance
	v2.Character = p1.Character
	v2.Ability = v2:_getAbility(p1.Ability)
	if not v2.Ability then
		warn("\226\154\160\239\184\143 AbilityDisplay, Ability is required", v2.Instance, p1)
		return v2
	end
	v2.CharacterAbility = v2.Character:GetAbility(v2.Ability.Name)
	v2.Item = v2.Ability
	v2.ItemDisplay = v3.AddComponent("ItemDisplay", v2)
	v2.Maid:GiveTask(v2.ItemDisplay)
	v2.CooldownFrame = v3.FindElement(v2.Instance, "CooldownFrame")
	if v2.CooldownFrame then
		v2.ValueLabel = v3.FindElement(v2.Instance, "ValueLabel")
		v2.TimeLeft = 0
		if v2.Config.CooldownShape == "Circle" then
			v2.CooldownBar = v2.Maid:GiveTask(v3.AddComponent("AnimatedCircleBar", {
				TweenStyle = false,
				Instance = v2.CooldownFrame,
				Get = function() --[[ Get | Line: 53 | Upvalues: v2 (copy) ]]
					return v2.TimeLeft
				end,
				GetMax = function() --[[ GetMax | Line: 56 | Upvalues: v2 (copy) ]]
					return v2.CharacterAbility:GetCooldown()
				end,
				OnChanged = function(p1, p2) --[[ OnChanged | Line: 59 | Upvalues: v2 (copy) ]]
					v2:_setValueLabel(p2.NewValue)
				end
			}))
		else
			v2.CooldownBar = v2.Maid:GiveTask(v3.AddComponent("AnimatedBar", {
				Direction = "Up",
				TweenStyle = false,
				Instance = v2.CooldownFrame,
				Get = function() --[[ Get | Line: 68 | Upvalues: v2 (copy) ]]
					return v2.TimeLeft
				end,
				GetMax = function() --[[ GetMax | Line: 71 | Upvalues: v2 (copy) ]]
					return v2.CharacterAbility:GetCooldown()
				end,
				OnChanged = function(p1, p2) --[[ OnChanged | Line: 77 | Upvalues: v2 (copy) ]]
					v2:_setValueLabel(p2.NewValue)
				end
			}))
		end
		v2.Maid:GiveTask(v2.CharacterAbility:GetLastUseChangedSignal():Connect(function() --[[ Line: 85 | Upvalues: v2 (copy) ]]
			v2:_updateCooldown()
		end))
		v2:_updateCooldown()
	end
	v2.OnCooldown = false
	v2.OnCooldownStarted = {}
	if v2.Config.OnCooldownStarted then
		v2.OnCooldownStarted = type(v2.Config.OnCooldownStarted) == "table" and v2.Config.OnCooldownStarted or { v2.Config.OnCooldownStarted }
	end
	v2.OnCooldownEnded = {}
	if v2.Config.OnCooldownEnded then
		v2.OnCooldownEnded = type(v2.Config.OnCooldownEnded) == "table" and v2.Config.OnCooldownEnded or { v2.Config.OnCooldownEnded }
	end
	v2.OnCooldownChanged = {}
	if v2.Config.OnCooldownChanged then
		v2.OnCooldownChanged = type(v2.Config.OnCooldownChanged) == "table" and v2.Config.OnCooldownChanged or { v2.Config.OnCooldownChanged }
	end
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 108 | Upvalues: v2 (copy) ]]
	v2(p1)
end
function t._runCallbacks(p1, p2, p3) --[[ _runCallbacks | Line: 112 ]]
	if not p1[p2] then
		return
	end
	local v2 = if p3 then p3 else {}
	for v3, v4 in p1[p2] do
		v4(p1, v2)
	end
end
function t._getAbility(p1, p2) --[[ _getAbility | Line: 124 | Upvalues: v4 (copy) ]]
	if type(p2) == "table" and p2.Name then
		return v4.GetAbilityFromName(p2.Name)
	end
	return v4.GetAbilityFromName(p2)
end
function t._calculateTimeLeft(p1) --[[ _calculateTimeLeft | Line: 132 ]]
	return (p1.CharacterAbility:GetLastUse() or 0) + p1.CharacterAbility:GetCooldown() - workspace:GetServerTimeNow()
end
function t._updateCooldown(p1) --[[ _updateCooldown | Line: 137 | Upvalues: RunService (copy) ]]
	p1.TimeLeft = p1:_calculateTimeLeft()
	local OnCooldown = p1.OnCooldown
	p1.OnCooldown = p1.TimeLeft > 0
	if p1.OnCooldown then
		if not OnCooldown then
			p1:_runCallbacks("OnCooldownStarted", {
				TimeLeft = p1.TimeLeft
			})
		end
		if not p1.Maid.CooldownHeartbeat then
			p1.Maid.CooldownHeartbeat = RunService.Heartbeat:Connect(function() --[[ Line: 149 | Upvalues: p1 (copy) ]]
				p1.TimeLeft = p1:_calculateTimeLeft()
				if p1.CooldownBar then
					p1.CooldownBar:Update()
				end
				p1:_runCallbacks("OnCooldownChanged", {
					TimeLeft = p1.TimeLeft
				})
				if not (p1.TimeLeft <= 0) then
					return
				end
				p1.OnCooldown = false
				p1.Maid.CooldownHeartbeat = nil
				p1:_runCallbacks("OnCooldownEnded")
			end)
		end
	else
		if OnCooldown then
			p1:_runCallbacks("OnCooldownEnded")
		end
		p1.Maid.CooldownHeartbeat = nil
	end
	p1:_runCallbacks("OnCooldownChanged", {
		TimeLeft = p1.TimeLeft
	})
	if not p1.CooldownBar then
		return
	end
	p1.CooldownBar:Update()
end
function t._formatCooldown(p1, p2) --[[ _formatCooldown | Line: 178 | Upvalues: v5 (copy) ]]
	local v1 = nil
	local Format = p1.Config.Format
	if type(Format) == "function" then
		v1 = Format(p2)
	elseif type(Format) == "string" then
		v1 = string.format(Format, p2)
	end
	if not v1 then
		v1 = v5.FormatStat(p2)
	end
	return v1
end
function t._setValueLabel(p1, p2) --[[ _setValueLabel | Line: 194 | Upvalues: v6 (copy), v5 (copy), FormatExactSecondsString (copy) ]]
	if not p1.ValueLabel then
		return
	end
	if p2 <= (p1.Config.FormatExactBelowValue or v6.FormatExactBelowValue) then
		p1.ValueLabel.Text = v5.FormatExactSeconds(p2, FormatExactSecondsString)
	else
		p1.ValueLabel.Text = p1:_formatCooldown(p2)
	end
	p1.ValueLabel.Visible = p2 > 0
end
return t