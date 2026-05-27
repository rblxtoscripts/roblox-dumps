-- https://lua.expert/
local EventCurrencyName = require(game.ReplicatedStorage.Sonar)("Constants").EventCurrencyName
local t = {
	Boosts = {
		BoostShort = {
			ProductId = 1940807137,
			DescriptionText = "Earn 25% more on all Heart sources!",
			NameText = "Cupid\'s Love",
			StrokeColor = Color3.fromRGB(118, 59, 75),
			DescriptionTextColor = Color3.fromRGB(127, 40, 86),
			TitleUIGradient = script.BoostShortTitleGradient,
			BackgroundUIGradient = script.BoostShortBackgroundGradient
		},
		BoostLong = {
			ProductId = 1940807079,
			DescriptionText = "Earn 50% more on all Heart sources!",
			NameText = "Hearts-A-Plenty",
			StrokeColor = Color3.fromRGB(139, 31, 13),
			DescriptionTextColor = Color3.fromRGB(139, 31, 13),
			TitleUIGradient = script.BoostLongTitleGradient,
			BackgroundUIGradient = script.BoostLongBackgroundGradient
		}
	}
}
if EventCurrencyName then
	t[EventCurrencyName] = {
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
			Amount = 12500
		},
		{
			ProductId = 1940801351,
			Amount = 37500
		},
		{
			ProductId = 1940801639,
			Amount = 85000
		}
	}
	for k, v in pairs(t[EventCurrencyName]) do
		v.Currency = EventCurrencyName
		v.ProductType = "Currency"
	end
end
for k, v in pairs(t.Boosts) do
	v.Name = k
	v.ProductType = "EventBoost"
end
return t