-- https://lua.expert/
local EventCurrencyName = require(game.ReplicatedStorage.Sonar)("Constants").EventCurrencyName
local t = {
	Boosts = {
		BoostShort = {
			ProductId = 1940807137,
			Description = "Earn 25% more on all Gem sources!",
			NameText = "Gem Finder",
			StrokeColor = Color3.fromRGB(61, 102, 175),
			DescriptionTextColor = Color3.fromRGB(73, 182, 255),
			TitleUIGradient = script.BoostShortTitleGradient,
			BackgroundUIGradient = script.BoostShortBackgroundGradient
		},
		BoostLong = {
			ProductId = 1940807079,
			Description = "Earn 50% more on all Gem sources!",
			NameText = "Gem Collector",
			StrokeColor = Color3.fromRGB(199, 94, 27),
			DescriptionTextColor = Color3.fromRGB(255, 157, 66),
			TitleUIGradient = script.BoostLongTitleGradient,
			BackgroundUIGradient = script.BoostLongBackgroundGradient
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