-- https://lua.expert/
local LocalPlayer = game.Players.LocalPlayer
local AdminPanel = game.ReplicatedStorage.Remotes.Main.AdminPanel
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local Enemies = require(game.ReplicatedStorage.Configs.Enemies)
local Game = require(game.ReplicatedStorage.Configs.Game)
local Misc = require(game.ReplicatedStorage.Configs.Misc)
local v1 = script.Parent
local Main = v1.Main
local Panel = script.Parent.Parent:WaitForChild("Placement"):WaitForChild("Panel")
local t = {}
local v2 = nil
local v3 = 1
local t2 = { "UncapPlacements", "SpawnEnemies", "GiveCash", "SetBaseHealth", "Reset", "Pause", "ClearEnemies", "ClearTowers" }
local t3 = { "EnemySpeed", "EnemyHealth" }
local v4 = nil
local v5 = nil
function update(p1) --[[ update | Line: 21 | Upvalues: Main (copy) ]]
	Main.StatsFrame.Pause.TextLabel.Text = if p1.Pause then "Unpase Wave" else "Pause Wave"
	Main.UncapPlacements.TextLabel.Text = if p1.UncapPlacements then "Cap Placements" else "Uncap Placements"
	if p1.EnemySpeed then
		Main.EnemySpeed.Text = "x" .. p1.EnemySpeed
	end
	if not p1.EnemyHealth then
		return
	end
	Main.EnemyHealth.Text = "x" .. p1.EnemyHealth
end
function init() --[[ init | Line: 33 | Upvalues: Main (copy), t2 (copy), Tween (copy), t (copy), t3 (copy), AdminPanel (copy) ]]
	for k, v in pairs(Main:GetDescendants()) do
		if v:IsA("ImageButton") and table.find(t2, v.Name) then
			Tween:AddButton(v)
			v.MouseButton1Click:Connect(function() --[[ Line: 39 | Upvalues: t (ref), v (copy) ]]
				t[v.Name](v)
			end)
			continue
		end
		if v:IsA("TextBox") and table.find(t3, v.Name) then
			v.FocusLost:Connect(function() --[[ Line: 43 | Upvalues: AdminPanel (ref), v (copy) ]]
				AdminPanel:FireServer(v.Name, v.Text)
			end)
		end
	end
end
function t.UncapPlacements(p1) --[[ Line: 51 | Upvalues: AdminPanel (copy) ]]
	AdminPanel:FireServer(p1.Name)
end
function t.SpawnEnemies(p1) --[[ Line: 54 | Upvalues: v1 (copy) ]]
	v1.SpawnEnemy.Visible = true
end
function t.GiveCash(p1) --[[ Line: 57 | Upvalues: v1 (copy) ]]
	v1.GiveCash.Visible = true
end
function t.SetBaseHealth(p1) --[[ Line: 60 | Upvalues: v1 (copy) ]]
	v1.SetHealth.Visible = true
end
function t.Reset(p1) --[[ Line: 63 | Upvalues: AdminPanel (copy) ]]
	AdminPanel:FireServer(p1.Name)
end
function t.Pause(p1) --[[ Line: 66 | Upvalues: AdminPanel (copy) ]]
	AdminPanel:FireServer(p1.Name)
end
function t.ClearEnemies(p1) --[[ Line: 69 | Upvalues: AdminPanel (copy) ]]
	AdminPanel:FireServer(p1.Name)
end
function t.ClearTowers(p1) --[[ Line: 72 | Upvalues: AdminPanel (copy) ]]
	AdminPanel:FireServer(p1.Name)
end
v1.GiveCash.Exit.MouseButton1Click:Connect(function() --[[ Line: 76 | Upvalues: v1 (copy) ]]
	v1.GiveCash.Visible = false
end)
v1.GiveCash.Give.MouseButton1Click:Connect(function() --[[ Line: 79 | Upvalues: v1 (copy), AdminPanel (copy) ]]
	v1.GiveCash.Visible = false
	AdminPanel:FireServer("GiveCash", v1.GiveCash.TextBox.Text)
end)
v1.SetHealth.Exit.MouseButton1Click:Connect(function() --[[ Line: 84 | Upvalues: v1 (copy) ]]
	v1.SetHealth.Visible = false
end)
v1.SetHealth.Give.MouseButton1Click:Connect(function() --[[ Line: 87 | Upvalues: v1 (copy), AdminPanel (copy) ]]
	v1.SetHealth.Visible = false
	AdminPanel:FireServer("SetBaseHealth", v1.SetHealth.TextBox.Text)
end)
function updateSelected() --[[ updateSelected | Line: 92 | Upvalues: v1 (copy), v4 (ref) ]]
	for k, v in pairs(v1.SpawnEnemy.Enemies:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "Example" then
			if v.Name == v4 then
				v.ImageLabel.ImageColor3 = Color3.fromRGB(33, 255, 40)
				v.PlayerName.TextColor3 = Color3.fromRGB(33, 255, 40)
				continue
			end
			v.ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
			v.PlayerName.TextColor3 = Color3.fromRGB(255, 255, 255)
		end
	end
	for k, v in pairs(v1.SpawnEnemy.Bosses:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "Example" then
			if v.Name == v4 then
				v.ImageLabel.ImageColor3 = Color3.fromRGB(33, 255, 40)
				v.PlayerName.TextColor3 = Color3.fromRGB(33, 255, 40)
				continue
			end
			v.ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
			v.PlayerName.TextColor3 = Color3.fromRGB(255, 255, 255)
		end
	end
end
local t4 = {}
function updateEnemies() --[[ updateEnemies | Line: 116 | Upvalues: v2 (ref), Game (copy), v1 (copy), t4 (copy), v3 (ref), Enemies (copy), v4 (ref), v5 (ref) ]]
	local t = {}
	local v12
	if v2 then
		v12 = false
	else
		v12 = true
		v2 = 0
	end
	for k, v in pairs(Game) do
		table.insert(t, k)
		if v12 then
			v2 = v2 + 1
		end
	end
	for k, v in pairs(v1.SpawnEnemy.Enemies:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "Example" then
			v:Destroy()
		end
	end
	for k, v in pairs(v1.SpawnEnemy.Bosses:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "Example" then
			v:Destroy()
		end
	end
	for k, v in pairs(t4) do
		v:Disconnect()
	end
	local v22 = v3
	local v32 = t[v3]
	v1.SpawnEnemy.Game.Text = "Game" .. v32
	local tbl = {}
	local tbl2 = {}
	for k, v in pairs(Game[v32].Nights) do
		if v.Boss and (v.Boss.Name and (Enemies[v.Boss.Name] and not table.find(tbl, v.Boss.Name))) then
			table.insert(tbl, v.Boss.Name)
		end
		local Waves = v.Waves
		if v.Waves then
			for k2, v6 in pairs(Waves) do
				if v6.Enemies then
					for k3, v7 in pairs(v6.Enemies) do
						if v7.Enemy and (Enemies[v7.Enemy] and not table.find(tbl2, v7.Enemy)) then
							table.insert(tbl2, v7.Enemy)
						end
					end
				end
			end
		end
	end
	if v3 ~= v22 then
		return
	end
	for k, v in pairs(tbl2) do
		if v3 ~= v22 then
			return
		end
		local v52 = v1.SpawnEnemy.Enemies.Example:Clone()
		v52.Name = v
		v52.PlayerName.Text = v
		v52.Parent = v1.SpawnEnemy.Enemies
		v52.Visible = true
		local v6 = v52.Click.MouseButton1Click:Connect(function() --[[ Line: 179 | Upvalues: v4 (ref), v52 (copy), v5 (ref) ]]
			v4 = v52.Name
			v5 = "Enemy"
			updateSelected()
		end)
		table.insert(t4, v6)
	end
	for k, v in pairs(tbl) do
		if v3 ~= v22 then
			break
		end
		local v8 = v1.SpawnEnemy.Bosses.Example:Clone()
		v8.Name = v
		v8.PlayerName.Text = v
		v8.Parent = v1.SpawnEnemy.Bosses
		v8.Visible = true
		local v9 = v8.Click.MouseButton1Click:Connect(function() --[[ Line: 196 | Upvalues: v4 (ref), v8 (copy), v5 (ref) ]]
			v4 = v8.Name
			v5 = "Boss"
			updateSelected()
		end)
		table.insert(t4, v9)
	end
end
v1.SpawnEnemy.Exit.MouseButton1Click:Connect(function() --[[ Line: 205 | Upvalues: v1 (copy) ]]
	v1.SpawnEnemy.Visible = false
end)
v1.SpawnEnemy.Previous.MouseButton1Click:Connect(function() --[[ Line: 208 | Upvalues: v3 (ref), v2 (ref) ]]
	v3 = if v3 <= 1 then v2 else v3 - 1
	updateEnemies()
end)
v1.SpawnEnemy.Next.MouseButton1Click:Connect(function() --[[ Line: 217 | Upvalues: v3 (ref), v2 (ref) ]]
	v3 = if v2 <= v3 then 1 else v3 + 1
	updateEnemies()
end)
v1.SpawnEnemy.Spawn.MouseButton1Click:Connect(function() --[[ Line: 226 | Upvalues: AdminPanel (copy), v5 (ref), v4 (ref), v1 (copy) ]]
	AdminPanel:FireServer("SpawnEnemies", v5, v4, v1.SpawnEnemy.Amount.Text)
end)
init()
updateEnemies()
local v6 = false
if LocalPlayer:GetRankInGroup(33298472) == 15 or (LocalPlayer:GetRankInGroup(33298472) == 255 or (LocalPlayer:GetRankInGroup(33298472) == 254 or game:GetService("RunService"):IsStudio())) or table.find(Misc.AdminPanel, LocalPlayer.UserId) or game.PlaceId == 17770163569 then
	v6 = true
end
if v6 then
	Panel.Visible = true
end
AdminPanel.OnClientEvent:Connect(update)
Tween:AddButton(v1.GiveCash.Exit)
Tween:AddButton(v1.GiveCash.Give)
Tween:AddButton(v1.SetHealth.Exit)
Tween:AddButton(v1.SetHealth.Give)
Tween:AddButton(v1.SpawnEnemy.Exit)
Tween:AddButton(v1.SpawnEnemy.Previous)
Tween:AddButton(v1.SpawnEnemy.Next)
Tween:AddButton(v1.SpawnEnemy.Spawn)
Tween:AddButton(Panel, Main)
Tween:AddButton(Main.Exit, Main)