-- https://lua.expert/
local tbl = {
	AutumnWingPotion = 2000,
	PonyFallBridle = 450,
	PonyFallSaddle = 500,
	PonyFallSocks = 300,
	AkhalTekeSleekSaddle = 500,
	AkhalTekeSleekSocks = 200,
	FloraCozySaddle = 500,
	AnticornFallSaddle = 500,
	AnticornFallSock = 200,
	ClydesdaleFallSaddle = 500,
	ClydesdaleFallSocks = 200,
	CelestialFallSaddle = 500,
	CelestialFallSocks = 200,
	GiantAcorn = 750,
	TurkeyHat = 250,
	AutumnScythe = 500,
	MapleMask = 400,
	MapleBinder = 350,
	MapleEarring = 200,
	FallParasol = 600,
	GreatAcornShield = 400,
	MapleLeafCrown = 600,
	LargeCinnamonRoll = 550,
	CozyEveningStack = 500
}
for k, v in pairs(tbl) do
	if type(v) == "table" then
		v.Name = k
	end
end
return tbl