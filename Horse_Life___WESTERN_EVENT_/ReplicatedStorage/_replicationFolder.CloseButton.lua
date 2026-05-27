-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("GuiFrameworkService")
local v3 = Sonar("safeDestroy")
function t.new(p1) --[[ new | Line: 26 | Upvalues: t (copy), v1 (copy), v2 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v1.new()
	v22.Config = p1
	v22.Instance = p1.Instance
	v22.Instance = v2.FindElement(v22.Instance, "CloseButton")
	if v22.Instance then
		v22.Maid:GiveTask(v2.AddComponent("Button", {
			Preset = "CloseButton",
			Instance = v22.Instance,
			OnClick = function() --[[ OnClick | Line: 43 | Upvalues: v22 (copy) ]]
				v22:Close()
			end
		}))
	else
		warn("\226\154\160\239\184\143 CloseButton, Instance is required for close button", p1)
	end
	return v22
end
function t.GetScreen(p1) --[[ GetScreen | Line: 51 | Upvalues: v2 (copy) ]]
	if not p1.Screen then
		if p1.Config.ScreenToClose then
			p1.Screen = v2.GetScreen(type(p1.Config.ScreenToClose) == "function" and p1.Config.ScreenToClose() or p1.Config.ScreenToClose)
			return p1.Screen
		end
		local v22 = p1.Instance.Parent
		local v3
		while true do
			if not v22 then
				return p1.Screen
			end
			if v22:IsA("LayerCollector") then
				return
			end
			v3 = v2.GetScreen(v22)
			if v3 then
				break
			end
			v22 = v22.Parent
		end
		p1.Screen = v3
	end
	return p1.Screen
end
function t.Close(p1) --[[ Close | Line: 81 | Upvalues: v2 (copy) ]]
	if p1.Config.OnClick then
		p1.Config.OnClick(p1:GetScreen(), p1.Config.Args)
		return
	end
	if p1.Config.GroupToClose then
		local v22 = if type(p1.Config.GroupToClose) == "function" then p1.Config.GroupToClose() else p1.Config.GroupToClose
		if v22 then
			v2.CloseScreenGroup(v22, p1.Config.Args)
			return
		end
	end
	local v4 = p1:GetScreen()
	if not v4 then
		return
	end
	if p1.Config.ScreenToClose then
		v4:Close(p1.Config.Args)
		return
	end
	v4:CloseGroups(p1.Config.Args)
end
function t.SetCloseFunction(p1, p2) --[[ SetCloseFunction | Line: 114 ]]
	p1.Config.Close = p2
end
function t.Destroy(p1) --[[ Destroy | Line: 120 | Upvalues: v3 (copy) ]]
	v3(p1)
end
return t