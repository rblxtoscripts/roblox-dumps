-- https://lua.expert/
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("ItemDataService")
local v5 = Sonar("DataUtils")
local v6 = RunService:IsServer()
local t = {}
t.__index = t
function t.new(p1, p2) --[[ new | Line: 16 | Upvalues: t (copy), v2 (copy), v3 (copy), v4 (copy), ReplicatedStorage (copy), Sonar (copy), v6 (copy) ]]
	local v32 = setmetatable(if p2 then p2 else {}, t)
	v32.Model = p1
	v32.PrimaryPart = p1:WaitForChild("Base")
	v32.Maid = v2.new()
	v32.Player = v32.Player or game.Players:FindFirstChild(p1.Parent.Name)
	v32.PlayerWrapper = v3.getWrapperFromPlayer(v32.Player)
	if v32.PlayerWrapper.PlayerData then
		v32.PlotSavesData = v32.PlayerWrapper.PlayerData.PlotSaves
		v32.UtilityData = v32.PlotSavesData.Utility
	end
	v32.Data = v32.Data or v4.GetByName(p1.Name)
	v32.DataValueID = v32.Model:GetAttribute("ID")
	v32.BuildingClass = Sonar(v32.BuildingClass or ReplicatedStorage.Storage.Buildings:FindFirstChild(v32.Data.InteractionType)).new(v32)
	v32.Maid:GiveTask(v32.BuildingClass)
	if v6 then
		p1:AddTag("Building")
		p1:AddTag(v32.Data.InteractionType)
	end
	return v32
end
function t.GetOrCreateInteractionData(p1) --[[ GetOrCreateInteractionData | Line: 50 | Upvalues: v6 (copy), v5 (copy) ]]
	if v6 then
		if not p1.PlayerWrapper.ActiveBuildingInteractions then
			p1.PlayerWrapper.ActiveBuildingInteractions = {}
		end
		local v1 = p1.PlayerWrapper.ActiveBuildingInteractions[p1.Data.Name]
		if not p1.PlayerWrapper.ActiveBuildingInteractions[p1.Data.Name] then
			v1 = {}
			p1.PlayerWrapper.ActiveBuildingInteractions[p1.Data.Name] = v1
		end
		local function createInteraction(p12) --[[ createInteraction | Line: 62 | Upvalues: p1 (copy), v1 (ref) ]]
			p1.Model:SetAttribute("IID", p12.Name)
			v1[p12] = true
			p1.Maid:GiveTask(function() --[[ Line: 66 | Upvalues: v1 (ref), p12 (copy) ]]
				v1[p12] = nil
			end)
			return p12
		end
		for v2, v3 in p1.UtilityData[p1.Data.Name]:GetChildren() do
			if not v1[v3] then
				p1.Model:SetAttribute("IID", v3.Name)
				v1[v3] = true
				p1.Maid:GiveTask(function() --[[ Line: 66 | Upvalues: v1 (ref), v3 (copy) ]]
					v1[v3] = nil
				end)
				return v3
			end
		end
		local v4 = v5.CreateIndexedDataValue(p1.UtilityData[p1.Data.Name], {
			DataValueName = p1.Data.InteractionType
		}, true)
		p1.Model:SetAttribute("IID", v4.Name)
		v1[v4] = true
		p1.Maid:GiveTask(function() --[[ Line: 66 | Upvalues: v1 (ref), v4 (copy) ]]
			v1[v4] = nil
		end)
		return v4
	else
		if not p1.Model:GetAttribute("IID") then
			p1.Model:GetAttributeChangedSignal("IID"):Wait()
		end
		local v52 = p1.UtilityData:WaitForChild(p1.Data.Name):WaitForChild(p1.Model:GetAttribute("IID"))
		task.wait()
		return v52
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 93 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.Init(p1) --[[ Init | Line: 98 | Upvalues: v6 (copy), v1 (copy), t (copy), ReplicatedStorage (copy), Sonar (copy) ]]
	if not v6 then
		v1.new("Building", t):Init()
	end
	for v12, v2 in ReplicatedStorage.Storage.Buildings:GetChildren() do
		Sonar(v2)
	end
end
t:Init()
return t