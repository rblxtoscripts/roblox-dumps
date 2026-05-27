-- https://lua.expert/
local EventCurrencyName = require(game.ReplicatedStorage.Sonar)("Constants").EventCurrencyName
local t = {
	Boosts = {
		BoostShort = {
			ProductId = 1940807137,
			Description = "Earn 25% more on all Plasma sources!",
			NameText = "Plasma Seeker",
			StrokeColor = Color3.fromRGB(120, 50, 255),
			DescriptionTextColor = Color3.fromRGB(200, 120, 255),
			TitleUIGradient = script.BoostShortTitleGradient,
			BackgroundUIGradient = script.BoostShortBackgroundGradient
		},
		BoostLong = {
			ProductId = 1940807079,
			Description = "Earn 50% more on all Plasma sources!",
			NameText = "Plasma Magnet",
			StrokeColor = Color3.fromRGB(50, 255, 230),
			DescriptionTextColor = Color3.fromRGB(140, 200, 255),
			TitleUIGradient = script.BoostLongTitleGradient,
			BackgroundUIGradient = script.BoostLongBackgroundGradient
		}
	},
	[EventCurrencyName] = {
		{
			ProductId = 1940799862,
			Amount = 625
		},
		{
			ProductId = 1940800010,
			Amount = 1500
		},
		{
			ProductId = 1940800732,
			Amount = 4375
		},
		{
			ProductId = 1940800882,
			Amount = 9750
		},
		{
			ProductId = 1940801351,
			Amount = 20625
		},
		{
			ProductId = 1940801639,
			Amount = 70000
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