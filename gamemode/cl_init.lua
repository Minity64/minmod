include("shared.lua")
include("testhud.lua")
include("custom_menu.lua")

function GM:ContextMenuOpen()
    return false
end

function GM:SpawnMenuOpen()
    return false
end

function GM:PlayerNoClip(ply)
    return false
end