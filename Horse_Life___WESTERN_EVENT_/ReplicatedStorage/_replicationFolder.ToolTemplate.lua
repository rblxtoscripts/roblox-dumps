-- https://lua.expert/
local RunService = game:GetService("RunService")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("NotificationsClient")
local v2 = game.Players.LocalPlayer and Sonar("PlayerWrapper").GetClient()
local t = {}
t.__index = t
function t.new(p1) --[[ new | Line: 11 | Upvalues: t (copy), RunService (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Object = p1.Object
	v2.ToolData = p1.ToolData
	if RunService:IsServer() then
		v2:_initServer()
	else
		v2:_initClient()
	end
	return v2
end
function t._initServer(p1) --[[ _initServer | Line: 25 ]] end
function t._initClient(p1) --[[ _initClient | Line: 29 ]] end
function t.Equip(p1) --[[ Equip | Line: 33 | Upvalues: v2 (copy), v1 (copy) ]]
	if p1.ToolData.ItemType ~= "Food" or (v2:IsInAction("FeedTaming") or not (v2:GetStatValue("Tames").Value <= 0)) then
		return
	end
	v1.Notify({
		Message = "Use food to tame horses but don\'t startle them!",
		Type = "FoodEquipped"
	})
end
function t.Unequip(p1) --[[ Unequip | Line: 46 ]] end
function t.Destroy(p1) --[[ Destroy | Line: 50 ]]
	setmetatable(p1, nil)
end
return t