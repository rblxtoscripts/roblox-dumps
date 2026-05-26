-- https://lua.expert/
local v1 = game.ReplicatedStorage.Remotes.Game.fetchServerOwnerId:InvokeServer()
if v1 ~= 0 and v1 == game.Players.LocalPlayer.UserId then
	script.Parent.Unavailable.Visible = false
	script.Parent.Parent.killparthue.NextSelectionDown = script.Parent.options.length
elseif v1 ~= 0 then
	script.Parent.Unavailable.Text = "Only available to the VIP Server owner"
end
if not game.ReplicatedStorage.Remotes.Moderation.isAdmin:InvokeServer() then
	return
end
script.Parent.Parent.killparthue.NextSelectionDown = script.Parent.options.length
script.Parent.Unavailable.Visible = false