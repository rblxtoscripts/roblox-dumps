-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("InteractMenu")
local v2 = Sonar("Binder")
local v3 = Sonar("Maid")
local v4 = Sonar("PromptClient")
local v5 = Sonar("RemoteUtils")
local WorldLore = Sonar("Constants").WorldLore
local t = {}
t.__index = t
function t.new(p1) --[[ new | Line: 15 | Upvalues: t (copy), v3 (copy), v1 (copy), v4 (copy), WorldLore (copy), v5 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v3.new()
	if not p1:GetAttribute("DontSetTransparency") then
		p1.Transparency = 1
	end
	v2.Maid:GiveTask(v1.new(p1, {
		ShowHintLabel = true,
		Hint = "Inspect",
		Run = function() --[[ Run | Line: 26 | Upvalues: v4 (ref), WorldLore (ref), p1 (copy), v5 (ref) ]]
			v4.Prompt({
				Type = "Lore",
				Setup = function(p12) --[[ Setup | Line: 29 | Upvalues: WorldLore (ref), p1 (ref), v5 (ref) ]]
					local v1 = WorldLore[p1.Name]
					if v1 then
						p12.Content.Lore.Container.TextContainer.TextLabel.Text = v1[math.random(1, #v1)]
					end
					v5.GetRemoteFunction("InteractWorldLoreRemote"):InvokeServer(p1)
				end,
				Run = function() --[[ Run | Line: 37 ]]
					return true
				end,
				Cancel = function() --[[ Cancel | Line: 40 ]]
					return true
				end
			})
		end,
		Visibility = function() --[[ Visibility | Line: 47 | Upvalues: p1 (copy) ]]
			return p1:IsDescendantOf(workspace)
		end,
		GetRange = function() --[[ GetRange | Line: 51 | Upvalues: p1 (copy) ]]
			return p1:GetAttribute("Range") or 50
		end
	}))
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 61 ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
function t.Init() --[[ Init | Line: 68 | Upvalues: v2 (copy), t (copy) ]]
	v2.new("WorldLore", t):Init()
end
t.Init()
return t