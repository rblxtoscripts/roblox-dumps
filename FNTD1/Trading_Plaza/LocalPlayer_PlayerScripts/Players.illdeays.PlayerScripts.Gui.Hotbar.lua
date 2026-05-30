-- https://lua.expert/
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ClientState = require(ReplicatedStorage.Modules.PlayerData.ClientState)
local Towers = require(ReplicatedStorage.Configs.Towers)
local Tween = require(ReplicatedStorage.Libs.Tween)
require(ReplicatedStorage.Modules.Towers.TowersModule)
local Misc = require(ReplicatedStorage.Configs.Misc)
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local Main = PlayerGui:WaitForChild("Placement"):WaitForChild("Hotbar"):WaitForChild("Main")
local t = {}
function update() --[[ update | Line: 17 | Upvalues: ClientState (copy), Main (copy), Misc (copy), t (ref), Towers (copy), ReplicatedStorage (copy), PlayerGui (copy) ]]
	local v1 = ClientState.GetData()
	local tbl = {}
	for k, v in pairs(Main:GetChildren()) do
		if v:IsA("ImageButton") then
			tbl[v] = true
			if Misc.SlotCosts[v.Name] and v1.Wins < Misc.SlotCosts[v.Name] then
				v.Locked.Visible = true
				v.Price.ImageColor3 = Color3.fromRGB(110, 123, 132)
				v.Price.Info.TextColor3 = Color3.fromRGB(110, 123, 132)
				v.BorderImage.ImageColor3 = Color3.fromRGB(110, 123, 132)
				if v.Price:FindFirstChild("LockGradient") then
					v.Price.LockGradient.Enabled = true
				end
				if v.BorderImage:FindFirstChild("LockGradient") then
					v.BorderImage.LockGradient.Enabled = true
				end
				continue
			end
			if v:FindFirstChild("Locked") then
				v.Locked.Visible = false
				v.Price.ImageColor3 = Color3.fromRGB(0, 255, 0)
				v.Price.Info.TextColor3 = Color3.fromRGB(0, 255, 0)
				v.BorderImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
				if v.Price:FindFirstChild("LockGradient") then
					v.Price.LockGradient.Enabled = false
				end
				if v.BorderImage:FindFirstChild("LockGradient") then
					v.BorderImage.LockGradient.Enabled = false
				end
			end
		end
	end
	t = {}
	for k, v in pairs(v1.Towers) do
		if v.Equipped and Main:FindFirstChild(v.Equipped) then
			t[v.ID] = v.Equipped
			pcall(function() --[[ Line: 54 | Upvalues: Main (ref), v (copy), Towers (ref), ReplicatedStorage (ref), Misc (ref), PlayerGui (ref), tbl (copy) ]]
				local v1 = Main[v.Equipped]
				v1.BorderImage.TowerImage.Image = if Towers.Towers[v.Name] then Towers.Towers[v.Name].Image else ""
				v1.Price.Info.Text = if Towers.Towers[v.Name] then "$" .. Towers.Towers[v.Name].PlacePrice else ""
				v1.Price.Visible = true
				v1.Shiny.Visible = v.Shiny and true or false
				if v1.BorderImage:FindFirstChild("BorderGradient") then
					v1.BorderImage.BorderGradient:Destroy()
				end
				if v.Shiny then
					local BorderGradient = ReplicatedStorage.Gradients.Shiny:Clone()
					BorderGradient.Name = "BorderGradient"
					BorderGradient.Parent = v1.BorderImage
				else
					local Rarity = Towers.Towers[v.Name].Rarity
					local BorderGradient = if ReplicatedStorage.Gradients:FindFirstChild(Rarity) then ReplicatedStorage.Gradients[Rarity]:Clone() else ReplicatedStorage.Gradients.Common:Clone()
					BorderGradient.Name = "BorderGradient"
					BorderGradient.Parent = v1.BorderImage
				end
				if v1:FindFirstChild("Enchant") then
					v1.Enchant:Destroy()
				end
				if v.Enchant and (#v.Enchant > 2 and ReplicatedStorage.Objects.Enchants:FindFirstChild(v.Enchant)) then
					local Enchant = ReplicatedStorage.Objects.Enchants[v.Enchant]:Clone()
					Enchant.Name = "Enchant"
					Enchant.ZIndex = 100
					Enchant.Parent = v1
					if table.find(Misc.EnchantShines, v.Enchant) then
						local v5 = PlayerGui:WaitForChild("Effects").Shine:Clone()
						v5.Parent = Enchant
						PlayerGui:WaitForChild("Effects").Event:Fire(v5)
					end
				end
				tbl[v1] = nil
			end)
		end
	end
	for k, v in pairs(tbl) do
		k.BorderImage.TowerImage.Image = ""
		k.Price.Visible = false
		k.Shiny.Visible = false
		if k:FindFirstChild("Enchant") then
			k.Enchant:Destroy()
		end
		if k.BorderImage:FindFirstChild("BorderGradient") then
			k.BorderImage.BorderGradient:Destroy()
		end
	end
end
ReplicatedStorage.Remotes.Misc.Enchant.OnClientEvent:Connect(function(p1, p2) --[[ Line: 111 | Upvalues: ClientState (copy), Main (copy), ReplicatedStorage (copy) ]]
	local v1 = ClientState.GetData().Towers[p2]
	if not v1 then
		return
	end
	local Equipped = v1.Equipped
	if not Equipped then
		return
	end
	local v2 = Main:FindFirstChild(Equipped)
	if not v2 then
		return
	end
	if v2:FindFirstChild("Enchant") then
		v2.Enchant:Destroy()
	end
	if not ReplicatedStorage.Objects.Enchants:FindFirstChild(p1) then
		return
	end
	local Enchant = ReplicatedStorage.Objects.Enchants[p1]:Clone()
	Enchant.Name = "Enchant"
	Enchant.ZIndex = 100
	Enchant.Parent = v2
end)
task.spawn(update)
for k, v in pairs(Main:GetChildren()) do
	if v:IsA("ImageButton") then
		Tween:AddButton(v, nil, "ButtonClick")
	end
end
ReplicatedStorage.Remotes.Towers.Equip.OnClientEvent:Connect(update)
ReplicatedStorage.Remotes.Towers.Unequip.OnClientEvent:Connect(update)
ReplicatedStorage.Remotes.Towers.Delete.OnClientEvent:Connect(update)
ReplicatedStorage.Remotes.Towers.MetaData.OnClientEvent:Connect(function(p1) --[[ Line: 142 | Upvalues: Towers (copy) ]]
	if not p1 then
		return
	end
	if pcall(function() --[[ Line: 144 | Upvalues: p1 (ref), Towers (ref) ]]
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