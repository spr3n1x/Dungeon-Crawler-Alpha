/// @desc
if(idleCheck == 0){
		state = enemyStates.idle;
}if(idleCheck == room_speed * 5){
	state = enemyStates.wander;
}else if (distance_to_object(obj_player1) < aggroRange || hp < hp * 0.2) {
	state = enemyStates.escape;
}else if (distance_to_object(obj_player1) > escapeRange || hp < hp * 0.2) {
	state = enemyStates.heal;
}else if (distance_to_object(obj_player1) > aggroRange || state == enemyStates.alert) {
	state = enemyStates.search;
}else if (distance_to_object(obj_player1) < atkRange) {
	state = enemyStates.attack;
}else if (distance_to_object(obj_player1) < shootRange) {
	state = enemyStates.shoot;	
}else if (distance_to_object(obj_player1) < aggroRange) {
	state = enemyStates.alert;
}

if(state != enemyStates.idle && state != enemyStates.wander){
	idleCheck = 0;
}

switch(state){
	case enemyStates.idle:
	#region idle
		var _direction = 0; //direction of movement
		var _length = 0;
		x_speed = lengthdir_x(_length,_direction); // updating xAxis to account for diagonal speed boost
		y_speed = lengthdir_y(_length,_direction); // updating yAxis to account for diagonal speed boost
		image_speed = 0;
		image_index = 0;
		idleCheck += 1;
		break;
	#endregion
	case enemyStates.wander:
		#region wander
		break;
		#endregion
	case enemyStates.alert:
		#region alert
			var _direction = point_direction(x, y,obj_player1.x, obj_player1.y-10); //direction of movement
			var _length = Speed; // distance moving
			x_speed = lengthdir_x(_length,_direction); // updating xAxis to account for diagonal speed boost
			y_speed = lengthdir_y(_length,_direction); // updating yAxis to account for diagonal speed boost
			direction = _direction;
			var _speed = point_distance(0, 0, x_speed, y_speed);
			var _direction = point_direction(0, 0, x_speed, y_speed);
			if (_speed > max_speed) {
				x_speed = lengthdir_x(max_speed, _direction);
				y_speed = lengthdir_y(max_speed, _direction);
			}
			break;
		#endregion
	case enemyStates.search:
		#region search
			break;
		#endregion
	case enemyStates.attack:
		#region attack
			break;
		#endregion
	case enemyStates.shoot:
		#region shoot
			break;
		#endregion
	case enemyStates.escape:
		#region escape
			break;
		#endregion
	case enemyStates.heal:
		#region heal
			break;
		#endregion
}


x+=x_speed;
y+=y_speed;

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


if (self.gunCooldown < room_speed * gunCooldownRate){
	self.gunCooldown++;
}

if(self.invulnerable){
	if (self.invulnerabilityTimer < room_speed*self.invulnerabilityTime){
		self.invulnerabilityTimer++;
	} else{
		self.invulnerable = false;
	}
}























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


//-----------------------------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------------------------



