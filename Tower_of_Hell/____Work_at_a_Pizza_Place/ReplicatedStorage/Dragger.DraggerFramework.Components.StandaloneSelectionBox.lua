-- https://lua.expert/
local CoreGui = game:GetService("CoreGui")
local v1 = script.Parent.Parent
local Roact = require(v1.Parent.Roact)
local v3 = Roact.PureComponent:extend("StandaloneSelectionBox")
local getFFlagFixScalingToolBoundingBoxForLargeModels = require(v1.Flags.getFFlagFixScalingToolBoundingBoxForLargeModels)
function v3.init(p1) --[[ init | Line: 21 | Upvalues: Roact (copy) ]]
	p1._dummyPartRef = Roact.createRef()
end
function v3.render(p1) --[[ render | Line: 25 | Upvalues: CoreGui (copy), getFFlagFixScalingToolBoundingBoxForLargeModels (copy), Roact (copy) ]]
	local v1 = p1.props.Size:Min(Vector3.new(1, 1, 1))
	local v2 = p1.props.Size / 2 - v1 / 2
	local v3 = p1.props.Container or CoreGui
	if getFFlagFixScalingToolBoundingBoxForLargeModels() then
		return Roact.createElement(Roact.Portal, {
			target = v3
		}, {
			DummyModel = Roact.createElement("Model", {
				[Roact.Ref] = p1._dummyPartRef
			}, {
				DummyPart1 = Roact.createElement("Part", {
					Anchored = true,
					CanCollide = false,
					Transparency = 0,
					Shape = Enum.PartType.Block,
					CFrame = p1.props.CFrame * CFrame.new(-v2),
					Size = v1
				}),
				DummyPart2 = Roact.createElement("Part", {
					Anchored = true,
					CanCollide = false,
					Transparency = 0,
					Shape = Enum.PartType.Block,
					CFrame = p1.props.CFrame * CFrame.new(v2),
					Size = v1
				})
			}),
			SelectionBox = Roact.createElement("SelectionBox", {
				SurfaceTransparency = 1,
				Transparency = 0,
				Adornee = p1._dummyPartRef,
				Color3 = p1.props.Color,
				LineThickness = p1.props.LineThickness
			})
		})
	else
		return Roact.createElement(Roact.Portal, {
			target = v3
		}, {
			DummyPart = Roact.createElement("Part", {
				Shape = Enum.PartType.Block,
				Anchored = true,
				CanCollide = false,
				CFrame = p1.props.CFrame,
				Size = p1.props.Size,
				Transparency = 1,
				[Roact.Ref] = p1._dummyPartRef
			}),
			SelectionBox = Roact.createElement("SelectionBox", {
				SurfaceTransparency = 1,
				Transparency = 0,
				Adornee = p1._dummyPartRef,
				Color3 = p1.props.Color,
				LineThickness = p1.props.LineThickness
			})
		})
	end
end
return v3