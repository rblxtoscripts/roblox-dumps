-- https://lua.expert/
script.Parent.hueChanged.Event:Connect(function(p1) --[[ Line: 1 ]]
	local v1 = math.floor(p1 * 360)
	if v1 == 69 then
		v1 = "nice"
	end
	script.Parent.hueMarker.TextLabel.Text = v1 .. "\194\176"
end)