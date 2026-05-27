-- https://lua.expert/
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("qPromise")
return function(p1, p2, p3) --[[ Line: 9 | Upvalues: v1 (copy) ]]
	local v12 = p1:FindFirstChild(p2)
	if v12 then
		return v1.resolved(v12)
	else
		return v1.new(function(p12, p22) --[[ Line: 15 | Upvalues: p1 (copy), p2 (copy), p3 (copy) ]]
			spawn(function() --[[ Line: 18 | Upvalues: p1 (ref), p2 (ref), p3 (ref), p12 (copy), p22 (copy) ]]
				local v1 = p1:WaitForChild(p2, p3)
				if v1 then
					p12(v1)
				else
					p22("Timed out")
				end
			end)
		end)
	end
end