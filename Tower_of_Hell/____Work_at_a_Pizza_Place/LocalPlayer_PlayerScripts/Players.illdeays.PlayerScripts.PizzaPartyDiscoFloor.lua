-- https://lua.expert/
local t = {
	Color3.new(0/255, 255/255, 0/255),
	Color3.new(255/255, 0/255, 0/255),
	Color3.new(0/255, 0/255, 255/255),
	Color3.new(255/255, 255/255, 0/255),
	Color3.new(0/255, 255/255, 255/255),
	Color3.new(255/255, 0/255, 255/255)
}
local v1 = workspace:FindFirstChild("Disco Floor")
if not v1 then
	return
end
local Disco = v1.Tile.Disco
Disco.Adornee = v1.Tile
Disco.Enabled = true
local v2 = Disco:GetChildren()
while true do
	wait(2)
	for k, v in pairs(v2) do
		v.BackgroundColor3 = t[math.random(1, #t)]
	end
end