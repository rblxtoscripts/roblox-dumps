-- https://lua.expert/
local v1 = script:WaitForChild("ObjectPointer").Value
local _ = script:WaitForChild("HousePointer").Value
position = CFrame.new(v1.StandBase.Position) * (v1.StandBase.CFrame.lookVector * 2) + Vector3.new(0, 4, 0)
function ShowBigMessage(p1, p2, p3) --[[ ShowBigMessage | Line: 12 ]]
	if p3 or not (p1 and (p1.Parent and (p1.Character and (p1.Character:FindFirstChild("Head") and p1:DistanceFromCharacter(position) < 3.5)))) then
		return
	end
	for i, v in ipairs(game.Players:GetPlayers()) do
		if v.Character ~= nil and (v.Character:FindFirstChild("Head") ~= nil and v:DistanceFromCharacter(p1.Character.Head.Position) < 40) then
			workspace.Main.Microphone:Fire(p1.Name .. ": " .. p2)
		end
	end
end
game:GetService("TextChatService").TextChannels.RBXGeneral.MessageReceived:connect(function(p1) --[[ Line: 29 ]]
	local v1 = p1.TextSource and game.Players:GetPlayerByUserId(p1.TextSource.UserId)
	if not v1 then
		return
	end
	ShowBigMessage(v1, if p1.Translation == "" then p1.Text else p1.Translation or p1.Text, false)
end)