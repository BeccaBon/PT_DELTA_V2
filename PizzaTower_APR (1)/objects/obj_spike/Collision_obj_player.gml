if (other.state != states.barrel)
{
    scr_hurtplayer(other)
    if fake
        instance_destroy()
}
else
{
    if (other.state == states.knightpep or other.state == states.knightpepslopes or other.state == states.knightpepbump)
    {
        state = states.bump
        sprite_index = spr_bump
        image_index = 0
        hsp = -6 * xscale
        vsp = -4
        scr_soundeffect(sfx_loseknight)
        repeat (3)
            create_debris(x, y, spr_wooddebris)
    }
}
