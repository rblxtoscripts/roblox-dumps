-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
Library:Load("Utility")
local v1 = Library:Load("Maid")
local t = {}
require(script:WaitForChild("Tab"))
local UIEvents = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("UIEvents")
t.__index = t
local v2 = Color3.fromRGB(221, 207, 185)
local v3 = Color3.fromRGB(192, 179, 160)
function t.new(p1, p2, p3) --[[ new | Line: 18 | Upvalues: t (copy), v1 (copy) ]]
	local t2 = {}
	setmetatable(t2, t)
	t2.Tabs = {}
	t2.Object = p1
	t2.Type = "TabGroup"
	t2.WindowData = p2
	t2.SelectedTab = nil
	t2.NoStyleChange = p3 or false
	t2.Maid = v1.new()
	t2:Refresh()
	t2:SelectTab(t2.Tabs[1])
	if _G.GamepadEnabled then
		p1.Right.Visible = true
		p1.Left.Visible = true
		local v2 = 1
		local function BumperPressed(p1) --[[ BumperPressed | Line: 47 | Upvalues: v2 (ref), t2 (copy) ]]
			local v1 = v2 + p1
			if t2.Tabs[v1] then
				t2:SelectTab(t2.Tabs[v1])
				v2 = v1
				return
			end
			if v1 <= 0 then
				t2:SelectTab(t2.Tabs[#t2.Tabs])
				v2 = #t2.Tabs
				return
			end
			if not (#t2.Tabs < v1) then
				return
			end
			t2:SelectTab(t2.Tabs[1])
			v2 = 1
		end
		p2:RegisterGamepadAction(Enum.KeyCode.ButtonL1, function(p1, p2, p3) --[[ Line: 68 | Upvalues: BumperPressed (copy) ]]
			if p2 ~= Enum.UserInputState.Begin then
				return
			end
			BumperPressed(-1)
		end)
		p2:RegisterGamepadAction(Enum.KeyCode.ButtonR1, function(p1, p2, p3) --[[ Line: 74 | Upvalues: BumperPressed (copy) ]]
			if p2 ~= Enum.UserInputState.Begin then
				return
			end
			BumperPressed(1)
		end)
	end
	return t2
end
function t.Refresh(p1) --[[ Refresh | Line: 85 | Upvalues: v2 (copy), v3 (copy) ]]
	p1.Maid:DoCleaning()
	p1.Tabs = {}
	local v1 = p1.Object:FindFirstChild("TabButtons") or p1.Object
	local v22 = #v1:GetChildren()
	for i, v in ipairs(v1:GetChildren()) do
		if v:IsA("TextButton") or v:IsA("ImageButton") then
			local LayoutOrder = v.LayoutOrder
			local v32 = v2:Lerp(v3, LayoutOrder / v22)
			v:SetAttribute("DeselectedColor", v32)
			v:SetAttribute("ZIndex", v.ZIndex)
			if not p1.NoStyleChange then
				v.BackgroundColor3 = v32
				v.ZIndex = 20 - LayoutOrder
			end
			table.insert(p1.Tabs, v)
			p1.Maid[v] = v.MouseButton1Click:Connect(function() --[[ Line: 102 | Upvalues: p1 (copy), v (copy) ]]
				p1:SelectTab(v)
			end)
		end
	end
	table.sort(p1.Tabs, function(p1, p2) --[[ Line: 110 ]]
		return p1.LayoutOrder < p2.LayoutOrder
	end)
end
function t.SelectTab(p1, p2) --[[ SelectTab | Line: 116 | Upvalues: UIEvents (copy) ]]
	local SelectedTab = p1.SelectedTab
	p1.SelectedTab = p2
	if not p1.NoStyleChange then
		if SelectedTab then
			SelectedTab.BackgroundColor3 = SelectedTab:GetAttribute("DeselectedColor")
			SelectedTab.ZIndex = SelectedTab:GetAttribute("ZIndex")
			SelectedTab.AutoButtonColor = true
		end
		p2.ZIndex = 20
		p2.AutoButtonColor = false
		p2.BackgroundColor3 = Color3.fromRGB(254, 239, 212)
	end
	UIEvents.TabChanged:Fire(p1.WindowData.Object, p2, SelectedTab)
end
function t.SetConsoleSize(p1, p2) --[[ SetConsoleSize | Line: 150 ]]
	if not _G.GamepadEnabled then
		return
	end
	p1.Object.Size = p2
end
function t.SetFirstTabPressed(p1, p2) --[[ SetFirstTabPressed | Line: 171 ]]
	p1:SelectTab(p2)
end
return t