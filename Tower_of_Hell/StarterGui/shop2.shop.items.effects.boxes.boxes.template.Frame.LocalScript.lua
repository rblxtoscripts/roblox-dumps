-- https://lua.expert/
if script.Parent.Parent.Name == "template" then
	return
end
local Configuration = game.ReplicatedStorage:WaitForChild("Configuration")
for k, v in pairs(script.Parent:GetChildren()) do
	if v:IsA("Frame") then
		local v1 = Configuration.Effects.Boxes:FindFirstChild(script.Parent.Parent.Name).Weights:FindFirstChild(v.Name)
		local v2 = Configuration.Effects.Rarities:FindFirstChild(v.Name)
		v.chance.Text = v1.Value .. "%"
		v.Frame.BackgroundColor3 = v2.color.Value
	end
end