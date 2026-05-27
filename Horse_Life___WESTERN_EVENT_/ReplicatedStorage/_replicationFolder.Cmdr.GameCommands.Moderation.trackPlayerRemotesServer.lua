-- https://lua.expert/
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("RemoteWatcherManager")
return function(p1, p2, p3) --[[ Line: 4 | Upvalues: v1 (copy) ]]
	p1:Reply("Attempting to " .. (if p3 then "track" else "untrack") .. " player " .. p2 .. "...")
	if v1.TrackUserId(p2, p3) then
		return "Successfully " .. (if p3 then "tracked" else "untracked") .. " player " .. p2 .. "."
	else
		return "Failed to " .. (if p3 then "track" else "untrack") .. " player " .. p2 .. "."
	end
end