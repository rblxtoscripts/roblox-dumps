-- https://lua.expert/
local v1 = script.Parent
require(game.ReplicatedStorage:WaitForChild("Enums"))
function ShowHint(p1, p2) --[[ ShowHint | Line: 5 | Upvalues: v1 (copy) ]]
	v1.Label.Text = p1
	v1.Visible = true
	wait(p2)
	v1.Visible = false
end
workspace.MessageService.ShowHint.OnClientEvent:connect(function(p1, p2) --[[ Line: 13 ]]
	ShowHint(p1, p2)
end)
workspace.MessageService.ShowHint.ShowHint.Event:connect(function(p1, p2) --[[ Line: 17 ]]
	ShowHint(p1, p2)
end)