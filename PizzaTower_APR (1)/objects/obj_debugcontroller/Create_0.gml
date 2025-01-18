// Note added by UTMTCE: "GMS2.3 object function definitions" has been automatically enabled
#macro debug (GM_build_type == "run")
depth = -500
GIVEKEY = new DebugCommand("givekey", "", "givekey", function() //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_259_gml_Object_obj_debugcontroller_Create_0
{
    global.key_inv = 1
}
)
SETCOMBO = new DebugCommand("set_combo", "Set the combo", "set_combo <combo> <combotime:optional>", function(argument0, argument1) //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_430_gml_Object_obj_debugcontroller_Create_0
{
    if (argument0 == undefined)
        return;
    if (argument1 == undefined)
        argument1 = 60
    global.combo = argument0
    global.combotime = argument1
    with (obj_player)
        supercharge = 10
}
)
GIVEHEAT = new DebugCommand("giveheat", "Gives heat", "giveheat", function() //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_794_gml_Object_obj_debugcontroller_Create_0
{
    global.style += 100
}
)
ALLTOPPINS = new DebugCommand("alltoppins", "Adds all the toppins", "alltoppins", function() //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_943_gml_Object_obj_debugcontroller_Create_0
{
    if (!instance_exists(obj_pizzakincheese))
        instance_create(obj_player1.x, obj_player1.y, obj_pizzakincheese)
    if (!instance_exists(obj_pizzakintomato))
        instance_create(obj_player1.x, obj_player1.y, obj_pizzakintomato)
    if (!instance_exists(obj_pizzakinsausage))
        instance_create(obj_player1.x, obj_player1.y, obj_pizzakinsausage)
    if (!instance_exists(obj_pizzakinpineapple))
        instance_create(obj_player1.x, obj_player1.y, obj_pizzakinpineapple)
    if (!instance_exists(obj_pizzakinshroom))
        instance_create(obj_player1.x, obj_player1.y, obj_pizzakinshroom)
    global.cheesefollow = 1
    global.tomatofollow = 1
    global.sausagefollow = 1
    global.pineapplefollow = 1
    global.shroomfollow = 1
}
)
PANIC = new DebugCommand("panic", "Toggles pizza time", "panic <minutes> <seconds>", function(argument0, argument1) //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_1859_gml_Object_obj_debugcontroller_Create_0
{
    if (argument0 != undefined)
    {
        argument0 = self.get_number_string(argument0)
        global.minutes = argument0
    }
    if (argument1 != undefined)
    {
        argument1 = self.get_number_string(argument1)
        global.seconds = clamp(argument1, 0, 60)
    }
    global.panic = (!global.panic)
    if global.panic
        obj_camera.alarm[1] = 60
}
)
SHOW_COLLISIONS = new DebugCommand("showcollisions", "Shows the collisions", "showcollisions <bool>", function(argument0) //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_2397_gml_Object_obj_debugcontroller_Create_0
{
    if (argument0 == undefined)
        return;
    argument0 = self.get_bool(argument0)
    if (argument0 != undefined)
    {
        showcollisions = argument0
        event_perform(ev_other, ev_room_start)
    }
}
)
SHOW_HUD = new DebugCommand("showhud", "Shows the HUD", "showhud <bool>", function(argument0) //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_2758_gml_Object_obj_debugcontroller_Create_0
{
    if (argument0 == undefined)
        return;
    argument0 = self.get_bool(argument0)
    show_debug_message((!argument0))
    if (argument0 != undefined)
    {
        showhud = argument0
        with (obj_tv)
        {
            visible = argument0
            show_debug_message(visible)
        }
        with (obj_camera)
        {
            visible = argument0
            show_debug_message(visible)
        }
        with (obj_roomname)
        {
            visible = argument0
            show_debug_message(visible)
        }
        with (obj_pigtotal)
        {
            visible = argument0
            show_debug_message(visible)
        }
    }
}
)
PLAYER_ROOM = new DebugCommand("player_room", "Go to given room", "player_room <targetRoom> <targetDoor>", function(argument0, argument1) //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_3621_gml_Object_obj_debugcontroller_Create_0
{
    if (argument0 == undefined)
        return;
    if (argument1 == undefined)
        return;
    argument0 = asset_get_index(argument0)
    if (argument0 == -1)
        return;
    with (obj_player)
    {
        targetRoom = argument0
        targetDoor = argument1
    }
    instance_create(x, y, obj_fadeout)
}
)
CAMERA_ZOOM = new DebugCommand("camera_zoom", "Zoom", "camera_zoom <targetzoom> <spd>", function(argument0, argument1) //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_4191_gml_Object_obj_debugcontroller_Create_0
{
    if (argument0 == undefined)
        return;
    if (argument1 != undefined)
        argument1 = self.get_number_string(argument1)
    with (obj_camera)
    {
        targetzoom = argument0
        targetzoom = clamp(targetzoom, 0, max_zoom)
        if (argument1 != undefined)
            zoomspd = abs(argument1)
    }
}
)
HARDMODE = new DebugCommand("hardmode", "Toggles hardmode", "hardmode <bool>", function(argument0) //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_4684_gml_Object_obj_debugcontroller_Create_0
{
    if (argument0 == undefined)
        return;
    argument0 = self.get_bool(argument0)
    show_debug_message((!argument0))
    if (argument0 != undefined)
    {
        global.hardmode = argument0
        with (obj_hardmode)
            event_perform(ev_other, ev_room_start)
    }
}
)
PLAYER_SET_STATE = new DebugCommand("player_set_state", "Changes the player state", "player_set_state <states.state>", function(argument0) //gml_Script_anon_gml_Object_obj_debugcontroller_Create_0_5191_gml_Object_obj_debugcontroller_Create_0
{
    if (argument0 == undefined)
        return;
    argument0 = ds_map_find_value(state_map, argument0)
    if (!is_undefined(argument0))
    {
        with (obj_player)
        {
            if (object_index == obj_player1 || global.coop)
            {
                state = argument0
                var _spr = sprite_index
                switch argument0
                {
                    case states.normal:
                        _spr = spr_idle
                        break
                    case (19 << 0):
                        _spr = spr_cheesepep_idle
                        break
                    case (33 << 0):
                        _spr = spr_knightpepidle
                        break
                }

                sprite_index = _spr
                image_index = 0
            }
        }
    }
}
)
active = 0
showcollisions = 1
showhud = 1
state_map = ds_map_create()
ds_map_set(state_map, "states.normal", (0 << 0))
ds_map_set(state_map, "states.cheesepep", (19 << 0))
ds_map_set(state_map, "states.knightpep", (33 << 0))
command_list = ds_list_create()
ds_list_add(command_list, SHOW_HUD, SHOW_COLLISIONS, PLAYER_ROOM, CAMERA_ZOOM, HARDMODE, PLAYER_SET_STATE, PANIC, ALLTOPPINS, GIVEHEAT)
ds_list_add(command_list, SETCOMBO, GIVEKEY)
input_text = ""
input_text_list = ds_list_create()
input_buffer = 0
input_max = 1
delete_buffer = 0
delete_max = 8
keyboard_string = ""
lastplayerstate = obj_player1.state
function get_bool(argument0) //gml_Script_get_bool_gml_Object_obj_debugcontroller_Create_0
{
    if (argument0 == "true")
    {
        argument0 = 1
        return argument0;
    }
    else if (argument0 == "false")
    {
        argument0 = 0
        return argument0;
    }
    else if is_real(real(string_digits(argument0)))
    {
        argument0 = bool(real(string_digits(argument0)))
        return argument0;
    }
    return undefined;
}

function get_number_string(argument0) //gml_Script_get_number_string_gml_Object_obj_debugcontroller_Create_0
{
    var n = argument0
    if is_string(argument0)
    {
        n = real(string_digits(argument0))
        if (string_char_at(argument0, 1) == "-")
            n = (-real(string_digits(argument0)))
    }
    return n;
}

function check_command(argument0) //gml_Script_check_command_gml_Object_obj_debugcontroller_Create_0
{
    if (!ds_list_empty(argument0))
    {
        for (var i = 0; i < ds_list_size(command_list); i++)
        {
            var _cmd = ds_list_find_value(command_list, i)
            if (ds_list_find_value(argument0, 0) == _cmd.command_id)
                return i;
        }
    }
    return -1;
}

function get_command_list(argument0) //gml_Script_get_command_list_gml_Object_obj_debugcontroller_Create_0
{
    var r = ds_list_create()
    for (var i = 0; i < ds_list_size(command_list); i++)
    {
        var _cmd = ds_list_find_value(command_list, i)
        if (string_copy(_cmd.command_id, 1, string_length(argument0)) == argument0)
            ds_list_add(r, _cmd)
    }
    if (!ds_list_empty(r))
        return r;
    else
    {
        ds_list_destroy(r)
        return -4;
    }
}