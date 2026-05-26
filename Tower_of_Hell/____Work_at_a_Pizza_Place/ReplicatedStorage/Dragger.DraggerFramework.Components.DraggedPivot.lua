-- https://lua.expert/
local Workspace = game:GetService("Workspace")
local Roact = require(script.Parent.Parent.Parent.Parent.Packages.Roact)
return function(p1) --[[ Line: 10 | Upvalues: Roact (copy), Workspace (copy) ]]
	local v1 = p1.DraggerContext:getHandleScale(p1.CFrame.Position)
	return Roact.createElement("SphereHandleAdornment", {
		ZIndex = 0,
		AlwaysOnTop = false,
		Transparency = 0.5,
		Adornee = Workspace.Terrain,
		CFrame = p1.CFrame,
		Radius = v1 * 0.4,
		Color3 = p1.DraggerContext:getSelectionBoxColor(p1.IsActive)
	})
end