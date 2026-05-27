-- https://lua.expert/
local tbl = {
	{
		Price = 1000,
		Amount = 25
	},
	{
		Price = 2000,
		Amount = 25
	},
	{
		Price = 4000,
		Amount = 25
	},
	{
		Price = 6000,
		Amount = 25
	}
}
for k, v in pairs(tbl) do
	if v.ProductId then
		v.ProductType = "PlotPlacementSlots"
	end
	if v.Price then
		v.Currency = "Coins"
	end
end
return tbl