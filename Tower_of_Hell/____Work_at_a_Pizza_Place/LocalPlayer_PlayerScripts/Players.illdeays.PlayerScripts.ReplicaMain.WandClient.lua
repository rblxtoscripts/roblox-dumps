-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("CollectionService")
local v1 = require(ReplicatedStorage.Enums)
require(ReplicatedStorage.ReplicaController)
require(ReplicatedStorage._v6FiRE_Additions.Manager.Wand.WandShared)
require(ReplicatedStorage._v6FiRE_Additions.createSelectionSignal)
require(script.WandOutlineClient)
local IsHoldingWand = ReplicatedStorage._v6FiRE_Additions.Manager.Wand.Client.IsHoldingWand
local WandOutlineClicked = ReplicatedStorage._v6FiRE_Additions.Manager.Wand.ToServer.WandOutlineClicked
return {
	Initialize = function() --[[ Initialize | Line: 17 | Upvalues: v1 (copy) ]]
		local _ = v1.IsPartyServer
	end
}