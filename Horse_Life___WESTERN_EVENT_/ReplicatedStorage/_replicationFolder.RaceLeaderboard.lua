-- https://lua.expert/
local function _() --[[ Unreferenced function | Line: 28 | Upvalues: v1 (ref) ]]
	for k, v in pairs(UNNAMED_124043193070440.Entries) do
		v:Destroy()
	end
	UNNAMED_124043193070440.Entries = nil
end
local function _(p1) --[[ Unreferenced function | Line: 35 | Upvalues: v2 (ref) ]]
	UNNAMED_124043193142872:CreateEntry(p1)
end
local function _(p1) --[[ Unreferenced function | Line: 38 | Upvalues: v3 (ref) ]]
	UNNAMED_124043193141720:RemoveEntry(p1)
end
local function _(p1) --[[ Unreferenced function | Upvalues: v4 (ref), v5 (ref) ]]
	local v2 = setmetatable({}, v4)
	v2.Maid = v5.new()
	v2.Gui = p1
	v2.LeaderboardFolder = p1:FindFirstAncestorWhichIsA("Folder")
	v2.Entries = {}
	v2.Maid:GiveTask(function() --[[ Line: 28 | Upvalues: v2 (copy) ]]
		for k, v in pairs(v2.Entries) do
			v:Destroy()
		end
		v2.Entries = nil
	end)
	v2.Maid:GiveTask(v2.LeaderboardFolder.ChildAdded:Connect(function(p1) --[[ Line: 35 | Upvalues: v2 (copy) ]]
		v2:CreateEntry(p1)
	end))
	v2.Maid:GiveTask(v2.LeaderboardFolder.ChildRemoved:Connect(function(p1) --[[ Line: 38 | Upvalues: v2 (copy) ]]
		v2:RemoveEntry(p1)
	end))
	for k, v in pairs(v2.LeaderboardFolder:GetChildren()) do
		v2:CreateEntry(v)
	end
	return v2
end
local function _(p1) --[[ Unreferenced function ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
local function _() --[[ Unreferenced function | Line: 60 | Upvalues: v6 (ref), v7 (ref), v8 (ref) ]]
	local v2 = tonumber(UNNAMED_124043193199368.Name)
	UNNAMED_124043193069544.PositionLabel.Text = UNNAMED_124043193069608.GetOrdinalOfNumber(v2)
	UNNAMED_124043193069544.LayoutOrder = v2
end
local function _(p1, p2) --[[ Unreferenced function | Upvalues: v9 (ref), v10 (ref), v11 (ref), v12 (ref), v13 (ref) ]]
	if not p2:IsA("StringValue") then
		return
	end
	local v1 = v9.new()
	local v2 = p1.Gui.ContainerFrame.ScrollingFrame.Default:Clone()
	local function setPositionLabel() --[[ setPositionLabel | Line: 60 | Upvalues: p2 (copy), v2 (copy), v10 (ref) ]]
		local v22 = tonumber(p2.Name)
		v2.PositionLabel.Text = v10.GetOrdinalOfNumber(v22)
		v2.LayoutOrder = v22
	end
	v1:GiveTask(p2:GetPropertyChangedSignal("Name"):Connect(setPositionLabel))
	local v4 = tonumber(p2.Name)
	v2.PositionLabel.Text = v10.GetOrdinalOfNumber(v4)
	v2.LayoutOrder = v4
	v2.BackgroundColor3 = p2:GetAttribute("UserId") == v11.Player.UserId and Color3.fromRGB(90, 217, 21) or v2.BackgroundColor3
	v2.PlayerLabel.Text = p2:GetAttribute("Player")
	v2.PlayerImageLabel.Image = v12.GetUserThumbnail(p2:GetAttribute("UserId"), Enum.ThumbnailType.HeadShot)
	v2.TimeLabel.Text = v13.FormatString(p2:GetAttribute("Time"))
	v2.Visible = true
	v2.Parent = p1.Gui.ContainerFrame.ScrollingFrame
	v1:GiveTask(v2)
	p1.Gui.ContainerFrame.EmptyLabel.Visible = false
	p1.Entries[p2] = v1
end
local function _(p1, p2) --[[ Unreferenced function ]]
	if p1.Entries[p2] then
		p1.Entries[p2]:Destroy()
		p1.Entries[p2] = nil
	end
end
local function _(p1) --[[ Unreferenced function | Upvalues: v14 (ref), v15 (ref) ]]
	v14.new("RaceLeaderboard", v15):Init()
end