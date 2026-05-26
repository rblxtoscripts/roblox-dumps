-- https://lua.expert/
local UserInputService = game:GetService("UserInputService")
local v1 = 0
local v2 = nil
script.Parent.hue.InputBegan:Connect(function(p1) --[[ Line: 6 | Upvalues: v2 (ref), UserInputService (copy) ]]
	if p1.UserInputType ~= Enum.UserInputType.MouseButton1 and (p1.UserInputType ~= Enum.UserInputType.Touch or p1.Delta ~= Vector3.new()) then
		return
	end
	v2 = true
	UserInputService.MouseIconEnabled = false
end)
UserInputService.InputEnded:Connect(function(p1) --[[ Line: 12 | Upvalues: v2 (ref), UserInputService (copy), v1 (ref) ]]
	if p1.UserInputType == Enum.UserInputType.MouseButton1 or p1.UserInputType == Enum.UserInputType.Touch then
		if v2 then
			v2 = false
			UserInputService.MouseIconEnabled = true
			script.Parent.hueChanged:Fire(v1, true)
		end
	else
		if not (p1.UserInputType.Value >= 12) or (not (p1.UserInputType.Value <= 19) or (p1.KeyCode ~= Enum.KeyCode.ButtonX or not script.Parent.open.Value)) then
			return
		end
		script.Parent.hueChanged:Fire(v1, true)
	end
end)
local function update() --[[ update | Line: 23 | Upvalues: v1 (ref) ]]
	script.Parent.hueMarker.Position = UDim2.new(0, v1 * script.Parent.hue.Size.X.Offset, 0.5, -7) + script.Parent.hue.Position
	script.Parent.hueValue.Value = v1
	script.Parent.hueChanged:Fire(v1)
end
UserInputService.InputChanged:Connect(function(p1, p2) --[[ Line: 29 | Upvalues: v2 (ref), v1 (ref), update (copy) ]]
	if p1.UserInputType ~= Enum.UserInputType.MouseMovement and p1.UserInputType ~= Enum.UserInputType.Touch then
		return
	end
	if not v2 then
		return
	end
	local v12 = (Vector2.new(p1.Position.X, p1.Position.Y) - script.Parent.hue.AbsolutePosition) / script.Parent.hue.AbsoluteSize
	v1 = Vector2.new(math.min(1, (math.max(0, v12.X))), (math.min(1, (math.max(0, v12.Y))))).X
	update()
end)
require(game.ReplicatedStorage.Library.Utility.thumbScrollerSmooth)(Enum.KeyCode.Thumbstick1, "X", function(p1, p2, p3) --[[ Line: 44 | Upvalues: v1 (ref), update (copy) ]]
	if script.Parent.open.Value then
		v1 = math.min(1, (math.max(0, v1 + math.max(0, p2 ^ 2) * math.sign(p2) * 0.005)))
		update()
	end
end, nil, 0.2)
script.Parent.setHue.Event:Connect(function(p1) --[[ Line: 50 | Upvalues: v1 (ref), update (copy) ]]
	v1 = p1
	update()
end)