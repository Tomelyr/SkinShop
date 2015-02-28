--// Skin shop handler
-- Tomelyr and Exho <3

-- "skinshop/scout/desertsnow/v_desertsnow"
-- "skinshop/scout/desertsnow/w_desertsnow"

hook.Add("PreDrawViewModel", "SkinShop_vmHandler", function( vm, ply, weapon )
	if weapon and vm then 
		if ply.SkinShopSkin and ply.SkinShopSkin[weapon:GetClass()] then 
			vm:SetMaterial( ply.SkinShopSkin[weapon:GetClass()]  )
		end
	end
end)

if CLIENT then
	local client = LocalPlayer()
	
	local wep = client:GetActiveWeapon()
	hook.Add("Think", "SkinShop_wmHandler", function()
		if client.SkinShopSkin and client.SkinShopSkin[wep:GetClass()] then
			if client:GetActiveWeapon() != wep then -- Detect weapon switches and call this block of code ONCE
				wep = client:GetActiveWeapon()
				
				-- Function override
				wep.DrawWorldModel = function( self )
					self:SetMaterial( client.SkinShopSkin[wep:GetClass()] )
					self:DrawModel()
				end
			end
		end
	end)
end

