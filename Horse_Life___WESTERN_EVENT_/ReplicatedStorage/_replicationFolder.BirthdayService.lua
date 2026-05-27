-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("AnalyticsService", "Server")
local v3 = Sonar("RemoteUtils")
local v4 = Sonar("PlayerWrapper")
local v5 = Sonar("ItemSetService")
local v6 = Sonar("TimeFormat")
local v7 = Sonar("Constants")
function t.CanClaimBirthday(p1, p2) --[[ CanClaimBirthday | Line: 19 | Upvalues: v6 (copy) ]]
	local TimeReceived = p2.TimeReceived.Value
	local v2 = math.floor((workspace:GetServerTimeNow()))
	local v3 = v6.GetYear(v2)
	local v4 = v6.GetYear(TimeReceived)
	local v5 = v6.GetDayOfTheMonth(TimeReceived)
	local v62 = v6.GetMonth(TimeReceived)
	if p2.LastClaimedBirthday.Value == v3 then
		return
	end
	if not (v4 < v3) or v6.GetMonth(v2) ~= v62 then
		return false
	end
	local v7 = v6.GetDayOfTheMonth(v2)
	if v5 <= v7 and v7 <= v5 + 2 then
		return true
	else
		return false
	end
end
function t.GetBirthdaysFromJoin(p1) --[[ GetBirthdaysFromJoin | Line: 45 | Upvalues: t (copy) ]]
	local t2 = {}
	if p1.Player:GetAttribute("DEBUG_DATA") then
		return t2
	end
	for v1, v2 in p1.PlayerData.Animals:GetChildren() do
		if t.CanClaimBirthday(p1, v2) == true then
			table.insert(t2, v2.Name)
		end
	end
	return t2
end
function t.Init(p1) --[[ Init | Line: 59 | Upvalues: v1 (copy), v3 (copy), v4 (copy), t (copy), v6 (copy), v7 (copy), v5 (copy), v2 (copy) ]]
	if v1 then
		v3.GetRemoteFunction("ClaimBirthdayRemote").OnServerInvoke = function(p1, p2) --[[ Line: 61 | Upvalues: v4 (ref), t (ref), v6 (ref), v7 (ref), v5 (ref), v2 (ref) ]]
			local v1 = v4.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			warn(p2)
			for v22, v3 in p2 do
				local v42 = v1:GetAnimalSlot(v3)
				if v42 and t.CanClaimBirthday(v1, v42) == true then
					v42.LastClaimedBirthday.Value = v6.GetYear((math.floor((workspace:GetServerTimeNow()))))
					for k, v in pairs(v7.BirthdayRewards) do
						warn(v.Name, v)
						if type(v) == "table" and v.Species then
							local v62 = v5:_giveHorse(v1, v)
							if v62 then
								v2.ReportResourceEvent(v1.Player, "Source", "HorseSlot", v62.Species.Value, "Birthday", 1)
							end
							continue
						end
						local v72 = if typeof(v) == "table" then true else false
						local t2 = {
							Source = "HorseBirthday",
							IgnoreLimit = true,
							Name = v.Name,
							Amount = if v72 then v.Amount or 1 elseif v then v else 1,
							Theme = if v72 then v.Theme else v72,
							ThemeChance = if v72 then v.ThemeChance else v72
						}
						t2.ItemStream = if v.Name == "Coins" then true else false
						v1:GiveItem(t2)
					end
				end
			end
		end
	end
end
t:Init()
return t