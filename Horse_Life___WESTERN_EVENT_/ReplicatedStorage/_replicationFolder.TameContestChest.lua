-- https://lua.expert/
local t = {}
t.__index = t
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("TameContestService")
local v2 = Sonar("Maid")
local v3 = Sonar("Binder")
local v4 = Sonar("Signal")
local v5 = Sonar("FormatNumber")
local t2 = {
	Color3.fromRGB(255, 223, 55),
	Color3.fromRGB(192, 212, 249),
	Color3.fromRGB(198, 94, 13),
	Color3.fromRGB(255, 255, 255)
}
local v6 = Sonar("PlayerWrapper").GetClient()
local TameContest = game.ReplicatedStorage.Storage.TameContest
function t.new(p1) --[[ new | Line: 24 | Upvalues: t (copy), v2 (copy), v4 (copy), v1 (copy), TameContest (copy), v6 (copy), Sonar (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.SpawnPart = p1
	v22.LastHorseUpdate = tick()
	v22.LastRewardUpdate = tick()
	v22.ShowingRewardOrResult = false
	v22.ShowRewardChangedSignal = v4.new()
	v22.Maid:GiveTask(v22.ShowRewardChangedSignal)
	v22.InteractGui = p1.Parent:FindFirstChild("InteractGui")
	v22.SyncingGui = p1.Parent:FindFirstChild("SyncingGui")
	v22.WaitingGui = p1.Parent:WaitForChild("WaitingGui")
	v22.ClaimGui = p1.Parent:WaitForChild("ClaimGui")
	v22.RewardMaid = v2.new()
	v22.Maid:GiveTask(v22.RewardMaid)
	v22.Maid:GiveTask(v1.RefreshTimer.SeedChanged:Connect(function() --[[ Line: 46 | Upvalues: v22 (copy) ]]
		v22:Update()
	end))
	v22.Maid:GiveTask(TameContest.Ended:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 49 | Upvalues: v22 (copy) ]]
		v22:Update()
	end))
	v22.Maid:GiveTask(v6.TameContestData.LastScore:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 52 | Upvalues: v22 (copy) ]]
		v22:Update()
	end))
	v22.Maid:GiveTask(v6.TameContestData.Entered:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 55 | Upvalues: v22 (copy) ]]
		v22:Update()
	end))
	v22.Maid:GiveTask(v6.TameContestData.Score:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 58 | Upvalues: v22 (copy) ]]
		v22:Update()
	end))
	v22.Maid:GiveTask(v6.TameContestData.Last:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 61 | Upvalues: v22 (copy) ]]
		v22:Update()
	end))
	v22.Maid:GiveTask(v6.TameContestData.Claimed:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 64 | Upvalues: v22 (copy) ]]
		v22:Update()
	end))
	v22:Update()
	v22.Maid:GiveTask(v22.ShowRewardChangedSignal:Connect(function() --[[ Line: 69 | Upvalues: v22 (copy) ]]
		v22:UpdateReward()
	end))
	v22:UpdateReward()
	v22.Maid:GiveTask(Sonar("InteractMenu").new(p1.Parent:WaitForChild("Interact"), {
		ShowHintLabel = true,
		Run = function() --[[ Run | Line: 83 | Upvalues: v22 (copy), Sonar (ref) ]]
			if not v22.ShowingRewardOrResult then
				return
			end
			if type(v22.ShowingRewardOrResult) ~= "table" then
				return
			end
			Sonar("RemoteUtils").GetRemoteFunction("ClaimTameContestReward"):InvokeServer()
		end,
		GetRange = function() --[[ GetRange | Line: 90 ]]
			return 25
		end,
		Visibility = function() --[[ Visibility | Line: 93 | Upvalues: v22 (copy) ]]
			return type(v22.ShowingRewardOrResult) == "table"
		end,
		Hint = function() --[[ Hint | Line: 96 ]]
			return "Claim"
		end,
		HintChanged = v22.ShowRewardChangedSignal
	}))
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 112 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.Update(p1) --[[ Update | Line: 117 | Upvalues: v1 (copy), v6 (copy) ]]
	local v12 = if v1.CheckClaimCondition(v6, "UnclaimedReward") and v1.CheckClaimCondition(v6, "SubmittedScore") then v1.GetRewardTierFromScore(v6) else false
	local isNotShowingRewardOrResult = p1.ShowingRewardOrResult ~= v12
	p1.ShowingRewardOrResult = v12
	if not isNotShowingRewardOrResult then
		return
	end
	p1.ShowRewardChangedSignal:Fire()
end
function t.UpdateReward(p1) --[[ UpdateReward | Line: 133 | Upvalues: v5 (copy), t2 (copy), TameContest (copy) ]]
	local v1 = tick()
	p1.LastRewardUpdate = v1
	task.wait()
	if v1 ~= p1.LastRewardUpdate then
		return
	end
	p1.RewardMaid:DoCleaning()
	if p1.ShowingRewardOrResult and type(p1.ShowingRewardOrResult) ~= "table" then
		p1.WaitingGui.Enabled = false
		p1.SyncingGui.Enabled = true
		p1.ClaimGui.Enabled = false
		p1.ClaimGui.Adornee = nil
		p1.InteractGui.ClaimLabel.Visible = false
		return
	end
	if type(p1.ShowingRewardOrResult) == "table" then
		local v2 = game.ReplicatedStorage.Storage.Assets.TameContestChest:Clone()
		v2:PivotTo(p1.SpawnPart.CFrame + Vector3.new(0, v2.PrimaryPart.Size.Y / 2, 0))
		p1.ClaimGui.TextLabel.Text = v5.GetOrdinalOfNumber(p1.ShowingRewardOrResult.Index) .. " Tier"
		p1.ClaimGui.TextLabel.ScoreLabel.Text = type(p1.ShowingRewardOrResult.Score) == "number" and "+" .. v5.splice(p1.ShowingRewardOrResult.Score) .. " pts" or v5.splice(p1.ShowingRewardOrResult.Score.Min) .. " pts - " .. v5.splice(p1.ShowingRewardOrResult.Score.Max) .. " pts"
		for k, v in pairs(v2:GetDescendants()) do
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
		v2.Parent = workspace.Interactions.TameContest
		p1.RewardMaid:GiveTask(v2)
		p1.WaitingGui.Enabled = false
		p1.ClaimGui.Enabled = true
		p1.ClaimGui.Adornee = v2
	else
		p1.WaitingGui.Enabled = TameContest.Ended.Value
		local Enabled = p1.WaitingGui.Enabled
		p1.ClaimGui.Adornee = nil
		p1.ClaimGui.Enabled = false
	end
	p1.SyncingGui.Enabled = false
	p1.InteractGui.ClaimLabel.Visible = p1.ShowingRewardOrResult
end
function t.Init(p1) --[[ Init | Line: 194 | Upvalues: v3 (copy), t (copy) ]]
	v3.new("TameContestChest", t):Init()
end
t:Init()
return t