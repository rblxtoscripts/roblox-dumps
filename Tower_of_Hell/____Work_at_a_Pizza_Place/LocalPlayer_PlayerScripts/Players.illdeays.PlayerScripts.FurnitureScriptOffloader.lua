-- https://lua.expert/
game.ReplicatedStorage:WaitForChild("_v6FiRE_Additions"):WaitForChild("FurnitureRemotes"):WaitForChild("FurnitureOffloadEvent").Event:Connect(function(p1, p2) --[[ Line: 3 ]]
	local v1 = script:FindFirstChild((("%*Controller"):format(p1))) or script:FindFirstChild(p1)
	if not (v1 and v1:IsA("ModuleScript")) then
		warn("No module found for furniture: " .. p1)
	end
	print("Initializing furniture offload module: " .. p1)
	require(v1)(p2)
end)