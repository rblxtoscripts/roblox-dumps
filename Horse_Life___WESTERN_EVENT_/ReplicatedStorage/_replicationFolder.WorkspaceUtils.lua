-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage:WaitForChild("Sonar"))
function t.GetRootAncestor(p1) --[[ GetRootAncestor | Line: 10 ]]
	return p1:FindFirstAncestorWhichIsA("Model")
end
return t