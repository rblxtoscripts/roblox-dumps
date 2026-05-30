-- https://lua.expert/
local LocalPlayer = game.Players.LocalPlayer
local Profile = game.ReplicatedStorage.Remotes.Misc.Profile
local Title = game.ReplicatedStorage.Remotes.Misc.Title
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local Formatter = require(game.ReplicatedStorage.Libs.Formatter)
local Misc = require(game.ReplicatedStorage.Configs.Misc)
local Towers = require(game.ReplicatedStorage.Configs.Towers)
local ClientState = require(game.ReplicatedStorage.Modules.PlayerData.ClientState)
local ProfileFrame = script.Parent.ProfileFrame
local CurrentLoadout = ProfileFrame.CurrentLoadout
local Titles = script.Parent.Titles
local ProfileButton = script.Parent.Parent:WaitForChild("SideDock"):WaitForChild("Container"):WaitForChild("ProfileButton")
function Format(p1) --[[ Format | Line: 16 ]]
	return string.format("%02i", p1)
end
function convertToHMS(p1) --[[ convertToHMS | Line: 20 ]]
	local v1 = (p1 - p1 % 60) / 60
	local v2 = (v1 - v1 % 60) / 60
	return Format(v2) .. ":" .. Format(v1 - v2 * 60) .. ":" .. Format(p1 - v1 * 60)
end
function updateHotbar(p1) --[[ updateHotbar | Line: 28 | Upvalues: CurrentLoadout (copy), Misc (copy), Towers (copy) ]]
	local tbl = {}
	for k, v in pairs(CurrentLoadout:GetChildren()) do
		if v:IsA("ImageButton") then
			tbl[v] = true
			if Misc.SlotCosts[v.Name] and p1.Wins < Misc.SlotCosts[v.Name] then
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
	for k, v in pairs(p1.EquippedTowers) do
		if CurrentLoadout:FindFirstChild(v.Equipped) then
			local v1 = CurrentLoadout[v.Equipped]
			v1.BorderImage.TowerImage.Image = if Towers.Towers[v.Name] then Towers.Towers[v.Name].Image else ""
			v1.Price.Info.Text = if Towers.Towers[v.Name] then "$" .. Towers.Towers[v.Name].PlacePrice else ""
			v1.Price.Visible = true
			v1.Shiny.Visible = if v.Shiny then true else false
			if v1.BorderImage:FindFirstChild("BorderGradient") then
				v1.BorderImage.BorderGradient:Destroy()
			end
			if v.Shiny then
				local BorderGradient = game.ReplicatedStorage.Gradients.Shiny:Clone()
				BorderGradient.Name = "BorderGradient"
				BorderGradient.Parent = v1.BorderImage
			else
				local Rarity = Towers.Towers[v.Name].Rarity
				local BorderGradient = if game.ReplicatedStorage.Gradients:FindFirstChild(Rarity) then game.ReplicatedStorage.Gradients[Rarity]:Clone() else game.ReplicatedStorage.Gradients.Common:Clone()
				BorderGradient.Name = "BorderGradient"
				BorderGradient.Parent = v1.BorderImage
			end
			if v1:FindFirstChild("Enchant") then
				v1.Enchant:Destroy()
			end
			if v.Enchant and (#v.Enchant > 2 and game.ReplicatedStorage.Objects.Enchants:FindFirstChild(v.Enchant)) then
				local Enchant = game.ReplicatedStorage.Objects.Enchants[v.Enchant]:Clone()
				Enchant.Name = "Enchant"
				Enchant.ZIndex = 100
				Enchant.Parent = v1
			end
			tbl[v1] = nil
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
function updateProfile(p1) --[[ updateProfile | Line: 109 | Upvalues: ProfileFrame (copy), Formatter (copy) ]]
	local v1, _ = game.Players:GetUserThumbnailAsync(p1.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
	ProfileFrame.PlayerName.Text = game.Players:GetNameFromUserIdAsync(p1.UserId)
	ProfileFrame.UserImage.ImageLabel.Image = v1
	ProfileFrame.Wins.TextLabel.Text = "Wins: " .. Formatter.FormatCompact(p1.Wins)
	ProfileFrame.Playtime.TextLabel.Text = "Playtime: " .. convertToHMS(p1.Playtime)
	ProfileFrame.ELO.TextLabel.Text = "ELO: " .. p1.ELO
	ProfileFrame.TotalSummons.TextLabel.Text = "Total Summons: " .. Formatter.FormatCompact(p1.TotalSummons)
	ProfileFrame.PresentsOpened.TextLabel.Text = "Presents Opened: " .. Formatter.FormatCompact(p1.PresentsOpened)
	ProfileFrame.EnchantRolls.TextLabel.Text = "Enchant Rerolls: " .. Formatter.FormatCompact(p1.EnchantRerolls)
	local SelectedTitle = p1.SelectedTitle
	if ProfileFrame:FindFirstChild("PlayerTitle") then
		ProfileFrame.PlayerTitle:Destroy()
	end
	if not (SelectedTitle and game.ReplicatedStorage.Objects.Titles:FindFirstChild(SelectedTitle)) then
		updateHotbar(p1)
		return
	end
	local PlayerTitle = game.ReplicatedStorage.Objects.Titles[SelectedTitle]:FindFirstChildWhichIsA("TextLabel"):Clone()
	PlayerTitle.Name = "PlayerTitle"
	PlayerTitle.AnchorPoint = Vector2.new(0.5, 0.5)
	PlayerTitle.Size = UDim2.new(0.341, 0, 0.045, 0)
	PlayerTitle.Position = UDim2.new(0.28, 0, -0.03, 0)
	PlayerTitle.Parent = ProfileFrame
	updateHotbar(p1)
end
function updateTitles() --[[ updateTitles | Line: 138 | Upvalues: ClientState (copy), Titles (copy), Tween (copy), Title (copy), ProfileFrame (copy) ]]
	local v1 = ClientState.GetData()
	for k, v in pairs(game.ReplicatedStorage.Objects.Titles:GetChildren()) do
		if not Titles.ScrollingFrame:FindFirstChild(v.Name) and v1.Titles[v.Name] then
			local v2 = Titles.ScrollingFrame.Example:Clone()
			v2.Name = v.Name
			local v3 = v:FindFirstChildWhichIsA("TextLabel"):FindFirstChildWhichIsA("UIGradient")
			if v3 then
				v2.ImageLabel.UIGradient.Color = v3.Color
				local Label = v:FindFirstChildWhichIsA("TextLabel"):Clone()
				Label.Name = "Label"
				Label.AnchorPoint = Vector2.new(0.5, 0.5)
				Label.Size = UDim2.new(1, 0, 1, 0)
				Label.Position = UDim2.new(0.5, 0, 0.5, 0)
				Label.Parent = v2
				v2.Visible = true
				v2.Parent = Titles.ScrollingFrame
				Tween:AddButton(v2, nil, nil, nil, true)
				v2.MouseButton1Click:Connect(function() --[[ Line: 167 | Upvalues: Title (ref), v (copy), Titles (ref), ProfileFrame (ref) ]]
					Title:FireServer(v.Name)
					Titles.Visible = false
					local v1 = v.Name
					if ProfileFrame:FindFirstChild("PlayerTitle") then
						ProfileFrame.PlayerTitle:Destroy()
					end
					if not (v1 and game.ReplicatedStorage.Objects.Titles:FindFirstChild(v1)) then
						return
					end
					local PlayerTitle = game.ReplicatedStorage.Objects.Titles[v1]:FindFirstChildWhichIsA("TextLabel"):Clone()
					PlayerTitle.Name = "PlayerTitle"
					PlayerTitle.AnchorPoint = Vector2.new(0.5, 0.5)
					PlayerTitle.Size = UDim2.new(0.341, 0, 0.045, 0)
					PlayerTitle.Position = UDim2.new(0.28, 0, -0.03, 0)
					PlayerTitle.Parent = ProfileFrame
				end)
				continue
			end
			warn("No gradient found for " .. v.Name)
		end
	end
end
ProfileFrame:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 188 | Upvalues: Profile (copy) ]]
	Profile:FireServer()
end)
local v1 = false
ProfileFrame.Titles.MouseButton1Click:Connect(function() --[[ Line: 193 | Upvalues: v1 (ref), Titles (copy) ]]
	if v1 then
		return
	end
	v1 = true
	if Titles.Visible then
		Titles.Visible = not Titles.Visible
		v1 = false
		return
	end
	updateTitles()
	Titles.Visible = not Titles.Visible
	v1 = false
end)
Titles.Exit.MouseButton1Click:Connect(function() --[[ Line: 203 | Upvalues: Titles (copy) ]]
	Titles.Visible = false
end)
ProfileFrame.Exit.MouseButton1Click:Connect(function() --[[ Line: 206 | Upvalues: Titles (copy) ]]
	Titles.Visible = false
end)
updateTitles()
Profile.OnClientEvent:Connect(updateProfile)
Tween:AddButton(ProfileButton, ProfileFrame)
Tween:AddButton(ProfileFrame.Exit, ProfileFrame)
Tween:AddButton(ProfileFrame.Titles)
Tween:AddButton(Titles.Exit)