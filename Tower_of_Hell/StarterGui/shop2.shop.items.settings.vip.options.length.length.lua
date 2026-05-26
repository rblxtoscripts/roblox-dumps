-- https://lua.expert/
game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId)
local v1 = script.Parent.Parent.Parent.Parent.Parent.Parent.Parent
local function apply(p1) --[[ apply | Line: 5 ]]
	game.ReplicatedStorage.Remotes.Moderation.executeCommand:InvokeServer("/setlength " .. p1)
end
script.Parent.slider.hueChanged.Event:Connect(function(p1, p2) --[[ Line: 9 ]]
	local v2 = math.floor(p1 * (script.Parent.maxLength.Value - script.Parent.minLength.Value) + script.Parent.minLength.Value)
	script.Parent.Parent.reward.update:Fire(v2)
	if p2 then
		game.ReplicatedStorage.Remotes.Moderation.executeCommand:InvokeServer("/setlength " .. v2)
	end
end)
script.Parent.slider.setHue:Fire((game.ReplicatedStorage.Configuration.parts.Value - script.Parent.minLength.Value) / (script.Parent.maxLength.Value - script.Parent.minLength.Value))
function updateOpen() --[[ updateOpen | Line: 19 | Upvalues: v1 (copy) ]]
	local v12 = if script.Parent.Parent.Parent.Parent.selected.Value == script.Parent then script.Parent.Parent.Parent.Parent.open.Value else false
	script.Parent.xbox.Visible = if v12 then v1.controller.Value else v12
	script.Parent.TextLabel.Position = UDim2.new(UDim.new(0, if script.Parent.xbox.Visible then 28 else 8), script.Parent.TextLabel.Position.Y)
	script.Parent.slider.open.Value = v12
end
script.Parent.Parent.Parent.Parent.selected.Changed:Connect(updateOpen)
script.Parent.Parent.Parent.Parent.open.Changed:Connect(updateOpen)
script.Parent.open.Changed:Connect(updateOpen)
v1.controller.Changed:Connect(updateOpen)