-- https://lua.expert/
local t = {}
local Chat = game:GetService("Chat")
local Players = game:GetService("Players")
game:GetService("LocalizationService")
local v1 = shared.GBMod("Utilities")
local v2 = shared.GBMod("EngagementMarkers")
local t2 = {}
function t.Init(p1) --[[ Init | Line: 45 | Upvalues: v1 (copy), t2 (copy), Chat (copy), v2 (copy), Players (copy) ]]
	v1:OnPlayerAdded(function(p1) --[[ Line: 46 | Upvalues: t2 (ref), v1 (ref), Chat (ref), v2 (ref) ]]
		t2[p1] = p1.Chatted:Connect(function(p12) --[[ Line: 47 | Upvalues: v1 (ref), Chat (ref), p1 (copy), v2 (ref) ]]
			local v12 = nil
			local v22 = v1.promiseReturn(0, function() --[[ Line: 51 | Upvalues: Chat (ref), p12 (ref), p1 (ref) ]]
				Chat:FilterStringForBroadcast(p12, p1)
			end) or p12
			if p1.Character and p1.Character.PrimaryPart then
				v12 = p1.Character.PrimaryPart.Position
			end
			v2:SDKMarker("Chat", {
				message = v22
			}, {
				player = p1,
				position = v12
			})
		end)
	end)
	Players.PlayerRemoving:Connect(function(p1) --[[ Line: 69 | Upvalues: t2 (ref) ]]
		if not t2[p1] then
			return
		end
		t2[p1]:Disconnect()
		t2[p1] = nil
	end)
end
return t