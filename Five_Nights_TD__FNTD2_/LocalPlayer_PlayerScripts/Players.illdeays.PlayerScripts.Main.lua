-- https://lua.expert/
local TweenService = game:GetService("TweenService")
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
require(ReplicatedStorage.Modules.PlayerData.ClientState)
local v2 = LocalPlayer:GetMouse()
local Tween = require(ReplicatedStorage.Libs.Tween)
local v3 = true
UserInputService.InputBegan:Connect(function() --[[ Line: 21 | Upvalues: Remotes (copy) ]]
	Remotes.Misc.AutoAFK:FireServer()
end)
local t = { "rbxassetid://17118859384", "rbxassetid://85938546588295", "rbxassetid://82895241717943", "rbxassetid://127434161726910" }
function musicPlaylist() --[[ musicPlaylist | Line: 26 | Upvalues: t (copy), LocalPlayer (copy), SoundService (copy) ]]
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
Remotes.Misc.EventTP.OnClientEvent:Connect(function(p1) --[[ Line: 54 | Upvalues: v3 (ref), LocalPlayer (copy) ]]
	if p1 == "Summer" then
		if not v3 then
			v3 = true
			local StopMusic = Instance.new("StringValue", LocalPlayer)
			StopMusic.Name = "StopMusic"
			task.wait(0.5)
			StopMusic:Destroy()
		end
	else
		if not v3 then
			return
		end
		v3 = false
		local StopMusic = Instance.new("StringValue", LocalPlayer)
		StopMusic.Name = "StopMusic"
		task.wait(0.5)
		StopMusic:Destroy()
	end
end)
local t2 = {}
Remotes.Main.Elevator.OnClientEvent:Connect(function(p1, p2) --[[ Line: 75 | Upvalues: t2 (copy), TweenService (copy) ]]
	if p1:FindFirstChild("Boat") then
		if not p1.Boat.PrimaryPart then
			return
		end
		if not t2[p1] then
			t2[p1] = p1.Boat.PrimaryPart.CFrame
		end
		if p2 then
			local v1 = p1.Boat:WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(script.BoatAnimation)
			v1:Play()
			task.wait(10)
			v1:Stop()
			p1.Boat.PrimaryPart.CFrame = t2[p1]
		end
	elseif p1 and p1:FindFirstChild("PlayerUI") then
		if not t2[p1] then
			t2[p1] = {}
			t2[p1] = p1.Door:WaitForChild("Main").CFrame
		end
		if p2 then
			TweenService:Create(p1.Door.Main, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				CFrame = t2[p1]
			}):Play()
		else
			local v3 = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
			local t = {}
			t.CFrame = t2[p1] * CFrame.new((Vector3.new(0, p1.Door.Main.Size.Y, 0)))
			TweenService:Create(p1.Door.Main, v3, t):Play()
		end
	else
		if not (p1 and p1:FindFirstChild("Door")) then
			return
		end
		if not t2[p1] then
			t2[p1] = {}
			t2[p1][1] = p1.Door:WaitForChild("Left").CFrame
			t2[p1][2] = p1.Door:WaitForChild("Right").CFrame
		end
		if p2 then
			local v6 = TweenService:Create(p1.Door.Left, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				CFrame = t2[p1][1]
			})
			local v7 = TweenService:Create(p1.Door.Right, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				CFrame = t2[p1][2]
			})
			v6:Play()
			v7:Play()
			return
		end
		local v9 = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
		local t = {}
		t.CFrame = t2[p1][1] * CFrame.new((Vector3.new(p1.Door.Left.Size.X, 0, 0)))
		local v12 = TweenService:Create(p1.Door.Left, v9, t)
		local v14 = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.In)
		local t3 = {}
		t3.CFrame = t2[p1][2] * CFrame.new((Vector3.new(p1.Door.Right.Size.X, 0, 0)))
		local v17 = TweenService:Create(p1.Door.Right, v14, t3)
		v12:Play()
		v17:Play()
	end
end)
ReplicatedStorage.Remotes.Main.Controls.OnClientEvent:Connect(function(p1) --[[ Line: 120 | Upvalues: v1 (copy) ]]
	v1:Enable(p1)
end)
ReplicatedStorage.Remotes.Main.Controls.Bindable.Event:Connect(function(p1) --[[ Line: 123 | Upvalues: v1 (copy) ]]
	v1:Enable(p1)
end)
ReplicatedStorage.Remotes.Misc.Prompt.OnClientEvent:Connect(function(p1) --[[ Line: 127 | Upvalues: MarketplaceService (copy), LocalPlayer (copy) ]]
	MarketplaceService:PromptProductPurchase(LocalPlayer, p1)
end)
function plrAdded(p1) --[[ plrAdded | Line: 131 | Upvalues: LocalPlayer (copy) ]]
	if LocalPlayer == p1 then
		return
	end
	local function charAdded(p12) --[[ charAdded | Line: 134 | Upvalues: LocalPlayer (ref), p1 (copy) ]]
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
LocalPlayer.CharacterAdded:Connect(function() --[[ Line: 165 | Upvalues: Lighting (copy) ]]
	Lighting.Change("Lobby")
end)
local v4 = nil
v2.Button1Down:Connect(function() --[[ Line: 170 | Upvalues: v2 (copy), Players (copy), LocalPlayer (copy), v4 (ref), Tween (copy), ReplicatedStorage (copy), Towers (copy) ]]
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
			(function() --[[ update | Line: 198 | Upvalues: Main (copy), v22 (copy), Towers (ref), ReplicatedStorage (ref), ActiveShowUnits (copy) ]]
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
ReplicatedStorage.Remotes.Towers.MetaData.OnClientEvent:Connect(function(p1) --[[ Line: 260 | Upvalues: Towers (copy) ]]
	if not p1 then
		return
	end
	if pcall(function() --[[ Line: 262 | Upvalues: p1 (ref), Towers (ref) ]]
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
task.spawn(musicPlaylist)
Players.PlayerAdded:Connect(plrAdded)
for i, v in ipairs(Players:GetPlayers()) do
	task.spawn(plrAdded, v)
end