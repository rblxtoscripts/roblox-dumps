-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("GuiFrameworkService", {
	Deferred = true
})
local v2 = Sonar("UserThumbnailFetcher")
local v3 = Sonar("PlayerWrapper")
local v4 = v3.GetClient()
local t = {
	OnOpen = function(p1, p2) --[[ OnOpen | Line: 36 | Upvalues: v1 (copy), v4 (copy), v2 (copy), v3 (copy), Players (copy) ]]
		local Screen = p1.Screen
		p2.Action = p2.Action or {}
		p1.Maid:DoCleaning()
		local v22 = v1.FindElement(Screen.Instance, "ScrollingFrame")
		local v32 = v1.FindElement(Screen.Instance, "Title")
		if v32 then
			v32.Text = p2.Title or "Select Player"
		end
		local function playerAdded(p12) --[[ playerAdded | Line: 48 | Upvalues: v4 (ref), p2 (copy), p1 (copy), v1 (ref), v22 (copy), v2 (ref) ]]
			if p12 ~= v4.Player or p2.IncludeSelf then
				p1.Maid[p12.UserId] = v1.AddComponent("GuiObject", {
					Parent = v22,
					OnCreated = function(p13) --[[ OnCreated | Line: 55 | Upvalues: v1 (ref), p12 (copy), p1 (ref), v2 (ref), p2 (ref) ]]
						local v12 = v1.FindElement(p13.Instance, "DisplayNameLabel")
						if v12 then
							v12.Text = p12.DisplayName
						end
						local v22 = v1.FindElement(p13.Instance, "UsernameLabel")
						if v22 then
							v22.Text = "@" .. p12.Name
						end
						local v3 = v1.FindElement(p13.Instance, "PlayerImage")
						if v3 then
							p1.Maid:GiveTask(task.spawn(function() --[[ Line: 67 | Upvalues: v3 (copy), v2 (ref), p12 (ref) ]]
								v3.Image = v2.Get(p12.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
							end))
						end
						local v4 = v1.FindElement(p13.Instance, "ActionButton")
						if v4 then
							p1.Maid:GiveTask(v1.AddComponent("Button", {
								Instance = v4,
								OnClick = function() --[[ OnClick | Line: 76 | Upvalues: p1 (ref), p12 (ref) ]]
									p1:RunButtonAction("Run", p12)
								end
							}))
						end
						local v5 = v1.FindElement(p13.Instance, "ActionLabel") or (v4 and v1.FindElement(v4, "Label") or (v1.FindElement(v4, "Title") or v1.FindElement(v4, "TextLabel")))
						if not v5 then
							return
						end
						v5.Text = p2.Action.Label or "Run"
					end
				})
			end
		end
		local function playerRemoving(p12) --[[ playerRemoving | Line: 93 | Upvalues: p1 (copy) ]]
			if not p1.Maid[p12.UserId] then
				return
			end
			p1.Maid[p12.UserId]:Destroy()
			p1.Maid[p12.UserId] = nil
		end
		p1.Maid:GiveTask(v3.PlayerAdded:Connect(playerAdded))
		p1.Maid:GiveTask(Players.PlayerRemoving:Connect(playerRemoving))
		for v42, v5 in v3.GetPlayers() do
			playerAdded(v5.Player)
		end
	end
}
function t.Init(p1) --[[ Init | Line: 107 | Upvalues: v1 (copy), t (copy) ]]
	v1.AddPromptScreen({
		Type = "PlayerListPrompt",
		Tag = "GuiScreen_PlayerListPrompt",
		Preset = function(p1, p2) --[[ Preset | Line: 111 | Upvalues: t (ref) ]]
			t.OnOpen(p1, p2)
		end
	})
end
t:Init()
return t