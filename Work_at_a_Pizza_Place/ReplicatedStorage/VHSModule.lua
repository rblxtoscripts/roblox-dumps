-- https://lua.expert/
local RunService = game:GetService("RunService")
local function Lerp(p1, p2, p3) --[[ Lerp | Line: 5 ]]
	return p1 + p3 * (p2 - p1)
end
local t = {
	CurrentUI = nil,
	CurrentEnabled = false,
	NoisePosition = 1,
	NoisesImages = {
		"rbxassetid://783048619",
		"rbxassetid://783049597",
		"rbxassetid://783050550",
		"rbxassetid://783051596",
		"rbxassetid://783052683"
	},
	LinesSettings = {
		MinWidth = 0.01,
		MaxWidth = 0.5,
		MinTransparency = 0.7,
		MaxTransparency = 0.95,
		LineSpeed = -0.25
	},
	Settings = {
		EnableNoise = true,
		EnableLines = true
	}
}
function t.Enable() --[[ Line: 41 | Upvalues: t (copy), RunService (copy) ]]
	t.CurrentEnabled = true
	t.CurrentUI = script:WaitForChild("VHS_UI"):Clone()
	t.CurrentUI.Parent = game:GetService("Players").LocalPlayer.PlayerGui
	t.NoisePosition = 1
	if t.Settings.EnableNoise then
		task.spawn(function() --[[ Line: 49 | Upvalues: t (ref) ]]
			t.CurrentUI.Noises.Visible = true
			while task.wait(0.05) and (t.CurrentUI and (t.CurrentUI ~= nil and t.CurrentUI.Parent ~= nil)) do
				local v1 = t
				v1.NoisePosition = v1.NoisePosition + 1
				if t.NoisePosition > 5 then
					t.NoisePosition = 1
				end
				t.CurrentUI.Noises.Image = t.NoisesImages[t.NoisePosition]
			end
		end)
	else
		t.CurrentUI.Noises.Visible = false
	end
	if not t.Settings.EnableLines then
		return
	end
	task.spawn(function() --[[ Line: 71 | Upvalues: t (ref), RunService (ref) ]]
		while task.wait(1 + math.random() * 2) and (t.CurrentUI and (t.CurrentUI ~= nil and t.CurrentUI.Parent ~= nil)) do
			local v1 = script:WaitForChild("LineTemplate"):Clone()
			local v2 = math.random() ^ 4
			local MinWidth = t.LinesSettings.MinWidth
			local v3 = MinWidth + v2 * (t.LinesSettings.MaxWidth - MinWidth)
			v1.Parent = t.CurrentUI
			v1.Size = UDim2.new(v1.Size.X.Scale, 0, v3, 0)
			local MinTransparency = t.LinesSettings.MinTransparency
			v1.ImageTransparency = MinTransparency + v2 * (t.LinesSettings.MaxTransparency - MinTransparency)
			local v4 = nil
			v4 = RunService.Heartbeat:Connect(function(p1) --[[ Line: 86 | Upvalues: v1 (copy), t (ref), v3 (copy), v4 (ref) ]]
				local v12 = v1.Position.Y.Scale + t.LinesSettings.LineSpeed * p1
				if v12 < -v3 then
					v4:Disconnect()
					v1:Destroy()
				else
					v1.Position = UDim2.new(-math.random(), 0, v12, 0)
				end
			end)
		end
	end)
end
function t.Disable() --[[ Line: 102 | Upvalues: t (copy) ]]
	t.CurrentEnabled = false
	if not t.CurrentUI and t.CurrentUI == nil then
		return
	end
	t.CurrentUI:Destroy()
	t.CurrentUI = nil
end
return t