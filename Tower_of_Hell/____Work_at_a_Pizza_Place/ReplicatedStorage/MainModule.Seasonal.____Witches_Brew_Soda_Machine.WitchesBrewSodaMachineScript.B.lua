-- https://lua.expert/
return function(p1, p2, p3, p4, p5, p6) --[[ Line: 1 ]]
	p1:Play()
	for v1, v2 in p4.Parent:GetChildren() do
		v2.Material = "SmoothPlastic"
	end
	p4.Parent.Parent.Picture.Material = "SmoothPlastic"
	p5.Material = "SmoothPlastic"
	p5.BrickColor = BrickColor.new("Really black")
	p4.Parent.Parent.Picture.SurfaceLight.Enabled = false
	p4.BrickColor = BrickColor.new("Persimmon")
	wait(1)
	for v3, v4 in p4.Parent:GetChildren() do
		v4.Material = "Neon"
	end
	p4.Parent.Parent.Picture.Material = "Neon"
	p4.Parent.Parent.Picture.SurfaceLight.Enabled = true
	p4.BrickColor = BrickColor.new("Really black")
end