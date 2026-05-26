-- https://lua.expert/
local ShopItems = require(script.Parent:WaitForChild("ShopItems"))
local tbl = {
	Wood = "ShopItems",
	Stone = "ShopItems",
	Glass = "ShopItems",
	Fabric = "ShopItems",
	Nails = "ShopItems"
}
for k, v in pairs(tbl) do
	if type(v) == "string" then
		v = ShopItems[k]
	end
	if v then
		tbl[k] = v
		if type(v) == "table" then
			v.Name = k
		end
		continue
	end
	warn("No price set can be found for Building Shop", k, v)
end
return tbl