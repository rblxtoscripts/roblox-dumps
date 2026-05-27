-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("Maid")
local v3 = Sonar("safeDestroy")
local v4 = Sonar("LootboxService")
local v5 = Sonar("UnlockSequenceService")
local v6 = Sonar("FormatNumber")
local v7 = Sonar("FormatTime")
local v8 = Sonar("PlayerWrapper").GetClient()
function t.new(p1) --[[ new | Line: 21 | Upvalues: t (copy), v2 (copy), v1 (copy), v5 (copy), v8 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.Config = v1.GetComponentConfig(p1, "BattlepassTier")
	v22.Instance = p1.Instance
	if not v22.Instance then
		warn("\226\154\160\239\184\143 BattlepassTierDisplay, Instance is required for battlepass tier display", p1)
		return v22
	end
	v22.Tier = p1.Tier
	if not v22.Tier then
		warn("\226\154\160\239\184\143 BattlepassTierDisplay, Tier is required for battlepass tier display", v22.Instance)
		return v22
	end
	v22.UnlockSequence = v5.GetSequence(v22.Tier.Sequence)
	if not v22.UnlockSequence then
		warn("\226\154\160\239\184\143 BattlepassTierDisplay, Tier.Sequence is required for battlepass tier display", v22.Instance)
		return v22
	end
	v22.Track = v22.UnlockSequence:GetTrack(v22.Tier.Track)
	if not v22.Track then
		warn("\226\154\160\239\184\143 BattlepassTierDisplay, Tier.Track is required for battlepass tier display", v22.Instance)
		return v22
	end
	v22.TierLabel = v1.FindElement(v22.Instance, "TierLabel")
	v22:_setTier()
	v22.PointsLabel = v1.FindElement(v22.Instance, "PointsLabel")
	v22.LockedLabel = v1.FindElement(v22.Instance, "LockedLabel")
	v22.ClaimedLabel = v1.FindElement(v22.Instance, "ClaimedLabel")
	v22.ClaimButton = v1.FindElement(v22.Instance, "ClaimButton")
	v22:_setClaimButton()
	v22.TimerLabel = v1.FindElement(v22.Instance, "TimerLabel")
	v22:_setTimer()
	v22.Maid:GiveTask(v22.UnlockSequence:GetTierChangedSignal(v8, v22.Tier):Connect(function() --[[ Line: 71 | Upvalues: v22 (copy) ]]
		v22:_update()
	end))
	v22:_update()
	v22.RewardFrame = v1.FindElement(v22.Instance, "RewardFrame") or v22.Instance
	v22.Maid:GiveTask(v22.UnlockSequence:GetRepetitionsChangedSignal(v8):Connect(function() --[[ Line: 79 | Upvalues: v22 (copy) ]]
		v22:_setRewards()
	end))
	v22:_setRewards()
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 87 | Upvalues: v3 (copy) ]]
	v3(p1)
end
function t._setTier(p1) --[[ _setTier | Line: 91 | Upvalues: v1 (copy) ]]
	if not p1.TierLabel then
		return
	end
	local v12 = v1.FindElement(p1.TierLabel, "Title")
	if v12 then
		v12.Text = p1.Tier.Index
	else
		p1.TierLabel.Text = p1.Tier.Index
	end
end
function t._getRewardsForCurrentRepetition(p1) --[[ _getRewardsForCurrentRepetition | Line: 104 | Upvalues: v8 (copy) ]]
	if not p1.Tier.RewardsPerRepetition then
		return p1.Tier.Rewards
	end
	local v1 = p1.UnlockSequence:GetRepetitions(v8) + 1
	local v2 = #p1.Tier.RewardsPerRepetition
	if v2 > 0 then
		return p1.Tier.RewardsPerRepetition[math.min(v1, v2)]
	else
		return nil
	end
end
function t._setRewards(p1) --[[ _setRewards | Line: 117 | Upvalues: v4 (copy), v1 (copy) ]]
	p1.Maid.RewardsDisplay = nil
	local v12 = p1:_getRewardsForCurrentRepetition()
	if not v12 then
		return
	end
	if v4.GetLootboxFromTable(v12) then
		p1.Maid.RewardsDisplay = v1.AddComponent("LootboxDisplay", {
			ItemDisplayType = "Cycle",
			AmountLabelAsCycleLabel = true,
			Instance = p1.RewardFrame,
			Lootbox = v12
		})
	else
		p1.Maid.RewardsDisplay = v1.AddComponent("MultiItemDisplay", {
			MaxItems = 1,
			Instance = p1.RewardFrame,
			Items = v12
		})
	end
end
function t._setPoints(p1) --[[ _setPoints | Line: 141 | Upvalues: v8 (copy), v6 (copy) ]]
	if p1.PointsLabel then
		p1.PointsLabel.Text = v6.splice((p1.UnlockSequence:GetRequiredPoints(v8, p1.Tier))) .. " Pts"
	end
end
function t._setState(p1) --[[ _setState | Line: 150 | Upvalues: v8 (copy) ]]
	local v1 = p1.UnlockSequence:GetTierState(v8, p1.Tier)
	if p1.ClaimedLabel then
		p1.ClaimedLabel.Visible = v1 == "Claimed"
	end
	if p1.LockedLabel then
		p1.LockedLabel.Visible = v1 == "Locked"
	end
	if not p1.Config.OnStateChanged then
		return
	end
	p1.Config.OnStateChanged(p1, v1)
end
function t._setClaimButton(p1) --[[ _setClaimButton | Line: 165 | Upvalues: v1 (copy), v8 (copy), v5 (copy) ]]
	if p1.ClaimButton then
		p1.Maid:GiveTask(v1.AddComponent("Button", {
			Instance = p1.ClaimButton,
			OnClick = function() --[[ OnClick | Line: 172 | Upvalues: p1 (copy), v8 (ref), v1 (ref), v5 (ref) ]]
				local v12, v2 = p1.UnlockSequence:CanClaim(v8, p1.Tier)
				if v12 == true then
					v5.RequestToClaimTier(v2)
				else
					v1.Notify({
						Response = v12,
						Args = {
							Prompt = true
						}
					})
				end
			end
		}))
	end
end
function t._setTimer(p1) --[[ _setTimer | Line: 187 | Upvalues: v1 (copy), v7 (copy) ]]
	if not (p1.Tier.StartTime and p1.TimerLabel) then
		return
	end
	if not (workspace:GetServerTimeNow() < p1.Tier.StartTime) then
		return
	end
	p1.Maid:GiveTask(v1.AddComponent("TimerDisplay", {
		Instance = p1.TimerLabel,
		Format = function(p1) --[[ Format | Line: 196 | Upvalues: v7 (ref) ]]
			return v7.FormatTimeWithoutLeadingZeros(p1)
		end,
		EndTime = function() --[[ EndTime | Line: 199 | Upvalues: p1 (copy) ]]
			return p1.Tier.StartTime
		end
	}))
end
function t._update(p1) --[[ _update | Line: 206 | Upvalues: v8 (copy) ]]
	local v1 = p1.UnlockSequence:GetTierState(v8, p1.Tier) == "Completed"
	p1:_setState()
	p1:_setPoints()
	if not p1.ClaimButton then
		return
	end
	p1.ClaimButton.Visible = v1
end
return t