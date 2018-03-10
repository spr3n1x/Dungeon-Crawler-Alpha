/// @desc

var _direction = point_direction(0, 0, xAxis, yAxis); //direction of movement

var _length = Speed * (xAxis !=0 || yAxis != 0); // distance moving

xAxis = lengthdir_x(_length,_direction); // updating xAxis to account for diagonal speed boost

yAxis = lengthdir_y(_length,_direction); // updating yAxis to account for diagonal speed boost


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


//-----------------------------------------------------------------------------------------------------

invulnerability();

