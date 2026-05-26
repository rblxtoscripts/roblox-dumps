-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v2 = script:FindFirstChild((Sonar("PlaceTypeService").GetPlaceType()))
local v3 = if v2 then Sonar(v2) else Sonar(script.Default)
for v6, v7 in v3 do
	v7.Index = v6
	if v7.ProductId then
		v7.ProductType = "HorseShopSlot"
	end
end
return v3