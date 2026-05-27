-- https://lua.expert/
local EventCurrencyName = require(game.ReplicatedStorage.Sonar)("Constants").EventCurrencyName
local t = {
	Boosts = {
		BoostShort = {
			ProductId = 1940807137
		},
		BoostLong = {
			ProductId = 1940807079
		}
	},
	[EventCurrencyName] = {
		{
			ProductId = 1940799862,
			Amount = 500
		},
		{
			ProductId = 1940800010,
			Amount = 1200
		},
		{
			ProductId = 1940800732,
			Amount = 3500
		},
		{
			ProductId = 1940800882,
			Amount = 7800
		},
		{
			ProductId = 1940801351,
			Amount = 16500
		},
		{
			ProductId = 1940801639,
			Amount = 56000
		}
	}
}
for k, v in pairs(t[EventCurrencyName]) do
	v.Currency = EventCurrencyName
	v.ProductType = "Currency"
end
for k, v in pairs(t.Boosts) do
	v.Name = k
	v.ProductType = "EventBoost"
end
return t