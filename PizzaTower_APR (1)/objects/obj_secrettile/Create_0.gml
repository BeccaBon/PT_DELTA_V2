active = false;
alpha = 1;
depth = -7;
desireddepth = -6;
surf = -4;
tiles[0] = array_create(0);
tiles[1] = array_create(0);
tiles[2] = array_create(0);
for (var i = 0; i < 3; i++)
{
	var lay_id = layer_get_id(concat("Tiles_Secret", i + 1));
	tilemap_sprite[i] = -4;
	if lay_id != -1
	{
		var map_id = layer_tilemap_get_id(lay_id);
		var ts = tilemap_get_tileset(map_id);
		var t = -4;
		switch ts
		{
			//case tile_towerentrancehall:
			//	t = spr_towerentrancehall
			//	break
			case tileset_ruin:
				t = tilespr_tileset_ruin
				break
			case tileset_ruin2:
				t = tilespr_tileset_ruin2
				break
			//case tile_ruinend:
			//	t = spr_ruinend
			//	break
			//case tile_ruinend_secret:
			//	t = spr_ruinend_secret
			//	break
			case tileset_tile_beachtest:
				t = tilespr_tileset_tile_beachtest
				break
			case tileset_tile_beachtest2:
				t = tilespr_tileset_tile_beachtest2
				break
			case tileset_tile_beachtest2dark:
				t = tilespr_tileset_tile_beachtest2dark
				break
			case tileset_chateau1:
				t = tilespr_tileset_chateau1
				break
			case tile_desert_tileset:
				t = tile_desert
				break
			case tile_ufo_tileset:
				t = tilespr_tile_ufo_tileset
				break
			case tile_cavern_tileset:
				t = tile_cavern
				break
			case tileset_dungeon:
				t = tilespr_tileset_dungeon
				break
			case tileset_dungeon2:
				t = tilespr_tileset_dungeon2
				break
			case tileset_dungeon3:
				t = tilespr_tileset_dungeon3
				break
			case tile_entrance:
				t = tile_entrance1
				break
			case tile_tower_tileset:
				t = tile_tower
				break
			case tileset_farm:
				t = tilespr_tileset_farm
				break
			case tileset_tile_forest:
				t = sprite_tile_forest
				break
			//case tile_forestplain:
			//	t = spr_forestplaintile
			//	break
			case tileset_tile_forest1_shade:
				t = tilespr_tileset_tile_forest1_shade
				break
			case tileset_tile_forest2:
				t = tilespr_tileset_tile_forest2
				break
			//case tileset_freezer:
			//	t = bg_tilefreezer
			//	break
			//case tileset_freezer2:
			//	t = tile_freezer2
			//	break
			case tileset_graveyard:
				t = tilespr_tileset_graveyard
				break
			case tileset_graveyardinterior:
				t = tilespr_tileset_graveyardinterior
				break
			case tileset_graveyardunderground:
				t = tilespr_tileset_graveyardunderground
				break
			case tile_factory_tileset:
				t = tile_factory
				break
			//case tile_factory2:
			//	t = tile_factory2424
			//	break
			//case tile_kidsparty:
			//	t = spr_kidspartytile
			//	break
			case tileset_tile_kungfu:
				t = tilespr_tileset_tile_kungfu
				break
			case tileset_tile_kungfucity:
				t = tilespr_tileset_tile_kungfucity
				break
			case tileset_tile_kungfustructure:
				t = tilespr_tileset_tile_kungfustructure
				break
			//case tile_mansion2:
			//	t = spr_mansiontile2
			//	break
			case tile_castle_tileset:
				t = tile_castle
				break
			case tileset_medieval:
				t = tilespr_tileset_medieval
				break
			case tileset_medieval2:
				t = tilespr_tileset_medieval2
				break
			case tileset_medieval3:
				t = tileset_medieval3
				break
			case tileset_tile_minigolf:
				t = tilespr_tileset_tile_minigolf
				break
			case tileset_tile_minigolf2:
				t = tilespr_tileset_tile_minigolf2
				break
			case tileset_tile_minigolf2_shad:
				t = tilespr_tileset_tile_minigolf2
				break
			case tileset_secret:
				t = tilespr_tileset_secret
				break
			case tileset_tile_space1:
				t = sprite_tile_space1
				break
			case tileset_tile_spaceback1:
				t = tilespr_tileset_tile_spaceback1
				break
			case tileset_tile_space2:
				t = tilespr_tileset_tile_space2
				break
			case tile_space3props:
				t = tilespr_tile_space3props
				break
			case tileset_pinball1:
				t = tilespr_tileset_pinball1
				break
			case tileset_pinball2:
				t = tilespr_tileset_pinball2
				break
			case tileset_pinball3:
				t = tilespr_tileset_pinball3
				break
			//case tile_saloonwooden:
			//	t = spr_pinballwooden
			//	break
			case tileset_tile_war1:
				t = tilespr_tileset_tile_war1
				break
			case tileset_tile_war2:
				t = tilespr_tileset_tile_war2
				break
			case tileset_tile_war3:
				t = tilespr_tileset_tile_war3
				break
			case tileset_tile_war4:
				t = tilespr_tileset_tile_war4
				break
			//case tile_warlab:
			//	t = spr_warlab
			//	break
			case tileset_tile_war1shadow:
				t = tilespr_tileset_tile_war1shadow
				break
			case tileset_tile_space2shadow:
				t = tilespr_tileset_tile_space2shadow
				break
			case tileset_tile_citycarnival:
				t = tilespr_tileset_tile_citycarnival
				break
			case tileset_tile_citydark:
				t = sprite_tile_citydark
				break
			//case tile_medievalinterior:
			//	t = spr_medievalinterior
			//	break
			//case tile_medievallibrary:
			//	t = spr_medievallibrary
			//	break
			//case tile_interior:
			//	t = spr_interiortile2
			//	break
			case tile_desertdeco:
				t = tilespr_desertdeco
				break
			//case tile_beachdeco:
			//	t = spr_beachdeco
			//	break
			//case tile_forest1:
			//	t = spr_foresttile1
			//	break
			//case tile_storage:
			//	t = spr_storagetile
			//	break
			case tile_city1props:
				t = tilespr_tile_city1props
				break
			//case tile_graveyardmine:
			//	t = spr_graveyardmine
			//	break
			//case tile_exit:
			//	t = tilespr_exit_sprite
			//	break
		}
		
		tilemap_sprite[i] = t;
		var _w32 = sprite_get_width(t) / 32;
		for (var yy = 0; yy < image_yscale; yy++)
		{
			for (var xx = 0; xx < image_xscale; xx++)
			{
				var _x = x + (xx * 32);
				var _y = y + (yy * 32);
				var data = tilemap_get_at_pixel(map_id, _x, _y);
				var _id = tile_get_index(data);
				var xi = 0;
				var yi = 0;
				xi = _id % _w32;
				yi = floor(_id / _w32);
				array_push(tiles[i], [_x, _y, xi * 32, yi * 32]);
				data = tile_set_empty(data);
				tilemap_set_at_pixel(map_id, data, _x, _y);
			}
		}
	}
}
trace(tilemap_sprite);
if (array_length(tiles[0]) <= 0 && array_length(tiles[1]) <= 0 && array_length(tiles[2]) <= 0)
	instance_destroy();





