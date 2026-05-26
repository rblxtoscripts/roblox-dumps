-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("safeDestroy")
local v2 = Sonar("Maid")
local v3 = Sonar("StorageUtils")
local v4 = Sonar("MathUtils")
local v5 = Sonar("spr")
local v6 = Sonar("GuiFrameworkService", {
	Context = "Client"
})
local t2 = {
	ImageLabel = "ImageColor3",
	ImageButton = "ImageColor3",
	TextLabel = "TextColor3",
	TextButton = "TextColor3",
	Frame = "BackgroundColor3"
}
local function toColorSequence(p1) --[[ toColorSequence | Line: 189 ]]
	if typeof(p1) == "Color3" then
		return ColorSequence.new(p1)
	else
		return p1
	end
end
local function toColor3(p1) --[[ toColor3 | Line: 196 ]]
	if typeof(p1) == "ColorSequence" then
		return p1.Keypoints[1].Value
	else
		return p1
	end
end
local t3 = {}
function t.new(p1) --[[ new | Line: 206 | Upvalues: t (copy), v2 (copy), t3 (ref) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.Config = p1
	v22.Offset = v22.Config.Offset or Vector3.new(0, 0, 0)
	if p1.DistanceTransparency then
		local v3
		if typeof(p1.DistanceTransparency) == "table" then
			v3 = p1.DistanceTransparency
		else
			v3 = {
				MinDistance = 15
			}
			v3.MaxDistance = type(p1.DistanceTransparency) == "number" and p1.DistanceTransparency or 100
			if not v3 then
				v3 = p1.DistanceTransparency
			end
		end
		v22.DistanceTransparency = v3
		for v5, v6 in { "MaxDistance", "MinDistance" } do
			if not v22.DistanceTransparency[v6] then
				v22.DistanceTransparency[v6] = if v6 == "MaxDistance" then 100 else 15
			end
		end
	end
	v22.Attachments = {}
	v22.Beams = v22:_createBeams()
	v22:_applyColors()
	if v22.Config.FadeIn then
		v22:_fadeIn()
	end
	if v22.Config.Player then
		v22.Player = v22.Config.Player
		v22:_bindToPlayerCharacter()
	end
	t3[v22] = true
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 244 | Upvalues: t3 (ref), v1 (copy) ]]
	if p1.Config.FadeOut then
		task.spawn(function() --[[ Line: 251 | Upvalues: p1 (copy), t3 (ref), v1 (ref) ]]
			p1:_fadeOut()
			t3[p1] = nil
			v1(p1)
		end)
	else
		t3[p1] = nil
		v1(p1)
	end
end
function t._getAttachmentPosition(p1, p2, p3) --[[ _getAttachmentPosition | Line: 258 ]]
	if typeof(p2) == "Vector3" then
		return p2 + p1.Offset
	end
	if not p2:IsA("BasePart") then
		return p2.Position
	end
	return (if p3 and p1.Config.CenterOfPart then Vector3.new(0, 0, 0) else Vector3.new(0, p2.Size.Y / 2, 0)) + p1.Offset
end
function t._getAttachmentParent(p1, p2) --[[ _getAttachmentParent | Line: 273 ]]
	if typeof(p2) == "Instance" then
		return p2
	else
		return workspace.Terrain
	end
end
function t._createBeams(p1) --[[ _createBeams | Line: 281 | Upvalues: v3 (copy), v4 (copy) ]]
	local t = {}
	local Beam = p1.Config.Beam
	if typeof(Beam) == "string" then
		Beam = v3.GetAsset(Beam, "Beams")()
	end
	if not Beam then
		Beam = v3.GetAsset("Default", "Beams")()
	end
	if not Beam:IsA("Beam") and (Beam:FindFirstChild("AttachmentA") and (Beam:FindFirstChild("AttachmentB") and Beam:FindFirstChild("AttachmentC"))) then
		p1.IsPathingArrow = true
	end
	for v5, v6 in { "0", "1" } do
		local v42
		local v7 = v6 == "0" and p1.Config.Start or p1.Config.End
		if typeof(v7) == "Instance" and v7:IsA("Attachment") then
			v42 = v7
		else
			local Attachment = Instance.new("Attachment")
			Attachment.Name = "BeamAttachment" .. v6
			Attachment.Parent = p1:_getAttachmentParent(v7)
			p1.Maid:GiveTask(Attachment)
			v42 = Attachment
		end
		v42.Position = p1:_getAttachmentPosition(v7, if v6 == "1" then true else false)
		p1["Attachment" .. v6] = v42
		if v6 == "0" then
			p1.BaseStartParent = v42.Parent
			p1.BaseStartLocalPosition = v42.Position
		end
	end
	if p1.IsPathingArrow then
		local v9 = Beam:Clone()
		v9.Parent = workspace.Terrain
		p1.Maid:GiveTask(v9)
		p1.AttachmentA = v9:FindFirstChild("AttachmentA")
		p1.AttachmentB = v9:FindFirstChild("AttachmentB")
		p1.AttachmentC = v9:FindFirstChild("AttachmentC")
		for v10, v11 in v9:GetDescendants() do
			if v11:IsA("Beam") then
				local t2 = {
					Instance = v11
				}
				if p1.DistanceTransparency then
					t2.StartTransparency = v11.Transparency
					t2.EndTransparency = v4.normalizeToConstant(t2.StartTransparency, 1)
				end
				table.insert(t, t2)
			end
		end
		p1.PathingStartOffset = p1.Config.StartOffset or 2
		p1.PathingMaxMidDistance = p1.Config.MaxMidDistance or 16
		p1.BillboardGui = v9:FindFirstChildWhichIsA("BillboardGui")
		if p1.BillboardGui then
			p1.BillboardGui.Enabled = false
		end
		p1.BillboardAnimationDisabled = if p1.Config.BillboardAnimation == false then true else false
		p1.CustomBillboardAnimation = type(p1.Config.BillboardAnimation) == "function" and p1.Config.BillboardAnimation or nil
	else
		local function createBeam(p12) --[[ createBeam | Line: 361 | Upvalues: p1 (copy), v4 (ref), t (copy) ]]
			local t2 = {}
			local v1 = p12:Clone()
			t2.Instance = v1
			if p1.DistanceTransparency then
				t2.StartTransparency = t2.Instance.Transparency
				t2.EndTransparency = v4.normalizeToConstant(t2.StartTransparency, 1)
			end
			v1.Attachment0 = p1.Attachment0
			v1.Attachment1 = p1.Attachment1
			v1.Parent = v1.Attachment0.Parent
			p1.Maid:GiveTask(v1)
			table.insert(t, t2)
		end
		if Beam:IsA("Beam") then
			createBeam(Beam)
			return t
		end
		for v14, v15 in Beam:GetChildren() do
			if v15:IsA("Beam") then
				createBeam(v15)
			end
		end
	end
	return t
end
function t._canShow(p1) --[[ _canShow | Line: 394 ]]
	return (not p1.Config.CanShow or p1.Config.CanShow()) and true or false
end
function t._updatePathingArrowPositions(p1) --[[ _updatePathingArrowPositions | Line: 402 ]]
	local WorldPosition = p1.Attachment0.WorldPosition
	local WorldPosition_2 = p1.Attachment1.WorldPosition
	local Magnitude = (WorldPosition_2 - WorldPosition).Magnitude
	if not (Magnitude < 0.1) then
		p1.AttachmentA.WorldPosition = (CFrame.lookAt(WorldPosition, WorldPosition_2) * CFrame.new(0, 0, -p1.PathingStartOffset)).Position
		local v1 = CFrame.lookAt(p1.AttachmentA.WorldPosition, WorldPosition_2)
		p1.AttachmentB.WorldPosition = (v1 * CFrame.new(0, 0, -math.min(Magnitude - p1.PathingStartOffset, p1.PathingMaxMidDistance))).Position
		p1.AttachmentC.WorldPosition = WorldPosition_2
	end
end
function t._getStartWorldPosition(p1) --[[ _getStartWorldPosition | Line: 416 ]]
	local BaseStartParent = p1.BaseStartParent
	local BaseStartLocalPosition = p1.BaseStartLocalPosition
	if not (BaseStartParent and BaseStartLocalPosition) then
		return nil
	end
	if BaseStartParent:IsA("BasePart") then
		return BaseStartParent.CFrame:PointToWorldSpace(BaseStartLocalPosition)
	else
		return BaseStartLocalPosition
	end
end
function t._applyStartOffset(p1) --[[ _applyStartOffset | Line: 428 ]]
	if not p1.Config.StartOffset or p1.IsPathingArrow then
		return
	end
	if not (p1.Attachment0 and p1.Attachment1) then
		return
	end
	local v1 = p1:_getStartWorldPosition()
	if not v1 then
		return
	end
	local v2 = p1.Attachment1.WorldPosition - v1
	if not (v2.Magnitude < 0.001) then
		p1.Attachment0.WorldPosition = v1 + v2.Unit * p1.Config.StartOffset
	end
end
function t._startBillboardAnimation(p1) --[[ _startBillboardAnimation | Line: 450 ]]
	if p1.BillboardGui and not p1.BillboardAnimationDisabled then
		p1.Maid.BillboardAnimation = task.spawn(function() --[[ Line: 455 | Upvalues: p1 (copy) ]]
			if p1.CustomBillboardAnimation then
				p1.CustomBillboardAnimation(p1.BillboardGui)
			else
				p1:_defaultBillboardAnimation()
			end
		end)
	end
end
function t._defaultBillboardAnimation(p1) --[[ _defaultBillboardAnimation | Line: 464 | Upvalues: TweenService (copy) ]]
	local v1 = p1.BillboardGui:FindFirstChildWhichIsA("ImageLabel")
	if not v1 then
		return
	end
	local v2 = TweenInfo.new(0.1)
	while true do
		TweenService:Create(v1, v2, {
			Rotation = 10
		}):Play()
		task.wait(0.2)
		TweenService:Create(v1, v2, {
			Rotation = -10
		}):Play()
		task.wait(0.1)
		TweenService:Create(v1, v2, {
			Rotation = 0
		}):Play()
		task.wait(0.1)
		task.wait(2)
	end
end
function t._stopBillboardAnimation(p1) --[[ _stopBillboardAnimation | Line: 484 ]]
	p1.Maid.BillboardAnimation = nil
end
function t._applyColors(p1) --[[ _applyColors | Line: 488 | Upvalues: t2 (copy) ]]
	local Color = p1.Config.Color
	if not Color then
		return
	end
	local v1 = type(Color) == "table"
	local function getColor(p1) --[[ getColor | Line: 496 | Upvalues: v1 (copy), Color (copy) ]]
		if not v1 then
			return Color
		end
		return Color[p1] or Color.Default
	end
	for v2, v3 in p1.Beams do
		local v5 = if v1 then Color[v3.Instance.Name] or Color.Default else Color
		if v5 then
			v3.Instance.Color = if typeof(v5) == "Color3" then ColorSequence.new(v5) else v5
		end
	end
	if not p1.BillboardGui then
		return
	end
	for v8, v9 in p1.BillboardGui:GetDescendants() do
		if v9:HasTag("Recolor") then
			local v10 = t2[v9.ClassName]
			if v10 then
				local v12 = if v1 then Color[v9.Name] or Color.Default else Color
				if v12 then
					v9[v10] = if typeof(v12) == "ColorSequence" then v12.Keypoints[1].Value else v12
				end
			end
		end
	end
end
function t._fadeIn(p1) --[[ _fadeIn | Line: 525 | Upvalues: v6 (copy), v4 (copy), v5 (copy) ]]
	p1.FadeInComplete = false
	local v1 = type(p1.Config.FadeIn) == "number" and p1.Config.FadeIn or 2
	for v2, v3 in p1.Beams do
		local v42 = v6.GetProperties(v3.Instance, { "Transparency" })
		v3.Instance.Transparency = v4.setNumberSequenceValue(v3.Instance.Transparency, 1)
		v5.target(v3.Instance, 1, v1, v42)
		v5.completed(v3.Instance, function() --[[ Line: 534 | Upvalues: p1 (copy) ]]
			p1.FadeInComplete = true
		end)
	end
	if not p1.BillboardGui then
		return
	end
	local v52 = v6.GetPropertiesOfDescendants(p1.BillboardGui, {
		ImageLabel = { "ImageTransparency" },
		ImageButton = { "ImageTransparency" },
		TextLabel = { "TextTransparency" },
		TextButton = { "TextTransparency" }
	})
	v6.SetPropertiesOfDescendants(p1.BillboardGui, {
		ImageLabel = {
			ImageTransparency = 1
		},
		ImageButton = {
			ImageTransparency = 1
		},
		TextLabel = {
			TextTransparency = 1
		},
		TextButton = {
			TextTransparency = 1
		}
	})
	for v62, v7 in v52 do
		v5.target(v62, 1, v1, v7)
	end
end
function t._fadeOut(p1) --[[ _fadeOut | Line: 560 | Upvalues: v5 (copy), v4 (copy), v6 (copy) ]]
	p1.FadingOut = true
	local v1 = type(p1.Config.FadeOut) == "number" and p1.Config.FadeOut or 2
	for v3, v42 in p1.Beams do
		v5.target(v42.Instance, 1, v1, {
			Transparency = v4.setNumberSequenceValue(v42.Instance.Transparency, 1)
		})
	end
	if p1.BillboardGui then
		for v52, v62 in v6.CreateDescendantPropertyMap(p1.BillboardGui, {
			ImageLabel = {
				ImageTransparency = 1
			},
			ImageButton = {
				ImageTransparency = 1
			},
			TextLabel = {
				TextTransparency = 1
			},
			TextButton = {
				TextTransparency = 1
			}
		}) do
			v5.target(v52, 1, v1, v62)
		end
	end
	task.wait(4 / v1)
end
function t.UpdatePosition(p1, p2) --[[ UpdatePosition | Line: 585 ]]
	local v2 = if p2 then p2 else {}
	for v3, v4 in { "0", "1" } do
		local v5 = if v4 == "0" then "Start" else "End"
		local v6 = v2[v5]
		if v6 ~= nil then
			p1.Config[v5] = v6
		end
		local v7 = if v6 then v6 else p1.Config[v5]
		local v8 = p1["Attachment" .. v4]
		if v8 then
			v8.Position = p1:_getAttachmentPosition(v7, v4 == "1")
			v8.Parent = p1:_getAttachmentParent(v7)
		end
	end
end
function t.UpdateTransparency(p1, p2) --[[ UpdateTransparency | Line: 606 | Upvalues: v4 (copy) ]]
	if p1.FadeInComplete == false then
		return
	end
	if p1.FadingOut == true then
		return
	end
	if not p2 then
		p2 = math.clamp((p1.DistanceTransparency.MaxDistance - (p1.Attachment0.WorldPosition - p1.Attachment1.WorldPosition).Magnitude) / (p1.DistanceTransparency.MaxDistance - p1.DistanceTransparency.MinDistance), 0, 1)
	end
	for v3, v42 in p1.Beams do
		v42.Instance.Transparency = v4.interpolateNumberSequences(v42.StartTransparency, v42.EndTransparency, p2)
	end
end
function t.Update(p1) --[[ Update | Line: 625 ]]
	if p1.IsPathingArrow then
		p1:_updatePathingArrowPositions()
	else
		p1:_applyStartOffset()
	end
	local v1 = p1:_canShow()
	if v1 then
		for v2, v3 in p1.Beams do
			v3.Instance.Enabled = true
		end
		if p1.DistanceTransparency then
			p1:UpdateTransparency()
		end
	else
		for v4, v5 in p1.Beams do
			v5.Instance.Enabled = false
		end
	end
	if not p1.BillboardGui then
		return
	end
	if v1 and not p1.BillboardGui.Enabled then
		p1.BillboardGui.Enabled = true
		p1:_startBillboardAnimation()
		return
	end
	if v1 or not p1.BillboardGui.Enabled then
		return
	end
	p1.BillboardGui.Enabled = false
	p1:_stopBillboardAnimation()
end
function t._rebuildStartAttachment(p1, p2) --[[ _rebuildStartAttachment | Line: 659 ]]
	local BeamAttachment0 = Instance.new("Attachment")
	BeamAttachment0.Name = "BeamAttachment0"
	BeamAttachment0.Parent = p2
	BeamAttachment0.Position = p1:_getAttachmentPosition(p2, false)
	p1.Maid:GiveTask(BeamAttachment0)
	p1.Attachment0 = BeamAttachment0
	p1.Config.Start = p2
	p1.BaseStartParent = BeamAttachment0.Parent
	p1.BaseStartLocalPosition = BeamAttachment0.Position
	if p1.IsPathingArrow then
		return
	end
	for v1, v2 in p1.Beams do
		v2.Instance.Attachment0 = BeamAttachment0
		v2.Instance.Parent = BeamAttachment0.Parent
	end
end
function t._bindToPlayerCharacter(p1) --[[ _bindToPlayerCharacter | Line: 679 ]]
	local Player = p1.Player
	if Player then
		local function handleCharacter(p12) --[[ handleCharacter | Line: 685 | Upvalues: p1 (copy), Player (copy) ]]
			if p12 then
				local HumanoidRootPart = p12:WaitForChild("HumanoidRootPart", 10)
				if HumanoidRootPart and Player.Character == p12 then
					p1:_rebuildStartAttachment(HumanoidRootPart)
				end
			else
				for v1, v2 in p1.Beams do
					v2.Instance.Enabled = false
				end
			end
		end
		p1.Maid:GiveTask(Player:GetPropertyChangedSignal("Character"):Connect(function() --[[ Line: 701 | Upvalues: handleCharacter (copy), Player (copy) ]]
			handleCharacter(Player.Character)
		end))
	end
end
function t.FromPlayer(p1, p2) --[[ FromPlayer | Line: 706 | Upvalues: t (copy) ]]
	p2.Start = (p1.Character or p1.CharacterAdded:Wait()).PrimaryPart
	p2.Player = p1
	return t.Create(p2)
end
function t.FromLocalPlayer(...) --[[ FromLocalPlayer | Line: 716 | Upvalues: t (copy), Players (copy) ]]
	return t.FromPlayer(Players.LocalPlayer, ...)
end
function t.Create(...) --[[ Create | Line: 720 | Upvalues: t (copy) ]]
	return t.new(...)
end
function t.ClearBeams() --[[ ClearBeams | Line: 724 | Upvalues: t3 (ref) ]]
	for v1 in t3 do
		v1:Destroy()
	end
	t3 = {}
end
function t.Init(p1) --[[ Init | Line: 731 | Upvalues: RunService (copy), t3 (ref) ]]
	RunService.Heartbeat:Connect(function() --[[ Line: 732 | Upvalues: t3 (ref) ]]
		for v1 in t3 do
			v1:Update()
		end
	end)
end
t:Init()
return t