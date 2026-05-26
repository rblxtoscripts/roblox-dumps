-- https://lua.expert/
while true do
	if game.ReplicatedStorage.GameValues.bunnyJumping.Value and script.Parent.Humanoid:GetState() ~= Enum.HumanoidStateType.Climbing then
		script.Parent.Humanoid.Jump = true
	end
	wait()
end