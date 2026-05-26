-- https://lua.expert/
if not (workspace.CurrentCamera.ViewportSize.X < 640) then
	return
end
script.Parent.Chat.TextScaled = false
script.Parent.Chat.FontSize = "Size24"