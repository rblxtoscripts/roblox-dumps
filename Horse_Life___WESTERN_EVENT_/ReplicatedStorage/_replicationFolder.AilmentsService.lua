-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("StorageUtils")
local v2 = Sonar("Ailment")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("GameVersionUtils")
local v5 = Sonar("StatDataService")
local v6 = v1.Get("Ailments")()
local v7 = v1.GetConfig("Ailments")()
local v8 = game:GetService("RunService"):IsServer()
function t.GetAilmentFromName(p1) --[[ GetAilmentFromName | Line: 86 | Upvalues: v6 (copy) ]]
	return v6[p1]
end
function t.GetAll() --[[ GetAll | Line: 93 | Upvalues: v6 (copy) ]]
	return v6
end
function t.GetSourceFromAilment(p1, p2) --[[ GetSourceFromAilment | Line: 97 | Upvalues: v6 (copy) ]]
	local v1 = v6[p1]
	if v1 and v1.Sources then
		return v1.Sources[p2]
	end
end
function t.CanAddAilment(p1) --[[ CanAddAilment | Line: 108 | Upvalues: v6 (copy), v2 (copy), v7 (copy) ]]
	if not p1 then
		warn("\226\154\160\239\184\143 AilmentsService, AddAilment called with no data")
		return
	end
	if not p1.Target then
		warn("\226\154\160\239\184\143 AilmentsService, AddAilment called with no target")
		return
	end
	if not p1.Name then
		warn("\226\154\160\239\184\143 AilmentsService, AddAilment called with no name")
		return
	end
	if not v6[p1.Name] then
		local v1 = warn
		v1("\226\154\160\239\184\143 AilmentsService, AddAilment called with no ailment data for " .. tostring(p1.Name))
		return false
	end
	local v3 = v2.GetCharacterDataFromTarget(p1.Target)
	if not v3 then
		local v4 = warn
		v4("\226\154\160\239\184\143 AilmentsService, AddAilment called with no character data for " .. tostring(p1.Target.Player.Name))
		return false
	end
	if not v3:HasAilmentImmunity(p1.Name) then
		return true
	end
	local v62 = v7.ImmunityCallbacks[p1.Name]
	if not v62 then
		return false
	end
	v62(v3, p1)
	return false
end
function t.AddAilment(p1) --[[ AddAilment | Line: 154 | Upvalues: t (copy), v2 (copy) ]]
	if t.CanAddAilment(p1) then
		return v2.CreateOrStackAilment(p1)
	end
end
function t.RemoveAilment(p1, p2) --[[ RemoveAilment | Line: 166 | Upvalues: v2 (copy) ]]
	local v1 = v2.GetCharacterDataFromTarget(p1)
	if not v1 then
		return
	end
	local v22
	if type(p2) == "table" then
		v22 = p2.Tier
		p2 = p2.Name
	else
		v22 = nil
	end
	local v3 = v1:GetAilment(p2)
	if not v3 then
		return
	end
	if v22 ~= nil and v3:GetTier() ~= v22 then
		return
	end
	v3:Remove()
end
function t.RemoveAilmentType(p1, p2) --[[ RemoveAilmentType | Line: 195 | Upvalues: v2 (copy) ]]
	local v1 = v2.GetCharacterDataFromTarget(p1)
	if not v1 then
		return
	end
	local v22 = false
	for k, v in pairs(v1:GetAilments()) do
		if v:GetData("Type") == p2 and v.Remove then
			v:Remove()
			v22 = true
		end
	end
	return v22
end
function t.HasAilment(p1, p2) --[[ HasAilment | Line: 219 | Upvalues: v2 (copy) ]]
	local v1 = v2.GetCharacterDataFromTarget(p1)
	if v1 then
		return v1:HasAilment(p2)
	end
end
function t.RemoveAllAilments(p1, p2) --[[ RemoveAllAilments | Line: 231 | Upvalues: v2 (copy) ]]
	local v1 = v2.GetCharacterDataFromTarget(p1)
	if v1 then
		v1:RemoveAllAilments(p2)
	end
end
function t.ParseAilmentAttribute(p1) --[[ ParseAilmentAttribute | Line: 244 ]]
	if typeof(p1) == "UDim" then
		return p1.Scale, p1.Offset
	else
		return p1, nil
	end
end
function t.IsAilmentPermanent(p1) --[[ IsAilmentPermanent | Line: 255 ]]
	if type(p1) == "boolean" then
		return true
	end
	return p1 > 900000
end
function t.Init(p1) --[[ Init | Line: 263 | Upvalues: v3 (copy), v4 (copy), v8 (copy), v6 (copy), v5 (copy) ]]
	if v3.IsWrapperInitialising("AilmentsWrapper") then
		v4.OnServerInitialised(function() --[[ Line: 268 | Upvalues: v8 (ref), v6 (ref), v5 (ref) ]]
			if not v8 then
				return
			end
			local t2 = {}
			for v1, v2 in v6 do
				for v4, v52 in v2.Tiers or {} do
					for v62, v7 in v52 do
						if not v5.GetByName(v62) then
							t2[v62] = true
						end
					end
				end
			end
			warn("\226\154\160\239\184\143 AilmentsService, Stats with no format data:", t2)
		end)
		return
	end
	warn("\226\154\160\239\184\143 AilmentsService, AilmentsWrapper not found in PlayerWrapperConfig, try adding it to the PlayerWrapperConfig/Shared")
	v4.OnServerInitialised(function() --[[ Line: 268 | Upvalues: v8 (ref), v6 (ref), v5 (ref) ]]
		if not v8 then
			return
		end
		local t2 = {}
		for v1, v2 in v6 do
			for v4, v52 in v2.Tiers or {} do
				for v62, v7 in v52 do
					if not v5.GetByName(v62) then
						t2[v62] = true
					end
				end
			end
		end
		warn("\226\154\160\239\184\143 AilmentsService, Stats with no format data:", t2)
	end)
end
t:Init()
return t