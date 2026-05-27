-- https://lua.expert/
local tbl = {
	Ghost = {
		P = 0,
		Strength = 5,
		Priority = -1,
		Material = "ForceField",
		Image = "rbxassetid://17569898436",
		Type = "Halloween",
		Description = "Makes the horse\'s base features see-through.",
		Targets = { "CoatTop", "CoatBottom", "Hoof", "Nose", "Sock", "Eye" }
	},
	Ghoul = {
		P = 0,
		Strength = 5,
		Priority = -1,
		Material = "ForceField",
		Image = "rbxassetid://17569898436",
		Type = "Halloween",
		Description = "Makes the horse\'s secondary features see-through",
		Targets = { "Hair", "Pattern", "Paint", "Keratin" }
	}
}
for k, v in pairs(tbl) do
	v.Name = k
end
return tbl