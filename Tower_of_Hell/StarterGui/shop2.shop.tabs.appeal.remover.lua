-- https://lua.expert/
if game.PlaceId == 5253186791 then
	wait(1)
	script.Parent.Parent.Parent.Parent.enableTab:Invoke(script.Parent)
	script.Parent.Parent.Parent.Parent.open.Value = true
else
	script.Parent:Destroy()
end