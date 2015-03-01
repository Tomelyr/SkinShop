--[[ Basic Informations ]]--
ITEM.Name = 'Gold' // Name of the Skin
ITEM.Price = 200		  // Price of the Skin
ITEM.Material = 'trails/electric.vmt' // Preview Screenshot? Need to look into the Manual

--[[ Skin Information ]]--
local WeaponClass = "weapon_zm_revolver"
local ViewModel = "skinshop/deagle/gold/v_gold"
local WorldModel = "skinshop/deagle/gold/w_gold"

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