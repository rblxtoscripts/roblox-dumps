-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local v1 = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))("Signal")
local Premium = Enum.MembershipType.Premium
local function playerMembershipChanged(p1) --[[ playerMembershipChanged | Line: 15 | Upvalues: t (copy) ]]
	t.MembershipChanged:Fire(p1, t.HasPlayerGotPremium(p1))
end
function t.HasPlayerGotPremium(p1) --[[ HasPlayerGotPremium | Line: 21 | Upvalues: Premium (copy) ]]
	return p1.MembershipType == Premium
end
t.MembershipChanged = v1.new()
Players.PlayerMembershipChanged:Connect(playerMembershipChanged)
return t