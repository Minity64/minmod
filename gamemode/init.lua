AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("concommands.lua")
AddCSLuaFile("config/custom_classes.lua")
AddCSLuaFile("testhud.lua")

include("shared.lua")
include("config/custom_classes.lua")
include("concommands.lua")

local open = false

function GM:PlayerSpawn(ply)
    local plyClass = PLAYER_CLASSES[ply:GetNWInt("playerClass")]

    ply:SetMaxHealth(plyClass.health)
    ply:SetHealth(plyClass.health)
    ply:SetWalkSpeed(plyClass.walkspeed)
    ply:SetRunSpeed(plyClass.runspeed)

    ply:StripWeapons()

    ply:SetAmmo(plyClass.ammo_count1a, plyClass.ammo_count1b)
    ply:SetAmmo(plyClass.ammo_count2a, plyClass.ammo_count2b)

    hook.Call("PlayerLoadout", GAMEMODE, ply)
    hook.Call("PlayerSetModel", GAMEMODE, ply)
end

function GM:PlayerInitialSpawn(ply)
    ply:SetNWInt("playerClass", 1)
end

function GM:PlayerLoadout(ply)
    local plyClass = PLAYER_CLASSES[ply:GetNWInt("playerClass")]

    for k, v in pairs(plyClass.weapons) do
        ply:Give(v)
    end

    return true
end

function GM:PlayerSetModel(ply)
    local plyClass = PLAYER_CLASSES[ply:GetNWInt("playerClass")]

    ply:SetModel(plyClass.model)
    ply:SetupHands()
end

util.AddNetworkString("FMenu")
function GM:ShowSpare2(ply)
    if (open == false) then
        open = true
    else
        open = false
    end

    net.Start("FMenu")
        net.WriteBit(open)
    net.Broadcast()
end