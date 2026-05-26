-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local SocialService = game:GetService("SocialService")
local ScreenTransitioner = require((game:GetService("ReplicatedFirst"):WaitForChild("LoadScripts"):WaitForChild("ScreenTransitioner")))
local Sonar = require((ReplicatedStorage:WaitForChild("Sonar")))
local v1 = Sonar("GuiManager")
local v2 = Sonar("ButtonTest")
local v3 = Sonar("RemoteUtils")
local v4 = Sonar("PromptClient")
local v5 = Sonar("Maid")
local v6 = Sonar("NotificationsClient")
local v7 = Sonar("FriendsService")
local v8 = Sonar("PlayerUtils")
local v9 = Sonar("TimeUtils")
local v10 = Sonar("TutorialService")
local v11 = Sonar("MarketplaceUtils")
local v12 = Sonar("PlaceTypeService")
Sonar("Constants")
local LocalPlayer = Players.LocalPlayer
local v13 = Sonar("PlayerWrapper").GetClient()
local WorldTeleportGui = LocalPlayer.PlayerGui:WaitForChild("WorldTeleportGui")
local ContainerFrame = WorldTeleportGui.ContainerFrame
local Template = ContainerFrame.ScrollingFrame:FindFirstChild("Template")
local BG = WorldTeleportGui.BG
local t2 = {}
local v14 = 0
local v15 = v3.GetRemoteFunction("TeleportToRealm")
local v16 = v3.GetRemoteEvent("StartWorldMission")
local function setEmptyLabels() --[[ setEmptyLabels | Line: 46 | Upvalues: ContainerFrame (copy), t2 (copy) ]]
	ContainerFrame.SocialMenu.Menu.Content.ListContainer.EmptyLabel.Visible = not next(t2)
end
local function joinFriend(p1) --[[ joinFriend | Line: 50 | Upvalues: TeleportService (copy), LocalPlayer (copy), v6 (copy) ]]
	if pcall(TeleportService.TeleportToPlaceInstance, TeleportService, p1.PlaceId, p1.GameId, LocalPlayer) then
		v6.Notify({
			Message = "Teleporting you to your friend\'s server!",
			Preset = "Green",
			Type = "FollowPlayerTeleport" .. p1.GameId .. p1.PlaceId
		})
	else
		v6.Notify({
			Message = "Error whilst trying to teleport!",
			Preset = "Red",
			Type = "FollowPlayerTeleport" .. p1.GameId .. p1.PlaceId
		})
	end
end
local function createFriendFrame(p1) --[[ createFriendFrame | Line: 68 | Upvalues: v5 (copy), ContainerFrame (copy), v8 (copy), v12 (copy), v2 (copy), joinFriend (copy), t2 (copy) ]]
	local v1 = v5.new()
	local UserId = p1.UserId
	local v22 = ContainerFrame.SocialMenu.Menu.Content.ListContainer.Content.Default:Clone()
	v22.PlayerInfo.UserNameLabel.Text = "@" .. v8.GetUserNameFromUserId(UserId, "UserName")
	v22.PlayerInfo.DisplayNameLabel.Text = v8.GetUserNameFromUserId(UserId, "DisplayName")
	v22.PlayerInfo.ImageLabel.Image = v8.GetUserThumbnail(UserId)
	v22.WorldLabel.Visible = p1.GameId == game.GameId
	if v22.WorldLabel.Visible then
		v22.JoinMainButton.Visible = false
		v22.JoinTradeButton.Visible = false
	else
		v22.JoinMainButton.Visible = p1.PlaceId == v12.GetMainWorldId()
		v22.JoinTradeButton.Visible = if p1.PlaceId == v12.GetMarketWorldId() then true else false
	end
	v22.JoinEventButton.Visible = false
	for k, v in pairs({ v22.JoinMainButton, v22.JoinTradeButton, v22.JoinEventButton }) do
		v1:GiveTask(v2.new(v, {
			Click = function() --[[ Click | Line: 96 | Upvalues: joinFriend (ref), p1 (copy) ]]
				joinFriend(p1)
			end
		}))
	end
	v22.Name = UserId
	v22.Visible = true
	v22.Parent = ContainerFrame.SocialMenu.Menu.Content.ListContainer.Content
	v1:GiveTask(v22)
	t2[UserId] = v1
	ContainerFrame.SocialMenu.Menu.Content.ListContainer.EmptyLabel.Visible = not next(t2)
end
local function isIngame(p1) --[[ isIngame | Line: 111 | Upvalues: v12 (copy) ]]
	local v1 = v12.GetInfo(game.PlaceId)
	if v1 then
		return v1.IncludeInWorldTeleport
	end
end
local function createOnlineFriends(p1) --[[ createOnlineFriends | Line: 120 | Upvalues: v14 (ref), v6 (copy), v9 (copy), t2 (copy), v7 (copy), v12 (copy), createFriendFrame (copy), ContainerFrame (copy) ]]
	if tick() - v14 < 30 then
		if not p1 then
			return
		end
		v6.Notify({
			Type = "RefreshFriends",
			Message = string.format("You can refresh in %s", v9.FormatString(30 - (tick() - v14)))
		})
	else
		v14 = tick()
		for k, v in pairs(t2) do
			v:Destroy()
			t2[k] = nil
		end
		for k, v in pairs(v7.GetOnlineFriends()) do
			local v1 = v12.GetInfo(game.PlaceId)
			if if v1 then v1.IncludeInWorldTeleport else nil then
				task.spawn(createFriendFrame, {
					UserId = v.VisitorId,
					PlaceId = v.PlaceId,
					GameId = v.GameId
				})
			end
		end
		ContainerFrame.SocialMenu.Menu.Content.ListContainer.EmptyLabel.Visible = not next(t2)
	end
end
local function canTeleport(p1, p2) --[[ canTeleport | Line: 151 | Upvalues: v13 (copy), v4 (copy), Sonar (copy), v2 (copy), v3 (copy), v11 (copy), LocalPlayer (copy), v16 (copy) ]]
	local v1 = true
	print(p1)
	if p1.RequiredSpecies then
		for v22, v32 in p1.RequiredSpecies do
			print(v32, v13.PlayerData.Missions.SpeciesUnlocks[v32].Completed.Value)
			if not v13.PlayerData.Missions.SpeciesUnlocks[v32].Completed.Value then
				v4.Prompt({
					Type = "LockedJournal",
					Setup = function(p12) --[[ Setup | Line: 165 | Upvalues: p1 (copy), v32 (copy) ]]
						p12.Content.Description.Text = ("To unlock the %* you must complete the %* Quests!"):format(p1.DisplayName, v32)
					end,
					Run = function() --[[ Run | Line: 168 | Upvalues: Sonar (ref) ]]
						Sonar("JournalGui").Open("Horses")
						return true
					end,
					Cancel = function() --[[ Cancel | Line: 172 ]]
						return true
					end
				})
				v1 = false
				break
			end
		end
	end
	if p1.RequiredMission then
		local v42 = v13.PlayerData.Missions.WorldMissions:FindFirstChild(p2)
		print(v42)
		if not v42 then
			warn((("World Mission: %* was not found! Please check spelling."):format(p2)))
		end
		if not v42.Completed.Value then
			v4.Prompt({
				Type = "LockedWorld",
				Setup = function(p12, p22) --[[ Setup | Line: 194 | Upvalues: p1 (copy), v2 (ref), v3 (ref), p2 (copy), v11 (ref), LocalPlayer (ref), v4 (ref) ]]
					p12.Content.Description.Text = ("To unlock the %* you must complete the %* Mission!"):format(p1.DisplayName, p1.DisplayName)
					p12.RobuxPurchase.Content.Label.Text = ("Skip the %* Mission and instantly unlock the %*!"):format(p1.DisplayName, p1.DisplayName)
					p22.Maid:GiveTask(v2.new(p12.RobuxPurchase.Content.BuyButton, {
						Click = function() --[[ Click | Line: 198 | Upvalues: v3 (ref), p2 (ref), v11 (ref), LocalPlayer (ref), v4 (ref) ]]
							if not v3.GetRemoteFunction("SkipWorldMission"):InvokeServer(p2, "Robux") then
								return
							end
							v11.PromptPurchase(LocalPlayer, 3587215478)
							v4.Close()
						end
					}))
					p22.Maid:GiveTask(v2.new(p12.CoinPurchase.Content.BuyButton, {
						Click = function() --[[ Click | Line: 210 | Upvalues: v3 (ref), p2 (ref), v4 (ref) ]]
							if not v3.GetRemoteFunction("SkipWorldMission"):InvokeServer(p2, "Coins") then
								return
							end
							v4.Close()
						end
					}))
				end,
				Run = function() --[[ Run | Line: 219 | Upvalues: v16 (ref), p2 (copy) ]]
					v16:FireServer(p2)
					return true
				end,
				Cancel = function() --[[ Cancel | Line: 224 ]]
					return true
				end
			})
			v1 = false
		end
	end
	return v1
end
function t.Open(p1) --[[ Open | Line: 234 | Upvalues: v1 (copy), ContainerFrame (copy), BG (copy) ]]
	if v1.IsFrameOpen(ContainerFrame) then
		return
	end
	v1.OpenFrame(ContainerFrame, {
		CloseAll = "CloseOverlay"
	})
	BG.Visible = true
end
function t.Close() --[[ Close | Line: 245 | Upvalues: v1 (copy), ContainerFrame (copy), BG (copy) ]]
	v1.CloseFrame(ContainerFrame, {})
	BG.Visible = false
end
function t.Init(p1) --[[ Init | Line: 253 | Upvalues: v1 (copy), ContainerFrame (copy), createOnlineFriends (copy), v2 (copy), t (copy), v12 (copy), Template (copy), canTeleport (copy), ScreenTransitioner (copy), v15 (copy), v6 (copy), SocialService (copy), LocalPlayer (copy), Sonar (copy), v10 (copy), v13 (copy) ]]
	v1.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0)
	})
	v1.AddStateCallback(ContainerFrame, "OnOpen", createOnlineFriends)
	v2.new(ContainerFrame.CloseButton, {
		Click = t.Close
	})
	local v14 = v12.GetInfo(game.PlaceId)
	for v22, v3 in v12.GetAllRealms() do
		local v5 = v12.GetInfo((v12.GetRealmPlaceId(v22)))
		if v5 and (if v14 then v14.Type else v14) ~= v5.Type then
			local v7 = Template:Clone()
			v7.Title.Text = v3.DisplayName
			v7.Description.Text = v3.Description
			v7.BG.Image = ("rbxassetid://%*"):format(v3.Image)
			v7.NewLabel.Visible = v3.New
			v7.Visible = true
			v7.Parent = Template.Parent
			v2.new(v7.JoinButton, {
				Click = function() --[[ Click | Line: 290 | Upvalues: canTeleport (ref), v3 (copy), v22 (copy), ScreenTransitioner (ref), v15 (ref), v5 (copy), v6 (ref) ]]
					print((canTeleport(v3, v22)))
					if not canTeleport(v3, v22) then
						return
					end
					local v1 = ScreenTransitioner.new(v3.Type)
					v1:EnterIndefinite("Teleporting to " .. v3.DisplayName .. "...")
					if v15:InvokeServer(v5.Type) then
						v6.Notify({
							Message = "Teleporting...!",
							Type = "Teleporting",
							Preset = "Blue"
						})
					else
						v1:Destroy()
					end
				end
			})
		end
	end
	v2.new(ContainerFrame.SocialMenu.Menu.Content.RefreshButton, {
		Click = function() --[[ Click | Line: 314 | Upvalues: createOnlineFriends (ref) ]]
			createOnlineFriends(true)
		end
	})
	v2.new(ContainerFrame.SocialMenu.Menu.Content.InviteButton, {
		Click = function() --[[ Click | Line: 319 | Upvalues: SocialService (ref), LocalPlayer (ref) ]]
			local ExperienceInviteOptions = Instance.new("ExperienceInviteOptions")
			pcall(function() --[[ Line: 322 | Upvalues: SocialService (ref), LocalPlayer (ref), ExperienceInviteOptions (copy) ]]
				return SocialService:PromptGameInvite(LocalPlayer, ExperienceInviteOptions)
			end)
		end
	})
	Sonar("InteractMenu").new(workspace:WaitForChild("Interactions"):WaitForChild("TradeWorldTeleport"):WaitForChild("InteractPart"), {
		ShowHintLabel = true,
		Hint = "Teleport",
		Run = function() --[[ Run | Line: 330 | Upvalues: v10 (ref), v13 (ref), v6 (ref), t (ref) ]]
			if not v10.CanDoActionInTutorial("InteractZones") then
				return
			end
			local v1 = nil
			if (if v1 then v1 else v10.HasCompletedPrimaryTutorial(v13)) or v13.PlayerData.NewTutorialComplete.Value then
				t.Open()
			else
				v6.Notify({
					Message = "You can\'t use this during the tutorial!",
					Preset = "Red"
				})
			end
		end,
		GetRange = function() --[[ GetRange | Line: 350 ]]
			return 35
		end,
		Visibility = function() --[[ Visibility | Line: 353 | Upvalues: v10 (ref) ]]
			return v10.GetGameState("InteractZones")
		end
	})
end
t:Init()
return t