/// @desc Step Detection

xAxis = keyboard_check(vk_right) - keyboard_check(vk_left); //Left and Right Movement
yAxis = keyboard_check(vk_down) - keyboard_check(vk_up); //Up and Down Movement

var _direction = point_direction(0, 0, xAxis, yAxis);

var _length = Speed * (xAxis !=0 || yAxis != 0);

xAxis = lengthdir_x(_length,_direction);
yAxis = lengthdir_y(_length,_direction);

if(place_meeting(x+xAxis, y, obj_collision))
{
	while(!place_meeting(x+sign(xAxis), y, obj_collision))
	{
		x+= sign(xAxis);
	}
	xAxis = 0;
}
x+=xAxis;
if(place_meeting(x, y+yAxis, obj_collision))
{
	while(!place_meeting(x, y+sign(yAxis), obj_collision))
	{
		y+= sign(yAxis);
	}
	xAxis = 0;
	yAxis = 0;
}
y+=yAxis;