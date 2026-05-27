-- https://lua.expert/
game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require((ReplicatedStorage:WaitForChild("Sonar")))("Constants")
local t = {}
local t2 = {
	[1] = 2,
	[2] = 1,
	[4] = 8,
	[8] = 4
}
local t3 = {
	[4] = 1,
	[8] = -1,
	[1] = 0,
	[2] = 0
}
local t4 = {
	[4] = 0,
	[8] = 0,
	[1] = -1,
	[2] = 1
}
local t5 = {}
t5.__index = t5
function t5.new(p1) --[[ new | Line: 17 | Upvalues: t5 (copy) ]]
	local v2 = setmetatable({}, t5)
	v2.Width = p1.Width or 9
	v2.Height = p1.Height or 9
	v2.HallwayWidth = p1.HallwayWidth or 80
	v2.WallHeight = p1.WallHeight or 90
	v2.WallThickness = p1.WallThickness or 8
	v2.OffsetY = p1.OffsetY or 1000
	v2.Seed = p1.Seed or os.time()
	v2.Random = Random.new(v2.Seed)
	v2.Grid = {}
	for i = 1, v2.Height do
		v2.Grid[i] = {}
		for j = 1, v2.Width do
			v2.Grid[i][j] = 0
		end
	end
	v2.Model = Instance.new("Model")
	v2.Model.Name = "Maze"
	v2.GenerateExteriorWalls = false
	return v2
end
function t5.Destroy(p1) --[[ Destroy | Line: 43 ]]
	setmetatable(p1, nil)
end
function t5.GenerateMaze(p1) --[[ GenerateMaze | Line: 48 | Upvalues: t3 (copy), t4 (copy), t2 (copy) ]]
	local function v1(p12, p2) --[[ carvePassagesFrom | Line: 49 | Upvalues: p1 (copy), t3 (ref), t4 (ref), t2 (ref), v1 (copy) ]]
		local list = { 1, 2, 4, 8 }
		for i = #list, 2, -1 do
			local v12 = p1.Random:NextInteger(1, i)
			local v3 = list[i]
			list[i] = list[v12]
			list[v12] = v3
		end
		for i, v in ipairs(list) do
			local v4 = p12 + t3[v]
			local v5 = p2 + t4[v]
			if v4 >= 1 and (v4 <= p1.Width and (v5 >= 1 and v5 <= p1.Height)) then
				if p1.Grid[v5][v4] == 0 then
					p1.Grid[p2][p12] = bit32.bor(p1.Grid[p2][p12], v)
					p1.Grid[v5][v4] = bit32.bor(p1.Grid[v5][v4], t2[v])
					v1(v4, v5)
					continue
				end
				if p1.Random:NextNumber() < 0.05 and bit32.band(p1.Grid[p2][p12], v) == 0 then
					p1.Grid[p2][p12] = bit32.bor(p1.Grid[p2][p12], v)
					p1.Grid[v5][v4] = bit32.bor(p1.Grid[v5][v4], t2[v])
				end
			end
		end
	end
	v1(p1.Random:NextInteger(1, p1.Width), (p1.Random:NextInteger(1, p1.Height)))
end
function t5.IsDeadEnd(p1, p2, p3) --[[ IsDeadEnd | Line: 85 ]]
	local v1 = p1.Grid[p3][p2]
	local count = 0
	for k, v in pairs({ 1, 2, 4, 8 }) do
		if bit32.band(v1, v) ~= 0 then
			count = count + 1
		end
	end
	return count == 1
end
function t5.GetEndCell(p1) --[[ GetEndCell | Line: 96 ]]
	local v2 = math.ceil(p1.Width / 2)
	local v4 = math.ceil(p1.Height / 2)
	local t = {}
	for i = 1, p1.Height do
		for j = 1, p1.Width do
			if p1:IsDeadEnd(j, i) and (v2 < j or v4 < i) then
				table.insert(t, {
					x = j,
					y = i
				})
			end
		end
	end
	if #t > 0 then
		return t[p1.Random:NextInteger(1, #t)]
	else
		return {
			x = p1.Width,
			y = p1.Height
		}
	end
end
function t5.CreateWall(p1, p2, p3, p4, p5) --[[ CreateWall | Line: 117 | Upvalues: v1 (copy) ]]
	local sum = math.abs(p4 - p2)
	local sum_2 = math.abs(p5 - p3)
	if sum_2 < sum then
		sum = sum + 2
	else
		sum_2 = sum_2 + 2
	end
	local v12 = game.ReplicatedStorage.Storage.Assets.Events[v1.EventName]["CornMazeWall" .. p1.Random:NextInteger(1, 2)]:Clone()
	local v5 = CFrame.new((Vector3.new((p2 + p4) / 2, p1.WallHeight / 2 + p1.OffsetY, (p3 + p5) / 2)))
	v12:PivotTo(v5 * CFrame.Angles(0, math.rad(if if sum == 0 then false else sum_2 == 0 then 90 else 0), 0))
	v12.Parent = p1.Model
end
function t5.GenerateMazeParts(p1) --[[ GenerateMazeParts | Line: 151 ]]
	local HallwayWidth = p1.HallwayWidth
	for i = 1, p1.Height do
		for j = 1, p1.Width do
			local v1 = p1.Grid[i][j]
			local v2 = (j - 1) * HallwayWidth
			local v3 = (i - 1) * HallwayWidth
			if bit32.band(v1, 1) == 0 and (p1.GenerateExteriorWalls or i > 1) then
				p1:CreateWall(v2, v3, v2 + HallwayWidth, v3)
			end
			if bit32.band(v1, 8) == 0 and (p1.GenerateExteriorWalls or j > 1) then
				p1:CreateWall(v2, v3, v2, v3 + HallwayWidth)
			end
			if j == p1.Width and (bit32.band(v1, 4) == 0 and (p1.GenerateExteriorWalls or j < p1.Width)) then
				p1:CreateWall(v2 + HallwayWidth, v3, v2 + HallwayWidth, v3 + HallwayWidth)
			end
			if i == p1.Height and (bit32.band(v1, 2) == 0 and (p1.GenerateExteriorWalls or i < p1.Height)) then
				p1:CreateWall(v2, v3 + HallwayWidth, v2 + HallwayWidth, v3 + HallwayWidth)
			end
		end
	end
	local CenterPart = Instance.new("Part")
	CenterPart.Size = Vector3.new(0.1, 0.1, 0.1)
	CenterPart.CanCollide = false
	CenterPart.Position = Vector3.new(p1.Width * HallwayWidth / 2, p1.OffsetY + p1.WallHeight / 2, p1.Height * HallwayWidth / 2)
	CenterPart.Anchored = true
	CenterPart.Transparency = 1
	CenterPart.Name = "CenterPart"
	CenterPart.Parent = p1.Model
	p1.Model.PrimaryPart = CenterPart
end
function t5.PlaceMarker(p1, p2, p3, p4) --[[ PlaceMarker | Line: 193 | Upvalues: v1 (copy) ]]
	local v12
	if p4 == "EndMarker" then
		v12 = game.ReplicatedStorage.Storage.Assets.Events[v1.EventName].EndMarker:Clone()
	else
		local Part = Instance.new("Part")
		Part.Size = Vector3.new(p1.HallwayWidth - p1.WallThickness, p1.WallThickness, p1.HallwayWidth - p1.WallThickness)
		Part.Transparency = 1
		v12 = Part
	end
	v12.Position = Vector3.new((p2 - 0.5) * p1.HallwayWidth, p1.WallThickness / 2 + p1.OffsetY, (p3 - 0.5) * p1.HallwayWidth)
	v12.CanCollide = false
	v12.Anchored = true
	v12.Name = p4
	v12.Parent = p1.Model
	v12:AddTag(p4)
end
function t.Generate(p1) --[[ Generate | Line: 222 | Upvalues: t5 (copy) ]]
	local v1 = t5.new(p1)
	v1:GenerateMaze()
	v1:GenerateMazeParts()
	v1:PlaceMarker(1, 1, "StartMarker")
	local v2 = v1:GetEndCell()
	v1:PlaceMarker(v2.x, v2.y, "EndMarker")
	v1:Destroy()
	return v1.Model
end
return t