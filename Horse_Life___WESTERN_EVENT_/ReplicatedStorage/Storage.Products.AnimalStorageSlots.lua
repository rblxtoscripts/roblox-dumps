-- https://lua.expert/
local tbl = {
	Free = {
		{
			Price = 5000,
			Amount = 5,
			Stats = {
				ReplayQuestsCompleted = 12
			}
		},
		{
			Price = 10000,
			Amount = 5,
			Stats = {
				ReplayQuestsCompleted = 24
			}
		},
		{
			Price = 20000,
			Amount = 5,
			Stats = {
				ReplayQuestsCompleted = 36
			}
		},
		{
			Price = 30000,
			Amount = 5,
			Stats = {
				ReplayQuestsCompleted = 60
			}
		},
		{
			Price = 40000,
			Amount = 5,
			Stats = {
				ReplayQuestsCompleted = 84
			}
		},
		{
			Price = 50000,
			Amount = 5,
			Stats = {
				ReplayQuestsCompleted = 108
			}
		}
	},
	Robux = {
		{
			ProductId = 2682641084,
			Amount = 10
		}
	}
}
for k, v in pairs(tbl) do
	for k2, v2 in pairs(v) do
		if v2.ProductId then
			v2.ProductType = "AnimalStorageSlots"
		end
		if v2.Price then
			v2.Currency = "Coins"
		end
	end
end
return tbl