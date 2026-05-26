-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local PlayerDataUtils = require(script.PlayerDataUtils)
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("AnimalDataService")
local v2 = RunService:IsStudio() and true
local function overwriteCheckCallback(p1) --[[ overwriteCheckCallback | Line: 18 | Upvalues: v2 (copy) ]]
	return function(p12_2, p2_2) --[[ Line: 19 | Upvalues: v2 (ref), p1 (copy) ]]
		local v1 = DateTime.now().UnixTimestamp - p2_2.PlayerData.Metadata.LastLogin.Value
		return v2 and (if p12_2.Name == "FoalReadyToBeBorn" then true else false) or p12_2.EligibleAfter and (if p12_2.EligibleAfter <= v1 then p1(p12_2, p2_2) else false) or p1(p12_2, p2_2)
	end
end
local t = {
	{
		MessageId = "e9e98ea3-5d62-4845-846d-2cb102ee38ab",
		Name = "FoalReadyToBeBorn",
		Type = "Deterministic",
		MaxTimeLeft = 2700,
		Priority = 1,
		Check = function(p1, p2) --[[ Check | Line: 47 | Upvalues: PlayerDataUtils (copy) ]]
			local v1 = PlayerDataUtils.GetPlayerFoalsTimeUntilBirth(p2.PlayerData)
			return if #v1 > 0 then v1[1].timeUntilBirth <= p1.MaxTimeLeft else false
		end,
		GetUserNotification = function(p1, p2) --[[ GetUserNotification | Line: 56 | Upvalues: PlayerDataUtils (copy), v1 (copy), v2 (copy) ]]
			local t = {}
			for v12, v22 in PlayerDataUtils.GetPlayerFoalsTimeUntilBirth(p2.PlayerData) do
				local slot = v22.slot
				local v3 = PlayerDataUtils.GetSlotFamily(slot, p2.PlayerData)
				local timeUntilBirth = v22.timeUntilBirth
				if v3.child == slot and (v3.mother and v3.father) then
					local Index = v1.GetByName(slot.Species.Value).Rarity.Index
					local t2 = {
						child = slot,
						father = v3.father
					}
					t2.favorite = v3.father.Favorite.Value or v3.mother.Favorite.Value
					t2.mother = v3.mother
					t2.rarity = Index
					t2.timeUntilBirth = timeUntilBirth
					table.insert(t, t2)
				end
			end
			table.sort(t, function(p1, p2) --[[ Line: 86 ]]
				if p1.favorite and not p2.favorite then
					return true
				end
				if p1.rarity > p2.rarity then
					return true
				end
				return p1.timeUntilBirth < p2.timeUntilBirth
			end)
			local v5 = t[1]
			local v6 = if v5 then v5.father.CustomName.Value else nil
			local v7 = if v5 then v5.mother.CustomName.Value else nil
			local v8 = nil
			local v12 = (if v2 then Random.new():NextInteger(180, p1.MaxTimeLeft / 60 * 60) else math.clamp(v5.timeUntilBirth, 0, p1.MaxTimeLeft)) // 60
			if v12 <= 0 then
				v8 = "is ready! Look!"
			elseif v12 == 1 then
				v8 = ("will be ready in %* minute!"):format(v12)
			elseif v12 > 1 then
				v8 = ("will be ready in %* minutes!"):format(v12)
			end
			return {
				payload = {
					messageId = p1.MessageId,
					type = "MOMENT",
					parameters = {
						action = {
							stringValue = v8
						}
					}
				}
			}
		end
	},
	{
		MessageId = "2e0df058-8ff0-204c-889d-a3e060a64cef",
		Name = "DailyRenewal",
		Type = "Deterministic",
		Priority = 2,
		Check = function(p1, p2) --[[ Check | Line: 157 ]]
			return true
		end,
		GetUserNotification = function(p1, p2) --[[ GetUserNotification | Line: 161 ]]
			local t = { "Chests", "Missions", "Shovels" }
			return {
				payload = {
					messageId = p1.MessageId,
					type = "MOMENT",
					parameters = {
						renewalType = {
							stringValue = string.lower(t[Random.new():NextInteger(1, #t)])
						}
					}
				}
			}
		end
	}
}
for v3, v4 in t do
	local v5 = if v4.Type == "Weighted" then true else false
	if (if v5 then v4.EligibleAfter else v5) and not v4.Check or v4.Check then
		local v7 = v4.Check or (function() --[[ Line: 309 ]]
			return true
		end)
		function v4.Check(p12_2, p2_2) --[[ Line: 19 | Upvalues: v2 (copy), v7 (copy) ]]
			local v1 = DateTime.now().UnixTimestamp - p2_2.PlayerData.Metadata.LastLogin.Value
			return v2 and (if p12_2.Name == "FoalReadyToBeBorn" then true else false) or p12_2.EligibleAfter and (if p12_2.EligibleAfter <= v1 then v7(p12_2, p2_2) else false) or v7(p12_2, p2_2)
		end
	end
end
return t