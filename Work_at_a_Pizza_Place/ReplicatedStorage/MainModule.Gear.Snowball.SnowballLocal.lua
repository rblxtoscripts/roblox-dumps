-- https://lua.expert/
local v1 = require(game.ReplicatedStorage:WaitForChild("Enums"))
require(game.ReplicatedStorage:WaitForChild("Debug"))
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v2 = Library:Load("Utility")
Library:Load("WaitEvent")
local v3 = game.Players.LocalPlayer:GetMouse()
local LocalPlayer = game.Players.LocalPlayer
local v4 = nil
local v5 = nil
Tool = script.Parent
function onEquippedLocal() --[[ onEquippedLocal | Line: 14 | Upvalues: v4 (ref), v5 (ref), v3 (copy), v1 (copy), v2 (copy), LocalPlayer (copy) ]]
	if v4 then
		v4:Disconnect()
	end
	if v5 then
		v5:Disconnect()
	end
	if v3 == nil then
		return
	end
	v3.Icon = "rbxasset://textures\\GunCursor.png"
	if v1.IsMobile then
		local v12, v22 = v2:TouchTap2(nil, function(p1, p2) --[[ Line: 24 | Upvalues: LocalPlayer (ref) ]]
			if not p2 then
				local v1 = Vector2.new(p1.Position.X, p1.Position.Y)
				local v2 = workspace.CurrentCamera:ScreenPointToRay(v1.X, v1.Y)
				local _, v4, _2, _3 = workspace:FindPartOnRayWithIgnoreList(Ray.new(v2.Origin, v2.Direction * 80), { LocalPlayer.Character })
				script.Parent.Clicked:FireServer(v4)
			end
		end)
		v4 = v12
		v5 = v22
	else
		v4 = v3.Button1Down:connect(function() --[[ Line: 33 | Upvalues: v3 (ref) ]]
			script.Parent.Clicked:FireServer(v3.Hit.p)
		end)
	end
end
Tool.Equipped:connect(onEquippedLocal)
function onUnEquippedLocal() --[[ onUnEquippedLocal | Line: 45 | Upvalues: v4 (ref), v5 (ref), v3 (copy) ]]
	if v4 then
		v4:Disconnect()
	end
	if not v5 then
		v3.Icon = ""
		return
	end
	v5:Disconnect()
	v3.Icon = ""
end
Tool.Unequipped:connect(onUnEquippedLocal)