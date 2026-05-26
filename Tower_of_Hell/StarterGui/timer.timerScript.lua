-- https://lua.expert/
local count = 0
local v1 = false
for k, v in pairs(game.ReplicatedStorage.Remotes.Game.fetchRoundWinners:InvokeServer()) do
	print(k, v)
	count = count + 1
end
if count > 0 and game.ReplicatedStorage.GameValues.roundTime then
	script.Parent.timeLeft.multiplier.Text = "x" .. 2 ^ count
end
function updateMutator(p1, p2) --[[ updateMutator | Line: 13 ]]
	if p2 then
		if script.Parent.mutators:FindFirstChild(p1) then
			return
		end
		local v1 = script.mutator:Clone()
		local v2 = game.ReplicatedStorage.Mutators:FindFirstChild(p1)
		if not v2 then
			return
		end
		local v3 = v2.Configuration.pic.Value or ""
		if v3 == "customNegative" then
			v1.customNegative.Visible = true
			v1.Image = ""
		elseif v3 == "customPositive" then
			v1.customPositive.Visible = true
			v1.Image = ""
		else
			v1.Image = v3
		end
		v1.Name = p1
		v1.Parent = script.Parent.mutators
		return
	end
	while script.Parent.mutators:FindFirstChild(p1) do
		script.Parent.mutators:FindFirstChild(p1):Destroy()
	end
end
game.ReplicatedStorage.Remotes.Game.mutatorChanged.OnClientEvent:Connect(updateMutator)
for k, v in pairs(game.ReplicatedStorage.Remotes.Game.fetchMutators:InvokeServer()) do
	updateMutator(v, true)
end
game.ReplicatedStorage.Remotes.Game.playerWonEvent.OnClientEvent:Connect(function(p1) --[[ Line: 45 | Upvalues: v1 (ref), count (ref) ]]
	if p1 ~= game.Players.LocalPlayer then
		count = count + 1
		script.Parent.timeLeft.multiplier.Text = "x" .. 2 ^ count
		return
	end
	v1 = true
	count = count + 1
	script.Parent.timeLeft.multiplier.Text = "x" .. 2 ^ count
end)
local function update(p1) --[[ update | Line: 53 | Upvalues: v1 (ref), count (ref) ]]
	p1:WaitForChild("sectionCount")
	p1:WaitForChild("sections")
	v1 = false
	count = 0
	script.Parent.timeLeft.multiplier.Text = ""
end
workspace.ChildAdded:connect(function(p1) --[[ Line: 61 | Upvalues: v1 (ref), count (ref) ]]
	if p1.Name ~= "tower" then
		return
	end
	p1:WaitForChild("sectionCount")
	p1:WaitForChild("sections")
	v1 = false
	count = 0
	script.Parent.timeLeft.multiplier.Text = ""
	p1.sections.ChildAdded:Connect(function() --[[ Line: 64 | Upvalues: p1 (copy), v1 (ref), count (ref) ]]
		local v12 = p1
		v12:WaitForChild("sectionCount")
		v12:WaitForChild("sections")
		v1 = false
		count = 0
		script.Parent.timeLeft.multiplier.Text = ""
	end)
end)
while true do
	local v2 = game.ReplicatedStorage.GameValues.roundTimeout.Value - game.ReplicatedStorage.GameValues.roundTime.Value
	if v2 == (1 / 0) then
		script.Parent.timeLeft.Text = ""
		script.Parent.timeLeft.multiplier.Visible = false
	else
		script.Parent.timeLeft.multiplier.Visible = true
		local timeLeft = script.Parent.timeLeft
		local v3 = math.floor(v2 / 60)
		timeLeft.Text = v3 .. ":" .. (if v2 % 60 < 10 then "0" else "") .. math.floor(v2 % 60)
		if v1 then
			script.Parent.timeLeft.TextColor3 = Color3.new(0/255, 255/255, 0/255)
		elseif v2 < 60 and (v2 > 10 or math.floor(v2) % 2 == 0) then
			script.Parent.timeLeft.TextColor3 = Color3.new(255/255, 0/255, 0/255)
		else
			script.Parent.timeLeft.TextColor3 = Color3.new(255/255, 255/255, 255/255)
		end
	end
	wait()
end