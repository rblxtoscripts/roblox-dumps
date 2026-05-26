-- https://lua.expert/
local tbl = {
	[2] = {
		Price = 10000
	},
	[3] = {
		ProductId = 1781554629
	}
}
for k, v in pairs(tbl) do
	v.SaveSlotIndex = k
	if v.ProductId then
		v.ProductType = "PlotSaveSlot"
	end
	if v.Price then
		v.Currency = "Coins"
	end
end
return tbl