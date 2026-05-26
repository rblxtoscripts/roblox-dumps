-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CurrentCamera = workspace.CurrentCamera
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("DisplayUtils")
local v3 = Sonar("FormatString")
local v4 = Sonar("Button")
local v5 = Sonar("PlayerUtils")
local v6 = Sonar("ItemDisplayCreator")
local v7 = Sonar("Table")
local v8 = Sonar("Constants")
local ToolTipFrame = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("ToolTipGui"):WaitForChild("ToolTipFrame")
local v9 = tick()
local v10 = nil
local v11 = v1.new()
local t2 = {
	HorseOwnerInfo = function(p1, p2, p3) --[[ HorseOwnerInfo | Line: 36 | Upvalues: v3 (copy), v5 (copy) ]]
		p2.Content.IDLabel.Text = p3.Serial.Value
		local v1 = v3.splitStringAndGetPart(p3.Serial.Value, ":", 1)
		local v2 = if v1 then "@" .. v5.GetUserNameFromUserId(v1) else v1
		p2.Content.OwnerLabel.Text = if v2 and #v2 > 0 then v2 else "ERROR"
	end,
	SkillHelp = function(p1, p2, p3) --[[ SkillHelp | Line: 43 ]]
		p2.Content.NameLabel.Text = p3.Name .. " Skill"
		p2.Content.Description.Text = p3.Description
	end,
	IconDescription = function(p1, p2, p3) --[[ IconDescription | Line: 47 ]]
		p2.Menu.Description.Text = p3.Description or "Some description of something goes here!"
		p2.Menu.NameLabel.Text = p3.Name
		p2.Menu.Icon.Image = p3.Image
	end,
	ItemDescription = function(p1, p2, p3) --[[ ItemDescription | Line: 53 | Upvalues: v2 (copy), v6 (copy) ]]
		p2.Menu.Description.Text = p3.Description or "Some description of something goes here!"
		p2.Menu.NameLabel.Text = v2.GetDisplayName(p3.Name, p3)
		p1:GiveTask(v6:Create({
			Viewport = p2.Menu.Icon,
			Item = p3
		}))
	end,
	StatusDescription = function(p1, p2, p3, p4) --[[ StatusDescription | Line: 62 | Upvalues: v7 (copy), v8 (copy), v2 (copy), v6 (copy) ]]
		if p4 then
			local v1 = v7.Count(p4)
			local count = 0
			local v22 = ""
			for k, v in pairs(p4) do
				count = count + 1
				local v3 = v8.ModifierStats[k]
				if v3 then
					v22 = v22 .. v3.Format(v) .. " " .. v2.GetDisplayName(v3.Name, v3)
					if count ~= v1 then
						v22 = v22 .. "\n"
					end
				end
			end
			p2.Menu.Description.Text = v22
		else
			p2.Menu.Description.Text = p3.Description or "Some description of something goes here!"
		end
		p2.Menu.NameLabel.Text = v2.GetDisplayName(p3.Name, p3)
		p1:GiveTask(v6:Create({
			Viewport = p2.Menu.Icon,
			Item = p3
		}))
	end,
	MinimapNode = function(p1, p2, p3) --[[ MinimapNode | Line: 90 ]]
		p2.Menu.Description.Text = p3.Description or ""
		p2.Menu.NameLabel.Text = p3.Name
	end,
	DailyLoginReward = function(p1, p2, p3) --[[ DailyLoginReward | Line: 94 ]]
		p2.Content.NameLabel.Text = "Reward"
		p2.Content.Description.Text = p3.Description or "A horse with a unique theme."
	end
}
local function getTipType(p1) --[[ getTipType | Line: 101 ]]
	if type(p1) == "function" then
		return p1()
	else
		return p1
	end
end
local function getCreateFunction(p1, p2) --[[ getCreateFunction | Line: 109 | Upvalues: t2 (copy) ]]
	local v1 = if p2 and type(p2) == "function" then p2() else p2
	return type(t2[p1]) == "table" and t2[p1][v1] or t2[p1]
end
local function v12(p1) --[[ isActuallyVisible | Line: 116 | Upvalues: UserInputService (copy), v12 (copy) ]]
	if UserInputService:GetFocusedTextBox() then
		return
	end
	if p1 == nil then
		return false
	end
	if p1.ClassName == "PlayerGui" then
		return true
	end
	if p1:IsA("LayerCollector") and p1.Enabled then
		return v12(p1.Parent)
	end
	if p1:IsA("GuiObject") and p1.Visible then
		return v12(p1.Parent)
	else
		return false
	end
end
function t.AddToolTip(p1, p2, p3) --[[ AddToolTip | Line: 125 | Upvalues: t2 (copy) ]]
	t2[p2] = p3
end
function t.CreateToolTip(p1, p2) --[[ CreateToolTip | Line: 130 | Upvalues: v10 (ref), t (copy), v9 (ref), ToolTipFrame (copy), t2 (copy), v11 (copy), v4 (copy), CurrentCamera (copy), RunService (copy), v12 (copy) ]]
	if v10 and v10.GuiObject == p2.GuiObject then
		t:RemoveToolTip()
		return
	end
	t:RemoveToolTip()
	v10 = p2
	local v1 = tick()
	v9 = v1
	local ActiveTip = ToolTipFrame[p2.Type]:Clone()
	ActiveTip.Name = "ActiveTip"
	ActiveTip.Visible = false
	ActiveTip.Position = UDim2.new(2, 0, 2, 0)
	ActiveTip.Parent = ToolTipFrame
	local Type = p2.Type
	local SubType = p2.SubType
	local v3 = SubType and (if type(SubType) == "function" then SubType() else SubType)
	ActiveTip.Size = (type(t2[Type]) == "table" and t2[Type][v3] or t2[Type])(v11, ActiveTip, table.unpack({ p2.Get() })) or ActiveTip.Size
	if ActiveTip:IsA("ImageButton") and not p2.BackgroundNoClose then
		v11:GiveTask(v4.new(ActiveTip, {
			Click = function() --[[ Click | Line: 152 | Upvalues: t (ref) ]]
				t:RemoveToolTip()
			end
		}))
	end
	local v8 = p2.Attach or p2.GuiObject
	local Size = ActiveTip.Size
	local function updateFramePosition() --[[ updateFramePosition | Line: 160 | Upvalues: CurrentCamera (ref), ActiveTip (copy), Size (copy), p2 (copy), v8 (copy) ]]
		local v1 = CurrentCamera.ViewportSize.X / 1931
		ActiveTip.Size = UDim2.new(0, Size.X.Offset * v1, 0, Size.Y.Offset * v1)
		local v2 = if p2.Offset then v8.AbsolutePosition + Vector2.new(p2.GuiObject.AbsoluteSize.X * p2.Offset.X, p2.GuiObject.AbsoluteSize.Y * p2.Offset.Y) elseif v8.AbsolutePosition then v8.AbsolutePosition - Vector2.new(10, 0) - Vector2.new(ActiveTip.AbsoluteSize.X / 2, -ActiveTip.AbsoluteSize.Y / 4) else v8
		ActiveTip.Position = UDim2.new(0, v2.X, 0, v2.Y)
	end
	v11:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 178 | Upvalues: ActiveTip (copy), v12 (ref), p2 (copy), v9 (ref), v1 (copy), t (ref), updateFramePosition (copy) ]]
		if ActiveTip and (ActiveTip.Parent and (v12(p2.GuiObject) and v9 == v1)) then
			updateFramePosition()
		else
			t:RemoveToolTip()
		end
	end))
	if not (p2.GuiObject and p2.GuiObject.Parent:IsA("ScrollingFrame")) then
		v11:GiveTask(ActiveTip)
		p2.TipFrame = ActiveTip
		updateFramePosition()
		ActiveTip.Visible = true
		return
	end
	v11:GiveTask(p2.GuiObject:GetPropertyChangedSignal("AbsolutePosition"):Connect(function() --[[ Line: 188 | Upvalues: t (ref) ]]
		t:RemoveToolTip()
	end))
	v11:GiveTask(ActiveTip)
	p2.TipFrame = ActiveTip
	updateFramePosition()
	ActiveTip.Visible = true
end
function t.RemoveToolTip(p1) --[[ RemoveToolTip | Line: 202 | Upvalues: v11 (copy), v10 (ref), v9 (ref) ]]
	v11:DoCleaning()
	v10 = nil
	v9 = nil
end
function t.GetTip(p1) --[[ GetTip | Line: 208 | Upvalues: v10 (ref) ]]
	return v10
end
function t.Init(p1) --[[ Init | Line: 212 | Upvalues: ToolTipFrame (copy) ]]
	for k, v in pairs(ToolTipFrame:GetChildren()) do
		v.Visible = false
	end
end
t:Init()
return t