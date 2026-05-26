-- https://lua.expert/
return function(p1, ...) --[[ Line: 5 ]]
	assert(type(p1) == "function")
	local v2 = table.pack(...)
	local v3 = Instance.new("BindableEvent")
	v3.Event:Connect(function() --[[ Line: 11 | Upvalues: v3 (copy), p1 (copy), v2 (copy) ]]
		v3:Destroy()
		p1(table.unpack(v2))
	end)
	v3:Fire()
end