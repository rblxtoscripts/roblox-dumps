-- https://lua.expert/
local tbl = {
	{
		ProductId = 1764575150,
		Amount = 600
	},
	{
		ProductId = 1764575301,
		Amount = 2000
	},
	{
		ProductId = 1764575428,
		Amount = 4500
	},
	{
		ProductId = 1764575621,
		Amount = 10500
	},
	{
		ProductId = 1764575766,
		Amount = 30000
	},
	{
		ProductId = 1764575938,
		Amount = 50000
	},
	{
		ProductId = 1907366581,
		Amount = 175000
	}
}
for k, v in pairs(tbl) do
	v.Currency = "Coins"
	v.ProductType = "Currency"
end
return tbl