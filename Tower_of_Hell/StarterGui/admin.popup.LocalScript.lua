-- https://lua.expert/
for k, v in pairs(script.Parent:GetChildren()) do
	if v:IsA("GuiButton") then
		if v.Name == "ban1" then
			v.Activated:Connect(function() --[[ Line: 4 ]]
				game.ReplicatedStorage.Remotes.Moderation.executePenalty:FireServer("pban", script.Parent.user.Text, script.Parent.reason.Text .. " T=" .. os.time() + 86400)
				script.Parent.Parent.Enabled = false
			end)
			continue
		end
		if v.Name == "ban7" then
			v.Activated:Connect(function() --[[ Line: 9 ]]
				game.ReplicatedStorage.Remotes.Moderation.executePenalty:FireServer("pban", script.Parent.user.Text, script.Parent.reason.Text .. " T=" .. os.time() + 604800)
				script.Parent.Parent.Enabled = false
			end)
			continue
		end
		if v.Name == "ban31" then
			v.Activated:Connect(function() --[[ Line: 14 ]]
				game.ReplicatedStorage.Remotes.Moderation.executePenalty:FireServer("pban", script.Parent.user.Text, script.Parent.reason.Text .. " T=" .. os.time() + 2678400)
				script.Parent.Parent.Enabled = false
			end)
			continue
		end
		v.Activated:Connect(function() --[[ Line: 19 | Upvalues: v (copy) ]]
			if v.Name == "exit" then
				script.Parent.Parent.Enabled = false
				return
			end
			game.ReplicatedStorage.Remotes.Moderation.executePenalty:FireServer(v.Name, script.Parent.user.Text, script.Parent.reason.Text)
			script.Parent.Parent.Enabled = false
		end)
	end
end
script.Parent.open.Event:Connect(function(p1) --[[ Line: 28 ]]
	if not game.ReplicatedStorage.Remotes.Moderation.isAdmin:InvokeServer() then
		return
	end
	script.Parent.user.Text = tostring(p1)
	script.Parent.Parent.Enabled = true
end)