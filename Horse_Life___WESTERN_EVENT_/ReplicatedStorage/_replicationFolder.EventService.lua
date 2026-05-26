-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("BadgeService")
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("MarketplaceUtils")
local v5 = Sonar("StorageUtils")
local v6 = RunService:IsServer()
local v7 = RunService:IsStudio() and true
local v8 = not v6 and Sonar("GuiManager")
local v9 = not v6 and Sonar("NotificationsClient")
local v10 = Sonar("NotificationsService")
local v11 = Sonar("Constants")
if v11.EventName then
	local v12 = Sonar(ReplicatedStorage.Storage.Events[v11.EventName].EventProducts)
	local v13 = Sonar(v5.Get("Badges"))
	local v14 = v2.GetRemoteEvent("EventBadgeEarnedRemote")
	function t.GetEventFolder(p1) --[[ GetEventFolder | Line: 40 | Upvalues: ReplicatedStorage (copy), v11 (copy) ]]
		return ReplicatedStorage.Storage.Events[v11.EventName]
	end
	function t.Init(p1) --[[ Init | Line: 44 | Upvalues: v12 (copy), v4 (copy), ReplicatedStorage (copy), v11 (copy), Sonar (copy), v6 (copy), v14 (copy), v3 (copy), v13 (copy), v1 (copy), v7 (copy), v10 (copy), v2 (copy), Players (copy), v8 (copy), v9 (copy) ]]
		for v15, v22 in v12 do
			v4.AddDeveloperProducts(v22)
		end
		local Data = ReplicatedStorage.Storage.Events[v11.EventName].Data
		if not Data then
			return
		end
		local v32 = Sonar(Data)
		v11.CurrentEvent = v32
		v11.CurrentEventUICosmetics = v32.UICosmetics
		if v6 then
			v4.AddProductHandler("EventBoost", function(p1, p2) --[[ Line: 61 ]]
				local v1 = p1.EventData.Boosts[p2.Name]
				v1.Value = v1.Value + 1
				return {
					ItemType = "EventBoost",
					ItemId = p2.Name
				}
			end)
			v14.OnServerEvent:Connect(function(p1) --[[ Line: 66 | Upvalues: v11 (ref), v3 (ref), v13 (ref), v1 (ref), v7 (ref), v10 (ref) ]]
				if not v11.EventName then
					return
				end
				local v12 = v3.getWrapperFromPlayer(p1)
				if not v12 then
					return
				end
				local EventName = v11.EventName
				local v2 = v13[EventName]
				if not v2 then
					return
				end
				local BadgeId = v2.BadgeId
				if not BadgeId then
					return
				end
				local v32 = v1.GetBadgeValueFromName(p1, EventName)
				if if v32 then v32.Value else false then
					return
				end
				local Points = v12.PlayerData.Events[v11.EventName]:FindFirstChild("Points")
				if (if Points then Points.Value else 0) < 1000 then
					return
				end
				if v7 then
					warn((("BadgeService.GiveBadgeToPlayer(%*, %*, ...),"):format(p1.Name, BadgeId)))
				else
					v1.GiveBadgeToPlayer(p1, BadgeId, function() --[[ Line: 108 | Upvalues: v10 (ref), p1 (copy) ]]
						v10.NotifyPlayer(p1, "EventBadgeEarned")
					end)
				end
			end)
			v2.GetRemoteEvent("SnowmanNpcRemote").OnServerEvent:Connect(function(p1) --[[ Line: 114 | Upvalues: v3 (ref), v11 (ref) ]]
				local v1 = v3.getWrapperFromPlayer(p1)
				if v1 then
					v1.PlayerData.Events[v11.EventName].HasTalkedToSnowman.Value = true
				end
			end)
			v2.GetRemoteEvent("EventGuideInteractedRemote").OnServerEvent:Connect(function(p1) --[[ Line: 121 | Upvalues: v3 (ref), v11 (ref) ]]
				local v1 = v3.getWrapperFromPlayer(p1)
				if not v1 then
					return
				end
				local HasInteractedWithGuide = v1.PlayerData.Events[v11.EventName]:FindFirstChild("HasInteractedWithGuide")
				if HasInteractedWithGuide and not HasInteractedWithGuide.Value then
					HasInteractedWithGuide.Value = true
					v1:GiveItem({
						Amount = 100,
						Source = "EventGuideFirstInteraction",
						IgnoreLimit = true,
						Name = v11.EventCurrencyName
					})
				end
			end)
		else
			task.spawn(function() --[[ Line: 139 | Upvalues: v11 (ref), v13 (ref), Players (ref), v3 (ref), v1 (ref), v8 (ref), v14 (ref) ]]
				local EventName = v11.EventName
				local v12 = v13[EventName]
				if not v12 then
					return
				end
				if not v12.BadgeId then
					return
				end
				local LocalPlayer = Players.LocalPlayer
				local Points = v3.GetClient().PlayerData.Events[v11.EventName]:FindFirstChild("Points")
				local v2 = v1.GetBadgeValueFromName(LocalPlayer, EventName)
				local v32 = false
				local count = 0
				while task.wait(1) and not (v32 or v2.Value) do
					if v8.IsHUDOpen() then
						count = count + 1
					end
					if count >= 10 and Points.Value >= 1000 then
						v14:FireServer(LocalPlayer)
						v32 = true
					end
				end
			end)
			v9.AddNotificationCallback("EventBadgeEarned", function() --[[ Line: 184 | Upvalues: v11 (ref) ]]
				return {
					Preset = "Purple",
					Message = ("Congratulations! You\'ve earned the %* badge!"):format((string.gsub(string.gsub(v11.EventName, "(%l)(%u)", "%1 %2"), "(%w)(%d)", "%1 %2")))
				}
			end)
			local v42 = Sonar("PromptClient").GetPromptFrame("MinigameComplete")
			v42.Content.Label.UIGradient.Color = v11.CurrentEventUICosmetics.MainUIGradient.Color
			v42.Content.Label.UIStroke.Color = v11.CurrentEventUICosmetics.MainStrokeColor
			v42.Content.Earned.IconLabel.Image = v11.CurrentEventUICosmetics.CurrencyImage
			v42.Content.CompleteAmount.TextLabel.UIGradient.Color = v11.CurrentEventUICosmetics.MainUIGradient.Color
			v42.Content.CompleteAmount.TextLabel.UIStroke.Color = v11.CurrentEventUICosmetics.MainStrokeColor
			v42.Content.UIGradient.Color = v11.CurrentEventUICosmetics.PromptBackgroundGradient.Color
		end
	end
	t:Init()
	return t
else
	return {}
end