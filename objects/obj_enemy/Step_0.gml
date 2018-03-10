/// @desc
if(distance_to_object(obj_player)< 100){
	var _direction = point_direction(x, y,obj_player.x, obj_player.y); //direction of movement
	var _length = Speed; // distance moving
	xAxis = lengthdir_x(_length,_direction); // updating xAxis to account for diagonal speed boost
	yAxis = lengthdir_y(_length,_direction); // updating yAxis to account for diagonal speed boost
	direction = _direction;
	image_angle = _direction;
}else{
	var _direction = 0; //direction of movement
	var _length = 0;
	xAxis = lengthdir_x(_length,_direction); // updating xAxis to account for diagonal speed boost
	yAxis = lengthdir_y(_length,_direction); // updating yAxis to account for diagonal speed boost
}
gun();

// wall collision with walls
if(place_meeting(x+xAxis, y, obj_wall))
{
	// nudging the object up against the wall
	while(!place_meeting(x+sign(xAxis), y, obj_wall))
	{
		x+= sign(xAxis);
	}
	xAxis = 0;
}
// adding xAxis to x for movement
x+=xAxis;
// wall collision with walls
if(place_meeting(x, y+yAxis, obj_wall))
{
	// nudging the object up against the wall
	while(!place_meeting(x, y+sign(yAxis), obj_wall))
	{
		y+= sign(yAxis);
	}
	yAxis = 0;
}
// adding xAxis to x for movement
y+=yAxis;

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

