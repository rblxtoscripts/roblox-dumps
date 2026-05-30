-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local t = {}
function shineAnimation(p1) --[[ shineAnimation | Line: 4 | Upvalues: t (copy), TweenService (copy) ]]
	t[p1] = true
	local UIGradient = p1.UIGradient
	local v1 = TweenService:Create(UIGradient, TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out), {
		Offset = Vector2.new(1, 0)
	})
	local v2 = Vector2.new(-1, 0)
	UIGradient.Offset = v2
	repeat
		v1:Play()
		v1.Completed:Wait()
		UIGradient.Offset = v2
		v1:Play()
		v1.Completed:Wait()
		UIGradient.Offset = v2
		wait(2.5)
	until not (p1 and p1.Parent)
	t[p1] = nil
end
function findShines(p1) --[[ findShines | Line: 24 | Upvalues: t (copy) ]]
	local tbl = {}
	if p1 then
		if p1.Name == "Shine" then
			table.insert(tbl, p1)
		elseif p1:FindFirstChild("Shine") then
			table.insert(tbl, p1.Shine)
		end
	else
		for k, v in pairs(script.Parent:GetDescendants()) do
			if v.Name == "Shine" then
				table.insert(tbl, v)
			end
		end
	end
	for k, v in pairs(tbl) do
		if not (t[v] or v.Parent and v.Parent:IsA("Script")) and v:IsA("ImageLabel") then
			task.spawn(shineAnimation, v)
		end
	end
end
task.spawn(findShines)
script.Event.Event:Connect(findShines)