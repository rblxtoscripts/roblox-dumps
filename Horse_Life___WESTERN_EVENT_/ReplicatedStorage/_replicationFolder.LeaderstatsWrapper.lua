-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("StorageUtils")
local v2 = Sonar("InstanceUtils")
local v3 = Sonar("EventUtils")
local v4 = v1.GetConfig("Leaderstats")()
local v5 = game:GetService("RunService"):IsServer()
function t.new(p1) --[[ new | Line: 20 | Upvalues: t (copy), v5 (copy), v4 (copy), v2 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = p1.Maid
	v22.Player = p1.Player
	v22.PlayerWrapper = p1
	v22.PlayerData = v22.PlayerWrapper.PlayerData
	if v5 then
		v22.Leaderstats = v4.Leaderstats(v22.PlayerWrapper)
		if v22.Leaderstats then
			v22.LeaderstatsFolder = v2.Create("Folder", {
				Name = "leaderstats",
				Parent = p1.Player
			})
			v22:_initLeaderstats()
		end
	end
	return v22
end
function t._initLeaderstats(p1) --[[ _initLeaderstats | Line: 44 | Upvalues: v4 (copy), v2 (copy), v3 (copy) ]]
	for v1, v22 in v4.Leaderstats(p1.PlayerWrapper) do
		v2.Create(v22.ClassName, {
			Name = v22.Name,
			Parent = p1.LeaderstatsFolder
		})
		local function updateLeaderstat() --[[ updateLeaderstat | Line: 51 | Upvalues: v22 (copy), p1 (copy) ]]
			local v1 = if v22.Value then v22.Value.Value else v22.Get(p1.PlayerWrapper)
			if v1 == nil then
				warn("\226\154\160\239\184\143 LeaderstatsWrapper, Leaderstat value is nil", p1.Player.Name, v22.Name)
			else
				p1:SetLeaderstat(v22.Name, v1)
			end
		end
		if v22.Changed then
			for v32, v42 in v3.getConnectionEvents(v22.Changed, p1.PlayerWrapper) do
				p1.Maid:GiveTask(v42:Connect(updateLeaderstat))
			end
		end
		if v22.Value then
			p1.Maid:GiveTask(v22.Value:GetPropertyChangedSignal("Value"):Connect(updateLeaderstat))
		end
		local v5 = if v22.Value then v22.Value.Value else v22.Get(p1.PlayerWrapper)
		if v5 == nil then
			warn("\226\154\160\239\184\143 LeaderstatsWrapper, Leaderstat value is nil", p1.Player.Name, v22.Name)
			continue
		end
		p1:SetLeaderstat(v22.Name, v5)
	end
end
function t.GetLeaderstatValue(p1, p2) --[[ GetLeaderstatValue | Line: 73 ]]
	return p1.LeaderstatsFolder:FindFirstChild(p2)
end
function t.GetLeaderstat(p1, p2) --[[ GetLeaderstat | Line: 77 ]]
	local v1 = p1:GetLeaderstatValue(p2)
	if v1 then
		return v1.Value
	else
		warn("\226\154\160\239\184\143 LeaderstatsWrapper, Leaderstat not found", p1.Player.Name, p2)
		return nil
	end
end
function t.SetLeaderstat(p1, p2, p3) --[[ SetLeaderstat | Line: 86 ]]
	local v1 = p1:GetLeaderstatValue(p2)
	if v1 then
		v1.Value = p3
		return v1.Value
	else
		warn("\226\154\160\239\184\143 LeaderstatsWrapper, Leaderstat not found", p1.Player.Name, p2)
		return nil
	end
end
return t