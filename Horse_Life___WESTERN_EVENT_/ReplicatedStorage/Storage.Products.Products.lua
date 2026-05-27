-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("MarketplaceUtils")
Sonar("StorageUtils")
for k, v in pairs(script.Parent:GetDescendants()) do
	if v ~= script and v:IsA("ModuleScript") then
		v1.AddDeveloperProducts(Sonar(v))
	end
end
return {}