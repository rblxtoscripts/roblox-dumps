-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiManager")
local v2 = Sonar("ButtonTest")
function t.Open(p1) --[[ Open | Line: 11 | Upvalues: v1 (copy) ]]
	v1.OpenFrame(nil, {
		CloseAll = "CloseOverlay"
	})
end
function t.Close() --[[ Close | Line: 17 | Upvalues: v1 (copy) ]]
	v1.CloseFrame(nil)
end
function t.OnOpen(p1) --[[ OnOpen | Line: 21 ]] end
function t.OnClose(p1) --[[ OnClose | Line: 25 ]] end
function t.Init(p1) --[[ Init | Line: 30 | Upvalues: v1 (copy), t (copy), v2 (copy) ]]
	v1.AddFrame(nil, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = (nil).Position,
		ClosePosition = (nil).Position + UDim2.new(0, 0, 0.15, 0)
	})
	v1.AddStateCallback(nil, "OnClose", function() --[[ Line: 42 | Upvalues: t (ref) ]]
		t:OnClose()
	end)
	v1.AddStateCallback(nil, "OnOpen", function() --[[ Line: 45 | Upvalues: t (ref) ]]
		t:OnOpen()
	end)
	v2.new((nil).CloseButton, {
		Click = t.Close
	})
end
t:Init()
return t