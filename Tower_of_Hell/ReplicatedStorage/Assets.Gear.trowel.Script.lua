-- https://lua.expert/
local stringListContains = require(game.ReplicatedStorage.Library.Utility.stringListContains)
local colorFromId = require(game.ReplicatedStorage.Library.Utility.colorFromId)
local v1 = game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId)
for k, v in pairs(script.Parent:GetChildren()) do
	if v:IsA("Part") and v.Name ~= "Handle" then
		v.Color = colorFromId(game.Players.LocalPlayer.UserId)
	end
end
spawn(function() --[[ Line: 12 ]]
	while true do
		for i = 1, _G.trowelGearMaxCharges do
			local v1 = script.Parent:FindFirstChild("part" .. i)
			if v1 then
				v1.Transparency = if i <= _G.trowelGearCurrentCharges then 0 else 1
			end
		end
		wait()
	end
end)
script.Parent:WaitForChild("placeClient").Event:connect(function(p1, p2) --[[ Line: 24 | Upvalues: v1 (copy), stringListContains (copy), colorFromId (copy) ]]
	if not (_G.trowelGearCurrentCharges >= 1) then
		return
	end
	_G.trowelGearCurrentCharges = _G.trowelGearCurrentCharges - 1
	local v2 = p1.p + p1.LookVector * math.min((p1.p - script.Parent.Handle.Position).magnitude + script.Parent.range.Value, (p1.p - p2.p).magnitude)
	local v9 = Vector3.new(math.floor(v2.X + 0.5), math.floor(v2.Y + 0.5), (math.floor(v2.Z + 0.5)))
	local activeskills = v1.activeskills.Value
	local v10
	if stringListContains(activeskills, "trowel/truss") then
		local TrussPart = Instance.new("TrussPart")
		TrussPart.Size = Vector3.new(2, 8, 2)
		v10 = TrussPart
	else
		local Part = Instance.new("Part")
		Part.TopSurface = Enum.SurfaceType.Smooth
		Part.BottomSurface = Enum.SurfaceType.Smooth
		local v11
		v11 = 4
		v10 = Part
		for k, v in pairs({ 8, 16 }) do
			if stringListContains(activeskills, "trowel/size" .. k) then
				v11 = math.max(v11, v)
			end
		end
		v10.Size = Vector3.new(v11, 1, v11)
	end
	v10.Anchored = true
	v10.Material = Enum.Material.Glass
	v10.Color = colorFromId(game.Players.LocalPlayer.UserId)
	v10.Position = v9
	v10.Name = "temporaryPart-" .. game.Players.LocalPlayer.Name
	v10.Parent = workspace.platforms
	local v13 = script.Parent:FindFirstChild("part" .. _G.trowelGearCurrentCharges + 1)
	if v13 then
		v13.Transparency = 1
	end
	local v14 = game:GetService("TweenService"):Create(v10, TweenInfo.new(script.Parent.lifetime.Value), {
		Transparency = 1
	})
	game:GetService("Debris"):addItem(v10, script.Parent.lifetime.Value)
	v14:Play()
end)