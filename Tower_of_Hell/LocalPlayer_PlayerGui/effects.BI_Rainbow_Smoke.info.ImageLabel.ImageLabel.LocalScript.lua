-- https://lua.expert/
while true do
	script.Parent.ImageColor3 = Color3.fromHSV(os.time() / 10 % 1, 1, if script.Parent.Parent.Parent.owned.Value then 1 else 0.333)
	wait()
end