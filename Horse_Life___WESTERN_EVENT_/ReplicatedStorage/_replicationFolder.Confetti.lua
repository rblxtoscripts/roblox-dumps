-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CurrentCamera = workspace.CurrentCamera
local v1 = Sonar("spr")
local t = {}
t.__index = t
t.Pool = {}
t.Gravity = 1200
t._heartbeatConnection = nil
local function _startHeartbeat() --[[ _startHeartbeat | Line: 16 | Upvalues: t (copy), RunService (copy) ]]
	if t._heartbeatConnection then
		return
	end
	t._heartbeatConnection = RunService.Heartbeat:Connect(function(p1_2) --[[ Line: 18 | Upvalues: t (ref) ]]
		t.UpdateAll(p1_2)
	end)
end
local function _stopHeartbeat() --[[ _stopHeartbeat | Line: 25 | Upvalues: t (copy) ]]
	if not t._heartbeatConnection then
		return
	end
	t._heartbeatConnection:Disconnect()
	t._heartbeatConnection = nil
end
local ParticlesGui = Instance.new("ScreenGui")
ParticlesGui.IgnoreGuiInset = true
ParticlesGui.Name = "ParticlesGui"
ParticlesGui.DisplayOrder = 50
ParticlesGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
local t2 = {
	Color3.fromRGB(255, 207, 16),
	Color3.fromRGB(255, 90, 90),
	Color3.fromRGB(53, 238, 130),
	Color3.fromRGB(42, 92, 255),
	Color3.fromRGB(255, 255, 0),
	Color3.fromRGB(54, 255, 255),
	Color3.fromRGB(78, 255, 137)
}
function t.Emit(p1, p2) --[[ Emit | Line: 49 | Upvalues: t (copy) ]]
	task.spawn(function() --[[ Line: 50 | Upvalues: p1 (copy), t (ref), p2 (copy) ]]
		for i = 1, p1 do
			t.new(p2)
		end
	end)
end
function t.new(p1) --[[ new | Line: 57 | Upvalues: CurrentCamera (copy), t2 (copy), ParticlesGui (copy), t (copy), v1 (copy), RunService (copy) ]]
	local v12 = if p1 then p1 else {}
	local ViewportSize = CurrentCamera.ViewportSize
	local v2 = math.random(0, ViewportSize.X)
	local v3 = ViewportSize.Y + 30
	local v4 = v12.Image and Color3.new(255/255, 255/255, 255/255) or t2[math.random(1, #t2)]
	local v5, v6 = v12, v2
	local v7 = if v5.Image == nil then false else true
	local v8 = v7 and Instance.new("ImageLabel") or Instance.new("Frame")
	v8.Size = v5.Size or UDim2.new(0, math.random(15, 30) * 2, 0, 20)
	if v7 then
		v8.Image = v5.Image
		v8.BackgroundTransparency = 1
		v8.ImageColor3 = v4
	else
		v8.BackgroundColor3 = v4
	end
	v8.BorderSizePixel = 0
	v8.AnchorPoint = Vector2.new(0.5, 0.5)
	v8.Position = UDim2.fromOffset(v6, v3)
	v8.Parent = ParticlesGui
	local t3 = {
		ScaleDirection = 1,
		LastScaleDirection = 1,
		Brightness = 0,
		Frame = v8,
		X = v6,
		Y = v3,
		ViewSize = ViewportSize,
		VelX = (math.random() - 0.5) * 350
	}
	t3.VelY = math.max(0.25, math.random()) * -2550
	t3.OriginalColor = v4
	t3.Rotation = math.random(0, 360)
	t3.ColorProperty = if v7 then "ImageColor3" else "BackgroundColor3"
	t3.props = v5
	t3.start = tick()
	local v11 = t
	local v122 = setmetatable(t3, v11)
	v1.target(v8, 0.8, 0.5, {
		Size = v8.Size,
		Rotation = math.random(v122.Rotation - 25, v122.Rotation + 25)
	})
	local Pool = t.Pool
	table.insert(Pool, v122)
	if t._heartbeatConnection then
		return v122
	end
	t._heartbeatConnection = RunService.Heartbeat:Connect(function(p1_2) --[[ Line: 18 | Upvalues: t (ref) ]]
		t.UpdateAll(p1_2)
	end)
	return v122
end
function t.UpdateAll(p1) --[[ UpdateAll | Line: 110 | Upvalues: t (copy), CurrentCamera (copy), v1 (copy) ]]
	if #t.Pool == 0 then
		if not t._heartbeatConnection then
			return
		end
		t._heartbeatConnection:Disconnect()
		t._heartbeatConnection = nil
	else
		local ViewportSize = CurrentCamera.ViewportSize
		for i = #t.Pool, 1, -1 do
			local v12 = t.Pool[i]
			v12.VelY = v12.VelY + t.Gravity * p1
			v12.X = v12.X + v12.VelX * p1
			v12.Y = v12.Y + v12.VelY * p1
			v12.Y = math.min(v12.Y, ViewportSize.Y - 2)
			if tick() - v12.start > 0.2 and (v12.Y >= v12.ViewSize.Y - v12.Frame.Size.X.Offset * 1.2 and not v12.Removing) then
				v12.Removing = true
				local v3 = table.find(t.Pool, v12)
				if v3 then
					table.remove(t.Pool, v3)
				end
				v12.Frame:Destroy()
			end
			v12.Rotation = v12.Rotation + p1 * 90
			v12.Frame.Position = UDim2.fromOffset(v12.X, v12.Y)
			v12.Frame.Rotation = v12.Y < v12.ViewSize.Y - 5 and v12.Rotation or 0
			local Offset = v12.Frame.Size.X.Offset
			if Offset >= 29 then
				v12.ScaleDirection = -1
				if v12.LastScaleDirection ~= v12.ScaleDirection then
					v12.Brightness = 0.25
				end
				local v5, v6, v7 = v12.OriginalColor:ToHSV()
				if not v12.props.Size then
					v1.target(v12.Frame, 0.5, 0.5, {
						Size = UDim2.new(0, 30, 0, 10),
						[v12.ColorProperty] = Color3.fromHSV(v5, v6, v7 - 0.3)
					})
				end
			elseif Offset <= 1 then
				v12.ScaleDirection = 1
				if v12.LastScaleDirection ~= v12.ScaleDirection then
					v12.Brightness = -0.25
				end
				if not v12.props.Size then
					v1.target(v12.Frame, 0.5, 0.5, {
						Size = UDim2.new(0, 30, 0, 10),
						[v12.ColorProperty] = v12.OriginalColor
					})
				end
			end
			v12.LastScaleDirection = v12.ScaleDirection
		end
	end
end
return t