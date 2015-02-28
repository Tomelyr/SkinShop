--// Skin shop handler


hook.Add("PreDrawViewModel", "SkinShop_vmHandler", function( vm, ply, weapon )
	if weapon and vm then
		--vm:SetMaterial( "skinshop/scout/desertsnow/v_desertsnow" )
		if ply.SkinShopSkin[weapon:GetClass()] then
			vm:SetMaterial( ply.SkinShopSkin[weapon:GetClass()]  )
		end
	end
end)