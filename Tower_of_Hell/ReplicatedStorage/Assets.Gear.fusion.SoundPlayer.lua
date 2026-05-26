-- https://lua.expert/
function Equipped() --[[ Equipped | Line: 1 ]]
	local CoilSound = script.Parent.Handle:FindFirstChild("CoilSound")
	if CoilSound == nil then
		return
	end
	CoilSound:Play()
end
script.Parent.Equipped:connect(Equipped)