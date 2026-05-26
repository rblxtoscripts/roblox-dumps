-- https://lua.expert/
local t = {}
local t2 = {
	["HeadShot-Size48x48"] = "rbxthumb://type=AvatarHeadShot&id=%s&w=48&h=48",
	["HeadShot-Size60x60"] = "rbxthumb://type=AvatarHeadShot&id=%s&w=60&h=60",
	["HeadShot-Size100x100"] = "rbxthumb://type=AvatarHeadShot&id=%s&w=100&h=100",
	["HeadShot-Size150x150"] = "rbxthumb://type=AvatarHeadShot&id=%s&w=150&h=150",
	["HeadShot-Size180x180"] = "rbxthumb://type=AvatarHeadShot&id=%s&w=180&h=180",
	["HeadShot-Size352x352"] = "rbxthumb://type=AvatarHeadShot&id=%s&w=352&h=352",
	["HeadShot-Size420x420"] = "rbxthumb://type=AvatarHeadShot&id=%s&w=420&h=420",
	["HeadShot-Size720x720"] = "rbxthumb://type=AvatarHeadShot&id=%s&w=720&h=720",
	["AvatarThumbnail-Size48x48"] = "rbxthumb://type=Avatar&id=%s&w=48&h=48",
	["AvatarThumbnail-Size60x60"] = "rbxthumb://type=Avatar&id=%s&w=60&h=60",
	["AvatarThumbnail-Size100x100"] = "rbxthumb://type=Avatar&id=%s&w=100&h=100",
	["AvatarThumbnail-Size150x150"] = "rbxthumb://type=Avatar&id=%s&w=150&h=150",
	["AvatarThumbnail-Size180x180"] = "rbxthumb://type=Avatar&id=%s&w=180&h=180",
	["AvatarThumbnail-Size352x352"] = "rbxthumb://type=Avatar&id=%s&w=352&h=352",
	["AvatarThumbnail-Size420x420"] = "rbxthumb://type=Avatar&id=%s&w=420&h=420",
	["AvatarThumbnail-Size720x720"] = "rbxthumb://type=Avatar&id=%s&w=720&h=720",
	["AvatarBust-Size48x48"] = "rbxthumb://type=AvatarBust&id=%s&w=48&h=48",
	["AvatarBust-Size60x60"] = "rbxthumb://type=AvatarBust&id=%s&w=60&h=60",
	["AvatarBust-Size100x100"] = "rbxthumb://type=AvatarBust&id=%s&w=100&h=100",
	["AvatarBust-Size150x150"] = "rbxthumb://type=AvatarBust&id=%s&w=150&h=150",
	["AvatarBust-Size180x180"] = "rbxthumb://type=AvatarBust&id=%s&w=180&h=180",
	["AvatarBust-Size352x352"] = "rbxthumb://type=AvatarBust&id=%s&w=352&h=352",
	["AvatarBust-Size420x420"] = "rbxthumb://type=AvatarBust&id=%s&w=420&h=420",
	["AvatarBust-Size720x720"] = "rbxthumb://type=AvatarBust&id=%s&w=720&h=720"
}
function t.Get(p1, p2, p3) --[[ Get | Line: 81 | Upvalues: t2 (copy) ]]
	if p1 <= 0 then
		p1 = 156
	end
	local v1 = p2 and p2.Name or "HeadShot"
	local v2, v3
	if p3 then
		v2 = p3.Name
		if v2 then
			v3 = v1
		else
			v2 = "Size150x150"
			v3 = v1
		end
	else
		v2 = "Size150x150"
		v3 = v1
	end
	return string.format(t2[v3 .. "-" .. v2], p1)
end
return t