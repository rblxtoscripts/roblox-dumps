-- https://lua.expert/
local CollectionService = game:GetService("CollectionService")
local v1 = game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId)
local v2 = script.Parent.Parent.Parent.Parent.Parent
wait(5)
local KillpartHueShift = v1:WaitForChild("settings"):WaitForChild("KillpartHueShift")
local function addSection(p1) --[[ addSection | Line: 10 | Upvalues: KillpartHueShift (copy), CollectionService (copy) ]]
	if game.ReplicatedStorage.DenormalKillpartColorSections:FindFirstChild(p1.Name) then
		return
	end
	local v1, v2 = Color3.toHSV(p1:WaitForChild("center").Color)
	local v3 = Color3.fromHSV((v1 + KillpartHueShift.Value) % 1, v2, 0.7)
	for k, v in pairs(p1:GetDescendants()) do
		if CollectionService:HasTag(v, "KillBrick") then
			v.Color = v3
		end
	end
	p1.DescendantAdded:Connect(function(p1) --[[ Line: 19 | Upvalues: CollectionService (ref), v3 (copy) ]]
		if not CollectionService:HasTag(p1, "KillBrick") then
			return
		end
		p1.Color = v3
	end)
end
local function apply() --[[ apply | Line: 26 | Upvalues: KillpartHueShift (copy), CollectionService (copy) ]]
	if not workspace:FindFirstChild("tower") then
		return
	end
	for k, v in pairs(workspace.tower:WaitForChild("sections"):GetChildren()) do
		if game.ReplicatedStorage.DenormalKillpartColorSections:FindFirstChild(v.Name) then
			break
		end
		local v1, v2 = Color3.toHSV(v:WaitForChild("center").Color)
		local v3 = Color3.fromHSV((v1 + KillpartHueShift.Value) % 1, v2, 0.7)
		for k2, v4 in pairs(v:GetDescendants()) do
			if CollectionService:HasTag(v4, "KillBrick") then
				v4.Color = v3
			end
		end
	end
end
workspace.ChildAdded:Connect(function(p1) --[[ Line: 41 | Upvalues: addSection (copy) ]]
	if p1.Name ~= "tower" then
		return
	end
	for k, v in pairs(p1:WaitForChild("sections"):GetChildren()) do
		addSection(v)
	end
	p1.sections.ChildAdded:Connect(function(p1) --[[ Line: 46 | Upvalues: addSection (ref) ]]
		addSection(p1)
	end)
end)
KillpartHueShift.Changed:Connect(apply)
apply()
script.Parent.slider.hueChanged.Event:Connect(function(p1, p2) --[[ Line: 54 | Upvalues: v1 (copy) ]]
	v1.settings.KillpartHueShift.Value = p1
	if p2 then
		v1.settings.KillpartHueShift.set:InvokeServer(p1)
	end
end)
script.Parent.slider.setHue:Fire(KillpartHueShift.Value)
function updateOpen() --[[ updateOpen | Line: 63 | Upvalues: v2 (copy) ]]
	local v1 = if script.Parent.Parent.selected.Value == script.Parent then script.Parent.Parent.open.Value else false
	script.Parent.xbox.Visible = if v1 then v2.controller.Value else v1
	script.Parent.TextLabel.Position = UDim2.new(UDim.new(0, if script.Parent.xbox.Visible then 28 else 8), script.Parent.TextLabel.Position.Y)
	script.Parent.slider.open.Value = if script.Parent.Parent.selected.Value == script.Parent then script.Parent.Parent.open.Value else false
end
script.Parent.Parent.selected.Changed:Connect(updateOpen)
script.Parent.Parent.open.Changed:Connect(updateOpen)
v2.controller.Changed:Connect(updateOpen)