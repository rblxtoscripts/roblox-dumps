-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ButtonTest")
local v2 = Sonar("FormatString")
local v3 = Sonar("Maid")
local v4 = Sonar("PermissionsService")
local v5 = Sonar("PlayerWrapper")
local v6 = Sonar("State")
local v7 = Sonar("TimeUtils")
local v8 = v5.GetClient()
local Stipend = Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("RewardsGuiNew").ContainerFrame.Menu.TabFrames.Stipend
local Default = Stipend.Content.ScrollingContainer.Content.Default
Default.Visible = false
local v9 = v3.new()
function t.Run(p1, p2) --[[ Run | Line: 37 | Upvalues: v9 (copy), v6 (copy), v7 (copy), v4 (copy), v8 (copy), Default (ref), v1 (copy), v2 (copy), Stipend (copy) ]]
	v9:DoCleaning()
	if not p2 then
		return
	end
	local v12 = v9:GiveTask(v6.fromProperty(v7.ValueBase, "Value"))
	for v22, v3 in v4.GetStipendSets() do
		local v42 = v8.PlayerData.PermissionStipend[v22]
		local v5 = v8.Player.Badges:FindFirstChild(v22) or v8.Player.Permissions:FindFirstChild(v22)
		if v5 then
			local v62 = v6.fromProperty(v5, "Value")
			local v72 = v6.fromProperty(v42, "Value")
			local v82 = v9:GiveTask(Default:Clone())
			v82.Icon.Image = v3.Image
			v9:GiveTask(v6.subscribeMulti({ v62, v72, v12 }, function(p1, p2) --[[ Line: 64 | Upvalues: v4 (ref), v7 (ref), v82 (ref) ]]
				if not p1 then
					v82.TimeLabel.Visible = false
					v82.Visible = false
					return
				end
				local v1 = p2 + v4.TimeToGiveStipend - v7.Get()
				v82.LayoutOrder = if v1 <= 0 then -1 else 0
				v82.TimeLabel.Text = if v1 <= 0 then "Claim" else v7.FormatString(v1)
				v82.TimeLabel.Visible = v1 > 0
				v82.Visible = true
			end))
			v9:GiveTask(v1.new(v82, {
				Click = function() --[[ Click | Line: 81 | Upvalues: v4 (ref), v22 (copy) ]]
					v4:ClaimStipend(v22)
				end
			}))
			v82.Content.RoleLabel.Text = string.upper((v2.separateWordsInString(v22)))
			v82.Name = v22
			v82.Parent = Stipend.Content.ScrollingContainer.Content
		end
	end
end
return t