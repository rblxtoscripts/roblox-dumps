-- https://lua.expert/
local Roact = require(script.Parent.Parent.Parent.Roact)
local v2 = Roact.Component:extend("LocalSpaceIndicator")
v2.defaultProps = {
	BackgroundTransparency = 1,
	TextSize = 16,
	TextStrokeTransparency = 0,
	Font = Enum.Font.ArialBold,
	TextColor3 = Color3.new(255/255, 255/255, 255/255),
	TextStrokeColor3 = Color3.new(0/255, 0/255, 0/255)
}
function v2.init(p1, p2) --[[ init | Line: 23 ]]
	assert(p2.CFrame, "Missing required proprty CFrame")
	assert(p2.Size, "Missing required proprty Size")
	assert(p2.DraggerContext, "Missing required proprty DraggerContext")
end
function v2.render(p1) --[[ render | Line: 29 | Upvalues: Roact (copy) ]]
	local props = p1.props
	local DraggerContext = props.DraggerContext
	local v1 = props.CFrame
	local v2 = props.Size / 2
	local v3 = -v2
	local t = {}
	local v4 = Vector3.new(v3.X, v3.Y, v3.Z)
	local v5 = Vector3.new(v3.X, v2.Y, v3.Z)
	local v6 = Vector3.new(v3.X, v2.Y, v2.Z)
	local v7 = Vector3.new(v3.X, v3.Y, v2.Z)
	local v8 = Vector3.new(v2.X, v3.Y, v3.Z)
	local v9 = Vector3.new(v2.X, v2.Y, v3.Z)
	local v10 = Vector3.new(v2.X, v2.Y, v2.Z)
	t[1] = v4
	t[2] = v5
	t[3] = v6
	t[4] = v7
	t[5] = v8
	t[6] = v9
	t[7] = v10
	t[8] = Vector3.new(v2.X, v3.Y, v2.Z)
	local v11 = (-1 / 0)
	local t2 = {}
	local v12 = (-1 / 0)
	for i = 1, #t do
		local v13, v14 = DraggerContext:worldToViewportPoint((v1:PointToWorldSpace(t[i])))
		local v15 = Vector2.new(v13.X, v13.Y)
		table.insert(t2, {
			point = v15,
			onScreen = v14
		})
		local v16 = math.max(v12, v15.X)
		v11, v12 = math.max(v11, v15.Y), v16
	end
	local v18 = Vector2.new(v12, v11)
	local v19 = (1 / 0)
	local v20 = false
	local v21 = nil
	for j = 1, #t2 do
		local point = t2[j].point
		local Magnitude = (point - v18).Magnitude
		if Magnitude < v19 then
			v20 = t2[j].onScreen
			v19 = Magnitude
			v21 = point
		end
	end
	if v20 then
		local v22 = props.TextSize + 6
		return Roact.createElement("ScreenGui", {}, { Roact.createElement("TextLabel", {
				Text = "L",
				Selectable = false,
				BackgroundTransparency = props.BackgroundTransparency,
				Position = UDim2.fromOffset(v21.X, v21.Y),
				Size = UDim2.fromOffset(v22, v22),
				Font = props.Font,
				TextSize = props.TextSize,
				TextColor3 = props.TextColor3,
				TextStrokeColor3 = props.TextStrokeColor3,
				TextStrokeTransparency = props.TextStrokeTransparency
			}) })
	else
		return nil
	end
end
return v2