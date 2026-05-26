-- https://lua.expert/
local BaseSegment = script.Parent:WaitForChild("BaseSegment")
local v1 = BaseSegment
local v2 = 0
local v3 = script.Parent:WaitForChild("Segments"):WaitForChild("1")
local v4 = nil
function get_speed(p1, p2) --[[ get_speed | Line: 8 ]]
	return script.Parent:GetAttribute("speed_base") + (p1 - 1) * script.Parent:GetAttribute("speed_increase") * math.sqrt(p2)
end
function position_segment(p1) --[[ position_segment | Line: 12 | Upvalues: BaseSegment (copy), v3 (ref), v1 (ref) ]]
	v3.Position = (BaseSegment.Position + BaseSegment.CFrame.RightVector * p1) * Vector3.new(1, 0, 1) + v1.Position * Vector3.new(0, 1, 0) + v1.CFrame.UpVector * (v3.Size.Y / 2 + v1.Size.Y / 2)
end
function update_segment() --[[ update_segment | Line: 18 | Upvalues: v3 (ref), BaseSegment (copy), v4 (ref) ]]
	local v1 = time() * get_speed(v3.Name, v3.Size.X)
	local v2 = BaseSegment.Size.X - v3.Size.X
	local v32 = v1 % (v2 * 2)
	if v2 < v32 then
		v32 = v2 - (v32 - v2)
	end
	v4 = v32 - v2 / 2
	position_segment(v4)
end
function place_segment() --[[ place_segment | Line: 30 | Upvalues: v4 (ref), v2 (ref), v3 (ref), v1 (ref) ]]
	local v12 = script.Parent:GetAttribute("bias") / 1000
	local v6 = math.min(math.abs(v4 - v2), get_speed(v3.Name, v3.Size.X) * v12)
	local v8 = v4 + v6 * math.sign(v2 - v4)
	local v13 = math.max(v2 - v1.Size.X / 2, v8 - v3.Size.X / 2)
	local v14 = math.min(v2 + v1.Size.X / 2, v8 + v3.Size.X / 2)
	local v15 = (v13 + v14) / 2
	local v16 = v14 - v13
	if v16 <= 0 then
		lost()
		return
	end
	v3.Size = Vector3.new(v16, v3.Size.Y, v3.Size.Z)
	position_segment(v15)
	v1 = v3
	v2 = v15
	if tonumber(v3.Name) == script.Parent:GetAttribute("height") then
		won()
	else
		v3 = v3:Clone()
		v3.Name = v3.Name + 1
		v3.Parent = v1.Parent
	end
end
function lost() --[[ lost | Line: 65 | Upvalues: v3 (ref) ]]
	script.Parent:SetAttribute("state", "lost")
	v3.Color = Color3.new(0.8, 0.3, 0.3)
	wait(1)
	reset()
end
function won() --[[ won | Line: 72 | Upvalues: v3 (ref) ]]
	script.Parent:SetAttribute("state", "won")
	local Color = v3.Color
	local v1 = script.Parent.Segments:GetChildren()
	table.sort(v1, function(p1, p2) --[[ Line: 76 ]]
		local v2 = tonumber(p1.Name)
		return tonumber(p2.Name) < v2
	end)
	for k, v in pairs(v1) do
		v.Color = Color3.new(0.35, 0.8, 0.3)
		wait(0.1)
	end
	wait(0.2)
	for k, v in pairs(v1) do
		v.Color = Color
	end
	reset()
end
function reset() --[[ reset | Line: 89 | Upvalues: v3 (ref), v1 (ref), BaseSegment (copy), v2 (ref) ]]
	for k, v in pairs(script.Parent.Segments:GetChildren()) do
		if v.Name ~= "1" then
			v:Destroy()
		end
	end
	v3 = script.Parent.Segments["1"]
	v1 = BaseSegment
	v2 = 0
	script.Parent:SetAttribute("state", "running")
end
script.Parent.place_segment.OnInvoke = place_segment
game:GetService("RunService").RenderStepped:Connect(function() --[[ Line: 103 ]]
	if script.Parent:GetAttribute("state") ~= "running" then
		return
	end
	update_segment()
end)