-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("InteractMenu")
local v2 = Sonar("Binder")
local v3 = Sonar("Maid")
local v4 = Sonar("PlushMaterialShopGui")
local v5 = Sonar("PlushMachine")
local v6 = Sonar("PlushMachineMaterialGui")
local t = {
	MaterialShop = "Open Material Shop",
	BuyPlush = "Buy",
	AddMaterials = "Add Materials"
}
local t2 = {}
t2.__index = t2
function t2.Init() --[[ Init | Line: 18 | Upvalues: v2 (copy), t2 (copy) ]]
	v2.new("PlushMachineInteract", t2):Init()
end
function t2.new(p1) --[[ new | Line: 23 | Upvalues: t2 (copy), v3 (copy), v1 (copy), t (copy), Sonar (copy), v4 (copy), v5 (copy), v6 (copy) ]]
	local v2 = setmetatable({}, t2)
	v2.SpawnPad = p1
	v2.Maid = v3.new()
	v2.Maid:GiveTask(v1.new(v2.SpawnPad, {
		GetRange = function() --[[ GetRange | Line: 30 ]]
			return 30
		end,
		Hint = t[v2.SpawnPad:WaitForChild("Type").Value],
		Run = function() --[[ Run | Line: 34 | Upvalues: Sonar (ref), v2 (copy), v4 (ref), v5 (ref), v6 (ref) ]]
			if Sonar("DisplayAnimalClient").GetDisplay() then
				return
			end
			if v2.SpawnPad.Type.Value == "MaterialShop" then
				v4.Open()
				return
			end
			if v2.SpawnPad.Type.Value == "BuyPlush" then
				v5.Buy()
				return
			end
			if v2.SpawnPad.Type.Value ~= "AddMaterials" then
				return
			end
			v6.Open()
		end
	}))
	return v2
end
function t2.Destroy(p1) --[[ Destroy | Line: 50 | Upvalues: t2 (copy) ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, t2)
end
t2.Init()
return t2