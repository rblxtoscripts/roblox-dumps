-- https://lua.expert/
while true do
	for i = 1, 2, 0.07 do
		wait()
		script.Parent.SizeOffset = Vector2.new(0, i)
	end
	for j = 2, 1, -0.07 do
		wait()
		script.Parent.SizeOffset = Vector2.new(0, j)
	end
end