--[[ Basic Informations ]]--
ITEM.Name = 'Desert Snow' // Name of the Skin
ITEM.Price = 200		  // Price of the Skin
ITEM.Material = 'trails/electric.vmt' // Preview Screenshot? Need to look into the Manual

--[[ Functions ]]--
function ITEM:OnEquip(ply, modifications)
	ply:SetNWString("weapon_zm_scout_vm", "skinshop/scout/desertsnow/v_desertsnow")
	ply:SetNWString("weapon_zm_scout_wm", "skinshop/scout/desertsnow/w_desertsnow")
end

function ITEM:OnHolster(ply)
	ply:SetNWString("weapon_zm_scout_vm", "")
	ply:SetNWString("weapon_zm_scout_wm", "")
end

function ITEM:OnSell(ply)
	ply:SetNWString("weapon_zm_scout_vm", "")
	ply:SetNWString("weapon_zm_scout_wm", "")
end