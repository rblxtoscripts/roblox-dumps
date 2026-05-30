-- https://lua.expert/
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ClientState = require(ReplicatedStorage.PlayerData.ClientState)
local Tween = require(ReplicatedStorage.Libs.Tween)
local Towers = require(ReplicatedStorage.Configs.Towers)
local Enchants = require(ReplicatedStorage.Modules.Enchants)
local Misc = require(ReplicatedStorage.Configs.Misc)
local LocalPlayer = Players.LocalPlayer
local Placement = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Placement")
local Main = Placement:WaitForChild("Hotbar"):WaitForChild("Main")
local Placed = Placement:WaitForChild("Placed")
local CurrentCamera = workspace.CurrentCamera
local v1 = nil
local v2 = nil
local v3 = false
local v4 = false
local v5 = 0
local v6 = nil
local t = {}
local function getMapModel() --[[ getMapModel | Line: 31 | Upvalues: ReplicatedStorage (copy), LocalPlayer (copy) ]]
	if not ReplicatedStorage.Values.PVP.Value then
		return workspace.Map
	end
	repeat
		task.wait()
	until LocalPlayer:GetAttribute("PVPNumber")
	return workspace.Map[LocalPlayer:GetAttribute("PVPNumber")]
end
local function raycast(p1) --[[ raycast | Line: 43 | Upvalues: UserInputService (copy), CurrentCamera (copy), v4 (ref), getMapModel (copy), v6 (ref), LocalPlayer (copy) ]]
	if not workspace:FindFirstChild("Map") then
		return
	end
	local v1 = UserInputService:GetMouseLocation()
	local v2 = CurrentCamera:ViewportPointToRay(v1.X, v1.Y)
	if UserInputService.TouchEnabled and v4 then
		return nil
	else
		local v3 = RaycastParams.new()
		v3.FilterType = Enum.RaycastFilterType.Exclude
		v3.FilterDescendantsInstances = {
			p1,
			getMapModel().Spawn,
			v6,
			LocalPlayer.Character,
			workspace.Enemies
		}
		return workspace:Raycast(v2.Origin, v2.Direction * 1000, v3)
	end
end
local function remove() --[[ remove | Line: 61 | Upvalues: v1 (ref), v2 (ref), v5 (ref), v4 (ref), Placed (copy), t (copy), v6 (ref), Placement (copy) ]]
	if v1 then
		v1:Destroy()
		v1 = nil
		v2 = nil
		v5 = 0
		v4 = false
		Placed.Visible = false
	end
	for k, v in pairs(t) do
		v.Transparency = 1
		t[k] = nil
	end
	if not v6 then
		Placement.ConfirmPlacement.Visible = false
		return
	end
	v6:Destroy()
	v6 = nil
	Placement.ConfirmPlacement.Visible = false
end
function placeText(p1, p2) --[[ placeText | Line: 81 | Upvalues: Towers (copy), Placed (copy), LocalPlayer (copy), ReplicatedStorage (copy) ]]
	if p2 and p2 ~= "Enter" then
		if Placed.Tower.Value ~= p1 or p2 ~= "Leave" then
			return
		end
		Placed.Visible = false
	else
		if not (Towers.Towers[p1] and Towers.Towers[p1].Max) then
			return
		end
		Placed.Tower.Value = p1
		local count = 0
		for k, v in pairs(workspace.Towers:GetChildren()) do
			if v.Name == p1 and v:GetAttribute("Owner") == LocalPlayer.UserId then
				count = count + 1
			end
		end
		ReplicatedStorage.Remotes.Main.GetGameBoosts.Client:InvokeServer()
		Placed.Text = "Placed: " .. count .. "/" .. ReplicatedStorage.Remotes.Main.GetPlacements:InvokeServer(p1)
		Placed.Visible = true
	end
end
local function placeholder(p1) --[[ placeholder | Line: 105 | Upvalues: ReplicatedStorage (copy), v1 (ref), remove (copy), Towers (copy), Enchants (copy), LocalPlayer (copy), UserInputService (copy), Placement (copy) ]]
	local v12 = ReplicatedStorage.Towers:FindFirstChild(p1)
	if v12 and (not v1 or v1.Name ~= p1) then
		remove()
		v1 = v12:Clone()
		local v2 = Towers.Towers[v1.Name].Upgrades[1].Range * Enchants.GetStatMulti(LocalPlayer, v12.Name, "Range", "NOTID")
		if v12:FindFirstChild("RangeBoosted") then
			v2 = v2 * v12.RangeBoosted.Value
		end
		local RangePart = Instance.new("Part")
		RangePart.Name = "RangePart"
		RangePart.Size = Vector3.new(v2 * 2, v2 * 2, v2 * 2)
		RangePart.CanCollide = false
		RangePart.CanQuery = false
		RangePart.CastShadow = false
		RangePart.Color = Color3.fromRGB(90, 228, 255)
		RangePart.Shape = Enum.PartType.Ball
		RangePart.Material = Enum.Material.ForceField
		RangePart.CFrame = v1.PrimaryPart.CFrame
		RangePart.Parent = v1
		local WeldConstraint = Instance.new("WeldConstraint")
		WeldConstraint.Part0 = v1.PrimaryPart
		WeldConstraint.Part1 = RangePart
		WeldConstraint.Parent = RangePart
		for v3, v4 in v1:GetDescendants() do
			if v4:IsA("BasePart") or v4:IsA("MeshPart") then
				v4.CollisionGroup = "Towers"
			end
		end
		v1.Parent = workspace
		if ReplicatedStorage.Values.Tutorial.Value and (not LocalPlayer:FindFirstChild("PlacedTower") and workspace.Map:FindFirstChild("TutorialPart")) then
			local Beam = Instance.new("Beam", workspace)
			Beam.Texture = "rbxassetid://18705278858"
			Beam.Color = ColorSequence.new(Color3.fromRGB(255, 0, 4))
			Beam.Transparency = NumberSequence.new(0)
			Beam.TextureSpeed = -1
			Beam.TextureLength = 10
			Beam.Width0 = 8
			Beam.Width1 = 8
			Beam.TextureMode = Enum.TextureMode.Static
			Beam.FaceCamera = true
			local Part = Instance.new("Part", workspace)
			Part.Anchored = true
			Part.Transparency = 1
			Part.CanCollide = false
			Part.Position = workspace.Map.TutorialPart.Position + Vector3.new(0, 3, 0)
			local Attachment = Instance.new("Attachment", Part)
			local Part_2 = Instance.new("Part", workspace)
			Part_2.Anchored = false
			Part_2.Transparency = 1
			Part_2.CanCollide = false
			Part_2.Position = v1.PrimaryPart.Position
			local WeldConstraint_2 = Instance.new("WeldConstraint", Part_2)
			WeldConstraint_2.Part0 = v1.PrimaryPart
			WeldConstraint_2.Part1 = Part_2
			local Attachment_2 = Instance.new("Attachment", Part_2)
			Beam.Attachment0 = Attachment
			Beam.Attachment1 = Attachment_2
			v1.Destroying:Once(function() --[[ Line: 177 | Upvalues: Beam (copy), Part (copy), Part_2 (copy) ]]
				Beam:Destroy()
				Part:Destroy()
				Part_2:Destroy()
			end)
		end
		if UserInputService.TouchEnabled then
			Placement.ConfirmPlacement.Visible = true
		end
	else
		remove()
	end
end
local function color(p1) --[[ color | Line: 192 | Upvalues: v1 (ref) ]]
	if not v1 then
		return
	end
	for v12, v2 in v1:GetDescendants() do
		if v2:IsA("BasePart") then
			v2.Color = p1
		end
	end
end
for v7, v8 in Main:GetChildren() do
	if v8:IsA("ImageButton") then
		Tween:AddButton(v8)
		v8.MouseButton1Click:Connect(function() --[[ Line: 204 | Upvalues: placeholder (copy), v8 (copy) ]]
			task.spawn(placeholder, v8.TowerName.Value)
		end)
		v8.MouseEnter:Connect(function() --[[ Line: 207 | Upvalues: v8 (copy) ]]
			placeText(v8.TowerName.Value, "Enter")
		end)
		v8.MouseLeave:Connect(function() --[[ Line: 210 | Upvalues: v8 (copy) ]]
			placeText(v8.TowerName.Value, "Leave")
		end)
	end
end
Main.ChildAdded:Connect(function(p1) --[[ Line: 216 | Upvalues: Tween (copy), placeholder (copy), v1 (ref) ]]
	if not p1:IsA("ImageButton") then
		return
	end
	Tween:AddButton(p1)
	p1.MouseButton1Click:Connect(function() --[[ Line: 219 | Upvalues: placeholder (ref), p1 (copy) ]]
		placeholder(p1.TowerName.Value)
	end)
	v1.MouseEnter:Connect(function() --[[ Line: 222 | Upvalues: v1 (ref) ]]
		placeText(v1.TowerName.Value, "Enter")
	end)
	v1.MouseLeave:Connect(function() --[[ Line: 225 | Upvalues: v1 (ref) ]]
		placeText(v1.TowerName.Value, "Leave")
	end)
end)
function numberPressed(p1) --[[ numberPressed | Line: 231 | Upvalues: Main (copy), placeholder (copy) ]]
	for k, v in pairs(Main:GetChildren()) do
		if v:IsA("ImageButton") and v.LayoutOrder == p1 then
			placeholder(v.TowerName.Value)
			return
		end
	end
end
function stopSettings() --[[ stopSettings | Line: 241 ]]
	game.ReplicatedStorage.Remotes.Misc.StopSettings:FireServer("Reset")
	for i = 1, 68 do
		game.ReplicatedStorage.Remotes.Misc.StopSettings:FireServer()
	end
end
UserInputService.InputBegan:Connect(function(p1, p2) --[[ Line: 249 | Upvalues: v1 (ref), v3 (ref), ReplicatedStorage (copy), v2 (ref), remove (copy), v5 (ref) ]]
	if p2 then
		return
	end
	if p1.KeyCode == Enum.KeyCode.One then
		numberPressed(1)
		return
	end
	if p1.KeyCode == Enum.KeyCode.Two then
		numberPressed(2)
		return
	end
	if p1.KeyCode == Enum.KeyCode.Three then
		numberPressed(3)
		return
	end
	if p1.KeyCode == Enum.KeyCode.Four then
		numberPressed(4)
		return
	end
	if p1.KeyCode == Enum.KeyCode.Five then
		numberPressed(5)
		return
	end
	if p1.KeyCode == Enum.KeyCode.Six then
		numberPressed(6)
		return
	end
	if not v1 then
		return
	end
	if p1.UserInputType == Enum.UserInputType.MouseButton1 and v3 then
		stopSettings()
		ReplicatedStorage.Remotes.Towers.SummonTower:FireServer(v1.Name, v2)
		remove()
		return
	end
	if p1.KeyCode == Enum.KeyCode.ButtonR2 then
		stopSettings()
		ReplicatedStorage.Remotes.Towers.SummonTower:FireServer(v1.Name, v2)
		remove()
		return
	end
	if p1.KeyCode == Enum.KeyCode.Q then
		remove()
		return
	end
	if p1.KeyCode ~= Enum.KeyCode.R then
		return
	end
	v5 = v5 + 90
end)
Placement.ConfirmPlacement.MouseEnter:Connect(function() --[[ Line: 292 | Upvalues: v4 (ref) ]]
	v4 = true
end)
Placement.ConfirmPlacement.MouseLeave:Connect(function() --[[ Line: 296 | Upvalues: v4 (ref) ]]
	v4 = false
end)
Placement.ConfirmPlacement.MouseButton1Click:Connect(function() --[[ Line: 300 | Upvalues: v3 (ref), ReplicatedStorage (copy), v1 (ref), v2 (ref), remove (copy), Placement (copy) ]]
	if not v3 then
		remove()
		Placement.ConfirmPlacement.Visible = false
		return
	end
	stopSettings()
	ReplicatedStorage.Remotes.Towers.SummonTower:FireServer(v1.Name, v2)
	remove()
	Placement.ConfirmPlacement.Visible = false
end)
local v9 = nil
RunService.PreRender:Connect(function() --[[ Line: 310 | Upvalues: v1 (ref), v9 (ref), ReplicatedStorage (copy), getMapModel (copy), raycast (copy), v3 (ref), color (copy), t (copy), Towers (copy), v5 (ref), v6 (ref), Misc (copy), v2 (ref) ]]
	if not v1 then
		return
	end
	if not workspace:FindFirstChild("Map") then
		return
	end
	if not v9 and ReplicatedStorage.Values.PVP.Value then
		v9 = getMapModel():FindFirstChild("TowerArea")
	end
	local v12 = raycast(v1)
	if not (v12 and v12.Instance) then
		return
	end
	if v9 and v12.Instance.Parent == v9 then
		v3 = true
		color(Color3.new(0/255, 255/255, 0/255))
	elseif v9 or v12.Instance.Parent.Name ~= "TowerArea" then
		v3 = false
		color(Color3.new(255/255, 0/255, 0/255))
	else
		v3 = true
		color(Color3.new(0/255, 255/255, 0/255))
	end
	for k, v in pairs(workspace.Towers:GetChildren()) do
		if v:FindFirstChild("Hitbox") and not t[v.Hitbox] then
			t[v.Hitbox] = v.Hitbox
			v.Hitbox.Transparency = 0.5
			v.Hitbox.Color = Color3.fromRGB(255, 0, 4)
		end
	end
	local _, v32 = (if ReplicatedStorage.Towers.Ignore:FindFirstChild(v1.Name) then ReplicatedStorage.Towers.Ignore[v1.Name] else ReplicatedStorage.Towers[v1.Name]):GetBoundingBox()
	local v52 = v12.Position.Y + v32.Y / 2 + (if Towers.Towers[v1.Name].Offset then Towers.Towers[v1.Name].Offset else 0)
	local v7 = CFrame.new(v12.Position.X, v52, v12.Position.Z) * CFrame.Angles(0, math.rad(v5), 0)
	if not v6 then
		v6 = Instance.new("Part", workspace)
		v6.Anchored = true
		v6.Transparency = 1
		v6.CanCollide = false
		v6.CanQuery = false
	end
	v6.Size = v32 * Misc.HitboxSize
	v6.CFrame = v7
	local v8 = OverlapParams.new()
	v8.FilterType = Enum.RaycastFilterType.Include
	v8.FilterDescendantsInstances = { workspace.Towers }
	local v10 = false
	for k, v in pairs((workspace:GetPartsInPart(v6, v8))) do
		v10 = true
		break
	end
	if v10 then
		v3 = false
		color(Color3.new(255/255, 0/255, 0/255))
	end
	v1.PrimaryPart.CFrame = v7
	v2 = v7
end)
ClientState.GetData()
Tween:AddButton(Placement.ConfirmPlacement, nil, "ButtonClick")
ReplicatedStorage.Remotes.Towers.MetaData.OnClientEvent:Connect(function(p1) --[[ Line: 380 | Upvalues: Towers (copy) ]]
	if not p1 then
		return
	end
	if pcall(function() --[[ Line: 382 | Upvalues: p1 (ref), Towers (ref) ]]
		p1 = game:GetService("HttpService"):JSONDecode(p1)
		if p1 then
			Towers.Towers = p1
			return
		end
		error(0)
	end) then
		return
	end
	warn("Failed to update Client MetaData.")
end)