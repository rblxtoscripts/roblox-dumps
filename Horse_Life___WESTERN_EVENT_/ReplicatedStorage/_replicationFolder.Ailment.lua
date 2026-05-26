-- https://lua.expert/
game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = nil
local v3 = Sonar("EventUtils")
local v4 = Sonar(Sonar("StorageUtils").Get("AilmentData"))
local t = {}
t.__index = t
local v5 = RunService:IsServer()
local t2 = {}
local t3 = {}
local function userCanStackAilment(p1) --[[ userCanStackAilment | Line: 19 | Upvalues: v5 (copy), t (copy) ]]
	if not v5 then
		return
	end
	for k, v in pairs((t.GetAilmentsFromPlayer(p1.Target))) do
		if v.Type == p1.Type then
			return v
		end
	end
end
local function canGiveAilment(p1, p2) --[[ canGiveAilment | Line: 31 | Upvalues: v5 (copy) ]]
	if not v5 then
		return true
	end
	local _ = p1.AilmentData.Type == "Buff"
	return true
end
local function earlyDestroy(p1) --[[ earlyDestroy | Line: 43 ]]
	setmetatable(p1, nil)
	return nil
end
function t.new(p1) --[[ new | Line: 48 | Upvalues: v2 (ref), Sonar (copy), v5 (copy), t (copy), v4 (copy), v1 (copy), t2 (copy), t3 (copy) ]]
	if not v2 then
		v2 = Sonar("PlayerWrapper")
	end
	if v5 and (p1.Duration and p1.Duration == 0) then
		return
	end
	local v22 = setmetatable({}, t)
	if p1.Value then
		error("You tried using Value. You\'re used to Sonaria, aren\'t you? Try Duration instead.")
	end
	v22.Type = p1.Type
	v22.Target = p1.Target
	v22.AilmentData = v4[p1.Type]
	v22.MaxStack = v22.AilmentData.MaxStack
	local v3 = p1.Duration or v22.AilmentData.DefaultDuration or 1
	local v42 = v22
	if v5 then
		local isType = v42.AilmentData.Type == "Buff"
	end
	local v6 = nil
	if v6 then
		v3 = v6
	end
	local Stackable = v22.AilmentData.Stackable
	if Stackable == nil then
		Stackable = true
	end
	local v7
	if v5 then
		for k, v in pairs((t.GetAilmentsFromPlayer(p1.Target))) do
			if v.Type == p1.Type then
				v7 = v
				break
			end
		end
	end
	if Stackable then
		if v7 then
			v7:Set(v3)
			setmetatable(v22, nil)
			return v7
		end
	elseif v7 then
		setmetatable(v22, nil)
		return
	end
	v22.Maid = v1.new()
	v22.TargetWrapper = v2.getWrapperFromPlayer(v22.Target.Player)
	if not v22.TargetWrapper then
		error("There was no target playerwrapper for " .. p1.Type)
	end
	v22:Set(v3)
	if p1.RemoveSignal then
		v22.Maid:GiveTask(p1.RemoveSignal:Connect(function() --[[ Line: 108 | Upvalues: v22 (ref) ]]
			v22:Remove()
		end))
	end
	if v22.Target and (v22.Target.AilmentFolder and not v5) then
		v22.Maid:GiveTask(v22.Target.AilmentFolder:GetAttributeChangedSignal(v22.Type):Connect(function() --[[ Line: 114 | Upvalues: v22 (ref) ]]
			if v22._destroyed then
				return
			end
			local v1 = v22.Target.AilmentFolder:GetAttribute(v22.Type)
			if v1 then
				v22:Set(v1)
			else
				v22:Destroy()
			end
		end))
	end
	local AilmentData = v22.AilmentData
	v22.OnClientTick = AilmentData.OnClientTick
	v22.OnServerTick = AilmentData.OnServerTick
	if AilmentData.OnAdd and not v5 then
		task.spawn(function() --[[ Line: 133 | Upvalues: AilmentData (copy), v22 (ref) ]]
			AilmentData.OnAdd(v22.Target)
		end)
	end
	t2[v22] = v22.Target
	if not t3[v22.Target] then
		t3[v22.Target] = {}
	end
	t3[v22.Target][v22.Type] = v22
	v22.Target.Maid:GiveTask(function() --[[ Line: 146 | Upvalues: v22 (ref) ]]
		if not v22.Remove then
			return
		end
		v22:Remove()
	end)
	return v22
end
function t.Set(p1, p2) --[[ Set | Line: 156 | Upvalues: v5 (copy) ]]
	if p2 then
		workspace:GetServerTimeNow()
		local End = p1.End
		p1.End = math.floor((workspace:GetServerTimeNow())) + p2
		p1.Duration = p1.End
	end
	if v5 then
		if p1.Target and p1.Target.AilmentFolder then
			p1.Target.AilmentFolder:SetAttribute(p1.Type, p1.Duration)
		end
	else
		if not p1.AilmentData.OnChanged then
			return
		end
		p1.AilmentData.OnChanged(p1, p1.Duration)
	end
end
function t.Tick(p1) --[[ Tick | Line: 182 ]]
	if not (workspace:GetServerTimeNow() >= p1.Duration) then
		return
	end
	p1:Remove()
end
function t.Remove(p1) --[[ Remove | Line: 189 | Upvalues: v5 (copy), t3 (copy), t2 (copy) ]]
	p1._destroyed = true
	if p1.Target and (p1.Target.AilmentFolder and (not p1.Target._destroyed and v5)) then
		p1.Target.AilmentFolder:SetAttribute(p1.Type, nil)
	end
	if p1.AilmentData.OnRemove and not v5 then
		task.spawn(function() --[[ Line: 197 | Upvalues: p1 (copy) ]]
			p1.AilmentData.OnRemove(p1.Target)
		end)
	end
	if t3[p1.Target] then
		t3[p1.Target][p1.Type] = nil
		if not next(t3[p1.Target]) then
			t3[p1.Target] = nil
		end
	end
	t2[p1] = nil
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.Destroy(p1) --[[ Destroy | Line: 215 ]]
	p1:Remove()
end
function t.GetAilmentsFromPlayer(p1) --[[ GetAilmentsFromPlayer | Line: 219 | Upvalues: t2 (copy) ]]
	local t = {}
	for k, v in pairs(t2) do
		if v == p1 then
			table.insert(t, k)
		end
	end
	return t
end
function t.GetAilmentFromPlayer(p1, p2) --[[ GetAilmentFromPlayer | Line: 229 | Upvalues: t3 (copy) ]]
	local v1 = t3[p1]
	if v1 then
		return v1[p2]
	end
end
v3.spawnLoopWithoutYielding(function() --[[ Line: 237 | Upvalues: t2 (copy) ]]
	for v1, v2 in t2 do
		v1:Tick()
	end
end, 1)
return t