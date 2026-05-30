-- https://lua.expert/
local t = {}
local t2 = {}
local t3 = {}
local t4 = {}
local function handlePlay(p1, p2, ...) --[[ handlePlay | Line: 18 | Upvalues: t2 (copy), t3 (copy), t4 (copy) ]]
	if not (p1 and t2[p1]) then
		return
	end
	if not t3[p1] then
		t3[p1] = 0
	end
	if not t4[p1] then
		t4[p1] = false
	end
	if t4[p1] then
		return
	end
	if not (t3[p1] >= 256) then
		t4[p1] = true
		local v1 = t3
		v1[p1] = v1[p1] + 1
		t2[p1]:Play(...)
		task.delay(p2 or 0.1, function() --[[ Line: 33 | Upvalues: p1 (copy), t4 (ref) ]]
			if not p1 then
				return
			end
			t4[p1] = false
		end)
		task.delay(0.5, function() --[[ Line: 38 | Upvalues: p1 (copy), t3 (ref) ]]
			if p1 and t3[p1] then
				local v1 = t3
				local v2 = p1
				v1[v2] = v1[v2] - 1
			end
		end)
	end
end
function t.create(p1, p2, p3, p4) --[[ create | Line: 44 | Upvalues: t2 (copy), t3 (copy) ]]
	if not (p1 and p3) then
		return
	end
	if t2[p1] then
		return t2[p1]
	end
	local v2 = (p3:FindFirstChildWhichIsA("Animator") or Instance.new("Animator", p3)):LoadAnimation(p1)
	if p4 then
		v2.Priority = Enum.AnimationPriority[p4]
	end
	if p2 then
		v2.Looped = true
	end
	p3.Destroying:Once(function() --[[ Line: 59 | Upvalues: p1 (copy), t2 (ref), t3 (ref) ]]
		if p1 and t2[p1] then
			t2[p1]:Stop()
			t2[p1]:Destroy()
			t2[p1] = nil
			t3[p1] = nil
		end
	end)
	t2[p1] = v2
	return v2
end
function t.play(p1, ...) --[[ play | Line: 70 | Upvalues: handlePlay (copy) ]]
	if p1 then
		task.spawn(handlePlay, p1, ...)
	end
end
function t.stop(p1, p2) --[[ stop | Line: 75 | Upvalues: t2 (copy) ]]
	if p1 and t2[p1] then
		t2[p1]:Stop(p2)
	end
end
return t