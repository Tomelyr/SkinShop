--[[ Basic Informations ]]--
ITEM.Name = 'Wooden' // Name of the Skin
ITEM.Price = 200		  // Price of the Skin
ITEM.Material = 'trails/electric.vmt' // Preview Screenshot? Need to look into the Manual

--[[ Functions ]]--
function ITEM:OnEquip(ply, modifications)
	SkinShop.LoadSkin("wooden", ply)
end

function ITEM:OnHolster(ply)
	SkinShop.UnLoadSkin("wooden", ply)
end

function ITEM:OnSell(ply)
	SkinShop.UnLoadSkin("wooden", ply)
end