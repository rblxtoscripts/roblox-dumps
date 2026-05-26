-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("Signal")
local t = {}
local function SetVisible(p1, p2) --[[ SetVisible | Line: 35 ]]
	for v1, v2 in p1:GetDescendants() do
		if v2:IsA("BasePart") then
			v2.Transparency = if p2 then 0 else 1
			continue
		end
		if v2:IsA("ParticleEmitter") then
			v2.Enabled = p2
			continue
		end
		if v2.Name == "DisplayGui" then
			v2.Enabled = p2
		end
	end
end
local function GetTouchPart(p1) --[[ GetTouchPart | Line: 47 ]]
	local RaceRing = p1:FindFirstChild("RaceRing")
	if RaceRing then
		return RaceRing
	end
	if p1:IsA("BasePart") then
		return p1
	end
	for v1, v2 in p1:GetDescendants() do
		if v2:IsA("BasePart") then
			return v2
		end
	end
	return nil
end
function t.Start(p1, p2) --[[ Start | Line: 63 | Upvalues: v1 (copy), v2 (copy), SetVisible (copy), GetTouchPart (copy) ]]
	local v12 = p1:FindFirstChild("Trail") or p1
	local v22 = p2 or {}
	local OnCheckpoint = v22.OnCheckpoint
	local OnFinish = v22.OnFinish
	local OnCanTouch = v22.OnCanTouch
	local v3 = v1.new()
	local v4 = v2.new()
	local v5 = v2.new()
	v3:GiveTask(v4)
	v3:GiveTask(v5)
	local Finish = v12:FindFirstChild("Finish")
	local t = {}
	for v6, v7 in v12:GetChildren() do
		local v9 = tonumber(v7.Name)
		if v9 then
			t[v9] = v7
		end
	end
	local count = 0
	for v10 in t do
		count = count + 1
	end
	local v11 = 0
	local v122 = nil
	local v13 = false
	for v14, v15 in v12:GetChildren() do
		SetVisible(v15, false)
	end
	if t[1] then
		SetVisible(t[1], true)
	end
	local function EndSession(p1) --[[ EndSession | Line: 106 | Upvalues: v13 (ref), v12 (copy), SetVisible (ref), v4 (copy), v5 (copy), v3 (copy) ]]
		if v13 then
			return
		end
		v13 = true
		for v1, v2 in v12:GetChildren() do
			SetVisible(v2, false)
		end
		if not p1 then
			v5:Fire()
			v3:DoCleaning()
			return
		end
		v4:Fire()
		v5:Fire()
		v3:DoCleaning()
	end
	local function WireCheckpoint(p1, p2, p3) --[[ WireCheckpoint | Line: 122 | Upvalues: GetTouchPart (ref), v1 (ref), v3 (copy), v13 (ref), OnCanTouch (copy), v11 (ref), count (ref), OnFinish (copy), EndSession (copy), SetVisible (ref), v122 (ref), t (copy), Finish (copy), OnCheckpoint (copy) ]]
		local v12 = GetTouchPart(p1)
		if v12 then
			local v2 = v1.new()
			v3:GiveTask(v2)
			local v32 = false
			v2:GiveTask(v12.Touched:Connect(function() --[[ Line: 131 | Upvalues: v32 (ref), v13 (ref), OnCanTouch (ref), p1 (copy), p3 (copy), v11 (ref), count (ref), OnFinish (ref), EndSession (ref), p2 (copy), SetVisible (ref), v122 (ref), t (ref), Finish (ref), OnCheckpoint (ref), v2 (copy) ]]
				if v32 or v13 then
					return
				end
				if OnCanTouch and not OnCanTouch(p1) then
					return
				end
				v32 = true
				if p3 then
					if v11 < count then
						return
					end
					if not OnFinish then
						EndSession(true)
						return
					end
					OnFinish()
					EndSession(true)
				else
					if p2 ~= v11 + 1 then
						return
					end
					SetVisible(p1, false)
					v11 = v11 + 1
					v122 = p1:IsA("BasePart") and p1.Position or p1:GetPivot().Position
					local v22 = t[v11 + 1]
					if v22 then
						SetVisible(v22, true)
					elseif Finish then
						SetVisible(Finish, true)
					end
					if not OnCheckpoint then
						v2:DoCleaning()
						return
					end
					OnCheckpoint(v11, count)
					v2:DoCleaning()
				end
			end))
		end
	end
	for v16, v17 in t do
		WireCheckpoint(v17, v16, false)
	end
	if not Finish then
		return {
			Finished = v4,
			Stopped = v5,
			GetLastPosition = function(p1_2) --[[ GetLastPosition | Line: 179 | Upvalues: v122 (ref) ]]
				return v122
			end,
			Stop = function(p1_2) --[[ Stop | Line: 183 | Upvalues: EndSession (copy) ]]
				EndSession(false)
			end
		}
	end
	WireCheckpoint(Finish, nil, true)
	return {
		Finished = v4,
		Stopped = v5,
		GetLastPosition = function(p1_2) --[[ GetLastPosition | Line: 179 | Upvalues: v122 (ref) ]]
			return v122
		end,
		Stop = function(p1_2) --[[ Stop | Line: 183 | Upvalues: EndSession (copy) ]]
			EndSession(false)
		end
	}
end
return t