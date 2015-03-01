--[[ Basic Informations ]]--
ITEM.Name = 'Cartel' // Name of the Skin
ITEM.Price = 200		  // Price of the Skin
ITEM.Material = 'trails/electric.vmt' // Preview Screenshot? Need to look into the Manual

--[[ Skin Information ]]--
local SkinShop = {} // needed? Does it break something? test it!
SkinShop.WeaponClass = "weapon_zm_pistol"
SkinShop.ViewModel = "skinshop/p250/cartel/p250"
SkinShop.WorldModel = "skinshop/p250/cartel/p250"

--[[ Functions ]]--
function ITEM:OnEquip(ply, modifications)
	ply:SetNWString(SkinShop.WeaponClass .. "_vm", SkinShop.ViewModel)
	ply:SetNWString(SkinShop.WeaponClass .. "_wm", SkinShop.WorldModel)
end

function ITEM:OnHolster(ply)
	ply:SetNWString(SkinShop.WeaponClass .. "_vm", "")
	ply:SetNWString(SkinShop.WeaponClass .. "_wm", "")
end

function ITEM:OnSell(ply)
	ply:SetNWString(SkinShop.WeaponClass .. "_vm", "")
	ply:SetNWString(SkinShop.WeaponClass .. "_wm", "")
end