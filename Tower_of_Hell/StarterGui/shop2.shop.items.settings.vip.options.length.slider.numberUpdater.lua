-- https://lua.expert/
script.Parent.hueChanged.Event:Connect(function(p1) --[[ Line: 1 ]]
	script.Parent.hueMarker.TextLabel.Text = math.floor(p1 * (script.Parent.Parent.maxLength.Value - script.Parent.Parent.minLength.Value)) + script.Parent.Parent.minLength.Value
end)