-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("Maid")
local v3 = Sonar("safeDestroy")
local v4 = Sonar("FormatNumber")
local v5 = Sonar("StorageUtils").GetConfig("GlobalLeaderboard")()
local PlacementColors = v5.PlacementColors
local UserInfoFallbackText = v5.UserInfoFallbackText
function t.new(p1) --[[ new | Line: 20 | Upvalues: t (copy), v2 (copy), v1 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.Context = p1
	v22.Config = v1.GetComponentConfig(p1)
	v22.Instance = p1.Instance
	v22.TrophyLabel = v1.FindElement(v22.Instance, "TrophyLabel")
	v22.PlacementLabel = v1.FindElement(v22.Instance, "PlacementLabel")
	v22.ScoreLabel = v1.FindElement(v22.Instance, "ScoreLabel")
	v22.UsernameLabel = v1.FindElement(v22.Instance, "UsernameLabel")
	v22.DisplayNameLabel = v1.FindElement(v22.Instance, "DisplayNameLabel")
	v22.UsernameConfig = type(v22.Config.Username) == "table" and v22.Config.Username or {
		Value = v22.Config.Username
	}
	if v22.UsernameConfig.Value then
		v22:SetUsername(v22.UsernameConfig.Value)
	end
	if v22.Config.DisplayName then
		v22:SetDisplayName(v22.Config.DisplayName)
	end
	if v22.Config.Score then
		v22:SetScore(v22.Config.Score)
	end
	if v22.Config.Placement then
		v22:SetPlacement(v22.Config.Placement)
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 57 | Upvalues: v3 (copy) ]]
	v3(p1)
end
function t.SetPlacement(p1, p2) --[[ SetPlacement | Line: 61 | Upvalues: PlacementColors (copy), v4 (copy) ]]
	local v1 = PlacementColors[p2]
	if p1.PlacementLabel then
		if v1 then
			p1.PlacementLabel.TextColor3 = v1
		end
		p1.PlacementLabel.Text = v4.GetOrdinalOfNumber(p2)
	end
	if p1.TrophyLabel then
		if v1 then
			p1.TrophyLabel.ImageColor3 = v1
			p1.TrophyLabel.Visible = true
		else
			p1.TrophyLabel.Visible = false
		end
	end
	p1.LastPlacement = p2
end
function t.SetScore(p1, p2) --[[ SetScore | Line: 85 | Upvalues: v4 (copy) ]]
	if not p1.ScoreLabel then
		return
	end
	p1.ScoreLabel.Text = v4.suffix(p2)
end
function t._getUsername(p1, p2) --[[ _getUsername | Line: 91 | Upvalues: UserInfoFallbackText (copy) ]]
	local v1 = if p2 then p2 else p1.UsernameConfig.Value
	local v2
	if v1 then
		local v3
		if p1.UsernameConfig.Format then
			v2 = p1.UsernameConfig.Format(v1)
			if not v2 then
				v3 = v1
				v2 = v1 or UserInfoFallbackText
			end
		else
			v3 = v1
			v2 = v1 or UserInfoFallbackText
		end
	else
		v2 = UserInfoFallbackText
	end
	return v2
end
function t.SetUsername(p1, p2) --[[ SetUsername | Line: 98 ]]
	if not p1.UsernameLabel then
		return
	end
	p1.UsernameLabel.Text = p1:_getUsername(p2)
end
function t.SetDisplayName(p1, p2) --[[ SetDisplayName | Line: 104 | Upvalues: UserInfoFallbackText (copy) ]]
	if not p1.DisplayNameLabel then
		return
	end
	p1.DisplayNameLabel.Text = if p2 then p2 else p1:_getUsername() or UserInfoFallbackText
end
function t.Reset(p1) --[[ Reset | Line: 110 ]]
	if p1.TrophyLabel then
		p1.TrophyLabel.Visible = false
	end
	if not p1.Instance:IsA("LayerCollector") then
		return
	end
	p1.Instance.Enabled = false
end
return t