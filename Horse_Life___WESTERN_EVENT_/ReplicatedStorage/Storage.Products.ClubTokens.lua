-- https://lua.expert/
local tbl = {
	{
		ProductId = 3525876581,
		Amount = 640
	},
	{
		ProductId = 3525877339,
		Amount = 4024
	},
	{
		ProductId = 3525877894,
		Amount = 12500
	}
}
for k, v in pairs(tbl) do
	v.Currency = "ClubTokens"
	v.ProductType = "Currency"
end
return tbl