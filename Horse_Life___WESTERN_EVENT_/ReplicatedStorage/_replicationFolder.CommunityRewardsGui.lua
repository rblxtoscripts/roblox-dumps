-- https://lua.expert/
local AvatarEditorService = game:GetService("AvatarEditorService")
local GroupService = game:GetService("GroupService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ButtonTest")
local v2 = Sonar("DisplayUtils")
local v3 = Sonar("GuiManager")
local v4 = Sonar("ItemDataService")
local v5 = Sonar("NotificationsClient")
local v6 = Sonar("PlayerWrapper")
local v7 = Sonar("RemoteUtils")
local v8 = Sonar("State")
local v9 = Sonar("StateUtils")
local v10 = Sonar("StorageUtils")
local v11 = Sonar("PlaceTypeService")
local v12 = RunService:IsStudio() and true
local v13 = Sonar("Constants")
local v14 = Sonar(v10.Get("CommunityRewards"))
local GroupId = v13.GroupId
local v15 = v11.GetMainWorldId()
local v16 = v6.GetClient()
local LoyaltyHandler = v16.LoyaltyHandler
local PolicyInfo = v16.PolicyInfo
local ClaimedCommunityRewards = v16.PlayerData.Loyalty.ClaimedCommunityRewards
local v17 = v8.fromProperty(ClaimedCommunityRewards.FavoritedGame, "Value")
local v18 = v8.fromProperty(LoyaltyHandler.FavoritedGameValue, "Value")
local v19 = v8.fromProperty(ClaimedCommunityRewards.InCommunity, "Value")
local v20 = v8.fromProperty(LoyaltyHandler.CommunityValue, "Value")
local v21 = v8.fromProperty(ClaimedCommunityRewards.InGroup, "Value")
local v22 = v8.fromProperty(LoyaltyHandler.InGroupValue, "Value")
local PlayerGui = Players.LocalPlayer.PlayerGui
local v23 = setmetatable({}, {
	__index = function(p1, p2) --[[ __index | Line: 52 | Upvalues: PlayerGui (copy) ]]
		local CommunityRewardsGui = PlayerGui:FindFirstChild("CommunityRewardsGui")
		local v1 = nil
		local v2 = if v1 then v1 elseif CommunityRewardsGui then CommunityRewardsGui[p2] else CommunityRewardsGui
		if v2 == nil or not v2 then
			v2 = nil
		end
		return if typeof(v2) == "function" then function(p1, ...) --[[ Line: 60 | Upvalues: CommunityRewardsGui (copy), p2 (copy) ]]
	return CommunityRewardsGui[p2](CommunityRewardsGui, ...)
end else v2
	end
})
local v24 = v7.GetRemoteFunction("CommunityRewardRemote")
local v25 = v7.GetUnreliableRemoteEvent("ReportClientAnalyticsRemote")
local v26 = v8.new(nil)
local t2 = {
	FavoritedGame = function() --[[ FavoritedGame | Line: 78 | Upvalues: v26 (copy), AvatarEditorService (copy), v12 (copy), v24 (copy), v15 (copy) ]]
		v26:set("FavoritedGame")
		local v1 = nil
		v1 = AvatarEditorService.PromptSetFavoriteCompleted:Connect(function(p1) --[[ Line: 84 | Upvalues: v12 (ref), v24 (ref), v26 (ref), v1 (ref) ]]
			if v12 then
				p1 = Enum.AvatarPromptResult.Success
			end
			v24:InvokeServer("FavoritedGame", p1)
			v26:set(nil)
			v1:Disconnect()
		end)
		AvatarEditorService:PromptSetFavorite(v15, Enum.AvatarItemType.Asset, true)
	end,
	JoinCommunity = function() --[[ JoinCommunity | Line: 97 | Upvalues: v26 (copy), v24 (copy) ]]
		v26:set("JoinCommunity")
		v24:InvokeServer("JoinCommunity")
		v26:set(nil)
	end,
	JoinGroup = function() --[[ JoinGroup | Line: 103 | Upvalues: GroupService (copy), GroupId (copy), v26 (copy), v24 (copy) ]]
		local v1, v2 = pcall(GroupService.PromptJoinAsync, GroupService, GroupId)
		if v1 and v2 ~= Enum.GroupMembershipStatus.None then
			v26:set("JoinGroup")
			v24:InvokeServer("JoinGroup", v2)
			v26:set(nil)
		end
	end
}
function v23.Close(p1) --[[ Close | Line: 118 | Upvalues: v3 (copy), v25 (copy) ]]
	if v3.IsFrameOpen(p1.Container) then
		v25:FireServer("ClosedMajorInterface", "Rewards")
		v3.CloseMainFrame(p1.Container)
	end
end
function v23.Open(p1) --[[ Open | Line: 128 | Upvalues: v3 (copy), v25 (copy) ]]
	if not v3.IsFrameOpen(p1.Container) then
		v25:FireServer("AccessedMajorInterface", "Rewards")
		v3.OpenMainFrame(p1.Container)
	end
end
function v23._setupGui(p1) --[[ _setupGui | Line: 140 | Upvalues: v18 (copy), v17 (copy), v20 (copy), v19 (copy), v22 (copy), v21 (copy), v8 (copy), t2 (copy), v1 (copy), v26 (copy), v5 (copy), v24 (copy), v9 (copy), v14 (copy), v4 (copy), v2 (copy), PolicyInfo (copy) ]]
	local ScrollingFrame = p1.Container.ScrollingFrame
	local t = {}
	t[ScrollingFrame.FavoritedGame] = { v18, v17 }
	t[ScrollingFrame.JoinCommunity] = { v20, v19 }
	t[ScrollingFrame.JoinGroup] = { v22, v21 }
	for v12, v23 in t do
		local ActionButton = v12.Menu.RewardFrame.ActionButton
		local ClaimButton = v12.Menu.RewardFrame.ClaimButton
		local v3, v42 = table.unpack(v23)
		local v52 = v8.new(nil)
		if v12 == ScrollingFrame.FavoritedGame then
			v52:set("Favorite Horse Life")
		elseif v12 == ScrollingFrame.JoinCommunity then
			v52:set("Join the community")
		elseif v12 == ScrollingFrame.JoinGroup then
			v52:set("Join our group")
		end
		for v6, v7 in {
			[ActionButton] = v3,
			[ClaimButton] = v42
		} do
			local v10 = (if ActionButton == v6 then true else false) and t2[v12.Name] or nil
			v1.new(v6, {
				Click = function() --[[ Click | Line: 173 | Upvalues: v26 (ref), v5 (ref), v7 (copy), v10 (ref), v24 (ref), v12 (copy) ]]
					if v26:get() then
						v5.Notify({
							Message = "Please wait for your current action to complete!",
							Preset = "Red"
						})
						return
					end
					if v7:get() then
						return
					end
					if v10 then
						v10()
					else
						v24:InvokeServer(v12.Name)
					end
				end
			})
		end
		v9.stateToProperty({
			Property = "Visible",
			Instance = ActionButton,
			State = v8.deriveMulti(v23, function(p1, p2) --[[ Line: 201 ]]
				return if p1 == false then p2 == false else false
			end)
		})
		v9.stateToProperty({
			Property = "Visible",
			Instance = ClaimButton,
			State = v8.deriveMulti(v23, function(p1, p2) --[[ Line: 211 ]]
				return if p1 == true then p2 == false else false
			end)
		})
		v9.stateToProperty({
			Property = "Visible",
			Instance = v12.Menu.RewardFrame.ActiveLabel,
			State = v8.deriveMulti(v23, function(p1, p2) --[[ Line: 221 ]]
				return if p1 == true then p2 == true else false
			end)
		})
		v9.stateToProperty({
			Property = "Text",
			Instance = v12.Menu.Description,
			State = v8.derive(v52, function(p1) --[[ Line: 230 | Upvalues: v14 (ref), v12 (copy), v4 (ref), v2 (ref) ]]
				local v1 = v14[v12.Name]
				local Rewards = v1.Rewards
				local v22 = nil
				local v3 = ""
				for v42, v5 in { v1.Mutations, Rewards } do
					if typeof(v5) == "table" then
						v22 = (v22 or 0) + #v5
					end
				end
				if v22 > 0 then
					v3 = "rewards!"
				end
				if #Rewards >= 1 then
					local v6 = Rewards[1]
					local v7 = v6.Name
					local v9 = ("%* %*"):format(v6.Amount, (v2.GetDisplayName(v7, (v4.GetByName(v7)))))
					v3 = if #Rewards == 1 then ("%*!"):format(v9) else v9
				end
				if v22 > 1 then
					v3 = "and more!"
				end
				return ("%* %*"):format(("%* to receive"):format(p1), v3)
			end)
		})
		local TextLabel = ActionButton.Top.TextLabel
		local Text = TextLabel.Text
		v9.stateToProperty({
			Property = "Text",
			Instance = TextLabel,
			State = v8.derive(v26, function(p1) --[[ Line: 284 | Upvalues: Text (copy), v12 (copy) ]]
				local v1 = Text
				if p1 == v12.Name then
					v1 = "..."
				end
				return v1
			end)
		})
		local Rewards = v14[v12.Name].Rewards
		local v11 = v8.new(nil)
		task.spawn(function() --[[ Line: 298 | Upvalues: Rewards (copy), v11 (copy) ]]
			if #Rewards == 1 then
				v11:set(1)
				return
			end
			if not (#Rewards > 1) then
				return
			end
			while true do
				local v1 = Random.new()
				repeat

				until v1:NextInteger(1, #Rewards) ~= v11:get()
				task.wait(2)
			end
		end)
		v9.stateToProperty({
			Property = "Text",
			Instance = v12.Menu.RewardFrame.RewardLabel,
			State = v8.derive(v11, function(p1) --[[ Line: 318 | Upvalues: Rewards (copy), v4 (ref), v2 (ref) ]]
				local v1 = Rewards[p1].Name
				return v2.GetDisplayName(v1, (v4.GetByName(v1)))
			end)
		})
		v9.stateToProperty({
			Property = "Image",
			Instance = v12.Menu.RewardFrame.RewardImage,
			State = v8.derive(v11, function(p1) --[[ Line: 334 | Upvalues: Rewards (copy), v4 (ref) ]]
				local v2 = v4.GetByName(Rewards[p1].Name)
				return if v2 then v2.Image or "" else ""
			end)
		})
	end
	v1.new(p1.Container.CloseButton, {
		Click = function() --[[ Click | Line: 348 | Upvalues: p1 (copy) ]]
			p1:Close()
		end
	})
	v8.derive(PolicyInfo, function(p1) --[[ Line: 356 ]]
		local v1 = false
		if typeof(p1) == "table" and table.find(p1.AllowedExternalLinkReferences, "Discord") then
			v1 = true
		end
		return v1
	end):subscribe(function(p1) --[[ Line: 371 | Upvalues: ScrollingFrame (copy) ]]
		ScrollingFrame.JoinCommunity.Visible = p1
	end)
end
function v23.Init(p1) --[[ Init | Line: 378 | Upvalues: v3 (copy) ]]
	p1:_setupGui()
	v3.AddFrame(p1.Container, {
		TweenAnimation = "Open",
		Blur = true,
		ClosePosition = UDim2.fromScale(0.5, 1.5),
		OpenPosition = UDim2.fromScale(0.5, 0.5)
	})
end
v23:Init()
return v23