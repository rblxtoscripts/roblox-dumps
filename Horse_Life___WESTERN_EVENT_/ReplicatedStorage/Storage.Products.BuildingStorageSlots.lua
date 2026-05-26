-- https://lua.expert/
local tbl = {
	{
		Price = 1000,
		Amount = 100
	},
	{
		Price = 2000,
		Amount = 100
	},
	{
		Price = 3000,
		Amount = 100
	},
	{
		Price = 5000,
		Amount = 100
	},
	{
		Price = 7000,
		Amount = 100
	},
	{
		Price = 9000,
		Amount = 100
	}
}
for k, v in pairs(tbl) do
	if v.ProductId then
		v.ProductType = "BuildingStorageSlots"
	end
	if v.Price then
		v.Currency = "Coins"
	end
end
return tbl