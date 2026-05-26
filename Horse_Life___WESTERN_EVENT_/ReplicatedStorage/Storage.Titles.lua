-- https://lua.expert/
local t = {}
for k, v in pairs(script:GetDescendants()) do
	if v:IsA("ModuleScript") then
		for k2, v2 in pairs(require(v)) do
			t[#t + 1] = v2
			v2.Gradient = v2.Gradient or script.Gradients:FindFirstChild(v2.Title)
			if v2.Gradient then
				v2.TextColor = Color3.new(255/255, 255/255, 255/255)
			end
		end
	end
end
return t