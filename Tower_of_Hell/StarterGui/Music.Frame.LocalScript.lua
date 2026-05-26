-- https://lua.expert/
local Volume = script.Parent.music.Volume
if game:GetService("UserInputService").PreferredInput == Enum.PreferredInput.Touch then
	script.Parent.play.Position = UDim2.new(UDim.new(script.Parent.play.Position.X.Scale - 1, script.Parent.play.Position.X.Offset), script.Parent.play.Position.Y)
	script.Parent.title.Position = UDim2.new(UDim.new(script.Parent.title.Position.X.Scale - 1, script.Parent.title.Position.X.Offset), script.Parent.title.Position.Y)
end
script.Parent.play.InputBegan:Connect(function(p1) --[[ Line: 8 ]]
	if p1.UserInputType ~= Enum.UserInputType.MouseButton1 and p1.UserInputType ~= Enum.UserInputType.Touch then
		return
	end
	if script.Parent.music.Playing then
		script.Parent.music:Pause()
		script.Parent.play.Image = "rbxassetid://2268306163"
		return
	end
	script.Parent.music:Resume()
	script.Parent.play.Image = "rbxassetid://2268312312"
end)
local function newMusic() --[[ newMusic | Line: 20 | Upvalues: Volume (copy) ]]
	script.Parent.music:Stop()
	local v1 = script.Parent.musicList:GetChildren()
	math.randomseed(tick() * 128 % 1000000)
	local v2 = v1[math.random(1, #v1)]
	script.Parent.music.SoundId = v2.Value
	script.Parent.title.Text = v2.Name
	if v2:FindFirstChild("volume") then
		script.Parent.music.Volume = v2.volume.Value
	else
		script.Parent.music.Volume = Volume
	end
	if script.Parent.play.Image ~= "rbxassetid://2268312312" then
		return
	end
	script.Parent.music:Resume()
end
local MusicPlaying = game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId):WaitForChild("settings"):WaitForChild("MusicPlaying")
newMusic()
if not MusicPlaying.Value then
	script.Parent.music:Pause()
	script.Parent.play.Image = "rbxassetid://2268306163"
end
script.Parent.music.Ended:Connect(newMusic)
while true do
	if MusicPlaying.Value ~= script.Parent.music.Playing then
		MusicPlaying.set:InvokeServer(script.Parent.music.Playing)
	end
	wait(1)
end