-- https://lua.expert/
local Theme = game.ReplicatedStorage:WaitForChild("data"):WaitForChild(game.Players.LocalPlayer.UserId):WaitForChild("settings"):WaitForChild("Theme")
local function f1() --[[ Line: 2 | Upvalues: Theme (copy) ]]
	for k, v in pairs(script.Parent:GetChildren()) do
		if v:IsA("ValueBase") then
			v.Value = Theme:WaitForChild(v.Name).Value
		end
	end
	script.Parent.update:Fire()
end
local function addChild(p1) --[[ addChild | Line: 10 | Upvalues: f1 (copy) ]]
	if not p1:IsA("ValueBase") then
		return
	end
	p1.Changed:Connect(f1)
end
for k, v in pairs(Theme:GetChildren()) do
	if v:IsA("ValueBase") then
		v.Changed:Connect(f1)
	end
end
Theme.ChildAdded:Connect(addChild)
f1()