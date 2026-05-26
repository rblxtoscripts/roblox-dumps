-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Utility")
local v2 = Library:Load("PartCutter")
local v3 = Library:Load("Network")
local v4 = Library:Load("Table")
local TweenedFurniture = require(script:WaitForChild("TweenedFurniture"))
local LocalPlayer = game.Players.LocalPlayer
local t = {}
local t2 = {}
local t3 = {}
local t4 = {}
local t5 = {}
if LocalPlayer.Character == nil then
	LocalPlayer.CharacterAdded:Wait()
end
local function RegisterTouchEvents(p1) --[[ RegisterTouchEvents | Line: 21 | Upvalues: v1 (copy), LocalPlayer (copy), t3 (ref) ]]
	if not p1:FindFirstChild("TouchEvent") then
		return
	end
	for i, v in ipairs(p1:GetChildren()) do
		if v:FindFirstChild("TouchIntrest") then
			local v12 = v.Touched:connect(v1:Debounce(function(p12) --[[ Line: 25 | Upvalues: LocalPlayer (ref), p1 (copy), v (copy) ]]
				if not p12 or (not p12.Parent or (not p12.Parent:FindFirstChild("Humanoid") or p12.Parent.Humanoid ~= LocalPlayer.Character.Humanoid)) then
					return
				end
				p1.TouchEvent:FireServer(p12, v)
				wait(0.1)
			end))
			if not v:FindFirstChild("Preload") then
				table.insert(t3, v12)
			end
		end
	end
end
local function GiveLocalScripts(p1) --[[ GiveLocalScripts | Line: 42 | Upvalues: LocalPlayer (copy), t4 (ref) ]]
	for i, v in ipairs(p1:GetChildren()) do
		if v:IsA("LocalScript") then
			if v:FindFirstChild("DontAllowMoreThanOne") and LocalPlayer.PlayerScripts:FindFirstChild(v.Name) then
				break
			end
			local ObjectPointer = Instance.new("ObjectValue")
			ObjectPointer.Value = p1
			ObjectPointer.Name = "ObjectPointer"
			local HousePointer = Instance.new("ObjectValue")
			HousePointer.Value = p1.Parent.Parent
			HousePointer.Name = "HousePointer"
			local v1 = v:clone()
			ObjectPointer.Parent = v1
			HousePointer.Parent = v1
			v1.Disabled = false
			v1.Parent = LocalPlayer.PlayerScripts
			if not v:FindFirstChild("Preload") then
				table.insert(t4, v1)
			end
		end
	end
end
local function AddWallpaperToFurniture(p1, p2) --[[ AddWallpaperToFurniture | Line: 70 ]]
	if not (p1:FindFirstChild("Wall") and p2) then
		return
	end
	for i, v in ipairs(p1:GetChildren()) do
		if v.Name == "Wall" then
			for i2, v2 in ipairs(v:GetChildren()) do
				if v2.Name == "Wallpaper" then
					v2.Texture = "http://www.roblox.com/Thumbs/Asset.ashx?Width=420&Height=420&AssetID=" .. (p2.TextureId or "")
					v2.Color3 = p2.TextureColor or Color3.fromRGB(255, 255, 255)
					v2.Transparency = p2.Transparency or 1
					v2.StudsPerTileU = p2.StudsPerTileU or 4
					v2.StudsPerTileV = p2.StudsPerTileV or 4
				end
			end
		end
	end
end
local function EnabledSounds(p1) --[[ EnabledSounds | Line: 90 | Upvalues: t5 (ref) ]]
	for i, v in ipairs(p1:GetChildren()) do
		for i2, v2 in ipairs(v:GetChildren()) do
			if v2:IsA("Sound") and v2:FindFirstChild("SoundFXId") then
				local v1 = v2:clone()
				v1.Parent = v2.Parent
				v1.SoundId = v2.SoundFXId.Value
				t5[v2] = v1
			end
		end
	end
end
local function onFurnitureSound(p1, p2, p3, p4) --[[ onFurnitureSound | Line: 104 | Upvalues: t5 (ref), LocalPlayer (copy) ]]
	local v1 = t5[p1]
	local v2 = p2:FindFirstChildOfClass("Part") or p2:FindFirstChildOfClass("UnionOperation") or p2:FindFirstChildOfClass("WedgePart") or p2:FindFirstChildOfClass("MeshPart") or p2:FindFirstChildOfClass("CornerWedgePart")
	if not v1 or (p2.Parent.Name ~= "Furniture" or not (LocalPlayer.Character and (LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and (LocalPlayer.Character.HumanoidRootPart.Position * Vector3.new(1, 0, 1) - v2.Position * Vector3.new(1, 0, 1)).magnitude < 50))) then
		return
	end
	if p4 then
		for k, v in pairs(p4) do
			v1[k] = v
		end
	end
	if p3 == "Play" then
		v1:Play()
		return
	end
	if p3 == "Stop" then
		v1:Stop()
		return
	end
	if p3 ~= "Pause" then
		return
	end
	v1:Pause()
end
workspace.Main.FurnitureSound.OnClientEvent:connect(onFurnitureSound)
workspace.Main.FurnitureSound.FurnitureSound.Event:Connect(onFurnitureSound)
local function UpdatePattern(p1, p2, p3) --[[ UpdatePattern | Line: 135 | Upvalues: t2 (ref) ]]
	local Wallpaper = p3.Wallpaper
	local Floor = p3.Floor
	local Ceiling = p3.Ceiling
	for i, v in ipairs(p1.CurrentUpgrade.Value:GetDescendants()) do
		if v:IsA("Texture") and v.Name == p2 then
			local v1 = if v.Parent.Name == "Wall" then true else false
			local v2 = if v.Parent.Name == "Floor" then true else false
			local v3 = if v.Parent.Name == "Ceiling" then true elseif v.Parent.Name == "Roof" then true else false
			v.Texture = v1 and "http://www.roblox.com/Thumbs/Asset.ashx?Width=420&Height=420&AssetID=" .. Wallpaper.TextureId or (v2 and "http://www.roblox.com/Thumbs/Asset.ashx?Width=420&Height=420&AssetID=" .. Floor.TextureId or (v3 and "http://www.roblox.com/Thumbs/Asset.ashx?Width=420&Height=420&AssetID=" .. Ceiling.TextureId or ""))
			v.Color3 = v1 and Wallpaper.TextureColor or (v2 and Floor.TextureColor or (v3 and Ceiling.TextureColor or Color3.new(255, 255, 255)))
			v.Transparency = v1 and Wallpaper.Transparency or (v2 and Floor.Transparency or (v3 and Ceiling.Transparency or 1))
			v.StudsPerTileU = v1 and Wallpaper.StudsPerTileU or (v2 and Floor.StudsPerTileU or (v3 and Ceiling.StudsPerTileU or 4))
			v.StudsPerTileV = v1 and Wallpaper.StudsPerTileV or (v2 and Floor.StudsPerTileV or (v3 and Ceiling.StudsPerTileV or 4))
			if v.Parent.Name == "Ceiling" or v.Parent.Name == "Floor" then
				local v9 = v2 and Floor.Material or (if v3 then Ceiling.Material else v3)
				local v10 = v2 and Floor.PartColor or (if v3 then Ceiling.PartColor else v3)
				if v9 then
					v.Parent.Material = v9
				end
				if v10 then
					v.Parent.Color = v10
				end
				if v3 and Ceiling.TextureId == "179728796" or v2 and Floor.TextureId == "179728796" then
					v.Parent.Reflectance = 1
					v.Texture = ""
				else
					v.Parent.Reflectance = 0
				end
			end
			table.insert(t2, v)
		end
	end
end
local Room = LocalPlayer:WaitForChild("Room")
local t6 = {}
local function RefreshLocalCharacters() --[[ RefreshLocalCharacters | Line: 189 | Upvalues: Room (copy), t6 (copy), v1 (copy), LocalPlayer (copy) ]]
	if not _G.IsPartyServer then
		return
	end
	for i, v in ipairs(game.Players:GetPlayers()) do
		local v12 = v:FindFirstChild("Room") and (if v.Room.Value == Room.Value then true else false)
		if v and (v.Parent and v.Character) then
			if v.Character.Parent == game.ReplicatedStorage and (v12 and not t6[v]) then
				local v2 = v1:SendData("GetPlayerCFramesInRoom", "PlayerChannel", 2, Room.Value)
				if v2 then
					for k, v3 in pairs(v2) do
						local v32 = game.Players:FindFirstChild(k)
						if v32 and (v32.Character and v32.Character:FindFirstChild("HumanoidRootPart")) then
							v32.Character.HumanoidRootPart.CFrame = v3
						end
					end
				end
				v.Character.Parent = workspace
				continue
			end
			if v.Character.Parent == workspace and not (v12 or t6[v]) then
				v.Character.Parent = game.ReplicatedStorage
			end
		end
	end
	for i, v in ipairs(workspace.Pets:GetChildren()) do
		if v.Parent and (v:FindFirstChild("Owner") and (v.Owner.Value and (v.Owner.Value ~= LocalPlayer and v.Owner.Value:FindFirstChild("Room")))) then
			local isValue = v.Owner.Value.Room.Value == LocalPlayer.Room.Value
			if v.Parent == game.ReplicatedStorage and isValue then
				v.Parent = workspace
				continue
			end
			if v.Parent == workspace and not isValue then
				v.Parent = game.ReplicatedStorage
			end
		end
	end
end
_G.RefreshLocalCharacters = RefreshLocalCharacters
if _G.IsPartyServer then
	spawn(function() --[[ Line: 230 ]]
		while true do
			_G.RefreshLocalCharacters()
			wait(15)
		end
	end)
	local function AddPlayer(p1) --[[ AddPlayer | Line: 238 ]]
		p1:WaitForChild("Room").Changed:connect(function() --[[ Line: 239 ]]
			_G.RefreshLocalCharacters()
		end)
	end
	game.Players.PlayerAdded:connect(function(p1) --[[ Line: 244 ]]
		p1:WaitForChild("Room").Changed:connect(function() --[[ Line: 239 ]]
			_G.RefreshLocalCharacters()
		end)
	end)
	for i, v in ipairs(game.Players:GetPlayers()) do
		v:WaitForChild("Room").Changed:connect(function() --[[ Line: 239 ]]
			_G.RefreshLocalCharacters()
		end)
	end
end
local PlayerClones = workspace.PlayerClones
workspace.Main.PlayerEditingAvatar.OnClientEvent:connect(function(p1, p2) --[[ Line: 263 | Upvalues: t6 (copy), LocalPlayer (copy), Room (copy), PlayerClones (copy) ]]
	if p1 and (p1.Character and t6[p1]) then
		p1.Character.Parent = workspace
		if t6[p1].Parent then
			t6[p1]:Destroy()
		end
		t6[p1] = nil
	end
	if not p1 or (_G.EditingAvatar or (p1 == LocalPlayer or (not p1.Character or (not p1:FindFirstChild("Room") or (p1.Room.Value ~= Room.Value or not p2))))) then
		return
	end
	local Model = Instance.new("Model")
	for i, v in ipairs(p1.Character:GetChildren()) do
		if v:IsA("BasePart") then
			local v1 = v:clone()
			v1.Anchored = true
			v1.Parent = Model
			continue
		end
		if (v:IsA("Accoutrement") or v:IsA("Tool")) and v:FindFirstChild("Handle") then
			local v2 = v:clone()
			v2.Handle.Anchored = true
			v2.Parent = Model
			continue
		end
		if v:IsA("Humanoid") or v:IsA("Clothing") then
			v:clone().Parent = Model
		end
	end
	Model.Name = p1.DisplayName
	Model.Parent = PlayerClones
	p1.Character.Parent = game.ReplicatedStorage
	t6[p1] = Model
end)
game.Players.PlayerRemoving:Connect(function(p1) --[[ Line: 306 | Upvalues: t6 (copy) ]]
	if not t6[p1] then
		return
	end
	t6[p1]:Destroy()
end)
function ShowFurniture() --[[ ShowFurniture | Line: 313 ]] end
local t7 = {}
local t8 = {}
local t9 = {}
local v5 = nil
workspace.Main.LocationChanged.OnClientEvent:connect(function(p1, p2, p3, p4, p5, p6, p7) --[[ Line: 325 | Upvalues: v5 (ref), t9 (copy), v4 (copy), v2 (copy), t8 (ref), t7 (ref), t (ref), RegisterTouchEvents (copy), GiveLocalScripts (copy), TweenedFurniture (copy), EnabledSounds (copy), AddWallpaperToFurniture (copy), UpdatePattern (copy) ]]
	spawn(function() --[[ Line: 328 ]]
		_G.RefreshLocalCharacters()
	end)
	local t2 = {}
	if p3 then
		for i, v in ipairs(p3) do
			t2[v] = true
		end
	end
	if p2 then
		if _G.TutorialEnabled then
			workspace.TutorialService.PlayerAction:FireServer("EnteredHouse", true)
		end
		if p2 ~= v5 then
			for i, v in ipairs(p2.CurrentUpgrade.Value:GetChildren()) do
				if v.Name == "Window" then
					v.Transparency = if t2[v] then 0 else 0.7
					v.Reflectance = 0
					v.Material = p4
					t9[v] = v.ClickDetector.Detector.Event:connect(function() --[[ Line: 359 | Upvalues: v (copy), p2 (copy) ]]
						v.Transparency = if v.Transparency == 0 then 0.7 else 0
						workspace.Main.SetHouseWindowState:FireServer(p2, v, v.Transparency ~= 0)
					end)
				end
			end
			p2.CurrentUpgrade.Value.Rooms:FindFirstChild("Backyard")
			local Garage = p2.CurrentUpgrade.Value.Rooms:FindFirstChild("Garage")
			local Garage_2 = p2:FindFirstChild("Garage")
			local t3 = {}
			for i, v in ipairs(p2.CurrentUpgrade.Value.Rooms:GetChildren()) do
				if v.Name == "Backyard" then
					table.insert(t3, v.Value)
				end
			end
			local t4 = {}
			local v42 = if Garage == nil then false else Garage.Value
			local v52 = if Garage_2 == nil then false else Garage_2:FindFirstChild("GarageFloor")
			t4[1] = v42
			t4[2] = v52
			local v6 = v4:Merge(t4, t3)
			local v7 = false
			if game.ReplicatedStorage.GlobalData.Season.Value == "Winter" then
				for i, v in ipairs(v6) do
					if v then
						for i2, v8 in ipairs(workspace.Winter.FragmentSnow:GetChildren()) do
							if not v7 and v2.WillBeCut(v8, v.Position, v.Size * Vector3.new(1, 15, 1) * 1.05) then
								table.insert(t8, v8:clone())
							end
							local v9, v10 = v2.cutPart(v8, v.Position, v.Size * Vector3.new(1, 15, 1) * 1.05)
							if v9 then
								for i3, v11 in ipairs(v10) do
									table.insert(t7, v11)
								end
								v9:Destroy()
							end
						end
						v7 = true
					end
				end
			end
		end
		v5 = p2
		if p5 then
			if not t[p1] then
				t[p1] = {}
			end
			for i, v in ipairs(p5) do
				table.insert(t[p1], v)
				v.Parent = p2.Furniture
				v.BorderPointer.Value.Parent = game.ReplicatedStorage.BorderStorage
				RegisterTouchEvents(v)
				GiveLocalScripts(v)
				TweenedFurniture.onFurnitureStreamedIn(v)
				EnabledSounds(v)
				if p6 and p6.Wallpaper then
					AddWallpaperToFurniture(v, p6.Wallpaper)
				end
			end
		end
		if p6 then
			UpdatePattern(p2, p1, p6)
		end
		_G.CurrentRoomName = p1
		_G.CurrentHouse = p2
	else
		if v5 then
			for i, v in ipairs(v5.CurrentUpgrade.Value:GetChildren()) do
				if v.Name == "Window" then
					if t9[v] then
						t9[v]:disconnect()
						t9[v] = nil
					end
					v.Transparency = 0
					v.Reflectance = 1
					v.Material = "SmoothPlastic"
				end
			end
			for i, v in ipairs(t7) do

			end
			t7 = {}
			for i, v in ipairs(t8) do

			end
			t8 = {}
			v5 = nil
		end
		if _G.CurrentRoomName ~= nil and game.ReplicatedStorage.Zones:FindFirstChild(_G.CurrentRoomName) then
			return
		end
		_G.CurrentRoomName = nil
		_G.CurrentHouse = nil
	end
end)
workspace.Main.PlayerEnteredHouse.OnClientEvent:connect(function(p1, p2) --[[ Line: 462 | Upvalues: LocalPlayer (copy) ]]
	if LocalPlayer.userId == p1 or not (LocalPlayer:IsFriendsWith(p1) and (p2 and p2.Parent)) then
		return
	end
	p2.WhiteBackground.Visible = true
end)
function AddFurniture(p1, p2, p3, p4) --[[ AddFurniture | Line: 470 | Upvalues: t (ref), RegisterTouchEvents (copy), GiveLocalScripts (copy), TweenedFurniture (copy), EnabledSounds (copy), AddWallpaperToFurniture (copy) ]]
	if p2 ~= _G.CurrentRoomName and (p2 ~= "Balcony" and p2 ~= "Porch") then
		return
	end
	if not t[p2] then
		t[p2] = {}
	end
	table.insert(t[p2], p3)
	p3.BorderPointer.Value.Parent = game.ReplicatedStorage.BorderStorage
	p3.Parent = p1.Furniture
	RegisterTouchEvents(p3)
	GiveLocalScripts(p3)
	TweenedFurniture.onFurnitureStreamedIn(p3)
	EnabledSounds(p3)
	if not (p4 and p4.Wallpaper) then
		return
	end
	AddWallpaperToFurniture(p3, p4.Wallpaper)
end
workspace.Main.FurnitureAdded.OnClientEvent:connect(function(p1, p2, p3, p4) --[[ Line: 489 ]]
	AddFurniture(p1, p2, p3, p4)
end)
workspace.Main.BulkFurnitureAdded.OnClientEvent:connect(function(p1, p2, p3, p4) --[[ Line: 500 ]]
	for i, v in ipairs(p3) do
		AddFurniture(p1, p2, v, p4)
	end
end)
workspace.Main.WallOrFloorChanged.OnClientEvent:connect(function(p1, p2, p3) --[[ Line: 508 | Upvalues: UpdatePattern (copy), t (ref), AddWallpaperToFurniture (copy) ]]
	if p2 ~= _G.CurrentRoomName or p1 ~= _G.CurrentHouse then
		return
	end
	UpdatePattern(p1, p2, p3)
	if not p3.Wallpaper then
		return
	end
	for i, v in ipairs(t[p2]) do
		AddWallpaperToFurniture(v, p3.Wallpaper)
	end
end)
function ClearRooms() --[[ ClearRooms | Line: 524 | Upvalues: t (ref), AddWallpaperToFurniture (copy), t2 (ref), t3 (ref), t4 (ref), t5 (ref) ]]
	for k, v in pairs(t) do
		for i, v2 in ipairs(v) do
			if v2.Parent and v2.Parent ~= game.ReplicatedStorage.StreamingFurnitureStorage then
				if v2:FindFirstChild("Preload") == nil then
					v2.BorderPointer.Value.Parent = v2
					v2.PrimaryPart = v2.BorderPointer.Value
					v2.Parent = game.ReplicatedStorage.StreamingFurnitureStorage
					continue
				end
				AddWallpaperToFurniture(v2, {})
			end
		end
	end
	t = {}
	for i, v in ipairs(t2) do
		v.Texture = ""
		if v and (v.Parent and v.Parent.Name == "Floor") then
			v.Texture = "http://www.roblox.com/asset/?id=127726526"
			v.Parent.Material = Enum.Material.Wood
			v.Parent.BrickColor = BrickColor.new("Dark orange")
			v.Parent.Reflectance = 0
			continue
		end
		if v then
			v.Texture = ""
		end
	end
	t2 = {}
	for i, v in ipairs(t3) do
		v:disconnect()
	end
	t3 = {}
	for i, v in ipairs(t4) do
		v:Destroy()
	end
	t4 = {}
	local t6 = {}
	for k, v in pairs(t5) do
		if v.Parent and (v.Parent.Parent and not v.Parent.Parent:FindFirstChild("Preloaded")) then
			v:Stop()
			v:Destroy()
			continue
		end
		t6[k] = v
	end
	t5 = t6
end
workspace.Main.ClearRooms.OnClientEvent:connect(ClearRooms)
local IsPointInsideBox = v1.IsPointInsideBox
local Character = LocalPlayer.Character
local v6 = false
local v7 = nil
local t10 = {}
local function RefreshLocation() --[[ RefreshLocation | Line: 601 | Upvalues: LocalPlayer (copy), v6 (ref), t10 (copy), IsPointInsideBox (copy), v1 (copy) ]]
	if not (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) then
		return
	end
	local HumanoidRootPart = LocalPlayer.Character.HumanoidRootPart
	v6 = false
	for k, v in pairs(t10) do
		for i, v2 in ipairs(v) do
			if IsPointInsideBox(v2, HumanoidRootPart.Position + HumanoidRootPart.CFrame.lookVector / 2.01) then
				if v2.Name == "Gap" then
					return false
				end
				v6 = true
				if v2.Name ~= _G.CurrentRoomName then
					_G.CurrentRoomName = v2.Name
					_G.CurrentHouse = k
					v1:SendData("LocationChanged", "PlayerChannel", nil, v2.Name, k)
					return true
				end
			end
		end
	end
	local v12 = nil
	for i, v in ipairs(game.ReplicatedStorage.Zones:GetChildren()) do
		if IsPointInsideBox(v, HumanoidRootPart.Position + HumanoidRootPart.CFrame.lookVector / 2.01) then
			v12 = v
		end
	end
	if not v6 and (v12 and _G.CurrentRoomName ~= v12.Name) then
		_G.CurrentRoomName = v12.Name
		v1:SendData("LocationChanged", "PlayerChannel", nil, v12.Name)
		return true
	end
	if v6 or (_G.CurrentRoomName == nil or v12) then
	else
		_G.CurrentRoomName = nil
		v1:SendData("LocationChanged", "PlayerChannel", nil, nil)
		return true
	end
end
spawn(function() --[[ Line: 649 | Upvalues: RefreshLocation (copy) ]]
	while true do
		wait(1)
		RefreshLocation()
	end
end)
workspace.Main.RefreshLocation.OnClientEvent:connect(RefreshLocation)
workspace.Main.TweenFurniture.OnClientEvent:Connect(TweenedFurniture.onTweenFurniture)
local function UpdateConnections(p1) --[[ UpdateConnections | Line: 660 | Upvalues: v7 (ref), v1 (copy), RefreshLocation (copy) ]]
	if v7 then
		v7:disconnect()
	end
	local HumanoidRootPart = p1:WaitForChild("HumanoidRootPart", 5)
	local Humanoid = p1:WaitForChild("Humanoid", 5)
	if HumanoidRootPart and Humanoid then
		v7 = HumanoidRootPart.Touched:connect(v1:Debounce(function(p1) --[[ Line: 665 | Upvalues: Humanoid (copy), RefreshLocation (ref) ]]
			if not p1 or p1.Name ~= "DoorTouch" then
				return
			end
			for i = 1, 20 do
				while Humanoid and Humanoid.MoveDirection == Vector3.new(0, 0, 0) do
					wait()
				end
				if RefreshLocation() then
					delay(2, function() --[[ Line: 672 | Upvalues: RefreshLocation (ref) ]]
						RefreshLocation()
					end)
					return
				end
				wait(0.1)
			end
		end))
	end
end
LocalPlayer.CharacterAdded:connect(function(p1) --[[ Line: 686 | Upvalues: UpdateConnections (copy) ]]
	UpdateConnections(p1)
end)
if LocalPlayer.Character then
	UpdateConnections(LocalPlayer.Character)
end
local function CollectRooms(p1) --[[ CollectRooms | Line: 703 | Upvalues: t10 (copy), RefreshLocation (copy) ]]
	task.wait()
	local CurrentUpgrade = p1.CurrentUpgrade.Value
	if not CurrentUpgrade then
		RefreshLocation()
		return
	end
	t10[p1] = {}
	for i, v in ipairs(CurrentUpgrade:WaitForChild("Rooms", 1):GetChildren()) do
		table.insert(t10[p1], v.Value)
	end
	RefreshLocation()
end
for i, v in ipairs(workspace.Houses:GetChildren()) do
	CollectRooms(v)
	v.CurrentUpgrade.Changed:connect(function() --[[ Line: 717 | Upvalues: CollectRooms (copy), v (copy) ]]
		CollectRooms(v)
	end)
end
v3:BindEvents({
	HideFurniture = function() --[[ HideFurniture | Line: 724 ]]
		ClearRooms()
	end
})