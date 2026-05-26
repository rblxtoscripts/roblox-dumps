-- https://lua.expert/
local uiStyle = game.Players.LocalPlayer.PlayerGui:WaitForChild("uiStyle")
local function addObject(p1) --[[ addObject | Line: 3 | Upvalues: uiStyle (copy) ]]
	if p1.Name == "COLORbackground" then
		if p1.Value ~= "" then
			p1.Parent.BackgroundColor3 = uiStyle[p1.Value].Value
		end
	elseif p1.Name == "COLORbackgroundtrans" then
		if p1.Value ~= "" then
			p1.Parent.BackgroundTransparency = uiStyle[p1.Value].Value
		end
	elseif p1.Name == "COLORimage" then
		if p1.Value ~= "" then
			p1.Parent.ImageColor3 = uiStyle[p1.Value].Value
		end
	elseif p1.Name == "COLORimagetrans" then
		if p1.Value ~= "" then
			p1.Parent.ImageTransparency = uiStyle[p1.Value].Value
		end
	elseif p1.Name == "COLORtext" then
		if p1.Value ~= "" then
			p1.Parent.TextColor3 = uiStyle[p1.Value].Value
		end
	elseif p1:IsA("ImageButton") then
		if not p1:FindFirstChild("COLORimage") then
			p1.ImageColor3 = uiStyle.ButtonColor.Value
			p1.ImageTransparency = uiStyle.ButtonTransparency.Value
		end
	elseif p1:IsA("TextLabel") or p1:IsA("TextButton") then
		if not p1:FindFirstChild("COLORtext") then
			p1.TextColor3 = uiStyle.TextColor.Value
		end
	else
		if not p1:IsA("ScrollingFrame") then
			return
		end
		p1.ScrollBarImageColor3 = uiStyle.AccentColor.Value
	end
end
local function update() --[[ update | Line: 38 | Upvalues: addObject (copy) ]]
	for k, v in pairs(script.Parent:GetDescendants()) do
		addObject(v)
	end
end
uiStyle.update.Event:Connect(update)
script.Parent.DescendantAdded:Connect(addObject)
for k, v in pairs(script.Parent:GetDescendants()) do
	addObject(v)
end