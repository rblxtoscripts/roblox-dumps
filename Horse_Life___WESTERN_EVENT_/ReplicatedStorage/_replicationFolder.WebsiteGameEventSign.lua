-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Binder")
local v2 = Sonar("EventUtils")
local v3 = Sonar("InstanceUtils")
local v4 = Sonar("Maid")
local v5 = Sonar("WebsiteGameEventsService")
local v6 = Sonar("TimeUtils")
function t.new(p1) --[[ new | Line: 20 | Upvalues: t (ref), v4 (copy), v3 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v4.new()
	v2.Model = p1
	v2.TextLabel = table.unpack(v3.GetAllTagged(v2.Model, "TextLabel"))
	v2:_setup()
	return v2
end
function t._setup(p1) --[[ _setup | Line: 32 | Upvalues: v2 (copy), v5 (copy), v6 (copy) ]]
	p1.Maid:GiveTask(v2.spawnLoop(function() --[[ Line: 33 | Upvalues: p1 (copy), v5 (ref), v6 (ref) ]]
		if not p1.TextLabel then
			return
		end
		local v1 = v5.GetAllEvents()
		local UnixTimestamp = DateTime.now().UnixTimestamp
		local v2 = (1 / 0)
		local v3 = nil
		for v4, v52 in v1 do
			if not (v52.StartTime < UnixTimestamp) then
				local v62 = math.min(v52.StartTime, v2)
				if v62 == v52.StartTime then
					v2 = v62
					v3 = v52
					continue
				end
				v2 = v62
			end
		end
		if v3 then
			p1.TextLabel.Text = ("NEXT EVENT BEGINS IN: %*"):format((v6.FormatTimeWithoutLeadingZeros(v2 - UnixTimestamp):gsub("%d+s", "")))
		else
			p1.TextLabel.Text = "NEW EVENT COMING SOON!"
		end
	end, 1, true))
end
function t.Destroy(p1) --[[ Destroy | Line: 74 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.Init(p1) --[[ Init | Line: 82 | Upvalues: v1 (copy), t (ref) ]]
	v1.new("WebsiteGameEventSign", t):Init()
end
t:Init()
return t