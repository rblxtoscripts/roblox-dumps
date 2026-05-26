-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
require(ReplicatedStorage:WaitForChild("Sonar"))
local t2 = {
	[15696848933] = {
		Name = "Live Main Realm",
		IsTestGame = false,
		Type = "Main"
	},
	[16618922530] = {
		Name = "Dev Main Realm",
		IsTestGame = true,
		Type = "Main"
	},
	[16727629658] = {
		Name = "Test Build Main Realm",
		IsTestGame = true,
		Type = "Main"
	},
	[128057940221835] = {
		Name = "Paralle New Map Rework",
		IsTestGame = true,
		Type = "Main"
	},
	[83497222326503] = {
		Name = "Dev Main Realm",
		IsTestGame = true,
		Type = "Main"
	},
	[17561507982] = {
		Name = "Live Market Realm",
		IsTestGame = false,
		Type = "Market"
	},
	[133995157224419] = {
		Name = "Dev Market Realm",
		IsTestGame = true,
		Type = "Market"
	},
	[17769565541] = {
		Name = "Test Build Market Realm",
		IsTestGame = true,
		Type = "Market"
	},
	[88910511036954] = {
		Name = "Live Competitive Hub",
		IsTestGame = false,
		Type = "CompHub"
	},
	[98827123238121] = {
		Name = "Dev Competitive Hub",
		IsTestGame = true,
		Type = "CompHub"
	},
	[101224150419293] = {
		Name = "Test Competitive Hub",
		IsTestGame = true,
		Type = "CompHub"
	}
}
local t3 = {
	Main = {
		DisplayName = "Main Realm",
		Type = "Main",
		LivePlace = "Live Main Realm",
		TestPlace = "Test Build Main Realm",
		Description = "\226\128\162 Explore the town and meet unique NPCs<br/> \226\128\162 Discover and tame wild horse species across the world<br/> \226\128\162 Take part in contests and exciting activities<br/> \226\128\162 Farm resources and care for your horses at the Care Center<br/>",
		Image = 124130706240414,
		New = false,
		IncludeInWorldTeleport = true
	},
	Market = {
		DisplayName = "Market Realm",
		Type = "Market",
		LivePlace = "Live Market Realm",
		TestPlace = "Test Build Market Realm",
		IncludeInWorldTeleport = true,
		Description = "\226\128\162 Exchange items & trade with other players<br/> \226\128\162 Bid on rare species slots at the auction stage<br/> \226\128\162 Crystal cave, blossom tree & open social area",
		Image = 119630153051339,
		New = false,
		RequiredSpecies = { "Bisorse" }
	},
	CompHub = {
		DisplayName = "Competitive Hub",
		Type = "CompHub",
		LivePlace = "Live Competitive Hub",
		TestPlace = "Test Competitive Hub",
		IncludeInWorldTeleport = true,
		Description = "\226\128\162 Exclusive horse species only found here<br/> \226\128\162 Race against other players on dedicated tracks<br/> \226\128\162 Dynamic weather system affects races & exploration",
		Image = 106759376941855,
		New = true,
		RequiredMission = true
	}
}
function t.GetInfo(p1) --[[ GetInfo | Line: 109 | Upvalues: t2 (copy) ]]
	if not p1 then
		p1 = game.PlaceId
	end
	return t2[p1]
end
function t.GetPlaceType() --[[ GetPlaceType | Line: 117 | Upvalues: t (copy) ]]
	local v1 = t.GetInfo()
	return if v1 then v1.Type else v1
end
function t.IsTestGame() --[[ IsTestGame | Line: 122 | Upvalues: RunService (copy), t (copy) ]]
	if RunService:IsStudio() then
		return true
	end
	local v1 = t.GetInfo()
	return if v1 then v1.IsTestGame or false else false
end
function t.IsMainWorld() --[[ IsMainWorld | Line: 131 | Upvalues: t (copy) ]]
	return t.GetPlaceType() == "Main"
end
function t.IsMarketWorld() --[[ IsMarketWorld | Line: 135 | Upvalues: t (copy) ]]
	return t.GetPlaceType() == "Market"
end
function t.IsCompHub() --[[ IsCompHub | Line: 139 | Upvalues: t (copy) ]]
	return t.GetPlaceType() == "CompHub"
end
function t.IsType(p1) --[[ IsType | Line: 143 | Upvalues: t (copy) ]]
	return t.GetPlaceType() == p1
end
function t.GetAllPlaces() --[[ GetAllPlaces | Line: 147 | Upvalues: t2 (copy) ]]
	return t2
end
function t.GetAllRealms() --[[ GetAllRealms | Line: 151 | Upvalues: t3 (copy) ]]
	return t3
end
function t.GetNameFromId(p1) --[[ GetNameFromId | Line: 155 | Upvalues: t (copy) ]]
	local v1 = t.GetInfo(p1)
	return if v1 then v1.Name else v1
end
function t.GetIdFromName(p1) --[[ GetIdFromName | Line: 160 | Upvalues: t2 (copy) ]]
	for v1, v2 in t2 do
		if v2.Name == p1 then
			return v1
		end
	end
	return nil
end
function t.GetRealmPlaceId(p1) --[[ GetRealmPlaceId | Line: 170 | Upvalues: t3 (copy), t (copy) ]]
	local v1 = t3[p1]
	if not v1 then
		return nil
	end
	local v2 = t.IsTestGame() and v1.TestPlace or v1.LivePlace
	return if v2 then t.GetIdFromName(v2) else v2
end
function t.GetMainWorldId() --[[ GetMainWorldId | Line: 180 | Upvalues: t (copy) ]]
	return t.GetRealmPlaceId("Main")
end
function t.GetMarketWorldId() --[[ GetMarketWorldId | Line: 184 | Upvalues: t (copy) ]]
	return t.GetRealmPlaceId("Market")
end
function t.GetCompWorldId() --[[ GetCompWorldId | Line: 188 | Upvalues: t (copy) ]]
	return t.GetRealmPlaceId("CompHub")
end
function t.GetPlacesByCategory(p1) --[[ GetPlacesByCategory | Line: 192 | Upvalues: t (copy), t2 (copy) ]]
	if not p1 then
		p1 = if t.IsTestGame() then "Test" else "Live"
	end
	local t3 = {}
	for v2, v3 in t2 do
		if p1 == "Test" and v3.IsTestGame then
			t3[v2] = v3
			continue
		end
		if p1 == "Live" and not v3.IsTestGame then
			t3[v2] = v3
			continue
		end
		if v3.Type == p1 then
			t3[v2] = v3
		end
	end
	return t3
end
return t