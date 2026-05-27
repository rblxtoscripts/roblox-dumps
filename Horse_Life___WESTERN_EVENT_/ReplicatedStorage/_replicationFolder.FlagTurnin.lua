-- https://lua.expert/
game:GetService("ReplicatedStorage")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("NotificationsClient")
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("Binder")
local v5 = Sonar("ButtonTest")
local v6 = Sonar("Maid")
local v7 = Sonar("DisplayAnimalClient")
local v8 = Sonar("StatBar")
local v9 = Sonar("InteractMenu")
local v10 = v3.GetClient()
local t = {}
t.__index = t
local v11 = v2.GetRemoteFunction("TurninEventTicket")
local v12 = v2.GetRemoteFunction("CollectEventTicket")
local t2 = {
	NoWrapper = "An error occured when trying to turn in the flags. Try again.",
	NoTicket = "You don\'t have any flags.",
	NotEnoughTickets = "You don\'t have enough flags.",
	NotEnoughTicketsToClaim = "You don\'t have enough flags turned in to claim this."
}
function t.new(p1) --[[ new | Line: 29 | Upvalues: t (copy), v6 (copy), v8 (copy), v10 (copy), v5 (copy), v1 (copy), t2 (copy), v11 (copy), v7 (copy), v12 (copy), v9 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Object = p1
	v2.Maid = v6.new()
	v2.DeliveryFrame = v2.Object:WaitForChild("Display"):WaitForChild("SurfaceGui")
	v2.HorseMaid = v6.new()
	v2.Maid:GiveTask(v2.HorseMaid)
	v2.Maid:GiveTask(v8.new({
		TweenAmount = false,
		Clipped = true,
		Frame = v2.DeliveryFrame.Progress.ProgressMeter.ProgressBar,
		AmountLabel = v2.DeliveryFrame.Progress.ProgressMeter.ProgressBar.Level,
		GetText = function(p1, p2) --[[ GetText | Line: 46 ]]
			return p1 .. "/" .. p2
		end,
		Get = function() --[[ Get | Line: 50 | Upvalues: v10 (ref) ]]
			return v10.PlayerData.Events.Medieval2025.FlagsTurnedIn.Value
		end,
		GetMax = function() --[[ GetMax | Line: 54 ]]
			return 10
		end,
		Changed = { v10.PlayerData.Events.Medieval2025.FlagsTurnedIn:GetPropertyChangedSignal("Value") }
	}))
	local function UpdateButton() --[[ UpdateButton | Line: 63 | Upvalues: v10 (ref), v2 (copy) ]]
		if v10.PlayerData.Events.Medieval2025.FlagsTurnedIn.Value >= 10 then
			v2.DeliveryFrame.Progress.ButtonContainer.Button.Claim.Enabled = true
			v2.DeliveryFrame.Progress.ButtonContainer.Button.TurnIn.Enabled = false
			v2.DeliveryFrame.Progress.ButtonContainer.Button.Level.Text = "Claim"
		else
			v2.DeliveryFrame.Progress.ButtonContainer.Button.Claim.Enabled = false
			v2.DeliveryFrame.Progress.ButtonContainer.Button.TurnIn.Enabled = true
			v2.DeliveryFrame.Progress.ButtonContainer.Button.Level.Text = "Turn In"
		end
	end
	v2.Maid:GiveTask(v10.PlayerData.Events.Medieval2025.FlagsTurnedIn:GetPropertyChangedSignal("Value"):Connect(UpdateButton))
	UpdateButton()
	v2.Maid:GiveTask(v5.new(v2.DeliveryFrame.Progress.ButtonContainer.Button, {
		Click = function() --[[ Click | Line: 79 | Upvalues: v10 (ref), v1 (ref), t2 (ref), v11 (ref), v7 (ref), v12 (ref) ]]
			local FlagsTurnedIn = v10.PlayerData.Events.Medieval2025.FlagsTurnedIn.Value
			if FlagsTurnedIn < 10 then
				local v3 = math.min(10 - FlagsTurnedIn, if v10:GetItemValue("JoustFlag") then v10:GetItemValue("JoustFlag").Value or 0 else 0)
				if v3 <= 0 then
					v1.Notify({
						Preset = "Red",
						Message = t2.NoTicket
					})
					return
				end
				local v4, v5 = v11:InvokeServer(v3)
				if v4 ~= true then
					v1.Notify({
						Preset = "Red",
						Message = t2[v4]
					})
					return
				end
				if v5 then
					v7:DisplaySlot({
						Type = "Claimed",
						AllowNaming = true,
						ShowMaxWarning = true,
						MobileClickBackgroundToClose = false,
						Slot = v10:GetItemFolder("Animals"):WaitForChild(v5)
					})
				end
			else
				local v6, v72 = v12:InvokeServer()
				if v6 ~= true then
					v1.Notify({
						Preset = "Red",
						Message = t2[v6]
					})
					return
				end
				if v72 then
					v7:DisplaySlot({
						Type = "Claimed",
						AllowNaming = true,
						ShowMaxWarning = true,
						MobileClickBackgroundToClose = false,
						Slot = v10:GetItemFolder("Animals"):WaitForChild(v72)
					})
					return
				end
				v1.Notify({
					Message = "Successfully claimed rewards!",
					Preset = "Green"
				})
			end
		end
	}))
	v2.Maid:GiveTask(v9.new(v2.Object, {
		ShowHintLabel = true,
		Hint = "Turnin Flags",
		Run = function() --[[ Run | Line: 144 | Upvalues: v10 (ref), v1 (ref), t2 (ref), v11 (ref), v7 (ref), v12 (ref) ]]
			local FlagsTurnedIn = v10.PlayerData.Events.Medieval2025.FlagsTurnedIn.Value
			if FlagsTurnedIn < 10 then
				local v3 = math.min(10 - FlagsTurnedIn, if v10:GetItemValue("JoustFlag") then v10:GetItemValue("JoustFlag").Value or 0 else 0)
				if v3 <= 0 then
					v1.Notify({
						Preset = "Red",
						Message = t2.NoTicket
					})
					return
				end
				local v4, v5 = v11:InvokeServer(v3)
				if v4 ~= true then
					v1.Notify({
						Preset = "Red",
						Message = t2[v4]
					})
					return
				end
				if v5 then
					v7:DisplaySlot({
						Type = "Claimed",
						AllowNaming = true,
						ShowMaxWarning = true,
						MobileClickBackgroundToClose = false,
						Slot = v10:GetItemFolder("Animals"):WaitForChild(v5)
					})
				end
			else
				local v6, v72 = v12:InvokeServer()
				if v6 ~= true then
					v1.Notify({
						Preset = "Red",
						Message = t2[v6]
					})
					return
				end
				if v72 then
					v7:DisplaySlot({
						Type = "Claimed",
						AllowNaming = true,
						ShowMaxWarning = true,
						MobileClickBackgroundToClose = false,
						Slot = v10:GetItemFolder("Animals"):WaitForChild(v72)
					})
					return
				end
				v1.Notify({
					Message = "Successfully claimed rewards!",
					Preset = "Green"
				})
			end
		end,
		GetRange = function() --[[ GetRange | Line: 204 ]]
			return 30
		end
	}))
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 213 ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
function t.Init(p1) --[[ Init | Line: 219 | Upvalues: v4 (copy), t (copy) ]]
	v4.new("FlagTurnin", t):Init()
end
t:Init()
return t