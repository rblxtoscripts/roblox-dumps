-- https://lua.expert/
script.Parent.Click.MouseEnter:Connect(function() --[[ Line: 1 ]]
	script.Parent.BoostName.Visible = true
end)
script.Parent.Click.MouseLeave:Connect(function() --[[ Line: 4 ]]
	script.Parent.BoostName.Visible = false
end)