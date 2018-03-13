/// @desc Movement and Collision

if(room_persistent){
	room_set_persistent(room_game,false)
}

var _x_input = keyboard_check(vk_right) - keyboard_check(vk_left);
var _y_input = keyboard_check(vk_down) - keyboard_check(vk_up);

x_speed += _x_input * acceleration;
y_speed += _y_input * acceleration;

var _speed = point_distance(0, 0, x_speed, y_speed);

var _direction = point_direction(0, 0, x_speed, y_speed);

if (_speed > max_speed) {
	x_speed = lengthdir_x(max_speed, _direction);
	y_speed = lengthdir_y(max_speed, _direction);
}

if (_x_input == 0) {
	x_speed = lerp(x_speed, 0, .1);
}

if (_y_input == 0) {
	y_speed = lerp(y_speed, 0, .1);
}

if (_x_input == 0 && _y_input == 0) {
	image_speed = 0;
	image_index = 0;
} else if(keyboard_check(vk_shift)){
	image_speed = 2;	
} else {
	image_speed = 1;
}

if(keyboard_check(vk_space)){
	gun(_direction);
}
x += x_speed;

// Right collisions
if x_speed > 0 {
	image_xscale = 1;
	if (checkCollision(self, obj_level.grid)) {
		x = bbox_right&~(CELL_WIDTH-1);
		x -= bbox_right-x;
		x_speed = 0;
	}
} else if x_speed < 0 {
	// Left collisions
	image_xscale = -1;	
	if (checkCollision(self, obj_level.grid)) {
		x = bbox_left&~(CELL_WIDTH-1);
		x += CELL_WIDTH+x-bbox_left;
		x_speed = 0;
	}
}

// Move vertically

y += y_speed;
// Vertical collisions
if y_speed > 0 {
	// Bottom collisions
	if (checkCollision(self, obj_level.grid)) {
		y = bbox_bottom&~(CELL_HEIGHT-1);
		y -= bbox_bottom-y;
		y_speed = 0;
	}
} else if y_speed < 0 {
	// Top collisions
	if (checkCollision(self, obj_level.grid)) {
		y = bbox_top&~(CELL_HEIGHT-1);
		y += CELL_HEIGHT+y-bbox_top;
		y_speed = 0;
	}
}

if (self.gunCooldown > 0){
	self.gunCooldown--;
}
//-----------------------------------------------------------------------------------------------------

if(invulnerable){
	if(pulseDirection){
		image_alpha -= 0.075
		if(image_alpha <= 0.3){
			pulseDirection = false;
		}
	}else if(!pulseDirection){
		image_alpha += 0.075
		if(image_alpha >= 1){
			pulseDirection = true;
		}
	}
	if (invulnerabilityTimer < room_speed*invulnerabilityTime){
		invulnerabilityTimer++;
	} else{
		image_alpha = 1;
		invulnerable = false;
		show_debug_message("Can Be Hit Now!");
	}
}



