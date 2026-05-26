-- https://lua.expert/
wait(5)
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Network")
local v2 = Library:Load("SoundFX")
local CornMaze = workspace:FindFirstChild("CornMaze")
if not CornMaze then
	return
end
local LocalPlayer = game.Players.LocalPlayer
local Terrain = game.Workspace.Terrain
local v3 = v1:InvokeServer("GetCornMazeChests")
local CornScreenGui = script:WaitForChild("CornScreenGui")
CornScreenGui.Parent = LocalPlayer.PlayerGui
local TextLabel = CornScreenGui:WaitForChild("TextLabel")
local v4 = false
function touchChest(p1, p2, p3) --[[ touchChest | Line: 32 | Upvalues: v4 (ref), LocalPlayer (copy), v2 (copy), v3 (copy), v1 (copy), TextLabel (copy) ]]
	if v4 or (not p1 or (not p1.Parent or (not p1.Parent:FindFirstChild("Humanoid") or p1.Parent.Name ~= LocalPlayer.Name))) then
		return
	end
	v2:PlaySound("OpenMazeChest")
	p2.Touch:Destroy()
	v4 = true
	v3[p3] = 1
	v1:FireServer("ChestOpened", p3)
	openChest(p2)
	local Coin = p2.Coin
	Coin.PointLight.Enabled = true
	Coin.Billboard.Enabled = true
	local v12 = game:GetService("RunService").RenderStepped:connect(function() --[[ Line: 46 | Upvalues: Coin (copy) ]]
		Coin.CFrame = Coin.CFrame * CFrame.Angles(math.rad(1), 0, 0) + Vector3.new(0, 0.03, 0)
	end)
	p2.Particle.Sparkle.Enabled = true
	wait(3)
	local count = 0
	for i, v in ipairs(v3) do
		if v == 1 then
			count = count + 1
		end
	end
	Coin.Billboard.Enabled = false
	p2.Particle.Sparkle.Enabled = false
	v4 = false
	v12:disconnect()
	Coin:Destroy()
	TextLabel.Visible = true
	TextLabel.Text = count - 1 .. "/" .. #v3
	wait(1)
	TextLabel.Text = count .. "/" .. #v3
	delay(2, function() --[[ Line: 83 | Upvalues: TextLabel (ref) ]]
		TextLabel.Visible = false
	end)
end
function openChest(p1) --[[ openChest | Line: 90 ]]
	p1.Top:PivotTo(p1.Top:GetPivot() * CFrame.Angles(0, 1.5707963267948966, 0))
end
for i, v in ipairs(CornMaze.Chests:GetChildren()) do
	local Index = v.Index.Value
	if v3[Index] == 1 then
		if v:FindFirstChild("Coin") then
			openChest(v)
			v.Coin:Destroy()
			if v:FindFirstChild("Touch") then
				v.Touch:Destroy()
			end
		end
		continue
	end
	if v:FindFirstChild("Touch") then
		v.Touch.Touched:connect(function(p1) --[[ Line: 115 | Upvalues: v (copy), Index (copy) ]]
			touchChest(p1, v, Index)
		end)
	end
end