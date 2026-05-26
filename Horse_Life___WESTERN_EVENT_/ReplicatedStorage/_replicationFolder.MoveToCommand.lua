-- https://lua.expert/
local t = {}
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("spr")
local v3 = game.Players.LocalPlayer:GetMouse()
local v4 = Sonar("InputTypeDetector")
local PlayerGui = Sonar("PlayerWrapper").GetClient().Player.PlayerGui
local v5 = v1.new()
local v6 = nil
local v7 = nil
local v8 = nil
local v9 = nil
function t.Start(p1, p2) --[[ Start | Line: 23 | Upvalues: v5 (copy), v8 (ref), v7 (ref), v3 (copy), RunService (copy), v9 (ref), v4 (copy), v2 (copy), PlayerGui (copy), v6 (ref) ]]
	v5:DoCleaning()
	if v8 then
		return
	end
	v8 = p2
	local v1 = game.ReplicatedStorage.Storage.Assets.MoveToPart:Clone()
	v7 = v1.Size
	local function getHit() --[[ getHit | Line: 32 | Upvalues: v3 (ref) ]]
		return v3.Hit.p
	end
	local function updateCursorPosition() --[[ updateCursorPosition | Line: 36 | Upvalues: v3 (ref), v1 (copy) ]]
		local Position = game.Players.LocalPlayer.Character.PrimaryPart.Position
		local v12 = v3.Hit.p - Position
		local v2 = Position + v12.unit * math.min(v12.magnitude, 200)
		local v32 = CFrame.new(v2) * CFrame.Angles(0, 0, 1.5707963267948966)
		v1.Position = v32.Position:Lerp(v32.Position, 1)
		return v32
	end
	v5:GiveTask(RunService.RenderStepped:Connect(function() --[[ Line: 65 | Upvalues: updateCursorPosition (copy) ]]
		updateCursorPosition()
	end))
	local UserInputService = game:GetService("UserInputService")
	v5:GiveTask(UserInputService.TouchTapInWorld:Connect(function(p12, p2) --[[ Line: 70 | Upvalues: v9 (ref), updateCursorPosition (copy), p1 (copy) ]]
		if p2 then
			return
		end
		v9 = p12 / workspace.CurrentCamera.ViewportSize
		updateCursorPosition()
		p1:Input("Mobile")
	end))
	v5:GiveTask(UserInputService.InputBegan:Connect(function(p12, p2) --[[ Line: 77 | Upvalues: p1 (copy) ]]
		if p2 then
			return
		end
		if p12.UserInputType ~= Enum.UserInputType.MouseButton1 and p12.KeyCode ~= Enum.KeyCode.ButtonA then
			return
		end
		task.defer(function() --[[ Line: 82 | Upvalues: p1 (ref) ]]
			p1:Input()
		end)
	end))
	v1.Position = v3.Hit.Position
	v1.Size = Vector3.new(0, 0, 0)
	v1.Parent = workspace.CurrentCamera
	if not v4.IsMobileInputType() then
		v2.target(v1, 0.5, 5, {
			Size = v7
		})
	end
	for k, v in pairs(PlayerGui.HUDGui.BottomFrame:GetChildren()) do
		if v:FindFirstChild("MoveToCommand") then
			v.MoveToCommand.Visible = true
		end
	end
	v6 = v1
end
function t.Stop(p1) --[[ Stop | Line: 105 | Upvalues: t (copy), v5 (copy), PlayerGui (copy), v6 (ref), v9 (ref), v8 (ref) ]]
	t:AnimateOut()
	v5:DoCleaning()
	for k, v in pairs(PlayerGui.HUDGui.BottomFrame:GetChildren()) do
		if v:FindFirstChild("MoveToCommand") then
			v.MoveToCommand.Visible = false
		end
	end
	v6 = nil
	v9 = nil
	v8 = nil
end
function t.IsActive(p1) --[[ IsActive | Line: 120 | Upvalues: v6 (ref) ]]
	return v6 ~= nil
end
function t.AnimateOut(p1) --[[ AnimateOut | Line: 124 | Upvalues: v6 (ref), v9 (ref), v2 (copy), v7 (ref), TweenService (copy) ]]
	local v1 = v6
	if not v1 then
		return
	end
	if v9 then
		v1.Size = Vector3.new(0, 0, 0)
	end
	local t = {}
	t.Size = Vector3.new(v7.X, v7.Y * 2, v7.Z * 2)
	v2.target(v1, if v9 then 0.8 else 0.4, 3, t)
	if v9 then
		task.delay(0.45, function() --[[ Line: 133 | Upvalues: TweenService (ref), v1 (copy) ]]
			TweenService:Create(v1.SurfaceGui.Frame.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Linear), {
				Transparency = 1
			}):Play()
			TweenService:Create(v1.SurfaceGui.Frame.ImageLabel, TweenInfo.new(0.3, Enum.EasingStyle.Linear), {
				ImageTransparency = 1
			}):Play()
		end)
	else
		TweenService:Create(v1.SurfaceGui.Frame.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Linear), {
			Transparency = 1
		}):Play()
		TweenService:Create(v1.SurfaceGui.Frame.ImageLabel, TweenInfo.new(0.3, Enum.EasingStyle.Linear), {
			ImageTransparency = 1
		}):Play()
	end
	v2.completed(v1, function() --[[ Line: 141 | Upvalues: v1 (copy) ]]
		v1:Destroy()
	end)
end
function t.Input(p1) --[[ Input | Line: 147 | Upvalues: v8 (ref), v6 (ref), t (copy) ]]
	if not v8 then
		t:Stop()
		return
	end
	v8(v6.Position)
	t:Stop()
end
return t