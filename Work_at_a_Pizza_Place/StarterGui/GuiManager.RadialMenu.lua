-- https://lua.expert/
require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local t = {}
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
require(game.ReplicatedStorage:WaitForChild("Enums"))
PlayerGui:WaitForChild("UIEvents")
game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
t.__index = t
local t2 = {
	{ 180, 120 },
	{ 120, 60 },
	{ 60, 0 },
	{ 0, -60 },
	{ -60, -120 },
	{ -120, -180 }
}
function t.new(p1, p2) --[[ new | Line: 15 | Upvalues: t (copy) ]]
	local t2 = {}
	setmetatable(t2, t)
	t2.Object = p1
	t2.Type = "RadialMenu"
	t2.WindowData = p2:GetWindowDataByName(p1.Name)
	t2.Options = nil
	t2.SelectionMode = false
	t2.Selection = nil
	t2.HighlightedIndex = nil
	t2.UnselectedNodes = {
		p1:WaitForChild("TopLeft"),
		p1:WaitForChild("Top"),
		p1:WaitForChild("TopRight"),
		p1:WaitForChild("BottomRight"),
		p1:WaitForChild("Bottom"),
		p1:WaitForChild("BottomLeft")
	}
	t2.SelectedNodes = {
		p1:WaitForChild("TopLeftSelected"),
		p1:WaitForChild("TopSelected"),
		p1:WaitForChild("TopRightSelected"),
		p1:WaitForChild("BottomRightSelected"),
		p1:WaitForChild("BottomSelected"),
		p1:WaitForChild("BottomLeftSelected")
	}
	return t2
end
function t.GetSelection(p1) --[[ GetSelection | Line: 36 | Upvalues: t2 (copy), ContextActionService (copy) ]]
	local v1 = nil
	local v2 = nil
	local v3 = nil
	local v4 = nil
	p1.Object.RadialLabel.Visible = false
	local function ThumbstickMoved(p12, p2, p3) --[[ ThumbstickMoved | Line: 41 | Upvalues: v1 (ref), v2 (ref), v3 (ref), v4 (ref), p1 (copy), t2 (ref) ]]
		v1 = p3.Position.X
		v2 = p3.Position.Y
		if not (math.sqrt(math.pow(v1, 2) + math.pow(v2, 2)) > 0.7) then
			return
		end
		v3 = math.deg((math.atan2(v2, v1)))
		v4 = p1.HighlightedIndex
		for i, v in ipairs(t2) do
			if v3 > v[2] and (v3 < v[1] and i ~= v4) then
				if v4 then
					p1.SelectedNodes[v4].Visible = false
					p1.UnselectedNodes[v4].Visible = true
				end
				p1.SelectedNodes[i].Visible = true
				p1.UnselectedNodes[i].Visible = false
				p1.Object.RadialLabel.Visible = true
				local v7 = p1.Options[i]
				p1.Object.RadialLabel.Text = if v7 == "PetPanel" then "Pets" elseif v7 == "Catalog" then "Shop" elseif v7 == "AvatarEditor" then "Avatar" else v7
				p1.Object.RadialLabel.Text = v7
				p1.HighlightedIndex = i
			end
		end
	end
	local function Thumbstick2Moved(p1, p2, p3) --[[ Thumbstick2Moved | Line: 69 ]] end
	local function AButtonPressed(p12, p2, p3) --[[ AButtonPressed | Line: 72 | Upvalues: p1 (copy) ]]
		if p2 ~= Enum.UserInputState.End or not p1.HighlightedIndex then
			return
		end
		p1.Selection = p1.Options[p1.HighlightedIndex]
		p1.SelectionMode = false
	end
	local function BButtonPressed(p12, p2, p3) --[[ BButtonPressed | Line: 79 | Upvalues: p1 (copy) ]]
		if p2 ~= Enum.UserInputState.Begin then
			return
		end
		p1.SelectionMode = false
	end
	ContextActionService:BindAction("ThumbstickMoved", ThumbstickMoved, false, Enum.KeyCode.Thumbstick1)
	ContextActionService:BindAction("Thumbstick2Moved", Thumbstick2Moved, false, Enum.KeyCode.Thumbstick2)
	ContextActionService:BindAction("AButton", AButtonPressed, false, Enum.KeyCode.ButtonA)
	ContextActionService:BindAction("BButton", BButtonPressed, false, Enum.KeyCode.ButtonB)
	p1.Selection = nil
	p1.SelectionMode = true
	while p1.SelectionMode do
		wait(0.1)
	end
	p1.WindowData:SetVisible(false)
	p1:CancelSelection()
	return p1.Selection
end
function t.SetOptions(p1, p2) --[[ SetOptions | Line: 105 ]]
	p1.Options = p2
end
function t.CancelSelection(p1) --[[ CancelSelection | Line: 109 | Upvalues: ContextActionService (copy) ]]
	p1.SelectionMode = false
	ContextActionService:UnbindAction("ThumbstickMoved")
	ContextActionService:UnbindAction("Thumbstick2Moved")
	ContextActionService:UnbindAction("BButton")
	ContextActionService:UnbindAction("AButton")
end
return t