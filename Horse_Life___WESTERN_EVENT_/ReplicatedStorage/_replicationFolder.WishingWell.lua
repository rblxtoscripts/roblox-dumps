-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("InteractMenu")
local v2 = Sonar("Binder")
local v3 = Sonar("RemoteUtils")
local v4 = Sonar("Maid")
local v5 = Sonar("NotificationsClient")
local v6 = Sonar("PlayerWrapper")
local v7 = Sonar("TimeUtils")
local v8 = v6.GetClient()
local v9 = Sonar("Constants")
local t = {}
t.__index = t
local v10 = v3.GetRemoteFunction("Wish")
local t2 = {
	"The spirits have blessed you...",
	"Orion was looking the other way...",
	"The wishing fountain has responded well...",
	"Fortune smiles upon you...",
	"The spirits have heard your plea...",
	"Luck is on your side today...",
	"The stars align in your favor...",
	"A ripple in the fountain brings good tidings...",
	"Destiny grants your wish...",
	"Your wish echoes and returns fulfilled...",
	"The waters shimmer as your wish comes true...",
	"An unseen force grants your desire...",
	"Magic fills the air as your wish is granted...",
	"A gentle breeze whispers, \'It is done.\'",
	"The well glows softly as your wish is fulfilled...",
	"From the depths, your wish emerges realized...",
	"A stroke of luck befalls you...",
	"Good fortune finds you at the well...",
	"The ancient spirits nod in approval...",
	"Your wish finds favor in unseen eyes..."
}
function t.Init() --[[ Init | Line: 42 | Upvalues: v2 (copy), t (copy) ]]
	v2.new("WishingWell", t):Init()
end
function t.new(p1) --[[ new | Line: 47 | Upvalues: t (copy), v4 (copy), v1 (copy), v10 (copy), v5 (copy), t2 (copy), v8 (copy), v9 (copy), v7 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.object = p1
	v2.Maid = v4.new()
	v2.Maid:GiveTask(v1.new(v2.object, {
		ShowHintLabel = true,
		Hint = "Wish",
		Run = function() --[[ Run | Line: 55 | Upvalues: v10 (ref), v5 (ref), t2 (ref), v8 (ref), v9 (ref), v7 (ref) ]]
			local v1, v2 = v10:InvokeServer()
			if v1 then
				v5.Notify({
					Preset = "Green",
					ChatMessage = false,
					Message = t2[math.random(1, #t2)]
				})
				return
			end
			if v2 == "DailyMissions" then
				v5.Notify({
					Message = "Complete 2 daily missions in your journal before making a wish.",
					Preset = "Red"
				})
			else
				v5.Notify({
					Preset = "Red",
					Message = v7.FormatString(v8.PlayerData.Events[v9.EventName].LastWish.Value + 86400 - workspace:GetServerTimeNow()) .. " Left to claim."
				})
			end
		end,
		GetRange = function() --[[ GetRange | Line: 80 ]]
			return 40
		end
	}))
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 89 ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
t.Init()
return t