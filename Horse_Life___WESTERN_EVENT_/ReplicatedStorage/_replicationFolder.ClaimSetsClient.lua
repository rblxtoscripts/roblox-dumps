-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("AnimalRiggerService")
local v2 = Sonar("AnimalCosmetics")
local v3 = Sonar("ItemSetService")
local v4 = Sonar("RemoteUtils")
local v5 = Sonar("PromptClient")
local v6 = Sonar("ItemDataService")
local v7 = Sonar("ItemGridButton")
local v8 = Sonar("Button")
local v9 = Sonar("ToolTipClient")
local v10 = Sonar("PlayerWrapper").GetClient()
function t.PromptFromJoin() --[[ PromptFromJoin | Line: 21 | Upvalues: v3 (copy), v10 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy), v1 (copy), v2 (copy), v4 (copy) ]]
	local v12 = v3.GetClaimableSetsFromJoin(v10)
	if not next(v12) then
		return
	end
	for k, v in pairs(v12) do
		v5.Prompt({
			KeepVisible = true,
			Type = "ClaimItemSet",
			Setup = function(p1, p2) --[[ Setup | Line: 28 | Upvalues: v (copy), v6 (ref), v7 (ref), v8 (ref), v9 (ref), v10 (ref), v3 (ref), v1 (ref), v2 (ref) ]]
				p1.Content.Label.Text = v.Text
				if v.CanDecline then
					p1.Content.ButtonContainer.CancelButton.Visible = true
				else
					p1.Content.ButtonContainer.CancelButton.Visible = false
				end
				for k, v4 in pairs({ v.Items, v.ExtraItems }) do
					for k2, v5 in pairs(v4) do
						if v6.GetByName(k2) then
							local v12 = v7.new({
								ForceVisible = true,
								Item = v6.GetByName(k2),
								ParentFrame = p1.Content.Items.Content.Content,
								GetAmount = function() --[[ GetAmount | Line: 45 | Upvalues: v5 (copy) ]]
									local v2
									if typeof(v5) == "table" then
										v2 = v5.Amount
										if not v2 then
											return 1
										end
									else
										v2 = v5
									end
									return v2
								end
							})
							v12.Frame.Name = tick()
							v12:GiveTask(v8.new(v12.Frame, {
								Click = function() --[[ Click | Line: 51 | Upvalues: k2 (copy), v9 (ref), v12 (copy), v6 (ref) ]]
									if k2 ~= "Coins" then
										v9:CreateToolTip({
											Type = "ItemDescription",
											Offset = Vector2.new(0.65, 0.5),
											GuiObject = v12.Frame,
											Get = function() --[[ Get | Line: 57 | Upvalues: v6 (ref), k2 (ref) ]]
												return v6.GetByName(k2)
											end
										})
									end
								end
							}))
							p2.Maid:GiveTask(v12)
						end
					end
				end
				if v.ExtraItems then
					for v22, v32 in v.ExtraItems do
						local v4 = p1.Content.Items.Content.Content:FindFirstChild(v22)
						if v4 then
							local v5 = v4:Clone()
							v5.Visible = true
							v5.Parent = p1.Content.Items.Content.Content
							if v22 == "LEGOHorse" then
								local SlotInfo = v3:_giveHorse(v10, v32, (Random.new(v10.Player.UserId):NextInteger(9000000, 9000000000000)))
								SlotInfo.Name = "SlotInfo"
								local v82, v92 = v1.CreateAnimalModel({
									ForceAdult = true,
									SlotValue = SlotInfo,
									Species = v32.Species[1]
								})
								SlotInfo.Parent = v82
								p2.Maid:GiveTask((v2.new(v82, v32)))
								p2.Maid:GiveTask(v92)
								p2.Maid:GiveTask(v82)
								p2.Maid:GiveTask(SlotInfo)
								v82:PivotTo(CFrame.new(-2.741, 106.267, -0.168) * v82:GetPivot().Rotation)
								v82.Parent = v5.Content.Viewport
							end
							p2.Maid:GiveTask(v5)
						end
					end
				end
				local count = 0
				for k, v4 in pairs(p1.Content.Items.Content.Content:GetChildren()) do
					if v4:IsA("ImageButton") and v4.Visible then
						count = count + 1
					end
				end
				p1.Content.Items.Content.Content.UIListLayout.HorizontalAlignment = count >= 5 and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Center
			end,
			Run = function() --[[ Run | Line: 117 | Upvalues: v4 (ref), k (copy) ]]
				v4.GetRemoteFunction("ClaimItemSetRemote"):InvokeServer(k)
				return true
			end,
			Cancel = function() --[[ Cancel | Line: 121 | Upvalues: v4 (ref), k (copy), v5 (ref) ]]
				v4.GetRemoteFunction("DismissItemSetRemote"):InvokeServer(k)
				v5.Close()
			end
		})
		v5.YieldForNoPrompt()
	end
end
return t