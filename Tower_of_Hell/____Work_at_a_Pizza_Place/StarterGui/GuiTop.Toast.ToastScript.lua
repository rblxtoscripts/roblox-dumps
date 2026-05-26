-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
Library:Load("Utility")
Library:Load("Queue")
local v1 = Library:Load("Network")
local v2 = Library:Load("Maid")
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
require(PlayerGui:WaitForChild("GuiManager"))
PlayerGui:WaitForChild("UIEvents")
local v3 = script.Parent
local Message = v3:WaitForChild("Message")
local v4 = v2.new()
function wiggle(p1, p2, p3, p4) --[[ wiggle | Line: 20 ]]
	local v1 = 1
	game:GetService("RunService"):BindToRenderStep("Wiggle", Enum.RenderPriority.First.Value, function(p12) --[[ Line: 22 | Upvalues: p1 (copy), v1 (ref), p3 (copy), p2 (copy) ]]
		p1.Rotation = p1.Rotation + v1 * (p3 * p12)
		if not (p2 <= math.abs(p1.Rotation)) then
			return
		end
		v1 = -v1
	end)
	task.spawn(function() --[[ Line: 28 | Upvalues: p4 (copy), p1 (copy) ]]
		wait(p4)
		game:GetService("RunService"):UnbindFromRenderStep("Wiggle")
		p1.Rotation = 0
	end)
end
function SetMessage(p1, p2) --[[ SetMessage | Line: 39 | Upvalues: Message (copy), v3 (copy), v4 (copy) ]]
	Message.Text = p1
	local v1 = Message
	v1.TextColor3 = if p2 then p2 else Color3.fromRGB(255, 255, 255)
	wiggle(v3, 2, 200, 0.1)
	v4.Delay = task.delay(2, function() --[[ Line: 43 | Upvalues: Message (ref) ]]
		Message.Text = ""
	end)
end
v1:BindEvents({
	Toast = function(p1, p2) --[[ Toast | Line: 49 ]]
		SetMessage(p1, p2)
	end
})
v1:Listen({
	Toast = function(p1, p2) --[[ Toast | Line: 55 ]]
		SetMessage(p1, p2)
	end
})