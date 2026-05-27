-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("StatBar")
local v3 = Sonar("ButtonTest")
local t = {}
t.__index = t
function t.new(p1) --[[ new | Line: 12 | Upvalues: t (copy), v1 (copy), v2 (copy), v3 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v1.new()
	local TemplateFrame = p1.TemplateFrame
	local v32 = p1.Parent
	if not (TemplateFrame and v32) then
		error("MissionFrame.new requires TemplateFrame and Parent")
	end
	v22.Frame = TemplateFrame:Clone()
	v22.Frame.Parent = v32
	if p1.Visible ~= nil then
		v22.Frame.Visible = p1.Visible
	end
	if p1.LayoutOrder then
		v22.Frame.LayoutOrder = p1.LayoutOrder
	end
	if p1.Name then
		v22.Frame.Name = p1.Name
	end
	if p1.ProgressBar then
		local ProgressBar = p1.ProgressBar
		local v4 = ProgressBar.Frame or v22.Frame:FindFirstChild("ProgressBar", true) or v22.Frame:FindFirstChild("Content", true) and v22.Frame.Content:FindFirstChild("ProgressBar", true)
		local v5 = if v4 then v4:FindFirstChild("Bar") or v4 else v4
		local v6 = ProgressBar.AmountLabel or (v22.Frame:FindFirstChild("ProgressLabel", true) or v22.Frame:FindFirstChild("Content", true) and v22.Frame.Content:FindFirstChild("ProgressLabel", true))
		if v5 then
			local t2 = {
				Frame = v5,
				AmountLabel = v6,
				TweenAmount = ProgressBar.TweenAmount or false,
				Clipped = ProgressBar.Clipped or false,
				Get = ProgressBar.Get,
				GetMax = ProgressBar.GetMax,
				GetText = ProgressBar.GetText
			}
			t2.Changed = ProgressBar.Changed or {}
			t2.OnChanged = ProgressBar.OnChanged
			v22.Maid:GiveTask(v2.new(t2))
		end
	end
	if p1.Description then
		local Description = p1.Description
		local v8 = Description.Label or v22.Frame:FindFirstChild("DescriptionLabel", true) or v22.Frame:FindFirstChild("QuestDescription", true) or v22.Frame:FindFirstChild("Content", true) and v22.Frame.Content:FindFirstChild("DescriptionLabel", true) or v22.Frame:FindFirstChild("Content", true) and v22.Frame.Content:FindFirstChild("QuestDescription", true)
		if v8 then
			local function updateDescription() --[[ updateDescription | Line: 80 | Upvalues: Description (copy), v8 (copy) ]]
				local v1 = Description.GetText and Description.GetText() or Description.Text
				if not v1 then
					return
				end
				v8.Text = v1
			end
			if Description.Changed then
				for v9, v10 in Description.Changed do
					v22.Maid:GiveTask(v10:Connect(updateDescription))
				end
			end
			local v11 = Description.GetText and Description.GetText() or Description.Text
			if v11 then
				v8.Text = v11
			end
		end
	end
	if p1.ClaimButton then
		local ClaimButton = p1.ClaimButton
		local v122 = ClaimButton.Button or v22.Frame:FindFirstChild("ClaimButton", true) or v22.Frame:FindFirstChild("Content", true) and v22.Frame.Content:FindFirstChild("ClaimButton", true)
		if v122 then
			if ClaimButton.Click then
				v22.Maid:GiveTask(v3.new(v122, {
					Click = ClaimButton.Click
				}))
			end
			if ClaimButton.VisibleChanged then
				local function updateVisibility() --[[ updateVisibility | Line: 114 | Upvalues: ClaimButton (copy), v122 (copy) ]]
					local v1 = ClaimButton.GetVisible and ClaimButton.GetVisible()
					if v1 == nil then
						return
					end
					v122.Visible = v1
				end
				for v13, v14 in ClaimButton.VisibleChanged do
					v22.Maid:GiveTask(v14:Connect(updateVisibility))
				end
				local v15 = ClaimButton.GetVisible and ClaimButton.GetVisible()
				if v15 ~= nil then
					v122.Visible = v15
				end
			end
		end
	end
	if p1.Locked then
		local Locked = p1.Locked
		local v16 = Locked.Frame or v22.Frame:FindFirstChild("Locked", true) or v22.Frame:FindFirstChild("Content", true) and v22.Frame.Content:FindFirstChild("Locked", true)
		if v16 then
			local function updateLocked() --[[ updateLocked | Line: 138 | Upvalues: Locked (copy), v16 (copy) ]]
				local v1 = Locked.GetLocked and Locked.GetLocked()
				if v1 == nil then
					return
				end
				v16.Visible = v1
			end
			if Locked.Changed then
				for v17, v18 in Locked.Changed do
					v22.Maid:GiveTask(v18:Connect(updateLocked))
				end
			end
			local v19 = Locked.GetLocked and Locked.GetLocked()
			if v19 ~= nil then
				v16.Visible = v19
			end
		end
	end
	if p1.OnInit then
		p1.OnInit(v22)
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 162 ]]
	p1.Maid:Destroy()
	if p1.Frame then
		p1.Frame:Destroy()
	end
	setmetatable(p1, nil)
end
return t