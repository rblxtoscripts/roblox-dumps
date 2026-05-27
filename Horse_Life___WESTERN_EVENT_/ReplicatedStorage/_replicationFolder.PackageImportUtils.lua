-- https://lua.expert/
local t = {}
local InsertService = game:GetService("InsertService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("StorageUtils")
local v2 = game:GetService("RunService"):IsServer()
local Packages = Sonar("Constants").Packages
if not Packages then
	warn("\226\154\160\239\184\143 PackageImportUtils, Packages not found in Constants")
	Packages = {}
end
local v3 = v1.GetFromPath("ReplicatedStorage/Packages")()
function t.GetPackageNameFromAssetId(p1) --[[ GetPackageNameFromAssetId | Line: 29 | Upvalues: Packages (ref) ]]
	for v1, v2 in Packages do
		if v2 == p1 then
			return v1
		end
	end
	return nil
end
function t.Import(p1, p2) --[[ Import | Line: 43 | Upvalues: v2 (copy), t (copy), Packages (ref), Sonar (copy), v3 (copy), InsertService (copy) ]]
	if p2 == "Server" and not v2 then
		return function() --[[ Line: 46 ]] end
	end
	if p2 == "Client" and v2 then
		return function() --[[ Line: 48 ]] end
	end
	local v1 = type(p1) == "string" and p1 or t.GetPackageNameFromAssetId(p1)
	local v22 = Packages[v1] or p1
	if v22 and v1 then
		if Sonar:GetModule(v1) then
			return function() --[[ Line: 59 | Upvalues: Sonar (ref), v1 (copy) ]]
				return Sonar(v1)
			end
		end
		if v2 then
			return function() --[[ Line: 65 | Upvalues: v1 (copy), v3 (ref), InsertService (ref), v22 (copy), Sonar (ref) ]]
				local v12 = if v1 then v3:FindFirstChild(v1) else nil
				if not v12 then
					local v32
					repeat
						local v4, v5 = pcall(InsertService.LoadAsset, InsertService, v22)
						if v4 and v5 then
							local v6
							v6 = v4
							v32 = v5
							continue
						end
						v32 = v5
						warn("\226\154\160\239\184\143 PackageImportUtils, Package failed to load", v1 or v22)
						task.wait()
					until v4
					if v1 then
						v32.Name = v1
					end
					v32:SetAttribute("AssetId", v22)
					v32.Parent = v3
				end
				if v12:IsA("ModuleScript") then
					Sonar:AddModuleToLookupTable(v12)
					return Sonar(v1)
				else
					return v12
				end
			end
		else
			return function() --[[ Line: 97 | Upvalues: v1 (copy), v3 (ref), v22 (copy), Sonar (ref) ]]
				local v12 = nil
				repeat
					if v1 then
						v12 = v3:WaitForChild(v1)
					else
						for v32, v4 in v3:GetChildren() do
							if v4:GetAttribute("AssetId") == v22 then
								v12 = v4
								break
							end
						end
					end
					if v12 then
						continue
					end
					task.wait()
				until v12
				if v12:IsA("ModuleScript") then
					Sonar:AddModuleToLookupTable(v12)
					return Sonar(v1)
				else
					return v12
				end
			end
		end
	else
		warn("\226\154\160\239\184\143 PackageImportUtils, Invalid package asset id or name", v1 or v22)
		return nil
	end
end
function t.Init(p1) --[[ Init | Line: 127 | Upvalues: v2 (copy), Packages (ref), v3 (copy) ]]
	if not v2 then
		return
	end
	for v1, v22 in Packages do
		local v32 = v3:FindFirstChild(v1)
		if v32 then
			v32:SetAttribute("AssetId", v22)
		end
	end
end
t:Init()
return t