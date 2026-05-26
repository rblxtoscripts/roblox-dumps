-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("CollectionService")
local TweenService = game:GetService("TweenService")
local v1 = script:WaitForChild("ObjectPointer").Value
local Pieces = v1:WaitForChild("Pieces")
local _ = script:WaitForChild("HousePointer").Value:FindFirstChild("Owner").Value
local ValidateSlideMove = ReplicatedStorage._v6FiRE_Additions.FurnitureRemotes.SliderPuzzle.ValidateSlideMove
local v2 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local t = {}
local function onTileClick(p1, p2) --[[ onTileClick | Line: 17 | Upvalues: t (copy), TweenService (copy), v2 (copy), ValidateSlideMove (copy) ]]
	if t[p2] then
		return
	end
	local v1 = p1:GetAttribute("HolePosition")
	local v22 = p1:GetAttribute("TileSize")
	if not (v1 and v22) then
		return
	end
	if not (math.abs((p2.Position - v1).Magnitude - v22) > 0.1) then
		t[p2] = true
		local Position = p2.Position
		TweenService:Create(p2, v2, {
			Position = v1
		}):Play()
		task.spawn(function() --[[ Line: 37 | Upvalues: ValidateSlideMove (ref), p1 (copy), p2 (copy), TweenService (ref), v2 (ref), Position (copy), t (ref) ]]
			if not ValidateSlideMove:InvokeServer(p1, p2.Name) then
				TweenService:Create(p2, v2, {
					Position = Position
				}):Play()
			end
			t[p2] = nil
		end)
	end
end
local function setupTile(p1, p2) --[[ setupTile | Line: 50 | Upvalues: onTileClick (copy) ]]
	if p2:IsA("BasePart") then
		p2:WaitForChild("RobloxClickDetector").MouseClick:Connect(function() --[[ Line: 55 | Upvalues: onTileClick (ref), p1 (copy), p2 (copy) ]]
			onTileClick(p1, p2)
		end)
	end
end
(function(p1) --[[ setupPuzzle | Line: 63 | Upvalues: onTileClick (copy) ]]
	print((("[SliderPuzzle] setting up puzzle %*"):format(p1.Name)))
	if not p1:GetAttribute("TileSize") then
		p1:GetAttributeChangedSignal("TileSize"):Wait()
	end
	for i, v in ipairs(p1:GetChildren()) do
		if v:IsA("BasePart") then
			v:WaitForChild("RobloxClickDetector").MouseClick:Connect(function() --[[ Line: 55 | Upvalues: onTileClick (ref), p1 (copy), v (copy) ]]
				onTileClick(p1, v)
			end)
		end
	end
	p1.ChildAdded:Connect(function(p12) --[[ Line: 76 | Upvalues: p1 (copy), onTileClick (ref) ]]
		local v1 = p1
		if p12:IsA("BasePart") then
			p12:WaitForChild("RobloxClickDetector").MouseClick:Connect(function() --[[ Line: 55 | Upvalues: onTileClick (ref), v1 (copy), p12 (copy) ]]
				onTileClick(v1, p12)
			end)
		end
	end)
end)(Pieces)
game.ReplicatedStorage:WaitForChild("_v6FiRE_Additions"):WaitForChild("FurnitureRemotes"):WaitForChild("FurnitureOffloadEvent"):Fire("Sliding Puzzle", v1)