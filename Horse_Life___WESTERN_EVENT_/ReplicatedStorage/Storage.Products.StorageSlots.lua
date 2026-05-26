-- https://lua.expert/
local tbl = {
	Free = {
		{
			Price = 1000,
			Amount = 5
		},
		{
			Price = 2000,
			Amount = 5
		},
		{
			Price = 4000,
			Amount = 5
		},
		{
			Price = 6000,
			Amount = 5
		},
		{
			Price = 8000,
			Amount = 5
		},
		{
			Price = 12000,
			Amount = 5
		},
		{
			Price = 18000,
			Amount = 5
		},
		{
			Price = 30000,
			Amount = 5
		},
		{
			Price = 45000,
			Amount = 5
		},
		{
			Price = 70000,
			Amount = 5
		},
		{
			Price = 100000,
			Amount = 5
		},
		{
			Price = 150000,
			Amount = 5
		},
		{
			Price = 200000,
			Amount = 5
		},
		{
			Price = 225000,
			Amount = 5
		},
		{
			Price = 250000,
			Amount = 5
		},
		{
			Price = 300000,
			Amount = 5
		},
		{
			Price = 400000,
			Amount = 5
		},
		{
			Price = 500000,
			Amount = 5
		},
		{
			Price = 600000,
			Amount = 5
		}
	},
	Robux = {
		{
			ProductId = 1759202935,
			Amount = 5
		},
		{
			ProductId = 1759203048,
			Amount = 5
		},
		{
			ProductId = 1863967316,
			Amount = 5
		},
		{
			ProductId = 1759203133,
			Amount = 15
		}
	}
}
for k, v in pairs(tbl) do
	for k2, v2 in pairs(v) do
		if v2.ProductId then
			v2.ProductType = "StorageSlots"
		end
		if v2.Price then
			v2.Currency = "Coins"
		end
	end
end
return tbl