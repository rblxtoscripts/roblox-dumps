-- https://lua.expert/
local Workspace = game:GetService("Workspace")
local v1 = script.Parent.Parent
local Roact = require(v1.Parent.Roact)
local Colors = require(v1.Utility.Colors)
local v3 = Roact.Component:extend("SelectionDot")
v3.defaultProps = {
	Size = 3,
	BackgroundColor3 = Colors.WHITE,
	BorderColor3 = Colors.BLACK,
	Position = Vector3.new()
}
function v3.render(p1) --[[ render | Line: 22 | Upvalues: Workspace (copy), Roact (copy) ]]
	local v1, v2 = Workspace.CurrentCamera:WorldToScreenPoint(p1.props.Position)
	if v2 then
		local Size = p1.props.Size
		return Roact.createElement("ScreenGui", {}, { Roact.createElement("Frame", {
				BorderSizePixel = 1,
				Selectable = false,
				BackgroundColor3 = p1.props.BackgroundColor3,
				BorderColor3 = p1.props.BorderColor3,
				Position = UDim2.new(0, v1.X, 0, v1.Y),
				Size = UDim2.new(0, Size, 0, Size)
			}) })
	else
		return nil
	end
end
return v3