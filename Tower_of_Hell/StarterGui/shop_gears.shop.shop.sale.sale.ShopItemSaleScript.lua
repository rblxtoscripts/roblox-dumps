-- https://lua.expert/
local v1 = game.ReplicatedStorage.Sales:WaitForChild(script:GetAttribute("saleid"))
local function update() --[[ update | Line: 3 | Upvalues: v1 (copy) ]]
	if v1.item.Value then
		script.Parent.Parent.Visible = true
		script.Parent.sale.Value = v1
		script.Parent.item.Value = game.ReplicatedStorage.Assets.Gear:FindFirstChild(v1.item.Value)
	else
		script.Parent.Parent.Visible = false
	end
end
v1.Changed:Connect(update)
update()