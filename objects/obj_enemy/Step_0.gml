/// @desc
if(distance_to_object(obj_player1)< 100){
	var _direction = point_direction(x, y,obj_player1.x, obj_player1.y-10); //direction of movement
	var _length = Speed; // distance moving
	x_speed = lengthdir_x(_length,_direction); // updating xAxis to account for diagonal speed boost
	y_speed = lengthdir_y(_length,_direction); // updating yAxis to account for diagonal speed boost
	direction = _direction;
	gun(_direction);
}else{
	var _direction = 0; //direction of movement
	var _length = 0;
	x_speed = lengthdir_x(_length,_direction); // updating xAxis to account for diagonal speed boost
	y_speed = lengthdir_y(_length,_direction); // updating yAxis to account for diagonal speed boost
}

x+=x_speed;
y+=y_speed;


var _speed = point_distance(0, 0, x_speed, y_speed);

var _direction = point_direction(0, 0, x_speed, y_speed);

if (_speed > max_speed) {
	x_speed = lengthdir_x(max_speed, _direction);
	y_speed = lengthdir_y(max_speed, _direction);
}

if (distance_to_object(obj_player1)>= 100) {
	x_speed = lerp(x_speed, 0, .1);
	y_speed = lerp(y_speed, 0, .1);
}

if (x_speed == 0 && y_speed == 0) {
	image_speed = 0;
	image_index = 0;
}
x+= x_speed;
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

if(gunCooldown>0){
	gunCooldown--;
}
//-----------------------------------------------------------------------------------------------------

if(self.invulnerable){
	if (self.invulnerabilityTimer < room_speed*self.invulnerabilityTime){
		self.invulnerabilityTimer++;
	} else{
		self.invulnerable = false;
	}
}

