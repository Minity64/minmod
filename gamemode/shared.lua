GM.Name = "Minmod"
GM.Author = "Minity"
GM.Email = "N/A"
GM.Website = "N/A"

DeriveGamemode("sandbox")

function GM:Initialize()
	-- Do stuff
end

hook.Add( "PlayerNoClip", "NCLP.Disable", function( pPlayer )
    return false
end )