include("concommands.lua")

local Menu

net.Receive("FMenu", function()
    if (Menu == nil) then
        Menu = vgui.Create("DFrame")
        Menu:SetSize(500, 500)
        Menu:SetPos(ScrW() / 2 - 250, ScrH() / 2 - 250)
        Menu:SetTitle("Class Choice Menu - F4 to close")
        Menu:SetDraggable(true)
        Menu:ShowCloseButton(false)
        Menu:SetDeleteOnClose(false)
        Menu.Paint = function ()
            surface.SetDrawColor(60, 60, 60, 255)
            surface.DrawRect(0, 0, Menu:GetWide(), Menu:GetTall())

            surface.SetDrawColor(40,40,40,255)
            surface.DrawRect(0,24,Menu:GetWide(), 1)
        end
    end

    addButtons(Menu)
    
    if (net.ReadBit() == 0) then
        Menu:Hide()
        gui.EnableScreenClicker(false)
    else
        Menu:Show()
        gui.EnableScreenClicker(true)
    end
end)

function addButtons(Menu)
    --Revolver Class Button
    local class2Button = vgui.Create("DButton")
    class2Button:SetParent(Menu)
    class2Button:SetText("")
    class2Button:SetSize(100,50)
    class2Button:SetPos(0,25)
    class2Button.Paint = function ()
        --Color of entire button
        surface.SetDrawColor(50,50,50,255)
        surface.DrawRect(0,0,class2Button:GetWide(),class2Button:GetTall())

        --Draw Bottom and Right borders
        surface.SetDrawColor(40,40,40,255)
        surface.DrawRect(0,49,class2Button:GetWide(),1)
        surface.DrawRect(99,0,1,class2Button:GetTall())

        --Draw Text
        draw.DrawText("Clint", "DermaDefaultBold", class2Button:GetWide()/2,17,Color(255,255,255,255),1)
    end
    class2Button.DoClick = function (class2Button)
        local class2Panel = Menu:Add("Class2Panel")

        class2Panel.Paint = function ()
            surface.SetDrawColor(50,50,50,255)
            surface.DrawRect(0,0,class2Panel:GetWide(),class2Panel:GetTall())
            surface.SetTextColor(255,255,255,255)

            --Class Name
            surface.CreateFont("HeaderFont", {font="Default",size=30,weight=5000})
            surface.SetFont("HeaderFont")
            surface.SetTextPos(5,0)
            surface.DrawText("Clint")

            --Class Name
            surface.SetFont("Default")
            surface.SetTextPos(8,35)
            surface.DrawText("Revolver specialist, has Auto-Pistol for backup.")

        end

        RunConsoleCommand("set_player_class", "2")
    end

    --Shotgun Class Button
    local class3Button = vgui.Create("DButton")
    class3Button:SetParent(Menu)
    class3Button:SetText("")
    class3Button:SetSize(100,50)
    class3Button:SetPos(0,75)
    class3Button.Paint = function ()
        --Color of entire button
        surface.SetDrawColor(50,50,50,255)
        surface.DrawRect(0,0,class3Button:GetWide(),class3Button:GetTall())

        --Draw Bottom and Right borders
        surface.SetDrawColor(40,40,40,255)
        surface.DrawRect(0,49,class3Button:GetWide(),1)
        surface.DrawRect(99,0,1,class3Button:GetTall())

        --Draw Text
        draw.DrawText("Niko", "DermaDefaultBold", class3Button:GetWide()/2,17,Color(255,255,255,255),1)
    end
    class3Button.DoClick = function (class3Button)
        local class3Panel = Menu:Add("Class3Panel")
        
        class3Panel.Paint = function ()
            surface.SetDrawColor(50,50,50,255)
            surface.DrawRect(0,0,class3Panel:GetWide(),class3Panel:GetTall())
            surface.SetTextColor(255,255,255,255)

            --Class Name
            surface.CreateFont("HeaderFont", {font="Default",size=30,weight=5000})
            surface.SetFont("HeaderFont")
            surface.SetTextPos(5,0)
            surface.DrawText("Niko")

            --Class Name
            surface.SetFont("Default")
            surface.SetTextPos(8,35)
            surface.DrawText("Shotgun user, has a pistol as a sidearm.")

        end
        
        RunConsoleCommand("set_player_class", "3")
    end

    --Physcannon Class Button
    local class4Button = vgui.Create("DButton")
    class4Button:SetParent(Menu)
    class4Button:SetText("")
    class4Button:SetSize(100,50)
    class4Button:SetPos(0,125)
    class4Button.Paint = function ()
        --Color of entire button
        surface.SetDrawColor(50,50,50,255)
        surface.DrawRect(0,0,class4Button:GetWide(),class4Button:GetTall())

        --Draw Bottom and Right borders
        surface.SetDrawColor(40,40,40,255)
        surface.DrawRect(0,49,class4Button:GetWide(),1)
        surface.DrawRect(99,0,1,class4Button:GetTall())

        --Draw Text
        draw.DrawText("Gary", "DermaDefaultBold", class4Button:GetWide()/2,17,Color(255,255,255,255),1)
    end
    class4Button.DoClick = function (class4Button)
        local class4Panel = Menu:Add("Class4Panel")

        class4Panel.Paint = function ()
            surface.SetDrawColor(50,50,50,255)
            surface.DrawRect(0,0,class4Panel:GetWide(),class4Panel:GetTall())
            surface.SetTextColor(255,255,255,255)

            --Class Name
            surface.CreateFont("HeaderFont", {font="Default",size=30,weight=5000})
            surface.SetFont("HeaderFont")
            surface.SetTextPos(5,0)
            surface.DrawText("Gary")

            --Class Name
            surface.SetFont("Default")
            surface.SetTextPos(8,35)
            surface.DrawText("Has a Gravity Gun and crowbar.")

        end
        
        RunConsoleCommand("set_player_class", "4")

    end

    --AR2 Class Button
    local class5Button = vgui.Create("DButton")
    class5Button:SetParent(Menu)
    class5Button:SetText("")
    class5Button:SetSize(100,50)
    class5Button:SetPos(0,175)
    class5Button.Paint = function ()
        --Color of entire button
        surface.SetDrawColor(50,50,50,255)
        surface.DrawRect(0,0,class5Button:GetWide(),class5Button:GetTall())

        --Draw Bottom and Right borders
        surface.SetDrawColor(40,40,40,255)
        surface.DrawRect(0,49,class5Button:GetWide(),1)
        surface.DrawRect(99,0,1,class5Button:GetTall())

        --Draw Text
        draw.DrawText("Annie", "DermaDefaultBold", class5Button:GetWide()/2,17,Color(255,255,255,255),1)
    end
    class5Button.DoClick = function (class5Button)
        local class5Panel = Menu:Add("Class5Panel")
        class5Panel.Paint = function ()
            surface.SetDrawColor(50,50,50,255)
            surface.DrawRect(0,0,class5Panel:GetWide(),class5Panel:GetTall())
            surface.SetTextColor(255,255,255,255)

            --Class Name
            surface.CreateFont("HeaderFont", {font="Default",size=30,weight=5000})
            surface.SetFont("HeaderFont")
            surface.SetTextPos(5,0)
            surface.DrawText("Annie")

            --Class Name
            surface.SetFont("Default")
            surface.SetTextPos(8,35)
            surface.DrawText("Has an AR2 and a shotgun with 6 shots.")

        end
        
        RunConsoleCommand("set_player_class", "5")

    end

    --Marksman Class Button
    local class6Button = vgui.Create("DButton")
    class6Button:SetParent(Menu)
    class6Button:SetText("")
    class6Button:SetSize(100,50)
    class6Button:SetPos(0,225)
    class6Button.Paint = function ()
        --Color of entire button
        surface.SetDrawColor(50,50,50,255)
        surface.DrawRect(0,0,class6Button:GetWide(),class6Button:GetTall())

        --Draw Bottom and Right borders
        surface.SetDrawColor(40,40,40,255)
        surface.DrawRect(0,49,class6Button:GetWide(),1)
        surface.DrawRect(99,0,1,class6Button:GetTall())

        --Draw Text
        draw.DrawText("Maggie", "DermaDefaultBold", class6Button:GetWide()/2,17,Color(255,255,255,255),1)
    end
    class6Button.DoClick = function (class6Button)
        local class6Panel = Menu:Add("Class6Panel")

        class6Panel.Paint = function ()
            surface.SetDrawColor(50,50,50,255)
            surface.DrawRect(0,0,class6Panel:GetWide(),class6Panel:GetTall())
            surface.SetTextColor(255,255,255,255)

            --Class Name
            surface.CreateFont("HeaderFont", {font="Default",size=30,weight=5000})
            surface.SetFont("HeaderFont")
            surface.SetTextPos(5,0)
            surface.DrawText("Maggie")

            --Class Name
            surface.SetFont("Default")
            surface.SetTextPos(8,35)
            surface.DrawText("Uses a crossbow and an SMG.")

        end
        
        RunConsoleCommand("set_player_class", "6")

    end
end


--Class 2 Panel

PANEL = {}

function PANEL:Init()
    self:SetSize(650,475)
    self:SetPos(100,25)
end

function PANEL:Paint(w,h)
    draw.RoundedBox(0,0,0,w,h,Color(0,0,0,255))
end

vgui.Register("Class2Panel",PANEL,"Panel")

--End Class 2 Panel

--Class 3 Panel

PANEL = {}

function PANEL:Init()
    self:SetSize(650,475)
    self:SetPos(100,25)
end

function PANEL:Paint(w,h)
    draw.RoundedBox(0,0,0,w,h,Color(0,0,0,255))
end

vgui.Register("Class3Panel",PANEL,"Panel")

--End Class 3 Panel

--Class 4 Panel

PANEL = {}

function PANEL:Init()
    self:SetSize(650,475)
    self:SetPos(100,25)
end

function PANEL:Paint(w,h)
    draw.RoundedBox(0,0,0,w,h,Color(0,0,0,255))
end

vgui.Register("Class4Panel",PANEL,"Panel")

--End Class 4 Panel

--Class 5 Panel

PANEL = {}

function PANEL:Init()
    self:SetSize(650,475)
    self:SetPos(100,25)
end

function PANEL:Paint(w,h)
    draw.RoundedBox(0,0,0,w,h,Color(0,0,0,255))
end

vgui.Register("Class5Panel",PANEL,"Panel")

--End Class 5 Panel

--Class 6 Panel

PANEL = {}

function PANEL:Init()
    self:SetSize(650,475)
    self:SetPos(100,25)
end

function PANEL:Paint(w,h)
    draw.RoundedBox(0,0,0,w,h,Color(0,0,0,255))
end

vgui.Register("Class6Panel",PANEL,"Panel")

--End Class 6 Panel