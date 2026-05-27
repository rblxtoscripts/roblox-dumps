-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("GlobalLeaderboardService")
local v2 = Sonar("GuiFrameworkService")
local v3 = Sonar("Maid")
local v4 = Sonar("safeDestroy")
local v5 = Sonar("UserInfoFetcher")
local v6 = Sonar("TableUtils")
local v7 = Sonar("AtomicBinding")
local v8 = Sonar("StorageUtils")
local v9 = Sonar("StatelessHumanoid")
local v10 = Sonar("PlayerWrapper")
local PodiumAnimations = v8.GetConfig("GlobalLeaderboard")().PodiumAnimations
local v11 = v10:GetClient()
local v12 = v8.GetAsset("HumanoidRig")()
function t.new(p1) --[[ new | Line: 33 | Upvalues: t (copy), v3 (copy), v1 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v3.new()
	v2.Object = p1.root
	v2.LeaderboardPart = p1.PrimaryPart
	v2.LeaderboardName = p1.root:GetAttribute("LeaderboardName")
	v2.TimeFrame = p1.root:GetAttribute("TimeFrame")
	v1.OnLeaderboardAdded(v2.LeaderboardName, function(p1) --[[ Line: 44 | Upvalues: v2 (copy) ]]
		v2:_init()
	end)
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 51 | Upvalues: v4 (copy) ]]
	v4(p1)
end
function t._getLeaderboardGui(p1) --[[ _getLeaderboardGui | Line: 55 | Upvalues: v11 (copy) ]]
	local SurfaceGui = p1.LeaderboardPart:FindFirstChildOfClass("SurfaceGui")
	if SurfaceGui then
		SurfaceGui.Enabled = false
		local v1 = SurfaceGui:Clone()
		v1.Adornee = SurfaceGui.Parent
		v1.Enabled = true
		v1.Parent = v11.PlayerGui.GuiDump
		p1.Maid:GiveTask(v1)
		return v1
	else
		warn("\226\154\160\239\184\143 GlobalLeaderboardModel, LeaderboardGui not found under object", p1.Object:GetFullName())
		return nil
	end
end
function t._init(p1) --[[ _init | Line: 74 | Upvalues: v1 (copy), v2 (copy), v4 (copy) ]]
	p1.GlobalLeaderboard = v1.GetLeaderboard(p1.LeaderboardName)
	p1.TimeFrameLeaderboard = p1.GlobalLeaderboard:GetLeaderboard(p1.TimeFrame)
	if not p1.TimeFrameLeaderboard then
		warn("\226\154\160\239\184\143 GlobalLeaderboardModel, Not a valid time frame leaderboard for", p1.LeaderboardName, p1.TimeFrame)
		return
	end
	p1.LeaderboardGui = p1:_getLeaderboardGui()
	if not p1.LeaderboardGui then
		warn("\226\154\160\239\184\143 GlobalLeaderboardModel, LeaderboardGui not found under object", p1.Object:GetFullName())
		return
	end
	p1.LeaderboardObjectsByUserId = {}
	p1.Leaderboard = {}
	p1.ScrollingFrame = v2.FindElement(p1.LeaderboardGui, "ScrollingFrame")
	p1.YourPlacementLabel = v2.FindElement(p1.LeaderboardGui, "YourPlacementLabel")
	p1.LoadingLabel = v2.FindElement(p1.LeaderboardGui, "LoadingLabel")
	p1.Maid:GiveTask(function() --[[ Line: 96 | Upvalues: p1 (copy) ]]
		for v1, v2 in p1.LeaderboardObjectsByUserId do
			v2:Destroy()
		end
		p1.LeaderboardObjectsByUserId = {}
	end)
	p1.PodiumsFolder = p1.Object:FindFirstChild("Podiums")
	if p1.PodiumsFolder then
		p1.PodiumHumanoidsByUserId = {}
		p1.PodiumDisplays = {}
		for v12, v22 in p1.PodiumsFolder:GetChildren() do
			local v3 = p1:_getPodiumDisplayGui(v22)
			if v3 then
				local v42 = v2.AddComponent("LeaderboardDisplay", {
					Instance = v3,
					Username = {
						Format = function(p1) --[[ Format | Line: 116 ]]
							return "@" .. p1
						end
					}
				})
				p1.Maid:GiveTask(v42)
				p1.PodiumDisplays[tonumber(v22.Name)] = v42
			end
		end
		p1.Maid:GiveTask(function() --[[ Line: 127 | Upvalues: p1 (copy), v4 (ref) ]]
			for v1, v2 in p1.PodiumHumanoidsByUserId do
				v4(v2)
			end
			p1.PodiumHumanoidsByUserId = {}
		end)
	end
	p1.Maid:GiveTask(p1.TimeFrameLeaderboard:GetLeaderboardChangedSignal():Connect(function() --[[ Line: 136 | Upvalues: p1 (copy) ]]
		p1:_updateLeaderboard()
	end))
	p1:_updateLeaderboard(true)
end
function t._updateLeaderboard(p1, p2) --[[ _updateLeaderboard | Line: 153 | Upvalues: v5 (copy), v6 (copy), v2 (copy) ]]
	local v1 = p1.TimeFrameLeaderboard:GetLeaderboard()
	local v22 = next(v1) and v5.Get(v6.ToListByValue(v1, "UserId")) or {}
	p1.Leaderboard = {}
	local t = {}
	for v3, v4 in v1 do
		local v52 = v22[v4.UserId] or {}
		local v62 = p1.LeaderboardObjectsByUserId[v4.UserId]
		if not v62 then
			local v7 = v2.AddComponent("GuiObject", {
				DisplayType = "LeaderboardDisplay",
				Parent = p1.ScrollingFrame,
				Name = v4.UserId
			})
			p1.LeaderboardObjectsByUserId[v4.UserId] = v7
			v62 = v7
		end
		v62:SetPlacement(v3)
		v62:SetScore(v4.Score)
		v62:SetUsername(v52.DisplayName or v52.Username)
		v62:SetLayoutOrder(v3)
		p1.Leaderboard[v3] = v6.Merge(v4, v52)
		t[v4.UserId] = true
	end
	for v9, v10 in p1.LeaderboardObjectsByUserId do
		if not t[v9] then
			v10:Destroy()
			p1.LeaderboardObjectsByUserId[v9] = nil
		end
	end
	p1.LoadingLabel.Visible = not next(v1)
	p1:_updatePodiums(p2)
end
function t._getPodiumAnimationId(p1, p2) --[[ _getPodiumAnimationId | Line: 200 | Upvalues: PodiumAnimations (copy) ]]
	local v1 = PodiumAnimations[p2]
	if tonumber(v1) then
		return "rbxassetid://" .. v1
	else
		return v1
	end
end
function t._getPodiumDisplayGui(p1, p2) --[[ _getPodiumDisplayGui | Line: 209 ]]
	return p2:FindFirstChildOfClass("SurfaceGui") or p2:FindFirstChildOfClass("BillboardGui")
end
function t._getPlayerModel(p1, p2) --[[ _getPlayerModel | Line: 214 | Upvalues: v12 (copy), v9 (copy), Players (copy) ]]
	local v1 = v12:Clone()
	v9.makeStateless(v1.Humanoid)
	v1.PrimaryPart.Anchored = true
	v1.Parent = p1.PodiumsFolder
	local v2, v3 = pcall(function() --[[ Line: 222 | Upvalues: v1 (copy), Players (ref), p2 (copy) ]]
		return v1.Humanoid:ApplyDescription(Players:GetHumanoidDescriptionFromUserId(p2), Enum.AssetTypeVerification.ClientOnly)
	end)
	if not v2 then
		warn("\226\154\160\239\184\143 GlobalLeaderboardModel, Failed to apply humanoid description to player model", v3)
		v1:Destroy()
		return nil
	end
	for v4, v5 in v1:GetDescendants() do
		if v5:IsA("BasePart") then
			v5.CanCollide = false
			v5.CanTouch = false
			v5.CanQuery = false
		end
	end
	return v1
end
function t._updatePodiums(p1, p2) --[[ _updatePodiums | Line: 242 | Upvalues: v3 (copy), v6 (copy), v4 (copy) ]]
	if not p1.PodiumsFolder then
		return
	end
	local t = {}
	for v1, v2 in p1.PodiumsFolder:GetChildren() do
		local v42 = tonumber(v2.Name)
		local v5 = p1:_getPodiumDisplayGui(v2)
		local v62 = p1.Leaderboard[v42]
		if v62 then
			t[v42] = v62
		end
		if not t[v42] and v5 then
			v5.Enabled = false
		end
	end
	local t2 = {}
	for v7, v8 in t do
		local v9 = p1.PodiumsFolder:FindFirstChild(v7)
		if v9 then
			local v10 = p1.PodiumHumanoidsByUserId[v8.UserId]
			if not v10 then
				p1.PodiumHumanoidsByUserId[v8.UserId] = {
					Maid = v3.new(),
					PodiumModel = v9
				}
				v10 = p1.PodiumHumanoidsByUserId[v8.UserId]
			end
			local v12 = v6.MergeOriginal(v10, v8)
			if not v12.Model then
				local v13 = p1:_getPlayerModel(v8.UserId)
				if v13 then
					v12.Maid:GiveTask(v13)
					v12.Model = v13
					v12.Humanoid = v13:WaitForChild("Humanoid")
				end
			end
			local v14 = v12
			if v14.LastPlacement ~= v7 then
				v14.LastPlacement = v7
				if v14.Model then
					if v14.Animation then
						v14.Animation:Stop()
					end
					v14.AnimationInstance = nil
					local Animation = Instance.new("Animation")
					Animation.AnimationId = p1:_getPodiumAnimationId(v7)
					v14.AnimationInstance = Animation
					local v15 = v14.Humanoid.Animator:LoadAnimation(Animation)
					v14.Animation = v15
					v15:Play()
					local v16 = v9.CFrame * CFrame.new(0, v9.Size.Y / 2, 0)
					local v18 = CFrame.fromMatrix(v16.Position, v16.XVector, v16.YVector, v16.ZVector)
					v14.Model:SetPrimaryPartCFrame(v18 * CFrame.new(0, v14.Humanoid.HipHeight + v14.Model.PrimaryPart.Size.Y / 2, 0))
				end
			end
			local v19 = p1.PodiumDisplays[v7]
			if v19 then
				v19:SetPlacement(v7)
				v19:SetDisplayName(v14.DisplayName or v14.Username)
				v19:SetUsername(v14.Username)
				v19:SetScore(v8.Score)
				v19.Instance.Enabled = true
			end
			t2[v8.UserId] = true
		end
	end
	for v21, v22 in p1.PodiumDisplays do
		if not t[v21] then
			v22:Reset()
		end
	end
	for v23, v24 in p1.PodiumHumanoidsByUserId do
		if not t2[v23] then
			v4(v24)
			p1.PodiumHumanoidsByUserId[v23] = nil
		end
	end
end
function t.Init(p1) --[[ Init | Line: 364 | Upvalues: v7 (copy), t (copy) ]]
	v7.new("GlobalLeaderboard", { "PrimaryPart" }, function(p1) --[[ Line: 368 | Upvalues: t (ref) ]]
		return t.new(p1)
	end)
end
t:Init()
return t