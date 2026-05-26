-- https://lua.expert/
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local v1 = script.Parent.Parent
local Roact = require(v1.Parent.Roact)
local getFFlagDraggerFrameworkFixes = require(v1.Flags.getFFlagDraggerFrameworkFixes)
local function getHoverColorForTime(p1, p2, p3, p4) --[[ getHoverColorForTime | Line: 22 ]]
	return p2:lerp(p1, math.sin(p4 / p3 * math.pi) * 0.5 + 0.5)
end
local v3 = Roact.PureComponent:extend("AnimatedHoverBox")
function v3.init(p1, p2) --[[ init | Line: 29 | Upvalues: getFFlagDraggerFrameworkFixes (copy), HttpService (copy) ]]
	assert(p2.HoverTarget, "Missing required property \'HoverTarget\'.")
	assert(p2.SelectColor, "Missing required property \'SelectColor\'.")
	assert(p2.HoverColor, "Missing required property \'HoverColor\'.")
	assert(p2.LineThickness, "Missing required property \'LineThickness\'.")
	assert(p2.SelectionBoxComponent, "Missing required property \'SelectionBoxComponent\'.")
	local t = {}
	t.currentColor = p1.props.HoverColor:lerp(p1.props.SelectColor, math.sin(0 / (p1.props.AnimatePeriod or (1 / 0)) * math.pi) * 0.5 + 0.5)
	p1:setState(t)
	p1._isMounted = false
	p1._startTime = 0
	if not getFFlagDraggerFrameworkFixes() then
		return
	end
	p1._bindName = "AnimatedHoverBoxUpdate" .. "_" .. HttpService:GenerateGUID(false)
end
function v3.didMount(p1) --[[ didMount | Line: 50 | Upvalues: getFFlagDraggerFrameworkFixes (copy), RunService (copy) ]]
	p1._isMounted = true
	p1._startTime = tick()
	RunService:BindToRenderStep(getFFlagDraggerFrameworkFixes() and p1._bindName or "AnimatedHoverBoxUpdate", Enum.RenderPriority.First.Value, function() --[[ Line: 55 | Upvalues: p1 (copy) ]]
		if not p1._isMounted then
			return
		end
		local t = {}
		t.currentColor = p1.props.HoverColor:lerp(p1.props.SelectColor, math.sin((tick() - p1._startTime) / (p1.props.AnimatePeriod or (1 / 0)) * math.pi) * 0.5 + 0.5)
		p1:setState(t)
	end)
end
function v3.willUnmount(p1) --[[ willUnmount | Line: 66 | Upvalues: getFFlagDraggerFrameworkFixes (copy), RunService (copy) ]]
	p1._isMounted = false
	RunService:UnbindFromRenderStep(if getFFlagDraggerFrameworkFixes() then p1._bindName or "AnimatedHoverBoxUpdate" else "AnimatedHoverBoxUpdate")
end
function v3.render(p1) --[[ render | Line: 73 | Upvalues: Roact (copy) ]]
	if p1.props.HoverTarget then
		local LineThickness = p1.props.LineThickness
		p1.props.HoverTarget:IsA("Model")
		return Roact.createElement("Highlight", {
			OutlineTransparency = 0,
			FillTransparency = 1,
			Adornee = p1.props.HoverTarget,
			OutlineColor = p1.state.currentColor,
			FillColor = p1.state.currentColor
		})
	else
		return nil
	end
end
return v3