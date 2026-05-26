-- https://lua.expert/
sp = script.Parent
plr = game.Players.LocalPlayer
rate = 0.03333333333333333
gravity = 800
jumpvelocity = 350
basespeed = 100
acceleration = 0.15
normalsize = UDim2.new(0, 30, 0, 30)
speed = basespeed
bestdist = 0
bestlightcollected = 0
bestscore = 0
bestdistname = ""
bestlightcollectedname = ""
bestscorename = ""
dist = 0
lightcollected = 0
score = 0
a = 0
lastbonusdist = 0
chrposition = Vector3.new(0, 0, 0)
chrvelocity = Vector3.new(0, 0, 0)
paused = false
equipped = false
running = false
grounded = false
airjumps = 0
chrhitwall = false
wpressed = false
wdown = false
adown = false
sdown = false
ddown = false
spacedown = false
plrsactualcf = CFrame.new(0, 0, 0)
hiddencf = CFrame.new(0, 50000, 0)
while gui == nil do
	wait()
	gui = sp:FindFirstChild("PlatformerGui")
end
startpos = Vector3.new(0, 300, 0)
imgjumpeffect = "http://www.roblox.com/asset/?id=73166882"
imgstill = "http://www.roblox.com/asset/?id=73014404"
imgmoving = "http://www.roblox.com/asset/?id=73014420"
imgfalling = "http://www.roblox.com/asset/?id=73014435"
imgwallhit = "http://www.roblox.com/asset/?id=73014892"
imgwallhit2 = "http://www.roblox.com/asset/?id=73014915"
local Generated = Instance.new("ImageLabel")
Generated.Name = "Generated"
Generated.BackgroundTransparency = 1
Generated.Image = "http://www.roblox.com/asset/?id=72484181"
Generated.Size = UDim2.new(0, 280, 0, 140)
Generated.ZIndex = 5
local Generated_2 = Instance.new("ImageLabel")
Generated_2.Name = "Generated"
Generated_2.BackgroundTransparency = 1
Generated_2.Image = "http://www.roblox.com/asset/?id=72484254"
Generated_2.Size = UDim2.new(0, 280, 0, 140)
Generated_2.ZIndex = 5
local Generated_3 = Instance.new("ImageLabel")
Generated_3.Name = "Generated"
Generated_3.BackgroundTransparency = 1
Generated_3.Image = "http://www.roblox.com/asset/?id=72484283"
Generated_3.Size = UDim2.new(0, 350, 0, 100)
Generated_3.ZIndex = 5
local Generated_4 = Instance.new("ImageLabel")
Generated_4.Name = "Generated"
Generated_4.BackgroundTransparency = 1
Generated_4.Image = "http://www.roblox.com/asset/?id=74213080"
Generated_4.Size = UDim2.new(0, 120, 0, 80)
Generated_4.ZIndex = 5
pathparts = { Generated, Generated_2, Generated_3, Generated_4 }
pathlp1 = gui.GameFrame.MoveFrame.Map.Land1
pathlp2 = gui.GameFrame.MoveFrame.Map.Land1
pathlp3 = gui.GameFrame.MoveFrame.Map.Land1
sp.Equipped:connect(function(p1) --[[ Line: 93 ]]
	if plr.Character ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") then
		plrsactualcf = plr.Character.HumanoidRootPart.CFrame
		wait()
		plr.Character.HumanoidRootPart.Anchored = true
	end
	if p1 == nil then
		return
	end
	equipped = true
	p1.Button1Down:connect(function() --[[ Line: 104 ]]
		paused = not paused
		if running then
			gui.GameFrame.Paused.Visible = paused
		else
			gui.GameFrame.Paused.Visible = false
		end
	end)
	p1.KeyDown:connect(function(p1) --[[ Line: 112 ]]
		key = string.byte(p1)
		if not key then
			return
		end
		if key == 119 or key == 17 then
			wdown = true
			wpressed = true
			return
		end
		if key == 97 or key == 20 then
			adown = true
			return
		end
		if key == 115 or key == 18 then
			sdown = true
			return
		end
		if key == 100 or key == 19 then
			ddown = true
			return
		end
		if key ~= 32 then
			return
		end
		spacedown = true
		paused = not paused
		if running then
			gui.GameFrame.Paused.Visible = paused
			return
		end
		gui.GameFrame.Paused.Visible = false
	end)
	p1.KeyUp:connect(function(p1) --[[ Line: 135 ]]
		key = string.byte(p1)
		if not key then
			return
		end
		if key == 119 or key == 17 then
			wdown = false
			return
		end
		if key == 97 or key == 20 then
			adown = false
			return
		end
		if key == 115 or key == 18 then
			sdown = false
			return
		end
		if key == 100 or key == 19 then
			ddown = false
			return
		end
		if key ~= 32 then
			return
		end
		spacedown = false
	end)
	gui.Background.Transparency = 1
	gui.Parent = plr.PlayerGui
	gui.Background.Transparency = 0
end)
sp.Unequipped:connect(function() --[[ Line: 158 ]]
	if plr.Character ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") then
		plr.Character.HumanoidRootPart.Anchored = false
	end
	equipped = false
	gui.Parent = sp
	if not running then
		return
	end
	paused = true
	gui.GameFrame.Paused.Visible = true
end)
function checkintersect(p1, p2, p3, p4) --[[ checkintersect | Line: 173 ]]
	local v1 = p1 * Vector3.new(1, 1, 0)
	local v2 = p2 * Vector3.new(1, 1, 0)
	local v3 = p3 * Vector3.new(1, 1, 0)
	local v4 = p4 * Vector3.new(1, 1, 0)
	d = (v1.x - v2.x) * (v3.y - v4.y) - (v1.y - v2.y) * (v3.x - v4.x)
	if d == 0 then
		return false
	end
	local v5 = ((v3.x - v4.x) * (v1.x * v2.y - v1.y * v2.x) - (v1.x - v2.x) * (v3.x * v4.y - v3.y * v4.x)) / d
	local v6 = ((v3.y - v4.y) * (v1.x * v2.y - v1.y * v2.x) - (v1.y - v2.y) * (v3.x * v4.y - v3.y * v4.x)) / d
	local v9 = Vector3.new((v1.x + v2.x) / 2, (v1.y + v2.y) / 2, 0)
	local v12 = Vector3.new((v3.x + v4.x) / 2, (v3.y + v4.y) / 2, 0)
	local v13 = (v2 - v1):Dot(v2 - v1)
	local v14 = (v4 - v3):Dot(v4 - v3)
	local v17 = Vector3.new(v5 - v9.x, v6 - v9.y, 0)
	local v20 = Vector3.new(v5 - v12.x, v6 - v12.y, 0)
	return if v17:Dot(v17) <= v13 / 4 then v20:Dot(v20) <= v14 / 4 else false
end
function properresize(p1, p2, p3) --[[ properresize | Line: 193 ]]
	if p1.Size == UDim2.new(0, p2, 0, p3) then
		return
	end
	local v1 = chrposition
	chrposition = v1 + Vector3.new(p1.Size.X.Offset - p2, p1.Size.Y.Offset - p3, 0)
	p1.Size = UDim2.new(0, p2, 0, p3)
end
function start() --[[ start | Line: 200 ]]
	local Character = gui.GameFrame.MoveFrame.Character
	running = false
	local v1 = 1 / rate
	for i = 1, v1 do
		gui.GameFrame.WhiteFrame.BackgroundTransparency = 1 - i / v1
		wait(rate)
	end
	gui.GameFrame.TitlePage.Visible = false
	gui.GameFrame.ScorePage.Visible = false
	properresize(Character, 30, 30)
	chrvelocity = Vector3.new(0, 0, 0)
	chrposition = startpos
	chrhitwall = false
	gui.GameFrame.BlackFade.Position = UDim2.new(0, -10, 1.5, -10)
	Character.Position = UDim2.new(0, chrposition.x, 0, chrposition.y)
	gui.GameFrame.MoveFrame.Position = UDim2.new(0.5, -100, 0.5, 0) - (Character.Position + Character.Size)
	local v2 = (Character.Position.Y.Offset + Character.Size.Y.Offset * 0.5 + 50) / 1050
	if v2 > 1 then
		v2 = 1
	elseif v2 < 0 then
		v2 = 0
	end
	local v3 = 1 - v2
	local v4 = -(Character.Position.X.Offset + Character.Size.X.Offset * 0.5)
	gui.GameFrame.Mountians1.Position = UDim2.new(0, v4 * 0.15 % 600 - 600, 0.5 * v3, 0)
	gui.GameFrame.Mountians2.Position = UDim2.new(0, v4 * 0.1 % 600 - 600, 0.075 + 0.35 * v3, 0)
	gui.GameFrame.Mountians3.Position = UDim2.new(0, v4 * 0.05 % 600 - 600, 0.15 + 0.2 * v3, 0)
	Character.Image = imgstill
	gui.GameFrame.Score.Text = "Score: 0"
	speed = basespeed
	lastbonusdist = 0
	dist = 0
	score = 0
	lightcollected = 0
	lastpos = chrposition
	for i, v in ipairs(gui.GameFrame.MoveFrame.Map:GetChildren()) do
		if v.Name == "Generated" then
			v:remove()
		end
	end
	pathlp1 = gui.GameFrame.MoveFrame.Map.Land1
	pathlp2 = gui.GameFrame.MoveFrame.Map.Land1
	pathlp3 = gui.GameFrame.MoveFrame.Map.Land1
	local v5 = 2 / rate
	for j = 1, v5 do
		gui.GameFrame.WhiteFrame.BackgroundTransparency = j / v5
		wait(rate)
	end
	running = true
end
gui.GameFrame.TitlePage.Play.MouseButton1Click:connect(function() --[[ Line: 252 ]]
	start()
end)
gui.GameFrame.TitlePage.Controls.MouseButton1Click:connect(function() --[[ Line: 256 ]]
	local v1 = 1 / rate
	for i = 1, v1 do
		gui.GameFrame.BlackFrame.BackgroundTransparency = 1 - i / v1
		wait(rate)
	end
	gui.GameFrame.TitlePage.Visible = false
	gui.GameFrame.Controls.Visible = true
	local v2 = 1 / rate
	for j = 1, v2 do
		gui.GameFrame.BlackFrame.BackgroundTransparency = j / v2
		wait(rate)
	end
end)
gui.GameFrame.Controls.Back.MouseButton1Click:connect(function() --[[ Line: 271 ]]
	local v1 = 1 / rate
	for i = 1, v1 do
		gui.GameFrame.BlackFrame.BackgroundTransparency = 1 - i / v1
		wait(rate)
	end
	gui.GameFrame.TitlePage.Visible = true
	gui.GameFrame.Controls.Visible = false
	local v2 = 1 / rate
	for j = 1, v2 do
		gui.GameFrame.BlackFrame.BackgroundTransparency = j / v2
		wait(rate)
	end
end)
gui.GameFrame.ScorePage.Okay.MouseButton1Click:connect(function() --[[ Line: 286 ]]
	local v1 = 1 / rate
	for i = 1, v1 do
		gui.GameFrame.BlackFrame.BackgroundTransparency = 1 - i / v1
		wait(rate)
	end
	gui.GameFrame.TitlePage.Visible = true
	gui.GameFrame.ScorePage.Visible = false
	local v2 = 1 / rate
	for j = 1, v2 do
		gui.GameFrame.BlackFrame.BackgroundTransparency = j / v2
		wait(rate)
	end
end)
function reset() --[[ reset | Line: 301 ]]
	running = false
	local Character = gui.GameFrame.MoveFrame.Character
	gui.GameFrame.BlackFade.Position = UDim2.new(0, -10, 1.5, -10)
	gui.GameFrame.BlackFade.Frame.BackgroundTransparency = 0
	local v1 = 2 / rate
	for i = 1, v1 do
		gui.GameFrame.BlackFade.Position = UDim2.new(0, -10, 1.5 - i / v1 * 2, -10)
		wait(rate)
	end
	gui.GameFrame.BlackFade.Position = UDim2.new(0, -10, -1.5, -10)
	dist = math.floor(dist / 4)
	score = math.floor(score)
	if score >= bestscore then
		bestscore = score
		gui.GameFrame.ScorePage.LastScore.TextStrokeTransparency = 0.65
		local BestScore = gui.GameFrame.ScorePage.BestScore
		BestScore.Text = "Best Score: " .. tostring(bestscore)
	else
		gui.GameFrame.ScorePage.LastScore.TextStrokeTransparency = 1
	end
	if dist >= bestdist then
		bestdist = dist
		gui.GameFrame.ScorePage.LastDist.TextStrokeTransparency = 0.65
		local BestDist = gui.GameFrame.ScorePage.BestDist
		BestDist.Text = "Best Distance: " .. tostring(bestdist)
	else
		gui.GameFrame.ScorePage.LastDist.TextStrokeTransparency = 1
	end
	if lightcollected > bestlightcollected then
		bestlightcollected = lightcollected
		gui.GameFrame.ScorePage.LastLight.TextStrokeTransparency = 0.65
		local BestLight = gui.GameFrame.ScorePage.BestLight
		BestLight.Text = "Max orbs collected: " .. tostring(bestlightcollected)
	else
		gui.GameFrame.ScorePage.LastLight.TextStrokeTransparency = 1
	end
	gui.GameFrame.ScorePage.LastScore.Text = "Score: " .. tostring(score)
	gui.GameFrame.ScorePage.LastDist.Text = "Distance: " .. tostring(dist)
	gui.GameFrame.ScorePage.LastLight.Text = "Orbs Collected: " .. tostring(lightcollected)
	gui.GameFrame.ScorePage.Visible = true
	paused = false
	gui.GameFrame.Paused.Visible = false
	gui.GameFrame.BlackFade.Position = UDim2.new(0, -10, 1.5, -10)
	gui.GameFrame.BlackFade.Frame.BackgroundTransparency = 1
end
function createsparkle(p1) --[[ createsparkle | Line: 351 ]]
	local Light = Instance.new("ImageLabel")
	local Velocity = Instance.new("Vector3Value")
	Velocity.Name = "Velocity"
	local v1 = math.random()
	Velocity.Value = Vector3.new(v1, math.random() * 2 - 1, 0) * 200
	Velocity.Parent = Light
	Light.Name = "Light"
	Light.Image = "http://www.roblox.com/asset/?id=74274038"
	Light.BackgroundTransparency = 1
	Light.ZIndex = 5
	Light.Size = UDim2.new(0, 15, 0, 15)
	Light.Position = p1 + UDim2.new(0, Velocity.Value.x * rate, 0, Velocity.Value.y * rate)
	Light.Parent = gui.GameFrame.MoveFrame.Effects
end
while true do
	if equipped and (running and not paused) then
		a = a + 1
		local Character = gui.GameFrame.MoveFrame.Character
		verticalaction = 1
		if wdown and (not grounded and chrvelocity.y >= gravity * 0.1) then
			verticalaction = 3
		end
		if wpressed then
			wpressed = false
			if grounded then
				verticalaction = 2
				airjumps = 1
			elseif airjumps < 2 then
				local JumpEffect = Instance.new("ImageLabel")
				JumpEffect.Name = "JumpEffect"
				JumpEffect.Image = imgjumpeffect
				JumpEffect.BackgroundTransparency = 1
				JumpEffect.ZIndex = Character.ZIndex - 1
				JumpEffect.Size = UDim2.new(0, 20, 0, 10)
				JumpEffect.Position = UDim2.new(0, chrposition.x + Character.Size.X.Offset / 2 - JumpEffect.Size.X.Offset / 2, 0, chrposition.y + Character.Size.Y.Offset - JumpEffect.Size.X.Offset / 2)
				JumpEffect.Parent = gui.GameFrame.MoveFrame.Effects
				airjumps = airjumps + 1
				verticalaction = 2
			end
		end
		if sdown then
			verticalaction = 4
		end
		if verticalaction == 1 then
			local v1 = chrvelocity
			chrvelocity = v1 + Vector3.new(0, gravity * rate, 0)
			properresize(Character, 30, 30)
		elseif verticalaction == 2 then
			local v3 = chrvelocity * Vector3.new(1, 0, 0)
			chrvelocity = v3 + Vector3.new(0, -jumpvelocity, 0)
			properresize(Character, 30, 30)
		elseif verticalaction == 3 then
			local v5 = chrvelocity * Vector3.new(1, 0, 0)
			chrvelocity = v5 + Vector3.new(0, gravity * 0.1, 0)
			properresize(Character, 50, 10)
		elseif verticalaction == 4 then
			if chrvelocity.y < gravity * 2 and not grounded then
				local SlamEffect = Instance.new("ImageLabel")
				SlamEffect.Name = "SlamEffect"
				SlamEffect.Image = imgjumpeffect
				SlamEffect.BackgroundTransparency = 1
				SlamEffect.ZIndex = Character.ZIndex - 1
				SlamEffect.Size = UDim2.new(0, 16, 0, 10)
				SlamEffect.Position = UDim2.new(0, chrposition.x + Character.Size.X.Offset / 2 - SlamEffect.Size.X.Offset / 2, 0, chrposition.y - SlamEffect.Size.X.Offset / 2)
				SlamEffect.Parent = gui.GameFrame.MoveFrame.Effects
			end
			local v7 = chrvelocity * Vector3.new(1, 0, 0)
			chrvelocity = v7 + Vector3.new(0, gravity * 2, 0)
			properresize(Character, 40, 15)
		end
		speed = speed + acceleration
		local v9 = chrvelocity * Vector3.new(0, 1, 0)
		chrvelocity = v9 + Vector3.new(speed, 0, 0)
		local v11 = chrposition
		local _ = v11 + Vector3.new(Character.Size.X.Offset, 0, 0)
		local v12 = chrposition
		local v13 = v12 + Vector3.new(Character.Size.X.Offset, Character.Size.Y.Offset, 0)
		if chrvelocity.y >= 0 then
			local v14 = chrposition
			point3 = v14 + Vector3.new(0, Character.Size.Y.Offset, 0)
		else
			point3 = chrposition
		end
		horizontalhit = nil
		horizontalhight = nil
		verticalhit = nil
		for i, v in ipairs(gui.GameFrame.MoveFrame.Map:GetChildren()) do
			if v.Name == "Generated" and v.Position.X.Offset + v.Size.X.Offset < Character.Position.X.Offset - 200 then
				v:remove()
			end
			if v and (chrvelocity.y >= 0 and (verticalhit == nil or verticalhit > v.Position.Y.Offset)) then
				local v19 = checkintersect(v13, v13 + chrvelocity * rate, Vector3.new(v.Position.X.Offset, v.Position.Y.Offset, 0), (Vector3.new(v.Position.X.Offset + v.Size.X.Offset, v.Position.Y.Offset, 0)))
				local v20 = checkintersect
				if check1b or (v19 or v20(point3 + Vector3.new(0, -5, 0), point3 + chrvelocity * rate, Vector3.new(v.Position.X.Offset, v.Position.Y.Offset, 0), (Vector3.new(v.Position.X.Offset + v.Size.X.Offset, v.Position.Y.Offset, 0)))) then
					verticalhit = v.Position.Y.Offset
				end
			end
		end
		if chrvelocity.magnitude <= gravity * rate and grounded then
			Character.Image = imgstill
		else
			local v26 = math.abs(chrvelocity.x)
			if math.abs(chrvelocity.y) < v26 then
				Character.Image = imgmoving
			else
				Character.Image = imgfalling
			end
		end
		chrposition = chrposition + chrvelocity * rate
		dist = dist + (chrvelocity * rate).x
		grounded = false
		if verticalhit ~= nil then
			if chrvelocity.y >= 0 then
				grounded = true
				airjumps = 0
				local x = chrposition.x
				chrposition = Vector3.new(x, verticalhit - Character.Size.Y.Offset - 0.01, 0)
			else
				local x = chrposition.x
				chrposition = Vector3.new(x, verticalhit + 0.01, 0)
			end
			chrvelocity = chrvelocity * Vector3.new(1, 0, 0)
		end
		if horizontalhit ~= nil and horizontalhight ~= nil then
			if verticalhit and grounded then
				if horizontalhight < verticalhit then
					chrhitwall = true
				end
			else
				chrhitwall = true
			end
		end
		if chrposition.x >= 30000 then
			chrposition = chrposition + Vector3.new(-24000, 0, 0)
			for i, v in ipairs(gui.GameFrame.MoveFrame.Map:GetChildren()) do
				if v.Name == "Generated" then
					v.Position = v.Position + UDim2.new(0, -24000, 0, 0)
				end
			end
			for i, v in ipairs(gui.GameFrame.MoveFrame.Effects:GetChildren()) do
				v.Position = v.Position + UDim2.new(0, -24000, 0, 0)
			end
			for i, v in ipairs(gui.GameFrame.MoveFrame.Bonus:GetChildren()) do
				v.Position = v.Position + UDim2.new(0, -24000, 0, 0)
			end
		end
		Character.Position = UDim2.new(0, chrposition.x, 0, chrposition.y)
		gui.GameFrame.MoveFrame.Position = UDim2.new(0.5, -100, 0.5, 0) - (Character.Position + Character.Size)
		local v29 = (Character.Position.Y.Offset + Character.Size.Y.Offset * 0.5 + 50) / 1050
		if v29 > 1 then
			v29 = 1
		elseif v29 < 0 then
			v29 = 0
		end
		local v30 = 1 - v29
		local v31 = -(Character.Position.X.Offset + Character.Size.X.Offset * 0.5)
		gui.GameFrame.Mountians1.Position = UDim2.new(0, v31 * 0.15 % 600 - 600, 0.5 * v30, 0)
		gui.GameFrame.Mountians2.Position = UDim2.new(0, v31 * 0.1 % 600 - 600, 0.075 + 0.35 * v30, 0)
		gui.GameFrame.Mountians3.Position = UDim2.new(0, v31 * 0.05 % 600 - 600, 0.15 + 0.2 * v30, 0)
		if pathlp1.Position.X.Offset < Character.Position.X.Offset + 400 then
			local v32 = pathparts[math.random(1, #pathparts)]:clone()
			v32.Position = pathlp1.Position + UDim2.new(0, speed * (math.random() * 1.75) + pathlp1.Size.X.Offset, 0, 100 * (math.random() * 2 - 1))
			if v32.Position.Y.Offset > 600 - v32.Size.Y.Offset then
				v32.Position = UDim2.new(0, v32.Position.X.Offset, 0, 600 - v32.Size.Y.Offset)
			elseif v32.Position.Y.Offset < 0 then
				v32.Position = UDim2.new(0, v32.Position.X.Offset, 0, 0)
			end
			v32.Parent = gui.GameFrame.MoveFrame.Map
			pathlp1 = v32
		end
		if pathlp2.Position.X.Offset < Character.Position.X.Offset + 400 then
			local v33 = pathparts[math.random(1, #pathparts)]:clone()
			v33.Position = pathlp2.Position + UDim2.new(0, speed * (math.random() * 1.75) + pathlp2.Size.X.Offset, 0, 100 * (math.random() * 2 - 1))
			if v33.Position.Y.Offset > 600 - v33.Size.Y.Offset then
				v33.Position = UDim2.new(0, v33.Position.X.Offset, 0, 600 - v33.Size.Y.Offset)
			elseif v33.Position.Y.Offset < 0 then
				v33.Position = UDim2.new(0, v33.Position.X.Offset, 0, 0)
			end
			v33.Parent = gui.GameFrame.MoveFrame.Map
			pathlp2 = v33
		end
		if pathlp3.Position.X.Offset < Character.Position.X.Offset + 400 then
			local v34 = pathparts[math.random(1, #pathparts)]:clone()
			v34.Position = pathlp3.Position + UDim2.new(0, speed * (math.random() * 1.75) + pathlp3.Size.X.Offset, 0, 100 * (math.random() * 2 - 1))
			if v34.Position.Y.Offset > 600 - v34.Size.Y.Offset then
				v34.Position = UDim2.new(0, v34.Position.X.Offset, 0, 600 - v34.Size.Y.Offset)
			elseif v34.Position.Y.Offset < 0 then
				v34.Position = UDim2.new(0, v34.Position.X.Offset, 0, 0)
			end
			v34.Parent = gui.GameFrame.MoveFrame.Map
			pathlp3 = v34
		end
		for i, v in ipairs(gui.GameFrame.MoveFrame.Effects:GetChildren()) do
			if v.Name == "JumpEffect" then
				if v.Size.X.Offset >= 76 then
					v:remove()
					continue
				end
				v.Size = v.Size + UDim2.new(0, 4, 0, 2)
				v.Position = v.Position - UDim2.new(0, 2, 0, 1)
				continue
			end
			if v.Name == "SlamEffect" then
				if v.Size.X.Offset >= 54 then
					v:remove()
					continue
				end
				v.Size = v.Size + UDim2.new(0, 6, 0, 4)
				v.Position = v.Position - UDim2.new(0, 3, 0, 2)
				continue
			end
			if v.Name == "TredEffect" then
				v.Velocity.Value = v.Velocity.Value + Vector3.new(0, gravity * rate, 0)
				v.Position = v.Position + UDim2.new(0, v.Velocity.Value.x * rate, 0, v.Velocity.Value.y * rate)
				if v.Velocity.Value.y > gravity * 0.25 then
					v:remove()
				end
				continue
			end
			if v.Name == "Light" then
				v.Velocity.Value = v.Velocity.Value + Vector3.new(0, gravity * rate, 0)
				v.Position = v.Position + UDim2.new(0, v.Velocity.Value.x * rate, 0, v.Velocity.Value.y * rate)
				if v.Velocity.Value.y > gravity * 3 then
					v:remove()
				end
				continue
			end
			if v.Name == "Light" then
				if v.Size.X.Offset >= 100 then
					v:remove()
					continue
				end
				v.Size = v.Size + UDim2.new(0, 2, 0, 2)
				v.Position = v.Position - UDim2.new(0, 1, 0, 1)
			end
		end
		for i, v in ipairs(gui.GameFrame.MoveFrame.Bonus:GetChildren()) do
			v.Position = v.Position + UDim2.new(0, 0, 0, 1)
			if v.Position.X.Offset < chrposition.x - 450 then
				v:remove()
				continue
			end
			local v37 = checkintersect
			local v43 = v37(lastpos + Vector3.new(30, 0, 0), chrposition + Vector3.new(30, 0, 0), Vector3.new(v.Position.X.Offset, v.Position.Y.Offset, 0), (Vector3.new(v.Position.X.Offset + v.Size.X.Offset, v.Position.Y.Offset + v.Size.Y.Offset, 0)))
			local v44 = checkintersect
			local v50 = v44(lastpos + Vector3.new(30, 30, 0), chrposition + Vector3.new(30, 30, 0), Vector3.new(v.Position.X.Offset, v.Position.Y.Offset, 0), (Vector3.new(v.Position.X.Offset + v.Size.X.Offset, v.Position.Y.Offset + v.Size.Y.Offset, 0)))
			local v51 = checkintersect
			local v57 = v51(lastpos + Vector3.new(30, 0, 0), chrposition + Vector3.new(30, 0, 0), Vector3.new(v.Position.X.Offset + v.Size.X.Offset, v.Position.Y.Offset, 0), (Vector3.new(v.Position.X.Offset, v.Position.Y.Offset + v.Size.Y.Offset, 0)))
			local v58 = checkintersect
			if v43 or (v50 or (v57 or v58(lastpos + Vector3.new(30, 30, 0), chrposition + Vector3.new(30, 30, 0), Vector3.new(v.Position.X.Offset + v.Size.X.Offset, v.Position.Y.Offset, 0), (Vector3.new(v.Position.X.Offset, v.Position.Y.Offset + v.Size.Y.Offset, 0))))) then
				v:remove()
				createsparkle(v.Position + UDim2.new(0, v.Size.X.Offset / 2, 0, v.Size.Y.Offset / 2))
				createsparkle(v.Position + UDim2.new(0, v.Size.X.Offset / 2, 0, v.Size.Y.Offset / 2))
				createsparkle(v.Position + UDim2.new(0, v.Size.X.Offset / 2, 0, v.Size.Y.Offset / 2))
				createsparkle(v.Position + UDim2.new(0, v.Size.X.Offset / 2, 0, v.Size.Y.Offset / 2))
				lightcollected = lightcollected + 1
				score = score * 1.05 + 200
			end
		end
		local v64 = score
		score = v64 + math.floor(speed / 100) + 2
		gui.GameFrame.Score.Text = "Score: " .. tostring((math.floor(score)))
		if dist > lastbonusdist + 1000 then
			lastbonusdist = dist
			local Light = Instance.new("ImageLabel")
			Light.Name = "Light"
			Light.Image = "http://www.roblox.com/asset/?id=74274038"
			Light.BackgroundTransparency = 1
			Light.ZIndex = Character.ZIndex - 1
			Light.Size = UDim2.new(0, 30, 0, 30)
			Light.Position = UDim2.new(0, chrposition.x + 430, 0, math.random(-50, 500))
			Light.Parent = gui.GameFrame.MoveFrame.Bonus
		end
		if grounded and a % 5 == 1 then
			local TredEffect = Instance.new("ImageLabel")
			local Velocity = Instance.new("Vector3Value")
			Velocity.Name = "Velocity"
			Velocity.Value = Vector3.new(0, -jumpvelocity * 0.6, 0)
			Velocity.Parent = TredEffect
			TredEffect.Name = "TredEffect"
			TredEffect.Image = "http://www.roblox.com/asset/?id=74246393"
			TredEffect.BackgroundTransparency = 1
			TredEffect.ZIndex = Character.ZIndex - 1
			TredEffect.Size = UDim2.new(0, math.random(2, 5), 0, math.random(2, 5))
			TredEffect.Position = UDim2.new(0, chrposition.x - TredEffect.Size.X.Offset / 2, 0, chrposition.y + Character.Size.Y.Offset)
			TredEffect.Parent = gui.GameFrame.MoveFrame.Effects
		end
		if chrhitwall then
			local v69 = horizontalhit - Character.Size.X.Offset
			chrposition = Vector3.new(v69, chrposition.y, 0)
			Character.Image = imgwallhit
			wait(0.15)
			Character.Image = imgwallhit2
			wait(0.15)
			reset()
		elseif chrposition.y > 1000 then
			reset()
		end
		lastpos = chrposition
	end
	wait(rate)
end