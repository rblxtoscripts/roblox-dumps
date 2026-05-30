-- https://lua.expert/
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local Tween = require(ReplicatedStorage:WaitForChild("Libs"):WaitForChild("Tween"))
local Game = require(ReplicatedStorage.Configs.Game)
local ClientState = require(ReplicatedStorage.PlayerData.ClientState)
local Images = require(ReplicatedStorage.Configs.Images)
local Misc = require(ReplicatedStorage.Configs.Misc)
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local GameSelection = PlayerGui:WaitForChild("GameSelection")
local EndlessGameSelection = GameSelection:WaitForChild("EndlessGameSelection")
local PowerModeGameSelection = GameSelection:WaitForChild("PowerModeGameSelection")
local SummerGameSelectionFrame = GameSelection:WaitForChild("SummerGameSelectionFrame")
local PVPGameSelection = GameSelection:WaitForChild("PVPGameSelection")
local GameSelectionFrame = GameSelection:WaitForChild("GameSelectionFrame")
local Main = GameSelectionFrame:WaitForChild("Main")
local GameSelector = Main:WaitForChild("GameSelector")
local NightSelector = Main:WaitForChild("NightSelector")
local NightSelector_2 = SummerGameSelectionFrame:WaitForChild("Main"):WaitForChild("NightSelector")
local NightInfo = Main:WaitForChild("NightInfo")
local WaitingFrame = GameSelection:WaitForChild("WaitingFrame")
local VotesFrame = GameSelection:WaitForChild("VotesFrame")
local Vote = EndlessGameSelection:WaitForChild("Main"):WaitForChild("Vote")
local Vote_2 = PowerModeGameSelection:WaitForChild("Main"):WaitForChild("Vote")
local Difficulties = Misc.Difficulties
local t = { 12, 14, 16, 18, 20 }
local t2 = {
	Color3.fromRGB(66, 255, 79),
	Color3.fromRGB(252, 255, 57),
	Color3.fromRGB(255, 41, 45),
	Color3.fromRGB(139, 19, 21),
	Color3.fromRGB(13, 1, 1)
}
local v1 = nil
local v2 = nil
local v3 = 1
local v4 = false
local v5 = nil
local v6 = nil
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false)
if game.ReplicatedStorage:WaitForChild("Values"):WaitForChild("Wave").Value ~= 0 then
	WaitingFrame.Visible = false
	PlayerGui:WaitForChild("Placement"):WaitForChild("Hotbar").Visible = true
	script.Enabled = false
	return
end
local function voteUpdate() --[[ voteUpdate | Line: 51 | Upvalues: v2 (ref), v1 (ref), NightSelector (copy) ]]
	if v2 and v1 then
		NightSelector.Info.PlayButton.ImageTransparency = 0
		NightSelector.Info.PlayButton.Title.TextTransparency = 0
	else
		NightSelector.Info.PlayButton.ImageTransparency = 0.6
		NightSelector.Info.PlayButton.Title.TextTransparency = 0.6
	end
end
local function updateNightInfo(p1) --[[ updateNightInfo | Line: 61 | Upvalues: v2 (ref), v1 (ref), Game (copy), SummerGameSelectionFrame (copy), NightInfo (copy), v3 (ref), Difficulties (copy), Misc (copy), v5 (ref), Images (copy), t (copy) ]]
	if not (v2 and v1) then
		return
	end
	local v12 = Game[v1].Nights[v2]
	local v22 = if p1 == "Event" then SummerGameSelectionFrame:WaitForChild("Main"):WaitForChild("NightInfo") else NightInfo
	v22.Main.BossInfo.Text = v12.Boss.Name
	for v32, v4 in v22.RewardsInfo:GetChildren() do
		if v4.Name == "Reward" then
			v4:Destroy()
		end
	end
	local v52 = v3
	for v10, v11 in if v12.Rewards[Difficulties[v52]] then v12.Rewards[Difficulties[v52]] else v12.Rewards do
		local v7, v8, v9
		if v11 ~= "DontShow" and (v10 ~= "XP" and not table.find(Misc.Difficulties, v10)) then
			local v13 = tostring(v1)
			if v13 == tostring(v5.Game) then
				local v15 = tostring(v2)
				v7 = v15 == tostring(v5.Night)
			else
				v7 = false
			end
			v8 = if typeof(v11) == "table" and v11.Chance then v11.Chance else v11
			local v16 = 1
			if typeof(v11) == "table" and v11.Amount and typeof(v11.Amount) == "table" then
				v16 = v11.Amount[1] .. "-" .. v11.Amount[2]
			end
			if v7 and tonumber(v8) then
				v8 = v8 * 2.5
				if v8 > 100 then
					v8 = 100
				end
			end
			local v17 = ""
			if v10 == "Tokens" then
				if p1 == "Event" then
					v17 = Images["NewSummer Tokens"]
				end
			elseif Images[v10] then
				v17 = Images[v10]
			end
			local Reward = v22.RewardsInfo.RewardsTemplate:Clone()
			v9 = if v10 == "Tokens" then v11[Difficulties[v52]] * (if v7 then 2.5 else 1) else v8 .. "%"
			Reward.RewardText.Text = v9
			Reward.RewardImage.Image = v17
			Reward.RewardAmount.Text = v16
			Reward.RewardAmount.Visible = if v16 == 1 then false else true
			Reward.Name = "Reward"
			Reward.Visible = true
			Reward.Parent = v22.RewardsInfo
		end
	end
	local v21 = if v12.Rewards.XP then v12.Rewards.XP[Difficulties[v52]] else t[v52]
	local Reward = v22.RewardsInfo.RewardsTemplate:Clone()
	Reward.RewardText.Text = v21
	Reward.RewardText.TextColor3 = Color3.fromRGB(255, 255, 255)
	local v222 = v1
	Reward.RewardImage.Image = if tostring(v222) == "199" then Images.SummerXP elseif tostring(v1) == "299" then Images.MilitaryXP else Images.XP
	Reward.RewardAmount.Visible = false
	Reward.Name = "Reward"
	Reward.Visible = true
	Reward.Parent = v22.RewardsInfo
	Reward.LayoutOrder = -1
	if not (v22.RewardsInfo:FindFirstChild("ShowRemnants") or v12.Rewards.NoRemnants) then
		local ShowRemnants = v22.RewardsInfo.RewardsTemplate:Clone()
		ShowRemnants.RewardText.Text = "25%"
		ShowRemnants.RewardImage.Image = Images.Item_UncommonRemnant
		ShowRemnants.RewardAmount.Visible = false
		ShowRemnants.Name = "ShowRemnants"
		ShowRemnants.Visible = true
		ShowRemnants.Parent = v22.RewardsInfo
		ShowRemnants.LayoutOrder = 99
		task.spawn(function() --[[ Line: 138 | Upvalues: Images (ref), ShowRemnants (copy), v1 (ref), v5 (ref), v2 (ref) ]]
			local t = {
				Images.Item_UncommonRemnant,
				Images.Item_RareRemnant,
				Images.Item_EpicRemnant,
				Images.Item_MythicRemnant,
				Images.Item_SecretRemnant
			}
			local count = 1
			while true do
				local v12
				task.wait(2)
				count = count + 1
				if #t < count then
					count = 1
				end
				ShowRemnants.RewardImage.Image = t[count]
				local v3 = tostring(v1)
				if v3 == tostring(v5.Game) then
					local v52 = tostring(v2)
					v12 = v52 == tostring(v5.Night)
				else
					v12 = false
				end
				if v12 then
					ShowRemnants.RewardText.Text = "62.5%"
				else
					ShowRemnants.RewardText.Text = "25%"
				end
			end
		end)
	end
	if not (v22.RewardsInfo:FindFirstChild("ShowPresents") or v12.Rewards.NoPresents) then
		local ShowPresents = v22.RewardsInfo.RewardsTemplate:Clone()
		ShowPresents.RewardText.Text = "20%"
		ShowPresents.RewardImage.Image = Images.Present_Uncommon
		ShowPresents.RewardAmount.Visible = false
		ShowPresents.Name = "ShowPresents"
		ShowPresents.Visible = true
		ShowPresents.Parent = v22.RewardsInfo
		ShowPresents.LayoutOrder = 100
		task.spawn(function() --[[ Line: 163 | Upvalues: Images (ref), ShowPresents (copy), v1 (ref), v5 (ref), v2 (ref) ]]
			local t = {
				Images.Present_Uncommon,
				Images.Present_Rare,
				Images.Present_Epic,
				Images.Present_Mythic,
				Images.Present_Secret,
				Images.Present_ExclusivePack9,
				Images.Present_Endless1
			}
			local count = 1
			while true do
				local v12
				task.wait(2)
				count = count + 1
				if #t < count then
					count = 1
				end
				ShowPresents.RewardImage.Image = t[count]
				local v3 = tostring(v1)
				if v3 == tostring(v5.Game) then
					local v52 = tostring(v2)
					v12 = v52 == tostring(v5.Night)
				else
					v12 = false
				end
				if v12 then
					ShowPresents.RewardText.Text = "50%"
				else
					ShowPresents.RewardText.Text = "20%"
				end
			end
		end)
	end
	v22.Visible = true
end
NightSelector.Info.PlayButton.MouseButton1Click:Connect(function() --[[ Line: 182 | Upvalues: v1 (ref), v2 (ref), v4 (ref), Main (copy), VotesFrame (copy), ReplicatedStorage (copy), v3 (ref) ]]
	if not v1 or (not v2 or v4) then
		return
	end
	v4 = true
	Main.Visible = false
	VotesFrame.Visible = true
	ReplicatedStorage.Remotes.Main.Vote:FireServer(v1, v2, v3)
end)
NightSelector_2:WaitForChild("Info"):WaitForChild("PlayButton").MouseButton1Click:Connect(function() --[[ Line: 192 | Upvalues: v1 (ref), v2 (ref), v4 (ref), SummerGameSelectionFrame (copy), VotesFrame (copy), ReplicatedStorage (copy), v3 (ref) ]]
	if not v1 or (not v2 or v4) then
		return
	end
	v4 = true
	SummerGameSelectionFrame:WaitForChild("Main").Visible = false
	VotesFrame.Visible = true
	ReplicatedStorage.Remotes.Main.Vote:FireServer(v1, v2, v3)
end)
Vote.MouseButton1Click:Connect(function() --[[ Line: 203 | Upvalues: v2 (ref), ClientState (copy), v6 (ref), EndlessGameSelection (copy), v4 (ref), Main (copy), VotesFrame (copy), ReplicatedStorage (copy), v3 (ref) ]]
	if tostring(v2) == "51" and (game.ReplicatedStorage.Values.PlayerAmount.Value <= 1 and ClientState.GetData().RaidBossSave) then
		v6 = "Temp"
		EndlessGameSelection.Save.Visible = true
		repeat
			task.wait(0.1)
		until v6 ~= "Temp"
	end
	if not v2 or v4 then
		return
	end
	v4 = true
	EndlessGameSelection.Visible = false
	Main.Visible = false
	VotesFrame.Visible = true
	ReplicatedStorage.Remotes.Main.Vote:FireServer(if v2 == "Tutorial" then "98" else "99", if v2 == "Tutorial" then 1 else v2, v3, v6)
end)
Vote_2.MouseButton1Click:Connect(function() --[[ Line: 225 | Upvalues: v2 (ref), v4 (ref), PowerModeGameSelection (copy), Main (copy), VotesFrame (copy), ReplicatedStorage (copy), v3 (ref), v6 (ref) ]]
	if not v2 or v4 then
		return
	end
	v4 = true
	PowerModeGameSelection.Visible = false
	Main.Visible = false
	VotesFrame.Visible = true
	ReplicatedStorage.Remotes.Main.Vote:FireServer("95", tonumber(v2), v3, v6)
end)
PVPGameSelection:WaitForChild("Main"):WaitForChild("Vote").MouseButton1Click:Connect(function() --[[ Line: 238 | Upvalues: v2 (ref), v4 (ref), PVPGameSelection (copy), Main (copy), VotesFrame (copy), ReplicatedStorage (copy), v3 (ref) ]]
	if not v2 or v4 then
		return
	end
	v4 = true
	PVPGameSelection.Visible = false
	Main.Visible = false
	VotesFrame.Visible = true
	ReplicatedStorage.Remotes.Main.Vote:FireServer("1001", v2, v3)
end)
EndlessGameSelection:WaitForChild("Save"):WaitForChild("Yes").MouseButton1Click:Connect(function() --[[ Line: 250 | Upvalues: EndlessGameSelection (copy), v6 (ref), v4 (ref), Main (copy), VotesFrame (copy), ReplicatedStorage (copy), v3 (ref) ]]
	EndlessGameSelection.Save.Visible = false
	if v6 then
		v6 = true
		return
	end
	if v4 then
		return
	end
	v4 = true
	EndlessGameSelection.Visible = false
	Main.Visible = false
	VotesFrame.Visible = true
	ReplicatedStorage.Remotes.Main.Vote:FireServer("99", "51", v3, true)
end)
EndlessGameSelection:WaitForChild("Save"):WaitForChild("No").MouseButton1Click:Connect(function() --[[ Line: 268 | Upvalues: EndlessGameSelection (copy), v6 (ref) ]]
	EndlessGameSelection.Save.Visible = false
	if not v6 then
		return
	end
	v6 = nil
end)
EndlessGameSelection:WaitForChild("Main"):WaitForChild("LoadSave").MouseButton1Click:Connect(function() --[[ Line: 275 | Upvalues: EndlessGameSelection (copy) ]]
	EndlessGameSelection.Save.Visible = true
end)
function updateRaidBossSave() --[[ updateRaidBossSave | Line: 279 | Upvalues: ClientState (copy), EndlessGameSelection (copy) ]]
	if not (ClientState.GetData().RaidBossSave and game.ReplicatedStorage.Values.PlayerAmount.Value <= 1) then
		return
	end
	EndlessGameSelection.Main.LoadSave.Visible = true
end
if ReplicatedStorage.Values.PowerMode.Value then
	GameSelector.Visible = false
	PowerModeGameSelection.Visible = true
	SummerGameSelectionFrame.Visible = false
end
ReplicatedStorage.Values.PowerMode.Changed:Connect(function() --[[ Line: 292 | Upvalues: GameSelector (copy), PowerModeGameSelection (copy), SummerGameSelectionFrame (copy) ]]
	GameSelector.Visible = false
	PowerModeGameSelection.Visible = true
	SummerGameSelectionFrame.Visible = false
end)
if ReplicatedStorage.Values.Endless.Value then
	GameSelector.Visible = false
	EndlessGameSelection.Visible = true
	SummerGameSelectionFrame.Visible = false
end
ReplicatedStorage.Values.Endless.Changed:Connect(function() --[[ Line: 302 | Upvalues: GameSelector (copy), EndlessGameSelection (copy), SummerGameSelectionFrame (copy) ]]
	GameSelector.Visible = false
	EndlessGameSelection.Visible = true
	SummerGameSelectionFrame.Visible = false
end)
if ReplicatedStorage.Values.SpecialEvent.Value then
	GameSelector.Visible = false
	EndlessGameSelection.Visible = false
	SummerGameSelectionFrame.Visible = true
end
if ReplicatedStorage.Values.RaidBoss.Value then
	GameSelector.Visible = false
	EndlessGameSelection.Visible = true
	SummerGameSelectionFrame.Visible = false
	for k, v in pairs(EndlessGameSelection.Main.NightSelector:GetChildren()) do
		if v.Name == "51" then
			v.Visible = true
			continue
		end
		v.Visible = false
	end
	updateRaidBossSave()
end
if ReplicatedStorage.Values.SpecialEndless.Value then
	GameSelector.Visible = false
	EndlessGameSelection.Visible = true
	SummerGameSelectionFrame.Visible = false
	for k, v in pairs(EndlessGameSelection.Main.NightSelector:GetChildren()) do
		if v.Name == "24" then
			v.Visible = true
			continue
		end
		v.Visible = false
	end
end
if ReplicatedStorage.Values.Tutorial.Value then
	GameSelector.Visible = false
	EndlessGameSelection.Visible = true
	SummerGameSelectionFrame.Visible = false
	EndlessGameSelection.Main.ENDLESS.Visible = false
	for k, v in pairs(EndlessGameSelection.Main.NightSelector:GetChildren()) do
		if v.Name == "Tutorial" then
			v.Visible = true
			continue
		end
		v.Visible = false
	end
end
ReplicatedStorage.Values.SpecialEvent.Changed:Connect(function() --[[ Line: 350 | Upvalues: GameSelector (copy), EndlessGameSelection (copy), SummerGameSelectionFrame (copy) ]]
	GameSelector.Visible = false
	EndlessGameSelection.Visible = false
	SummerGameSelectionFrame.Visible = true
end)
ReplicatedStorage.Values.RaidBoss.Changed:Connect(function() --[[ Line: 355 | Upvalues: GameSelector (copy), EndlessGameSelection (copy), SummerGameSelectionFrame (copy) ]]
	GameSelector.Visible = false
	EndlessGameSelection.Visible = true
	SummerGameSelectionFrame.Visible = false
	for k, v in pairs(EndlessGameSelection.Main.NightSelector:GetChildren()) do
		if v.Name == "51" then
			v.Visible = true
			continue
		end
		v.Visible = false
	end
	updateRaidBossSave()
end)
ReplicatedStorage.Values.SpecialEndless.Changed:Connect(function() --[[ Line: 368 | Upvalues: GameSelector (copy), EndlessGameSelection (copy), SummerGameSelectionFrame (copy) ]]
	GameSelector.Visible = false
	EndlessGameSelection.Visible = true
	SummerGameSelectionFrame.Visible = false
	for k, v in pairs(EndlessGameSelection.Main.NightSelector:GetChildren()) do
		if v.Name == "24" then
			v.Visible = true
			continue
		end
		v.Visible = false
	end
end)
ReplicatedStorage.Values.Tutorial.Changed:Connect(function() --[[ Line: 380 | Upvalues: GameSelector (copy), EndlessGameSelection (copy), SummerGameSelectionFrame (copy) ]]
	GameSelector.Visible = false
	EndlessGameSelection.Visible = true
	SummerGameSelectionFrame.Visible = false
	EndlessGameSelection.Main.ENDLESS.Visible = false
	for k, v in pairs(EndlessGameSelection.Main.NightSelector:GetChildren()) do
		if v.Name == "Tutorial" then
			v.Visible = true
			continue
		end
		v.Visible = false
	end
end)
if ReplicatedStorage.Values.PVP.Value then
	GameSelector.Visible = false
	PVPGameSelection.Visible = true
end
ReplicatedStorage.Values.PVP.Changed:Connect(function() --[[ Line: 397 | Upvalues: GameSelector (copy), PVPGameSelection (copy) ]]
	GameSelector.Visible = false
	PVPGameSelection.Visible = true
end)
task.spawn(function() --[[ Line: 402 | Upvalues: v5 (ref), ReplicatedStorage (copy), Main (copy) ]]
	v5 = ReplicatedStorage.Remotes.Main.SpecialNight.Get:InvokeServer()
	Main.Double.Text = "x2.5 Rewards/Luck For Game " .. v5.Game .. " Night " .. v5.Night
	Main.Double.Visible = true
end)
function updateAllVotes(p1, p2) --[[ updateAllVotes | Line: 408 | Upvalues: GameSelection (copy), VotesFrame (copy), Difficulties (copy), t2 (copy), ReplicatedStorage (copy), Players (copy) ]]
	if p1 == "Finished" then
		GameSelection.Parent:WaitForChild("Placement").DisplayOrder = 10
		GameSelection.Parent:WaitForChild("Placement"):WaitForChild("Hotbar").Visible = true
		GameSelection.Enabled = false
		return
	end
	if p1 == "Chosen" then
		VotesFrame.Container.Visible = false
		local v1 = if p2[3] <= 2 then 1 else 5
		VotesFrame.Chosen.Difficulty.Text = Difficulties[v1]
		VotesFrame.Chosen.Difficulty.TextColor3 = t2[v1]
		VotesFrame.Chosen.MapName.Text = if ReplicatedStorage.Values.SpecialEndless.Value then "Endless" else (if tostring(p2[1]) == "1300" then "Day " elseif tostring(p2[1]) == "1301" then "Day " else "Night ") .. p2[2]
		VotesFrame.Chosen.Game.GameNumber.Text = if tostring(p2[1]) == "98" then "Tutorial" elseif tostring(p2[1]) == "99" then "\226\136\158" else p2[1]
		if tostring(p2[1]) == "1300" then
			VotesFrame.Chosen.Game.GameNumber.Visible = false
			VotesFrame.Chosen.Game.Event.Image = "rbxassetid://127817762687901"
			VotesFrame.Chosen.Game.Event.Visible = true
		end
		if tostring(p2[1]) == "1301" then
			VotesFrame.Chosen.Game.GameNumber.Visible = false
			VotesFrame.Chosen.Game.Event.Image = "rbxassetid://80499518681399"
			VotesFrame.Chosen.Game.Event.Visible = true
		end
		if ReplicatedStorage.Values.SpecialEndless.Value then
			VotesFrame.Chosen.Game.GameNumber.Visible = false
			VotesFrame.Chosen.Game.Event.Visible = true
		end
		VotesFrame.Chosen.Visible = true
	elseif typeof(p1) == "number" then
		if not ReplicatedStorage.Values.PVP.Value then
			return
		end
		VotesFrame.Ending.Text = "Automatically starting in " .. p1
	else
		for k, v in pairs(p1) do
			local v11, v12
			if not VotesFrame.Container:FindFirstChild(v.PlayerName) then
				local v13 = VotesFrame.Container.Example:Clone()
				v13.Name = v.PlayerName
				v13.PlayerName.Text = v.PlayerName
				local v14 = if tonumber(v.Difficulty) <= 2 then 1 else 5
				v13.Difficulty.Text = Difficulties[v14]
				v13.Difficulty.TextColor3 = t2[v14]
				v11 = if tostring(v.Map) == "1300" then "Day " elseif tostring(v.Map) == "1301" then "Day " else "Night "
				v13.MapName.Text = if ReplicatedStorage.Values.SpecialEndless.Value then "Endless" else v11 .. v.Night
				v12 = if tostring(v.Map) == "98" then "Tutorial" elseif tostring(v.Map) == "99" then "\226\136\158" else v.Map
				v13.Game.GameNumber.Text = v12
				if tostring(v.Map) == "1300" then
					v13.Game.GameNumber.Visible = false
					v13.Game.Event.Image = "rbxassetid://127817762687901"
					v13.Game.Event.Visible = true
				end
				if tostring(v.Map) == "1301" then
					v13.Game.GameNumber.Visible = false
					v13.Game.Event.Image = "rbxassetid://80499518681399"
					v13.Game.Event.Visible = true
				end
				if ReplicatedStorage.Values.SpecialEndless.Value then
					v13.Game.GameNumber.Visible = false
					v13.Game.Event.Visible = true
				end
				v13.Parent = VotesFrame.Container
				v13.Visible = true
				pcall(function() --[[ Line: 479 | Upvalues: Players (ref), v (copy), v13 (copy) ]]
					local v1, _ = Players:GetUserThumbnailAsync(Players[v.PlayerName].UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
					v13.PlayerImage.Image = v1
				end)
			end
		end
	end
end
function updateNightVisibility(p1, p2) --[[ updateNightVisibility | Line: 487 | Upvalues: Game (copy), NightSelector (copy), SummerGameSelectionFrame (copy) ]]
	if not Game[p1] then
		return
	end
	if p2 then
		if p2 ~= "Event" then
			return
		end
		for k, v in pairs(SummerGameSelectionFrame:WaitForChild("Main"):WaitForChild("NightSelector"):WaitForChild("Main"):GetChildren()) do
			if v:IsA("ImageButton") then
				if Game[p1].Nights[tonumber(v.Name)] then
					v.Visible = true
					continue
				end
				v.Visible = false
			end
		end
	else
		for k, v in pairs(NightSelector.Main:GetChildren()) do
			if v:IsA("ImageButton") then
				if Game[p1].Nights[tonumber(v.Name)] then
					v.Visible = true
					continue
				end
				v.Visible = false
			end
		end
	end
end
local v7 = nil
function updateDifficulty(p1) --[[ updateDifficulty | Line: 512 | Upvalues: updateNightInfo (copy), SummerGameSelectionFrame (copy), NightSelector (copy), Difficulties (copy), v3 (ref), t2 (copy), v7 (ref) ]]
	updateNightInfo(p1)
	local v1 = if p1 == "Event" then SummerGameSelectionFrame:WaitForChild("Main"):WaitForChild("NightSelector"):WaitForChild("Info") else NightSelector.Info
	v1.DifficultyDisplay.Text = Difficulties[v3]
	v1.DifficultyDisplay.TextColor3 = t2[v3]
	v1.DifficultyDisplay.NightmareStroke.Enabled = v3 == 5
	if not v7 then
		v7 = v1.Parent.Easy.Position
	end
	v1.Parent.Easy.Frame.Chosen.Enabled = v3 == 1
	v1.Parent.Easy.Frame.UIGradient.Enabled = v3 ~= 1
	v1.Parent.Nightmare.Frame.Chosen.Enabled = v3 == 5
	v1.Parent.Nightmare.Frame.UIGradient.Enabled = v3 ~= 5
	v1.Parent.Easy.Position = v7
	v1.Parent.Nightmare.Visible = true
end
updateDifficulty()
updateDifficulty("Event")
NightSelector.Easy.MouseButton1Click:Connect(function() --[[ Line: 558 | Upvalues: v3 (ref) ]]
	v3 = 1
	updateDifficulty()
end)
NightSelector.Nightmare.MouseButton1Click:Connect(function() --[[ Line: 562 | Upvalues: v3 (ref) ]]
	v3 = 5
	updateDifficulty()
end)
NightSelector_2.Easy.MouseButton1Click:Connect(function() --[[ Line: 566 | Upvalues: v3 (ref) ]]
	v3 = 1
	updateDifficulty("Event")
end)
NightSelector_2.Nightmare.MouseButton1Click:Connect(function() --[[ Line: 570 | Upvalues: v3 (ref) ]]
	v3 = 5
	updateDifficulty("Event")
end)
WaitingFrame.Visible = true
GameSelectionFrame.Visible = false
local v8 = tick()
repeat
	task.wait(0.1)
until ReplicatedStorage.Values.PlayerAmount.Value ~= 0 or tick() - v8 >= 60 and not ReplicatedStorage.Values.PVP.Value
local v10 = tick()
repeat
	task.wait(0.1)
	if #Players:GetPlayers() >= ReplicatedStorage.Values.PlayerAmount.Value or tick() - v10 >= 25 and not ReplicatedStorage.Values.PVP.Value then
		break
	end
until ReplicatedStorage.Values.PVP.Value and (ReplicatedStorage.Values.PlayerAmount.Value > 2 and #game.Players:GetPlayers() > 2)
WaitingFrame.Visible = false
GameSelectionFrame.Visible = true
PlayerGui:WaitForChild("Placement"):WaitForChild("Hotbar").Visible = true
local v11 = ClientState.GetData()
for k, v in pairs(GameSelector:GetChildren()) do
	for k2, v12 in pairs(v11.Completed) do
		if "Game" .. string.split(k2)[1] == v.Name then
			v.Lock.Visible = false
		end
	end
	if v.Name ~= "Game1" then
		local v13 = tonumber((string.gsub(v.Name, "Game", ""))) - 1
		if v11.Completed[v13 .. "_" .. #Game[tostring(v13)].Nights] then
			v.Lock.Visible = false
		end
	end
end
function updateEndless() --[[ updateEndless | Line: 606 | Upvalues: v2 (ref), EndlessGameSelection (copy), ReplicatedStorage (copy), Players (copy), Misc (copy), Images (copy) ]]
	if not v2 then
		EndlessGameSelection.Main.Rewards.Visible = false
		EndlessGameSelection.Main.Leaderboard.Visible = false
		EndlessGameSelection.Main.Vote.Visible = false
		return
	end
	EndlessGameSelection.Main.Vote.Visible = true
	if tostring(v2) == "Tutorial" then
		return
	end
	EndlessGameSelection.Main.Leaderboard.Visible = true
	local v22 = ReplicatedStorage.Remotes.Misc.GetEndlessLeaderboard:InvokeServer(v2)
	local v3 = true
	if not v2 then
		return
	end
	local v4 = EndlessGameSelection.Main.Leaderboard:FindFirstChild("Scrolling" .. v2)
	if not v4 then
		local v5 = EndlessGameSelection.Main.Leaderboard.ScrollingFrame:Clone()
		v5.Name = "Scrolling" .. v2
		v5.Parent = EndlessGameSelection.Main.Leaderboard
		v4 = v5
		v3 = false
	end
	for k, v in pairs(EndlessGameSelection.Main.Leaderboard:GetChildren()) do
		if v:IsA("ScrollingFrame") then
			if v.Name == v4.Name then
				v.Visible = true
				continue
			end
			v.Visible = false
		end
	end
	if not v3 then
		for k, v in pairs(v4:GetChildren()) do
			if v:IsA("Frame") and v.Name ~= "Example" then
				v:Destroy()
			end
		end
		for k, v in pairs(v22) do
			local key = v.key
			local v6 = "[Not Available]"
			local _, _2 = pcall(function() --[[ Line: 648 | Upvalues: v6 (ref), Players (ref), key (copy) ]]
				v6 = Players:GetNameFromUserIdAsync(key)
			end)
			local v7 = v4.Example:Clone()
			v7.Name = v6
			v7.LayoutOrder = k
			v7.Player.Text = v6
			v7.Wave.Text = v.value
			v7.Visible = true
			v7.Parent = v4
		end
	end
	if tostring(v2) == "51" then
		return
	end
	if tostring(v2) == "24" then
		return
	end
	EndlessGameSelection.Main.Rewards.Visible = true
	local v10 = Misc.EndlessRewards[v2][1]
	local v11 = Misc.GetReward(v10.Rewards)
	local v12 = if v11 then v11[1] else 1
	local v13 = if v11 then v11[2] else ""
	EndlessGameSelection.Main.Rewards.UnitReward.BorderImage.TowerImage.Image = if Images[v13] then Images[v13] else ""
	EndlessGameSelection.Main.Rewards.UnitReward.Info.Text = "X" .. v12
	EndlessGameSelection.Main.Rewards.UnitReward.Wave.Text = "Wave " .. v10.Wave
end
function updatePowerMode() --[[ updatePowerMode | Line: 678 | Upvalues: v2 (ref), PowerModeGameSelection (copy), ReplicatedStorage (copy), Players (copy) ]]
	if not v2 then
		PowerModeGameSelection.Main.Leaderboard.Visible = false
		PowerModeGameSelection.Main.Vote.Visible = false
		return
	end
	PowerModeGameSelection.Main.Vote.Visible = true
	if tostring(v2) == "Tutorial" then
		return
	end
	PowerModeGameSelection.Main.Leaderboard.Visible = true
	local v22 = ReplicatedStorage.Remotes.Misc.GetPowerLeaderboard:InvokeServer(v2)
	local v3 = true
	if not v2 then
		return
	end
	local v4 = PowerModeGameSelection.Main.Leaderboard:FindFirstChild("Scrolling" .. v2)
	if not v4 then
		local v5 = PowerModeGameSelection.Main.Leaderboard.ScrollingFrame:Clone()
		v5.Name = "Scrolling" .. v2
		v5.Parent = PowerModeGameSelection.Main.Leaderboard
		v4 = v5
		v3 = false
	end
	for k, v in pairs(PowerModeGameSelection.Main.Leaderboard:GetChildren()) do
		if v:IsA("ScrollingFrame") then
			if v.Name == v4.Name then
				v.Visible = true
				continue
			end
			v.Visible = false
		end
	end
	if v3 then
		return
	end
	for k, v in pairs(v4:GetChildren()) do
		if v:IsA("Frame") and v.Name ~= "Example" then
			v:Destroy()
		end
	end
	for k, v in pairs(v22) do
		local key = v.key
		local v7 = math.round(v.value / 1000)
		local v8 = "[Not Available]"
		local _, _2 = pcall(function() --[[ Line: 719 | Upvalues: v8 (ref), Players (ref), key (copy) ]]
			v8 = Players:GetNameFromUserIdAsync(key)
		end)
		local v9 = v4.Example:Clone()
		v9.Name = v8
		v9.LayoutOrder = k
		v9.Player.Text = v8
		v9.Wave.Text = v7 .. "%"
		v9.Visible = true
		v9.Parent = v4
	end
end
function updatePVP() --[[ updatePVP | Line: 736 | Upvalues: v2 (ref), PVPGameSelection (copy) ]]
	if v2 then
		PVPGameSelection.Main.Vote.Visible = true
	else
		PVPGameSelection.Main.Vote.Visible = false
	end
end
function everyoneUnlocked(p1, p2) --[[ everyoneUnlocked | Line: 744 | Upvalues: Players (copy), ReplicatedStorage (copy), Game (copy) ]]
	if tostring(p1) == "1" and tonumber(p2) == 1 then
		return true
	end
	for k, v in pairs(Players:GetPlayers()) do
		local v1 = ReplicatedStorage.Remotes.Misc.OtherPlayerCompleted:InvokeServer(v)
		local v3, v4
		if tostring(p1) == "1" then
			local v2
			if not v1[p1 .. "_" .. tonumber(p2) - 1] and tonumber(p2) ~= 1 then
				v2 = Game
				v3 = tonumber(p1) - 1
				if Game[tostring(v3)] then
					v4 = tonumber(p1) - 1
					if not v1[v4 .. "_" .. #Game[tostring(v4)].Nights] then
						return false
					end
					if not v1[p1 .. "_" .. tonumber(p2) - 1] and p2 ~= "1" then
						return false
					end
				end
			end
			continue
		end
		v3 = tonumber(p1) - 1
		if Game[tostring(v3)] then
			v4 = tonumber(p1) - 1
			if not v1[v4 .. "_" .. #Game[tostring(v4)].Nights] then
				return false
			end
			if not v1[p1 .. "_" .. tonumber(p2) - 1] and p2 ~= "1" then
				return false
			end
		end
	end
	return true
end
function updateNightSelector(p1) --[[ updateNightSelector | Line: 769 | Upvalues: ClientState (copy), NightSelector (copy), v1 (ref), NightSelector_2 (copy) ]]
	local v12 = ClientState.GetData()
	updateDifficulty()
	if p1 then
		if p1 ~= "Event" then
			return
		end
		for k, v in pairs(NightSelector_2.Main:GetChildren()) do
			local v3 = tonumber(v.Name)
			if v3 then
				if v12.Completed[v1 .. "_" .. v3 - 1] or v.Name == "1" then
					v.Lock.Visible = false
					continue
				end
				v.Lock.Visible = true
			end
		end
	else
		for k, v in pairs(NightSelector.Main:GetChildren()) do
			local v5 = tonumber(v.Name)
			if v5 then
				if v12.Completed[v1 .. "_" .. v5 - 1] or v.Name == "1" then
					v.Lock.Visible = false
					continue
				end
				v.Lock.Visible = true
			end
		end
	end
end
local v15 = nil
function updateNightUnlocked(p1) --[[ updateNightUnlocked | Line: 800 | Upvalues: v1 (ref), v15 (ref), NightSelector (copy), NightSelector_2 (copy) ]]
	if not v1 then
		return
	end
	if v15 == v1 then
		return
	end
	v15 = v1
	if p1 then
		if p1 ~= "Event" then
			return
		end
		for k, v in pairs(NightSelector_2.Main:GetChildren()) do
			if tonumber(v.Name) then
				if everyoneUnlocked(v1, v.Name) then
					v.BG.ImageColor3 = Color3.fromRGB(255, 255, 255)
					v.Night.TextColor3 = Color3.fromRGB(255, 255, 255)
					continue
				end
				v.BG.ImageColor3 = Color3.fromRGB(255, 0, 4)
				v.Night.TextColor3 = Color3.fromRGB(255, 0, 4)
			end
		end
	else
		for k, v in pairs(NightSelector.Main:GetChildren()) do
			if tonumber(v.Name) then
				if everyoneUnlocked(v1, v.Name) then
					v.BG.ImageColor3 = Color3.fromRGB(255, 255, 255)
					v.Night.TextColor3 = Color3.fromRGB(255, 255, 255)
					continue
				end
				v.BG.ImageColor3 = Color3.fromRGB(255, 0, 4)
				v.Night.TextColor3 = Color3.fromRGB(255, 0, 4)
			end
		end
	end
end
for v16, v17 in GameSelector:GetChildren() do
	if v17:IsA("ImageButton") and not v17.Lock.Visible then
		Tween:AddButton(v17, nil, "ButtonClick")
		v17.MouseButton1Click:Connect(function() --[[ Line: 836 | Upvalues: v2 (ref), NightSelector (copy), NightInfo (copy), v1 (ref), GameSelector (copy), v17 (copy) ]]
			if v2 then
				local v22 = NightSelector.Main:FindFirstChild((tostring(v2)))
				v22.BG.ImageColor3 = Color3.fromRGB(255, 255, 255)
				v22.Night.TextColor3 = Color3.fromRGB(255, 255, 255)
				v2 = nil
				NightInfo.Visible = false
				if v2 and v1 then
					NightSelector.Info.PlayButton.ImageTransparency = 0
					NightSelector.Info.PlayButton.Title.TextTransparency = 0
				else
					NightSelector.Info.PlayButton.ImageTransparency = 0.6
					NightSelector.Info.PlayButton.Title.TextTransparency = 0.6
				end
			end
			if v1 then
				local v3 = GameSelector:FindFirstChild("Game" .. v1)
				if v3 then
					v3.BG.ImageColor3 = Color3.fromRGB(255, 255, 255)
					v3.GameNumber.TextColor3 = Color3.fromRGB(255, 255, 255)
					v1 = nil
					if v2 and v1 then
						NightSelector.Info.PlayButton.ImageTransparency = 0
						NightSelector.Info.PlayButton.Title.TextTransparency = 0
					else
						NightSelector.Info.PlayButton.ImageTransparency = 0.6
						NightSelector.Info.PlayButton.Title.TextTransparency = 0.6
					end
					if v3 == v17 then
						NightSelector.Visible = false
						return
					end
				end
			end
			v17.BG.ImageColor3 = Color3.fromRGB(0, 255, 0)
			if v17:FindFirstChild("GameNumber") and v17.GameNumber:IsA("TextLabel") then
				v17.GameNumber.TextColor3 = Color3.fromRGB(0, 255, 0)
			end
			v1 = string.gsub(v17.Name, "Game", "")
			updateNightSelector()
			task.spawn(updateNightUnlocked)
			updateNightVisibility(v1)
			NightSelector.Visible = true
			if v2 and v1 then
				NightSelector.Info.PlayButton.ImageTransparency = 0
				NightSelector.Info.PlayButton.Title.TextTransparency = 0
			else
				NightSelector.Info.PlayButton.ImageTransparency = 0.6
				NightSelector.Info.PlayButton.Title.TextTransparency = 0.6
			end
		end)
	end
end
local v18 = nil
for k, v in pairs(NightSelector.Main:GetChildren()) do
	if v:IsA("ImageButton") then
		Tween:AddButton(v, nil, "ButtonClick")
		v.MouseButton1Click:Connect(function() --[[ Line: 884 | Upvalues: v1 (ref), v (copy), v2 (ref), NightSelector (copy), NightInfo (copy), v18 (ref), GameSelectionFrame (copy), TweenService (copy), updateNightInfo (copy) ]]
			if not v1 then
				return
			end
			if v.Lock.Visible then
				return
			end
			if v2 then
				local v12 = NightSelector.Main:FindFirstChild(v2)
				if v12 then
					v12.BG.ImageColor3 = Color3.fromRGB(255, 255, 255)
					v12.Night.TextColor3 = Color3.fromRGB(255, 255, 255)
					v2 = nil
					if v2 and v1 then
						NightSelector.Info.PlayButton.ImageTransparency = 0
						NightSelector.Info.PlayButton.Title.TextTransparency = 0
					else
						NightSelector.Info.PlayButton.ImageTransparency = 0.6
						NightSelector.Info.PlayButton.Title.TextTransparency = 0.6
					end
					if v12 == v then
						NightInfo.Visible = false
						return
					end
				end
			end
			local v22 = os.time()
			v18 = v22
			if everyoneUnlocked(v1, v.Name) then
				v.BG.ImageColor3 = Color3.fromRGB(0, 255, 0)
				v.Night.TextColor3 = Color3.fromRGB(0, 255, 0)
				v2 = tonumber(v.Name)
				updateNightInfo()
				if v2 and v1 then
					NightSelector.Info.PlayButton.ImageTransparency = 0
					NightSelector.Info.PlayButton.Title.TextTransparency = 0
				else
					NightSelector.Info.PlayButton.ImageTransparency = 0.6
					NightSelector.Info.PlayButton.Title.TextTransparency = 0.6
				end
			else
				GameSelectionFrame.Main.NotEveryoneUnlocked.Visible = true
				local v4 = TweenService:Create(GameSelectionFrame.Main.NotEveryoneUnlocked, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					TextTransparency = 0
				})
				local v5 = TweenService:Create(GameSelectionFrame.Main.NotEveryoneUnlocked, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					TextTransparency = 1
				})
				v4:Play()
				v4.Completed:Wait()
				if v22 ~= v22 then
					return
				end
				v5:Play()
			end
		end)
	end
end
for k, v in pairs(EndlessGameSelection:WaitForChild("Main"):WaitForChild("NightSelector"):GetChildren()) do
	Tween:AddButton(v)
	v.MouseButton1Click:Connect(function() --[[ Line: 930 | Upvalues: v2 (ref), EndlessGameSelection (copy), v (copy) ]]
		local v1
		if not v2 then
			v.BG.ImageColor3 = Color3.fromRGB(0, 255, 0)
			v.GameNumber.TextColor3 = Color3.fromRGB(0, 255, 0)
			v1 = v.Name
			v2 = tostring(v1)
			updateEndless()
			return
		end
		local v22 = EndlessGameSelection.Main.NightSelector:FindFirstChild(v2)
		if not v22 then
			v.BG.ImageColor3 = Color3.fromRGB(0, 255, 0)
			v.GameNumber.TextColor3 = Color3.fromRGB(0, 255, 0)
			v1 = v.Name
			v2 = tostring(v1)
			updateEndless()
			return
		end
		v22.BG.ImageColor3 = Color3.fromRGB(255, 255, 255)
		v22.GameNumber.TextColor3 = Color3.fromRGB(255, 255, 255)
		v2 = nil
		if v22 ~= v then
			v.BG.ImageColor3 = Color3.fromRGB(0, 255, 0)
			v.GameNumber.TextColor3 = Color3.fromRGB(0, 255, 0)
			v1 = v.Name
			v2 = tostring(v1)
		end
		updateEndless()
	end)
end
for k, v in pairs(PowerModeGameSelection:WaitForChild("Main"):WaitForChild("NightSelector"):GetChildren()) do
	Tween:AddButton(v)
	v.MouseButton1Click:Connect(function() --[[ Line: 955 | Upvalues: v2 (ref), PowerModeGameSelection (copy), v (copy) ]]
		local v1
		if not v2 then
			v.BG.ImageColor3 = Color3.fromRGB(0, 255, 0)
			v.GameNumber.TextColor3 = Color3.fromRGB(0, 255, 0)
			v1 = v.Name
			v2 = tostring(v1)
		else
			local v22 = PowerModeGameSelection.Main.NightSelector:FindFirstChild(v2)
			if not v22 then
				v.BG.ImageColor3 = Color3.fromRGB(0, 255, 0)
				v.GameNumber.TextColor3 = Color3.fromRGB(0, 255, 0)
				v1 = v.Name
				v2 = tostring(v1)
			else
				v22.BG.ImageColor3 = Color3.fromRGB(255, 255, 255)
				v22.GameNumber.TextColor3 = Color3.fromRGB(255, 255, 255)
				v2 = nil
				if v22 ~= v then
					v.BG.ImageColor3 = Color3.fromRGB(0, 255, 0)
					v.GameNumber.TextColor3 = Color3.fromRGB(0, 255, 0)
					v1 = v.Name
					v2 = tostring(v1)
				end
			end
		end
		updatePowerMode()
	end)
end
for k, v in pairs(PVPGameSelection:WaitForChild("Main"):WaitForChild("NightSelector"):GetChildren()) do
	Tween:AddButton(v)
	v.MouseButton1Click:Connect(function() --[[ Line: 980 | Upvalues: v2 (ref), PVPGameSelection (copy), v (copy) ]]
		local v1
		if not v2 then
			v.BG.ImageColor3 = Color3.fromRGB(0, 255, 0)
			v.GameNumber.TextColor3 = Color3.fromRGB(0, 255, 0)
			v1 = v.Name
			v2 = tonumber(v1)
		else
			local v22 = PVPGameSelection.Main.NightSelector:FindFirstChild(v2)
			if not v22 then
				v.BG.ImageColor3 = Color3.fromRGB(0, 255, 0)
				v.GameNumber.TextColor3 = Color3.fromRGB(0, 255, 0)
				v1 = v.Name
				v2 = tonumber(v1)
			else
				v22.BG.ImageColor3 = Color3.fromRGB(255, 255, 255)
				v22.GameNumber.TextColor3 = Color3.fromRGB(255, 255, 255)
				v2 = nil
				if v22 ~= v then
					v.BG.ImageColor3 = Color3.fromRGB(0, 255, 0)
					v.GameNumber.TextColor3 = Color3.fromRGB(0, 255, 0)
					v1 = v.Name
					v2 = tonumber(v1)
				end
			end
		end
		updatePVP()
	end)
end
for v19, v20 in SummerGameSelectionFrame:WaitForChild("Main"):WaitForChild("GameSelector"):GetChildren() do
	if v20:IsA("ImageButton") and not v20.Lock.Visible then
		Tween:AddButton(v20, nil, "ButtonClick")
		v20.MouseButton1Click:Connect(function() --[[ Line: 1008 | Upvalues: v2 (ref), NightSelector_2 (copy), SummerGameSelectionFrame (copy), v1 (ref), NightSelector (copy), v20 (copy) ]]
			if v2 then
				local v22 = NightSelector_2.Main:FindFirstChild((tostring(v2)))
				v22.BG.ImageColor3 = Color3.fromRGB(255, 255, 255)
				v22.Night.TextColor3 = Color3.fromRGB(255, 255, 255)
				v2 = nil
				SummerGameSelectionFrame:WaitForChild("Main"):WaitForChild("NightInfo").Visible = false
				if v2 and v1 then
					NightSelector.Info.PlayButton.ImageTransparency = 0
					NightSelector.Info.PlayButton.Title.TextTransparency = 0
				else
					NightSelector.Info.PlayButton.ImageTransparency = 0.6
					NightSelector.Info.PlayButton.Title.TextTransparency = 0.6
				end
			end
			if v1 then
				local v3 = SummerGameSelectionFrame:WaitForChild("Main"):WaitForChild("GameSelector"):FindFirstChild("Game" .. v1)
				if v3 then
					v3.BG.ImageColor3 = Color3.fromRGB(255, 255, 255)
					v1 = nil
					if v2 and v1 then
						NightSelector.Info.PlayButton.ImageTransparency = 0
						NightSelector.Info.PlayButton.Title.TextTransparency = 0
					else
						NightSelector.Info.PlayButton.ImageTransparency = 0.6
						NightSelector.Info.PlayButton.Title.TextTransparency = 0.6
					end
					if v3 == v20 then
						NightSelector_2.Visible = false
						return
					end
				end
			end
			v20.BG.ImageColor3 = Color3.fromRGB(0, 255, 0)
			v1 = string.gsub(v20.Name, "Game", "")
			updateNightSelector("Event")
			task.spawn(updateNightUnlocked, "Event")
			updateNightVisibility(v1, "Event")
			NightSelector_2.Visible = true
			if v2 and v1 then
				NightSelector.Info.PlayButton.ImageTransparency = 0
				NightSelector.Info.PlayButton.Title.TextTransparency = 0
			else
				NightSelector.Info.PlayButton.ImageTransparency = 0.6
				NightSelector.Info.PlayButton.Title.TextTransparency = 0.6
			end
		end)
	end
end
local v21 = nil
for k, v in pairs(NightSelector_2.Main:GetChildren()) do
	if v:IsA("ImageButton") then
		Tween:AddButton(v, nil, "ButtonClick")
		v.MouseButton1Click:Connect(function() --[[ Line: 1052 | Upvalues: v1 (ref), v (copy), v2 (ref), NightSelector_2 (copy), NightSelector (copy), SummerGameSelectionFrame (copy), v21 (ref), GameSelectionFrame (copy), TweenService (copy), updateNightInfo (copy) ]]
			if not v1 then
				return
			end
			if v.Lock.Visible then
				return
			end
			if v2 then
				local v12 = NightSelector_2.Main:FindFirstChild(v2)
				if v12 then
					v12.BG.ImageColor3 = Color3.fromRGB(255, 255, 255)
					v12.Night.TextColor3 = Color3.fromRGB(255, 255, 255)
					v2 = nil
					if v2 and v1 then
						NightSelector.Info.PlayButton.ImageTransparency = 0
						NightSelector.Info.PlayButton.Title.TextTransparency = 0
					else
						NightSelector.Info.PlayButton.ImageTransparency = 0.6
						NightSelector.Info.PlayButton.Title.TextTransparency = 0.6
					end
					if v12 == v then
						SummerGameSelectionFrame:WaitForChild("Main"):WaitForChild("NightInfo").Visible = false
						return
					end
				end
			end
			local v22 = os.time()
			v21 = v22
			if everyoneUnlocked(v1, v.Name) then
				v.BG.ImageColor3 = Color3.fromRGB(0, 255, 0)
				v.Night.TextColor3 = Color3.fromRGB(0, 255, 0)
				v2 = tonumber(v.Name)
				updateNightInfo("Event")
				if v2 and v1 then
					NightSelector.Info.PlayButton.ImageTransparency = 0
					NightSelector.Info.PlayButton.Title.TextTransparency = 0
				else
					NightSelector.Info.PlayButton.ImageTransparency = 0.6
					NightSelector.Info.PlayButton.Title.TextTransparency = 0.6
				end
			else
				GameSelectionFrame.Main.NotEveryoneUnlocked.Visible = true
				local v4 = TweenService:Create(GameSelectionFrame.Main.NotEveryoneUnlocked, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					TextTransparency = 0
				})
				local v5 = TweenService:Create(GameSelectionFrame.Main.NotEveryoneUnlocked, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					TextTransparency = 1
				})
				v4:Play()
				v4.Completed:Wait()
				if v22 ~= v22 then
					return
				end
				v5:Play()
			end
		end)
	end
end
Tween:AddButton(NightSelector.Info.PlayButton, nil, "ButtonClick")
Tween:AddButton(Vote, nil, "ButtonClick")
Tween:AddButton(Vote_2, nil, "ButtonClick")
Tween:AddButton(PVPGameSelection:WaitForChild("Main"):WaitForChild("Vote"), nil, "ButtonClick")
Tween:AddButton(NightSelector_2:WaitForChild("Info"):WaitForChild("PlayButton"), nil, "ButtonClick")
Tween:AddButton(NightSelector.Easy, nil, "ButtonClick")
Tween:AddButton(NightSelector.Nightmare, nil, "ButtonClick")
Tween:AddButton(NightSelector_2.Easy, nil, "ButtonClick")
Tween:AddButton(NightSelector_2.Nightmare, nil, "ButtonClick")
Tween:AddButton(EndlessGameSelection.Save.Yes)
Tween:AddButton(EndlessGameSelection.Save.No)
Tween:AddButton(EndlessGameSelection.Main.LoadSave)
ReplicatedStorage.Remotes.Main.Vote.OnClientEvent:Connect(updateAllVotes)
Players.PlayerAdded:Connect(function() --[[ Line: 1109 | Upvalues: ReplicatedStorage (copy) ]]
	task.wait(0.5)
	if ReplicatedStorage.Values.SpecialEvent.Value then
		updateNightUnlocked("Event")
	else
		updateNightUnlocked()
	end
end)