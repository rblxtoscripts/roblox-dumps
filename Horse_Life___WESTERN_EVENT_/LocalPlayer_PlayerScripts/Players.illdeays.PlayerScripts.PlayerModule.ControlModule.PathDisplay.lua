-- https://lua.expert/
local t = {
	spacing = 8,
	image = "rbxasset://textures/Cursors/Gamepad/Pointer.png",
	imageSize = Vector2.new(2, 2)
}
local PathDisplayPoints = Instance.new("Model")
PathDisplayPoints.Name = "PathDisplayPoints"
local PathDisplayAdornee = Instance.new("Part")
PathDisplayAdornee.Anchored = true
PathDisplayAdornee.CanCollide = false
PathDisplayAdornee.Transparency = 1
PathDisplayAdornee.Name = "PathDisplayAdornee"
PathDisplayAdornee.CFrame = CFrame.new(0, 0, 0)
PathDisplayAdornee.Parent = PathDisplayPoints
local v1 = 30
local t2 = {}
local t3 = {}
local t4 = {}
for i = 1, v1 do
	local ImageHandleAdornment = Instance.new("ImageHandleAdornment")
	ImageHandleAdornment.Archivable = false
	ImageHandleAdornment.Adornee = PathDisplayAdornee
	ImageHandleAdornment.Image = t.image
	ImageHandleAdornment.Size = t.imageSize
	t2[i] = ImageHandleAdornment
end
local function retrieveFromPool() --[[ retrieveFromPool | Line: 33 | Upvalues: t2 (copy), v1 (ref) ]]
	local v12 = t2[1]
	if v12 then
		t2[1] = t2[v1]
		t2[v1] = nil
		v1 = v1 - 1
		return v12
	end
end
local function returnToPool(p1) --[[ returnToPool | Line: 44 | Upvalues: v1 (ref), t2 (copy) ]]
	v1 = v1 + 1
	t2[v1] = p1
end
local function renderPoint(p1, p2) --[[ renderPoint | Line: 49 | Upvalues: v1 (ref), t2 (copy), PathDisplayPoints (copy) ]]
	if v1 == 0 then
		return
	end
	local v2, v3, v4 = workspace:FindPartOnRayWithIgnoreList(Ray.new(p1 + Vector3.new(0, 2, 0), Vector3.new(0, -8, 0)), { game.Players.LocalPlayer.Character, workspace.CurrentCamera })
	if not v2 then
		return
	end
	local v5 = CFrame.new(v3, v3 + v4)
	local v6 = t2[1]
	local v7
	if v6 then
		t2[1] = t2[v1]
		t2[v1] = nil
		v1 = v1 - 1
		v7 = v6
	else
		v7 = nil
	end
	v7.CFrame = v5
	v7.Parent = PathDisplayPoints
	return v7
end
function t.setCurrentPoints(p1) --[[ setCurrentPoints | Line: 68 | Upvalues: t3 (ref) ]]
	t3 = if typeof(p1) == "table" then p1 else {}
end
function t.clearRenderedPath() --[[ clearRenderedPath | Line: 76 | Upvalues: t4 (ref), v1 (ref), t2 (copy), PathDisplayPoints (copy) ]]
	for i, v in ipairs(t4) do
		v.Parent = nil
		v1 = v1 + 1
		t2[v1] = v
	end
	t4 = {}
	PathDisplayPoints.Parent = nil
end
function t.renderPath() --[[ renderPath | Line: 85 | Upvalues: t (copy), t3 (ref), t4 (ref), renderPoint (copy), PathDisplayPoints (copy) ]]
	t.clearRenderedPath()
	if not t3 or #t3 == 0 then
		return
	end
	local count = #t3
	t4[1] = renderPoint(t3[count], true)
	if not t4[1] then
		return
	end
	local sum = 0
	while true do
		local v1 = t3[count]
		if count < 2 then
			break
		end
		local v3 = t3[count - 1] - v1
		local magnitude = v3.magnitude
		if magnitude < sum then
			count = count - 1
			sum = sum - magnitude
		else
			local v4 = renderPoint(v1 + v3.unit * sum, false)
			if v4 then
				t4[#t4 + 1] = v4
			end
			sum = sum + t.spacing
		end
	end
	PathDisplayPoints.Parent = workspace.CurrentCamera
end
return t