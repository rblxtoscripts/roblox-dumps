-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("Maid")
local v3 = Sonar("MissionsService")
local v4 = Sonar("safeDestroy")
local v5 = Sonar("PlayerWrapper")
local v6 = Sonar("StorageUtils").GetConfig("Missions")()
local t2 = {
	ImageLabel = "ImageColor3",
	ImageButton = "ImageColor3",
	TextLabel = "TextColor3",
	TextButton = "TextColor3",
	TextBox = "TextColor3",
	Frame = "BackgroundColor3",
	ScrollingFrame = "BackgroundColor3",
	UIStroke = "Color",
	UIGradient = "Color"
}
local v7 = v5.GetClient()
function t.new(p1) --[[ new | Line: 33 | Upvalues: t (copy), v2 (copy), v1 (copy), v3 (copy), v7 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.Config = p1
	v22.Instance = p1.Instance
	v22.Mission = v22.Config.Mission
	v22.ParentMission = v22.Mission.Mission or v22.Mission
	if not v22.Mission then
		warn("\226\154\160\239\184\143 MissionsDisplay, Mission or Task is required", v22.Instance, v22.Config)
		return v22
	end
	v22.ParentMissionData = v22.ParentMission:GetMissionData()
	v22.RewardsLabel = v22.RewardsLabel or v1.FindElement(v22.Instance, "RewardsLabel")
	if v22.Mission.TaskDataChangedSignal then
		v22.Maid:GiveTask(v22.Mission.TaskDataChangedSignal:Connect(function() --[[ Line: 53 | Upvalues: v22 (copy) ]]
			v22:_setRewards()
		end))
	end
	v22:_setRewards()
	v22.DescriptionLabel = v22.DescriptionLabel or v1.FindElement(v22.Instance, "DescriptionLabel")
	v22.Maid:GiveTask(v22.Mission:GetChangedSignal():Connect(function() --[[ Line: 61 | Upvalues: v22 (copy) ]]
		v22:_setDescription()
	end))
	v22:_setDescription()
	v22.TitleLabel = v22.TitleLabel or v1.FindElement(v22.Instance, "TitleLabel")
	v22.Maid:GiveTask(v22.Mission:GetChangedSignal():Connect(function() --[[ Line: 68 | Upvalues: v22 (copy) ]]
		v22:_setTitle()
	end))
	v22:_setTitle()
	v22.TimerLabel = v22.TimerLabel or v1.FindElement(v22.Instance, "TimerLabel")
	if v22.TimerLabel then
		if v22:_getTimeToComplete() then
			v22.TimerLabel.Visible = true
			v22.Maid:GiveTask(v1.AddComponent("TimerDisplay", {
				Instance = v22.TimerLabel,
				Format = v22.Config.FormatTimer,
				EndTime = function() --[[ EndTime | Line: 81 | Upvalues: v22 (copy) ]]
					return v22:_getTimeToComplete()
				end,
				Changed = { v22.Mission:GetChangedSignal() }
			}))
		else
			v22.TimerLabel.Visible = false
		end
	end
	v22.RecolorInstances = v1.FindElement(v22.Instance, "Recolor", {
		GetAllDescendants = true
	})
	v22.ClaimButton = v1.FindElement(v22.Instance, "ClaimButton") or v22.ButtonInstance
	v22.ClaimedLabel = v22.ClaimedLabel or v1.FindElement(v22.Instance, "ClaimedLabel")
	v22.CompletedLabels = v1.FindElement(v22.Instance, "CompletedLabel", {
		GetAllDescendants = true
	})
	if v22.ClaimButton then
		v22.Maid:GiveTask(v1.AddComponent("Button", {
			Instance = v22.ClaimButton,
			OnClick = function() --[[ OnClick | Line: 102 | Upvalues: v3 (ref), v7 (ref), v22 (copy), v1 (ref) ]]
				local v12 = v3.CanClaimMission(v7, {
					MissionId = v22.ParentMission.MissionId,
					TaskId = v22.Mission.TaskId
				})
				if v12 == true then
					v3.RequestToClaimMission({
						MissionId = v22.ParentMission.MissionId,
						TaskId = v22.Mission.TaskId
					})
				else
					v1.Notify({
						Response = v12,
						Args = {}
					})
				end
			end
		}))
	end
	v22.PinButton = v22.PinButton or v1.FindElement(v22.Instance, "PinButton")
	v22.PinnedLabel = v22.PinnedLabel or v1.FindElement(v22.Instance, "PinnedLabel")
	if v22.PinButton then
		v22.Maid:GiveTask(v22.Mission:GetPinnedChangedSignal():Connect(function() --[[ Line: 128 | Upvalues: v22 (copy) ]]
			v22:_setPin()
		end))
		v22.Maid:GiveTask(v22.Mission:GetChangedSignal():Connect(function() --[[ Line: 131 | Upvalues: v22 (copy) ]]
			v22:_setPin()
		end))
		v22.PinButtonComponent = v22.Maid:GiveTask(v1.AddComponent("Button", {
			Instance = v22.PinButton,
			OnClick = function() --[[ OnClick | Line: 137 | Upvalues: v22 (copy), v3 (ref) ]]
				if v22.Mission:IsPinned() or v22.Mission:CanPin() then
					v3.RequestToPinMission({
						MissionId = v22.ParentMission.MissionId,
						TaskId = v22.Mission.TaskId,
						Identifier = v22.ParentMission:GetIdentifier()
					})
				end
			end
		}))
	end
	v22:_setPin()
	v22.TypeLabel = v22.TypeLabel or v1.FindElement(v22.Instance, "TypeLabel")
	v22.Maid:GiveTask(v22.Mission:GetChangedSignal():Connect(function() --[[ Line: 154 | Upvalues: v22 (copy) ]]
		v22:_setType()
	end))
	v22:_setType()
	v22.Maid:GiveTask(v22.Mission:GetChangedSignal():Connect(function() --[[ Line: 159 | Upvalues: v22 (copy) ]]
		v22:_recolorInstances()
	end))
	v22:_recolorInstances()
	v22.ProgressBar = v22.ProgressBar or v1.FindElement(v22.Instance, "ProgressBar")
	v22.ProgressLabels = v1.FindElement(v22.Instance, "ProgressLabel", {
		GetAllDescendants = true
	})
	v22.MaxProgressLabels = v1.FindElement(v22.Instance, "MaxLabel", {
		GetAllDescendants = true
	})
	if v22.ProgressBar then
		v22.Maid:GiveTask(v1.AddComponent("AnimatedBar", {
			Direction = "LeftToRight",
			Instance = v22.ProgressBar,
			AmountLabel = v22.ProgressLabels or nil,
			TweenToInitialValue = v22.Config.TweenToInitialValue,
			Get = function() --[[ Get | Line: 175 | Upvalues: v22 (copy) ]]
				if v22.Mission:IsComplete() or v22.Mission:IsClaimed() then
					return v22.Mission:GetGoalAmount()
				else
					local v1 = v22.Mission:GetAmount()
					return math.min(v1, v22.Mission:GetGoalAmount())
				end
			end,
			GetMax = function() --[[ GetMax | Line: 181 | Upvalues: v22 (copy) ]]
				return v22.Mission:GetGoalAmount()
			end,
			Changed = { v22.Mission:GetChangedSignal() },
			OnChanged = function() --[[ OnChanged | Line: 187 | Upvalues: v22 (copy) ]]
				v22:_setProgress()
			end,
			Format = function(p1, p2) --[[ Format | Line: 190 | Upvalues: v22 (copy) ]]
				return v22:_getDisplayProgress()
			end
		}))
	else
		v22.Maid:GiveTask(v22.Mission:GetChangedSignal():Connect(function() --[[ Line: 196 | Upvalues: v22 (copy) ]]
			v22:_setProgress()
		end))
	end
	v22:_setProgress()
	v22.LastProgressAmount = v22.Mission:GetAmount()
	v22.GoToButton = v22.GoToButton or v1.FindElement(v22.Instance, "GoToButton") or v22.Instance:HasTag("GoToButton") and v22.Instance
	if v22.GoToButton and (if v22.Mission:GetGoToAction() == nil then false else true) then
		v22.Maid:GiveTask(v1.AddComponent("Button", {
			Instance = v22.GoToButton,
			OnClick = function() --[[ OnClick | Line: 212 | Upvalues: v22 (copy) ]]
				v22.Mission:GoTo()
			end
		}))
	elseif v22.GoToButton then
		v22.GoToButton.Visible = false
	end
	v22.Maid:GiveTask(v22.Mission:GetChangedSignal():Connect(function() --[[ Line: 220 | Upvalues: v22 (copy) ]]
		v22:_setState()
	end))
	v22:_setState()
	if p1.Context and not p1.LayoutOrder then
		p1.LayoutOrder = v22.TaskId
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 234 | Upvalues: v4 (copy) ]]
	v4(p1)
end
function t._getTimeToComplete(p1) --[[ _getTimeToComplete | Line: 238 ]]
	local v1 = p1.ParentMission:GetExpireTime()
	if v1 then
		return v1
	end
	if p1.ParentMission:IsRotateMission() then
		return p1.ParentMission.MissionValue.Value
	else
		return p1.ParentMission.RestartTime
	end
end
function t._canPinOrUnpin(p1) --[[ _canPinOrUnpin | Line: 254 ]]
	return p1.Mission:CanPin()
end
function t._setPin(p1) --[[ _setPin | Line: 258 | Upvalues: v6 (copy) ]]
	if not p1.PinButton then
		return
	end
	local v1 = p1.Mission:IsPinned()
	local v2 = p1.Mission:GetState()
	p1.PinButton.Visible = p1:_canPinOrUnpin()
	local v3 = p1.Config.PinnedButtonBehaviour or v6.PinnedButtonBehaviour
	if not v3 then
		return
	end
	v3(p1.PinButtonComponent, v1, v2)
end
function t._recolorInstances(p1) --[[ _recolorInstances | Line: 273 | Upvalues: t2 (copy) ]]
	if not p1.RecolorInstances then
		return
	end
	if not next(p1.RecolorInstances) then
		return
	end
	local v1 = p1.ParentMission:GetColor()
	local v2 = typeof(v1) == "ColorSequence"
	local v3 = if typeof(v1) == "Color3" then true else false
	for v4, v5 in p1.RecolorInstances do
		for v8, v9 in t2 do
			local v6, v7
			if v5:IsA(v8) then
				if v9 == "Color" and v5:IsA("UIGradient") then
					v6 = if v2 and v1 then v1 else ColorSequence.new(v1)
					v5.Color = v6
				else
					v7 = if v3 and v1 then v1 else v1.Keypoints[1].Value
					v5[v9] = v7
				end
				break
			end
		end
	end
end
function t._setType(p1) --[[ _setType | Line: 300 | Upvalues: v6 (copy) ]]
	if not p1.TypeLabel then
		return
	end
	local v1 = p1.Mission:GetImage()
	if not v1 or v1 == "" then
		v1 = p1.ParentMission:GetImage()
	end
	p1.TypeLabel.Image = v1
	p1.TypeLabel.Visible = #p1.TypeLabel.Image > 0
	local v4 = p1.Config.TypeImageBehaviour or v6.TypeImageBehaviour
	if not v4 then
		return
	end
	v4(p1.TypeLabel, p1, p1.Mission, p1.ParentMission)
end
function t._setState(p1) --[[ _setState | Line: 319 ]]
	p1.State = p1.Mission:GetState()
	if p1.ClaimButton then
		p1.ClaimButton.Visible = p1.State == "Complete"
	end
	if p1.ClaimedLabel then
		p1.ClaimedLabel.Visible = p1.State == "Claimed"
	end
	for v1, v2 in p1.CompletedLabels do
		v2.Visible = if p1.State == "Claimed" then true elseif p1.State == "Complete" then true else false
	end
	local v4 = p1:_shouldHideProgress()
	local v5 = p1:_getMaxLabelText() == nil
	if p1.ProgressBar then
		p1.ProgressBar.Visible = not v4
	end
	for v6, v7 in p1.ProgressLabels do
		v7.Visible = not v4
	end
	for v8, v9 in p1.MaxProgressLabels do
		v9.Visible = not v4 and not v5
	end
end
function t._setTitle(p1) --[[ _setTitle | Line: 351 ]]
	if not p1.TitleLabel then
		return
	end
	if p1.DescriptionLabel then
		p1.TitleLabel.Text = if p1.Mission:IsA("Task") then p1.ParentMission:GetDisplayName() or "" else ""
	else
		p1.TitleLabel.Text = p1.Mission:IsA("Task") and p1.ParentMission:GetDisplayName() or (not p1.Mission:IsA("Task") and p1.ParentMission:GetDisplayName() or p1.Mission:GetDescription({
			ShortDescription = p1.Config.ShortDescription
		}))
	end
end
function t._setDescription(p1) --[[ _setDescription | Line: 366 ]]
	if not p1.DescriptionLabel then
		return
	end
	if not p1.Mission:IsA("Task") then
		return
	end
	p1.DescriptionLabel.Text = p1.Mission:GetDescription({
		ShortDescription = p1.Config.ShortDescription
	})
end
function t._getDisplayProgress(p1) --[[ _getDisplayProgress | Line: 376 ]]
	local v1 = p1.Mission:GetGoalAmount()
	local v3 = math.min(p1.Mission:GetAmount(), v1)
	local v4 = v1 > 100
	local t = {
		IsMaxLabel = false,
		Amount = v3,
		GoalAmount = v1,
		Remaining = v1 - v3,
		IsOverThreshold = v4
	}
	if v4 then
		return p1.Mission:FormatValue(v1 - v3, t)
	end
	if next(p1.MaxProgressLabels) then
		return p1.Mission:FormatValue(v3, t)
	end
	if p1.Mission.TaskData.FormatValue then
		return p1.Mission:FormatValue(v3, t)
	else
		return v3 .. "/" .. v1
	end
end
function t._getMaxLabelText(p1) --[[ _getMaxLabelText | Line: 404 ]]
	if not next(p1.MaxProgressLabels) then
		return nil
	end
	local v1 = p1.Mission:GetAmount()
	local v2 = p1.Mission:GetGoalAmount()
	local t = {
		IsMaxLabel = true,
		Amount = v1,
		GoalAmount = v2,
		Remaining = v2 - v1
	}
	t.IsOverThreshold = v2 > 100
	local v4 = p1.Mission:FormatValue(v2, t)
	if v4 == nil or v4 == "" then
		return nil
	else
		return "/" .. v4
	end
end
function t._shouldHideProgress(p1) --[[ _shouldHideProgress | Line: 427 ]]
	local v1 = p1.Mission:GetState()
	return if p1.Config.HideProgressOnClaimable and v1 == "Complete" then true else p1.Config.HideProgressOnCompleted and (if v1 == "Claimed" then true else v1 == "Complete")
end
function t._setProgress(p1) --[[ _setProgress | Line: 433 ]]
	local v1 = p1.Mission:GetAmount()
	local v2 = p1.Mission:GetGoalAmount()
	if p1.LastProgressAmount and (p1.LastProgressAmount < v1 and p1.Config.OnProgressIncremented) then
		p1.Config.OnProgressIncremented(p1, {
			Amount = v1,
			LastAmount = p1.LastProgressAmount,
			GoalAmount = v2,
			Progress = v1 / v2
		})
	end
	p1.LastProgressAmount = v1
	if not p1.ProgressBar then
		for v3, v4 in p1.ProgressLabels do
			v4.Text = p1:_getDisplayProgress()
		end
	end
	if not next(p1.MaxProgressLabels) then
		return
	end
	local v5 = p1:_getMaxLabelText()
	local v6 = p1:_shouldHideProgress()
	for v7, v8 in p1.MaxProgressLabels do
		if v5 then
			v8.Text = v5
			v8.Visible = not v6
			continue
		end
		v8.Visible = false
	end
end
function t._getRewards(p1) --[[ _getRewards | Line: 469 ]]
	if type(p1.Config.Rewards) == "function" then
		return p1.Config.Rewards(p1)
	end
	if type(p1.Config.Rewards) == "table" then
		return p1.Config.Rewards
	end
	local v1 = p1.Mission:GetReward()
	if v1 then
		return v1
	end
	if p1.ParentMission:GetTotalTasks() <= 1 then
		return p1.ParentMission:GetReward()
	else
		return nil
	end
end
function t._setRewards(p1) --[[ _setRewards | Line: 491 | Upvalues: v2 (copy), v1 (copy) ]]
	if p1.RewardsMaid then
		p1.RewardsMaid:DoCleaning()
	end
	if not p1.RewardsLabel then
		return
	end
	local v12 = p1:_getRewards()
	if not v12 then
		p1.RewardsLabel.Visible = false
		return
	end
	if type(v12) ~= "table" then
		warn("\226\154\160\239\184\143 ShopItemDisplay, Rewards must be a table", v12, p1.Instance, p1.Config)
		return
	end
	if not p1.RewardsMaid then
		p1.RewardsMaid = v2.new()
		p1.Maid:GiveTask(p1.RewardsMaid)
	end
	p1.RewardsMaid:GiveTask(v1.AddComponent("MultiItemDisplay", {
		Instance = p1.RewardsLabel,
		Items = v12,
		Amount = {
			AlwaysVisible = true
		},
		MaxItems = p1.Config.MaxRewardsToDisplay or 1
	}))
	p1.RewardsLabel.Visible = true
end
function t.Reset(p1) --[[ Reset | Line: 527 ]]
	if not p1.ItemDisplay then
		return
	end
	p1.ItemDisplay:Reset()
end
return t