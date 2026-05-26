-- https://lua.expert/
return {
	start = function(p1) --[[ start | Line: 13 ]]
		local Blackboard = p1.Blackboard
	end,
	finish = function(p1, p2) --[[ finish | Line: 23 ]]
		local Blackboard = p1.Blackboard
	end,
	run = function(p1) --[[ run | Line: 33 ]]
		local Blackboard = p1.Blackboard
		return 1
	end
}