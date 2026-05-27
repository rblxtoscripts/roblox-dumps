-- https://lua.expert/
local t = {
	SunnySteed = {
		Default = true,
		Image = "rbxassetid://110258606317735"
	},
	SunfireHorse = {
		Image = "rbxassetid://81909523381944"
	},
	MoonstoneHorse = {
		Image = "rbxassetid://110604520376137"
	},
	Lyric = {
		Image = "rbxassetid://95648563022276"
	},
	Aurelia = {
		Image = "rbxassetid://85335704959702"
	},
	Alex = {
		Image = "rbxassetid://127449126941533"
	},
	Starlight = {
		Image = "rbxassetid://120449601980520",
		Price = 6500,
		Currency = "ClubTokens"
	},
	Void = {
		Image = "rbxassetid://114549974623302",
		Price = 6500,
		Currency = "ClubTokens"
	},
	SeraphCrest = {
		Image = "rbxassetid://138059677661774",
		Price = 5500,
		Currency = "ClubTokens"
	},
	PlushiePal = {
		Image = "rbxassetid://91421093644913",
		Price = 5500,
		Currency = "ClubTokens"
	}
}
for v1, v2 in t do
	v2.Name = v1
	if v2.Price and not v2.Currency then
		v2.Currency = "Coins"
	end
	if not (v2.ProductId or (v2.Currency or v2.Price)) then
		v2.Free = true
	end
end
return t