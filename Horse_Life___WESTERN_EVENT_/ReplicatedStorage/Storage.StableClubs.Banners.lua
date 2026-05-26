-- https://lua.expert/
local t = {
	SkyreachValley = {
		Default = true,
		Image = "rbxassetid://80354192596665"
	},
	RoyalLavender = {
		Image = "rbxassetid://106263499136360"
	},
	RoseGallop = {
		Image = "rbxassetid://100769197888085"
	},
	MidnightCrest = {
		Image = "rbxassetid://112863527330689"
	},
	GoldenSpur = {
		Image = "rbxassetid://129983869167596"
	},
	EmeraldStable = {
		Image = "rbxassetid://122867155786657"
	},
	FestivalSkies = {
		Image = "rbxassetid://127170176045939",
		Price = 2500,
		Currency = "ClubTokens"
	},
	SunsetCanyon = {
		Image = "rbxassetid://92643397124936",
		Price = 3500,
		Currency = "ClubTokens"
	},
	CloudlightDay = {
		Image = "rbxassetid://76990633028749",
		Price = 2500,
		Currency = "ClubTokens"
	},
	BloomingFields = {
		Image = "rbxassetid://111584361004537",
		Price = 2500,
		Currency = "ClubTokens"
	},
	WingsEmblem = {
		Image = "rbxassetid://106249513874853",
		Price = 5500,
		Currency = "ClubTokens"
	}
}
for v1, v2 in t do
	v2.Name = v1
	if v2.Price and not v2.Currency then
		v2.Currency = "ClubTokens"
	end
	if not (v2.ProductId or (v2.Currency or v2.Price)) then
		v2.Free = true
	end
end
return t