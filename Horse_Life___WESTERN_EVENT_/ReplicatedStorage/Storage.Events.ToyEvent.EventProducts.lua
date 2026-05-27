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
			Amount = 750
		},
		{
			ProductId = 1940800010,
			Amount = 1800
		},
		{
			ProductId = 1940800732,
			Amount = 5250
		},
		{
			ProductId = 1940800882,
			Amount = 11500
		},
		{
			ProductId = 1940801351,
			Amount = 32500
		},
		{
			ProductId = 1940801639,
			Amount = 75500
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