--[[ Basic Informations ]]--
ITEM.Name = 'Wooden' // Name of the Skin
ITEM.Price = 200		  // Price of the Skin
ITEM.Material = 'trails/electric.vmt' // Preview Screenshot? Need to look into the Manual

--[[ Skin Information ]]--
WeaponClass = "weapon_zm_rifle"
ViewModel = "skinshop/scout/wooden/v_snip_scout"
WorldModel = "skinshop/scout/wooden/w_snip_scout"

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