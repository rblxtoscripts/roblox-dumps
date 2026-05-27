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
local v9 = Sonar("ItemDataService")
local v10 = Sonar("AnimalDataService")
local v11 = Sonar("AnimalGridButton")
local EventMilestones = Sonar("Constants").EventMilestones
local v12 = v3.GetClient()
local t = {}
t.__index = t
local v13 = v2.GetRemoteFunction("TurninEventTicket")
local v14 = v2.GetRemoteFunction("CollectEventTicket")
local t2 = {
	NoWrapper = "An error occured when trying to turn in the ticket. Try again.",
	NoTicket = "You don\'t have any tickets.",
	NotEnoughTickets = "You don\'t have enough tickets.",
	NotEnoughTicketsToClaim = "You don\'t have enough tickets turned in to claim this."
}
function t.new(p1) --[[ new | Line: 34 | Upvalues: t (copy), v6 (copy), v8 (copy), v12 (copy), EventMilestones (copy), v10 (copy), v11 (copy), v9 (copy), v1 (copy), t2 (copy), v13 (copy), v7 (copy), v14 (copy), v5 (copy), Sonar (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Object = p1
	v2.Maid = v6.new()
	v2.DeliveryFrame = v2.Object.Display.SurfaceGui
	v2.MilestoneFrame = game.Players.LocalPlayer.PlayerGui.Milestones
	v2.HorseMaid = v6.new()
	v2.Maid:GiveTask(v2.HorseMaid)
	v2.Maid:GiveTask(v8.new({
		TweenAmount = false,
		Clipped = true,
		Frame = v2.DeliveryFrame.Progress.ProgressMeter.ProgressBar,
		AmountLabel = v2.DeliveryFrame.Progress.ProgressMeter.ProgressBar.Level,
		GetText = function(p1, p2) --[[ GetText | Line: 52 ]]
			return p1 .. "/" .. p2
		end,
		Get = function() --[[ Get | Line: 56 | Upvalues: v12 (ref) ]]
			return v12.PlayerData.EventBondRequests.TicketsTurnedIn.Value
		end,
		GetMax = function() --[[ GetMax | Line: 60 ]]
			return 5
		end,
		Changed = { v12.PlayerData.EventBondRequests.TicketsTurnedIn:GetPropertyChangedSignal("Value") }
	}))
	v2.Maid:GiveTask(v8.new({
		Clipped = true,
		Frame = v2.MilestoneFrame.Content.ProgressMeter.ProgressBar,
		Get = function() --[[ Get | Line: 73 | Upvalues: v12 (ref) ]]
			return v12.PlayerData.EventBondRequests.TotalTurnins.Value
		end,
		GetMax = function() --[[ GetMax | Line: 77 ]]
			return 250
		end,
		Changed = { v12.PlayerData.EventBondRequests.TotalTurnins:GetPropertyChangedSignal("Value") }
	}))
	v2.MilestoneFrame.Enabled = true
	v2.MilestoneFrame.Adornee = v2.Object
	for v3, v4 in v2.MilestoneFrame.Content.ProgressMeter.Milestones:GetChildren() do
		if v4:IsA("ImageButton") then
			v4:WaitForChild("MilestoneLabel").Text = v4.Name
			local v72 = EventMilestones[tonumber(v4.Name)]
			if v72 then
				if v72.Species then
					local v82 = nil
					local function DisplayHorse() --[[ DisplayHorse | Line: 100 | Upvalues: v82 (ref), v6 (ref), v72 (copy), v10 (ref), v12 (ref), v11 (ref), v4 (copy), v2 (copy) ]]
						local v1, v22, v3
						if v82 then
							v82:DoCleaning()
						end
						v1 = v6.new()
						v82 = v1
						v22 = v72.Preset[math.random(1, #v72.Preset)]
						v3 = v10.CreateSlot(v12, {
							DoNotParent = true,
							DoNotIncrementCount = true,
							Species = v72.Species,
							Preset = v22 or nil,
							Origin = v72.Origin or "Wild",
							Seed = math.random(1, 1000000),
							MaxCosmetics = v72.MaxCosmetics,
							Infertile = v72.Infertile
						})
						v1:GiveTask((v11.new({
							DoNotClone = true,
							SlotValue = v3,
							Owner = game.Players.LocalPlayer,
							ViewportFrame = v4.Color.Menu.Icon,
							GuiObject = v4.Color.Menu.Icon
						})))
						v1:GiveTask(v3)
						v2.HorseMaid:GiveTask(v1)
					end
					v2.Maid:GiveTask(task.spawn(function() --[[ Line: 139 | Upvalues: DisplayHorse (copy) ]]
						while true do
							task.wait(2)
							DisplayHorse()
						end
					end))
					continue
				end
				local v112 = v9.GetByName(EventMilestones[tonumber(v4.Name)].Name)
				if v112 then
					v4.Color.Menu.Icon.Image = v112.Image
					continue
				end
				warn("No Item Data Found")
				continue
			end
			warn("No Data Found")
		end
	end
	local function UpdateButton() --[[ UpdateButton | Line: 155 | Upvalues: v12 (ref), v2 (copy) ]]
		if v12.PlayerData.EventBondRequests.TicketsTurnedIn.Value >= 5 then
			v2.DeliveryFrame.Progress.ButtonContainer.Button.Claim.Enabled = true
			v2.DeliveryFrame.Progress.ButtonContainer.Button.TurnIn.Enabled = false
			v2.DeliveryFrame.Progress.ButtonContainer.Button.Level.Text = "Claim"
		else
			v2.DeliveryFrame.Progress.ButtonContainer.Button.Claim.Enabled = false
			v2.DeliveryFrame.Progress.ButtonContainer.Button.TurnIn.Enabled = true
			v2.DeliveryFrame.Progress.ButtonContainer.Button.Level.Text = "Turn In"
		end
	end
	local function Turnin() --[[ Turnin | Line: 167 | Upvalues: v12 (ref), v1 (ref), t2 (ref), v13 (ref), v7 (ref), v14 (ref) ]]
		local TicketsTurnedIn = v12.PlayerData.EventBondRequests.TicketsTurnedIn.Value
		if TicketsTurnedIn < 5 then
			local v3 = math.min(5 - TicketsTurnedIn, if v12:GetItemValue("BondTicket") then v12:GetItemValue("BondTicket").Value or 0 else 0)
			if v3 <= 0 then
				v1.Notify({
					Preset = "Red",
					Message = t2.NoTicket
				})
				return
			end
			local v4, v5 = v13:InvokeServer(v3)
			if v4 ~= true then
				v1.Notify({
					Preset = "Red",
					Message = t2[v4]
				})
				return
			end
			if v5 then
				v7:DisplaySlot({
					Type = "BondDelivery",
					AllowNaming = true,
					ShowMaxWarning = true,
					MobileClickBackgroundToClose = false,
					Slot = v12:GetItemFolder("Animals"):WaitForChild(v5)
				})
			end
		else
			local v6, v72 = v14:InvokeServer()
			if v6 ~= true then
				v1.Notify({
					Preset = "Red",
					Message = t2[v6]
				})
				return
			end
			if v72 then
				v7:DisplaySlot({
					Type = "BondDelivery",
					AllowNaming = true,
					ShowMaxWarning = true,
					MobileClickBackgroundToClose = false,
					Slot = v12:GetItemFolder("Animals"):WaitForChild(v72)
				})
				return
			end
			v1.Notify({
				Message = "Successfully claimed rewards!",
				Preset = "Green"
			})
		end
	end
	v12.PlayerData.EventBondRequests.TicketsTurnedIn:GetPropertyChangedSignal("Value"):Connect(UpdateButton)
	UpdateButton()
	v2.Maid:GiveTask(v5.new(v2.DeliveryFrame.Progress.ButtonContainer.Button, {
		Click = function() --[[ Click | Line: 232 | Upvalues: Turnin (copy) ]]
			Turnin()
		end
	}))
	v2.Maid:GiveTask(Sonar("InteractMenu").new(v2.Object.Bottom, {
		Scale = 0.75,
		ShowHintLabel = true,
		Run = function() --[[ Run | Line: 240 | Upvalues: Turnin (copy) ]]
			Turnin()
		end,
		GetRange = function() --[[ GetRange | Line: 243 ]]
			return 20
		end,
		Hint = function() --[[ Hint | Line: 246 | Upvalues: v12 (ref) ]]
			if v12.PlayerData.EventBondRequests.TicketsTurnedIn.Value >= 5 then
				return "Claim"
			else
				return "Deposit tickets"
			end
		end
	}))
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 262 ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
function t.Init(p1) --[[ Init | Line: 268 | Upvalues: v4 (copy), t (copy) ]]
	v4.new("BondDelivery", t):Init()
end
t:Init()
return t