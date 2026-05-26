-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("Binder")
local v3 = Sonar("Maid")
local v4 = Sonar("PlayerWrapper").GetClient()
local v5 = Sonar("InteractMenu")
local v6 = Sonar("NotificationsClient")
local v7 = Sonar("State")
local v8 = v1.GetRemoteFunction("TrickerTreatRemote")
function t.new(p1) --[[ new | Line: 16 | Upvalues: t (copy), v3 (copy), v7 (copy), ReplicatedStorage (copy), v5 (copy), v8 (copy), v6 (copy), v4 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v3.new()
	v2.InteractMenuMaid = v3.new()
	v2.Maid:GiveTask(v2.InteractMenuMaid)
	v2.TrickState = v7.new(false)
	v2.Model = ReplicatedStorage.Storage.Assets.Events.Valentines2026.GhostNPC:Clone()
	local v32 = p1.CFrame * CFrame.new(0, 3, 0)
	local Angles = CFrame.Angles
	v2.Model:PivotTo(v32 * Angles(1.5707963267948966, 0, (math.rad((math.random(0, 360))))))
	v2.Model.Parent = p1
	v2.Maid:GiveTask(v2.Model)
	v2.StateSubscription = v2.TrickState:subscribe(function(p1) --[[ Line: 32 | Upvalues: v2 (copy) ]]
		if not p1 then
			return
		end
		v2.Model:Destroy()
		v2.InteractMenuMaid:DoCleaning()
	end)
	v2.Maid:GiveTask(v2.StateSubscription)
	v2.InteractMenuMaid:GiveTask(v5.new(p1, {
		Hint = "Talk",
		ShowHintLabel = true,
		Run = function() --[[ Run | Line: 45 | Upvalues: v8 (ref), p1 (copy), v2 (copy), v6 (ref), v4 (ref) ]]
			local v1, v22 = v8:InvokeServer(p1)
			if not v1 then
				return
			end
			v2.TrickState:set(true)
			if v22 == "Treat" then
				v6.Notify({
					Message = "Cupid smiles upon you!\240\159\146\157",
					Preset = "Green"
				})
				return
			end
			v4:FlingPlayer()
			v6.Notify({
				Message = "Cupid looks away! The Valentine\'s Day spirit ignores you! \240\159\146\148",
				Preset = "Red"
			})
		end,
		GetRange = function() --[[ GetRange | Line: 66 ]]
			return 15
		end,
		Enabled = function() --[[ Enabled | Line: 70 | Upvalues: v2 (copy) ]]
			return not v2.TrickState:get()
		end,
		Changed = function() --[[ Changed | Line: 74 | Upvalues: v2 (copy) ]]
			return v2.TrickState:changed()
		end
	}))
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 82 ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
function t.Init(p1) --[[ Init | Line: 88 | Upvalues: v2 (copy), t (copy) ]]
	v2.new("TrickerTreat", t):Init()
end
t.Init()
return t