-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("LoginRewardsService")
local v3 = Sonar("LootboxService")
local v4 = Sonar("Maid")
local v5 = Sonar("FormatNumber")
local v6 = Sonar("PlayerWrapper").GetClient()
function t.new(p1) --[[ new | Line: 21 | Upvalues: t (copy), v4 (copy), v6 (copy), v1 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v4.new()
	v2.GuiProvider = p1
	v2.DailyLoginScreen = v2.GuiProvider:GetScreen("DailyLoginFrame")
	v2.LoginRewards = v6:GetLoginRewards("DailyLogin")
	v2.DailyLoginScreen:AddCallback("OnOpen", function() --[[ Line: 30 | Upvalues: v2 (copy) ]]
		v2:_buildRewards()
	end)
	v1.AddComponent("CloseButton", {
		Instance = v1.FindElement(v2.DailyLoginScreen.Instance, "CloseButton")
	})
	v2:_setupHUDButton()
	return v2
end
function t._setupHUDButton(p1) --[[ _setupHUDButton | Line: 43 | Upvalues: v1 (copy) ]]
	v1.BindToTag("HUD_DailyLoginButton", function(p12) --[[ Line: 44 | Upvalues: v1 (ref), p1 (copy) ]]
		v1.AddComponent("NotificationBadge", {
			Instance = p12,
			CanShow = function() --[[ CanShow | Line: 47 | Upvalues: p1 (ref) ]]
				local v1 = p1.LoginRewards:GetProgress("Default")
				return if v1 then v1.CanClaimNow else v1
			end,
			Changed = p1.LoginRewards:GetProgressChangedSignal("Default")
		})
	end)
end
function t._buildRewards(p1) --[[ _buildRewards | Line: 56 | Upvalues: v1 (copy), v3 (copy), v2 (copy), v6 (copy) ]]
	if p1._built then
		return
	end
	p1._built = true
	p1.ContentsFrame = v1.FindElement(p1.DailyLoginScreen.Instance, "ContentsFrame")
	for v12, v22 in p1.LoginRewards:GetTrack("Default").Tiers do
		v1.AddComponent("GuiObject", {
			Parent = p1.ContentsFrame,
			LayoutOrder = v12,
			OnCreated = function(p12) --[[ OnCreated | Line: 70 | Upvalues: v1 (ref), v12 (copy), v22 (copy), v3 (ref), p1 (copy), v2 (ref), v6 (ref) ]]
				local v13 = v1.FindElement(p12.Instance, "DayLabel")
				if v13 then
					v13.Text = "Day " .. v12
				end
				if v1.FindElement(p12.Instance, "RewardsFrame") and v22.Rewards then
					if v3.GetLootboxFromTable(v22.Rewards) then
						p1.Maid:GiveTask(v1.AddComponent("LootboxDisplay", {
							ItemDisplayType = "Cycle",
							AmountLabelAsCycleLabel = true,
							Instance = p12.Instance,
							Lootbox = v22.Rewards
						}))
					else
						p1.Maid:GiveTask(v1.AddComponent("MultiItemDisplay", {
							MaxItems = 1,
							Instance = p12.Instance,
							Items = v22.Rewards
						}))
					end
				end
				local v23 = v1.FindElement(p12.Instance, "ClaimButton")
				if v23 then
					p12:GiveTask(v1.AddComponent("Button", {
						Instance = v23,
						OnClick = function() --[[ OnClick | Line: 98 | Upvalues: v2 (ref), v22 (ref) ]]
							v2.RequestToClaim({
								Sequence = "DailyLogin",
								Track = "Default",
								Tier = v22.Index
							})
						end
					}))
				end
				p12:GiveTask(v1.AddComponent("NotificationBadge", {
					Instance = p12.Instance,
					CanShow = function() --[[ CanShow | Line: 110 | Upvalues: p1 (ref), v6 (ref), v22 (ref) ]]
						return p1.LoginRewards:CanClaim(v6, v22) == true
					end,
					Changed = p1.LoginRewards:GetTierChangedSignal(v6, v22)
				}))
				local v32 = v1.FindElement(p12.Instance, "ClaimedIcon")
				local v4 = v1.FindElement(p12.Instance, "LockedIcon")
				local function updateState() --[[ updateState | Line: 119 | Upvalues: p1 (ref), v6 (ref), v22 (ref), v23 (copy), v32 (copy), v4 (copy), p12 (copy) ]]
					local v1 = p1.LoginRewards:GetTierState(v6, v22)
					local v2 = p1.LoginRewards:CanClaim(v6, v22)
					if v23 then
						v23.Visible = v2 == true
					end
					if v32 then
						v32.Visible = v1 == "Claimed"
					end
					if v4 then
						v4.Visible = if v1 == "Claimed" then false elseif v2 == true then false else true
					end
					p12.Instance:SetAttribute("State", v1)
					p12.Instance:SetAttribute("CanClaim", v2 == true)
				end
				p12:GiveTask(p1.LoginRewards:GetTierChangedSignal(v6, v22):Connect(updateState))
				updateState()
			end
		})
	end
	p1:_buildStats()
	p1:_buildTimer()
end
function t._buildStats(p1) --[[ _buildStats | Line: 148 | Upvalues: v1 (copy), v5 (copy), v6 (copy) ]]
	local v12 = v1.FindElement(p1.DailyLoginScreen.Instance, "StatsFrame")
	if not v12 then
		return
	end
	local v2 = v1.FindElement(v12, "CurrentStreakLabel")
	if v2 then
		v1.AddComponent("TextLabel", {
			Instance = v2,
			Text = function() --[[ Text | Line: 158 | Upvalues: v5 (ref), p1 (copy), v6 (ref) ]]
				return v5.suffix(p1.LoginRewards:GetStreak(v6))
			end,
			Changed = p1.LoginRewards:GetProgressChangedSignal("Default")
		})
	end
	local v3 = v1.FindElement(v12, "LongestStreakLabel")
	if v3 then
		v1.AddComponent("TextLabel", {
			Instance = v3,
			Text = function() --[[ Text | Line: 169 | Upvalues: v5 (ref), p1 (copy), v6 (ref) ]]
				return v5.suffix(p1.LoginRewards:GetLongestStreak(v6))
			end,
			Changed = p1.LoginRewards:GetProgressChangedSignal("Default")
		})
	end
	local v4 = v1.FindElement(p1.DailyLoginScreen.Instance, "ProgressBarFrame")
	if not v4 then
		return
	end
	local v52 = p1.LoginRewards:GetTrack("Default")
	v1.AddComponent("AnimatedBar", {
		DoNotTweenText = true,
		Instance = v4,
		Get = function() --[[ Get | Line: 181 | Upvalues: p1 (copy) ]]
			local v1 = p1.LoginRewards:GetProgress("Default")
			return if v1 then v1.ClaimedTiers or 0 else 0
		end,
		GetMax = function() --[[ GetMax | Line: 185 | Upvalues: v52 (copy) ]]
			return #v52.Tiers
		end,
		Changed = p1.LoginRewards:GetProgressChangedSignal("Default"),
		Format = function(p1, p2) --[[ Format | Line: 189 ]]
			return string.format("%d%%", (math.round(p1 / p2 * 100)))
		end
	})
end
function t._buildTimer(p1) --[[ _buildTimer | Line: 197 | Upvalues: v1 (copy), v6 (copy) ]]
	local v12 = v1.FindElement(p1.DailyLoginScreen.Instance, "TimerFrame")
	if v12 then
		local v2 = v1.FindElement(v12, "TimerPrefixLabel")
		v1.AddComponent("TimerDisplay", {
			Instance = v12,
			EndTime = function() --[[ EndTime | Line: 207 | Upvalues: v6 (ref) ]]
				local v1 = v6:GetLoginRewards("DailyLogin")
				if not v1 then
					return 0
				end
				local v2 = v1:GetProgress("Default")
				if v2 and v2.CanClaimNow then
					local v3 = v1:GetGraceExpiresTimestamp()
					if v3 == (1 / 0) then
						return 0
					else
						return v3
					end
				else
					local v4 = v1:GetClaimableTimestamp()
					if v4 == 0 then
						return 0
					else
						return v4
					end
				end
			end,
			Format = function(p12) --[[ Format | Line: 230 | Upvalues: p1 (copy), v2 (copy) ]]
				local v1 = p1.LoginRewards:GetProgress("Default")
				if v1 and v1.CanClaimNow then
					if v2 then
						v2.Text = "Claim before..."
					end
					if p12 <= 0 then
						return "No limit"
					else
						return p12
					end
				else
					if v2 then
						v2.Text = "Next Day in..."
					end
					if p12 <= 0 then
						return "Now!"
					else
						return p12
					end
				end
			end,
			Changed = p1.LoginRewards:GetProgressChangedSignal("Default")
		})
	end
end
function t.Open(p1) --[[ Open | Line: 255 | Upvalues: v1 (copy) ]]
	v1.OpenScreenGroup("DailyLogin")
end
function t.Close(p1) --[[ Close | Line: 259 | Upvalues: v1 (copy) ]]
	v1.CloseScreenGroup("DailyLogin")
end
function t.OpenIfClaimableRewards(p1, p2) --[[ OpenIfClaimableRewards | Line: 263 ]]
	local v1 = p1.LoginRewards:GetProgress("Default")
	if not (v1 and v1.CanClaimNow) then
		return false
	end
	p1:Open()
	if not p2 then
		return true
	end
	p1.DailyLoginScreen:WaitUntilClosed()
	return true
end
return t