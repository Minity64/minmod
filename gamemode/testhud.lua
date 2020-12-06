function HUD()
    local client = LocalPlayer()

    if !client:Alive() then
        return
    end

    local healthWidth = (client:Health() / client:GetMaxHealth()) * 100
    local clipWidth = (client:GetActiveWeapon():Clip1() / client:GetActiveWeapon():GetMaxClip1()) * 100

    --Health/Armor Box
    draw.RoundedBox(3, 0, ScrH() - 100, 250, 100, Color(30, 30, 30, 240))
    --Health Bar
    draw.SimpleText("Health: "..client:Health().."%", "DermaDefaultBold", 10, ScrH() - 90, Color(255, 255, 255, 255), 0, 0)
    draw.RoundedBox(2, 10, ScrH() - 75, 100 * 2.3, 15, Color(128, 0, 0, 255))    
    draw.RoundedBox(2, 10, ScrH() - 75, math.Clamp(healthWidth, 0, 100) * 2.3, 15, Color(255, 0, 0, 255))
    draw.RoundedBox(2, 10, ScrH() - 75, math.Clamp(healthWidth, 0, 100) * 2.3, 5, Color(255, 70, 70, 255))
    --Armor Bar
    draw.SimpleText("Armor: "..client:Armor().."%", "DermaDefaultBold", 10, ScrH() - 45, Color(255, 255, 255, 255), 0, 0)
    draw.RoundedBox(2, 10, ScrH() - 30, 100 * 2.3, 15, Color(0, 0, 128, 255))    
    draw.RoundedBox(2, 10, ScrH() - 30, math.Clamp(client:Armor(), 0, 100) * 2.3, 15, Color(0, 0, 255, 255))
    draw.RoundedBox(2, 10, ScrH() - 30, math.Clamp(client:Armor(), 0, 100) * 2.3, 5, Color(50, 50, 255, 255))

    --Ammo Box
    draw.RoundedBox(2, ScrW() - 125, ScrH() - 70, 125, 70, Color(30, 30, 30, 240))
    --draw.RoundedBox(cornerRadius, x, y, width, height, color)
    if (client:GetActiveWeapon():GetPrintName() ~= nil) then
        draw.SimpleText(client:GetActiveWeapon():GetPrintName(), "DermaDefaultBold", ScrW() - 100, ScrH() - 60, Color(255, 255, 255, 255), 0, 0)
    end
    --Ammo Bar
    draw.RoundedBox(2, ScrW() - 110, ScrH() - 30, 100, 15, Color(0, 128, 0, 255)) --Bar background
    draw.RoundedBox(2, ScrW() - 110, ScrH() - 30, math.Clamp(client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType()), 0, 200) / 2, 15, Color(0, 255, 0, 255))
    draw.RoundedBox(2, ScrW() - 110, ScrH() - 30, math.Clamp(clipWidth, 0, 100), 5, Color(200, 255, 200, 255))
    
    
    if (client:GetActiveWeapon():Clip1() ~= -1) then
        draw.SimpleText("Ammo: " .. client:GetActiveWeapon():Clip1() .. "/" .. client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType()), "DermaDefaultBold", ScrW() - 100, ScrH() - 45, Color(255, 255, 255, 255), 0, 0)
    else
        draw.SimpleText("Ammo: " .. client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType()), "DermaDefaultBold", ScrW() - 100, ScrH() - 45, Color(255, 255, 255, 255), 0, 0)
    end

    if (client:GetAmmoCount(client:GetActiveWeapon():GetSecondaryAmmoType()) > 0) then
        draw.SimpleText("Secondary: " .. client:GetAmmoCount(client:GetActiveWeapon():GetSecondaryAmmoType()), "DermaDefaultBold", ScrW() - 100, ScrH() - 15, Color(255, 255, 255, 255), 0, 0)
    end
end
hook.Add("HUDPaint", "TestHud", HUD)

function HideHud(name)
    for k, v in pairs({"CHudHealth", "CHudBattery", "CHudAmmo", "CHudSecondaryAmmo"}) do
        if name == v then
            return false
        end 
    end
end
hook.Add("HUDShouldDraw", "HideDefaultHud", HideHud)