-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("InteractMenu")
local v2 = Sonar("Binder")
local v3 = Sonar("Maid")
local v4 = Sonar("ItemDataService")
local v5 = Sonar("ShopService")
local v6 = Sonar("IssueResponseClient")
local v7 = Sonar("FormatString")
local v8 = Sonar("FormatNumber")
local v9 = Sonar("PromptClient")
local v10 = Sonar("StorageUtils")
local t = {
	Sonar(v10.Get("JoustingRods")),
	Sonar(v10.Get("ShopItems")),
	Sonar(v10.Get("Bonding")),
	Sonar(v10.Get("Sticks")),
	Sonar(v10.Get("Seeds"))
}
local v11 = Sonar("PlayerWrapper").GetClient()
local t2 = {}
t2.__index = t2
local function getSpawnPadData(p1) --[[ getSpawnPadData | Line: 26 | Upvalues: t (copy) ]]
	local t2 = {}
	for v1, v2 in t do
		if v2[p1] then
			local v3 = v2[p1]
			if typeof(v3) == "number" then
				t2.Name = p1
				t2.Cost = v3
			else
				t2.Name = v3.Name
				t2.Cost = v3.Cost
			end
			return t2
		end
	end
	return t2
end
local function buy(p1, p2) --[[ buy | Line: 48 | Upvalues: v4 (copy), v11 (copy), v6 (copy), v5 (copy) ]]
	local v1, v2 = v11:CanGiveItem(v4.GetByName(p1.Name).ItemType)
	local v3
	if v1 then
		v3 = false
	else
		v6.NotifyIssue("MaxInventory")
		v3 = "Max" .. v2
	end
	if v3 then
		return
	end
	local v42 = v5:PurchaseWorldItem(p1.Name, p2)
	if v42 == true then
		return
	end
	v6.NotifyIssue(v42)
end
function t2.new(p1) --[[ new | Line: 69 | Upvalues: t2 (copy), v3 (copy), getSpawnPadData (copy), v1 (copy), v9 (copy), v8 (copy), buy (copy), v7 (copy) ]]
	local v2 = setmetatable({}, t2)
	v2.Maid = v3.new()
	local v32 = getSpawnPadData(p1.Name)
	local v4 = nil
	v2.Maid:GiveTask(v1.new(p1, {
		ShowHintLabel = true,
		Run = function() --[[ Run | Line: 79 | Upvalues: v9 (ref), v32 (copy), v4 (ref), v8 (ref), buy (ref), p1 (copy) ]]
			v9.Prompt({
				Type = "MultiBuy",
				Setup = function(p1) --[[ Setup | Line: 82 | Upvalues: v32 (ref), v4 (ref), v8 (ref) ]]
					p1.Content.IntValue.Visible = true
					p1.Content.IndexedValue.Visible = false
					p1.Content.IntValue.InputFrame.Content.TextBox.Text = "1"
					p1.Content.IntValue.Cost.Content.TextLabel.Text = "Price: " .. v32.Cost
					v4 = p1.Content.IntValue.InputFrame.Content.TextBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 88 | Upvalues: p1 (copy), v8 (ref), v32 (ref) ]]
						local Text = p1.Content.IntValue.InputFrame.Content.TextBox.Text
						if not (#tostring(Text) > 0) then
							return
						end
						local v1 = v8.SanitiseInput((tonumber(Text)))
						p1.Content.IntValue.InputFrame.Content.TextBox.Text = v1
						p1.Content.IntValue.Cost.Content.TextLabel.Text = "Price: " .. v32.Cost * v1
					end)
				end,
				Run = function(p12) --[[ Run | Line: 97 | Upvalues: buy (ref), p1 (ref), v4 (ref) ]]
					local Text = p12.Content.IntValue.InputFrame.Content.TextBox.Text
					buy(p1, if #tostring(Text) > 0 then math.max(1, (math.floor(tonumber(Text) or 1))) else 1)
					v4:Disconnect()
					p12.Content.IntValue.InputFrame.Content.TextBox.Text = ""
					p12.Content.IntValue.Cost.Content.TextLabel.Text = "Price: 0"
					return true
				end,
				Cancel = function(p1) --[[ Cancel | Line: 113 | Upvalues: v4 (ref) ]]
					p1.Content.IntValue.Cost.Content.TextLabel.Text = "Price: 0"
					v4:Disconnect()
					return true
				end
			})
		end,
		GetRange = function() --[[ GetRange | Line: 120 ]]
			return 30
		end,
		Hint = "Buy " .. v7.separateWordsInString(p1.Name)
	}))
	return v2
end
function t2.Destroy(p1) --[[ Destroy | Line: 129 ]]
	p1.Maid:DoCleaning()
	setmetatable(p1, nil)
end
function t2.Init() --[[ Init | Line: 136 | Upvalues: v2 (copy), t2 (copy) ]]
	v2.new("Purchaseable", t2):Init()
end
t2.Init()
return t2