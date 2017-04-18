timer.Simple(0.2, function() -- Timer to make sure it's running AFTER the SkinShop loaded.
	SkinShop.RegisterSkin("desertsnow", 
		{
			class = "weapon_zm_rifle", 
			viewmodel = "skinshop/scout/desertsnow/v_desertsnow", 
			viewmodelID = 1, 
			worldmodel = "skinshop/scout/desertsnow/w_desertsnow"
		}
	)
	SkinShop.RegisterSkin("wooden", 
		{
			class = "weapon_zm_rifle", 
			viewmodel = "skinshop/scout/wooden/v_snip_scout", 
			viewmodelID = 1, 
			worldmodel = "skinshop/scout/wooden/w_snip_scout"
		}
	)
	SkinShop.RegisterSkin("gold", 
		{
			class = "weapon_zm_revolver", 
			viewmodel = "skinshop/deagle/gold/v_gold", 
			worldmodel = "skinshop/deagle/gold/w_gold"
		}
	)
end)

resource.AddFile( "materials/skinshop/deagle/gold/v_gold.vmt" )
resource.AddFile( "materials/skinshop/deagle/gold/w_gold.vmt" )
resource.AddFile( "materials/skinshop/scout/desertsnow/v_desertsnow.vmt" )
resource.AddFile( "materials/skinshop/scout/desertsnow/w_desertsnow.vmt" )
resource.AddFile( "materials/skinshop/scout/wooden/v_snip_scout.vmt" )
resource.AddFile( "materials/skinshop/scout/wooden/w_snip_scout.vmt" )
