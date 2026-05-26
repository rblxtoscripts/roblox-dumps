-- https://lua.expert/
Tool = script.Parent
Handle = Tool:WaitForChild("Handle")
Players = game:GetService("Players")
Debris = game:GetService("Debris")
BasePart = Instance.new("Part")
BasePart.Material = Enum.Material.Plastic
BasePart.TopSurface = Enum.SurfaceType.Smooth
BasePart.BottomSurface = Enum.SurfaceType.Smooth
BasePart.FormFactor = Enum.FormFactor.Custom
BasePart.Locked = true
BasePart.CanCollide = true
BasePart.Anchored = false
ValidKeys = { "z", "x", "c", "v", "b", "n", "m" }
MinNotes = 2
MaxNotes = 8
CurrentString = {}
LightningRadius = 60
InRiff = false
Rate = 1 / 60
Module = {}
function LightningStrike(p1, p2) --[[ LightningStrike | Line: 29 ]]
	local unit = (p2 - p1).unit
	local sum = 0
	local list = { p1 }
	while (p1 - p2).magnitude - sum > 7 do
		sum = sum + (math.random() * 4 + 3)
		table.insert(list, p1 + sum * unit + Vector3.new(math.random(), math.random(), math.random()))
		wait(Rate)
	end
	table.insert(list, p2)
	local LightningModel = Instance.new("Model")
	LightningModel.Name = "LightningModel"
	Debris:AddItem(LightningModel, 5)
	LightningModel.Parent = game:GetService("Workspace")
	for i, v in ipairs(list) do
		local v4 = BasePart:Clone()
		v4.BrickColor = BrickColor.new("Hot pink")
		v4.Transparency = 0.3
		v4.Anchored = true
		v4.CanCollide = false
		local CylinderMesh = Instance.new("CylinderMesh")
		CylinderMesh.Scale = Vector3.new(0.5, 1, 0.5)
		CylinderMesh.Parent = v4
		if list[i + 1] then
			v4.Size = Vector3.new(0.5, (v - list[i + 1]).magnitude, 0.5)
			v4.CFrame = CFrame.new((v + list[i + 1]) / 2, list[i + 1]) * CFrame.Angles(1.5707963267948966, 0, 0)
			Debris:AddItem(v4, 1)
			v4.Parent = LightningModel
			wait(Rate)
		end
	end
end
function DoLightning(p1, p2, p3) --[[ DoLightning | Line: 74 ]]
	for k, v in pairs(Players:GetChildren()) do
		if v:IsA("Player") and (not p2[v] and v ~= p3) then
			local Character = v.Character
			if Character then
				local Humanoid = Character:FindFirstChild("Humanoid")
				local Torso = Character:FindFirstChild("Torso")
				if Humanoid and (Humanoid.Health > 0 and (Torso and (Torso.Position - p1).magnitude < LightningRadius)) then
					p2[v] = true
					Spawn(function() --[[ Line: 83 | Upvalues: p1 (copy), Torso (copy) ]]
						LightningStrike(p1, Torso.Position)
					end)
					DoLightning(Handle.Position, p2, p3)
					return true
				end
			end
		end
	end
	return false
end
function CreateGui() --[[ CreateGui | Line: 96 ]]
	local NoteGui = Instance.new("ScreenGui")
	NoteGui.Name = "NoteGui"
	local Frame = Instance.new("Frame")
	Frame.Position = UDim2.new(0, 0, 1, -95)
	Frame.Size = UDim2.new(0, 260, 0, 55)
	Frame.BackgroundColor3 = Color3.new(0/255, 0/255, 0/255)
	Frame.BorderSizePixel = 0
	Frame.ClipsDescendants = true
	Frame.Parent = NoteGui
	local Marker = Instance.new("Frame")
	Marker.Name = "Marker"
	Marker.Position = UDim2.new(0, 75, 0, 0)
	Marker.Size = UDim2.new(0, 5, 1, 0)
	Marker.BackgroundColor3 = Color3.new(251/255, 255/255, 12/255)
	Marker.BorderSizePixel = 0
	Marker.ZIndex = 3
	Marker.Parent = Frame
	local TemplateNote = Instance.new("TextButton")
	TemplateNote.Name = "TemplateNote"
	TemplateNote.Position = UDim2.new(0, 0, 0, 0)
	TemplateNote.Size = UDim2.new(0, 30, 0, 30)
	TemplateNote.Font = Enum.Font.ArialBold
	TemplateNote.FontSize = Enum.FontSize.Size36
	TemplateNote.BackgroundColor3 = Color3.new(255/255, 0/255, 255/255)
	TemplateNote.TextColor3 = Color3.new(0/255, 0/255, 0/255)
	TemplateNote.TextXAlignment = Enum.TextXAlignment.Center
	TemplateNote.TextYAlignment = Enum.TextYAlignment.Center
	TemplateNote.ZIndex = 2
	TemplateNote.AutoButtonColor = false
	TemplateNote.Visible = false
	return {
		NoteGui = NoteGui,
		Frame = Frame,
		Marker = Marker,
		TemplateNote = TemplateNote
	}
end
function MakeNote(p1) --[[ MakeNote | Line: 130 ]]
	local v1 = ValidKeys[math.random(#ValidKeys)]
	local v2 = CreateGui().TemplateNote:Clone()
	v2.Text = string.upper(v1)
	v2.Visible = true
	return {
		Hit = false,
		Missed = false,
		Frame = v2,
		Key = v1
	}
end
function SetupNoteString(p1) --[[ SetupNoteString | Line: 145 ]]
	for k, v in pairs(CurrentString) do
		if v and (v.Frame and v.Frame.Parent) then
			v.Frame:Destroy()
		end
	end
	InRiff = false
	CurrentString = {}
	local v1 = math.random(MinNotes, MaxNotes)
	FirstNote = nil
	LastNote = nil
	for i = 1, v1 do
		local v2
		local v3 = MakeNote(p1)
		v3.Frame.Position = UDim2.new(0, (LastNote and LastNote.Frame.Position.X.Offset + v3.Frame.Size.X.Offset or p1.Marker.Position.X.Offset + p1.Marker.Size.X.Offset) + math.random(5, 30), 0.25, 0)
		v2 = if FirstNote or not v3 then FirstNote else v3
		FirstNote = v2
		LastNote = v3
		v3.Frame.Parent = p1.Frame
		table.insert(CurrentString, v3)
	end
end
function MarkFrame(p1, p2, p3) --[[ MarkFrame | Line: 167 ]]
	if p2.Missed then
		return
	end
	local Frame = p2.Frame
	if p1.Marker.Position.X.Offset + p1.Marker.Size.X.Offset / 2 >= Frame.Position.X.Offset and p1.Marker.Position.X.Offset + p1.Marker.Size.X.Offset / 2 < Frame.Position.X.Offset + Frame.Size.X.Offset then
		if p3 and p3 == p2.Key then
			p2.Hit = true
		elseif p3 then
			p2.Hit = false
			p2.Missed = true
		end
	elseif not (p1.Marker.Position.X.Offset + p1.Marker.Size.X.Offset / 2 < Frame.Position.X.Offset) and (p3 and p3 ~= p2.Key or p1.Marker.Position.X.Offset > Frame.Position.X.Offset + Frame.Size.X.Offset) then
		p2.Missed = true
	end
	Frame.BackgroundColor3 = p2.Hit and BrickColor.new("New Yeller").Color or (p2.Missed and BrickColor.new("Really red").Color or Frame.BackgroundColor3)
end
function HandleLightning(p1, p2, p3) --[[ HandleLightning | Line: 187 ]]
	if InRiff or p2 ~= "Start" then
		if not InRiff then
			return
		end
		local v1 = false
		for k, v in pairs(ValidKeys) do
			if string.lower(v) == string.lower(p2) then
				v1 = true
			end
		end
		if not v1 then
			return
		end
		for k, v in pairs(CurrentString) do
			MarkFrame(p1, v, p2)
		end
	else
		InRiff = true
		local _ = FirstNote.Frame.Position.X.Offset + (LastNote.Frame.Position.X.Offset + LastNote.Frame.Size.X.Offset)
		while p1.NoteGui and (p1.NoteGui.Parent and (LastNote.Frame.Position.X.Offset + LastNote.Frame.Size.X.Offset > 0 and InRiff)) do
			for k, v in pairs(CurrentString) do
				local Frame = v.Frame
				Frame.Position = Frame.Position - UDim2.new(0, 2, 0, 0)
				MarkFrame(p1, v, nil)
			end
			wait(Rate)
		end
		local v2
		if p1.NoteGui and (p1.NoteGui.Parent and InRiff) then
			local t = {
				Success = 0,
				Failure = 0
			}
			for k, v in pairs(CurrentString) do
				if v.Hit then
					t.Success = t.Success + 1
					continue
				end
				if v.Missed then
					t.Failure = t.Failure + 1
				end
			end
			v2 = t.Success / #CurrentString
		else
			v2 = nil
		end
		SetupNoteString(p1)
		InRiff = false
		return v2 and v2 >= 0.75 and true or false
	end
end
function Strike() --[[ Strike | Line: 234 ]]
	for i = 1, math.random(8, 25) do
		Spawn(function() --[[ Line: 238 ]]
			local v1 = LightningStrike
			local Position = Handle.Position
			local Position_2 = Handle.Position
			local v2 = (math.random() - 0.5) * 2
			local v3 = (math.random() - 0.5) * 2
			v1(Position, Position_2 + Vector3.new(v2, v3, (math.random() - 0.5) * 2) * 45)
		end)
	end
end
function EndRiff() --[[ EndRiff | Line: 244 ]]
	InRiff = false
end
return {
	CreateGui = CreateGui,
	MakeNote = MakeNote,
	SetupNoteString = SetupNoteString,
	LightningStrike = LightningStrike,
	EndRiff = EndRiff,
	DoLightning = DoLightning,
	Strike = Strike,
	HandleLightning = HandleLightning
}