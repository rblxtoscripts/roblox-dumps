-- https://lua.expert/
local v1 = require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local v2 = script.Parent
local Canvas = v2:WaitForChild("Canvas")
local Colors = v2:WaitForChild("Colors")
local Save = v2:WaitForChild("Save")
local Load = v2:WaitForChild("Load")
local New = v2:WaitForChild("New")
local Title = v2:WaitForChild("Title")
local LoadWindow = v2:WaitForChild("LoadWindow")
local Template = LoadWindow:WaitForChild("Template")
local CloseMessage = v2:WaitForChild("BanMessage"):WaitForChild("CloseMessage")
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local Dialog = require(game.ReplicatedStorage:WaitForChild("Dialog"))
local v3 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local v4 = GuiManager:RegisterWindow(v2, "Left", "Right", nil, nil, true)
local v5 = Canvas.AbsoluteSize.X / 8
local v6 = nil
local v7 = nil
local v8 = nil
local v9 = nil
local v10 = nil
local v11 = nil
local v12 = nil
local v13 = nil
local v14 = Color3.new(255/255, 255/255, 255/255)
local t = {}
local v15 = v1:SendData("GetProjectsList", "PlayerChannel", 10)
function round(p1, p2) --[[ round | Line: 37 ]]
	return math.floor(p1 / p2 + 0.5) * p2
end
local function ClearCanvas() --[[ ClearCanvas | Line: 42 | Upvalues: Canvas (copy), t (ref) ]]
	Canvas:ClearAllChildren()
	t = {}
end
local function LoadWindowVisible(p1) --[[ LoadWindowVisible | Line: 47 | Upvalues: Canvas (copy), LoadWindow (copy), New (copy), Save (copy), Load (copy), Colors (copy) ]]
	Canvas.Visible = not p1
	LoadWindow.Visible = p1
	New.Visible = p1
	Save.Visible = not p1
	Load.Visible = not p1
	Colors.Visible = not p1
end
local function SetPixel(p1, p2) --[[ SetPixel | Line: 57 | Upvalues: v5 (copy), t (ref), v14 (ref), Canvas (copy) ]]
	local v1 = round(p1, v5)
	local v2 = round(p2, v5)
	local v3 = tostring(v1) .. "/" .. tostring(v2)
	if not t[v3] and v14 then
		t[v3] = Instance.new("Frame")
		t[v3].BackgroundColor3 = v14
		t[v3].BorderSizePixel = 0
		t[v3].Position = UDim2.new(0, v1, 0, v2)
		t[v3].Size = UDim2.new(0, v5, 0, v5)
		t[v3].Parent = Canvas
		return
	end
	if t[v3] and v14 then
		t[v3].BackgroundColor3 = v14
		return
	end
	if not t[v3] or v14 then
		return
	end
	t[v3]:Destroy()
	t[v3] = nil
end
local v16 = 0
local v17 = 0
local function LoadPaintData(p1) --[[ LoadPaintData | Line: 87 | Upvalues: Canvas (copy), t (ref), v14 (ref), SetPixel (copy), v16 (ref), v17 (ref), v5 (copy) ]]
	if not p1 then
		return
	end
	Canvas:ClearAllChildren()
	t = {}
	for v1 in string.gmatch(p1, "%P+") do
		v14 = if v1 == " " then nil else BrickColor.new((tonumber(v1))).Color
		SetPixel(v16, v17)
		if 8 * v5 - v5 <= v16 then
			v16 = 0
			v17 = v17 + v5
			continue
		end
		v16 = v16 + v5
	end
	v16 = 0
	v17 = 0
	v14 = Color3.new(255/255, 255/255, 255/255)
end
local function EncodePaintData() --[[ EncodePaintData | Line: 118 | Upvalues: v5 (copy), t (ref) ]]
	local v1 = ""
	for i = 0, 8 * v5 - v5, v5 do
		for j = 0, 8 * v5 - v5, v5 do
			local v2 = t[tostring(j) .. "/" .. tostring(i)]
			if v2 then
				local Number = BrickColor.new(v2.BackgroundColor3).Number
				v1 = v1 .. tostring(Number) .. ","
				continue
			end
			v1 = v1 .. " ,"
		end
	end
	return v1
end
local function SaveProject() --[[ SaveProject | Line: 134 | Upvalues: v6 (ref), v1 (copy), EncodePaintData (copy) ]]
	if v6 == nil then
		return
	end
	v1:SendData("SaveCanvasProject", "PlayerChannel", 10, v6, (EncodePaintData()))
end
local function LoadProject(p1) --[[ LoadProject | Line: 140 | Upvalues: v6 (ref), Title (copy), Canvas (copy), LoadWindow (copy), New (copy), Save (copy), Load (copy), Colors (copy), v1 (copy), LoadPaintData (copy) ]]
	v6 = p1
	Title.Text = p1
	Canvas.Visible = true
	LoadWindow.Visible = false
	New.Visible = false
	Save.Visible = true
	Load.Visible = true
	Colors.Visible = true
	LoadPaintData((v1:SendData("LoadCanvasProject", "PlayerChannel", 10, p1)))
end
local t2 = {}
local function v18() --[[ RefreshProjectsList | Line: 150 | Upvalues: v15 (copy), t2 (copy), Template (copy), v6 (ref), v1 (copy), EncodePaintData (copy), Title (copy), Canvas (copy), LoadWindow (copy), New (copy), Save (copy), Load (copy), Colors (copy), LoadPaintData (copy), t (ref), v18 (copy) ]]
	for i, v in ipairs(v15) do
		if not t2[i] then
			t2[i] = Template:clone()
			t2[i].Visible = true
			t2[i].ProjectName.Text = v
			t2[i].ProjectName.MouseButton1Click:connect(function() --[[ Line: 156 | Upvalues: v6 (ref), v1 (ref), EncodePaintData (ref), v (copy), Title (ref), Canvas (ref), LoadWindow (ref), New (ref), Save (ref), Load (ref), Colors (ref), LoadPaintData (ref) ]]
				if v6 ~= nil then
					v1:SendData("SaveCanvasProject", "PlayerChannel", 10, v6, (EncodePaintData()))
				end
				v6 = v
				Title.Text = v
				Canvas.Visible = true
				LoadWindow.Visible = false
				New.Visible = false
				Save.Visible = true
				Load.Visible = true
				Colors.Visible = true
				LoadPaintData((v1:SendData("LoadCanvasProject", "PlayerChannel", 10, v)))
			end)
			t2[i].Delete.MouseButton1Click:connect(function() --[[ Line: 160 | Upvalues: v (copy), v6 (ref), Title (ref), Canvas (ref), t (ref), t2 (ref), i (copy), v15 (ref), v1 (ref), v18 (ref) ]]
				if v ~= v6 then
					t2[i]:Destroy()
					table.remove(t2, i)
					table.remove(v15, i)
					v1:SendData("DeleteCanvasProject", "PlayerChannel", nil, v)
					v18()
					return
				end
				v6 = nil
				Title.Text = ""
				Canvas:ClearAllChildren()
				t = {}
				t2[i]:Destroy()
				table.remove(t2, i)
				table.remove(v15, i)
				v1:SendData("DeleteCanvasProject", "PlayerChannel", nil, v)
				v18()
			end)
			t2[i].Parent = LoadWindow
		end
		t2[i].Position = UDim2.new(0, 0, 0, (i - 1) * Template.Size.Y.Offset)
		LoadWindow.CanvasSize = UDim2.new(0, 0, 0, i * Template.Size.Y.Offset)
	end
end
local t3 = {}
local v19 = false
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 183 | Upvalues: v2 (copy), v18 (copy), v7 (ref), Canvas (copy), SetPixel (copy), v5 (copy), v9 (ref), v8 (ref), v13 (ref), CloseMessage (copy), v11 (ref), Save (copy), v6 (ref), v1 (copy), EncodePaintData (copy), v19 (ref), v10 (ref), New (copy), v15 (copy), Dialog (copy), Title (copy), t (ref), LoadWindow (copy), Load (copy), Colors (copy), v12 (ref), t3 (ref), v14 (ref) ]]
	if p1 ~= v2 then
		return
	end
	if p2 then
		v18()
		local v16 = false
		v7 = Canvas.InputBegan:connect(function(p1, p2) --[[ Line: 191 | Upvalues: SetPixel (ref), v5 (ref), Canvas (ref), v16 (ref) ]]
			if p1.UserInputType ~= Enum.UserInputType.MouseButton1 and p1.UserInputType ~= Enum.UserInputType.Touch then
				return
			end
			SetPixel(p1.Position.X - v5 / 2 - Canvas.AbsolutePosition.X, p1.Position.Y - v5 / 2 - Canvas.AbsolutePosition.Y)
			v16 = true
		end)
		v9 = Canvas.InputChanged:connect(function(p1, p2) --[[ Line: 198 | Upvalues: v16 (ref), SetPixel (ref), v5 (ref), Canvas (ref) ]]
			if not v16 or p1.UserInputType ~= Enum.UserInputType.MouseMovement and p1.UserInputType ~= Enum.UserInputType.Touch then
				return
			end
			SetPixel(p1.Position.X - v5 / 2 - Canvas.AbsolutePosition.X, p1.Position.Y - v5 / 2 - Canvas.AbsolutePosition.Y)
		end)
		v8 = Canvas.InputEnded:connect(function(p1, p2) --[[ Line: 204 | Upvalues: v16 (ref) ]]
			if p1.UserInputType ~= Enum.UserInputType.MouseButton1 and p1.UserInputType ~= Enum.UserInputType.Touch then
				return
			end
			v16 = false
		end)
		v13 = CloseMessage.MouseButton1Click:connect(function() --[[ Line: 213 | Upvalues: CloseMessage (ref), v13 (ref) ]]
			CloseMessage.Parent:Destroy()
			v13:disconnect()
		end)
		v11 = Save.MouseButton1Click:connect(function() --[[ Line: 221 | Upvalues: v6 (ref), v1 (ref), EncodePaintData (ref), v19 (ref) ]]
			if v6 == nil then
				v19 = true
				return
			end
			v1:SendData("SaveCanvasProject", "PlayerChannel", 10, v6, (EncodePaintData()))
			v19 = true
		end)
		v10 = New.MouseButton1Click:connect(function() --[[ Line: 228 | Upvalues: v15 (ref), Dialog (ref), v6 (ref), v1 (ref), EncodePaintData (ref), Title (ref), Canvas (ref), t (ref), LoadWindow (ref), New (ref), Save (ref), Load (ref), Colors (ref) ]]
			if #v15 >= 30 then
				Dialog:ShowMessage("Too many saved paintings", "You have reached the limit of 30 saved paintings. You must delete a painting to save a new one.")
				return
			end
			if v6 ~= nil then
				v1:SendData("SaveCanvasProject", "PlayerChannel", 10, v6, (EncodePaintData()))
			end
			if _G.CanChat then
				v6 = game.Workspace.MessageService.GetShortString.GetShortString:Invoke("EnterNameOfPainting1", "None")
				game:GetService("HttpService"):JSONEncode(v6)
			else
				local v12 = 1
				for i, v in ipairs(v15) do
					local v3 = tonumber((string.sub(v, 8)))
					if v3 and v12 < v3 then
						v12 = v3
					end
				end
				v6 = "Project" .. v12 + 1
			end
			Title.Text = v6
			table.insert(v15, v6)
			Canvas:ClearAllChildren()
			t = {}
			Canvas.Visible = true
			LoadWindow.Visible = false
			New.Visible = false
			Save.Visible = true
			Load.Visible = true
			Colors.Visible = true
		end)
		v12 = Load.MouseButton1Click:connect(function() --[[ Line: 262 | Upvalues: v18 (ref), Canvas (ref), LoadWindow (ref), New (ref), Save (ref), Load (ref), Colors (ref) ]]
			v18()
			Canvas.Visible = false
			LoadWindow.Visible = true
			New.Visible = true
			Save.Visible = false
			Load.Visible = false
			Colors.Visible = false
		end)
		local v22 = nil
		for i, v in ipairs(Colors:GetChildren()) do
			local function f4() --[[ Line: 272 | Upvalues: v22 (ref), v (copy), v14 (ref) ]]
				if v22 then
					v22.BorderSizePixel = 0
				end
				v22 = v.TextButton
				v22.BorderSizePixel = 1
				v22.BorderColor3 = Color3.new(255/255, 255/255, 255/255)
				v14 = v22.BackgroundColor3
				if v.Name ~= "X" then
					return
				end
				v14 = nil
			end
			table.insert(t3, v.TextButton.MouseButton1Click:connect(f4))
		end
	else
		v19 = true
		v7:disconnect()
		v8:disconnect()
		v9:disconnect()
		v10:disconnect()
		v12:disconnect()
		v11:disconnect()
		workspace.Main.ConfigEnded:Fire()
		if v13 then
			v13:disconnect()
		end
		for i, v in ipairs(t3) do
			v:disconnect()
		end
		t3 = {}
	end
end)
debounce = false
local function OnClientInvoke(p1) --[[ OnClientInvoke | Line: 325 | Upvalues: v6 (ref), Title (copy), Canvas (copy), LoadWindow (copy), New (copy), Save (copy), Load (copy), Colors (copy), v1 (copy), LoadPaintData (copy), v18 (copy), v19 (ref), v4 (copy) ]]
	if debounce then
		return ""
	end
	debounce = true
	if p1 == "" then
		v6 = nil
		Title.Text = ""
		Canvas.Visible = false
		LoadWindow.Visible = true
		New.Visible = true
		Save.Visible = false
		Load.Visible = false
		Colors.Visible = false
		v18()
	else
		v6 = p1
		Title.Text = p1
		Canvas.Visible = true
		LoadWindow.Visible = false
		New.Visible = false
		Save.Visible = true
		Load.Visible = true
		Colors.Visible = true
		LoadPaintData((v1:SendData("LoadCanvasProject", "PlayerChannel", 10, p1)))
	end
	v19 = false
	v4:SetVisible(true)
	while not v19 do
		wait(0.1)
	end
	debounce = false
	v4:SetVisible(false)
	return v6
end
workspace.Main.EditPainting.OnClientInvoke = OnClientInvoke
spawn(function() --[[ Line: 352 | Upvalues: v3 (copy) ]]
	if v3.IsEnglish() then
		return
	end
	script.Parent.BanMessage.Visible = false
end)