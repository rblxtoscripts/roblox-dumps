-- https://lua.expert/
local t = {
	Towers = {}
}
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
if RunService:IsServer() then
	local HttpService = game:GetService("HttpService")
	local function retreive() --[[ retreive | Line: 28 | Upvalues: HttpService (copy) ]]
		local v1, v2 = pcall(function() --[[ Line: 29 | Upvalues: HttpService (ref) ]]
			return HttpService:GetAsync("https://raw.githubusercontent.com/FiveNightsTD/Stats/main/TowerStats.json", true)
		end)
		if v1 and v2 then
			return HttpService:JSONDecode(v2)
		else
			return nil
		end
	end
	local function fixFormat(p1) --[[ fixFormat | Line: 38 ]]
		local t = {}
		for v1, v2 in p1 do
			t[v1] = {
				Type = v2.Type,
				Rarity = v2.Rarity,
				Image = v2.Image,
				PlacePrice = v2.PlacePrice,
				Damage = v2.Upgrades[1].Damage,
				Range = v2.Upgrades[1].Range,
				Cooldown = v2.Upgrades[1].Cooldown,
				Passive = v2.Passive,
				TowerStats = {
					Damage = ("%*-%*"):format(v2.Upgrades[1].Damage, v2.Upgrades[#v2.Upgrades].Damage),
					Cooldown = ("%*-%*"):format(v2.Upgrades[1].Cooldown, v2.Upgrades[#v2.Upgrades].Cooldown),
					Range = ("%*-%*"):format(v2.Upgrades[1].Range, v2.Upgrades[#v2.Upgrades].Range)
				}
			}
			if v2.Upgrades[1].DamageBoost then
				t[v1].TowerStats.DamageBoost = ("%*-%*"):format(v2.Upgrades[1].DamageBoost, v2.Upgrades[#v2.Upgrades].DamageBoost)
			end
			if v2.Upgrades[1].RangeBoost then
				t[v1].TowerStats.RangeBoost = ("%*-%*"):format(v2.Upgrades[1].RangeBoost, v2.Upgrades[#v2.Upgrades].RangeBoost)
			end
			if v2.Upgrades[1].CooldownBoost then
				t[v1].TowerStats.CooldownBoost = ("%*-%*"):format(v2.Upgrades[1].CooldownBoost, v2.Upgrades[#v2.Upgrades].CooldownBoost)
			end
		end
		return t
	end
	local v1 = nil
	local v2 = false
	local function update() --[[ update | Line: 72 | Upvalues: v1 (ref), v2 (ref), HttpService (copy), t (copy), fixFormat (copy), ReplicatedStorage (copy) ]]
		v1 = nil
		v2 = false
		repeat
			pcall(function() --[[ Line: 76 | Upvalues: v1 (ref), HttpService (ref) ]]
				local v12, v2 = pcall(function() --[[ Line: 29 | Upvalues: HttpService (ref) ]]
					return HttpService:GetAsync("https://raw.githubusercontent.com/FiveNightsTD/Stats/main/TowerStats.json", true)
				end)
				v1 = if v12 and v2 then HttpService:JSONDecode(v2) else nil
			end)
			task.wait(0.5)
		until v1
		t.Towers = fixFormat(v1)
		v2 = true
		ReplicatedStorage.Remotes.Towers.MetaData:FireAllClients(HttpService:JSONEncode(t.Towers))
	end
	local t2 = {}
	function ReplicatedStorage.Remotes.Towers.MetaDataRequest.OnServerInvoke(p1) --[[ Line: 87 | Upvalues: t2 (copy), v2 (ref), v1 (ref), t (copy) ]]
		if t2[p1.Name] then
			return
		end
		t2[p1.Name] = true
		delay(0.1, function() --[[ Line: 90 | Upvalues: t2 (ref), p1 (copy) ]]
			t2[p1.Name] = nil
		end)
		if v2 and v1 then
			return t.Towers
		end
		repeat
			task.wait(0.5)
		until v1 and (t.Towers and v2)
		return t.Towers
	end
	repeat
		pcall(update)
	until v1 and (t.Towers and v2)
	task.defer(function() --[[ Line: 104 | Upvalues: v1 (ref), HttpService (copy), t (copy), fixFormat (copy), ReplicatedStorage (copy) ]]
		while true do
			task.wait(60)
			v1 = nil
			repeat
				pcall(function() --[[ Line: 109 | Upvalues: v1 (ref), HttpService (ref) ]]
					local v12, v2 = pcall(function() --[[ Line: 29 | Upvalues: HttpService (ref) ]]
						return HttpService:GetAsync("https://raw.githubusercontent.com/FiveNightsTD/Stats/main/TowerStats.json", true)
					end)
					v1 = if v12 and v2 then HttpService:JSONDecode(v2) else nil
				end)
				task.wait(1)
			until v1 and t.Towers
			t.Towers = fixFormat(v1)
			ReplicatedStorage.Remotes.Towers.MetaData:FireAllClients(HttpService:JSONEncode(t.Towers))
		end
	end)
	task.defer(function() --[[ Line: 118 | Upvalues: ReplicatedStorage (copy), HttpService (copy), t (copy) ]]
		while true do
			task.wait(15)
			ReplicatedStorage.Remotes.Towers.MetaData:FireAllClients(HttpService:JSONEncode(t.Towers))
		end
	end)
else
	local v3 = ReplicatedStorage.Remotes.Towers.MetaDataRequest:InvokeServer()
	if v3 then
		t.Towers = v3
	end
end
return t