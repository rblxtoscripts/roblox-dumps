-- https://lua.expert/
game.ReplicatedStorage.Remotes.Economy.revealBoxReward.OnClientEvent:Connect(function(p1, p2) --[[ Line: 1 ]]
	script.Parent.play:Invoke(p1, p2)
end)