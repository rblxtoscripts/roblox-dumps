-- https://lua.expert/
local t = {}
t.__index = t
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("AnimalDataService")
local v2 = Sonar("BreedContestService")
local v3 = Sonar("AnimalRiggerService")
local v4 = Sonar("Maid")
local v5 = Sonar("Binder")
local v6 = Sonar("InfoOverlayGui")
local v7 = Sonar("Signal")
local v8 = Sonar("PromptClient")
local v9 = Sonar("FormatNumber")
local v10 = Sonar("TutorialService")
local v11 = Sonar("Constants")
local t2 = {
	Color3.fromRGB(255, 223, 55),
	Color3.fromRGB(192, 212, 249),
	Color3.fromRGB(198, 94, 13),
	Color3.fromRGB(255, 255, 255)
}
local v12 = Sonar("PlayerWrapper").GetClient()
local t3 = {
	Piaffe = true,
	HappyStomp = true,
	HeadShake = true,
	HoofDig = true,
	LegRest = true
}
repeat
	task.wait()
until v12.BreedContestData
local BreedContest = game.ReplicatedStorage.Storage.BreedContest
function t.new(p1) --[[ new | Line: 40 | Upvalues: t (copy), v4 (copy), v7 (copy), v2 (copy), BreedContest (copy), v12 (copy), Sonar (copy), v10 (copy), v8 (copy), v9 (copy), v6 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v4.new()
	v22.SpawnPart = p1
	v22.LastHorseUpdate = tick()
	v22.LastRewardUpdate = tick()
	v22.ShowingRewardOrResult = false
	v22.ShowRewardChangedSignal = v7.new()
	v22.Maid:GiveTask(v22.ShowRewardChangedSignal)
	v22.InteractGui = p1.Parent:FindFirstChild("InteractGui")
	v22.SyncingGui = p1.Parent:FindFirstChild("SyncingGui")
	v22.WaitingGui = p1.Parent:WaitForChild("WaitingGui")
	v22.PromptGui = p1.Parent:WaitForChild("PromptGui")
	v22.ClaimGui = p1.Parent:WaitForChild("ClaimGui")
	v22.HorseMaid = v4.new()
	v22.Maid:GiveTask(v22.HorseMaid)
	v22.RewardMaid = v4.new()
	v22.Maid:GiveTask(v22.RewardMaid)
	v22.Maid:GiveTask(v2.RefreshTimer.SeedChanged:Connect(function() --[[ Line: 65 | Upvalues: v22 (copy) ]]
		v22:Update()
	end))
	v22.Maid:GiveTask(BreedContest.Ended:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 68 | Upvalues: v22 (copy) ]]
		v22:Update()
	end))
	v22.Maid:GiveTask(v12.BreedContestData.LastScore:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 71 | Upvalues: v22 (copy) ]]
		v22:Update()
	end))
	v22.Maid:GiveTask(v12.BreedContestData.Score:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 74 | Upvalues: v22 (copy) ]]
		v22:Update()
	end))
	v22.Maid:GiveTask(v12.BreedContestData.Last:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 77 | Upvalues: v22 (copy) ]]
		v22:Update()
	end))
	v22.Maid:GiveTask(v12.BreedContestData.Claimed:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 80 | Upvalues: v22 (copy) ]]
		v22:Update()
	end))
	v22:Update()
	v22.Maid:GiveTask(v22.ShowRewardChangedSignal:Connect(function() --[[ Line: 85 | Upvalues: v22 (copy) ]]
		v22:UpdateReward()
	end))
	v22:UpdateReward()
	v22.Maid:GiveTask(v22.ShowRewardChangedSignal:Connect(function() --[[ Line: 90 | Upvalues: v22 (copy) ]]
		v22:UpdateHorse()
	end))
	v22.Maid:GiveTask(BreedContest.Ended:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 93 | Upvalues: v22 (copy) ]]
		v22:UpdateHorse()
	end))
	v22.Maid:GiveTask(v2.CurrentSlotChangedSignal:Connect(function() --[[ Line: 96 | Upvalues: v22 (copy) ]]
		v22:UpdateHorse()
	end))
	v22:UpdateHorse()
	v22.Maid:GiveTask(Sonar("InteractMenu").new(p1.Parent:WaitForChild("Interact"), {
		ShowHintLabel = true,
		Run = function() --[[ Run | Line: 103 | Upvalues: v22 (copy), Sonar (ref), v10 (ref), v12 (ref), v8 (ref), v2 (ref), v9 (ref), v6 (ref) ]]
			if v22.ShowingRewardOrResult then
				if type(v22.ShowingRewardOrResult) == "table" then
					Sonar("RemoteUtils").GetRemoteFunction("ClaimBreedContestReward"):InvokeServer()
				end
			else
				if not v10.CanDoActionInTutorial("InteractZones") then
					return
				end
				if not v12.PlayerData.Missions.SpeciesUnlocks.Kelpie.Completed.Value then
					v8.Prompt({
						Type = "LockedJournal",
						Setup = function(p1) --[[ Setup | Line: 116 ]]
							p1.Content.Description.Text = string.format("To unlock the Cosmetic Contest you must complete the %s Quests!", "Kelpie")
						end,
						Run = function() --[[ Run | Line: 119 | Upvalues: Sonar (ref) ]]
							Sonar("JournalGui").Open("Horses")
							return true
						end,
						Cancel = function() --[[ Cancel | Line: 123 ]]
							return true
						end
					})
					return
				end
				if v12.BreedContestData.FoalsBorn.Value < v2.FoalsBornToCompete then
					v8.Prompt({
						Type = "FeatureLocked",
						Setup = function(p1, p2) --[[ Setup | Line: 133 | Upvalues: v2 (ref), Sonar (ref), v9 (ref), v12 (ref) ]]
							p1.Content.ProgressDescription.Description.Text = string.format("Foal %s horses to unlock the Cosmetic Contest for this week!", v2.FoalsBornToCompete)
							p1.Content.Description.Visible = false
							p1.Content.ProgressDescription.Visible = true
							p2.Maid:GiveTask(Sonar("StatBar").new({
								TweenAmount = true,
								Clipped = false,
								Frame = p1.Content.ProgressDescription.ProgressBar.Fill,
								AmountLabel = p1.Content.ProgressDescription.ProgressBar.Progress,
								GetText = function(p1, p2) --[[ GetText | Line: 145 | Upvalues: v9 (ref) ]]
									return v9.suffix(p1) .. "/" .. v9.suffix(p2)
								end,
								Get = function() --[[ Get | Line: 149 | Upvalues: v12 (ref) ]]
									return v12.BreedContestData.FoalsBorn.Value
								end,
								GetMax = function() --[[ GetMax | Line: 152 | Upvalues: v2 (ref) ]]
									return v2.FoalsBornToCompete
								end,
								Changed = { v12.BreedContestData.FoalsBorn:GetPropertyChangedSignal("Value") }
							}))
						end,
						Run = function() --[[ Run | Line: 160 ]]
							return true
						end
					})
					return
				end
				v6.Open({
					HeadViewport = true,
					SpeciesAsName = true,
					SlotValue = v2.GetSlot(),
					Disabled = {
						Pedigree = true,
						InfoPopup = true,
						Favorite = true,
						Birthday = true,
						Mutations = true,
						Skills = true,
						Age = true,
						Origins = true,
						Activity = true
					},
					BreakdownResize = {
						Size = UDim2.new(1, 0, 1, 0),
						Position = UDim2.new(0, 0, 0, 0),
						ScrollingSize = UDim2.new(0.958, 0, 0.949, 0)
					}
				})
			end
		end,
		GetRange = function() --[[ GetRange | Line: 192 ]]
			return 25
		end,
		Visibility = function() --[[ Visibility | Line: 195 | Upvalues: v22 (copy), v2 (ref) ]]
			if not v22.ShowingRewardOrResult then
				return not v2.HasEnded()
			end
			return type(v22.ShowingRewardOrResult) == "table"
		end,
		Hint = function() --[[ Hint | Line: 202 | Upvalues: v22 (copy) ]]
			if type(v22.ShowingRewardOrResult) == "table" then
				return "Claim"
			else
				return "Inspect"
			end
		end,
		HintChanged = v22.ShowRewardChangedSignal
	}))
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 218 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.Update(p1) --[[ Update | Line: 223 | Upvalues: v2 (copy), v12 (copy) ]]
	local v1 = if v2.CheckClaimCondition(v12, "UnclaimedReward") and v2.CheckClaimCondition(v12, "SubmittedScore") then v2.GetRewardTierFromScore(v12) else false
	local isNotShowingRewardOrResult = p1.ShowingRewardOrResult ~= v1
	p1.ShowingRewardOrResult = v1
	if not isNotShowingRewardOrResult then
		return
	end
	p1.ShowRewardChangedSignal:Fire()
end
function t.UpdateReward(p1) --[[ UpdateReward | Line: 239 | Upvalues: v9 (copy), v2 (copy), t2 (copy) ]]
	local v1 = tick()
	p1.LastRewardUpdate = v1
	task.wait()
	if v1 ~= p1.LastRewardUpdate then
		return
	end
	p1.RewardMaid:DoCleaning()
	if p1.ShowingRewardOrResult and type(p1.ShowingRewardOrResult) ~= "table" then
		p1.SyncingGui.Enabled = true
		p1.ClaimGui.Enabled = false
		p1.ClaimGui.Adornee = nil
		p1.InteractGui.ClaimLabel.Visible = false
		return
	end
	if type(p1.ShowingRewardOrResult) == "table" then
		local v22 = game.ReplicatedStorage.Storage.Assets.BreedContestChest:Clone()
		v22:PivotTo(p1.SpawnPart.CFrame + Vector3.new(0, v22.PrimaryPart.Size.Y / 2, 0))
		p1.ClaimGui.TextLabel.Text = v9.GetOrdinalOfNumber(p1.ShowingRewardOrResult.Index) .. " Tier"
		p1.ClaimGui.TextLabel.ScoreLabel.Text = type(p1.ShowingRewardOrResult.Score) == "number" and p1.ShowingRewardOrResult.Score .. "%" or v2.FormatPercentage(p1.ShowingRewardOrResult.Score.Min) .. " - " .. v2.FormatPercentage(p1.ShowingRewardOrResult.Score.Max)
		for k, v in pairs(v22:GetDescendants()) do
			if v:IsA("ParticleEmitter") then
				local v6 = ColorSequence.new
				v.Color = v6(t2[p1.ShowingRewardOrResult.Index] or t2[4])
				if v.Name == "Sparkles" then
					v.Enabled = if p1.ShowingRewardOrResult.Index <= 3 then true else false
					continue
				end
				if v.Name == "Floaters" then
					v.Enabled = p1.ShowingRewardOrResult.Index <= 1
				end
			end
		end
		v22.Parent = workspace.Interactions.BreedContest
		p1.RewardMaid:GiveTask(v22)
		p1.ClaimGui.Enabled = true
		p1.ClaimGui.Adornee = v22
	else
		p1.ClaimGui.Adornee = nil
		p1.ClaimGui.Enabled = false
	end
	p1.SyncingGui.Enabled = false
	p1.InteractGui.ClaimLabel.Visible = p1.ShowingRewardOrResult
end
function t.UpdateHorse(p1) --[[ UpdateHorse | Line: 287 | Upvalues: BreedContest (copy), v2 (copy), v3 (copy), v12 (copy), v1 (copy), v11 (copy), t3 (copy) ]]
	local v13 = tick()
	p1.LastHorseUpdate = v13
	task.wait()
	if v13 ~= p1.LastHorseUpdate then
		return
	end
	p1.HorseMaid:DoCleaning()
	if p1.ShowingRewardOrResult or BreedContest.Ended.Value then
		p1.WaitingGui.Enabled = not p1.ShowingRewardOrResult
		p1.PromptGui.Enabled = false
		p1.PromptGui.Adornee = nil
		p1.InteractGui.InspectLabel.Visible = false
		return
	end
	p1.WaitingGui.Enabled = false
	p1.InteractGui.InspectLabel.Visible = true
	local SlotInfo = v2.GetSlot():Clone()
	local v22, v32 = v3.CreateAnimalModel({
		ForceAdult = true,
		SlotValue = SlotInfo,
		PlayerWrapper = v12
	})
	v32:GiveTask(v22)
	local v4 = v1.GetByName(SlotInfo.Species.Value)
	SlotInfo.Name = "SlotInfo"
	SlotInfo.Parent = v22
	for v5, v6 in v22:GetDescendants() do
		if v6:IsA("BasePart") then
			v6.Massless = true
			v6.CanCollide = false
			v6.CanTouch = false
			v6.CanQuery = false
			v6.EnableFluidForces = false
			if v6.Name ~= "RootPart" then
				v6.RootPriority = -127
			end
		end
	end
	v22:ScaleTo((v1.GetScale(SlotInfo)))
	v22:PivotTo(p1.SpawnPart.CFrame + Vector3.new(0, v22.HumanoidRootPart.Size.Y / 2 - (v22.HumanoidRootPart.Position - v22.PrimaryPart.Position).Y, 0))
	local Eyelid = v22:FindFirstChild("Eyelid")
	if Eyelid then
		Eyelid:Destroy()
	end
	v22.PrimaryPart.CanCollide = false
	v22.PrimaryPart.Anchored = true
	v22.PrimaryPart.BodyVelocity:Destroy()
	v22.PrimaryPart.BodyGyro:Destroy()
	v22:AddTag(v11.AnimalWithCosmeticsTag)
	v22.Parent = workspace.Interactions.BreedContest
	p1.PromptGui.Adornee = v22
	p1.PromptGui.Enabled = true
	local v9 = v22:FindFirstChild("AnimationController") or Instance.new("AnimationController", v22)
	local Animation = Instance.new("Animation")
	Animation.AnimationId = v4.Animations.Idle
	local v10 = v9:LoadAnimation(Animation)
	Animation:Destroy()
	local t = {}
	for v112, v122 in v4.Animations do
		if t3[v112] then
			local Animation_2 = Instance.new("Animation")
			Animation_2.AnimationId = v122
			table.insert(t, v9:LoadAnimation(Animation_2))
			Animation_2:Destroy()
		end
	end
	task.spawn(function() --[[ Line: 370 | Upvalues: v22 (copy), t (copy), v10 (copy) ]]
		local v1 = nil
		while v22.Parent do
			if v1 then
				v1:Stop()
			end
			v1 = t[math.random(#t)]
			v1:Play()
			task.wait(v1.Length)
			v10:Play()
			task.wait(math.random(2, 6))
		end
	end)
	p1.HorseMaid:GiveTask(v32)
end
function t.Init(p1) --[[ Init | Line: 388 | Upvalues: v5 (copy), t (copy) ]]
	v5.new("BreedContestHorseSpawn", t):Init()
end
t:Init()
return t