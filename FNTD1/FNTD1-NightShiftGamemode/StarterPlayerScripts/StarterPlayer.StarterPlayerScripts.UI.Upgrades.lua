-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
game:GetService("RunService")
require(ReplicatedStorage.PlayerData.ClientState)
local Towers = require(ReplicatedStorage.Configs.Towers)
local Formatter = require(ReplicatedStorage.Libs.Formatter)
local Tween = require(ReplicatedStorage.Libs.Tween)
local Enchants = require(ReplicatedStorage.Modules.Enchants)
local Misc = require(ReplicatedStorage.Configs.Misc)
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local BillBoards = PlayerGui:WaitForChild("BillBoards")
local CurrentCamera = workspace.CurrentCamera
local v1 = nil
local v2 = nil
local SelectedTower = BillBoards:WaitForChild("SelectedTower")
local Tower = BillBoards:WaitForChild("Tower")
local v3 = nil
local function raycast() --[[ raycast | Line: 26 | Upvalues: UserInputService (copy), CurrentCamera (copy) ]]
	local v1 = UserInputService:GetMouseLocation()
	local v2 = CurrentCamera:ViewportPointToRay(v1.X, v1.Y)
	local v3 = RaycastParams.new()
	v3.FilterType = Enum.RaycastFilterType.Include
	v3.FilterDescendantsInstances = { workspace.Towers }
	return workspace:Raycast(v2.Origin, v2.Direction * 1000)
end
function getSellPrice(p1) --[[ getSellPrice | Line: 39 | Upvalues: Formatter (copy), Towers (copy) ]]
	local sum = 0 + Formatter.FormatToNumber(Towers.Towers[p1.Name].PlacePrice)
	for i = 1, p1:GetAttribute("Upgrade") + 1 do
		sum = sum + Formatter.FormatToNumber(Towers.Towers[p1.Name].Upgrades[i].Price)
	end
	return sum / 2
end
local function Update() --[[ Update | Line: 53 | Upvalues: v1 (ref), SelectedTower (copy), ReplicatedStorage (copy), v2 (ref), Towers (copy), Players (copy), LocalPlayer (copy), Tower (ref), Formatter (copy), v3 (ref), Enchants (copy), Misc (copy) ]]
	game.ReplicatedStorage.Remotes.Misc.UnitManager:Fire()
	if not v1 then
		return
	end
	SelectedTower.Value = v1
	local SelectHighlight = workspace.Visuals:FindFirstChild("SelectHighlight")
	if not SelectHighlight then
		local v12 = ReplicatedStorage.Objects.SelectHighlight:Clone()
		v12.Parent = workspace.Visuals
		SelectHighlight = v12
	end
	local v22
	if v1.Name == "Puppet" then
		if v2 then
			v2.CFrame = ReplicatedStorage.Remotes.Misc.ServerTowerCFrame:InvokeServer(v1)
			v22 = v2
		else
			local AdorneePart = Instance.new("Part", workspace.Visuals)
			AdorneePart.Name = "AdorneePart"
			AdorneePart.Transparency = 1
			AdorneePart.CanCollide = false
			AdorneePart.Anchored = true
			AdorneePart.CFrame = ReplicatedStorage.Remotes.Misc.ServerTowerCFrame:InvokeServer(v1)
			v2 = AdorneePart
			v22 = AdorneePart
		end
		pcall(function() --[[ Line: 81 | Upvalues: v1 (ref) ]]
			if v1.Name ~= "Puppet" or v1:FindFirstChild("Attacking") then
				return
			end
			for k, v in pairs(v1:GetDescendants()) do
				if v:IsA("BasePart") and (v.Parent.Name ~= "Present Model" and v.Parent.Name ~= "Puppet") then
					v.Transparency = 1
				end
			end
		end)
	else
		v22 = v1
	end
	SelectHighlight.Adornee = v1
	local v32 = Towers.Towers[v1.Name].Upgrades[v1:GetAttribute("Upgrade") + 1]
	local v4 = Towers.Towers[v1.Name].Upgrades[v1:GetAttribute("Upgrade") + 2]
	local v5 = if ReplicatedStorage.Values.PowerMode.Value then math.round(v1:GetAttribute("TotalPowerCost") * 0.5 * 10) / 10 else getSellPrice(v1)
	local v7 = Players:GetPlayerByUserId(v1:GetAttribute("Owner"))
	local v8
	if v7 then
		v8 = false
	else
		v7 = LocalPlayer
		v8 = true
	end
	if v1:GetAttribute("TotalDamage") then
		Tower.PetStats.Frame.TotalDamage.Text = "Total Damage: " .. Formatter.FormatCompact(v1:GetAttribute("TotalDamage"))
		local v9 = v1
		if v3 then
			v3:Disconnect()
		end
		v3 = v1:GetAttributeChangedSignal("TotalDamage"):Connect(function() --[[ Line: 108 | Upvalues: v1 (ref), v9 (copy), v3 (ref), Tower (ref), Formatter (ref) ]]
			if v1 and v1 == v9 then
				Tower.PetStats.Frame.TotalDamage.Text = "Total Damage: " .. Formatter.FormatCompact(v1:GetAttribute("TotalDamage"))
			else
				v3:Disconnect()
			end
		end)
	end
	local v10 = if v32 and v32.DamageBoost then v32.DamageBoost else nil
	local v11 = if v4 and v4.DamageBoost then v4.DamageBoost else nil
	local v12 = if v32 and v32.Farm then v32.Farm else nil
	local v13 = if v4 and v4.Farm then v4.Farm else nil
	local v14 = if v32 and v32.RangeBoost then v32.RangeBoost else nil
	local v15 = if v4 and v4.RangeBoost then v4.RangeBoost else nil
	local v16 = if v32 and v32.CooldownBoost then v32.CooldownBoost else nil
	local v17 = if v4 and v4.CooldownBoost then v4.CooldownBoost else nil
	local v18 = if v1:FindFirstChild("DamageBoosted") then v1.DamageBoosted.Value else 1
	local v19 = if v1:FindFirstChild("RangeBoosted") then v1.RangeBoosted.Value else 1
	local v20 = if v1:FindFirstChild("CooldownBoosted") then v1.CooldownBoosted.Value else 1
	if SelectedTower.Value.Name == "Rockstar Foxy" then
		v14 = nil
		v15 = nil
	elseif SelectedTower.Value.Name == "Popstar Chica" then
		v11 = nil
		v10 = nil
	elseif SelectedTower.Value.Name == "Wet Floor Bot" then
		v16 = nil
		v17 = nil
	elseif SelectedTower.Value.Name == "Stardrop" then
		v14 = nil
		v15 = nil
	elseif SelectedTower.Value.Name == "Hermes Puppeteer" then
		v16 = nil
		v17 = nil
	elseif SelectedTower.Value.Name == "Soulmate Puppet" or SelectedTower.Value.Name == "Fossilized Puppet" then
		v14 = nil
		v15 = nil
	elseif SelectedTower.Value.Name == "Paleontologist Springbonnie" then
		v16 = nil
		v17 = nil
	elseif SelectedTower.Value.Name == "Alien Helpy" or SelectedTower.Value.Name == "Funtime Chica" then
		v14 = nil
		v15 = nil
	elseif SelectedTower.Value.Name == "Drained Coffee" then
		v11 = nil
		v10 = nil
	elseif SelectedTower.Value.Name == "El Jellychip" then
		v16 = nil
		v17 = nil
	elseif SelectedTower.Value.Name == "Glitchtrap" then
		v11 = nil
		v10 = nil
	end
	local v21 = Enchants.CheckShiny(v7, v1, true)
	if Misc.SpecialShinyBooster[v1.Name] then
		if Misc.SpecialShinyBooster[v1.Name].All then
			local _ = Misc.SpecialShinyBooster[v1.Name]
			local _2 = Misc.SpecialShinyBooster[v1.Name]
			local _3 = Misc.SpecialShinyBooster[v1.Name]
		end
		if Misc.SpecialShinyBooster[v1.Name].Damage then
			local Damage = Misc.SpecialShinyBooster[v1.Name].Damage
		end
		if Misc.SpecialShinyBooster[v1.Name].Range then
			local Range = Misc.SpecialShinyBooster[v1.Name].Range
		end
		if Misc.SpecialShinyBooster[v1.Name].Cooldown then
			local Cooldown = Misc.SpecialShinyBooster[v1.Name].Cooldown
		end
	end
	local v222 = ReplicatedStorage.Remotes.Main.GetGameBoosts.Client:InvokeServer()
	local v23 = 1
	local v24 = 1
	local v25 = 1
	if v222 then
		if v222.TowerRange then
			v23 = v222.TowerRange
		end
		if v222.TowerCooldown then
			v24 = v222.TowerCooldown
		end
		if v222.TowerDamage then
			v25 = v222.TowerDamage
		end
	end
	local v26 = SelectedTower.Value:GetAttribute("DamageMulti") or 1
	if v4 then
		Tower.PetStats.Frame.PetName.Text = v1.Name .. " (Lvl " .. v1:GetAttribute("Upgrade") + 1 .. ")"
		if v10 and (v14 and v16) then
			local v30 = math.round(v10 * Enchants.CheckShiny(v7, v1) * 1000) / 1000
			local v33 = math.round(v14 * Enchants.CheckShiny(v7, v1) * 1000) / 1000
			local v36 = math.round(v16 * (if v21 then 0.75 else 1) * 1000) / 1000
			local v39 = math.round(v11 * Enchants.CheckShiny(v7, v1) * 1000) / 1000
			local v42 = math.round(v15 * (if v21 then 0.75 else 1) * 1000) / 1000
			Tower.PetStats.Frame.Damage.Text = "Tri Boost: " .. v30 .. " , " .. v33 .. " , " .. v36 .. " -> " .. v39 .. " , " .. v42 .. " , " .. math.round(v17 * (if v21 then 0.75 else 1) * 1000) / 1000
		elseif v10 and v16 then
			local v47 = math.round(v10 * Enchants.CheckShiny(v7, v1) * 1000) / 1000
			local v50 = math.round(v16 * (if v21 then 0.75 else 1) * 1000) / 1000
			local v53 = math.round(v11 * Enchants.CheckShiny(v7, v1) * 1000) / 1000
			Tower.PetStats.Frame.Damage.Text = "Dual Boost: " .. v47 .. " , " .. v50 .. " -> " .. v53 .. " , " .. math.round(v17 * (if v21 then 0.75 else 1) * 1000) / 1000
		elseif v10 and v14 then
			local v58 = math.round(v10 * Enchants.CheckShiny(v7, v1) * 1000) / 1000
			local v61 = math.round(v14 * (if v21 then 0.75 else 1) * 1000) / 1000
			local v64 = math.round(v11 * Enchants.CheckShiny(v7, v1) * 1000) / 1000
			Tower.PetStats.Frame.Damage.Text = "Dual Boost: " .. v58 .. " , " .. v61 .. " -> " .. v64 .. " , " .. math.round(v15 * (if v21 then 0.75 else 1) * 1000) / 1000
		elseif v14 and v16 then
			local v69 = math.round(v14 * Enchants.CheckShiny(v7, v1) * 1000) / 1000
			local v72 = math.round(v16 * (if v21 then 0.75 else 1) * 1000) / 1000
			local v75 = math.round(v15 * Enchants.CheckShiny(v7, v1) * 1000) / 1000
			Tower.PetStats.Frame.Damage.Text = "Dual Boost: " .. v69 .. " , " .. v72 .. " -> " .. v75 .. " , " .. math.round(v17 * (if v21 then 0.75 else 1) * 1000) / 1000
		elseif v10 then
			local v79 = math.round(v10 * Enchants.CheckShiny(v7, v1) * 1000) / 1000
			Tower.PetStats.Frame.Damage.Text = "Damage Boost: " .. v79 .. " -> " .. math.round(v11 * Enchants.CheckShiny(v7, v1) * 1000) / 1000
		elseif v14 then
			local v82 = math.round(v14 * Enchants.CheckShiny(v7, v1) * 1000) / 1000
			Tower.PetStats.Frame.Damage.Text = "Range Boost: " .. v82 .. " -> " .. math.round(v15 * Enchants.CheckShiny(v7, v1) * 1000) / 1000
		elseif v16 then
			local v86 = math.round(v16 * (if v21 then 0.75 else 1) * 1000) / 1000
			Tower.PetStats.Frame.Damage.Text = "Cooldown Boost: " .. v86 .. " -> " .. math.round(v17 * (if v21 then 0.75 else 1) * 1000) / 1000
		elseif v12 then
			Tower.PetStats.Frame.Damage.Text = "Farm: " .. math.round(v12 * 1000) / 1000 .. " -> " .. math.round(v13 * 1000) / 1000
		else
			local v90 = math.round(v32.Damage * v25 * Enchants.GetStatMulti(v7, v1, "Damage", "NOTID") * Enchants.CheckShiny(v7, v1) * v18 * v26 * 10) / 10
			Tower.PetStats.Frame.Damage.Text = "Damage: " .. v90 .. " -> " .. math.round(v4.Damage * v25 * Enchants.GetStatMulti(v7, v1, "Damage", "NOTID") * Enchants.CheckShiny(v7, v1) * v18 * v26 * 10) / 10
		end
		local v93 = math.round(v32.Range * v23 * Enchants.GetStatMulti(v7, v1, "Range", "NOTID") * v19 * 10) / 10
		Tower.PetStats.Frame.Range.Text = "Range: " .. v93 .. " -> " .. math.round(v4.Range * v23 * Enchants.GetStatMulti(v7, v1, "Range", "NOTID") * v19 * 10) / 10
		local v96 = math.round(v32.Cooldown * v24 * Enchants.GetStatMulti(v7, v1, "Speed", "NOTID") * v20 * 1000) / 1000
		Tower.PetStats.Frame.Cooldown.Text = "Cooldown: " .. v96 .. " -> " .. math.round(v4.Cooldown * v24 * Enchants.GetStatMulti(v7, v1, "Speed", "NOTID") * v20 * 1000) / 1000
		Tower.PetStats.Upgrade.TextLabel.Text = if ReplicatedStorage.Values.PowerMode.Value then math.round(v1:GetAttribute("TotalPowerCost") * ((v1:GetAttribute("Upgrade") + 1) * 0.25) * 10) / 10 .. "%" else "$ " .. math.round(v4.Price * Enchants.GetStatMulti(v7, v1, "Cost", "NOTID"))
		Tower.PetStats.Sell.TextLabel.Text = if ReplicatedStorage.Values.PowerMode.Value then "Sell: " .. v5 .. "%" else "Sell: $ " .. v5
		Tower.PetStats.Target.TextLabel.Text = v1:GetAttribute("Priority")
	elseif v1 then
		Tower.PetStats.Frame.PetName.Text = v1.Name .. " (Lvl " .. v1:GetAttribute("Upgrade") + 1 .. ")"
		if v10 and (v14 and v16) then
			local v104 = math.round(v10 * Enchants.CheckShiny(v7, v1) * 1000) / 1000
			local v107 = math.round(v14 * Enchants.CheckShiny(v7, v1) * 1000) / 1000
			Tower.PetStats.Frame.Damage.Text = "Tri Boost: " .. v104 .. ", " .. v107 .. ", " .. math.round(v16 * (if v21 then 0.75 else 1) * 1000) / 1000
		elseif v10 and v16 then
			local v112 = math.round(v10 * Enchants.CheckShiny(v7, v1) * 1000) / 1000
			Tower.PetStats.Frame.Damage.Text = "Dual Boost: " .. v112 .. ", " .. math.round(v16 * (if v21 then 0.75 else 1) * 1000) / 1000
		elseif v10 and v14 then
			local v117 = math.round(v10 * Enchants.CheckShiny(v7, v1) * 1000) / 1000
			Tower.PetStats.Frame.Damage.Text = "Dual Boost: " .. v117 .. ", " .. math.round(v14 * (if v21 then 0.75 else 1) * 1000) / 1000
		elseif v14 and v16 then
			local v122 = math.round(v14 * Enchants.CheckShiny(v7, v1) * 1000) / 1000
			Tower.PetStats.Frame.Damage.Text = "Dual Boost: " .. v122 .. ", " .. math.round(v16 * (if v21 then 0.75 else 1) * 1000) / 1000
		elseif v10 then
			Tower.PetStats.Frame.Damage.Text = "Damage Boost: " .. math.round(v10 * Enchants.CheckShiny(v7, v1) * 1000) / 1000
		elseif v14 then
			Tower.PetStats.Frame.Damage.Text = "Range Boost: " .. math.round(v14 * Enchants.CheckShiny(v7, v1) * 1000) / 1000
		elseif v16 then
			Tower.PetStats.Frame.Damage.Text = "Cooldown Boost: " .. math.round(v16 * (if v21 then 0.75 else 1) * 1000) / 1000
		elseif v12 then
			Tower.PetStats.Frame.Damage.Text = "Farm: " .. math.round(v12 * 1000) / 1000
		else
			Tower.PetStats.Frame.Damage.Text = "Damage: " .. math.round(v32.Damage * v25 * Enchants.GetStatMulti(v7, v1, "Damage", "NOTID") * Enchants.CheckShiny(v7, v1) * v18 * v26 * 10) / 10
		end
		Tower.PetStats.Frame.Range.Text = "Range: " .. math.round(v32.Range * v23 * Enchants.GetStatMulti(v7, v1, "Range", "NOTID") * v19 * 10) / 10
		Tower.PetStats.Frame.Cooldown.Text = "Cooldown: " .. math.round(v32.Cooldown * v24 * Enchants.GetStatMulti(v7, v1, "Speed", "NOTID") * v20 * 1000) / 1000
		Tower.PetStats.Upgrade.TextLabel.Text = "Max"
		Tower.PetStats.Sell.TextLabel.Text = if ReplicatedStorage.Values.PowerMode.Value then "Sell: " .. v5 .. "%" else "Sell: $ " .. v5
		Tower.PetStats.Target.TextLabel.Text = v1:GetAttribute("Priority")
	end
	local v133 = v1:GetAttribute("Owner")
	local v134 = nil
	pcall(function() --[[ Line: 274 | Upvalues: v134 (ref), v133 (copy) ]]
		v134 = game.Players:GetNameFromUserIdAsync(v133)
	end)
	if not v134 and game.Players:GetPlayerByUserId(v133) then
		v134 = game.Players:GetPlayerByUserId(v133).Name
	end
	if v133 and v134 then
		Tower.Owner.Visible = true
		Tower.Owner.Text = if v8 then "Owner: Left The Game" else "Owner: @" .. v134
	else
		Tower.Owner.Visible = true
	end
	if Tower:IsA("BillboardGui") then
		if v22 and (v22:IsA("Model") and v22.PrimaryPart) then
			v22 = v22.PrimaryPart
		end
		Tower.Adornee = v22
		Tower.Enabled = true
	else
		Tower.Visible = true
	end
	local v136 = Towers.Towers[v1.Name].Upgrades[v1:GetAttribute("Upgrade") + 1].Range * Enchants.GetStatMulti(LocalPlayer, v1, "Range", "NOTID") * v19
	local v137 = ReplicatedStorage.Remotes.Main.GetGameBoosts.Client:InvokeServer()
	if v137 and v137.TowerRange then
		v136 = v136 * v137.TowerRange
	end
	if workspace.Visuals:FindFirstChild("RangePart") then
		workspace.Visuals.RangePart:Destroy()
	end
	if v1 then
		local RangePart = Instance.new("Part")
		RangePart.Name = "RangePart"
		RangePart.Size = Vector3.new(v136 * 2, v136 * 2, v136 * 2)
		RangePart.CanCollide = false
		RangePart.CanQuery = false
		RangePart.Massless = true
		RangePart.CastShadow = false
		RangePart.Shape = Enum.PartType.Ball
		RangePart.Material = Enum.Material.ForceField
		RangePart.CFrame = v1.PrimaryPart.CFrame
		RangePart.Parent = workspace.Visuals
		local WeldConstraint = Instance.new("WeldConstraint")
		WeldConstraint.Part0 = v1.PrimaryPart
		WeldConstraint.Part1 = RangePart
		WeldConstraint.Parent = RangePart
	end
end
ReplicatedStorage.Remotes.Main.Slowed.OnClientEvent:Connect(function(p1, p2) --[[ Line: 327 | Upvalues: ReplicatedStorage (copy) ]]
	if not p1 then
		return
	end
	if p1:GetAttribute("NoSlow") then
		return
	end
	if p1:FindFirstChild("SlowUI") then
		p1.SlowUI:Destroy()
	end
	if not p2 then
		return
	end
	ReplicatedStorage.Objects.SlowUI:Clone().Parent = p1
end)
function close() --[[ close | Line: 345 | Upvalues: v1 (ref), SelectedTower (copy), Tower (ref) ]]
	if workspace.Visuals:FindFirstChild("RangePart") then
		workspace.Visuals.RangePart:Destroy()
	end
	if workspace.Visuals:FindFirstChild("SelectHighlight") then
		workspace.Visuals.SelectHighlight:Destroy()
	end
	pcall(function() --[[ Line: 353 | Upvalues: v1 (ref) ]]
		if v1.Name ~= "Puppet" then
			return
		end
		for k, v in pairs(v1:GetDescendants()) do
			if v:IsA("BasePart") and (v.Parent.Name ~= "Present Model" and v.Parent.Name ~= "Puppet") then
				v.Transparency = 0
			end
		end
	end)
	v1 = nil
	SelectedTower.Value = nil
	if Tower:IsA("BillboardGui") then
		Tower.Adornee = nil
		Tower.Enabled = false
	else
		Tower.Visible = false
	end
end
local v4 = nil
local v5 = nil
local v6 = nil
local v7 = nil
function changeFrame(p1) --[[ changeFrame | Line: 379 | Upvalues: BillBoards (copy), Tower (ref), v4 (ref), v5 (ref), v6 (ref), v7 (ref), ReplicatedStorage (copy), SelectedTower (copy), Update (copy) ]]
	if not BillBoards:FindFirstChild(p1) then
		return
	end
	Tower = BillBoards:FindFirstChild(p1)
	for k, v in pairs(BillBoards:GetChildren()) do
		if v.Name ~= "SelectedTower" then
			if v:IsA("BillboardGui") then
				v.Adornee = nil
				v.Enabled = false
				continue
			end
			v.Visible = false
		end
	end
	if v4 then
		v4:Disconnect()
	end
	if v5 then
		v5:Disconnect()
	end
	if v6 then
		v6:Disconnect()
	end
	if not v7 then
		v4 = Tower.PetStats.Close.MouseButton1Click:Connect(close)
		v5 = Tower.PetStats.Sell.MouseButton1Click:Connect(function() --[[ Line: 400 | Upvalues: ReplicatedStorage (ref), SelectedTower (ref) ]]
			ReplicatedStorage.Remotes.Towers.Sell:FireServer(SelectedTower.Value)
			task.spawn(close)
		end)
		v6 = Tower.PetStats.Target.MouseButton1Click:Connect(function() --[[ Line: 405 | Upvalues: ReplicatedStorage (ref), SelectedTower (ref) ]]
			ReplicatedStorage.Remotes.Towers.Target:FireServer(SelectedTower.Value)
		end)
		v7 = Tower.PetStats.Upgrade.MouseButton1Click:Connect(function() --[[ Line: 409 | Upvalues: ReplicatedStorage (ref), SelectedTower (ref) ]]
			ReplicatedStorage.Remotes.Towers.Upgrade:FireServer(SelectedTower.Value)
		end)
		task.spawn(Update)
		return
	end
	v7:Disconnect()
	v4 = Tower.PetStats.Close.MouseButton1Click:Connect(close)
	v5 = Tower.PetStats.Sell.MouseButton1Click:Connect(function() --[[ Line: 400 | Upvalues: ReplicatedStorage (ref), SelectedTower (ref) ]]
		ReplicatedStorage.Remotes.Towers.Sell:FireServer(SelectedTower.Value)
		task.spawn(close)
	end)
	v6 = Tower.PetStats.Target.MouseButton1Click:Connect(function() --[[ Line: 405 | Upvalues: ReplicatedStorage (ref), SelectedTower (ref) ]]
		ReplicatedStorage.Remotes.Towers.Target:FireServer(SelectedTower.Value)
	end)
	v7 = Tower.PetStats.Upgrade.MouseButton1Click:Connect(function() --[[ Line: 409 | Upvalues: ReplicatedStorage (ref), SelectedTower (ref) ]]
		ReplicatedStorage.Remotes.Towers.Upgrade:FireServer(SelectedTower.Value)
	end)
	task.spawn(Update)
end
function click() --[[ click | Line: 416 | Upvalues: raycast (copy), v1 (ref), Towers (copy), Update (copy), UserInputService (copy) ]]
	local v12 = raycast()
	if not (v12 and v12.Instance) then
		task.spawn(close)
		return
	end
	local v2 = v1
	local v3 = v12.Instance
	repeat
		v3 = v3.Parent
		if v3 and (v3.Parent and (v3.Parent.Name == "Towers" and v3.Parent:IsA("Folder"))) then
			break
		end
	until not v3
	if not (v3 and Towers.Towers[v3.Name]) then
		close()
		return
	end
	v1 = v3
	if v2 and (v2 ~= v3 and v2:FindFirstChild("RangePart")) then
		v2.RangePart:Destroy()
	end
	if v3 and not v3:FindFirstChild("RangePart") then
		Update()
		return
	end
	if not v3 or UserInputService.GamepadEnabled then
		return
	end
	close()
end
PlayerGui:WaitForChild("UnitManager"):WaitForChild("MainFrame"):GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 441 | Upvalues: BillBoards (copy), PlayerGui (copy) ]]
	if not BillBoards.Right.Visible then
		return
	end
	changeFrame("Left")
	repeat
		task.wait(0.1)
	until not PlayerGui.UnitManager.MainFrame.Visible
	changeFrame("Right")
end)
BillBoards.Right:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 451 | Upvalues: PlayerGui (copy) ]]
	if not PlayerGui:WaitForChild("UnitManager"):WaitForChild("MainFrame").Visible then
		return
	end
	changeFrame("Left")
	repeat
		task.wait(0.1)
	until not PlayerGui.UnitManager.MainFrame.Visible
	changeFrame("Right")
end)
ReplicatedStorage.Remotes.Misc.UnitManager.Event:Connect(function(p1, p2) --[[ Line: 461 | Upvalues: v1 (ref), Update (copy), ReplicatedStorage (copy) ]]
	if not p1 then
		return
	end
	if not p2 then
		v1 = p1
		Update()
		return
	end
	if p2 == "Upgrade" then
		ReplicatedStorage.Remotes.Towers.Upgrade:FireServer(p1)
		return
	end
	if p2 ~= "Sell" then
		return
	end
	ReplicatedStorage.Remotes.Towers.Sell:FireServer(p1)
end)
UserInputService.InputBegan:Connect(function(p1, p2) --[[ Line: 473 | Upvalues: SelectedTower (copy), ReplicatedStorage (copy) ]]
	if p2 then
		return
	end
	if p1.UserInputType == Enum.UserInputType.MouseButton1 then
		task.spawn(click)
		return
	end
	if p1.UserInputType == Enum.UserInputType.Touch then
		task.spawn(click)
		return
	end
	if p1.KeyCode == Enum.KeyCode.E and SelectedTower.Value then
		ReplicatedStorage.Remotes.Towers.Upgrade:FireServer(SelectedTower.Value)
		return
	end
	if p1.KeyCode == Enum.KeyCode.X and SelectedTower.Value then
		ReplicatedStorage.Remotes.Towers.Sell:FireServer(SelectedTower.Value)
		task.spawn(close)
		return
	end
	if p1.KeyCode == Enum.KeyCode.Q then
		task.spawn(close)
		return
	end
	if p1.KeyCode == Enum.KeyCode.ButtonR2 then
		task.spawn(click)
		return
	end
	if p1.KeyCode == Enum.KeyCode.ButtonX and SelectedTower.Value then
		ReplicatedStorage.Remotes.Towers.Upgrade:FireServer(SelectedTower.Value)
		return
	end
	if p1.KeyCode ~= Enum.KeyCode.ButtonB or not SelectedTower.Value then
		return
	end
	ReplicatedStorage.Remotes.Towers.Sell:FireServer(SelectedTower.Value)
end)
Tween:AddButton(BillBoards.Tower.PetStats.Upgrade)
Tween:AddButton(BillBoards.Tower.PetStats.Sell)
Tween:AddButton(BillBoards.Tower.PetStats.Close)
Tween:AddButton(BillBoards.Tower.PetStats.Target)
Tween:AddButton(BillBoards.Right.PetStats.Upgrade)
Tween:AddButton(BillBoards.Right.PetStats.Sell)
Tween:AddButton(BillBoards.Right.PetStats.Close)
Tween:AddButton(BillBoards.Right.PetStats.Target)
Tween:AddButton(BillBoards.Left.PetStats.Upgrade)
Tween:AddButton(BillBoards.Left.PetStats.Sell)
Tween:AddButton(BillBoards.Left.PetStats.Close)
Tween:AddButton(BillBoards.Left.PetStats.Target)
ReplicatedStorage.Remotes.Towers.Upgrade.OnClientEvent:Connect(Update)
ReplicatedStorage.Remotes.Towers.Target.OnClientEvent:Connect(Update)
ReplicatedStorage.Remotes.Misc.UpgradesFrame.Event:Connect(changeFrame)
ReplicatedStorage.Remotes.Towers.MetaData.OnClientEvent:Connect(function(p1) --[[ Line: 513 | Upvalues: Towers (copy) ]]
	if not p1 then
		return
	end
	if pcall(function() --[[ Line: 515 | Upvalues: p1 (ref), Towers (ref) ]]
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