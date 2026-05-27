-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ItemDataService")
local v2 = Sonar("ItemDisplayCreator")
local v3 = Sonar("FormatNumber")
local v4 = Sonar("GuiManager")
local v5 = Sonar("Maid")
function t.new(p1) --[[ new | Line: 12 | Upvalues: v5 (copy), v1 (copy), v2 (copy), v3 (copy), v4 (copy) ]]
	local v12 = v5.new()
	local Frame = p1.Frame
	if not Frame then
		return v12
	end
	local v22 = p1.Template or Frame:FindFirstChild("ImageLabel")
	if not v22 then
		return v12
	end
	v22.Visible = false
	local Items = p1.Items
	if not Items then
		return v12
	end
	local UIPageLayout = Frame:FindFirstChildOfClass("UIPageLayout")
	if not UIPageLayout then
		return v12
	end
	local ContainerFrame = p1.ContainerFrame
	local ReverseDirection = p1.ReverseDirection
	local v32 = p1.PageChangeTime or 3
	local t = {}
	for v42, v52 in Items do
		local v6 = v1.GetByName(v42)
		if v6 then
			local v7 = v22:Clone()
			v7.Visible = true
			v7.Parent = Frame
			v12:GiveTask(v2:Create({
				Viewport = v7:FindFirstChild("Viewport") or v7:FindFirstChild("Icon") or v7,
				Item = v6
			}))
			local AmountLabel = v7:FindFirstChild("AmountLabel")
			if AmountLabel then
				AmountLabel.Text = "x" .. v3.splice(v52)
				AmountLabel.Visible = true
			end
			table.insert(t, v7)
			v12:GiveTask(v7)
		end
	end
	local v9 = #t
	if v9 <= 1 then
		return v12
	end
	local v10 = ReverseDirection and v9 - 1 or 0
	local function NextPage() --[[ NextPage | Line: 75 | Upvalues: ReverseDirection (copy), v10 (ref), v9 (copy), UIPageLayout (copy) ]]
		if ReverseDirection then
			v10 = v10 - 1
			if v10 < 0 then
				v10 = v9 - 1
			end
		else
			v10 = (v10 + 1) % v9
		end
		UIPageLayout:JumpToIndex(v10)
	end
	local v11 = v5.new()
	v12:GiveTask(v11)
	if ContainerFrame then
		local function ScreenStateChanged() --[[ ScreenStateChanged | Line: 91 | Upvalues: v11 (copy), v4 (ref), ContainerFrame (copy), v32 (copy), ReverseDirection (copy), v10 (ref), v9 (copy), UIPageLayout (copy) ]]
			v11:DoCleaning()
			if not v4.IsFrameOpen(ContainerFrame) then
				return
			end
			v11:GiveTask(task.spawn(function() --[[ Line: 94 | Upvalues: v32 (ref), ReverseDirection (ref), v10 (ref), v9 (ref), UIPageLayout (ref) ]]
				while true do
					task.wait(v32)
					if ReverseDirection then
						v10 = v10 - 1
						if v10 < 0 then
							v10 = v9 - 1
						end
					else
						v10 = (v10 + 1) % v9
					end
					UIPageLayout:JumpToIndex(v10)
				end
			end))
		end
		v11:GiveTask(ContainerFrame:GetPropertyChangedSignal("Visible"):Connect(ScreenStateChanged))
		ScreenStateChanged()
	else
		v11:GiveTask(task.spawn(function() --[[ Line: 106 | Upvalues: v32 (copy), ReverseDirection (copy), v10 (ref), v9 (copy), UIPageLayout (copy) ]]
			while true do
				task.wait(v32)
				if ReverseDirection then
					v10 = v10 - 1
					if v10 < 0 then
						v10 = v9 - 1
					end
				else
					v10 = (v10 + 1) % v9
				end
				UIPageLayout:JumpToIndex(v10)
			end
		end))
	end
	return v12
end
return t