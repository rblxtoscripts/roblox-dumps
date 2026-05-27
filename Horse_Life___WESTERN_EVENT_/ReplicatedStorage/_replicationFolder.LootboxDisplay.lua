-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("LootboxService")
local v3 = Sonar("FormatNumber")
local v4 = Sonar("ItemDataService")
return {
	new = function(p1) --[[ new | Line: 25 | Upvalues: v2 (copy), v4 (copy), v1 (copy), v3 (copy) ]]
		local v12 = v2.GetLootboxFromTable(p1.Lootbox)
		if not v12 then
			warn("\226\154\160\239\184\143 LootboxDisplay, Lootbox is required")
			return nil
		end
		local v22 = v12:GetWeightedItemPool({
			ItemData = p1.ItemData
		})
		local t = {}
		for v42, v5 in v22 do
			local v32
			local t2 = {
				Name = v5.ItemKey,
				Amount = v5.Amount,
				Probability = v5.Probability
			}
			v32 = v5.KeyType == "ItemType" and ("Random %*"):format(v5.ItemKey) or nil
			t2.DisplayName = v32
			t2.ItemData = v5.ItemData
			t2.Item = v4.GetByName(v5.ItemKey)
			table.insert(t, t2)
		end
		table.sort(t, function(p12, p2) --[[ Line: 50 | Upvalues: p1 (copy) ]]
			if p1.SortByRarity then
				return p12.Item.Rarity.Index > p2.Item.Rarity.Index
			elseif p12.Probability and p2.Probability then
				return p12.Probability > p2.Probability
			else
				return p12.Name < p2.Name
			end
		end)
		p1.Items = t
		function p1.ItemAdded(p1, p2, p3) --[[ Line: 65 | Upvalues: v1 (ref), v22 (copy), v3 (ref) ]]
			local v12 = v1.FindElement(p2.Instance, "ProbabilityLabel") or v1.FindElement(p2.Instance, "ChanceLabel")
			if not v12 then
				return
			end
			local v2 = v22[p3.Name .. p3.Amount]
			v12.Text = v3.percentage((if v2 then v2.Probability or 0 else 0) * 100) .. "%"
			v12.Visible = true
		end
		return v1.AddComponent("MultiItemDisplay", p1)
	end
}