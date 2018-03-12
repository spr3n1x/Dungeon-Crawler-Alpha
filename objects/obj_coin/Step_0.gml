/// @desc

if(timer >= lifespan*room_speed){
	instance_destroy();
}

timer++;

if(distance_to_object(obj_player1)< 35){
	var _direction = point_direction(x, y,obj_player1.x, obj_player1.y); //direction of movement
	var _length = Speed; // distance moving
	xAxis = lengthdir_x(_length,_direction); // updating xAxis to account for diagonal speed boost
	yAxis = lengthdir_y(_length,_direction); // updating yAxis to account for diagonal speed boost
}else{
	var _direction = 0; //direction of movement
	var _length = 0;
	xAxis = lengthdir_x(_length,_direction); // updating xAxis to account for diagonal speed boost
	yAxis = lengthdir_y(_length,_direction); // updating yAxis to account for diagonal speed boost
}

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