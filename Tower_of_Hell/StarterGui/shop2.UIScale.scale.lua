-- https://lua.expert/
function update() --[[ update | Line: 1 ]]
	local v1 = Vector2.new(0.3, 0.65)
	local v2 = script.Parent.Parent.AbsoluteSize * v1 / Vector2.new(script.Parent.Parent.shop.Size.X.Offset, script.Parent.Parent.shop.Size.Y.Offset)
	local setscaleto = math.floor(math.min(v2.X, v2.Y) / 0.25)
	print("Set scale to ", setscaleto)
	if setscaleto < 3 then
		setscaleto = setscaleto + 1
	end
	script.Parent.Scale = math.max(setscaleto * 0.25, 0.25)
end
script.Parent.Parent:GetPropertyChangedSignal("AbsoluteSize"):Connect(update)
update()