-- https://lua.expert/
local GuiService = game:GetService("GuiService")
local v1 = script.Parent.Parent
local Roact = require(v1.Parent.Roact)
local Colors = require(v1.Utility.Colors)
local v3 = Roact.PureComponent:extend("DragSelectionView")
v3.defaultProps = {
	BackgroundTransparency = 1,
	BackgroundColor3 = Colors.BLACK,
	BorderColor3 = Colors.GRAY
}
function v3.init(p1, p2) --[[ init | Line: 22 ]]
	assert(p2.DragStartLocation, "Missing required property \'DragStartLocation\'.")
	assert(p2.DragEndLocation, "Missing required property \'DragEndLocation\'.")
end
function v3.render(p1) --[[ render | Line: 27 | Upvalues: GuiService (copy), Roact (copy) ]]
	local DragStartLocation = p1.props.DragStartLocation
	local DragEndLocation = p1.props.DragEndLocation
	if DragStartLocation and DragEndLocation then
		local v1 = GuiService:GetGuiInset()
		local v2 = Rect.new(DragStartLocation - v1, DragEndLocation - v1)
		return Roact.createElement("ScreenGui", {}, { Roact.createElement("Frame", {
				BorderSizePixel = 0,
				Position = UDim2.new(0, v2.Min.X, 0, v2.Min.Y),
				Size = UDim2.new(0, v2.Width, 0, v2.Height),
				BackgroundColor3 = p1.props.BackgroundColor3,
				BackgroundTransparency = p1.props.BackgroundTransparency
			}, {
				Left = Roact.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(0, 1, 1, 0),
					BackgroundColor3 = p1.props.BorderColor3
				}),
				Top = Roact.createElement("Frame", {
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 1),
					BackgroundColor3 = p1.props.BorderColor3
				}),
				Right = Roact.createElement("Frame", {
					BorderSizePixel = 0,
					AnchorPoint = Vector2.new(1, 0),
					Position = UDim2.new(1, 0, 0, 0),
					Size = UDim2.new(0, 1, 1, 0),
					BackgroundColor3 = p1.props.BorderColor3
				}),
				Bottom = Roact.createElement("Frame", {
					BorderSizePixel = 0,
					AnchorPoint = Vector2.new(0, 1),
					Position = UDim2.new(0, 0, 1, 0),
					Size = UDim2.new(1, 0, 0, 1),
					BackgroundColor3 = p1.props.BorderColor3
				})
			}) })
	else
		return nil
	end
end
return v3