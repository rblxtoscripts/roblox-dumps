-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("ButtonTest")
local v3 = Sonar("Button")
local v4 = Sonar("GuiManager")
local v5 = Sonar("Maid")
local v6 = Sonar("PromptClient")
local v7 = Sonar("NotificationsClient")
local v8 = Sonar("spr")
local v9 = Sonar("Constants")
local HorseFolders = v9.HorseFolders
local FolderPrices = v9.FolderPrices
local PlayerGui = game:GetService("Players").LocalPlayer.PlayerGui
local v10 = Sonar("PlayerWrapper").GetClient()
local StablesGui = PlayerGui:WaitForChild("StablesGui")
local FolderContainer = StablesGui.FolderContainer
local FolderButtons = FolderContainer.FolderHeader.FolderButtons
local Locked = FolderContainer.FolderHeader.FolderButtons.Locked
local v11 = FolderContainer.Menu.Content.Colors.Content
local v12 = FolderContainer.Menu.Content.Icons.Content
local v13 = nil
local v14 = nil
local v15 = nil
local t2 = {}
local t3 = {}
local t4 = {}
local function getIconAndColor(p1, p2) --[[ getIconAndColor | Line: 43 | Upvalues: t4 (copy), t3 (copy) ]]
	local v1 = nil
	local v2 = nil
	for v3, v4 in t4 do
		if v4.Frame.BackgroundColor3 == p2 then
			v2 = v4
		end
	end
	for v5, v6 in t3 do
		if v6.ImageLabel.Image == p1 then
			v1 = v6
		end
	end
	return v1, v2
end
local function UpdateFolder(p1, p2) --[[ UpdateFolder | Line: 60 | Upvalues: v10 (copy) ]]
	local v1 = v10.PlayerData.AnimalFolders:FindFirstChild(p2)
	p1.Tab.BackgroundColor3 = Color3.fromRGB(unpack((string.split(v1.Color.Value, ","))))
	p1.Tab.Icon.Image = v1.Icon.Value
end
local function SelectFolder(p1, p2) --[[ SelectFolder | Line: 68 | Upvalues: v15 (ref), v8 (copy), v14 (ref), v13 (ref), v10 (copy), getIconAndColor (copy) ]]
	if v15 and v15 ~= p1 then
		v8.target(v15.Tab, 0.5, 2, {
			Position = UDim2.new(0, 0, 0.2, 0)
		})
	end
	if v14 then
		v14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	end
	if v13 then
		v13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	end
	v15 = p1
	local v1 = v10.PlayerData.AnimalFolders:FindFirstChild(p2)
	local v3, v4 = getIconAndColor(v1.Icon.Value, Color3.fromRGB(unpack((string.split(v1.Color.Value, ",")))))
	v14 = v3
	v13 = v4
	if v4 then
		v4.BackgroundColor3 = Color3.fromRGB(168, 255, 148)
	end
	if not v3 then
		return
	end
	v3.BackgroundColor3 = Color3.fromRGB(168, 255, 148)
end
function t.NewFolder(p1, p2) --[[ NewFolder | Line: 94 | Upvalues: FolderButtons (copy), t2 (copy), v5 (copy), UpdateFolder (copy), v3 (copy), v8 (copy), v15 (ref), SelectFolder (copy), v1 (copy), Locked (copy) ]]
	local v12 = FolderButtons.Template:Clone()
	v12.Parent = FolderButtons
	v12.Name = p1
	v12.Visible = true
	v12.LayoutOrder = tonumber(p1)
	t2[v12] = {
		FolderMaid = v5.new()
	}
	UpdateFolder(v12, p1)
	t2[v12].FolderMaid:GiveTask(v12)
	t2[v12].FolderMaid:GiveTask(v3.new(v12, {
		OnHover = function() --[[ OnHover | Line: 111 | Upvalues: v8 (ref), v12 (copy) ]]
			v8.target(v12.Tab, 0.5, 2, {
				Position = UDim2.new(0, 0, 0, 0)
			})
		end,
		OnLeave = function() --[[ OnLeave | Line: 114 | Upvalues: v15 (ref), v12 (copy), v8 (ref) ]]
			if v15 and v15 == v12 then
				return
			end
			v8.target(v12.Tab, 0.5, 2, {
				Position = UDim2.new(0, 0, 0.2, 0)
			})
		end,
		Click = function() --[[ Click | Line: 119 | Upvalues: SelectFolder (ref), v12 (copy), p1 (copy) ]]
			SelectFolder(v12, p1)
		end
	}))
	if not (v1.GetRemoteFunction("GetNextFolder"):InvokeServer() > 5) then
		return
	end
	Locked.Visible = false
end
function t.DeleteFolder() --[[ DeleteFolder | Line: 131 | Upvalues: v15 (ref), t2 (copy), v1 (copy), Locked (copy) ]]
	if not v15 then
		return
	end
	t2[v15].FolderMaid:DoCleaning()
	t2[v15] = nil
	v15 = nil
	if not (v1.GetRemoteFunction("GetNextFolder"):InvokeServer() <= 5) then
		return
	end
	Locked.Visible = true
end
function t.SaveFolder() --[[ SaveFolder | Line: 146 | Upvalues: v15 (ref), v14 (ref), v13 (ref), v1 (copy), t2 (copy), UpdateFolder (copy) ]]
	if not (v15 and (v14 and v13)) then
		return
	end
	local v12 = v15.Name
	local BackgroundColor3 = v13.Frame.BackgroundColor3
	local Image = v14.ImageLabel.Image
	if not v1.GetRemoteFunction("SetAnimalFolder"):InvokeServer(v12, BackgroundColor3, Image) then
		return
	end
	local v2 = t2[v15]
	v2.Color = BackgroundColor3.R * 255 .. "," .. BackgroundColor3.G * 255 .. "," .. BackgroundColor3.B * 255
	v2.Icon = Image
	UpdateFolder(v15, v12)
end
function t.GetFolders() --[[ GetFolders | Line: 163 | Upvalues: t2 (copy) ]]
	return t2
end
function t.Setup() --[[ Setup | Line: 167 | Upvalues: HorseFolders (copy), v11 (copy), v3 (copy), v15 (ref), v13 (ref), t4 (copy), v12 (copy), v14 (ref), t3 (copy), Locked (copy), v8 (copy), v1 (copy), FolderPrices (copy), v6 (copy), v10 (copy), v7 (copy), t (copy), v2 (copy), FolderContainer (copy) ]]
	for v16, v22 in HorseFolders.Colors do
		local v32 = v11.Template:Clone()
		v32.Frame.BackgroundColor3 = v22
		v32.Parent = v11
		v32.Visible = true
		v3.new(v32, {
			Click = function() --[[ Click | Line: 176 | Upvalues: v15 (ref), v13 (ref), v32 (copy) ]]
				if not v15 then
					return
				end
				if v13 then
					v13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				end
				v13 = v32
				v32.BackgroundColor3 = Color3.fromRGB(168, 255, 148)
			end
		})
		table.insert(t4, v32)
	end
	for v5, v62 in HorseFolders.Icons do
		local v72 = v12.Template:Clone()
		v72.ImageLabel.Image = v62
		v72.Parent = v12
		v72.Visible = true
		v3.new(v72, {
			Click = function() --[[ Click | Line: 199 | Upvalues: v15 (ref), v14 (ref), v72 (copy) ]]
				if not v15 then
					return
				end
				if v14 then
					v14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				end
				v14 = v72
				v72.BackgroundColor3 = Color3.fromRGB(168, 255, 148)
			end
		})
		table.insert(t3, v72)
	end
	v3.new(Locked, {
		OnHover = function() --[[ OnHover | Line: 215 | Upvalues: v8 (ref), Locked (ref) ]]
			v8.target(Locked.Tab, 0.5, 2, {
				Position = UDim2.new(0, 0, 0, 0)
			})
		end,
		OnLeave = function() --[[ OnLeave | Line: 218 | Upvalues: v8 (ref), Locked (ref) ]]
			v8.target(Locked.Tab, 0.5, 2, {
				Position = UDim2.new(0, 0, 0.2, 0)
			})
		end,
		Click = function() --[[ Click | Line: 221 | Upvalues: v1 (ref), FolderPrices (ref), v6 (ref), v10 (ref), v7 (ref), t (ref) ]]
			local v12 = v1.GetRemoteFunction("GetNextFolder"):InvokeServer()
			if FolderPrices[v12] then
				local Foals = FolderPrices[v12].Foals
				v6.Prompt({
					Type = "BuyFolder",
					Setup = function(p1) --[[ Setup | Line: 228 | Upvalues: v1 (ref), FolderPrices (ref), v10 (ref) ]]
						local v12 = v1.GetRemoteFunction("GetNextFolder"):InvokeServer()
						p1.Content.Price.TextLabel.Text = FolderPrices[v12].Coins
						p1.Content.FoalsBorn.TextLabel.Text = (math.clamp(v10:GetStatValue("FoalsBorn").Value, 0, FolderPrices[v12].Foals) .. "/" .. FolderPrices[v12].Foals) .. " Foals Born"
					end,
					Run = function() --[[ Run | Line: 234 | Upvalues: v10 (ref), Foals (copy), v7 (ref), v1 (ref), t (ref) ]]
						if v10:GetStatValue("FoalsBorn").Value < Foals then
							v7.Notify({
								Message = "You haven\'t completed all the tasks",
								Preset = "Red"
							})
							return
						end
						local v12, v2 = v1.GetRemoteFunction("NewAnimalFolder"):InvokeServer()
						if v12 and v2 then
							t.NewFolder(v12, v2)
						else
							v7.Notify({
								Message = "You cannot afford this",
								Preset = "Red"
							})
						end
						return true
					end,
					Cancel = function() --[[ Cancel | Line: 256 ]]
						return true
					end
				})
			end
		end
	})
	v2.new(FolderContainer.Menu.Content.SaveButton, {
		Click = function() --[[ Click | Line: 264 | Upvalues: t (ref) ]]
			t.SaveFolder()
		end
	})
	v2.new(FolderContainer.Menu.Content.DeleteButton, {
		Click = function() --[[ Click | Line: 270 | Upvalues: v15 (ref), v6 (ref), FolderPrices (ref), v1 (ref), t (ref) ]]
			if not v15 then
				return
			end
			v6.Prompt({
				Type = "DeleteFolder",
				Setup = function(p1) --[[ Setup | Line: 274 | Upvalues: v15 (ref), FolderPrices (ref) ]]
					p1.Content.Price.TextLabel.Text = FolderPrices[tonumber(v15.Name)].Coins / 2
				end,
				Run = function() --[[ Run | Line: 278 | Upvalues: v1 (ref), v15 (ref), t (ref) ]]
					if not v1.GetRemoteFunction("DeleteAnimalFolder"):InvokeServer(v15.Name) then
						return true
					end
					t.DeleteFolder()
					return true
				end,
				Cancel = function() --[[ Cancel | Line: 287 ]]
					return true
				end
			})
		end
	})
	for v9, v102 in v10.PlayerData.AnimalFolders:GetChildren() do
		t.NewFolder(v102.Name, {
			Color = v102.Color.Value,
			Icon = v102.Icon.Value
		})
	end
	if not (v1.GetRemoteFunction("GetNextFolder"):InvokeServer() > 5) then
		return
	end
	Locked.Visible = false
end
function t.OnOpen(p1) --[[ OnOpen | Line: 306 | Upvalues: t2 (copy), SelectFolder (copy) ]]
	for v1, v2 in t2 do
		SelectFolder(v1, v1.Name)
		return
	end
end
function t.OnClose(p1) --[[ OnClose | Line: 313 | Upvalues: v15 (ref), v8 (copy), v14 (ref), v13 (ref) ]]
	if v15 then
		v8.target(v15.Tab, 0.5, 2, {
			Position = UDim2.new(0, 0, 0, 0)
		})
	end
	if v14 then
		v14.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		v14 = nil
	end
	if v13 then
		v13.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		v13 = nil
	end
	if not v15 then
		return
	end
	v15.Position = UDim2.new(0, 0, 0, 0)
	v15 = nil
end
function t.Init() --[[ Init | Line: 332 | Upvalues: v4 (copy), FolderContainer (copy), v2 (copy), StablesGui (copy), t (copy) ]]
	v4.AddFrame(FolderContainer, {
		TweenAnimation = "Open",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = FolderContainer.Position,
		ClosePosition = FolderContainer.Position + UDim2.new(0, 0, 0.15, 0)
	})
	v2.new(FolderContainer.Menu.CloseButton, {
		Click = function() --[[ Click | Line: 342 | Upvalues: v4 (ref), StablesGui (ref) ]]
			v4.CloseFrame(StablesGui.FolderContainer)
		end
	})
	v4.AddStateCallback(FolderContainer, "OnOpen", function(...) --[[ Line: 347 | Upvalues: t (ref) ]]
		t:OnOpen(...)
	end)
	v4.AddStateCallback(FolderContainer, "OnClose", function() --[[ Line: 351 | Upvalues: v4 (ref), StablesGui (ref), t (ref) ]]
		v4.OpenMainFrame(StablesGui.ContainerFrame)
		t:OnClose()
	end)
	task.spawn(t.Setup)
end
t.Init()
return t