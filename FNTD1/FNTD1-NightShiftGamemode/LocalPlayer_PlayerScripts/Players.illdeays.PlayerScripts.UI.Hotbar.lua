-- https://lua.expert/
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ClientState = require(ReplicatedStorage.PlayerData.ClientState)
local Towers = require(ReplicatedStorage.Configs.Towers)
require(ReplicatedStorage.Libs.Tween)
local Misc = require(ReplicatedStorage.Configs.Misc)
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local Main = PlayerGui:WaitForChild("Placement"):WaitForChild("Hotbar"):WaitForChild("Main")
local v1
repeat
	task.wait(0.1)
	v1 = ClientState.GetData()
until v1
function update() --[[ update | Line: 20 | Upvalues: v1 (ref), ClientState (copy), Main (copy), Misc (copy), Towers (copy), ReplicatedStorage (copy), PlayerGui (copy) ]]
	v1 = ClientState.GetData()
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
	for k, v in pairs(v1.Towers) do
		if v.Equipped and Main:FindFirstChild(v.Equipped) then
			pcall(function() --[[ Line: 55 | Upvalues: Main (ref), v (copy), Towers (ref), ReplicatedStorage (ref), Misc (ref), PlayerGui (ref), tbl (copy) ]]
				local v1 = Main[v.Equipped]
				v1.BorderImage.TowerImage.Image = if Towers.Towers[v.Name] then Towers.Towers[v.Name].Image else ""
				if v1.PowerPrice.Visible then
					v1.PowerPrice.Info.Text = math.round(Misc.PowerCosts[Towers.Towers[v.Name].Rarity] / (ReplicatedStorage.Remotes.Main.GetPlacements:InvokeServer(v.Name) * ReplicatedStorage.Values.PlayerAmount.Value) * 10) / 10 .. "%"
				else
					v1.Price.Info.Text = if Towers.Towers[v.Name] then "$" .. Towers.Towers[v.Name].PlacePrice else ""
					v1.Price.Visible = true
				end
				v1.TowerName.Value = v.Name
				v1.Shiny.Visible = v.Shiny and true or false
				if v1.BorderImage:FindFirstChild("BorderGradient") then
					v1.BorderImage.BorderGradient:Destroy()
				end
				if v.Shiny then
					local BorderGradient = ReplicatedStorage.Objects.Gradients.Shiny:Clone()
					BorderGradient.Name = "BorderGradient"
					BorderGradient.Parent = v1.BorderImage
				else
					local Rarity = Towers.Towers[v.Name].Rarity
					local BorderGradient = if Rarity and ReplicatedStorage.Objects.Gradients:FindFirstChild(Rarity) then ReplicatedStorage.Objects.Gradients[Rarity]:Clone() else ReplicatedStorage.Objects.Gradients.Common:Clone()
					BorderGradient.Name = "BorderGradient"
					BorderGradient.Parent = v1.BorderImage
				end
				if v1:FindFirstChild("Enchant") then
					v1.Enchant:Destroy()
				end
				if v.Enchant and ReplicatedStorage.Objects.Enchants:FindFirstChild(v.Enchant) then
					local Enchant = ReplicatedStorage.Objects.Enchants[v.Enchant]:Clone()
					Enchant.Name = "Enchant"
					Enchant.ZIndex = 100
					Enchant.Parent = v1
					if table.find(Misc.EnchantShines, v.Enchant) then
						local v7 = PlayerGui:WaitForChild("Effects").Shine:Clone()
						v7.Parent = Enchant
						PlayerGui:WaitForChild("Effects").Event:Fire(v7)
					end
				end
				tbl[v1] = nil
			end)
		end
	end
	for k, v in pairs(tbl) do
		k.BorderImage.TowerImage.Image = ""
		k.Price.Visible = false
	end
end
function changeToPower() --[[ changeToPower | Line: 112 | Upvalues: ReplicatedStorage (copy), Main (copy) ]]
	if not ReplicatedStorage.Values.PowerMode.Value then
		return
	end
	for k, v in pairs(Main:GetChildren()) do
		if v:IsA("ImageButton") and not (v.Price:FindFirstChild("LockGradient") and v.Price.LockGradient.Enabled) then
			v.PowerPrice.Visible = true
			v.Price.Visible = false
		end
	end
	task.spawn(update)
end
ReplicatedStorage.Remotes.Towers.MetaData.OnClientEvent:Connect(function(p1) --[[ Line: 124 | Upvalues: Towers (copy) ]]
	if not p1 then
		return
	end
	if pcall(function() --[[ Line: 126 | Upvalues: p1 (ref), Towers (ref) ]]
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
task.spawn(update)
task.spawn(changeToPower)
ReplicatedStorage.Values.PowerMode.Changed:Connect(changeToPower)