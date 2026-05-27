-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("EventUtils")
local v2 = Sonar("GuiFrameworkService")
local v3 = Sonar("TableUtils")
local v4 = Sonar("Signal")
local v5 = Sonar("InputTypeService")
local v6 = Sonar("PlayerWrapper")
local v7 = Sonar("StorageUtils").GetConfig("MobileControls")()
local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local v8 = v6.GetClient()
local t2 = {}
local v9 = nil
local v10 = nil
local v11 = v4.new()
local v12 = nil
local t3 = {
	Jump = function(p1) --[[ Jump | Line: 36 | Upvalues: v12 (ref) ]]
		v12.JumpButton.ImageTransparency = 1
		v12.JumpButton.Active = false
		v12.JumpButton.Interactable = false
	end
}
function t.AddControl(p1, p2) --[[ AddControl | Line: 43 | Upvalues: t2 (copy), v2 (copy), v9 (ref), v3 (copy), v10 (ref), v7 (copy), t3 (copy), v5 (copy), v11 (copy) ]]
	if t2[p2.Name] then
		warn("\226\154\160\239\184\143 MobileControl, Control with name \'" .. p2.Name .. "\' already exists!")
		return
	end
	local v1 = v2.FindElement(v9, p2.Name)
	if not v1 then
		warn("\226\154\160\239\184\143 MobileControl, Template with name \'" .. p2.Name .. "\' not found!")
		return
	end
	local function createMobileControlButton() --[[ createMobileControlButton | Line: 55 | Upvalues: v2 (ref), v3 (ref), p2 (copy), v10 (ref), v1 (copy), v7 (ref), t2 (ref), t3 (ref) ]]
		local t = {
			Parent = v10,
			Template = v1
		}
		t.OnSelected = p2.OnSelected or v7.OnButtonSelected
		t.OnDeselected = p2.OnDeselected or v7.OnButtonDeselected
		local v5 = v2.AddComponent("MobileControlButton", v3.Merge(p2, t))
		t2[p2.Name] = v5
		if t3[p2.Name] then
			t3[p2.Name](v5)
		end
		return v5
	end
	if v10 then
		return createMobileControlButton()
	end
	if not v5.IsMobileInputType() then
		return
	end
	v11:Wait()
	return createMobileControlButton()
end
function t.RemoveControl(p1, p2) --[[ RemoveControl | Line: 85 | Upvalues: t2 (copy) ]]
	if t2[p2] then
		t2[p2]:Destroy()
		t2[p2] = nil
	else
		warn("\226\154\160\239\184\143 MobileControl, Control with name \'" .. p2 .. "\' not found!")
	end
end
function t.Init(p1) --[[ Init | Line: 95 | Upvalues: v2 (copy), v8 (copy), v9 (ref), v1 (copy), PlayerGui (copy), v12 (ref), v7 (copy), v10 (ref), v11 (copy) ]]
	v2.AddComponent("GuiScreen", {
		Name = "MobileControls",
		Tag = "GuiScreen_MobileControls",
		TweenStyle = false,
		ClosePosition = "Right",
		Groups = { "HUD" },
		CanOpen = function() --[[ CanOpen | Line: 104 | Upvalues: v8 (ref) ]]
			return not v8.PlayerControlsLock:IsLocked()
		end,
		Changed = v8.PlayerControlsLock.Changed,
		Init = function(p1) --[[ Init | Line: 109 | Upvalues: v9 (ref), v1 (ref), PlayerGui (ref), v12 (ref), v7 (ref), v10 (ref), v11 (ref) ]]
			for v13, v2 in p1.Instance:GetChildren() do
				v2.Visible = false
			end
			v9 = p1.Instance
			v1.pathToChildAdded(PlayerGui, "TouchGui/TouchControlFrame/JumpButton", function(p12, p2) --[[ Line: 116 | Upvalues: v12 (ref), v7 (ref), p1 (copy), v10 (ref), v11 (ref) ]]
				v12 = p2
				local v1 = p2.TouchControlFrame:Clone()
				local JumpButton = v1.JumpButton
				local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
				UIAspectRatioConstraint.AspectRatio = 1
				UIAspectRatioConstraint.Parent = JumpButton
				JumpButton.AnchorPoint = Vector2.new(1, 1)
				JumpButton.Position = JumpButton.Position + UDim2.fromOffset(JumpButton.AbsoluteSize.X, JumpButton.AbsoluteSize.Y)
				JumpButton.Position = JumpButton.Position + (v7.ButtonContainerOffset or UDim2.fromOffset(0, 0))
				JumpButton.Size = JumpButton.Size + (v7.ButtonContainerPaddingSize or UDim2.fromScale(0, 0))
				JumpButton.ImageTransparency = 1
				JumpButton.Active = false
				JumpButton.Visible = true
				for k, v in pairs(v1:GetChildren()) do
					if v ~= JumpButton then
						v:Destroy()
					end
				end
				v1.Visible = true
				v1.Parent = p1.Instance
				v10 = JumpButton
				v11:Fire()
			end)
		end
	})
end
t:Init()
return t