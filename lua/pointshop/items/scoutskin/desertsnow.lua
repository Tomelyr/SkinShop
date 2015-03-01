--[[ Basic Informations ]]--
ITEM.Name = 'Desert Snow' // Name of the Skin
ITEM.Price = 200		  // Price of the Skin
ITEM.Material = 'trails/electric.vmt' // Preview Screenshot? Need to look into the Manual

--[[ Skin Information ]]--
local WeaponClass = "weapon_zm_rifle"
local ViewModel = "skinshop/scout/desertsnow/v_desertsnow"
local WorldModel = "skinshop/scout/desertsnow/w_desertsnow"

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