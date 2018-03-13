initialization();
randomize();
// Create the surface for the shadows
shadow_surface = noone;

// Get the tile layer map id
var wall_map_id = layer_tilemap_get_id("WallTiles");

// Set up the grid
width = room_width div CELL_WIDTH;
height = room_height div CELL_HEIGHT;
grid = ds_grid_create(width, height);
ds_grid_set_region(grid, 0, 0, width - 1, height - 1, VOID);

// Create the controller
var controller_x = width div 2;
var controller_y = height div 2;
var controller_direction = irandom(3);
var steps = 400;

var player_start_x = controller_x * CELL_WIDTH + CELL_WIDTH/2;
var player_start_y = controller_y * CELL_HEIGHT + CELL_HEIGHT/2+4;
instance_create_layer(player_start_x, player_start_y, "Instances", obj_player1);

// Choose the direction change odds
var direction_change_odds = 1;

// Generate the level
repeat (steps) {
	grid[# controller_x, controller_y] = FLOOR;
	
	// Rnadomize the direction
	if (irandom(direction_change_odds) == direction_change_odds) {
		controller_direction = irandom(3);	
	}
	
	// Move the controller
	var x_direction = lengthdir_x(1, controller_direction * 90);
	var y_direction = lengthdir_y(1, controller_direction * 90);
	controller_x += x_direction;
	controller_y += y_direction;
	
	// Make sure we don't move outside the room
	if (controller_x < 2 || controller_x >= width - 2) {
		controller_x += -x_direction * 2;
	}
	if (controller_y < 2 || controller_y >= height - 2) {
		controller_y += -y_direction * 2;
	}
}
var _check = 0;
// Create the walls tiles
for (var _y = 1; _y < height-1; _y++) {
	for (var _x = 1; _x < width-1; _x++) {
		if (grid[# _x, _y] != FLOOR) {
			var north_tile = grid[# _x, _y-1] == VOID;
			var west_tile = grid[# _x-1, _y] == VOID;
			var east_tile = grid[# _x+1, _y] == VOID;
			var south_tile = grid[# _x, _y+1] == VOID;
		
			var tile_index = NORTH*north_tile + WEST*west_tile + EAST*east_tile + SOUTH*south_tile + 1;
			
			
			if (tile_index == 1) {
				grid[# _x, _y] = FLOOR;
			}
		}
	}
}
var posFound = false;
var xPos = 0;
var yPos = 0;
while(!posFound){
	xPos = irandom(width-1);
	yPos = irandom(height-1);
	if(grid[# xPos,yPos] == FLOOR){
		posFound = true;
	}
}

instance_create_layer(xPos * CELL_WIDTH + CELL_WIDTH/2, yPos * CELL_HEIGHT + CELL_HEIGHT/2, "Instances", obj_enemy);
// Create the walls tiles
for (var _y = 1; _y < height-1; _y++) {
	for (var _x = 1; _x < width-1; _x++) {
		if (grid[# _x, _y] != FLOOR) {
			var north_tile = grid[# _x, _y-1] == VOID;
			var west_tile = grid[# _x-1, _y] == VOID;
			var east_tile = grid[# _x+1, _y] == VOID;
			var south_tile = grid[# _x, _y+1] == VOID;
		
			var tile_index = NORTH*north_tile + WEST*west_tile + EAST*east_tile + SOUTH*south_tile + 1;
			tilemap_set(wall_map_id, tile_index, _x, _y);
		}
	}
}