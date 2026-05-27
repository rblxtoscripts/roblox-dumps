-- https://lua.expert/
local t = {}
game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("StorageUtils")
local v2 = Sonar("GuiFrameworkService")
local v3 = v1.GetConfig("GuiTransition")()
local v4
if v3.Default then
	v4 = false
	function t._getTransitionGui(p1_2) --[[ _getTransitionGui | Line: 167 | Upvalues: v2 (copy) ]]
		if not p1_2.TransitionGui then
			p1_2.TransitionGui = v2.FindPlayerGui("TransitionGui")
		end
		return p1_2.TransitionGui
	end
	function t.IsTransitionRunning() --[[ IsTransitionRunning | Line: 177 | Upvalues: v4 (ref) ]]
		return v4
	end
	function t.YieldForTransitionEnd() --[[ YieldForTransitionEnd | Line: 184 | Upvalues: v4 (ref), RunService (copy) ]]
		if not v4 then
			return
		end
		repeat
			RunService.Heartbeat:Wait()
		until not v4
	end
	function t.PlayTransition(p1_2) --[[ PlayTransition | Line: 200 | Upvalues: v4 (ref), t (copy), v3 (copy) ]]
		if v4 then
			return
		end
		local v1 = t:_getTransitionGui()
		if not v1 then
			warn("\226\154\160\239\184\143 GuiTransition, TransitionGui not found")
			return
		end
		local v2 = p1_2.Preset or "Default"
		local v32 = v3[v2] or v3.Default
		if not v32 then
			warn("\226\154\160\239\184\143 GuiTransition, Invalid preset:", v2)
			return
		end
		v4 = true
		local v42
		if p1_2.OnStart then
			local v5, v6 = pcall(p1_2.OnStart, v1, p1_2.OnStart, p1_2)
			if v5 then
				v42 = v6
			else
				warn("\226\154\160\239\184\143 GuiTransition, OnStart callback failed:", v6)
				v42 = nil
			end
		else
			v42 = nil
		end
		local v7 = v32(v1, p1_2.OnTransition, p1_2, v42)
		if not p1_2.OnComplete then
			v4 = false
			return
		end
		local v8, v9 = pcall(p1_2.OnComplete, v1, p1_2.OnComplete, p1_2, v7)
		if v8 then
			v4 = false
			return
		end
		warn("\226\154\160\239\184\143 GuiTransition, OnComplete callback failed:", v9)
		v4 = false
	end
	return t
end
warn("\226\154\160\239\184\143 GuiTransition, Default transition not found in GuiTransitionConfig")
v4 = false
function t._getTransitionGui(p1_2) --[[ _getTransitionGui | Line: 167 | Upvalues: v2 (copy) ]]
	if not p1_2.TransitionGui then
		p1_2.TransitionGui = v2.FindPlayerGui("TransitionGui")
	end
	return p1_2.TransitionGui
end
function t.IsTransitionRunning() --[[ IsTransitionRunning | Line: 177 | Upvalues: v4 (ref) ]]
	return v4
end
function t.YieldForTransitionEnd() --[[ YieldForTransitionEnd | Line: 184 | Upvalues: v4 (ref), RunService (copy) ]]
	if not v4 then
		return
	end
	repeat
		RunService.Heartbeat:Wait()
	until not v4
end
function t.PlayTransition(p1_2) --[[ PlayTransition | Line: 200 | Upvalues: v4 (ref), t (copy), v3 (copy) ]]
	if v4 then
		return
	end
	local v1 = t:_getTransitionGui()
	if not v1 then
		warn("\226\154\160\239\184\143 GuiTransition, TransitionGui not found")
		return
	end
	local v2 = p1_2.Preset or "Default"
	local v32 = v3[v2] or v3.Default
	if not v32 then
		warn("\226\154\160\239\184\143 GuiTransition, Invalid preset:", v2)
		return
	end
	v4 = true
	local v42
	if p1_2.OnStart then
		local v5, v6 = pcall(p1_2.OnStart, v1, p1_2.OnStart, p1_2)
		if v5 then
			v42 = v6
		else
			warn("\226\154\160\239\184\143 GuiTransition, OnStart callback failed:", v6)
			v42 = nil
		end
	else
		v42 = nil
	end
	local v7 = v32(v1, p1_2.OnTransition, p1_2, v42)
	if not p1_2.OnComplete then
		v4 = false
		return
	end
	local v8, v9 = pcall(p1_2.OnComplete, v1, p1_2.OnComplete, p1_2, v7)
	if v8 then
		v4 = false
		return
	end
	warn("\226\154\160\239\184\143 GuiTransition, OnComplete callback failed:", v9)
	v4 = false
end
return t