-- https://lua.expert/
local tbl = {
	Free = {
		{
			Price = 250,
			Amount = 100,
			Stats = {
				NodesHarvested = 10
			}
		},
		{
			Price = 1000,
			Amount = 100,
			Stats = {
				NodesHarvested = 25
			}
		},
		{
			Price = 2000,
			Amount = 100,
			Stats = {
				NodesHarvested = 50
			}
		},
		{
			Price = 4000,
			Amount = 100,
			Stats = {
				NodesHarvested = 75
			}
		},
		{
			Price = 6500,
			Amount = 100,
			Stats = {
				NodesHarvested = 100
			}
		},
		{
			Price = 8000,
			Amount = 100,
			Stats = {
				NodesHarvested = 125
			}
		},
		{
			Price = 10000,
			Amount = 100,
			Stats = {
				NodesHarvested = 150
			}
		},
		{
			Price = 12500,
			Amount = 100,
			Stats = {
				NodesHarvested = 175
			}
		},
		{
			Price = 15000,
			Amount = 100,
			Stats = {
				NodesHarvested = 200
			}
		},
		{
			Price = 17500,
			Amount = 100,
			Stats = {
				NodesHarvested = 225
			}
		},
		{
			Price = 25000,
			Amount = 100,
			Stats = {
				NodesHarvested = 350
			}
		},
		{
			Price = 40000,
			Amount = 100,
			Stats = {
				NodesHarvested = 400
			}
		},
		{
			Price = 50000,
			Amount = 100,
			Stats = {
				NodesHarvested = 500
			}
		},
		{
			Price = 65000,
			Amount = 100,
			Stats = {
				NodesHarvested = 650
			}
		},
		{
			Price = 75000,
			Amount = 100,
			Stats = {
				NodesHarvested = 750
			}
		},
		{
			Price = 100000,
			Amount = 100,
			Stats = {
				NodesHarvested = 1000
			}
		},
		{
			Price = 125000,
			Amount = 100,
			Stats = {
				NodesHarvested = 2000
			}
		},
		{
			Price = 150000,
			Amount = 100,
			Stats = {
				NodesHarvested = 3000
			}
		}
	},
	Robux = {
		{
			ProductId = 1769421419,
			Amount = 300
		},
		{
			ProductId = 1769421569,
			Amount = 300
		}
	}
}
for k, v in pairs(tbl) do
	for k2, v2 in pairs(v) do
		if v2.ProductId then
			v2.ProductType = "InventorySlots"
		end
		if v2.Price then
			v2.Currency = "Coins"
		end
	end
end
return tbl