-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
Sonar("StorageUtils")
local v1 = Sonar("Constants")
Random.new()
local IsServer = v1.IsServer
local t = {}
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("MathUtils")
local v4 = RunService:IsClient() and Sonar("StaminaTracker")
local tbl = {}
v2.GetRemoteEvent("BlindPlayerRemote")
tbl.TestAilment = {
	Type = "Buff",
	StaminaDrain = -3,
	Unblockable = true,
	DefaultDuration = 1,
	AilmentTargets = { "Damage" },
	OnGet = function(p1, p2, p3, p4) --[[ Line: 47 | Upvalues: tbl (copy) ]]
		if p1 == "Damage" then
			return p2 * tbl.TestAilment.DamageMultiplier
		else
			return p2
		end
	end,
	OnServerTick = function(p1, p2) --[[ Line: 56 ]] end,
	OnClientTick = function(p1, p2) --[[ Line: 58 ]] end,
	OnAdd = function(p1, p2) --[[ Line: 63 ]] end,
	OnRemove = function(p1, p2) --[[ Line: 65 ]] end
}
local v5 = 0
tbl.SpeedBoostPad = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 3,
	AilmentTargets = { "Speed" },
	OnAdd = function(p1, p2) --[[ Line: 83 | Upvalues: v5 (ref) ]]
		v5 = workspace:GetServerTimeNow()
	end,
	OnChanged = function(p1, p2) --[[ Line: 87 | Upvalues: v5 (ref) ]]
		v5 = workspace:GetServerTimeNow()
	end,
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 91 | Upvalues: v3 (copy), v5 (ref) ]]
		if p3 then
			return p2 * v3.map(workspace:GetServerTimeNow(), v5, p3, 2.25, 1, true)
		else
			return 1
		end
	end
}
tbl.MiniRaceBoost = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 3,
	AilmentTargets = { "Speed" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 113 ]]
		if p3 then
			return p2 * 1.25
		else
			return 1
		end
	end
}
tbl.RainbowRaceBoost = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 3,
	AilmentTargets = { "Speed" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 135 ]]
		if p3 then
			return p2 * 1.5
		else
			return 1
		end
	end
}
tbl.StaminaRefill = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 3,
	AilmentTargets = {},
	OnAdd = function(p1, p2) --[[ Line: 156 | Upvalues: v4 (copy) ]]
		local v1 = v4:GetTracker()
		v1:Increment(v1:GetMaxStamina())
	end
}
tbl.AgilityBuff = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 3,
	AilmentTargets = { "Speed", "SprintSpeed", "Stamina", "StaminaRegen", "TurnSpeed" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 178 ]]
		return p2 * 1.15
	end
}
tbl.CrateAttached = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 99999,
	AilmentTargets = { "Speed", "SprintSpeed", "Stamina", "StaminaRegen", "TurnSpeed", "FlySpeed" },
	OnGet = function(p1, p2, p3, p4) --[[ OnGet | Line: 200 | Upvalues: v3 (copy) ]]
		if p3 then
			return p2 * v3.map(p4.SlotValue.Upgrades.Strength.Value, 0, 10, 0.8, 1, true)
		else
			return 1
		end
	end
}
tbl.SpeedDebuff = {
	Type = "Buff",
	Unblockable = false,
	Stackable = true,
	DoNotCreateUI = true,
	DefaultDuration = 3,
	AilmentTargets = { "Speed" },
	OnGet = function(p1, p2, p3) --[[ OnGet | Line: 225 ]]
		if p3 then
			return p2 * 0.75
		else
			return 1
		end
	end
}
tbl.Minigame = {
	Description = "",
	DisplayName = "Minigame",
	Type = "Buff",
	Image = "rbxassetid://12859442957",
	AilmentTargets = {}
}
for k, v in pairs(tbl) do
	v.Name = k
	if not v.Image or #v.Image <= 0 then
		v.IsDefaultImage = true
		if v.Type == "Buff" or v.Type then
			v.Image = "rbxassetid://14582849209"
		end
	end
	if v.Image and tonumber(v.Image) then
		v.Image = "rbxassetid://" .. v.Image
		v.ImageSize = v.ImageSize or t[v.Image]
	end
end
return tbl