-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ButtonTest")
local v2 = Sonar("GuiManager")
local v3 = Sonar("Maid")
local v4 = Sonar("Button")
local v5 = Sonar("GridSort")
local v6 = Sonar("ItemDataService")
local v7 = Sonar("ItemGridButton")
local v8 = Sonar("GuiUtils")
local v9 = Sonar("ItemInfoFrame")
local v10 = Sonar("ShopService")
local v11 = Sonar("PremiumShopGui")
local v12 = Sonar("UINavigator")
local v13 = Sonar("IssueResponseClient")
local v14 = Sonar("StableClubsGui", {
	Deferred = true
})
local v15 = Sonar("PromptClient")
local v16 = Sonar("FormatNumber")
local v17 = Sonar("InstanceUtils")
local LocalPlayer = game:GetService("Players").LocalPlayer
local v18 = Sonar("PlayerWrapper").GetClient()
local ClubShop = LocalPlayer.PlayerGui:WaitForChild("StableClubsGui").ClubShop
local v19 = v3.new()
local v20 = v3.new()
local v21 = v5.new({
	Filters = {
		All = true
	},
	Sorts = {
		ByPrice = {
			Run = function(p1, p2) --[[ Run | Line: 54 ]]
				return p1.Price < p2.Price
			end
		}
	},
	EmptyString = {
		Text = "No items in the shop!",
		Label = ClubShop.Menu.Content.Items.EmptyLabel
	},
	Search = {
		TextBox = ClubShop.Menu.Content.SearchBar.Content.TextBox,
		Run = function(p1, p2) --[[ Run | Line: 67 ]]
			local v1 = p1:lower()
			local v4 = string.find(if p2.Item.Species then p2.Item.Species:lower() else "", v1)
			return if #p1 <= 0 then true else string.find(p2.NameLabel.Text:lower(), v1) or v4
		end
	}
})
local v22 = nil
local t = {}
local t2 = {}
local t3 = {}
for k, v in pairs({}) do
	v21:AddFilter(k, function(p1) --[[ Line: 82 | Upvalues: v (copy) ]]
		return table.find(v, p1.Item.ItemType)
	end)
end
local t4 = {
	Buy = function() --[[ Buy | Line: 88 | Upvalues: v10 (copy), v18 (copy), v22 (ref), v13 (copy) ]]
		local v1 = v10.CanPurchaseClubShopItem(v18, v22.Name)
		if v1 == true then
			v10:PurchaseClubShopItem(v22.Name, 1)
		else
			v13.NotifyIssue(v1)
		end
	end,
	Bulk = function() --[[ Bulk | Line: 98 | Upvalues: v15 (copy), v10 (copy), v22 (ref), v16 (copy), v18 (copy), v13 (copy) ]]
		local v1 = nil
		v15.Prompt({
			Type = "MultiBuy",
			Setup = function(p1) --[[ Setup | Line: 103 | Upvalues: v10 (ref), v22 (ref), v1 (ref), v16 (ref) ]]
				p1.Content.IntValue.Visible = true
				p1.Content.IndexedValue.Visible = false
				local v12 = v10.GetPriceForItem(v22.Name, "ClubShop")
				v1 = p1.Content.IntValue.InputFrame.Content.TextBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 108 | Upvalues: p1 (copy), v16 (ref), v12 (copy) ]]
					if not (#tostring(p1.Content.IntValue.InputFrame.Content.TextBox.Text) > 0) then
						return
					end
					p1.Content.IntValue.InputFrame.Content.TextBox.Text = v16.SanitiseInput((tonumber(p1.Content.IntValue.InputFrame.Content.TextBox.Text)))
					p1.Content.IntValue.Cost.Content.TextLabel.Text = "Price: " .. v12 * p1.Content.IntValue.InputFrame.Content.TextBox.Text
				end)
			end,
			Run = function(p1) --[[ Run | Line: 115 | Upvalues: v10 (ref), v18 (ref), v22 (ref), v13 (ref), v1 (ref) ]]
				local v12 = if #tostring(p1.Content.IntValue.InputFrame.Content.TextBox.Text) > 0 then tonumber(p1.Content.IntValue.InputFrame.Content.TextBox.Text) else 1
				local v3 = v10.CanPurchaseClubShopItem(v18, v22.Name)
				if v3 == true then
					v10:PurchaseClubShopItem(v22.Name, v12)
					v1:Disconnect()
					p1.Content.IntValue.InputFrame.Content.TextBox.Text = ""
					p1.Content.IntValue.Cost.Content.TextLabel.Text = "Price: 0"
					return true
				end
				v13.NotifyIssue(v3)
			end,
			Cancel = function(p1) --[[ Cancel | Line: 137 | Upvalues: v1 (ref) ]]
				p1.Content.IntValue.Cost.Content.TextLabel.Text = "Price: 0"
				v1:Disconnect()
				return true
			end
		})
	end
}
local function setSelectedFrame(p1) --[[ setSelectedFrame | Line: 146 | Upvalues: ClubShop (copy) ]]
	if p1 then
		ClubShop.Menu.Content.Info.Content.Visible = true
		ClubShop.Menu.Content.Info.NotSelected.Visible = false
	else
		ClubShop.Menu.Content.Info.Content.Visible = false
		ClubShop.Menu.Content.Info.NotSelected.Visible = true
	end
end
local function oneTimePurchaseDisable(p1) --[[ oneTimePurchaseDisable | Line: 156 | Upvalues: v18 (copy), t3 (copy), v22 (ref), ClubShop (copy) ]]
	local v1 = false
	if p1.ItemType ~= "Buildings" then
		return v1
	end
	local v2 = v18.PlayerData.UnlockedFurniture:FindFirstChild(p1.Name)
	if v2.Value then
		return true
	end
	v2:GetPropertyChangedSignal("Value"):Once(function() --[[ Line: 164 | Upvalues: t3 (ref), v22 (ref), ClubShop (ref) ]]
		local v1 = t3[v22]
		ClubShop.Menu.Content.Info.Content.Visible = false
		ClubShop.Menu.Content.Info.NotSelected.Visible = true
		v1:Deselect()
		v1:Destroy()
		v22 = nil
	end)
	return v1
end
local function selectItem(p1) --[[ selectItem | Line: 178 | Upvalues: t3 (copy), v22 (ref), v20 (copy), v10 (copy), v9 (copy), ClubShop (copy) ]]
	local v1 = t3[v22]
	if v1 then
		v1:Deselect()
	end
	v20:DoCleaning()
	v22 = p1
	if not p1 then
		ClubShop.Menu.Content.Info.Content.Visible = false
		ClubShop.Menu.Content.Info.NotSelected.Visible = true
		return
	end
	local v2 = t3[p1]
	local v3
	if not v2 then
		v3 = v10.GetPriceForItem(p1.Name, "ClubShop")
		v20:GiveTask(v9.new({
			Item = p1,
			Frame = ClubShop.Menu.Content.Info.Content,
			Price = v3
		}))
		ClubShop.Menu.Content.Info.Content.Buttons.Bulk.Visible = false
		ClubShop.Menu.Content.Info.Content.Visible = true
		ClubShop.Menu.Content.Info.NotSelected.Visible = false
		return
	end
	v2:Select()
	v3 = v10.GetPriceForItem(p1.Name, "ClubShop")
	v20:GiveTask(v9.new({
		Item = p1,
		Frame = ClubShop.Menu.Content.Info.Content,
		Price = v3
	}))
	ClubShop.Menu.Content.Info.Content.Buttons.Bulk.Visible = false
	ClubShop.Menu.Content.Info.Content.Visible = true
	ClubShop.Menu.Content.Info.NotSelected.Visible = false
end
local function createItem(p1, p2) --[[ createItem | Line: 208 | Upvalues: v6 (copy), oneTimePurchaseDisable (copy), v7 (copy), ClubShop (copy), v4 (copy), selectItem (copy), t3 (copy), v19 (copy), v21 (copy) ]]
	local v1 = v6.GetByName(p1)
	if not oneTimePurchaseDisable(v1) then
		local v2 = v7.new({
			GuiSource = "ClubShop",
			Item = v1,
			ParentFrame = ClubShop.Menu.Content.Items,
			Price = p2
		})
		v2:GiveTask(v4.new(v2.Frame, {
			Click = function() --[[ Click | Line: 222 | Upvalues: selectItem (ref), v1 (copy) ]]
				selectItem(v1)
			end
		}))
		t3[v1] = v2
		v19:GiveTask(function() --[[ Line: 228 | Upvalues: v21 (ref), v2 (copy) ]]
			v21:Remove(v2)
		end)
		v19:GiveTask(v2)
		v21:Add(v2, true)
	end
end
function t2.OnOpen(p1, p2) --[[ OnOpen | Line: 235 | Upvalues: v2 (copy), ClubShop (copy), t (copy), v1 (copy), t4 (copy), v8 (copy), v21 (copy), v18 (copy), v11 (copy), v10 (copy), createItem (copy), selectItem (copy) ]]
	local v12 = v2.getFrameFromInstance(ClubShop)
	if not v12.Opened then
		v12.Opened = true
		for k, v in pairs(ClubShop.Menu.Content.Info.Content.Buttons:GetChildren()) do
			if v:IsA("ImageButton") then
				if not t[v.Name] then
					t[v.Name] = {}
				end
				table.insert(t[v.Name], v)
				v1.new(v, {
					Click = t4[v.Name]
				})
			end
		end
		for k, v in pairs(ClubShop.Menu.Content.SortButtons:GetChildren()) do
			if v:IsA("ImageButton") then
				local function setSortButton() --[[ setSortButton | Line: 259 | Upvalues: v8 (ref), v (copy), v21 (ref) ]]
					v8.SetButtonColor(v, "Diagonal", if v.Name == v21.FilterType then "Green" else "Blue")
				end
				v21.FilterChangedSignal:Connect(setSortButton)
				local SetButtonColor = v8.SetButtonColor
				local v4 = if v.Name == v21.FilterType then "Green" else "Blue"
				SetButtonColor(v, "Diagonal", v4)
				v1.new(v, {
					Click = function() --[[ Click | Line: 266 | Upvalues: v21 (ref), v (copy) ]]
						v21:Filter(v.Name)
					end
				})
			end
		end
		v8.CreateCurrencyLabel({
			GuiObject = ClubShop.Menu.Content.Tokens.Content.TextLabel,
			Value = v18:GetCurrencyValue("ClubTokens"),
			OnChanged = function(p1, p2) --[[ OnChanged | Line: 275 ]] end
		})
		v1.new(ClubShop.Menu.Content.Tokens.PurchaseButton, {
			Click = function() --[[ Click | Line: 280 | Upvalues: v11 (ref) ]]
				v11.Open("ClubTokens")
			end
		})
	end
	if v12.ContentsLoaded then
		return
	end
	v12.ContentsLoaded = true
	for k, v in pairs(v10.GetItems("ClubShop")) do
		createItem(k, v)
	end
	v21:Sort(v21.SortType or "ByPrice")
	v21:Filter("All")
	selectItem()
end
function t2.Cleanup(p1) --[[ Cleanup | Line: 300 | Upvalues: selectItem (copy), v19 (copy), v2 (copy), ClubShop (copy) ]]
	selectItem()
	v19:DoCleaning()
	v2.CleanContents(ClubShop)
end
function t2.Open(...) --[[ Open | Line: 307 | Upvalues: v2 (copy), ClubShop (copy), t2 (copy) ]]
	if v2.IsFrameOpen(ClubShop) then
		t2.Close()
	else
		v2.OpenMainFrame(ClubShop, {
			CallbackArgs = { ... }
		})
	end
end
function t2.Close() --[[ Close | Line: 317 | Upvalues: v14 (copy) ]]
	v14.Open()
end
function t2.Init(p1) --[[ Init | Line: 322 | Upvalues: v2 (copy), ClubShop (copy), v12 (copy), t2 (copy), v1 (copy), v17 (copy), v15 (copy) ]]
	v2.AddFrame(ClubShop, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		Background = true,
		ShortcutToClose = true,
		OpenPosition = ClubShop.Position,
		ClosePosition = ClubShop.Position + UDim2.new(0, 0, 0.15, 0),
		SelectOnOpen = ClubShop.Menu.Content.Items.Content
	})
	v12.SetUnselectableWhenSelected(ClubShop.Menu.Content.Items.Content)
	v2.AddStateCallback(ClubShop, "OnOpen", function() --[[ Line: 335 | Upvalues: t2 (ref) ]]
		t2:OnOpen()
	end)
	v2.AddStateCallback(ClubShop, "OnCleanup", function() --[[ Line: 338 | Upvalues: t2 (ref) ]]
		t2:Cleanup()
	end)
	v1.new(ClubShop.Menu.CloseButton, {
		Click = function() --[[ Click | Line: 343 | Upvalues: t2 (ref) ]]
			t2.Close()
		end
	})
	local v13 = v17.GetTagged(ClubShop.Menu, "HelpButton")
	v1.new(v13, {
		Click = function() --[[ Click | Line: 350 | Upvalues: v15 (ref), v17 (ref) ]]
			v15.Prompt({
				Type = "Tutorial",
				Setup = function(p1, p2) --[[ Setup | Line: 353 | Upvalues: v17 (ref) ]]
					for v1, v2 in p1.Content.Prompts:GetChildren() do
						v2.Visible = v2.Name == "Template"
					end
					local Template = p1.Content.Prompts:FindFirstChild("Template")
					local v3 = v17.GetTemplate(Template, "Default")
					for v4, v5 in { "Earn <font color=\'#D4A853\'><b>Club Tokens</b></font> by completing <font color=\'#D4A853\'><b>weekly club missions</b></font> and reaching <font color=\'#D4A853\'><b>club milestones</b></font>.", "Spend your <font color=\'#D4A853\'><b>Club Tokens</b></font> in the <font color=\'#D4A853\'><b>Club Shop</b></font> on exclusive items only available to club members!" } do
						local v6 = v3:Clone()
						p2.Maid:GiveTask(v6)
						v6.LayoutOrder = v4
						v17.GetTagged(v6, "TitleLabel").Text = ""
						v17.GetTagged(v6, "FrameText").Text = v5
						v6.Visible = true
						v6.Parent = v3.Parent
					end
				end,
				Run = function() --[[ Run | Line: 382 ]]
					return true
				end,
				Cancel = function() --[[ Cancel | Line: 385 ]]
					return true
				end
			})
		end
	})
end
t2:Init()
return t2