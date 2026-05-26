-- https://lua.expert/
local tbl = {
	Free = {
		{
			Price = 500,
			Amount = 1,
			Stats = {
				LassoTames = 25,
				FoodTames = 25
			}
		},
		{
			Price = 5000,
			Amount = 1,
			Stats = {
				LassoTames = 100,
				FoodTames = 100
			}
		},
		{
			Price = 15000,
			Amount = 1,
			Stats = {
				LassoTames = 200,
				FoodTames = 200
			}
		},
		{
			Price = 50000,
			Amount = 1,
			Stats = {
				LassoTames = 400,
				FoodTames = 400
			}
		},
		{
			Price = 100000,
			Amount = 1,
			Stats = {
				LassoTames = 750,
				FoodTames = 750
			}
		}
	},
	Robux = {
		{
			ProductId = 1759203350,
			Amount = 1
		}
	}
}
for k, v in pairs(tbl) do
	for k2, v2 in pairs(v) do
		if v2.ProductId then
			v2.ProductType = "EquipSlots"
		end
		if v2.Price then
			v2.Currency = "Coins"
		end
	end
end
return tbl