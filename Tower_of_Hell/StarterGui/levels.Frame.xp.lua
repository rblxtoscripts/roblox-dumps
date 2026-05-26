-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local v1 = game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId)
v1:WaitForChild("levelsSpent")
local xpFormulas = require(game.ReplicatedStorage.Library.Modules.xpFormulas)
local colorFromId = require(game.ReplicatedStorage.Library.Utility.colorFromId)
script.Parent.xpBar.progress.BackgroundColor3 = colorFromId(game.Players.LocalPlayer.UserId)
function awaitTween(p1) --[[ awaitTween | Line: 11 ]]
	local v1 = nil
	p1.Completed:Connect(function(p1) --[[ Line: 13 | Upvalues: v1 (ref) ]]
		v1 = p1
	end)
	p1:Play()
	while not v1 do
		wait()
	end
	return v1
end
function update() --[[ update | Line: 21 | Upvalues: xpFormulas (copy), v1 (copy), TweenService (copy) ]]
	local v12 = xpFormulas.getLevel(script.Parent.lastXp.Value)
	local v2 = xpFormulas.getLevel(v1.xp.Value)
	local v3 = xpFormulas.getRequiredXp(v2 + 1)
	local v4 = v1.xp.Value - xpFormulas.getTotalRequiredXp(v2)
	script.Parent.forceopen.Value = true
	script.Parent.xpBar.Visible = true
	if awaitTween((TweenService:Create(script.Parent.xpBar, TweenInfo.new(0.5), {
		Size = UDim2.new(UDim.new(1, 0), script.Parent.xpBar.Size.Y)
	}))) == Enum.PlaybackState.Cancelled then
		return
	end
	for i = v12 + 1, v2 do
		awaitTween((TweenService:Create(script.Parent.xpBar.progress, TweenInfo.new(2 / (v2 - i + 1), Enum.EasingStyle.Linear), {
			Size = UDim2.new(1, 0, 0.5, 0)
		})))
		script.Parent.level.level.Text = "Level " .. i
		script.Parent.xpBar.progress.Size = UDim2.new(0, 0, 0.5, 0)
	end
	script.Parent.level.level.Text = "Level " .. v2
	awaitTween(TweenService:Create(script.Parent.xpBar.progress, TweenInfo.new(2, Enum.EasingStyle.Linear), {
		Size = UDim2.new(v4 / v3, 0, 0.5, 0)
	}))
	local v7 = v2 - v1.levelsSpent.Value
	script.Parent.level.unspent.Text = v7 .. " Skill Points unspent"
	script.Parent.level.unspent.Visible = v7 ~= 0
	script.Parent.lastXp.Value = v1.xp.Value
	wait(0.5)
	script.Parent.forceopen.Value = false
	if script.Parent.open.Value then
		return
	end
	local v9 = TweenService:Create(script.Parent.xpBar, TweenInfo.new(0.5), {
		Size = UDim2.new(UDim.new(0, 0), script.Parent.xpBar.Size.Y)
	})
	v9:Play()
	if awaitTween(v9) ~= Enum.PlaybackState.Completed then
		return
	end
	script.Parent.xpBar.Visible = false
end
v1.xp.Changed:Connect(update)
v1.levelsSpent.Changed:Connect(function() --[[ Line: 63 | Upvalues: xpFormulas (copy), v1 (copy) ]]
	local v12 = xpFormulas.getLevel(v1.xp.Value) - v1.levelsSpent.Value
	script.Parent.level.unspent.Text = v12 .. " Skill Points unspent"
	script.Parent.level.unspent.Visible = v12 ~= 0
end)
update()