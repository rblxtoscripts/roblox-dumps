-- https://lua.expert/
local v1 = Vector2.new
local v2 = next
local v3 = newproxy
local v4 = getmetatable
local t = {}
local t2 = {}
local t3 = {}
game:GetService("RunService").Heartbeat:Connect(function(p1) --[[ Line: 46 | Upvalues: t3 (copy) ]]
	if not t3[1] then
		return
	end
	for i = 1, #t3 do
		local v1 = t3[i]
		if v1.State and 1 / v1.FrameRate < tick() - v1.LastTick then
			t3[i].LastTick = tick()
			v1:Advance(1)
		end
	end
end)
function t2.Play(p1) --[[ Line: 61 ]]
	if p1.State then
		return false
	end
	if p1.Adornee then
		p1.State = true
		return true
	else
		error("SpriteClip: No Instance assigned to this SpriteClip.")
	end
end
function t2.Pause(p1) --[[ Line: 72 ]]
	if not p1.State then
		return false
	end
	p1.State = false
	return false
end
function t2.Stop(p1) --[[ Line: 78 ]]
	p1:Pause()
	p1.CurrentFrame = 0
	return true
end
function t2.Advance(p1, p2) --[[ Line: 83 | Upvalues: v1 (copy) ]]
	local v12 = p1.CurrentFrame + (p2 or 1)
	if p1.SpriteCount - 1 < v12 then
		if not p1.Looped then
			p1:Stop()
			return
		end
		v12 = 0
	end
	p1.CurrentFrame = v12
	local SpriteSizePixel = p1.SpriteSizePixel
	local SpriteOffsetPixel = p1.SpriteOffsetPixel
	local EdgeOffsetPixel = p1.EdgeOffsetPixel
	local SpriteCountX = p1.SpriteCountX
	local SpriteCount = p1.SpriteCount
	local v2 = v12 % SpriteCountX
	p1.Adornee.ImageRectOffset = v1(EdgeOffsetPixel.X + v2 * (SpriteSizePixel.X + SpriteOffsetPixel.X), EdgeOffsetPixel.Y + (v12 - v2) / SpriteCountX * (SpriteSizePixel.Y + SpriteOffsetPixel.Y))
end
function t.new() --[[ Line: 109 | Upvalues: v1 (copy), v2 (copy), t2 (copy), v3 (copy), v4 (copy), t3 (copy), t (copy) ]]
	local t4 = {
		Adornee = nil,
		SpriteSheet = nil,
		InheritSpriteSheet = true,
		CurrentFrame = 0,
		SpriteCount = 25,
		SpriteCountX = 5,
		FrameRate = 15,
		FrameTime = 4,
		Looped = true,
		State = false,
		Sorted = true,
		LastTick = 0,
		SpriteSizePixel = v1(100, 100),
		EdgeOffsetPixel = v1(0, 0),
		SpriteOffsetPixel = v1(0, 0),
		ID = game:GetService("HttpService"):GenerateGUID()
	}
	for v12, v22 in v2, t2 do
		t4[v12] = v22
	end
	local v32 = v3(true)
	local v42 = v4(v32)
	v42.__index = t4
	function v42.__newindex(p1, p2, p3) --[[ Line: 134 | Upvalues: t4 (copy) ]]
		t4[p2] = p3
		if p2 == "Adornee" or p2 == "SpriteSizePixel" then
			local Adornee = t4.Adornee
			local SpriteSizePixel = t4.SpriteSizePixel
			if Adornee then
				Adornee.ImageRectSize = SpriteSizePixel
			end
			if p2 ~= "Adornee" then
				return
			end
			if t4.InheritSpriteSheet then
				t4.SpriteSheet = Adornee.Image
			else
				Adornee.Image = t4.SpriteSheet
			end
		elseif p2 == "SpriteSheet" then
			if t4.Adornee then
				t4.Adornee.Image = p3
			end
		else
			if p2 ~= "FrameRate" then
				return
			end
			t4.FrameTime = 60 / p3
		end
	end
	v42.__metatable = "The metatable is locked"
	function t4.Destroy(p1) --[[ Line: 159 | Upvalues: t3 (ref), t4 (copy), v2 (ref), v42 (copy) ]]
		p1:Pause()
		table.find(t3, t4)
		local v1 = nil
		for k, v in pairs(t3) do
			if v.ID == t4.ID then
				v1 = k
				break
			end
		end
		if v1 then
			table.remove(t3, v1)
		end
		for v22 in v2, v42 do
			v42[v22] = nil
		end
	end
	function t4.Clone(p1) --[[ Line: 176 | Upvalues: t (ref), v2 (ref), t4 (copy) ]]
		local v1 = t.new()
		for v22, v3 in v2, t4 do
			if v3 ~= "Adornee" then
				v1[v22] = v3
			end
		end
		return v1
	end
	local v5 = t3
	table.insert(v5, t4)
	return v32
end
return t