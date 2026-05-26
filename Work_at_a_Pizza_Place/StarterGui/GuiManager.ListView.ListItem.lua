-- https://lua.expert/
require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local t = {}
require(game.ReplicatedStorage:WaitForChild("Enums"))
require(game.ReplicatedStorage:WaitForChild("Dialog"))
local LocalPlayer = game.Players.LocalPlayer
game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("UIEvents")
t.__index = t
function t.new(p1, p2) --[[ new | Line: 15 | Upvalues: t (copy) ]]
	local t2 = {}
	setmetatable(t2, t)
	t2.Object = nil
	t2.Type = "ListItem"
	t2.WindowData = p2
	t2.CurrenTemplate = nil
	t2.ItemData = nil
	t2.Position = nil
	t2.Selected = false
	t2.ListView = p1
	t2.Disabled = false
	t2.Events = {}
	t2.ButtonEvents = {}
	return t2
end
function t.SetTemplate(p1, p2) --[[ SetTemplate | Line: 39 ]]
	if p2 == p1.CurrentTemplate then
		return
	end
	p1.CurrentTemplate = p2
	if p1.Object then
		p1.Object:Destroy()
	end
	local v1 = p2:clone()
	v1.Parent = p1.ListView.Object
	p1.Object = v1
	if p1.Object:IsA("GuiButton") then
		table.insert(p1.Events, v1.MouseButton1Click:connect(function() --[[ Line: 58 | Upvalues: p1 (copy) ]]
			if p1.Disabled then
				print("DISABLED")
			else
				p1.ListView:SetSelection(p1)
			end
		end))
		return
	end
	for i, v in ipairs(p1.Object:GetDescendants()) do
		if v:IsA("GuiButton") then
			table.insert(p1.Events, v.MouseButton1Click:connect(function() --[[ Line: 68 | Upvalues: p1 (copy), v (copy) ]]
				if p1.Disabled then
					print("DISABLED")
				else
					p1.ListView:SetSelection(p1, v)
				end
			end))
		end
	end
end
function t.UpdateDisplay(p1, p2, p3, p4) --[[ UpdateDisplay | Line: 79 ]]
	p1.ItemData = p2
	p1.Object.Visible = true
	p4(p1, p1.Object, p2, p3)
end
function t.Delete(p1) --[[ Delete | Line: 91 ]]
	for i, v in ipairs(p1.Events) do
		v:disconnect()
	end
	p1.Events = {}
	if not p1.Object then
		return
	end
	p1.Object:Destroy()
end
function t.SetPosition(p1, p2) --[[ SetPosition | Line: 100 ]]
	p1.Object.Position = p2
	p1.Position = p2
end
function t.SetSelected(p1, p2) --[[ SetSelected | Line: 106 ]]
	if p1.Object:IsA("GuiButton") then
		if p1.Object:IsA("TextButton") and p1.Object.Style ~= Enum.ButtonStyle.Custom then
			if p2 then
				p1.Object.Style = Enum.ButtonStyle.RobloxRoundDefaultButton
			else
				p1.Object.Style = Enum.ButtonStyle.RobloxRoundButton
			end
		elseif p1.Object:IsA("ImageButton") then
			p1.Object.ImageColor3 = p2 and Color3.fromRGB(247, 169, 90) or Color3.fromRGB(148, 177, 186)
		end
	end
	p1.Selected = p2
end
return t