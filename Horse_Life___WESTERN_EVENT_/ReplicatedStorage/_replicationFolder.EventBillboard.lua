-- https://lua.expert/
local TimerGui = script:WaitForChild("TimerGui")
local t = {
	Western = {
		StudsOffsetWorldSpace = Vector3.new(0, -20, 0),
		Size = UDim2.new(20, 0, 10, 0),
		Children = {
			HeaderLabel = {
				Text = "COSTUME CONTEST",
				Children = {
					UIGradient = {
						Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromHex("#ffaa00")), ColorSequenceKeypoint.new(1, Color3.fromHex("#ff0000")) })
					}
				}
			},
			SubHeader1 = {
				Children = {
					UIGradient = {
						Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
					},
					UIStroke = {
						Transparency = 0.35,
						Color = Color3.fromRGB(0, 0, 0)
					}
				}
			},
			SubHeader2 = {
				FontFace = Font.fromName("Fira-Sans", Enum.FontWeight.SemiBold, Enum.FontStyle.Italic),
				Children = {
					UIGradient = {
						Color = ColorSequence.new(Color3.fromRGB(255, 255, 255))
					},
					UIStroke = {
						Transparency = 0.35,
						Thickness = 1.5,
						Color = Color3.fromRGB(0, 0, 0)
					}
				}
			}
		}
	}
}
local t2 = {}
t2.__index = t2
function t2.UpdateHeader(p1, p2) --[[ UpdateHeader | Line: 51 ]]
	p1.HeaderLabel.Text = p2
end
function t2.SetHeaderGradient(p1, p2) --[[ SetHeaderGradient | Line: 55 ]]
	p1.HeaderGradient.Color = p2
end
function t2.UpdateFooter(p1, p2) --[[ UpdateFooter | Line: 59 ]]
	p1.SubHeader1.Text = p2
end
function t2.UpdateFooter2(p1, p2) --[[ UpdateFooter2 | Line: 63 ]]
	p1.SubHeader2.Text = p2
end
function t2.UpdateImage(p1, p2) --[[ UpdateImage | Line: 67 ]]
	p1.ImageLabel.Visible = p2
	local v1 = p2 or ""
	p1.ImageLabel.Image = v1
	p1.ImageLabel.ImageLabel.Image = v1
end
function t2.SetOffset(p1, p2) --[[ SetOffset | Line: 75 ]]
	p1.GuiRoot.StudsOffsetWorldSpace = p2
end
function t2.Enable(p1) --[[ Enable | Line: 79 ]]
	p1.GuiRoot.Enabled = true
end
function t2.Disable(p1) --[[ Disable | Line: 83 ]]
	p1.GuiRoot.Enabled = false
end
function t2.CreateUI(p1) --[[ CreateUI | Line: 87 | Upvalues: TimerGui (copy) ]]
	local v1 = TimerGui:Clone()
	p1.HeaderLabel = v1.HeaderLabel
	p1.HeaderGradient = p1.HeaderLabel.UIGradient
	p1.SubHeader1 = v1.SubHeader1
	p1.ImageLabel = p1.SubHeader1.ImageLabel
	p1.SubHeader2 = v1.SubHeader2
	v1.Parent = p1.RootPart
	return v1
end
function t2.SetTheme(p1, p2) --[[ SetTheme | Line: 102 | Upvalues: t (copy) ]]
	local v1 = t[p2]
	if not v1 then
		warn((("there\'s no preset theme named: %*"):format(p2)))
		return
	end
	local GuiRoot = p1.GuiRoot
	if GuiRoot then
		local function v2(p1, p2) --[[ applyTheme | Line: 113 | Upvalues: v2 (copy) ]]
			for v1, v22 in next, p2 do
				if v1 == "Children" then
					for v3, v4 in next, v22 do
						local v5 = p1:FindFirstChild(v3)
						if v5 then
							v2(v5, v4)
							continue
						end
						warn((("theme child not found: %* on %*"):format(v3, (p1:GetFullName()))))
					end
					continue
				end
				p1[v1] = v22
			end
		end
		v2(GuiRoot, v1)
	else
		warn("attempt to apply theme before creating UI")
	end
end
function t2.new(p1) --[[ new | Line: 132 | Upvalues: t2 (copy) ]]
	local v2 = setmetatable({}, t2)
	if p1:IsA("Model") then
		v2.RootPart = p1.PrimaryPart
	else
		v2.RootPart = p1
	end
	v2.GuiRoot = v2:CreateUI()
	return v2
end
function t2.Destroy(p1) --[[ Destroy | Line: 146 ]]
	p1.GuiRoot:Destroy()
	setmetatable(p1, nil)
end
return t2