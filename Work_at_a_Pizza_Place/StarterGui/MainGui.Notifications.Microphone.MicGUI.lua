-- https://lua.expert/
chats = {}
function chat(p1) --[[ chat | Line: 2 ]]
	for k, v in pairs(chats) do
		v.Position = UDim2.new(0, 0, 1, v.Position.Y.Offset - 75)
	end
	local v1 = script.Parent.Chat:clone()
	v1.Position = UDim2.new(0, 0, 1, -75)
	v1.Text = p1
	v1.Visible = true
	v1.Parent = script.Parent
	table.insert(chats, v1)
	delay(6, function() --[[ Line: 12 | Upvalues: v1 (copy) ]]
		v1:Destroy()
	end)
end
workspace.Main.Microphone.Event:connect(chat)