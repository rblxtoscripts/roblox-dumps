-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("GuiFrameworkService")
local v4 = Sonar("FormatTime")
local v5 = Sonar("StipendService")
local v6 = Sonar("FormatString")
local v7 = Sonar("PlayerWrapper").GetClient()
function t.new(p1) --[[ new | Line: 19 | Upvalues: t (copy), v1 (copy), v3 (copy), v5 (copy), v7 (copy), v4 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Context = p1
	v2.Config = v3.GetComponentConfig(p1)
	v2.Instance = p1.Instance
	v2.Stipend = p1.Stipend
	if not v2.Stipend then
		warn("\226\154\160\239\184\143 StipendDisplay, Stipend is required for stipend display", v2.Instance, v2.Config)
		return v2
	end
	v2.ClaimableChangedSignal = v2.Maid:GiveTask(v5.GetClaimableStipendChangedSignal(v7, v2.Stipend.Name))
	v2.NameLabel = v3.FindElement(v2.Instance, "NameLabel")
	v2:_setName()
	v2.ImageLabel = v3.FindElement(v2.Instance, "ImageLabel")
	v2:_setImage()
	v2.DescriptionLabel = v3.FindElement(v2.Instance, "DescriptionLabel")
	v2:_setDescription()
	v2.Maid:GiveTask(v2.ClaimableChangedSignal:Connect(function() --[[ Line: 48 | Upvalues: v2 (copy) ]]
		v2:_setClaimable()
	end))
	v2:_setClaimable()
	v2.ClaimButton = v3.FindElement(v2.Instance, "ClaimButton")
	if v2.ClaimButton then
		v2.Maid:GiveTask(v3.AddComponent("Button", {
			Instance = v2.ClaimButton,
			OnClick = function() --[[ OnClick | Line: 57 | Upvalues: v5 (ref), v7 (ref), v2 (copy), v3 (ref) ]]
				local v1, v22 = v5.CanClaimStipend(v7, v2.Stipend.Name)
				if v1 == true then
					v5.RequestToClaimStipend(v2.Stipend.Name)
				else
					v3.Notify({
						Response = v1,
						Args = { v22 }
					})
				end
			end
		}))
		v2.Maid:GiveTask(v3.AddComponent("TimerDisplay", {
			Instance = v2.ClaimButton,
			Format = function(p1) --[[ Format | Line: 73 | Upvalues: v4 (ref) ]]
				if p1 <= 0 then
					return "Claim"
				else
					return v4.FormatString(p1)
				end
			end,
			EndTime = function() --[[ EndTime | Line: 79 | Upvalues: v5 (ref), v7 (ref), v2 (copy) ]]
				return v5.GetStipendClaimTime(v7, v2.Stipend.Name)
			end,
			Changed = { v2.ClaimableChangedSignal },
			OnTimeChanged = function(p1, p2) --[[ OnTimeChanged | Line: 85 ]]
				if p2.TimeLeft <= 0 then
					p1.TimerLabel.TextColor3 = Color3.fromRGB(72, 108, 55)
					p1.TimerLabel.TextTransparency = 0
					p1.Instance.BG.ImageColor3 = Color3.fromRGB(159, 191, 94)
					p1.Instance.BG.Image = "rbxassetid://87714936832036"
				else
					p1.TimerLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
					p1.TimerLabel.TextTransparency = 0.44
					p1.Instance.BG.ImageColor3 = Color3.fromRGB(171, 171, 171)
					p1.Instance.BG.Image = "rbxassetid://114195461342870"
				end
			end
		}))
	end
	v2.NotificationBadge = v3.FindElement(v2.Instance, "NotificationBadge")
	if v2.NotificationBadge then
		v2.Maid:GiveTask(v3.AddComponent("NotificationBadge", {
			Instance = v2.NotificationBadge,
			CanShow = function() --[[ CanShow | Line: 105 | Upvalues: v2 (copy) ]]
				return v2:IsClaimable()
			end,
			Changed = { v2.ClaimableChangedSignal }
		}))
	end
	v2.ItemsFrame = v3.FindElement(v2.Instance, "ItemsFrame")
	v2:_setItems()
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 120 | Upvalues: v2 (copy) ]]
	v2(p1)
end
function t._setName(p1) --[[ _setName | Line: 124 | Upvalues: v6 (copy) ]]
	if p1.NameLabel then
		p1.NameLabel.Text = v6.GetDisplayName(p1.Stipend)
	end
end
function t._setImage(p1) --[[ _setImage | Line: 132 ]]
	if not p1.ImageLabel then
		return
	end
	if not p1.Stipend.Image then
		p1.ImageLabel.Visible = false
		return
	end
	p1.ImageLabel.Visible = true
	p1.ImageLabel.Image = tonumber(p1.Stipend.Image) and "rbxassetid://" .. p1.Stipend.Image or p1.Stipend.Image
end
function t._setDescription(p1) --[[ _setDescription | Line: 147 ]]
	if not p1.DescriptionLabel then
		return
	end
	if p1.Stipend.Description then
		p1.DescriptionLabel.Visible = true
		p1.DescriptionLabel.Text = p1.Stipend.Description
	else
		p1.DescriptionLabel.Visible = false
	end
end
function t._setItems(p1) --[[ _setItems | Line: 161 | Upvalues: v1 (copy), v3 (copy) ]]
	if p1.ItemsMaid then
		p1.ItemsMaid:DoCleaning()
	end
	if not p1.ItemsFrame then
		return
	end
	if type(p1.Stipend.Items) ~= "table" then
		warn("\226\154\160\239\184\143 StipendDisplay, Items must be a table", p1.Stipend.Items, p1.Instance, p1.Config)
		return
	end
	if not p1.ItemsMaid then
		p1.ItemsMaid = v1.new()
		p1.Maid:GiveTask(p1.ItemsMaid)
	end
	p1.ItemsMaid:GiveTask(p1.ClaimableChangedSignal:Connect(function() --[[ Line: 181 | Upvalues: p1 (copy) ]]
		p1:_setItems()
	end))
	p1.ItemsMaid:GiveTask(v3.AddComponent("MultiItemDisplay", {
		Instance = p1.ItemsFrame,
		Items = p1.Stipend.Items
	}))
	p1.ItemsFrame.Visible = true
end
function t._setClaimable(p1) --[[ _setClaimable | Line: 193 ]]
	if not p1.Config.OnClaimableChanged then
		return
	end
	p1.Config.OnClaimableChanged(p1)
end
function t.IsClaimable(p1) --[[ IsClaimable | Line: 199 | Upvalues: v5 (copy), v7 (copy) ]]
	return v5.IsStipendClaimable(v7, p1.Stipend.Name)
end
function t.HasPermission(p1) --[[ HasPermission | Line: 203 | Upvalues: v5 (copy), v7 (copy) ]]
	return v5.HasStipendPermission(v7, p1.Stipend.Name)
end
return t