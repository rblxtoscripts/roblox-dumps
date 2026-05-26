-- https://lua.expert/
local ContextActionService = game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Sonar = require(game.ReplicatedStorage.Sonar)
Sonar("PlayerWrapper").GetClient()
local v1 = Sonar("Maid")
local v2 = Sonar("InputTypeService")
local LocalPlayer = Players.LocalPlayer
local t = {}
local v3 = nil
local v4 = nil
local v5 = nil
local v6 = Instance.new("BindableEvent")
local t2 = {
	GetMouseLocation = function() --[[ GetMouseLocation | Line: 30 | Upvalues: UserInputService (copy) ]]
		return UserInputService:GetMouseLocation()
	end
}
function t2.GetMouseTarget(p1, p2, p3) --[[ GetMouseTarget | Line: 34 | Upvalues: t2 (copy) ]]
	if not p1 then
		local v1 = RaycastParams.new()
		v1.ExcludeInstances = { nil }
		p1 = v1
	end
	local v2 = p2 or 15000
	local v3 = if p3 then p3 else t2.GetMouseLocation()
	local v4 = workspace.CurrentCamera:ViewportPointToRay(v3.X, v3.Y)
	local v5 = workspace:Raycast(v4.Origin, v4.Direction * v2, p1)
	return v5, v5 and v5.Position or v4.Origin + v4.Direction * v2
end
function t2.AddHoverTarget(p1, p2) --[[ AddHoverTarget | Line: 66 | Upvalues: t (copy) ]]
	if t[p1] then
		warn("Instance is already a hover target", p1)
		return
	end
	if p2.BillboardGuiToShow then
		p2.BillboardGuiToShow = p2.BillboardGuiToShow:Clone()
	end
	t[p1] = if p2 then p2 else {}
end
function t2.RemoveHoverTarget(p1) --[[ RemoveHoverTarget | Line: 79 | Upvalues: v3 (ref), t2 (copy), t (copy) ]]
	if p1 ~= v3 then
		t[p1] = nil
		return
	end
	t2._setHoverTarget(nil)
	t[p1] = nil
end
function t2.GetAncestorHoverTarget(p1) --[[ GetAncestorHoverTarget | Line: 86 | Upvalues: t (copy) ]]
	while p1 ~= nil and not t[p1] do
		p1 = p1.Parent
	end
	return p1, t[p1]
end
function t2.GetCurrentHoverTarget(p1, p2, p3) --[[ GetCurrentHoverTarget | Line: 94 | Upvalues: t2 (copy), LocalPlayer (copy) ]]
	local v1, _ = t2.GetMouseTarget(p1, p2, p3)
	local v3, v4 = t2.GetAncestorHoverTarget(if v1 then v1.Instance else v1)
	if v4 then
		local Position = v3:GetPivot().Position
		if v4.MaxDistanceFromCamera and (Position - workspace.CurrentCamera.CFrame.Position).Magnitude > v4.MaxDistanceFromCamera then
			return nil
		end
		if v4.MaxDistanceFromPlayer then
			local Position_2 = LocalPlayer.Character:GetPivot().Position
			local v5 = Position - Position_2
			local v6 = RaycastParams.new()
			v6.IncludeInstances = { v3 }
			local v7 = workspace:Raycast(Position_2, v5, v6)
			if ((if v7 then v7.Position or Position_2 + v5 else Position_2 + v5) - Position_2).Magnitude > v4.MaxDistanceFromPlayer then
				return nil
			end
		end
	end
	return v3
end
function t2.GetClickInWorldSignal(p1) --[[ GetClickInWorldSignal | Line: 122 | Upvalues: v6 (copy) ]]
	return v6.Event
end
function t2._setHoverTarget(p1, p2) --[[ _setHoverTarget | Line: 126 | Upvalues: v3 (ref), t (copy), v4 (ref), v5 (ref), v1 (copy) ]]
	if p1 == v3 then
		return
	end
	if v3 then
		local v12 = t[v3]
		if v12 and v12.OnHoverEnded then
			task.spawn(v12.OnHoverEnded)
		end
		if v4 then
			v4:Destroy()
			v4 = nil
		end
	end
	v3 = p1
	v5 = p2
	if not p1 then
		return
	end
	v4 = v1.new()
	local v2 = t[p1]
	if v2 and v2.OnHoverBegan then
		task.spawn(v2.OnHoverBegan, v4)
	end
	if v2 and (v2.Highlight and not p1:FindFirstChildWhichIsA("Highlight")) then
		local HoverHighlight = Instance.new("Highlight")
		for v32, v42 in v2.Highlight do
			HoverHighlight[v32] = v42
		end
		HoverHighlight.Name = "HoverHighlight"
		HoverHighlight.Parent = p1
		v4:GiveTask(HoverHighlight)
	end
	if not (v2 and v2.BillboardGuiToShow) then
		return
	end
	v2.BillboardGuiToShow.Parent = p1
	v2.BillboardGuiToShow.Adornee = p1
	v2.BillboardGuiToShow.Enabled = true
	if v2.OnBillboardGuiShown then
		task.spawn(v2.OnBillboardGuiShown, v2.BillboardGuiToShow, p1)
	end
	v4:GiveTask(function() --[[ Line: 170 | Upvalues: v2 (copy) ]]
		v2.BillboardGuiToShow.Parent = nil
		v2.BillboardGuiToShow.Enabled = false
	end)
end
function t2.Init(p1) --[[ Init | Line: 178 | Upvalues: t2 (copy), t (copy), v6 (copy), v4 (ref), ContextActionService (copy), UserInputService (copy), v3 (ref), RunService (copy), v2 (copy), v5 (ref) ]]
	local function onClickInWorld(p1) --[[ onClickInWorld | Line: 179 | Upvalues: t2 (ref), t (ref), v6 (ref), v4 (ref) ]]
		local v1 = t2.GetCurrentHoverTarget(nil, nil, p1)
		local v2 = if v1 then t[v1] else v1
		v6:Fire(p1)
		if not (v2 and v2.OnClick) then
			return
		end
		v2.OnClick(v4)
	end
	ContextActionService:BindAction("MouseClickInWorld", function(p1, p2) --[[ Line: 190 | Upvalues: t2 (ref), t (ref), v6 (ref), v4 (ref) ]]
		if p2 ~= Enum.UserInputState.Begin then
			return Enum.ContextActionResult.Pass
		end
		local v1 = t2.GetMouseLocation()
		local v2 = t2.GetCurrentHoverTarget(nil, nil, v1)
		local v3 = if v2 then t[v2] else v2
		v6:Fire(v1)
		if not (v3 and v3.OnClick) then
			return Enum.ContextActionResult.Pass
		end
		v3.OnClick(v4)
		return Enum.ContextActionResult.Pass
	end, false, Enum.UserInputType.MouseButton1, Enum.KeyCode.ButtonR2)
	UserInputService.TouchTapInWorld:Connect(function(p1, p2) --[[ Line: 197 | Upvalues: v6 (ref), t2 (ref), t (ref), v3 (ref), v4 (ref) ]]
		if p2 then
			return
		end
		v6:Fire(p1)
		local v1 = t2.GetCurrentHoverTarget(nil, nil, p1)
		if v1 then
			local v2 = t[v1]
			if v1 == v3 then
				if not (v2 and v2.OnClick) then
					t2._setHoverTarget(nil)
					return
				end
				v2.OnClick(v4)
				t2._setHoverTarget(nil)
				return
			end
			t2._setHoverTarget(v1, "tap")
			if v2 and v2.OnClick then
				v2.OnClick(v4)
			end
		else
			t2._setHoverTarget(nil)
		end
	end)
	RunService.RenderStepped:Connect(function(p1) --[[ Line: 224 | Upvalues: v2 (ref), t2 (ref), t (ref), v3 (ref), v5 (ref) ]]
		if not v2.IsMobileInputType() then
			t2._setHoverTarget(t2.GetCurrentHoverTarget(), "mouse")
			return
		end
		local ViewportSize = workspace.CurrentCamera.ViewportSize
		local v32 = t2.GetCurrentHoverTarget(nil, nil, (Vector2.new(ViewportSize.X / 2, ViewportSize.Y / 2)))
		if if v32 then t[v32] and t[v32].MobileLookAtHover else v32 then
			if v32 ~= v3 and v5 ~= "tap" then
				t2._setHoverTarget(v32, "lookat")
			end
		else
			if v5 ~= "lookat" then
				return
			end
			t2._setHoverTarget(nil)
		end
	end)
end
t2:Init()
return t2