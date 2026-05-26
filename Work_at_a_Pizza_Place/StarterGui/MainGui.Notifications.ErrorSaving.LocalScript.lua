-- https://lua.expert/
require(game.ReplicatedStorage:WaitForChild("Enums"))
workspace.Main.DataStoreError.OnClientEvent:connect(function(p1) --[[ Line: 3 ]]
	if p1 == "" or p1 == nil then
		script.Parent.Visible = false
		script.Parent.Text = ""
	else
		script.Parent.Text = p1
		script.Parent.Visible = true
	end
end)