/// @desc 

switch(state){
	case enemyStates.idle:
	#region idle
		var _direction = 0; //direction of movement
		var _length = 0;
		x_speed = lengthdir_x(_length,_direction); // updating xAxis to account for diagonal speed boost
		y_speed = lengthdir_y(_length,_direction); // updating yAxis to account for diagonal speed boost
		image_speed = 0;
		//image_index = 0;
		idleCheck += 1;
		
		if(idleCheck == idle_time){
			state = enemyStates.wander;
			wanderTimer = 0;
			show_debug_message("wander state");
			break;
		}
		if(distance_to_object(obj_player1) < aggroRange){
			state = enemyStates.alert;
			show_debug_message("alert state");
		}
		
		
		break;
	#endregion
	case enemyStates.wander:
		#region wander
		if(wanderTimer == 0){
			wanderDir = irandom(3)*90;
			wanderTimer = wanderTime;
		}
		var _direction = wanderDir; //direction of movement
		var _length = Speed;
		x_speed = lengthdir_x(_length,_direction); // updating xAxis to account for diagonal speed boost
		y_speed = lengthdir_y(_length,_direction); // updating yAxis to account for diagonal speed boost
		image_speed = 0;
		//image_index = 0;
		idleCheck -= 1;
		
		if(idleCheck == 0){
			state = enemyStates.idle;
			show_debug_message("idle state");
			wanderTimer = 0;
			break;
		}
		if(distance_to_object(obj_player1) < aggroRange){
			state = enemyStates.alert;
			show_debug_message("alert state");
			wanderTimer = 0;
			idleCheck = 0;
			break;
		}
		wanderTimer--;
		break;
		#endregion
	case enemyStates.alert:
		#region alert
			var _direction = point_direction(x, y,obj_player1.x, obj_player1.y-10); //direction of movement
			var _length = Speed; // distance moving
			x_speed = lengthdir_x(_length,_direction); // updating xAxis to account for diagonal speed boost
			y_speed = lengthdir_y(_length,_direction); // updating yAxis to account for diagonal speed boost
			direction = _direction;
			
			if(distance_to_object(obj_player1) > aggroRange){
				state = enemyStates.search;
				show_debug_message("search state");
			}
			if(distance_to_object(obj_player1) < shootRange){
				state = enemyStates.shoot;
				show_debug_message("shoot state");
			}
			if(hp <= max_hp/5){
				state = enemyStates.escape;
				show_debug_message("escape state");
			}
			break;
		#endregion
	case enemyStates.search:
		#region search
			currentDir = point_direction(x, y,obj_player1.x, obj_player1.y-10); //direction of movement

			var _direction = currentDir
			var _length = Speed; // distance moving
			x_speed = lengthdir_x(_length,_direction); // updating xAxis to account for diagonal speed boost
			y_speed = lengthdir_y(_length,_direction); // updating yAxis to account for diagonal speed boost
			direction = _direction;
			searchTimer--;
			if(distance_to_object(obj_player1) < aggroRange){
				state = enemyStates.alert;
				searchTimer = searchTime;
				searchTime = searchTimePerm;
				show_debug_message("alert state");
				break;
			}
			if(searchTimer == 0){
				state = enemyStates.idle;
				searchTimer = searchTime;
				searchTime = searchTimePerm;
				show_debug_message("idle state");
			}
			if(hp <= max_hp/5){
				state = enemyStates.escape;
				searchTimer = searchTime;
				searchTime = searchTimePerm;
				show_debug_message("escape state");
			}
			break;
		#endregion
	case enemyStates.attack:
		#region attack
			var _direction = point_direction(x, y,obj_player1.x, obj_player1.y-10); //direction of movement
			var _length = Speed/4; // distance moving
			x_speed = lengthdir_x(_length,_direction); // updating xAxis to account for diagonal speed boost
			y_speed = lengthdir_y(_length,_direction); // updating yAxis to account for diagonal speed boost
			direction = _direction;
			var _speed = point_distance(0, 0, x_speed, y_speed);
			var _direction = point_direction(0, 0, x_speed, y_speed);
			
			if(distance_to_object(obj_player1) > atkRange){
				state = enemyStates.shoot;
				show_debug_message("shoot state");
			}
			if(hp <= max_hp/5){
				state = enemyStates.escape;
				show_debug_message("escape state");
			}
			
			break;
		#endregion
	case enemyStates.shoot:
		#region shoot
			var _direction = point_direction(x, y,obj_player1.x, obj_player1.y-10); //direction of movement
			var _length = Speed/2; // distance moving
			x_speed = lengthdir_x(_length,_direction); // updating xAxis to account for diagonal speed boost
			y_speed = lengthdir_y(_length,_direction); // updating yAxis to account for diagonal speed boost
			direction = _direction;
			
			if(distance_to_object(obj_player1) > shootRange){
				state = enemyStates.alert;
				show_debug_message("alert state");
			}
			if(distance_to_object(obj_player1) < atkRange){
				state = enemyStates.attack;
				show_debug_message("attack state");
			}
			if(hp <= max_hp/5){
				state = enemyStates.escape;
				show_debug_message("escape state");
			}
			break;
		#endregion
	case enemyStates.escape:
		#region escape
			var _direction = point_direction(x, y,obj_player1.x, obj_player1.y-10)-180; //direction of movement
			var _length = Speed; // distance moving
			x_speed = lengthdir_x(_length,_direction); // updating xAxis to account for diagonal speed boost
			y_speed = lengthdir_y(_length,_direction); // updating yAxis to account for diagonal speed boost
			direction = _direction;
			if(distance_to_object(obj_player1) > escapeRange){
				state = enemyStates.heal;
				show_debug_message("heal state");
			}
			break;
		#endregion
	case enemyStates.heal:
		#region heal
			var _direction = 0; //direction of movement
			var _length = 0;
			x_speed = lengthdir_x(_length,_direction); // updating xAxis to account for diagonal speed boost
			y_speed = lengthdir_y(_length,_direction); // updating yAxis to account for diagonal speed boost
			image_speed = 0;
			healTimer--;
			if(healTimer == 0){
				healTimer = healTime;
				hp += 1;
				if(distance_to_object(obj_player1)<escapeRange){
					state = enemyStates.escape;
					show_debug_message("escape state");
				}
			}
			if(hp >=max_hp*0.8){
				state = enemyStates.idle;
				show_debug_message("idle state");
			}
			break;
		#endregion
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























//if(distance_to_object(obj_player1)< 100){
//	var _direction = point_direction(x, y,obj_player1.x, obj_player1.y-10); //direction of movement
//	var _length = Speed; // distance moving
//	x_speed = lengthdir_x(_length,_direction); // updating xAxis to account for diagonal speed boost
//	y_speed = lengthdir_y(_length,_direction); // updating yAxis to account for diagonal speed boost
//	direction = _direction;
//	gun(_direction);
//}else{
//	var _direction = 0; //direction of movement
//	var _length = 0;
//	x_speed = lengthdir_x(_length,_direction); // updating xAxis to account for diagonal speed boost
//	y_speed = lengthdir_y(_length,_direction); // updating yAxis to account for diagonal speed boost
//}

//x+=x_speed;
//y+=y_speed;


//var _speed = point_distance(0, 0, x_speed, y_speed);

//var _direction = point_direction(0, 0, x_speed, y_speed);

//if (_speed > max_speed) {
//	x_speed = lengthdir_x(max_speed, _direction);
//	y_speed = lengthdir_y(max_speed, _direction);
//}

//if (distance_to_object(obj_player1)>= 100) {
//	x_speed = lerp(x_speed, 0, .1);
//	y_speed = lerp(y_speed, 0, .1);
//}

//if (x_speed == 0 && y_speed == 0) {
//	image_speed = 0;
//	image_index = 0;
//}


//-----------------------------------------------------------------------------------------------------

//-----------------------------------------------------------------------------------------------------



