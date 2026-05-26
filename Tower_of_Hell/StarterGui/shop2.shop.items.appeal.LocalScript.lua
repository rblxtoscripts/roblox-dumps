-- https://lua.expert/
wait(1)
function appeal() --[[ appeal | Line: 3 ]]
	local tbl = { "cheating", "7 days", "reset", "progress", "agree" }
	local Text = script.Parent.agreementBox.Text
	local count = 0
	for k, v in pairs(tbl) do
		if Text:find(v, nil, true) then
			count = count + 1
		end
	end
	if not (#tbl * 0.6 < count) then
		return
	end
	game.ReplicatedStorage.Remotes.Moderation.appealBan:InvokeServer()
	for k, v in pairs(script.Parent:GetChildren()) do
		if v.Name ~= "alreadyappealed" and v.Name ~= "LocalScript" then
			v:Destroy()
		end
	end
	script.Parent.alreadyappealed.Text = "Successfully appealed. Please wait 7 days to be unbanned"
	script.Parent.alreadyappealed.Visible = true
end
function replace(p1, p2, p3) --[[ replace | Line: 30 ]]
	while true do
		local v1, v2 = string.find(p1, p2, nil, true)
		if not v1 then
			break
		end
		p1 = string.sub(p1, 1, v1 - 1) .. p3 .. string.sub(p1, v2 + 1, -1)
	end
	return p1
end
script.Parent.appeal.InputBegan:Connect(function(p1) --[[ Line: 38 ]]
	if p1.UserInputType ~= Enum.UserInputType.MouseButton1 then
		return
	end
	appeal()
end)
script.Parent.appeal.TouchTap:Connect(function() --[[ Line: 43 ]]
	appeal()
end)
local v1 = game.ReplicatedStorage.Remotes.Moderation.getBans:InvokeServer()
if not v1 then
	warn("Ban status unverifiable. Server did not return \'UserBans\'")
	return
end
if #v1 > 1 then
	for k, v in pairs(script.Parent:GetChildren()) do
		if v.Name ~= "alreadyappealed" and v.Name ~= "LocalScript" then
			v:Destroy()
		end
	end
	script.Parent.alreadyappealed.Text = "You are not allowed to appeal or already used yours"
	script.Parent.alreadyappealed.Visible = true
else
	if not (#v1 > 0) then
		return
	end
	script.Parent.reason.Text = "Ban reason: " .. replace(v1[#v1].Reason, "\n", " ")
end