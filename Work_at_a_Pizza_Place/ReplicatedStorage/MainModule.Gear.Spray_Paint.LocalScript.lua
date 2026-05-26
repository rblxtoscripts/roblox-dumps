-- https://lua.expert/
require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local v1 = script.Parent
sp = script.Parent
cooldown = 2.1
spraysize = 5
range = 20
baseid = "http://www.roblox.com/Thumbs/Asset.ashx?Width=75&Height=75&AssetID="
local v2 = 0
equipped = false
check = true
local SprayGui = sp:WaitForChild("SprayGui")
local Frame = SprayGui:WaitForChild("Frame")
local ImageLabel = Frame:WaitForChild("ImageLabel")
local LocalPlayer = game.Players.LocalPlayer
local ChooseDecal = Frame:WaitForChild("Frame"):WaitForChild("ChooseDecal")
workspace.Main.AssetIdChanged.AssetIdChanged.Event:connect(function(p1, p2) --[[ Line: 27 | Upvalues: v1 (copy), v2 (ref), ImageLabel (copy) ]]
	game:GetService("HttpService"):JSONEncode(p2)
	if p1 ~= v1 then
		return
	end
	v2 = tonumber(p2)
	ImageLabel.Image = baseid .. p2
end)
ChooseDecal.MouseButton1Click:connect(function() --[[ Line: 36 | Upvalues: v1 (copy) ]]
	workspace.Main.OpenAssetPicker.OpenAssetPicker:Fire(v1, "Decal")
end)
function onEquipped(p1) --[[ onEquipped | Line: 44 | Upvalues: SprayGui (copy), v2 (ref) ]]
	equipped = true
	local LocalPlayer = game.Players.LocalPlayer
	if p1 == nil or LocalPlayer == nil then
		return
	end
	local PlayerGui = LocalPlayer.PlayerGui
	if PlayerGui ~= nil then
		SprayGui.Parent = PlayerGui
	end
	p1.Button1Down:connect(function() --[[ Line: 52 | Upvalues: p1 (copy), v2 (ref) ]]
		local v1 = sp.Parent
		if not v1 or (not check or (p1.Target == nil or (p1.TargetSurface == nil or (p1.Target.Name == "Spray" or (p1.Target.Name == "Effect" or not (v2 > 0)))))) then
			return
		end
		local TargetSurface = p1.TargetSurface
		local HumanoidRootPart = v1:FindFirstChild("HumanoidRootPart")
		local Humanoid = v1:FindFirstChild("Humanoid")
		local SprayPaint = sp:FindFirstChild("SprayPaint")
		if not (HumanoidRootPart and (Humanoid and (SprayPaint and Humanoid.Health > 0))) then
			return
		end
		check = false
		anim = Humanoid:LoadAnimation(SprayPaint)
		if anim then
			anim:Play()
			sp.Handle.Sound:Play()
		end
		if (HumanoidRootPart.Position - p1.Hit.p).magnitude < range then
			local v22 = false
			if (TargetSurface == Enum.NormalId.Front or TargetSurface == Enum.NormalId.Back) and (p1.Target.Size.x >= spraysize and p1.Target.Size.y >= spraysize) then
				v22 = true
			elseif TargetSurface == Enum.NormalId.Left or TargetSurface == Enum.NormalId.Right then
				if p1.Target.Size.y >= spraysize and p1.Target.Size.z >= spraysize or (TargetSurface == Enum.NormalId.Top or TargetSurface == Enum.NormalId.Bottom) and (p1.Target.Size.x >= spraysize and p1.Target.Size.z >= spraysize) then
					v22 = true
				end
			elseif (TargetSurface == Enum.NormalId.Top or TargetSurface == Enum.NormalId.Bottom) and (p1.Target.Size.x >= spraysize and p1.Target.Size.z >= spraysize) then
				v22 = true
			end
			if v22 then
				game.Workspace.Main.SprayPaint:FireServer(v2, TargetSurface, spraysize, p1.Target, p1.Hit.p)
			end
		end
		wait(cooldown)
		sp.Handle.Sound:Stop()
		check = true
	end)
end
function onUnequipped() --[[ onUnequipped | Line: 93 | Upvalues: SprayGui (copy) ]]
	SprayGui.Parent = sp
	equipped = false
end
sp.Equipped:connect(onEquipped)
sp.Unequipped:connect(onUnequipped)