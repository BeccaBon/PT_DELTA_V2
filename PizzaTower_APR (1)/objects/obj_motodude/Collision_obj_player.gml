if (stationned == 1)
{
    other.xscale = sign(image_xscale)
    other.state = states.motorcycle
    other.movespeed = abs(hsp)
    other.sprite_index = spr_player_pizzacar
    explode = false
    instance_destroy()
}
else
{
    instance_destroy()
    scr_hurtplayer(other)
}







