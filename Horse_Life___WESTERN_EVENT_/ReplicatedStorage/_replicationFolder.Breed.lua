-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("ContextualUtils")
local v3 = Sonar("BreedingGui")
local PlayerGui = game:GetService("Players").LocalPlayer.PlayerGui
function t.new(p1) --[[ new | Line: 17 | Upvalues: t (copy), v1 (copy), PlayerGui (copy), v2 (copy), v3 (copy) ]]
	local v22 = setmetatable(p1, t)
	v22.Maid = v1.new()
	local t2 = {}
	for v32, v4 in PlayerGui.HUDGui.RightFrame:GetChildren() do
		local Stables = v4:FindFirstChild("Stables", true)
		t2[#t2 + 1] = v2.SetGuiPointTo({
			Direction = "Right",
			Offset = -3,
			GuiElement = Stables,
			NextElement = PlayerGui.StablesGui.ContainerFrame
		})
	end
	local Breed = PlayerGui.StablesGui.ContainerFrame:FindFirstChild("Breed", true)
	t2[#t2 + 1] = v2.SetGuiPointTo({
		Direction = "Right",
		Offset = -3,
		GuiElement = Breed,
		NextElement = PlayerGui.BreedingGui.ContainerFrame
	})
	t2[#t2 + 1] = v2.SetGuiPointTo({
		Direction = "Left",
		Offset = -3,
		GuiElement = PlayerGui.BreedingGui.ContainerFrame:FindFirstChild("BreedButton", true),
		NextElement = function() --[[ NextElement | Line: 45 | Upvalues: v3 (ref) ]]
			local v1 = v3.GetSelectedAnimals()
			return v1.Male and v1.Female
		end
	})
	v22.Maid:GiveTask(function() --[[ Line: 51 | Upvalues: t2 (copy) ]]
		for v1, v2 in t2 do
			v2()
		end
	end)
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 60 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
return t