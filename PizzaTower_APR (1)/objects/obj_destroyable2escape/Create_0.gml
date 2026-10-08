global.breaksound = 0;

if (obj_player1.character == "P" && obj_player1.spotlight == true && obj_player1.ispeppino)
{
	sprite_index = spr_destroyable2escape;
}

if ((obj_player1.character == "N" || !obj_player1.ispeppino) && obj_player1.spotlight == true)
{
	sprite_index = spr_halloweensmallblockescape;
}

depth = 1;
