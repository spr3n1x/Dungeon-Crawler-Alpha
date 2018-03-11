/// @desc
/// @function

randomize();

var _wall_map_id = layer_tilemap_get_id("wallTiles");

width = room_width div CELL_WIDTH;
height = room_height div CELL_HEIGHT;
grid = ds_grid_create(width,height);
ds_grid_set_region(grid,0,0,width,height,VOID);
var _controller_x = width div 2;
var _controller_y = height div 2;
var _controller_direction = irandom(3);
var _steps = 400;

var _direction_change_odds = 1;

repeat(_steps) {
	grid[# _controller_x,_controller_y] = FLOOR;	
	
	if(irandom(_direction_change_odds) == _direction_change_odds){
		_controller_direction = irandom(3);
	}
	
	var _x_direction = lengthdir_x(1,_controller_direction*90);
	var _y_direction = lengthdir_y(1, _controller_direction*90);
	_controller_x+=_x_direction;
	_controller_y+=_y_direction;
	
	if(_controller_x<2||_controller_x >= width -2){
		_controller_x+= -_x_direction*2
	}
	
	if(_controller_y<2||_controller_y >= height -2){
		_controller_y+= -_y_direction*2
	}
	
	
}

for(var _y = 1; _y < height-1;_y++){
	for(var _x = 1;_x < width-1;_x++){
		if (grid[# _x,_y]!=FLOOR){
			var _north_tile = grid[# _x,_y-1] == VOID;
			var _west_tile = grid[# _x-1,_y] == VOID;
			var _east_tile = grid[# _x+1,_y] == VOID;
			var _south_tile = grid[# _x,_y+1] == VOID;
			
			var _tile_index = NORTH*_north_tile+WEST*_west_tile+EAST*_east_tile+SOUTH*_south_tile + 1
			if(_tile_index == 1){
				grid[# _x, _y] = FLOOR;
			}
			tilemap_set(_wall_map_id, 1 , _x, _y);
		}
	}
}
for(var _y = 1; _y < height-1;_y++){
	for(var _x = 1;_x < width-1;_x++){
		if (grid[# _x,_y]!=FLOOR){
			var _north_tile = grid[# _x,_y-1] == VOID;
			var _west_tile = grid[# _x-1,_y] == VOID;
			var _east_tile = grid[# _x+1,_y] == VOID;
			var _south_tile = grid[# _x,_y+1] == VOID;
			
			var _tile_index = NORTH*_north_tile+WEST*_west_tile+EAST*_east_tile+SOUTH*_south_tile + 1
			tilemap_set(_wall_map_id, _tile_index,_x,_y);
		}
	}
}

