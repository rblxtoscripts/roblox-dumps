-- https://lua.expert/
local t = {}
local HorseTextures = game:GetService("MaterialService"):WaitForChild("HorseTextures")
t.Moon = {
	Region = nil,
	Material = HorseTextures:WaitForChild("Moon")
}
t.Sun = {
	Region = nil,
	Material = HorseTextures:WaitForChild("Sun")
}
return t