-- https://lua.expert/
script.Parent:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 1 ]]
	script.Parent.Text = script.Parent.Text:gsub("%D+", "")
end)