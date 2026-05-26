-- https://lua.expert/
local t = {
	Leader = {
		ForcedDisplayName = "Club Leader",
		CanEditInfo = true,
		CanBuySlots = true,
		CanKick = true,
		CanChangeRole = true,
		CanInvitePlayers = true,
		RoleId = 4,
		BackgroundColor = Color3.new(0.537255, 0.4, 1),
		TextColor = Color3.new(0.152941, 0.101961, 0.498039)
	},
	StableOfficer = {
		CanEditInfo = true,
		CanBuySlots = true,
		CanInvitePlayers = true,
		RoleId = 3,
		BackgroundColor = Color3.new(0.941177, 0.639216, 0.180392),
		TextColor = Color3.new(0.666667, 0.278431, 0.0901961)
	},
	StableHand = {
		RoleId = 2,
		BackgroundColor = Color3.new(0.117647, 0.698039, 0.709804),
		TextColor = Color3.new(0.0313726, 0.290196, 0.403922)
	},
	Member = {
		Default = true,
		RoleId = 1,
		BackgroundColor = Color3.new(0.670588, 0.509804, 0.462745),
		TextColor = Color3.new(0.870588, 0.74902, 0.67451)
	}
}
for v1, v2 in t do
	v2.Name = v1
end
return t