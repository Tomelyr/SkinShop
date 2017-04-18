----// SkinShop //----
-- Author: Tomelyr (obviously), Exho <3
-- Version: 2017-04-18

SkinShop = SkinShop or {}
SkinShop.SkinTbl = SkinShop.SkinTbl or {}
SkinShop.Debug = true	

function SkinShop.Print(str)
	if SkinShop.Debug then
		print("[SkinShop - Debug]: " .. str)
	end
end

if SERVER then
	// Init Serverside
	AddCSLuaFile()
	util.AddNetworkString("SkinShop_SyncVM")
	util.AddNetworkString("SkinShop_SyncWM")
	
	function SkinShop.RegisterSkin(name, tbl)
		if SkinShop.SkinTbl[name] then return end --autorefresh fix
		
		//inb4 too many if
		if not tbl.viewmodelID then tbl.VM_TYPE = "material" tbl.viewmodelID = -1 end
		if not tbl.viewmodel then tbl.viewmodel = "" end
		if not tbl.worldmodelID then tbl.WM_TYPE = "material" tbl.worldmodelID = -1 end
		if not tbl.worldmodel then tbl.worldmodel = "" end
		if not tbl.VM_TYPE then tbl.VM_TYPE = "submaterial" end
		if not tbl.WM_TYPE then tbl.WM_TYPE = "submaterial" end
		SkinShop.Print("WM Type: " .. tbl.WM_TYPE)
		
		SkinShop.SkinTbl[name] = {
			class = tbl.class,
			VM_TYPE = tbl.VM_TYPE,
			viewmodel = tbl.viewmodel,
			viewmodelID = tbl.viewmodelID,
			WM_TYPE = tbl.WM_TYPE,
			worldmodel = tbl.worldmodel,
			worldmodelID = tbl.worldmodelID
		}
	end

	function SkinShop.LoadSkin(name, ply)
		if not SkinShop.SkinTbl[name] then return end -- check if it's empty
		if not IsValid(ply) then return end -- check if player exist
		local tbl = SkinShop.SkinTbl[name] -- too lazy to write it all the time
		ply:SetNWString(tbl.class .. "_vm", tbl.viewmodel)
		ply:SetNWString(tbl.class .. "_wm", tbl.worldmodel)
		ply:SetNWString(tbl.class .. "_vm_type", tbl.VM_TYPE)
		ply:SetNWString(tbl.class .. "_wm_type", tbl.WM_TYPE)
		ply:SetNWInt(tbl.class .. "_vm_id", tbl.viewmodelID)
		ply:SetNWInt(tbl.class .. "_wm_id", tbl.worldmodelID)
		net.Start("SkinShop_SyncVM")
		net.Send(ply)
		if ply:GetActiveWeapon():GetClass() == tbl.class then
			SkinShop.SetSkin(ply, ply:GetActiveWeapon())
		end
	end

	function SkinShop.UnLoadSkin(name, ply)
		if not SkinShop.SkinTbl[name] then return end -- check if it's empty
		if not IsValid(ply) then return end -- check if player exist
		local tbl = SkinShop.SkinTbl[name] -- too lazy to write it all the time
		ply:SetNWString(tbl.class .. "_vm", "")
		ply:SetNWString(tbl.class .. "_wm", "")
		ply:SetNWString(tbl.class .. "_vm_type", "")
		ply:SetNWString(tbl.class .. "_wm_type", "")
		ply:SetNWInt(tbl.class .. "_vm_id", "")
		ply:SetNWInt(tbl.class .. "_wm_id", "")
		net.Start("SkinShop_SyncVM")
		net.Send(ply)
		ply:GetActiveWeapon():SetMaterial("")
	end
	function SkinShop.SetSkin(ply, wep)
		if ply:GetNWString(wep:GetClass() .. "_wm_type") == "material" then
			wep:SetMaterial(ply:GetNWString(wep:GetClass().."_wm"))
		end
		if ply:GetNWString(wep:GetClass() .. "_wm_type") == "submaterial" then
			wep:SetSubMaterial(ply:GetNWInt(wep:GetClass() .. "_wm_id"), ply:GetNWString(wep:GetClass().."_wm"))
		end
	end
	hook.Add("PlayerSwitchWeapon", "SkinShop_switcher", function(ply, _uneeded, wep)
		if IsValid(wep) then
			if IsValid(ply) then
				net.Start("SkinShop_SyncVM")
				net.Send(ply)
			else
				print("Attempted to sync Skin Shop with invalid player")
			end
		else
			print("Attempted to sync Skin Shop with invalid entity")
		end
	end)
	hook.Add("WeaponEquip", "SkinShop_equipper", function( wep )
		timer.Simple(0.1, function()
			if IsValid(wep) then
				local ply = wep:GetOwner()
				if IsValid(ply) then
					net.Start("SkinShop_SyncVM")
					net.Send(ply)
				else
					print("Attempted to sync Skin Shop with invalid player")
				end
			else
				print("Attempted to sync Skin Shop with invalid entity")
			end
		end)
	end)
	net.Receive("SkinShop_SyncWM", function(len, ply)
		local wep = net.ReadEntity()
		wep.OldOnDrop = wep.OldOnDrop or wep.OnDrop
		wep.OnDrop = function( self )
			self:SetMaterial("")
			for k,v in pairs(self:GetMaterials()) do
				self:SetSubMaterial(k -1, "")
			end
			self:OldOnDrop()
		end
		SkinShop.SetSkin(ply, wep)
		if ply:GetNWString(wep:GetClass() .. "_wm") == "" then
			wep:SetMaterial("")
		end

	end)

end
if CLIENT then
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
				net.Start("SkinShop_SyncWM")
				net.WriteEntity(weapon)
				net.SendToServer()
				-- Function override
				/*weapon.DrawWorldModel = function( self )
					self:SetMaterial( LocalPlayer():GetNWString((self:GetClass().."_wm") ) )
					self:DrawModel()
				end*/
			end
		end
	end
	hook.Add("PreDrawViewModel", "SkinShop_vmHandler", function( vm, ply, weapon )
		if weapon and vm then 
			if ply:GetNWString(weapon:GetClass().."_vm") != nil then 
				if ply:GetNWString(weapon:GetClass() .."_vm_type") == "submaterial" then
					vm:SetSubMaterial(vm:GetOwner():GetNWInt(weapon:GetClass() .. "_vm_id"), vm:GetOwner():GetNWString(weapon:GetClass().."_vm"))
				else
					vm:SetMaterial( ply:GetNWString(weapon:GetClass().."_vm") )
				end
			end
		end
	end)

	hook.Add("PostDrawViewModel", "SkinShop_vmHandler_Fix", function (vm, ply, weapon)
		vm:SetMaterial() -- So the texture doesn't affect other weapons
	end)

	net.Receive("SkinShop_SyncVM", setSkin)
end