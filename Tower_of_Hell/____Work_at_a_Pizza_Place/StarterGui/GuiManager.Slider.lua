-- https://lua.expert/
local v1 = require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local t = {}
local UIEvents = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("UIEvents")
local v2 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local UserInputService = game:GetService("UserInputService")
local v3 = game:GetService("UserInputService").TouchEnabled and not game:GetService("UserInputService").MouseEnabled and not game:GetService("UserInputService").KeyboardEnabled
game:GetService("ContextActionService")
t.__index = t
SliderMinAndMax = 10
localMinPosition = SliderMinAndMax
function t.SetPositionAlpha(p1, p2) --[[ SetPositionAlpha | Line: 20 | Upvalues: v1 (copy), UIEvents (copy) ]]
	local Dragger = p1.Object.Dragger
	p1.Object.Dragger.Position = UDim2.new(0, v1:Map(p2, 0, 1, localMinPosition, p1.LocalMaxPosition), 0.5, 0)
	UIEvents.SliderMoved:Fire(p1.WindowData.Object, p1.Object, p2)
end
function t.DragSlider(p1, p2) --[[ DragSlider | Line: 30 | Upvalues: v1 (copy), UIEvents (copy) ]]
	local Object = p1.Object
	local Dragger = p1.Object.Dragger
	local v12 = Object.AbsoluteSize.X - SliderMinAndMax
	Dragger.Position = UDim2.new(0, p2 - Object.AbsolutePosition.X, 0.5, 0)
	if v12 < Dragger.Position.X.Offset then
		Dragger.Position = UDim2.new(0, v12, 0.5, 0)
	end
	if Dragger.Position.X.Offset < localMinPosition then
		Dragger.Position = UDim2.new(0, localMinPosition, 0.5, 0)
	end
	p1.PositionAlpha = v1:Map(Dragger.Position.X.Offset, localMinPosition, v12, 0, 1)
	UIEvents.SliderMoved:Fire(p1.WindowData.Object, Object, p1.PositionAlpha)
end
function t.new(p1, p2, p3) --[[ new | Line: 50 | Upvalues: t (copy), UIEvents (copy), UserInputService (copy), v3 (copy), v1 (copy), v2 (copy) ]]
	local t2 = {}
	setmetatable(t2, t)
	t2.Object = p1
	t2.Type = "Slider"
	t2.IsOn = p3
	t2.WindowData = p2
	t2.PositionAlpha = p3
	t2.DraggerSize = p1.Dragger.Size.X.Offset
	t2.DraggingOffsetX = 0
	local Offset = p1.Dragger.Size.X.Offset
	local Dragger = p1.Dragger
	local Offset_2 = p1.Dragger.Position.Y.Offset
	local v22 = p3
	local v32 = nil
	local v4 = nil
	local v5 = nil
	local v6 = nil
	local v7 = nil
	local function InputChanged(p1, p2) --[[ InputChanged | Line: 94 | Upvalues: t2 (copy) ]]
		if not p2 or p1.UserInputType ~= Enum.UserInputType.MouseMovement and p1.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		t2:DragSlider(p1.Position.X)
	end
	UIEvents.WindowVisibilityChanged.Event:connect(function(p12, p22) --[[ Line: 104 | Upvalues: p2 (copy), t2 (copy), p1 (copy), v4 (ref), v32 (ref), v5 (ref), Dragger (copy), UserInputService (ref), InputChanged (copy), v22 (ref), UIEvents (ref), v3 (ref), v1 (ref), v2 (ref), v6 (ref), v7 (ref) ]]
		if p22 and p12 == p2.Object then
			wait()
			t2.LocalMaxPosition = p1.AbsoluteSize.X - SliderMinAndMax
			t2:SetPositionAlpha(t2.PositionAlpha)
			if v4 then
				v4:disconnect()
			end
			v4 = t2.Object.InputBegan:connect(function(p13, p2) --[[ Line: 116 | Upvalues: v32 (ref), v5 (ref), t2 (ref), Dragger (ref), UserInputService (ref), InputChanged (ref), v22 (ref), UIEvents (ref), p12 (copy), p1 (ref) ]]
				if v32 then
					v32:disconnect()
					v32 = nil
				end
				if v5 then
					v5:disconnect()
					v5 = nil
				end
				if (p2 or p13.UserInputType ~= Enum.UserInputType.MouseButton1) and p13.UserInputType ~= Enum.UserInputType.Touch then
					return
				end
				t2.DraggingOffsetX = Dragger.AbsolutePosition.X - p13.Position.X
				v32 = UserInputService.InputChanged:connect(InputChanged)
				v5 = UserInputService.InputEnded:connect(function(p13, p2) --[[ Line: 125 | Upvalues: v5 (ref), v32 (ref), v22 (ref), t2 (ref), UIEvents (ref), p12 (ref), p1 (ref) ]]
					if p13.UserInputType ~= Enum.UserInputType.MouseButton1 and p13.UserInputType ~= Enum.UserInputType.Touch then
						return
					end
					v5:Disconnect()
					v5 = nil
					if v32 then
						v32:disconnect()
						v32 = nil
					end
					if v22 == t2.PositionAlpha then
						return
					end
					v22 = t2.PositionAlpha
					UIEvents.SliderStopped:Fire(p12, p1, t2.PositionAlpha)
				end)
			end)
			if v3 then
				v4 = UserInputService.InputBegan:connect(function(p12, p22) --[[ Line: 139 | Upvalues: v32 (ref), v3 (ref), v1 (ref), t2 (ref), UIEvents (ref), p2 (ref), p1 (ref) ]]
					if not (v32 and v3) then
						return
					end
					print("STOPPING")
					if not v1:PointInsideGui(t2.Object, p12.Position) then
						UIEvents.SliderStopped:Fire(p2.Object, p1, t2.PositionAlpha)
						v32:disconnect()
					end
				end)
			end
			if v2.GamepadEnabled then
				local v12 = nil
				local v23 = nil
				local v33 = nil
				local function MoveSliderGamepad(p1) --[[ MoveSliderGamepad | Line: 166 | Upvalues: t2 (ref), Dragger (ref) ]]
					t2:DragSlider(Dragger.AbsolutePosition.X + Dragger.AbsoluteSize.X / 2 + p1 * ((t2.LocalMaxPosition - localMinPosition) / 10))
				end
				v6 = t2.Object.SelectionGained:connect(function() --[[ Line: 177 | Upvalues: UserInputService (ref), t2 (ref), Dragger (ref), v12 (ref), v23 (ref), v33 (ref) ]]
					GamepadInputBegan = UserInputService.InputBegan:connect(function(p1, p2) --[[ Line: 179 | Upvalues: t2 (ref), Dragger (ref) ]]
						if p1.KeyCode == Enum.KeyCode.DPadLeft then
							t2:DragSlider(Dragger.AbsolutePosition.X + Dragger.AbsoluteSize.X / 2 + -1 * ((t2.LocalMaxPosition - localMinPosition) / 10))
							return
						end
						if p1.KeyCode ~= Enum.KeyCode.DPadRight then
							return
						end
						t2:DragSlider(Dragger.AbsolutePosition.X + Dragger.AbsoluteSize.X / 2 + 1 * ((t2.LocalMaxPosition - localMinPosition) / 10))
					end)
					GamepadInputChanged = UserInputService.InputChanged:connect(function(p1, p2) --[[ Line: 191 | Upvalues: v12 (ref), v23 (ref), v33 (ref), t2 (ref), Dragger (ref) ]]
						if p1.KeyCode ~= Enum.KeyCode.Thumbstick1 then
							return
						end
						v12 = p1.Position.X
						v23 = p1.Position.Y
						if math.sqrt(math.pow(v12, 2) + math.pow(v23, 2)) > 0.7 then
							if v33 ~= nil then
								return
							end
							if v12 > -0.5 and v12 < 0.5 then
								v33 = if v23 > 0 then "Up" else "Down"
							elseif v12 > 0.5 then
								v33 = "Right"
							elseif v12 < -0.5 then
								v33 = "Left"
							end
							if v33 == "Right" then
								t2:DragSlider(Dragger.AbsolutePosition.X + Dragger.AbsoluteSize.X / 2 + 1 * ((t2.LocalMaxPosition - localMinPosition) / 10))
								return
							end
							if v33 == "Left" then
								t2:DragSlider(Dragger.AbsolutePosition.X + Dragger.AbsoluteSize.X / 2 + -1 * ((t2.LocalMaxPosition - localMinPosition) / 10))
							end
						else
							v33 = nil
						end
					end)
				end)
				v7 = t2.Object.SelectionLost:connect(function() --[[ Line: 229 ]]
					if GamepadInputBegan then
						GamepadInputBegan:disconnect()
					end
					if not GamepadInputChanged then
						return
					end
					GamepadInputChanged:disconnect()
				end)
			end
		else
			if p22 or p12 ~= p2.Object then
				return
			end
			if v32 then
				v32:disconnect()
			end
			if v4 then
				v4:disconnect()
			end
			if v5 then
				v5:disconnect()
			end
			if v6 then
				v6:disconnect()
			end
			if v7 then
				v7:disconnect()
			end
			if GamepadInputBegan then
				GamepadInputBegan:disconnect()
			end
			if not GamepadInputChanged then
				return
			end
			GamepadInputChanged:disconnect()
		end
	end)
	return t2
end
return t