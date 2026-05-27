-- https://lua.expert/
local t = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ButtonTest")
local v2 = Sonar("FormatNumber")
local v3 = Sonar("GuiManager")
local v4 = Sonar("Maid")
local v5 = Sonar("PlayerWrapper")
local v6 = Sonar("RemoteUtils")
local v7 = Sonar("StorageUtils")
local v8 = Sonar("TutorialService")
local v9 = Sonar(v7.Get("Polls"))
local v10 = v6.GetRemoteFunction("GetPolls")
local v11 = v6.GetRemoteEvent("VoteInPoll")
local LocalPlayer = Players.LocalPlayer
local v12 = v5.GetClient()
local ContainerFrame = LocalPlayer.PlayerGui:WaitForChild("VotingGui").ContainerFrame
local Menu = ContainerFrame.Menu
local CloseButton = Menu.CloseButton
local HelpButton = Menu.HelpButton
local VotesList = Menu.VotesList
local Template = VotesList.Content.ScrollingFrame.Template
local VotingFrame = Menu.VotingFrame
local CancelButton = VotingFrame.CancelButton
local Template_2 = VotingFrame.Content.ScrollingFrame.Template
local v13 = nil
local v14 = v4.new()
local v15 = v4.new()
local v16 = v4.new()
local t2 = {}
local function getDateLabel(p1) --[[ getDateLabel | Line: 51 ]]
	if typeof(p1) ~= "DateTime" then
		return "Voting open", ""
	end
	local v1 = DateTime.now().UnixTimestamp < p1.UnixTimestamp
	local v2 = p1:FormatLocalTime("MMMM D, YYYY", "en-us")
	local v3 = p1:FormatLocalTime("h:mm A", "en-us")
	if v1 then
		return "Voting ends " .. v2, v3
	else
		return "Voting ended " .. v2, v3
	end
end
local function getOptionText(p1, p2) --[[ getOptionText | Line: 69 ]]
	if typeof(p1) == "string" then
		return p1
	else
		return tostring(p2)
	end
end
local function getPollTitle(p1, p2) --[[ getPollTitle | Line: 74 ]]
	if typeof(p2) == "table" then
		return p2.Name or p1
	else
		return p1
	end
end
local function getPollVotesTotal(p1) --[[ getPollVotesTotal | Line: 83 ]]
	local sum = 0
	for v2, v3 in if p1 then p1 else {} do
		sum = sum + (tonumber(v3) or 0)
	end
	return sum
end
local function getPopularityTransparency(p1, p2) --[[ getPopularityTransparency | Line: 93 ]]
	local v1 = if p2 > 0 then math.clamp(p1 / p2, 0, 1) else 0
	if v1 <= 0 then
		return NumberSequence.new(1)
	end
	if v1 >= 1 then
		return NumberSequence.new(0)
	else
		local v2 = math.max(0, v1 - 0.001)
		return NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0),
			NumberSequenceKeypoint.new(v2, 0),
			NumberSequenceKeypoint.new(v1, 1),
			NumberSequenceKeypoint.new(1, 1)
		})
	end
end
local function getPlayerVoteInPoll(p1) --[[ getPlayerVoteInPoll | Line: 114 | Upvalues: t2 (copy), v12 (copy) ]]
	if t2[p1] ~= nil then
		return t2[p1]
	end
	local VotedPolls = v12.PlayerData:FindFirstChild("VotedPolls")
	local v1 = if VotedPolls then VotedPolls:FindFirstChild(p1) else VotedPolls
	if v1 and v1:IsA("IntValue") then
		return v1.Value
	else
		return nil
	end
end
local function hasPlayerVoted(p1) --[[ hasPlayerVoted | Line: 129 | Upvalues: t2 (copy), v12 (copy) ]]
	local v1
	if t2[p1] == nil then
		local VotedPolls = v12.PlayerData:FindFirstChild("VotedPolls")
		local v2 = if VotedPolls then VotedPolls:FindFirstChild(p1) else VotedPolls
		v1 = if v2 and v2:IsA("IntValue") then v2.Value else nil
	else
		v1 = t2[p1]
	end
	return v1 ~= nil
end
local function isPollNotYetOpen(p1) --[[ isPollNotYetOpen | Line: 134 ]]
	if typeof(p1) ~= "table" then
		return false
	end
	local OpenDate = p1.OpenDate
	if typeof(OpenDate) ~= "DateTime" then
		return false
	end
	return OpenDate.UnixTimestamp > DateTime.now().UnixTimestamp
end
local function isPollClosed(p1) --[[ isPollClosed | Line: 148 ]]
	if typeof(p1) ~= "table" then
		return false
	end
	local CloseDate = p1.CloseDate
	if typeof(CloseDate) ~= "DateTime" then
		return false
	end
	return CloseDate.UnixTimestamp <= DateTime.now().UnixTimestamp
end
local function getShuffledOptionIndices(p1, p2, p3) --[[ getShuffledOptionIndices | Line: 162 | Upvalues: LocalPlayer (copy) ]]
	local t = {}
	for v1 in p1 do
		table.insert(t, v1)
	end
	table.sort(t)
	if p3 then
		return t
	end
	local v2 = Random.new(LocalPlayer.AccountAge)
	for i = #t, 2, -1 do
		local v3 = v2:NextInteger(1, i)
		local v5 = t[i]
		t[i] = t[v3]
		t[v3] = v5
	end
	return t
end
local function setVotingCancelButtonText(p1) --[[ setVotingCancelButtonText | Line: 183 | Upvalues: CancelButton (copy) ]]
	local v1 = CancelButton:FindFirstChild("Top") and CancelButton.Top:FindFirstChild("TextLabel")
	if not (v1 and v1:IsA("TextLabel")) then
		return
	end
	v1.Text = if p1 then "Back" else "Cancel"
end
local function setListVisible(p1) --[[ setListVisible | Line: 192 | Upvalues: VotesList (copy), VotingFrame (copy) ]]
	VotesList.Visible = p1
	VotingFrame.Visible = not p1
end
local function sortPollIds() --[[ sortPollIds | Line: 198 | Upvalues: v9 (copy) ]]
	local t = {}
	for v2, v3 in v9 do
		local v1
		if typeof(v3) == "table" then
			local OpenDate = v3.OpenDate
			v1 = if typeof(OpenDate) == "DateTime" then if OpenDate.UnixTimestamp > DateTime.now().UnixTimestamp then true else false else false
		else
			v1 = false
		end
		if not v1 then
			table.insert(t, v2)
		end
	end
	table.sort(t, function(p1, p2) --[[ Line: 206 | Upvalues: v9 (ref) ]]
		local v1 = v9[p1]
		local v2 = v9[p2]
		local v3
		if typeof(v1) == "table" then
			local CloseDate = v1.CloseDate
			v3 = if typeof(CloseDate) == "DateTime" then if CloseDate.UnixTimestamp <= DateTime.now().UnixTimestamp then true else false else false
		else
			v3 = false
		end
		local v4
		if typeof(v2) == "table" then
			local CloseDate = v2.CloseDate
			v4 = if typeof(CloseDate) == "DateTime" then if CloseDate.UnixTimestamp <= DateTime.now().UnixTimestamp then true else false else false
		else
			v4 = false
		end
		if v3 ~= v4 then
			return not v3
		end
		local v5 = v1 and v1.CloseDate and v1.CloseDate.UnixTimestamp or (1 / 0)
		local v6 = v2 and v2.CloseDate and v2.CloseDate.UnixTimestamp or (1 / 0)
		if v5 == v6 then
			return p1 < p2
		else
			return v5 < v6
		end
	end)
	return t
end
local function clearVotesList() --[[ clearVotesList | Line: 230 | Upvalues: v15 (copy), Template (copy) ]]
	v15:DoCleaning()
	for v1, v2 in Template.Parent:GetChildren() do
		if v2 ~= Template and not v2:IsA("UIListLayout") then
			v2:Destroy()
		end
	end
end
local function requestPollVotes() --[[ requestPollVotes | Line: 247 | Upvalues: v10 (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 248 | Upvalues: v10 (ref) ]]
		return v10:InvokeServer()
	end)
	if not v1 then
		warn("[PollsClient] Failed to fetch polls:", v2)
		return nil
	end
	if typeof(v2) == "table" then
		return v2
	else
		return nil
	end
end
local function showVotesList() --[[ showVotesList | Line: 265 | Upvalues: VotesList (copy), VotingFrame (copy), clearVotesList (copy), v13 (ref), sortPollIds (copy), v9 (copy), Template (copy), t2 (copy), v12 (copy), v2 (copy), v15 (copy), v1 (copy), t (copy) ]]
	VotesList.Visible = true
	VotingFrame.Visible = false
	clearVotesList()
	local v14 = v13 ~= nil
	for v6, v7 in sortPollIds() do
		local v22, v3, v4, v5
		local v8 = v9[v7]
		local v92 = Template:Clone()
		local v10 = v14 and v13[v7] or {}
		local sum = 0
		for v122, v132 in if v10 then v10 else {} do
			sum = sum + (tonumber(v132) or 0)
		end
		local v142 = if v8 then v8.CloseDate else v8
		if typeof(v142) == "DateTime" then
			local v152 = DateTime.now().UnixTimestamp < v142.UnixTimestamp
			local v16 = v142:FormatLocalTime("MMMM D, YYYY", "en-us")
			local v17 = v142:FormatLocalTime("h:mm A", "en-us")
			if v152 then
				v22 = "Voting ends " .. v16
				v3 = v17
				v4 = sum
			else
				v22 = "Voting ended " .. v16
				v3 = v17
				v4 = sum
			end
		else
			v22 = "Voting open"
			v3 = ""
			v4 = sum
		end
		if t2[v7] == nil then
			local VotedPolls = v12.PlayerData:FindFirstChild("VotedPolls")
			local v18 = if VotedPolls then VotedPolls:FindFirstChild(v7) else VotedPolls
			v5 = if v18 and v18:IsA("IntValue") then v18.Value else nil
		else
			v5 = t2[v7]
		end
		local v19 = if v5 == nil then false else true
		if not v19 and typeof(v8) == "table" then
			local CloseDate = v8.CloseDate
			v19 = if typeof(CloseDate) == "DateTime" then if CloseDate.UnixTimestamp <= DateTime.now().UnixTimestamp then true else false else false
		elseif not v19 then
			v19 = false
		end
		v92.Name = v7
		v92.Visible = true
		v92.TextFrame.Title.Text = if typeof(v8) == "table" then v8.Name or v7 else v7
		v92.TextFrame.VotesLabel.Text = "Total Votes: " .. v2.splice(v4)
		v92.TextFrame.VotesLabel.Visible = v14
		v92.TextFrame.DateLabel.Text = v22
		v92.TextFrame.TimeLabel.Text = v3
		local v21 = v92.ViewButton:FindFirstChild("Top") and v92.ViewButton.Top:FindFirstChild("TextLabel")
		if v21 and v21:IsA("TextLabel") then
			v21.Text = if v19 then "See Results" else "Vote"
		end
		v15:GiveTask(v1.new(v92.ViewButton, {
			Click = function() --[[ Click | Line: 293 | Upvalues: t (ref), v7 (copy) ]]
				t.OpenPoll(v7)
			end
		}))
		v92.Parent = Template.Parent
	end
end
local function clearVotingOptions() --[[ clearVotingOptions | Line: 303 | Upvalues: v16 (copy), Template_2 (copy) ]]
	v16:DoCleaning()
	for v1, v2 in Template_2.Parent:GetChildren() do
		if v2:GetAttribute("IsPollClone") then
			v2:Destroy()
		end
	end
end
function t.Open(p1) --[[ Open | Line: 314 | Upvalues: v13 (ref), v10 (copy), ContainerFrame (copy), showVotesList (copy), v3 (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 248 | Upvalues: v10 (ref) ]]
		return v10:InvokeServer()
	end)
	local v32
	if v1 then
		v32 = if typeof(v2) == "table" then v2 else nil
	else
		warn("[PollsClient] Failed to fetch polls:", v2)
		v32 = nil
	end
	if not v32 then
		v32 = v13
	end
	v13 = v32
	ContainerFrame:SetAttribute("PollSource", if p1 then p1.Name or "" else "")
	showVotesList()
	v3.OpenMainFrame(ContainerFrame, {
		CloseAll = "CloseOverlay"
	})
	return true
end
function t.OpenPoll(p1) --[[ OpenPoll | Line: 327 | Upvalues: v9 (copy), VotesList (copy), VotingFrame (copy), clearVotingOptions (copy), v13 (ref), t2 (copy), v12 (copy), CancelButton (copy), v2 (copy), Template_2 (copy), getShuffledOptionIndices (copy), getPopularityTransparency (copy), v16 (copy), v1 (copy), t (copy) ]]
	local v14 = v9[p1]
	if not v14 then
		return false
	end
	local v22
	if typeof(v14) == "table" then
		local OpenDate = v14.OpenDate
		v22 = if typeof(OpenDate) == "DateTime" then if OpenDate.UnixTimestamp > DateTime.now().UnixTimestamp then true else false else false
	else
		v22 = false
	end
	if v22 then
		return false
	end
	VotesList.Visible = false
	VotingFrame.Visible = true
	clearVotingOptions()
	local v3 = if v13 == nil then false else true
	local v4 = v3 and v13[p1] or {}
	local sum = 0
	for v6, v7 in if v4 then v4 else {} do
		sum = sum + (tonumber(v7) or 0)
	end
	local CloseDate = v14.CloseDate
	local v8, v92
	if typeof(CloseDate) == "DateTime" then
		local v10 = DateTime.now().UnixTimestamp < CloseDate.UnixTimestamp
		local v11 = CloseDate:FormatLocalTime("MMMM D, YYYY", "en-us")
		CloseDate:FormatLocalTime("h:mm A", "en-us")
		if v10 then
			v8 = "Voting ends " .. v11
			v92 = sum
		else
			v8 = "Voting ended " .. v11
			v92 = sum
		end
	else
		v8 = "Voting open"
		v92 = sum
	end
	local v122
	if t2[p1] == nil then
		local VotedPolls = v12.PlayerData:FindFirstChild("VotedPolls")
		local v132 = if VotedPolls then VotedPolls:FindFirstChild(p1) else VotedPolls
		v122 = if v132 and v132:IsA("IntValue") then v132.Value else nil
	else
		v122 = t2[p1]
	end
	local v142 = if v122 == nil then false else true
	if not v142 and typeof(v14) == "table" then
		local CloseDate_2 = v14.CloseDate
		v142 = if typeof(CloseDate_2) == "DateTime" then if CloseDate_2.UnixTimestamp <= DateTime.now().UnixTimestamp then true else false else false
	elseif not v142 then
		v142 = false
	end
	local v15
	if t2[p1] == nil then
		local VotedPolls = v12.PlayerData:FindFirstChild("VotedPolls")
		local v162 = if VotedPolls then VotedPolls:FindFirstChild(p1) else VotedPolls
		v15 = if v162 and v162:IsA("IntValue") then v162.Value else nil
	else
		v15 = t2[p1]
	end
	local v17 = CancelButton:FindFirstChild("Top") and CancelButton.Top:FindFirstChild("TextLabel")
	if v17 and v17:IsA("TextLabel") then
		v17.Text = if v142 then "Back" else "Cancel"
	end
	VotingFrame.Title.Text = if typeof(v14) == "table" then v14.Name or p1 else p1
	VotingFrame.VotesLabel.Text = "Total Votes: " .. v2.splice(v92)
	VotingFrame.VotesLabel.Visible = v3
	VotingFrame.DateLabel.Text = v8
	local v20 = Template_2:Clone()
	v20.Name = ("Poll_%*"):format(p1)
	v20.Visible = true
	v20:SetAttribute("IsPollClone", true)
	v20.Parent = Template_2.Parent
	local Template = v20:FindFirstChild("Template", true)
	if not Template then
		return false
	end
	local OptionsGrid = Template:FindFirstChild("OptionsGrid")
	local v21 = if OptionsGrid then OptionsGrid:FindFirstChild("VoteOption") else OptionsGrid
	if not (OptionsGrid and v21) then
		return false
	end
	local Title_2 = Template:FindFirstChild("Title", true)
	if Title_2 and Title_2:IsA("TextLabel") then
		Title_2.Text = v14.Description or (if typeof(v14) == "table" then v14.Name or p1 else p1)
	end
	v21.Visible = false
	local v23 = v14.Options or {}
	for i, v in ipairs((getShuffledOptionIndices(v23, p1, v14.MaintainOptionOrder))) do
		local v25, v26, v27
		local v28 = v23[v]
		local v29 = v21:Clone()
		v29.Visible = true
		v29.Name = tostring(v)
		v29.LayoutOrder = i
		local v31 = tonumber(v4[v])
		if not v31 then
			v31 = tonumber(v4[tostring(v)]) or 0
		end
		local v33 = if typeof(v28) == "string" then v28 else tostring(v)
		local TextLabel = v29:FindFirstChild("TextLabel", true)
		local ButtonLabel = v29:FindFirstChild("ButtonLabel")
		local Tab = ButtonLabel:FindFirstChild("Tab")
		local v34 = if Tab then Tab:FindFirstChildWhichIsA("UIGradient") else Tab
		if v34 then
			v25 = if v142 and v3 then getPopularityTransparency(v31, v92) else NumberSequence.new(1)
			v34.Transparency = v25
		end
		if TextLabel and TextLabel:IsA("TextLabel") then
			v26 = if v142 and v15 == v then " (Voted)" else ""
			v27 = if v142 and v3 then (" (%* votes)"):format((v2.splice(v31))) else ""
			TextLabel.Text = ("%*%*%*"):format(v33, v27, v26)
		end
		if ButtonLabel and ButtonLabel:IsA("GuiButton") then
			ButtonLabel.Interactable = not v142
			v16:GiveTask(v1.new(ButtonLabel, {
				Click = function() --[[ Click | Line: 410 | Upvalues: p1 (copy), t2 (ref), v12 (ref), v14 (copy), t (ref), v (copy) ]]
					local v1 = p1
					local v2
					if t2[v1] == nil then
						local VotedPolls = v12.PlayerData:FindFirstChild("VotedPolls")
						local v3 = if VotedPolls then VotedPolls:FindFirstChild(v1) else VotedPolls
						v2 = if v3 and v3:IsA("IntValue") then v3.Value else nil
					else
						v2 = t2[v1]
					end
					if v2 ~= nil then
						return
					end
					local v5 = v14
					local v6
					if typeof(v5) == "table" then
						local CloseDate = v5.CloseDate
						v6 = if typeof(CloseDate) == "DateTime" then CloseDate.UnixTimestamp <= DateTime.now().UnixTimestamp else false
					else
						v6 = false
					end
					if v6 then
						return
					end
					local v7 = v14
					local v8
					if typeof(v7) == "table" then
						local OpenDate = v7.OpenDate
						v8 = if typeof(OpenDate) == "DateTime" then OpenDate.UnixTimestamp > DateTime.now().UnixTimestamp else false
					else
						v8 = false
					end
					if not v8 then
						t.Vote(p1, v)
						t2[p1] = v
						t.Refresh()
						t.OpenPoll(p1)
					end
				end
			}))
		end
		v29.Parent = v21.Parent
	end
	return true
end
function t.Refresh() --[[ Refresh | Line: 430 | Upvalues: v13 (ref), v10 (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 248 | Upvalues: v10 (ref) ]]
		return v10:InvokeServer()
	end)
	local v3
	if v1 then
		v3 = if typeof(v2) == "table" then v2 else nil
	else
		warn("[PollsClient] Failed to fetch polls:", v2)
		v3 = nil
	end
	if not v3 then
		v3 = v13
	end
	v13 = v3
	return v3
end
function t.Close() --[[ Close | Line: 436 | Upvalues: clearVotingOptions (copy), clearVotesList (copy), v3 (copy), ContainerFrame (copy) ]]
	clearVotingOptions()
	clearVotesList()
	v3.CloseMainFrame(ContainerFrame)
end
function t.Vote(p1, p2) --[[ Vote | Line: 443 | Upvalues: v11 (copy), v13 (ref) ]]
	assert(if typeof(p1) == "string" then true else false, "pollId must be a string")
	assert(if typeof(p2) == "number" then true else false, "optionId must be a number")
	v11:FireServer(p1, p2)
	v13 = nil
end
function t.Init(p1) --[[ Init | Line: 452 | Upvalues: Template (copy), Template_2 (copy), VotesList (copy), VotingFrame (copy), v3 (copy), ContainerFrame (copy), v14 (copy), v1 (copy), CloseButton (copy), t (copy), HelpButton (copy), v8 (copy), CancelButton (copy), showVotesList (copy) ]]
	Template.Visible = false
	Template_2.Visible = false
	VotesList.Visible = true
	VotingFrame.Visible = false
	v3.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		ShortcutToClose = true,
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.15, 0),
		SelectOnOpen = VotesList.Content.ScrollingFrame
	})
	v14:GiveTask(v1.new(CloseButton, {
		Click = t.Close
	}))
	v14:GiveTask(v1.new(HelpButton, {
		Click = function() --[[ Click | Line: 472 | Upvalues: v8 (ref) ]]
			v8.PromptPopupInfo("PollVoting")
		end
	}))
	v14:GiveTask(v1.new(CancelButton, {
		Click = function() --[[ Click | Line: 478 | Upvalues: showVotesList (ref) ]]
			showVotesList()
		end
	}))
end
t:Init()
return t