--// Skin shop handler
-- Tomelyr and Exho <3

-- "skinshop/scout/desertsnow/v_desertsnow"
-- "skinshop/scout/desertsnow/w_desertsnow"
if SERVER then
	AddCSLuaFile()
end

if CLIENT then
	print("loaded")
	local client = LocalPlayer()
	
	local wep = client:GetActiveWeapon()
	hook.Add("Think", "SkinShop_wmHandler", function()
		if client:GetNWString(client:GetActiveWeapon():GetClass().."_wm") != "" then
			if client:GetActiveWeapon() != wep then -- Detect weapon switches and call this block of code ONCE
				wep = client:GetActiveWeapon()
				
				-- Function override
				wep.DrawWorldModel = function( self )
					self:SetMaterial( client:GetNWString((wep:GetClass().."_wm") )
					self:DrawModel()
				end
			end
		end
	end)
	
	hook.Add("PreDrawViewModel", "SkinShop_vmHandler", function( vm, ply, weapon )
		if weapon and vm then 
			if ply:GetNWString(weapon:GetClass().."_vm") != "" then 
				vm:SetMaterial( ply:GetNWString((weapon:GetClass().."_vm")  )
			end
		end
	end)
end

