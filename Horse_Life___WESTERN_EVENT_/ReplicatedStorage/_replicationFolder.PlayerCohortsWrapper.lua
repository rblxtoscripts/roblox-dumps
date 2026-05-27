-- https://lua.expert/
local t = {}
t.__index = t
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("State")
local v2 = Sonar("Maid")
local Configs = Sonar("Gamebeast"):GetService("Configs")
local v3 = RunService:IsClient()
local v4 = RunService:IsServer()
local v5 = RunService:IsStudio()
local v6 = v5 and true
local t2 = {
	{
		Name = "TutorialEnabled",
		Attributes = { "TutorialEnabled" },
		Paths = { "TutorialEnabled" },
		GetCohortValue = function(p1) --[[ GetCohortValue | Line: 35 ]]
			return true
		end,
		IsIncluded = function(p1) --[[ IsIncluded | Line: 39 ]]
			return true
		end
	},
	{
		Name = "NewTutorial",
		Attributes = { "NewTutorial" },
		Paths = { "NewTutorial" },
		GetCohortValue = function(p1) --[[ GetCohortValue | Line: 49 ]]
			return true
		end,
		IsIncluded = function(p1) --[[ IsIncluded | Line: 53 ]]
			return true
		end
	},
	{
		Name = "TrimmedTutorial",
		Attributes = { "TrimmedTutorial" },
		Paths = { "TrimmedTutorial" },
		GetCohortValue = function(p1) --[[ GetCohortValue | Line: 63 ]]
			return p1.TrimmedTutorial
		end,
		IsIncluded = function(p1) --[[ IsIncluded | Line: 67 ]]
			return true
		end
	},
	{
		Name = "ButtonSurfacing",
		Attributes = { "ButtonSurfacing" },
		Paths = { "ButtonSurfacing" },
		GetCohortValue = function(p1) --[[ GetCohortValue | Line: 77 ]]
			return {
				HUD = {
					PremiumShop = {
						LayoutOrder = "9e5"
					},
					Quests = {
						LayoutOrder = "9e4"
					}
				},
				Menu = {}
			}
		end,
		IsIncluded = function(p1) --[[ IsIncluded | Line: 100 ]]
			return true
		end
	}
}
local v7 = if v3 then Players.LocalPlayer else nil
function t.new(p1) --[[ new | Line: 110 | Upvalues: t (ref), v2 (copy), v1 (copy), v7 (copy) ]]
	local t2 = {
		__index = function(p1, p2) --[[ __index | Line: 112 | Upvalues: t (ref) ]]
			local v1 = t[p2]
			return if v1 then v1 else p1.PlayerCohortStates[p2]
		end
	}
	local v12 = setmetatable({}, t2)
	v12.Maid = v2.new()
	v12.PlayerGamebeastConfigsState = v12.Maid:GiveTask(v1.new(nil))
	v12.PlayerCohortStates = {}
	v12.Player = p1.Player
	v12.PlayerWrapper = p1
	v12.PlayerWrapper.PlayerCohorts = v12
	v12.IsLocalPlayer = v12.Player == v7
	v12:_setup()
	return v12
end
function t._setupPlayerCohort(p1, p2) --[[ _setupPlayerCohort | Line: 138 | Upvalues: v4 (copy), t2 (copy), v1 (copy), v2 (copy), HttpService (copy) ]]
	if not (v4 or p1.IsLocalPlayer) then
		return
	end
	local v22 = nil
	for v3, v42 in t2 do
		if p2 == v42.Name then
			v22 = v42
			break
		end
	end
	local Attributes = v22.Attributes
	local v5 = typeof(Attributes)
	local t = { p1.PlayerGamebeastConfigsState }
	local Attributes_2 = v22.Attributes
	local v7 = v5 == "table" and Attributes_2 or {}
	v7[#v7 + 1] = v22.Attribute
	for v8, v9 in v7 do
		table.insert(t, (p1.Maid:GiveTask(v1.fromAttribute(p1.Player, v9))))
	end
	local v11 = v2.new()
	local v122 = v11:GiveTask(v1.new(nil))
	v11:GiveTask(v1.subscribeMulti(t, function() --[[ Line: 178 | Upvalues: v11 (copy), v7 (ref), p1 (copy), HttpService (ref), v22 (ref), v122 (copy) ]]
		v11._thread = task.defer(function() --[[ Line: 179 | Upvalues: v7 (ref), p1 (ref), HttpService (ref), v22 (ref), v122 (ref) ]]
			local t = {}
			for v3, v4 in v7 do
				local v1, v2
				local v5 = p1.Player:GetAttribute(v4)
				local v6 = nil
				if typeof(v5) == "string" then
					local v72, v8 = pcall(HttpService.JSONDecode, HttpService, v5)
					v1 = v72
					v2 = v8
				else
					v1 = nil
					v2 = nil
				end
				t[v4] = (if v6 then v6 elseif v1 and v2 then v2 else nil) or v5
			end
			v122:set(if v22.IsIncluded(p1.PlayerWrapper, t) then v22.GetCohortValue(t) else nil)
		end)
	end))
	v11:GiveTask(function() --[[ Line: 203 | Upvalues: p1 (copy), p2 (copy) ]]
		p1.PlayerCohortStates[p2] = nil
	end)
	p1.Maid[p2] = v11
	p1.PlayerCohortStates[p2] = v122
end
function t._setupPlayerGamebeastConfigsState(p1) --[[ _setupPlayerGamebeastConfigsState | Line: 212 | Upvalues: v4 (copy), v5 (copy), HttpService (copy), t2 (copy), Configs (copy), v6 (copy) ]]
	if not v4 then
		return
	end
	if v5 then
		p1.PlayerGamebeastConfigsState:set({
			NewTutorial = true,
			TutorialEnabled = true,
			TrimmedTutorial = true,
			ButtonSurfacing = HttpService:JSONEncode({
				HUD = {
					PremiumShop = {
						LayoutOrder = "9e5"
					},
					Quests = {
						LayoutOrder = "9e4"
					}
				},
				Menu = {}
			})
		})
	else
		for v1, v2 in t2 do
			if v2.Attribute then
				p1.Maid:GiveTask(Configs:ObserveForPlayer(p1.Player, v2.Paths, function() --[[ Line: 252 | Upvalues: v2 (copy), p1 (copy), t2 (ref), Configs (ref), HttpService (ref), v6 (ref) ]]
					p1.Maid["_observer_" .. v2.Attribute] = task.defer(function() --[[ Line: 255 | Upvalues: t2 (ref), Configs (ref), p1 (ref), HttpService (ref), v6 (ref) ]]
						local t = {}
						for v4, v5 in t2 do
							local v1, v2, v3
							local Attributes = v5.Attributes
							v1 = if typeof(v5.Attributes) == "table" and Attributes then Attributes else {}
							v1[#v1 + 1] = v5.Attribute
							local v62 = Configs:GetForPlayer(p1.Player, v5.Paths)
							local v7
							if typeof(v62) == "table" then
								v2 = HttpService:JSONEncode(v62)
								if v2 then
									v3 = v1
								else
									v7 = v62
									v2 = v62
									v3 = v1
								end
							else
								v7 = v62
								v2 = v62
								v3 = v1
							end
							local v8 = v2
							for v9, v10 in v3 do
								t[v10] = v8
							end
						end
						if v6 then
							warn((("[PlayerCohortsWrapper]: Configs observed for Player (%*):"):format(p1.Player.UserId)))
							for v11, v12 in t do
								warn((("\t%*: %*"):format(v11, v12)))
							end
						end
						p1.PlayerGamebeastConfigsState:set(t)
					end)
				end))
			end
		end
	end
	p1.Maid:GiveTask(p1.PlayerGamebeastConfigsState:subscribe(function(p12, p2) --[[ Line: 287 | Upvalues: p1 (copy) ]]
		p2:add(task.defer(function() --[[ Line: 288 | Upvalues: p12 (copy), p1 (ref) ]]
			if not p12 then
				return
			end
			for v1, v2 in p12 do
				p1.Player:SetAttribute(v1, v2)
			end
			p1.Player:SetAttribute("PlayerConfigsLoaded", true)
		end))
	end))
end
function t._setupPlayerCohorts(p1) --[[ _setupPlayerCohorts | Line: 303 | Upvalues: t2 (copy) ]]
	for v1, v2 in t2 do
		p1:_setupPlayerCohort(v2.Name)
	end
end
function t._setup(p1) --[[ _setup | Line: 312 ]]
	p1:_setupPlayerCohorts()
	p1:_setupPlayerGamebeastConfigsState()
end
function t.GetCohort(p1, p2) --[[ GetCohort | Line: 318 ]]
	return p1.PlayerCohortStates[p2]
end
function t.GetCohorts(p1) --[[ GetCohorts | Line: 323 ]]
	return table.clone(p1.PlayerCohortStates)
end
function t.Destroy(p1) --[[ Destroy | Line: 328 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
return t