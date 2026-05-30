-- https://lua.expert/
game:GetService("TweenService")
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Remotes = ReplicatedStorage.Remotes
local v1 = require(LocalPlayer.PlayerScripts.PlayerModule):GetControls()
local Lighting = require(ReplicatedStorage.Configs.Lighting)
local Towers = require(ReplicatedStorage.Configs.Towers)
local v2 = LocalPlayer:GetMouse()
local CandyCadet = ReplicatedStorage.Objects.CandyCadet
Lighting.Change("TradingPlaza")
UserInputService.InputBegan:Connect(function() --[[ Line: 18 | Upvalues: Remotes (copy) ]]
	Remotes.Misc.AutoAFK:FireServer()
end)
local t = { "rbxassetid://140408699281768", "rbxassetid://102452523211627", "rbxassetid://17118859384" }
function musicPlaylist() --[[ musicPlaylist | Line: 23 | Upvalues: t (copy), LocalPlayer (copy), SoundService (copy) ]]
	local count = 0
	local t2 = {}
	for k, v in pairs(t) do
		table.insert(t2, v)
		count = count + 1
	end
	if LocalPlayer:FindFirstChild("StopMusic") then
		SoundService.Lobby.Playing = false
		repeat
			task.wait(0.5)
		until not LocalPlayer:FindFirstChild("StopMusic")
	else
		repeat
			local v1 = t2[math.random(1, count)]
			table.remove(t2, table.find(t2, v1))
			SoundService.Lobby.SoundId = v1
			SoundService.Lobby.Looped = false
			SoundService.Lobby:Play()
			count = count - 1
			repeat
				task.wait(0.5)
			until not SoundService.Lobby.Playing or LocalPlayer:FindFirstChild("StopMusic")
		until count <= 0 or LocalPlayer:FindFirstChild("StopMusic")
	end
	musicPlaylist()
end
local Tween = require(ReplicatedStorage.Libs.Tween)
ReplicatedStorage.Remotes.Main.Controls.OnClientEvent:Connect(function(p1) --[[ Line: 53 | Upvalues: v1 (copy) ]]
	v1:Enable(p1)
end)
ReplicatedStorage.Remotes.Main.Controls.Bindable.Event:Connect(function(p1) --[[ Line: 56 | Upvalues: v1 (copy) ]]
	v1:Enable(p1)
end)
ReplicatedStorage.Remotes.Misc.Prompt.OnClientEvent:Connect(function(p1) --[[ Line: 60 | Upvalues: MarketplaceService (copy), LocalPlayer (copy) ]]
	MarketplaceService:PromptProductPurchase(LocalPlayer, p1)
end)
local v3 = false
workspace:WaitForChild("CandyCadet"):WaitForChild("CandyCadet"):WaitForChild("ProximityPrompt").Triggered:Connect(function() --[[ Line: 65 | Upvalues: v3 (ref), SoundService (copy), CandyCadet (copy) ]]
	if not v3 then
		v3 = true
		SoundService:PlayLocalSound(CandyCadet.Intro)
		task.wait(CandyCadet.Intro.TimeLength)
		local v1 = math.random(1, 4)
		SoundService:PlayLocalSound(CandyCadet["Sound" .. v1])
		task.wait(CandyCadet["Sound" .. v1].TimeLength)
		v3 = false
	end
end)
function plrAdded(p1) --[[ plrAdded | Line: 78 | Upvalues: LocalPlayer (copy) ]]
	if LocalPlayer == p1 then
		return
	end
	local function charAdded(p12) --[[ charAdded | Line: 81 | Upvalues: LocalPlayer (ref), p1 (copy) ]]
		local v1 = if p12 then p12 else LocalPlayer.Character or p1.CharacterAdded:Wait()
		v1:WaitForChild("HumanoidRootPart", 1000)
		local v2, v3 = v1:GetBoundingBox()
		local Hitbox = Instance.new("Part")
		Hitbox.Name = "Hitbox"
		Hitbox.Transparency = 1
		Hitbox.CanCollide = false
		Hitbox.Massless = true
		Hitbox.CollisionGroup = "Players"
		Hitbox.Size = v3 * Vector3.new(1.01, 1.01, 1.01)
		Hitbox.CFrame = v2
		Hitbox.Parent = v1
		local WeldConstraint = Instance.new("WeldConstraint", Hitbox)
		WeldConstraint.Part0 = v1.HumanoidRootPart
		WeldConstraint.Part1 = Hitbox
	end
	for k, v in pairs(game.Players:GetPlayers()) do
		task.spawn(charAdded, v.Character)
	end
	p1.CharacterAdded:Connect(charAdded)
	task.spawn(charAdded, p1.Character or p1.CharacterAdded:Wait())
end
local v4 = nil
v2.Button1Down:Connect(function() --[[ Line: 113 | Upvalues: v2 (copy), Players (copy), LocalPlayer (copy), v4 (ref), Tween (copy), ReplicatedStorage (copy), Towers (copy) ]]
	if not v2.Target then
		return
	end
	local v1 = Players:GetPlayerFromCharacter(v2.Target.Parent)
	if v1 then
		local Character = v1.Character
		if LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("ActiveShowUnits") then
			LocalPlayer.PlayerGui.ActiveShowUnits:Destroy()
		else
			v4 = nil
		end
		if v4 == Character then
			return
		end
		v4 = Character
		local ActiveShowUnits = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ShowUnits"):Clone()
		ActiveShowUnits.Name = "ActiveShowUnits"
		ActiveShowUnits.Parent = LocalPlayer.PlayerGui
		ActiveShowUnits.Adornee = Character
		ActiveShowUnits.Enabled = false
		local Main = ActiveShowUnits:WaitForChild("Hotbar"):WaitForChild("Main")
		Tween:AddButton(ActiveShowUnits:WaitForChild("Exit"))
		local v22 = ReplicatedStorage.Remotes.Misc.GetTowers:InvokeServer(v1.Name)
		if v22 and (ActiveShowUnits and ActiveShowUnits.Parent) then
			(function() --[[ update | Line: 141 | Upvalues: Main (copy), v22 (copy), Towers (ref), ReplicatedStorage (ref), ActiveShowUnits (copy) ]]
				local tbl = {}
				for k, v in pairs(Main:GetChildren()) do
					if v:IsA("ImageButton") then
						tbl[v] = true
					end
				end
				for k, v in pairs(v22) do
					local v1 = Main[v.Equipped]
					v1.BorderImage.TowerImage.Image = if Towers.Towers[v.Name] then Towers.Towers[v.Name].Image else ""
					v1.Price.Info.Text = if Towers.Towers[v.Name] then "$" .. Towers.Towers[v.Name].PlacePrice else ""
					v1.Price.Visible = true
					v1.Shiny.Visible = if v.Shiny then true else false
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
					end
					tbl[v1] = nil
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
				ActiveShowUnits.Enabled = true
			end)()
		end
	else
		if not LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("ActiveShowUnits") then
			return
		end
		LocalPlayer.PlayerGui.ActiveShowUnits:Destroy()
		v4 = nil
	end
end)
ReplicatedStorage.Remotes.Towers.MetaData.OnClientEvent:Connect(function(p1) --[[ Line: 203 | Upvalues: Towers (copy) ]]
	if p1 and not pcall(function() --[[ Line: 205 | Upvalues: p1 (ref), Towers (ref) ]]
		p1 = game:GetService("HttpService"):JSONDecode(p1)
		if not p1 then
			error(0)
		end
		Towers.Towers = p1
	end) then
		warn("Failed to update Client MetaData.")
	end
end)
task.spawn(musicPlaylist)
Players.PlayerAdded:Connect(plrAdded)
for i, v in ipairs(Players:GetPlayers()) do
	task.spawn(plrAdded, v)
end