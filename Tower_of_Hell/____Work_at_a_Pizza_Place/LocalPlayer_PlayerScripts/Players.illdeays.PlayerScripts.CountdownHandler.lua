-- https://lua.expert/
local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")
local t = {}
local function padNumber(p1) --[[ padNumber | Line: 18 ]]
	return string.format("%02d", p1)
end
local function formatCountdown(p1) --[[ formatCountdown | Line: 23 ]]
	local v1 = p1 - os.time()
	if v1 <= 0 then
		return "00:00:00:00", true
	else
		local v2 = math.floor(v1 / 86400)
		local v3 = math.floor(v1 % 86400 / 3600)
		local v4 = math.floor(v1 % 3600 / 60)
		local v5 = math.floor(v1 % 60)
		return string.format("%02d", v2) .. ":" .. string.format("%02d", v3) .. ":" .. string.format("%02d", v4) .. ":" .. string.format("%02d", v5), false
	end
end
local function updateCountdown(p1) --[[ updateCountdown | Line: 45 | Upvalues: formatCountdown (copy) ]]
	if not p1:IsA("TextLabel") then
		warn("CountdownText tag applied to non-TextLabel:", p1:GetFullName())
		return
	end
	local v1 = p1:GetAttribute("EndEpoch")
	if v1 and type(v1) == "number" then
		local v2, v3 = formatCountdown(v1)
		p1.Text = v2
		return v3
	else
		p1.Text = "00:00:00:00"
		warn("TextLabel missing valid EndEpoch attribute:", p1:GetFullName())
	end
end
local function setupCountdown(p1) --[[ setupCountdown | Line: 67 | Upvalues: t (copy), updateCountdown (copy) ]]
	if not t[p1] then
		updateCountdown(p1)
		t[p1] = true
		local v1 = p1:GetAttributeChangedSignal("EndEpoch"):Connect(function() --[[ Line: 79 | Upvalues: updateCountdown (ref), p1 (copy) ]]
			updateCountdown(p1)
		end)
		local v2 = nil
		v2 = p1.AncestryChanged:Connect(function(p12, p2) --[[ Line: 85 | Upvalues: v1 (copy), v2 (ref), t (ref), p1 (copy) ]]
			if p2 then
				return
			end
			if v1 then
				v1:Disconnect()
			end
			if v2 then
				v2:Disconnect()
			end
			t[p1] = nil
		end)
	end
end
local function removeCountdown(p1) --[[ removeCountdown | Line: 100 | Upvalues: t (copy) ]]
	t[p1] = nil
end
for i, v in ipairs(CollectionService:GetTagged("CountdownText")) do
	setupCountdown(v)
end
CollectionService:GetInstanceAddedSignal("CountdownText"):Connect(setupCountdown)
CollectionService:GetInstanceRemovedSignal("CountdownText"):Connect(removeCountdown)
local v1 = 0
RunService.Heartbeat:Connect(function(p1) --[[ Line: 117 | Upvalues: v1 (ref), t (copy), updateCountdown (copy) ]]
	v1 = v1 + p1
	if not (v1 >= 0.1) then
		return
	end
	v1 = 0
	for k, v in pairs(t) do
		if k and k.Parent then
			updateCountdown(k)
		end
	end
end)