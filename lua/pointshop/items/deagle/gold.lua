--[[ Basic Informations ]]--
ITEM.Name = 'Gold' // Name of the Skin
ITEM.Price = 200		  // Price of the Skin
ITEM.Material = 'trails/electric.vmt' // Preview Screenshot? Need to look into the Manual

--[[ Functions ]]--
function ITEM:OnEquip(ply, modifications)
	SkinShop.LoadSkin("gold", ply)
end

function ITEM:OnHolster(ply)
	SkinShop.UnLoadSkin("gold", ply)
end

function ITEM:OnSell(ply)
	SkinShop.UnLoadSkin("gold", ply)
end