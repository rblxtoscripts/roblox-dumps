-- https://lua.expert/
local v1 = script.Parent
local Demojify = require(v1:WaitForChild("Demojify"))
local List = v1:WaitForChild("List")
local RowTemplate = List:WaitForChild("RowTemplate")
local CancelButton = v1:WaitForChild("CancelButton")
local ShowWindow = game.ReplicatedStorage:WaitForChild("ShowWindow")
local OnClosed = game.ReplicatedStorage:WaitForChild("OnClosed")
v1.Visible = false
RowTemplate.Parent = nil
CancelButton.MouseButton1Click:Connect(function() --[[ Line: 19 | Upvalues: v1 (copy), OnClosed (copy) ]]
	v1.Visible = false
	OnClosed:FireServer()
end)
function ClearRows() --[[ ClearRows | Line: 24 | Upvalues: List (copy) ]]
	for i, v in ipairs(List:GetChildren()) do
		if v.Name == "RowTemplate" then
			v:Destroy()
		end
	end
end
ShowWindow.OnClientEvent:Connect(function(p1, p2) --[[ Line: 32 | Upvalues: Demojify (copy), RowTemplate (copy), List (copy), v1 (copy) ]]
	ClearRows()
	for i, v in ipairs(p2) do
		local v12
		local v2 = v:sub(1, 1)
		local v3 = Demojify(v2) ~= v2
		v12 = if v3 and v2 then v2 else "\226\154\170"
		local v4 = v3 and v:sub(2) or v
		local v5 = RowTemplate:Clone()
		v5.Emoji.Text = v12
		v5.TextLabel.Text = v4
		v5.Visible = true
		v5.Parent = List
		local TextLabel = v5.TextLabel
		TextLabel.Size = UDim2.new(TextLabel.Size.X.Scale, TextLabel.Size.X.Offset, 0, game:GetService("TextService"):GetTextSize(TextLabel.Text, TextLabel.TextSize, TextLabel.Font, Vector2.new(TextLabel.AbsoluteSize.X, 1000)).Y)
	end
	v1.Visible = true
end)