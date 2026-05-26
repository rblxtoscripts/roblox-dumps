-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local v3 = Sonar("InteractMenu")
local v4 = Sonar("NotificationsClient")
local v5 = Sonar("Present")
local t = {}
t.__index = t
local LocalPlayer = game.Players.LocalPlayer
local v6 = Sonar("PlayerWrapper").GetClient()
function t.new(p1) --[[ new | Line: 14 | Upvalues: t (copy), v2 (copy), v3 (copy), v6 (copy), v4 (copy), LocalPlayer (copy), v5 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.SpawnPad = p1
	v22.ParentName = p1.Parent.Name
	v22.Maid = v2.new()
	v22.Presents = {}
	v22.Maid:GiveTask(v3.new(p1, {
		ShowHintLabel = true,
		Hint = "Start Minigame",
		Run = function() --[[ Run | Line: 26 | Upvalues: v6 (ref), v4 (ref), LocalPlayer (ref), v5 (ref) ]]
			local CurrentHorse = v6.CurrentHorse
			if CurrentHorse then
				if CurrentHorse.Model.RiderSeat:FindFirstChild("SeatWeld") then
					v4.Notify({
						Message = "You can\'t start this while co-riding!",
						Preset = "Red"
					})
					return
				end
			elseif LocalPlayer.Character.Humanoid.SeatPart then
				v4.Notify({
					Message = "You can\'t start this while co-riding!",
					Preset = "Red"
				})
				return
			end
			v5.new()
		end,
		GetRange = function() --[[ GetRange | Line: 59 ]]
			return 30
		end,
		Visibility = function() --[[ Visibility | Line: 63 | Upvalues: v5 (ref) ]]
			return not v5.IsRunning()
		end
	}))
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 71 ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
function t.Init() --[[ Init | Line: 77 | Upvalues: v1 (copy), t (copy) ]]
	v1.new("PresentStart", t):Init()
end
t.Init()
return t