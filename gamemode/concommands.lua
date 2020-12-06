function setPlayerClass(ply, cmd, args)
    ply:SetNWInt("playerClass", tonumber(args[1]))

    ply:Spawn()
end
concommand.Add("set_player_class", setPlayerClass)