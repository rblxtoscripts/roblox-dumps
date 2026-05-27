-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ItemDropBillboard")
local v2 = Sonar("ItemDrop")
local v3 = Sonar("RemoteUtils")
local v4 = Sonar("PlayerWrapper").GetClient()
local t2 = {}
local t3 = {}
local v5 = v3.GetRemoteEvent("SendDropsRemote")
local function attemptToAddDrop(p1, p2) --[[ attemptToAddDrop | Line: 22 | Upvalues: t (copy), v4 (copy) ]]
	t.Add({
		Type = p1,
		Amount = p2,
		Position = v4.PrimaryPart.Position
	})
end
function t.Add(p1) --[[ Add | Line: 30 | Upvalues: t (copy), v1 (copy), t2 (copy) ]]
	local v12 = t.GetNearestOfType(p1)
	if v12 then
		v12:AddItem(p1)
	else
		local v2 = v1.new(p1)
		v2.Maid:GiveTask(function() --[[ Line: 36 | Upvalues: t2 (ref), p1 (copy) ]]
			t2[p1] = nil
		end)
		t2[p1] = v2
	end
end
function t.GetNearestOfType(p1) --[[ GetNearestOfType | Line: 43 | Upvalues: t2 (copy) ]]
	for k, v in pairs(t2) do
		if v:CanAddItem(p1) then
			return v
		end
	end
end
function t.AddTracker(p1, p2, p3) --[[ AddTracker | Line: 51 | Upvalues: t3 (copy), t (copy), v4 (copy) ]]
	local v1 = p3.Value
	t3[p3] = p3:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 53 | Upvalues: p3 (copy), v1 (ref), p2 (copy), t (ref), v4 (ref) ]]
		local v12 = p3.Value - v1
		v1 = p3.Value
		if not (v12 <= 0) then
			t.Add({
				Type = p2,
				Amount = v12,
				Position = v4.PrimaryPart.Position
			})
		end
	end)
end
function t.RemoveTracker(p1, p2) --[[ RemoveTracker | Line: 62 | Upvalues: t3 (copy) ]]
	t3[p2]:Disconnect()
end
function t.Init(p1) --[[ Init | Line: 66 | Upvalues: t (copy), v4 (copy), v5 (copy), v2 (copy) ]]
	t:AddTracker("Coins", v4.CurrencyValues.Coins)
	v5.OnClientEvent:Connect(function(p1) --[[ Line: 68 | Upvalues: v2 (ref), v4 (ref), v5 (ref) ]]
		for i = 1, #p1[2] do
			task.delay((i - 1) * 0.02, function() --[[ Line: 70 | Upvalues: v2 (ref), p1 (copy), i (copy), v4 (ref), v5 (ref) ]]
				local t = {
					Type = p1[1],
					Index = p1[2][i]
				}
				t.Position = p1[3] or v4.PrimaryPart.Position
				t.ItemName = p1[4]
				function t.OnPickUp(p1) --[[ OnPickUp | Line: 76 | Upvalues: v5 (ref) ]]
					v5:FireServer(p1.Index)
				end
				v2.new(t)
			end)
		end
	end)
end
t:Init()
return t