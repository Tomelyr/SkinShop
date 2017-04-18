--[[ Basic Informations ]]--
ITEM.Name = 'Desert Snow' // Name of the Skin
ITEM.Price = 200		  // Price of the Skin
ITEM.Material = 'trails/electric.vmt' // Preview Screenshot? Need to look into the Manual

--[[ Functions ]]--
function ITEM:OnEquip(ply, modifications)
	SkinShop.LoadSkin("desertsnow", ply)
end

function ITEM:OnHolster(ply)
	SkinShop.UnLoadSkin("desertsnow", ply)
end

function ITEM:OnSell(ply)
	SkinShop.UnLoadSkin("desertsnow", ply)
end