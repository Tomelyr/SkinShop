--[[ Basic Informations ]]--
ITEM.Name = 'Cartel' // Name of the Skin
ITEM.Price = 200		  // Price of the Skin
ITEM.Material = 'trails/electric.vmt' // Preview Screenshot? Need to look into the Manual

--[[ Skin Information ]]--
local WeaponClass = "weapon_zm_pistol"
local ViewModel = "skinshop/p250/cartel/p250"
local WorldModel = "skinshop/p250/cartel/p250"

--[[ Functions ]]--
function ITEM:OnEquip(ply, modifications)
	ply:SetNWString(WeaponClass .. "_vm", ViewModel)
	ply:SetNWString(WeaponClass .. "_wm", WorldModel)
end

function ITEM:OnHolster(ply)
	ply:SetNWString(WeaponClass .. "_vm", "")
	ply:SetNWString(WeaponClass .. "_wm", "")
end

function ITEM:OnSell(ply)
	ply:SetNWString(WeaponClass .. "_vm", "")
	ply:SetNWString(WeaponClass .. "_wm", "")
end