-- https://lua.expert/
local Roact = require(script.Parent.Parent.Parent.Roact)
local v2 = Roact.PureComponent:extend("SummonHandlesNote")
function v2.didMount(p1) --[[ didMount | Line: 14 ]]
	p1.localeChangedConnection = p1.props.DraggerContext.LocaleChangedSignal:Connect(function() --[[ Line: 15 | Upvalues: p1 (copy) ]]
		p1:setState({})
	end)
end
function SimplePadding(p1) --[[ SimplePadding | Line: 20 | Upvalues: Roact (copy) ]]
	return Roact.createElement("UIPadding", {
		PaddingBottom = UDim.new(0, p1.Padding),
		PaddingRight = UDim.new(0, p1.Padding),
		PaddingLeft = UDim.new(0, p1.Padding),
		PaddingTop = UDim.new(0, p1.Padding)
	})
end
function v2.render(p1) --[[ render | Line: 29 | Upvalues: Roact (copy) ]]
	local props = p1.props
	if props.InView then
	else
		local v1 = props.DraggerContext:getViewportSize()
		local v2 = props.DraggerContext:getThemeColor(Enum.StudioStyleGuideColor.Tooltip)
		local v3 = props.DraggerContext:getThemeColor(Enum.StudioStyleGuideColor.Border)
		local v4 = props.DraggerContext:getThemeColor(Enum.StudioStyleGuideColor.MainText)
		local v5 = props.DraggerContext:getThemeColor(Enum.StudioStyleGuideColor.DimmedText)
		return Roact.createElement(Roact.Portal, {
			target = props.DraggerContext:getGuiParent()
		}, {
			SummonHandlesNoteGui = Roact.createElement("ScreenGui", {}, {
				Frame = Roact.createElement("Frame", {
					AnchorPoint = Vector2.new(0.5, 0),
					AutomaticSize = Enum.AutomaticSize.XY,
					BackgroundColor3 = v2,
					BorderColor3 = v3,
					Position = UDim2.new(0, v1.X / 2, 0, 2)
				}, {
					Padding = Roact.createElement(SimplePadding, {
						Padding = 3
					}),
					Layout = Roact.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 3)
					}),
					Tab = Roact.createElement("TextLabel", {
						LayoutOrder = 1,
						Text = props.DraggerContext:getText("SummonPivot", "TabText"),
						TextColor3 = v4,
						BackgroundColor3 = v5,
						AutomaticSize = Enum.AutomaticSize.XY
					}, {
						Padding = Roact.createElement(SimplePadding, {
							Padding = 2
						}),
						Corner = Roact.createElement("UICorner", {
							CornerRadius = UDim.new(0, 4)
						})
					}),
					Text = Roact.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Text = props.DraggerContext:getText("SummonPivot", "SummonText"),
						TextColor3 = v4,
						AutomaticSize = Enum.AutomaticSize.XY
					}, {
						Padding = Roact.createElement(SimplePadding, {
							Padding = 2
						})
					})
				})
			})
		})
	end
end
function v2.willUnmount(p1) --[[ willUnmount | Line: 85 ]]
	p1.localeChangedConnection:Disconnect()
end
return v2