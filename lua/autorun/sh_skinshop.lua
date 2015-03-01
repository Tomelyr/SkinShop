--// Skin shop handler
-- Tomelyr and Exho <3

if SERVER then
	AddCSLuaFile()
	util.AddNetworkString("SkinShop_Sync")
	
	hook.Add("WeaponEquip", "SkinShop_equipper", function( wep )
		timer.Simple(0.1, function()
			if IsValid(wep) then
				local ply = wep:GetOwner()
				if IsValid(ply) then
					net.Start("SkinShop_Sync")
					net.Send(ply)
				else
					print("Attempted to sync Skin Shop with invalid player")
				end
			else
				print("Attempted to sync Skin Shop with invalid entity")
			end
		end)
	end)
end

if CLIENT then
	print("Skin Shop Loaded")
	
	local function setSkin()

		if not LocalPlayer().GetActiveWeapon then
			-- Sometimes GetActiveWeapon is nil, so we try again
			timer.Simple(1, function()
				setSkin()
			end)
			return
		end
		
		local wep = LocalPlayer():GetActiveWeapon()
		
		for _, weapon in pairs( LocalPlayer():GetWeapons() ) do	-- Check all weapons in case we switched 
			if LocalPlayer():GetNWString(weapon:GetClass().."_wm") != "" then
				-- Function override
				weapon.DrawWorldModel = function( self )
					self:SetMaterial( LocalPlayer():GetNWString((self:GetClass().."_wm") ) )
					self:DrawModel()
				end
			end
		end

		hook.Add("PreDrawViewModel", "SkinShop_vmHandler", function( vm, ply, weapon )
			if weapon and vm then 
				if ply:GetNWString(weapon:GetClass().."_vm") != "" then 
					vm:SetMaterial( ply:GetNWString((weapon:GetClass().."_vm")  ) )
				end
			end
		end)

		hook.Add("PostDrawViewModel", "SkinShop_vmHandler_Fix", function (vm, ply, weapon)
			vm:SetMaterial() -- So the texture doesn't affect other weapons
		end)
	end
	
	net.Receive("SkinShop_Sync", setSkin)
end

